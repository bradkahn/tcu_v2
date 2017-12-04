#!/usr/bin/python3

# tcu_project.py
# project to communicate with the RHINO-TCU using the HARPOON framework
# 04/12/2017
# Brad Kahn

# ----------------------------------------------------------------------------
# EXIT CODES:
# 0 : all good, tcu is armed and waiting
# 1 : headerfile not found
# 2 : expected parameter missing from headerfile
# ----------------------------------------------------------------------------

import sys  # exit codes
from time import localtime, strftime
import logging

import harpoon
from harpoon.boardsupport import borph


# TODO: find out where header file will live on node laptop
HEADER_PATH = "/home/brad/tcu_v2/"  # <-- this needs to change
HEADER_NAME = "NeXtRAD_Header.txt"
RHINO_ADDRESS = '192.168.0.2'

num_transfers = int()   # used to calculate M
num_pulses = int()      # N
num_repeats = int()     # M
pulses = list()         # [{pulse1}, {pulse2}, {pulse3}]

# pulse dictionary format -> {"pulse_number": xxx, "mb_offset":xxx, "dig_offset":xxx, "pri_offset":xxx, "frequency": xxx, 'tx_pol': xxx, 'rx_pol': xxx} # noqa

# -----------------------------------------------------------------------------
# Logging stuff
# -----------------------------------------------------------------------------

logger = logging.getLogger('tcu_project_logger')
logger.setLevel(logging.DEBUG)
# create file handler which logs even debug messages
time_struct = localtime()
time = strftime("%H:%M:%S", time_struct)
date = strftime("%d-%m-%Y", time_struct)
fh = logging.FileHandler('tcu_experiment_' + date + '_' + time + '.log')
fh.setLevel(logging.DEBUG)
# create console handler with a higher log level
ch = logging.StreamHandler()
ch.setLevel(logging.DEBUG)
# create formatter and add it to the handlers
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
formatter2 = logging.Formatter('[%(levelname)s] %(message)s')
ch.setFormatter(formatter2)
fh.setFormatter(formatter)
# add the handlers to logger
logging.getLogger().addHandler(fh)
logging.getLogger().addHandler(ch)

def print_logo():
    print(harpoon.LOGO)


def print_welcome():
    print_logo()
    print("")
    print("NeXtRAD TCU v2.0")
    print("")


def parse_header():
    # tcu_init.py
    # startup script for TCU
    # Brad Kahn
    # 01/12/2017

    # -------------------------------------------------------------------------
    # EXTRACT PARAMETERS FROM HEADER FILE
    # -------------------------------------------------------------------------

    try:
        header_file = open(HEADER_PATH + HEADER_NAME, 'r')
    except Exception as e:
        logger.error('could not find file "{}" in path: {}'.format(HEADER_NAME, HEADER_PATH))
        raise FileNotFoundError
        sys.exit(1)

    header_lines = header_file.readlines()

    global num_transfers
    global num_pulses
    global num_repeats
    global pulses

    pulse_num = 0

    next_pulse_index = 0

    for line in header_lines:
        if line.find('NUM_TRANSFERS') > -1:
            logger.debug("num-transfers found:" + line[:-1])
            val = line.split()
            num_transfers = eval(val[2][:-1])
        elif line.find('NumberOfPulses') > -1:
            logger.debug("number of pulses found:" + line[:-1])
            val = line.split()
            num_pulses = eval(val[2][:-1])
        elif line.find('[pulse') > -1:
            logger.debug("pulse header found:" + line[:-1])
            line_list = line.split()
            val = line_list[0]
            val = val.replace('[pulse', '')
            val = val.replace(']', '')
            pulse_num = eval(val)
            logger.debug("pulse number is: " + str(val))
            pulses.append(dict())
            pulses[next_pulse_index]['pulse_number'] = pulse_num
            next_pulse_index += 1
        if next_pulse_index > 0:
            if line.find('MBoffset') > -1:
                val = line.split()
                logger.debug('MBoffset for [pulse{}] is {}'.format(pulse_num, val[2]))
                pulses[next_pulse_index-1]['mb_offset'] = eval(val[2][:-1])
            elif line.find('DIGoffset') > -1:
                val = line.split()
                logger.debug('DIGoffset for [pulse{}] is {}'.format(pulse_num, val[2]))
                pulses[next_pulse_index-1]['dig_offset'] = eval(val[2][:-1])
            elif line.find('PRIoffset') > -1:
                val = line.split()
                logger.debug('PRIoffset for [pulse{}] is {}'.format(pulse_num, val[2]))
                pulses[next_pulse_index-1]['pri_offset'] = eval(val[2][:-1])
            elif line.find('Frequency') > -1:
                val = line.split()
                logger.debug('Frequency for [pulse{}] is {}'.format(pulse_num, val[2]))
                pulses[next_pulse_index-1]['frequency'] = eval(val[2][:-1])
            elif line.find('TxPol') > -1:
                val = line.split()
                logger.debug('TxPol for [pulse{}] is {}'.format(pulse_num, val[2]))
                pulses[next_pulse_index-1]['tx_pol'] = val[2][:-1]
            elif line.find('RxPol') > -1:
                val = line.split()
                logger.debug('RxPol for [pulse{}] is {}'.format(pulse_num, val[2]))
                pulses[next_pulse_index-1]['rx_pol'] = val[2][:-1]
        else:
            pass

        # calculate the number of pulses if 'NumberOfPulses' is not in header
        if num_pulses == 0:
            num_pulses = len(pulses)

        logging.info('{} unique pulses found'.format(num_pulses))

    # -------------------------------------------------------------------------
    # VERIFY PARAMETERS
    # -------------------------------------------------------------------------

    if pulse_num == 0:
        logger.error('no [pulseX] where found in header')
        raise Exception('no [pulseX] where found in header')
        sys.exit(2)
    if num_transfers == 0:
        logger.error('no NUM_TRANSFERS found in header, needed for "m"')
        raise Exception('no NUM_TRANSFERS found in header, needed for "m"')
        sys.exit(2)
    for pulse in pulses:
        # simple check if the number of parameters matches the expected length,
        # len(["pulse_number","mb_offset","dig_offset","pri_offset","frequency","tx_pol","rx_pol"])
        # could take this further and check for each parameter individually
        if len(pulse) != 7:
            logger.error('missing pulse parameter(s) for pulse ' +
                         str(pulse['pulse_number']))
            raise Exception('missing pulse parameter(s) for pulse ' +
                            str(pulse['pulse_number']))
            sys.exit(2)

    num_pulses = pulse_num
    logger.debug('number of pulses found (n) = ' + str(num_pulses))
    # division operators: '/' for float, '//' integer
    num_repeats = num_transfers // num_pulses
    logger.debug('calculated number of repeats m = ' + str(num_repeats) +
                 ' [m = NUM_TRANSFERS / n]')

    logging.info('header parsing complete')


