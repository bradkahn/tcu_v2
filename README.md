# Timing Control Unit (TCU)

2nd iteration of the timing control unit (TCU) for NeXtRAD project

**TODO: Modify gateware to work with pulse widths < 3us**

## Initialization script [tcu_v2.py]

*TODO: description of script*

### Usage
```
tcu_project [address] [file]

positional arguments:  
    address     IP address of TCU  
    file        header file  
optional arguments:  
    -h, --help                      show this help message and exit  
    -b BOF, --bof BOF               name of .bof file to be executedon RHINO ['tcu_v2.bof']  
    -t TIMEOUT, --timeout TIMEOUT   login timeout (seconds) toestablish SSH connection to RHINO [30]  
    -l LOGDIR, --logdir LOGDIR      directory to store log file default ['/tmp']
```  

### Dependencies

*   python3
*   harpoon framework (still in development)
*   pexpect
*   *TODO: list other dependencies*

### Exit Codes
| Code | Description |
| ------ | ------ |
| 0 | all good, tcu is armed and waiting |
| 64 | headerfile not found |
| 65 | expected parameter missing from headerfile |
| 66 | failed to connect to rhino |
| 67 | read registers don't match expected |

## Gateware

*TODO*
-- TCU registers available to BORPH

-- TODO: rename and change address of registers, using Harpoon framework

--     NAME        BITS       ADDR
-- +----------+----------+----------+
-- |VERSION   |    16    |0x08000000|  <-- TODO
-- +--------------------------------+
-- |status    |    16    |0x08000000|
-- +--------------------------------+
-- |reg_led   |    16    |0x08800000|
-- +--------------------------------+
-- |reg_fmc   |    16    |0x09000000|
-- +--------------------------------+
-- |reg_pulses|  32x96   |0x09800000|
-- +--------------------------------+
-- |m         |    32    |0x0A000000|
-- +--------------------------------+
-- |n         |    16    |0x0A800000|
-- +--------------------------------+
