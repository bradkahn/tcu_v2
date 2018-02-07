# Timing Control Unit (TCU)

2nd iteration of the timing control unit (TCU) for NeXtRAD project

## Initialization script

*TODO: description of script*

### Usage
`usage: tcu_project [address] [file]

positional arguments:
  address               IP address of TCU
  file                  header file

optional arguments:
  -h, --help            show this help message and exit
  -b BOF, --bof BOF     name of .bof file to be executedon RHINO
                        ['tcu_v2.bof']
  -t TIMEOUT, --timeout TIMEOUT
                        login timeout (seconds) toestablish SSH connection to
                        RHINO [30]
  -l LOGDIR, --logdir LOGDIR
                        directory to store log file default ['/tmp']`

### Dependencies

*   python3
*   harpoon framework (still in development)
*   pexpect
*   *TODO: list other dependencies*

### Exit Codes for tcu_v2.py

`0     : all good, tcu is armed and waiting`
`64    : headerfile not found`
`65    : expected parameter missing from headerfile`
`66    : failed to connect to rhino`
`67    : read registers don't match expected`

## Gateware

*TODO*