# -----------------------------------------------------------------------------
# core instantiation
# -----------------------------------------------------------------------------

core_tcu = harpoon.IPCore('tcu_core', 'Timing control unit')

# -----------------------------------------------------------------------------
# registers for core_tcu instantiation
# -----------------------------------------------------------------------------

harpoon.Register('version', 'version number of this iteration of tcu gateware',
                 2, 1, core_tcu)
harpoon.Register('status',
                 'status flags:\n'
                 'bit 0: pulse repeats for experiment completed\n'
                 'bit 3: digitisation flag\n'
                 'bit 4: pri flag, bit 5: pulse completed\n'
                 'bit 6: \'1\'\n'
                 'bit 7: gpioIN(1) trigger from GPSDO',
                 2, 1, core_tcu)
harpoon.Register('control', 'reg-description',
                 2, 3, core_tcu)
harpoon.Register('fmc', 'reg-description',
                 4, 3, core_tcu)
harpoon.Register('pulses', 'reg-description',
                 180, 3, core_tcu)
harpoon.Register('m', 'Number of repeats for each pulse in an experiment',
                 4, 3, core_tcu)
harpoon.Register('n', 'Number of pulses',
                 2, 3, core_tcu)
# -----------------------------------------------------------------------------
# Project instantiation
# -----------------------------------------------------------------------------
project = harpoon.Project('tcu_project',
                          'project to communicate with the RHINO-TCU',
                          [core_tcu])

if __name__ == '__main__':
    print_welcome()

    logger.info('parsing header file: ' + HEADER_PATH + HEADER_NAME)
    parse_header()

    logger.debug('initializing rhino connection, IP address: ' + RHINO_ADDRESS)
    fpga_con = borph.RHINO(address=RHINO_ADDRESS,
                           username='root',
                           password='rhino',
                           login_timeout=30)
    logger.debug('attempting to connect...')
    logger.info('attempting to connect...')
    # try:
    #     fpga_con.connect()
    # except Exception as e:
    #     raise('failed to connect to rhino')
    #     sys.exit(3)

    # -------------------------------------------------------------------------
    # SEND PARAMETERS TO TCU
    # -------------------------------------------------------------------------
    # core_tcu.write_reg('pulses', pulses)
    # core_tcu.write_reg('m', num_repeats)
    # core_tcu.write_reg('n', num_pulses)

    # -------------------------------------------------------------------------
    # verify registers have correct values
    # -------------------------------------------------------------------------

    # -------------------------------------------------------------------------
    # arm the TCU
    # -------------------------------------------------------------------------

    # TODO: PROVIDE A RETURN CODE
    sys.exit(0)
