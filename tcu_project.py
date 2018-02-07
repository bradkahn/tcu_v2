#!/usr/bin/python3

# tcu_project.py
# project to communicate with the RHINO-TCU using the HARPOON framework
# 04/12/2017
# Brad Kahn

# ----------------------------------------------------------------------------
# EXIT CODES:
# 0     : all good, tcu is armed and waiting
# 64    : headerfile not found
# 65    : expected parameter missing from headerfile
# 66    : failed to connect to rhino
# 67    : read registers don't match expected
# user codes: '0', '64 - 113' http://www.tldp.org/LDP/abs/html/exitcodes.html
# ----------------------------------------------------------------------------

import argparse
import getpass
import os.path
import sys
import time
import configparser
import logging

import harpoon
from harpoon.boardsupport import borph

num_transfers = int()               # used to calculate M
num_pulses = int()                  # N
num_repeats = int()                 # M
pulses = list()                     # [{pulse1}, {pulse2}, {pulse3}]

# pulse dictionary format, 6 parameters per pulse:
# {"pulse_number": xxx, "mb_offset":xxx, "dig_offset":xxx, "pri_offset":xxx,
# "frequency": xxx, 'mode':x}


logger = logging.getLogger('tcu_project_logger')
def init_logger():
    logger.setLevel(logging.DEBUG)
    # create file handler which logs even debug messages
    time_struct = time.localtime()
    time_str = time.strftime("%H:%M:%S", time_struct)
    date_str = time.strftime("%d-%m-%Y", time_struct)
    fh = logging.FileHandler('tcu_experiment_' + date_str + '_' + time_str + '.log')
    fh.setLevel(logging.DEBUG)
    # create console handler with a higher log level
    ch = logging.StreamHandler()
    ch.setLevel(logging.INFO)
    # create formatter and add it to the handlers
    formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
    formatter2 = logging.Formatter('[%(levelname)s] %(message)s')
    ch.setFormatter(formatter2)
    fh.setFormatter(formatter)
    # add the handlers to logger
    logging.getLogger().addHandler(fh)
    logging.getLogger().addHandler(ch)


