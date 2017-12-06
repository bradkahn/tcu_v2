#!/usr/bin/python3

# tcu_project.py
# project to communicate with the RHINO-TCU using the HARPOON framework
# 04/12/2017
# Brad Kahn


# ----------------------------------------------------------------------------
# EXPECTED HEADER FILE FORMAT
# ----------------------------------------------------------------------------
#   NumberOfPulses = 5;
#   NUM_TRANSFERS = 10000;
#
#   % Pulse 0 parameters
#   [pulse0]
#   % offsets are in us
#   MBoffset  = 50000;
#   DIGoffset = 60000;
#   PRIoffset = 70000;
#   % in mHz
#   Frequency = 1300;
#   % Either (V)ertical or (H)orizontal	and band
#   Mode = 0;
#
#   % Pulse 1 parameters
#   [pulse1]
#   MBoffset  = 50000;
#   DIGoffset = 60000;
#   PRIoffset = 70000;
#   Frequency = 1300;
#   Mode = 1;
#
#   ... up to [pulse31]

# ----------------------------------------------------------------------------
# EXIT CODES:
# 0     : all good, tcu is armed and waiting
# 64    : headerfile not found
# 65    : expected parameter missing from headerfile
# 66    : failed to connect to rhino
# 67    : read registers don't match expected
# user codes: '0', '64 - 113' http://www.tldp.org/LDP/abs/html/exitcodes.html
# ----------------------------------------------------------------------------

import sys
import time
import logging

import harpoon
from harpoon.boardsupport import borph


# TODO: find out where header file will live on node laptop
# TODO: pass command line args for these values! (have default values)
HEADER_PATH = "/home/brad/tcu_v2/"  # <-- this needs to change
HEADER_NAME = "NeXtRAD_Header2.txt"
TCU_ADDRESS = '192.168.1.16'
NUM_PULSE_PARAMS = 6                # see pulse dictionary format
BOF_EXE = 'TCU_1.bof'               # .bof must already be in /opt/rhinofs/

num_transfers = int()               # used to calculate M
num_pulses = int()                  # N
num_repeats = int()                 # M
pulses = list()                     # [{pulse1}, {pulse2}, {pulse3}]

# pulse dictionary format, 7 parameters per pulse:
# {"pulse_number": xxx, "mb_offset":xxx, "dig_offset":xxx, "pri_offset":xxx,
# "frequency": xxx, 'mode':x}

# -----------------------------------------------------------------------------
# Logging stuff
# -----------------------------------------------------------------------------

