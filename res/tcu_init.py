#!/usr/bin/python3

# tcu_init.py
# startup script for TCU
# Brad Kahn
# 01/12/2017

# TODO: find out where header file will live on node laptop
HEADER_PATH = "/home/brad/tcu_v2/res/"
HEADER_NAME = "NeXtRAD Header.txt"

# ------------------------------------------------------------------------------------
# EXTRACT PARAMETERS FROM HEADER FILE
# ------------------------------------------------------------------------------------
header_file = open(HEADER_PATH + HEADER_NAME, 'r')
header_lines = header_file.readlines()

num_transfers = int()   # M = num_transfers / num_repeats
num_pulses = int()      # N
num_repeats = int()     # M
# pulse = {mb:xxxx, dig:xxx, pri:xxx, freq: xxx, mode:xxx}
pulses = list()         # [pulse1, pulse2, pulse3]

pulse_num = 0

for line in header_lines:
    if line.find('NUM_TRANSFERS') > -1:
        print("num-transfers found:", line)
        # num_transfers = ...
    elif line.find('[pulse') > -1:
        print("pulse header found:", line)
        pulse_num = eval(line[-3])
        print("pulse number is: " + str(pulse_num))
        pulses.append(dict())
    if pulse_num > 0:
        if line.find('MBoffset') > -1:
            val = line.split()
            print('\tMBoffset for pulse{} is {}'.format(pulse_num, val[2]))
            pulses[pulse_num]['mb_offset'] = eval[val[2]]
        elif line.find('DIGoffset') > -1:
            val = line.split()
            print('\tDIGoffset for pulse{} is {}'.format(pulse_num, val[2]))
            pulses[pulse_num]['dig_offset'] = eval[val[2]]
        elif line.find('PRIoffset') > -1:
            val = line.split()
            print('\tPRIoffset for pulse{} is {}'.format(pulse_num, val[2]))
            pulses[pulse_num]['pri_offset'] = eval[val[2]]
        elif line.find('Frequency') > -1:
            val = line.split()
            print('\tFrequency for pulse{} is {}'.format(pulse_num, val[2]))
            pulses[pulse_num]['frequency'] = eval[val[2]]
        elif line.find('TxPol') > -1:
            val = line.split()
            print('\tTxPol for pulse{} is {}'.format(pulse_num, val[2]))
            pulses[pulse_num]['tx_pol'] = val[2]
        elif line.find('RxPol') > -1:
            val = line.split()
            print('\tRxPol for pulse{} is {}'.format(pulse_num, val[2]))
            pulses[pulse_num]['rx_pol'] = val[2]
    else:
        pass
    
num_pulses = pulse_num
# num_repeats = num_transfers/num_pulses # check python3 division operators

# ------------------------------------------------------------------------------------
# verify extracted params, check everything is there
# ------------------------------------------------------------------------------------


# ------------------------------------------------------------------------------------
# SEND PARAMS TO TCU
# ------------------------------------------------------------------------------------