def parse_header():
    global num_pulses
    global num_repeats
    global pulses

    # check if headerfile exists
    if not os.path.isfile(HEADER_FILE):
        logger.error('could not find header file "{}" in path: {}'
                     .format(HEADER_NAME, HEADER_PATH))
        sys.exit(64)

    header_file = configparser.ConfigParser()
    header_file.read(HEADER_FILE)

    try:
        pulse_parameters = header_file['PulseParameters']
    except Exception as e:
        logger.error('could not find {} section in header'
                     .format('PulseParameters'))

    #   LFM              NLFM
    #   0.5us   = 1      0.5us   = 8
    #   1.0us   = 2      1.0us   = 9
    #   3.0us   = 3      3.0us   = 10
    #   5.0us   = 4      5.0us   = 11
    #   10.0us  = 5      10.0us  = 12
    #   15.0us  = 6      15.0us  = 13
    #   20.0us  = 7      20.0us  = 14

    PULSE_WIDTHS = [0, 0.5, 1.0, 3.0, 5.0, 10.0, 15.0, 20.0,
                    0.5, 1.0, 3.0, 5.0, 10.0, 15.0, 20.0]

    try:
        waveform_index = pulse_parameters['waveform_index']
        pulse_width = (int(PULSE_WIDTHS[eval(waveform_index)]*1000))  # ns
        logger.debug('waveform_index = {} --> pulse_width = {} ({}us)'
                     .format(waveform_index, pulse_width, pulse_width/1000))
    except Exception as e:
        logger.error("could not find required parameter '{}' from header"
                     .format('waveform_index'))
        exit(65)

    try:
        polarisation_order = (pulse_parameters['pol_order']).replace('"', '')
        polarisation_order = polarisation_order.split(',')
        num_pulses = len(polarisation_order)
        logger.debug('polarisation_order = {} --> num_pulses = {}'
                     .format(polarisation_order, num_pulses))
    except Exception as e:
        logger.error("could not find required parameter '{}' from header"
                     .format('pol_order'))
        exit(65)

    try:
        num_pris = eval(pulse_parameters['num_pris'])
        num_repeats = num_pris  # change of terminology
        logger.debug('num_pris (num_repeats) = {}'.format(num_pris))

    except Exception as e:
        logger.error("could not find required parameter '{}' from header"
                     .format('num_pris'))
        exit(65)

    try:
        pre_pulse = eval(pulse_parameters['pre_pulse'])
        logger.debug('pre_pulse = {}'.format(pre_pulse))
    except Exception as e:
        logger.error("could not find required parameter '{}' from header"
                     .format('pre_pulse'))
        exit(65)

    try:
        pri = eval(pulse_parameters['pri'])
        logger.debug('pri = {}'.format(pri))
    except Exception as e:
        logger.error("could not find required parameter '{}' from header"
                     .format('pri'))
        exit(65)

    # NOTE: this will change to allow for different frequencies in each band
    try:
        l_band_waveform_freq = eval(pulse_parameters['l_band_waveform_freq'])
        logger.debug('l_band_waveform_freq = {}'.format(l_band_waveform_freq))
    except Exception as e:
        logger.error("could not find required parameter '{}' from header"
                     .format('l_band_waveform_freq'))
        exit(65)

    try:
        x_band_waveform_freq = eval(pulse_parameters['x_band_waveform_freq'])
        logger.debug('x_band_waveform_freq = {}'.format(x_band_waveform_freq))
    except Exception as e:
        logger.error("could not find required parameter '{}' from header"
                     .format('x_band_waveform_freq'))
        exit(65)

    # -------------------------------------------------------------------------
    # CALCULATING REGISTER VALUES
    # -------------------------------------------------------------------------

    logger.debug('calculating register values...')

    for index, polarity in enumerate(polarisation_order):

        if polarity in ['0', '1', '2', '3']:
            frequency = l_band_waveform_freq
            amp_delay = 1300  # 1.3us
        else:
            frequency = x_band_waveform_freq
            amp_delay = 3510  # 3.51us

        mb_offset = (pre_pulse*1000)//10
        do_offset = ((pulse_width) - amp_delay)//10
        pri_offset = ((pri*1000)//10) - mb_offset - do_offset

        pulse = {"pulse_number": index, "mb_offset": mb_offset,
                 "dig_offset": do_offset, "pri_offset": pri_offset,
                 "frequency": frequency, "mode": eval(polarity)}

        logger.debug('PULSE {}: mb_offset = {}, dig_offset = {},'
                     ' pri_offset = {}, frequency = {}, mode = {}'
                     .format(index, mb_offset, do_offset, pri_offset,
                             frequency, eval(polarity)))
        pulses.append(pulse)

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
    # for word in reversed(byte_list):
    for word in byte_list:
        hex_str += '\\x' + word[0] + '\\x' + word[1]
    return hex_str


def connect():
    logger.debug('initializing rhino connection, IP address: ' + TCU_ADDRESS)
    global fpga_con
    fpga_con = borph.RHINO(address=TCU_ADDRESS,
                           username='root',
                           password='rhino',
                           login_timeout=30)
    logger.debug('attempting to connect...')
    try:
        fpga_con.connect()
    except Exception as e:
        logger.error('failed to connect to rhino')
        sys.exit(66)

    logger.debug('connection successful!')


def launch_bof():
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


def write_registers():
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
        pulse_param_str += int_to_hex_str(pulse['mode'])
        if len(int_to_hex_str(pulse['pri_offset'])) > 8:
            pulse_param_str += int_to_hex_str(pulse['pri_offset'])[8:]
        else:
            pulse_param_str += int_to_hex_str(pulse['pri_offset'])[0:8]

    logger.debug('PULSE STRING:')
    logger.debug('echo -en \'{}\' | cat > /proc/{}/hw/ioreg/{}'.format(pulse_param_str, fpga_con._pid, 'reg_pulses'))
    fpga_con._action('echo -en \'{}\' | cat > /proc/{}/hw/ioreg/{}'.format(pulse_param_str, fpga_con._pid, 'reg_pulses'))

    num_repeats_str = str()
    if len(int_to_hex_str(num_repeats)) > 8:
        num_repeats_str = int_to_hex_str(num_repeats)[8:] + int_to_hex_str(num_repeats)[0:8]
    else:
        num_repeats_str = int_to_hex_str(num_repeats)[0:8] + '\\x00\\x00'
    logger.debug('echo -en \'{}\' | cat > /proc/{}/hw/ioreg/{}'.format(num_repeats_str, fpga_con._pid, 'm'))
    fpga_con._action('echo -en \'{}\' | cat > /proc/{}/hw/ioreg/{}'.format(num_repeats_str, fpga_con._pid, 'm'))

    num_pulses_str = int_to_hex_str(num_pulses)
    logger.debug('echo -en \'{}\' | cat > /proc/{}/hw/ioreg/{}'.format(num_pulses_str, fpga_con._pid, 'n'))
    fpga_con._action('echo -en \'{}\' | cat > /proc/{}/hw/ioreg/{}'.format(num_pulses_str, fpga_con._pid, 'n'))


def verify_registers():
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

    logger.debug('{}\t\t{}\t{}\t{}\t{}\t{}\t{}'.format("Pulse #", "MBoff (ns)", "DOoff (ns)", "FREQ (Hz)", "PRIoff (ns)", "MODE", "PRF (Hz)"))
    logger.debug('{}\t\t{}\t{}\t{}\t{}\t{}\t{}'.format("-------", "----------", "----------", "---------", "-----------", "----", "--------"))
    for pulse_number in range(num_pulses):

        mb = read_data_array[((pulse_number*6)+0)]
        mb = eval("0x"+mb)*10
        # mb = mb*10
        # print ("MB\t"+str(mb))
        # table.add_row(["main bang",str(mb*10) + " ns"])

        do = read_data_array[((pulse_number*6)+1)]
        do = eval("0x"+do)*10
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
        pri = eval("0x"+pri_upper+pri_lower)*10
        # print ("PRI\t"+str(pri))
        # pri = (pri - mb - do)*10 ??????/
        # pri = pri * 10;
        # table.add_row(["PRI",str(pri)+ " ns"])

        mode = read_data_array[((pulse_number*6)+4)]
        mode = eval("0x"+mode)
        #  print ("Mode\t"+str(mode))
        # table.add_row(["mode",str(mode)])

        prf_calc = 1/(((mb + do + pri))/1000000000)

        logger.debug('{}\t\t\t{}\t\t{}\t\t{}\t\t{}\t\t{}\t{}'.format(str(pulse_number+1), str(mb), str(do), str(freq), str(pri), str(mode), str(prf_calc)))
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


def arm_tcu():
    fpga_con._action('echo -en \'{}\' | cat > /proc/{}/hw/ioreg/{}'.format(int_to_hex_str(0), fpga_con._pid, 'reg_led'))
    fpga_con._action('echo -en \'{}\' | cat > /proc/{}/hw/ioreg/{}'.format(int_to_hex_str(1), fpga_con._pid, 'reg_led'))
    logger.debug('TCU armed')

# TODO: incorporate this:
# -----------------------------------------------------------------------------
# CORE INSTANTIATION
# -----------------------------------------------------------------------------
# core_tcu = harpoon.IPCore('tcu_core', 'Timing control unit')

# -----------------------------------------------------------------------------
# REGISTERS FOR CORE_TCU INSTANTIATION
# -----------------------------------------------------------------------------
# harpoon.Register('version', 'version number of this iteration of tcu gateware',
#                  2, 1, core_tcu)
# harpoon.Register('status',
#                  'status flags:\n'
#                  'bit 0: pulse repeats for experiment completed\n'
#                  'bit 3: digitisation flag\n'
#                  'bit 4: pri flag, bit 5: pulse completed\n'
#                  'bit 6: \'1\'\n'
#                  'bit 7: gpioIN(1) trigger from GPSDO',
#                  2, 1, core_tcu)
# harpoon.Register('control', 'reg-description',
#                  2, 3, core_tcu)
# harpoon.Register('fmc', 'reg-description',
#                  4, 3, core_tcu)
# harpoon.Register('pulses', 'reg-description',
#                  180, 3, core_tcu)
# harpoon.Register('m', 'Number of repeats for each pulse in an experiment',
#                  4, 3, core_tcu)
# harpoon.Register('n', 'Number of pulses',
#                  2, 3, core_tcu)

# -----------------------------------------------------------------------------
# Project instantiation
# -----------------------------------------------------------------------------
# project = harpoon.Project('tcu_project',
#                           'project to communicate with the RHINO-TCU',
#                           [core_tcu])


if __name__ == '__main__':

    # -------------------------------------------------------------------------
    # PARSE COMMAND LINE ARGUMENTS
    # -------------------------------------------------------------------------
    parser = argparse.ArgumentParser(usage='tcu_project [address]',
                                     description='Startup script for the '
                                                 'NeXtRAD Timing Control Unit')
    parser.add_argument('address', help='IP address of TCU')
    parser.add_argument('file', help="header file")
    parser.add_argument('-b', '--bof', help='name of .bof file to be executed'
                        'on RHINO [\'tcu_v2.bof\']', default='tcu_v2.bof')
    parser.add_argument('-t', '--timeout', help='login timeout (seconds) to'
                        'establish SSH connection to RHINO [30]',
                        type=int, default=30)
    parser.add_argument('-l', '--logdir', help='directory to store log file default [\'/tmp\']', default='/tmp')
    args = parser.parse_args()

    init_logger()

    logger.debug(harpoon.LOGO)
    logger.debug("command line args: {}".format(args))

    HEADER_FILE = args.file
    TCU_ADDRESS = args.address
    BOF_EXE = args.bof  # NOTE: assumes .bof must already be in /opt/rhinofs/

    logger.info('initializing TCU at IP [{}] with header file at [{}],'
                'this should take a moment...'
                .format(TCU_ADDRESS, HEADER_FILE))

    # -------------------------------------------------------------------------
    # EXTRACT PARAMETERS FROM HEADER FILE
    # -------------------------------------------------------------------------
    logger.debug('parsing header file: ' + HEADER_FILE)
    parse_header()

    # -------------------------------------------------------------------------
    # CONNECT TO RHINO
    # -------------------------------------------------------------------------
    logger.debug('connecting to TCU...')
    connect()

    # -------------------------------------------------------------------------
    # CONFIGURE RHINO WITH TCU PROJECT
    # -------------------------------------------------------------------------
    logger.debug('launching TCU .bof...')
    launch_bof()

    # -------------------------------------------------------------------------
    # SEND PARAMETERS TO TCU
    # -------------------------------------------------------------------------
    logger.debug('sending params to TCU...')
    write_registers()

    # -------------------------------------------------------------------------
    # VERIFY REGISTERS HAVE CORRECT VALUES
    # -------------------------------------------------------------------------
    logger.debug('verifying TCU registers...')
    verify_registers()

    # -------------------------------------------------------------------------
    # ARM THE TCU
    # -------------------------------------------------------------------------
    logger.debug('arming the TCU...')
    arm_tcu()

    # -------------------------------------------------------------------------
    # CLOSE SSH CONNECTION
    # -------------------------------------------------------------------------
    logger.debug('closing ssh connection...')
    fpga_con.disconnect()

    logger.info('script completed successfully')
    sys.exit(0)