logger = logging.getLogger('tcu_project_logger')
logger.setLevel(logging.DEBUG)
# create file handler which logs even debug messages
time_struct = time.localtime()
time_str = time.strftime("%H:%M:%S", time_struct)
date_str = time.strftime("%d-%m-%Y", time_struct)
fh = logging.FileHandler('tcu_experiment_' + date_str + '_' + time_str + '.log')
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

    # NOTE: all params need end with a semicolon

    try:
        header_file = open(HEADER_PATH + HEADER_NAME, 'r')
    except Exception as e:
        logger.error('could not find file "{}" in path: {}'.format(HEADER_NAME, HEADER_PATH))
        sys.exit(64)

    header_lines = header_file.readlines()
    header_file.close()

    global num_transfers
    global num_pulses
    global num_repeats
    global pulses

    pulse_num = 0

    next_pulse_index = 0

    for line in header_lines:
        line = line.strip()
        if line.startswith('NUM_TRANSFERS'):
            logger.debug("num-transfers found:" + line[:-1])
            val = line.split()
            num_transfers = eval(val[2][:-1])
        elif line.startswith('NumberOfPulses'):
            logger.debug("number of pulses found:" + line[:-1])
            val = line.split()
            num_pulses = eval(val[2][:-1])
        elif line.startswith('[pulse'):
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
            if line.startswith('MBoffset'):
                val = line.split()
                logger.debug('MBoffset for [pulse{}] is {}'.format(pulse_num, val[2]))
                pulses[next_pulse_index-1]['mb_offset'] = eval(val[2][:-1])
            elif line.startswith('DIGoffset'):
                val = line.split()
                logger.debug('DIGoffset for [pulse{}] is {}'.format(pulse_num, val[2]))
                pulses[next_pulse_index-1]['dig_offset'] = eval(val[2][:-1])
            elif line.startswith('PRIoffset'):
                val = line.split()
                logger.debug('PRIoffset for [pulse{}] is {}'.format(pulse_num, val[2]))
                pulses[next_pulse_index-1]['pri_offset'] = eval(val[2][:-1])
            elif line.startswith('Frequency'):
                val = line.split()
                logger.debug('Frequency for [pulse{}] is {}'.format(pulse_num, val[2]))
                pulses[next_pulse_index-1]['frequency'] = eval(val[2][:-1])
            elif line.startswith('Mode'):
                val = line.split()
                logger.debug('Mode for [pulse{}] is {}'.format(pulse_num, val[2]))
                pulses[next_pulse_index-1]['mode'] = eval(val[2][:-1])
            # elif line.startswith('TxPol'):
            #     val = line.split()
            #     logger.debug('TxPol for [pulse{}] is {}'.format(pulse_num, val[2]))
            #     pulses[next_pulse_index-1]['tx_pol'] = val[2][:-1]
            # elif line.startswith('RxPol'):
            #     val = line.split()
            #     logger.debug('RxPol for [pulse{}] is {}'.format(pulse_num, val[2]))
            #     pulses[next_pulse_index-1]['rx_pol'] = val[2][:-1]
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
        sys.exit(65)
    if num_transfers == 0:
        logger.error('no NUM_TRANSFERS found in header, needed for "m"')
        sys.exit(65)
    for pulse in pulses:
        # simple check if the number of parameters matches the expected length,
        # len(["pulse_number","mb_offset","dig_offset","pri_offset","frequency","tx_pol","rx_pol"])
        # could take this further and check for each parameter individually
        if len(pulse) != NUM_PULSE_PARAMS:
            logger.error('missing pulse parameter(s) for pulse ' +
                         str(pulse['pulse_number']))
            sys.exit(65)

    num_pulses = pulse_num
    logger.debug('number of pulses found (n) = ' + str(num_pulses))
    # division operators: '/' for float, '//' integer
    num_repeats = num_transfers // num_pulses
    logger.debug('calculated number of repeats m = ' + str(num_repeats) +
                 ' [m = NUM_TRANSFERS / n]')

    logging.info('header parsing complete')


