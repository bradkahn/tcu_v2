#!/usr/bin/python3

PRI = input("Enter PRI (us):\n")
PULSE_WIDTH = input("Enter pulse width (us):\n")
PRE_PULSE = input("Enter prepulse delay (us):\n")
FREQ_BAND = input("Enter frequency-band:\n")

AMP_DELAY = int()

if FREQ_BAND.startswith('l'):
    AMP_DELAY = 1300  # 1.3us
elif FREQ_BAND.startswith('x'):
    AMP_DELAY = 3510  # 3.51us
else:
    raise Exception('invalid frequency-band')

# convert offsets into ns, divide into 10ns cycles
MBoffset = (eval(PRE_PULSE)*1000)//10
DOoffset = ((eval(PULSE_WIDTH)*1000) - AMP_DELAY)//10
PRIoffset = ((eval(PRI)*1000)//10) - MBoffset - DOoffset

# [pulse0]
# MBoffset  = 3000;
# DIGoffset = 870;
# PRIoffset = 96130;
# Frequency = 1300;
# Mode = 0;
print("MBoffset\t= {}".format(MBoffset))
print("DIGoffset\t= {}".format(DOoffset))
print("PRIoffset\t= {}".format(PRIoffset))
