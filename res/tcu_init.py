#!/usr/bin/python3

# tcu_init.py
# startup script for TCU
# Brad Kahn
# 01/12/2017

# TODO: find out where header file will live on node laptop
HEADER_PATH = "/home/brad/tcu_v2/res/"
HEADER_NAME = "NeXtRAD Header.txt"

# -----------------------------------------------------------------------------
# EXTRACT PARAMETERS FROM HEADER FILE
# -----------------------------------------------------------------------------

header_file = open(HEADER_PATH + HEADER_NAME, 'r')
header_lines = header_file.readlines()

num_transfers = int()   # used to calculate M
num_pulses = int()      # N
num_repeats = int()     # M
pulses = list()         # [{pulse1}, {pulse2}, {pulse3}]

# pulse dictionary format -> {"pulse_number": xxx, "mb_offset":xxx, "dig_offset":xxx, "pri_offset":xxx, "frequency": xxx, 'tx_pol': xxx, 'rx_pol': xxx} # noqa

# NOTE: assume the first pulse is [pulse1]

pulse_num = 0

for line in header_lines:
    if line.find('NUM_TRANSFERS') > -1:
        print("num-transfers found:", line[:-1])
        val = line.split()
        num_transfers = eval(val[2][:-1])
    elif line.find('[pulse') > -1:
        print("pulse header found:", line[:-1])
        pulse_num = eval(line[-3])
        print("pulse number is: " + str(pulse_num))
        pulses.append(dict())
        pulses[pulse_num-1]['pulse_number'] = pulse_num
    if pulse_num > 0:
        if line.find('MBoffset') > -1:
            val = line.split()
            print('\tMBoffset for pulse{} is {}'.format(pulse_num, val[2]))
            pulses[pulse_num-1]['mb_offset'] = eval(val[2][:-1])
        elif line.find('DIGoffset') > -1:
            val = line.split()
            print('\tDIGoffset for pulse{} is {}'.format(pulse_num, val[2]))
            pulses[pulse_num-1]['dig_offset'] = eval(val[2][:-1])
        elif line.find('PRIoffset') > -1:
            val = line.split()
            print('\tPRIoffset for pulse{} is {}'.format(pulse_num, val[2]))
            pulses[pulse_num-1]['pri_offset'] = eval(val[2][:-1])
        elif line.find('Frequency') > -1:
            val = line.split()
            print('\tFrequency for pulse{} is {}'.format(pulse_num, val[2]))
            pulses[pulse_num-1]['frequency'] = eval(val[2][:-1])
        elif line.find('TxPol') > -1:
            val = line.split()
            print('\tTxPol for pulse{} is {}'.format(pulse_num, val[2]))
            pulses[pulse_num-1]['tx_pol'] = val[2][:-1]
        elif line.find('RxPol') > -1:
            val = line.split()
            print('\tRxPol for pulse{} is {}'.format(pulse_num, val[2]))
            pulses[pulse_num-1]['rx_pol'] = val[2][:-1]
    else:
        pass

# -----------------------------------------------------------------------------
# VERIFY PARAMETERS
# -----------------------------------------------------------------------------

if pulse_num == 0:
    raise Exception('no [pulseX] where found in header')

if num_transfers == 0:
    raise Exception('no NUM_TRANSFERS found in header, needed for "m"')

for pulse in pulses:
    # simple check if the number of parameters matches the expected number,
    # could take this further and check for each parameter individually
    if len(pulse) != len(["pulse_number", "mb_offset", "dig_offset", "pri_offset", "frequency", "tx_pol", "'rx_pol'"]):
        raise Exception('missing pulse parameter(s) for pulse ' + str(pulse['pulse_number']))

num_pulses = pulse_num
print('number of pulses found (n) = ' + str(num_pulses))
# division operators: '/' for float, '//' integer
num_repeats = num_transfers // num_pulses
print('calculated number of repeats (m) = ' + str(num_repeats))

# -----------------------------------------------------------------------------
# SEND PARAMETERS TO TCU
# -----------------------------------------------------------------------------