def int_to_hex_str(num, endian='l'):
    """ returns a hexidecimal string in format given an integer
        endianess:
            default is LITTLE endian
            for big endian, pass char 'b' as an argument
    """
    hex_num = hex(num)
    hex_num = hex_num.replace('0x', '')
    num_zeros_to_pad = 0
    if len(hex_num) % 4 != 0:
        num_zeros_to_pad = 4 - len(hex_num) % 4
    hex_num = '0'*num_zeros_to_pad + hex_num
    num_bytes = len(hex_num)//2
    num_words = num_bytes//2
    byte_list = list()
    index = 0
    for count in range(num_words):
        byte_upper = hex_num[index: (index)+2]
        byte_lower = hex_num[index+2: (index)+4]
        if endian == 'b':
            byte_list.append([byte_upper, byte_lower])
        else:
            byte_list.append([byte_lower, byte_upper])
        index += 4
    # rev_byte_list = reversed(byte_list)
    hex_str = str()
    # for word in rev_byte_list:
    for word in byte_list:
        hex_str += '\\x' + word[0] + '\\x' + word[1]
    return hex_str


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

    # -------------------------------------------------------------------------
    # CONNECT TO RHINO
    # -------------------------------------------------------------------------
    logger.debug('initializing rhino connection, IP address: ' + TCU_ADDRESS)
    fpga_con = borph.RHINO(address=TCU_ADDRESS,
                           username='root',
                           password='rhino',
                           login_timeout=30)
    logger.debug('attempting to connect...')
    logger.info('attempting to connect...')
    try:
        fpga_con.connect()
    except Exception as e:
        logger.error('failed to connect to rhino')
        sys.exit(66)

    logger.debug('connection successful!')

    # -------------------------------------------------------------------------
    # CONFIGURE RHINO WITH TCU PROJECT
    # -------------------------------------------------------------------------
    # TODO: this assumes that there is no other .bof running on the RHINO
    #       scan for any .bof running on
    if fpga_con._pid == '':
        # check for any prexisting running .bof
        logger.debug('checking for any prexisting running .bof executables')
        existing_bof_proc = fpga_con._action("ps -o pid,args | grep [.]bof | while read c1 c2; do echo $c1; done")
        existing_bof_proc = (existing_bof_proc.decode('utf8').split("\r\n"))[1]

        if existing_bof_proc != '':
            logger.warning('existing .bof was found running on the RHINO...')
            logger.warning('assuming it is a the same TCU project...')
            fpga_con._pid = existing_bof_proc
        else:
            logger.debug('no existing running .bof found, launching TCU.bof')
            fpga_con.launch_bof(BOF_EXE)

    # -------------------------------------------------------------------------
    # SEND PARAMETERS TO TCU
    # -------------------------------------------------------------------------
    # TODO: implement framework functionality:
    #       core_tcu.write_reg('pulses', pulses)
    #       core_tcu.write_reg('m', num_repeats)
    #       core_tcu.write_reg('n', num_pulses)

    # stitch together all the pulse parameters into one long string
    # pulses = list()                     # [{pulse1}, {pulse2}, {pulse3}]
    # {"pulse_number": xxx, "mb_offset":xxx, "dig_offset":xxx, "pri_offset":xxx,
    # "frequency": xxx, 'tx_pol': xxx, 'rx_pol': xxx}

    pulse_param_str = str()
    # TODO: better way to check PRIoffset size
    for pulse in pulses:
        pulse_param_str += int_to_hex_str(pulse['mb_offset'])
        pulse_param_str += int_to_hex_str(pulse['dig_offset'])
        if len(int_to_hex_str(pulse['pri_offset'])) > 8:
            pulse_param_str += int_to_hex_str(pulse['pri_offset'])[0:8]
        else:
            pulse_param_str += '\\x00\\x00'
        pulse_param_str += int_to_hex_str(pulse['frequency'], 'b')  # big endian
        pulse_param_str += int_to_hex_str(pulse['mode']) # pulse_param_str += '\\x01\\x00'  # just for testing...
        if len(int_to_hex_str(pulse['pri_offset'])) > 8:
            pulse_param_str += int_to_hex_str(pulse['pri_offset'])[8:]
        else:
            pulse_param_str += int_to_hex_str(pulse['pri_offset'])[0:8]

    logger.debug('PULSE STRING:')
    logger.debug('echo -en \'{}\' | cat > /proc/{}/hw/ioreg/{}'.format(pulse_param_str, fpga_con._pid, 'reg_pulses'))
    fpga_con._action('echo -en \'{}\' | cat > /proc/{}/hw/ioreg/{}'.format(pulse_param_str, fpga_con._pid, 'reg_pulses'))

    num_repeats_str = int_to_hex_str(num_repeats)
    logger.debug('echo -en \'{}\' | cat > /proc/{}/hw/ioreg/{}'.format(num_repeats_str, fpga_con._pid, 'm'))
    fpga_con._action('echo -en \'{}\' | cat > /proc/{}/hw/ioreg/{}'.format(num_repeats_str, fpga_con._pid, 'm'))

    num_pulses_str = int_to_hex_str(num_pulses)
    logger.debug('echo -en \'{}\' | cat > /proc/{}/hw/ioreg/{}'.format(num_pulses_str, fpga_con._pid, 'n'))
    fpga_con._action('echo -en \'{}\' | cat > /proc/{}/hw/ioreg/{}'.format(num_pulses_str, fpga_con._pid, 'n'))

    # -------------------------------------------------------------------------
    # verify registers have correct values
    # -------------------------------------------------------------------------
    logger.debug('verifying tcu registers')

    logger.debug('reading reg_pulses...')
    reg_pulses_rcv = fpga_con._action('od -x -An /proc/{}/hw/ioreg/{}'.format(fpga_con._pid, 'reg_pulses'))
    logger.debug('reg_pulses:' + reg_pulses_rcv.decode('utf-8'))

    # *************************************************************************
    array = reg_pulses_rcv.decode('utf-8').split("\r\n")
    array = array[1:-2:]  # extract only the data
    for i in range(len(array)):
        array[i] = array[i].lstrip()

    # "splitting up pulses info into 16bit chunks...:")
    read_data_array = list()
    for i in range(len(array)):
        line_in_array = array[i].split(" ")
        for word in line_in_array:
            read_data_array.append(word)

    num_of_words = len(read_data_array)
    number_of_valid_pulses = num_of_words // 6

    logger.debug('{}\t{}\t{}\t{}\t{}\t\t{}'.format("Pulse #", "MB", "DO", "FREQ", "PRI", "MODE"))
    for pulse_number in range(num_pulses):

        mb = read_data_array[((pulse_number*6)+0)]
        mb = eval("0x"+ mb)
        # mb = mb*10
       # print ("MB\t"+str(mb))
        # table.add_row(["main bang",str(mb*10) + " ns"])

        do = read_data_array[((pulse_number*6)+1)]
        do = eval("0x"+ do)
        # do = do*10
       # print ("DO\t"+str(do))
        # table.add_row(["digital offset",str(do*10) + " ns"])


        freq = read_data_array[((pulse_number*6)+3)]
        freq = freq[2:4] + freq[0:2]
        freq = eval("0x"+freq)
       # print ("Freq\t"+str(freq))
        # table.add_row(["frequency",str(freq) + " MHz"])

        pri_upper = read_data_array[((pulse_number*6)+2)]
        pri_lower = read_data_array[((pulse_number*6)+5)]
        pri = eval("0x"+pri_upper+pri_lower)
       # print ("PRI\t"+str(pri))
        #pri = (pri - mb - do)*10 ??????/
        pri = pri * 10;
        # table.add_row(["PRI",str(pri)+ " ns"])

        mode = read_data_array[((pulse_number*6)+4)]
        mode = eval("0x"+ mode)
        #  print ("Mode\t"+str(mode))
        # table.add_row(["mode",str(mode)])

        logger.debug('{}\t{}\t{}\t{}\t{}\t\t{}'.format(str(pulse_number+1), str(mb), str(do), str(freq), str(pri), str(mode)))
        # table.add_row([str(pulse_number+1), str(mb), str(do), str(freq), str(pri), str(mode)])
    # *************************************************************************

    logger.debug('reading n...')
    reg_pulses_rcv = fpga_con._action('od -x -An /proc/{}/hw/ioreg/{}'.format(fpga_con._pid, 'n'))
    logger.debug('n:' + reg_pulses_rcv.decode('utf-8'))

    logger.debug('reading m...')
    reg_pulses_rcv = fpga_con._action('od -x -An /proc/{}/hw/ioreg/{}'.format(fpga_con._pid, 'm'))
    logger.debug('m:' + reg_pulses_rcv.decode('utf-8'))


    # if regs dont match:
    # sys.exit(67)

    # -------------------------------------------------------------------------
    # arm the TCU
    # -------------------------------------------------------------------------
    logger.debug('arming the TCU')
    fpga_con._action('echo -en \'{}\' | cat > /proc/{}/hw/ioreg/{}'.format(int_to_hex_str(0), fpga_con._pid, 'reg_led'))
    fpga_con._action('echo -en \'{}\' | cat > /proc/{}/hw/ioreg/{}'.format(int_to_hex_str(1), fpga_con._pid, 'reg_led'))
    logger.debug('TCU armed')

    fpga_con.disconnect()
    logger.debug('ssh connection closed')

    sys.exit(0)
