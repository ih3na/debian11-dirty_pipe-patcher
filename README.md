# debian11-dirty_pipe-patcher

*This Project is still under development*

Since the Debian 11 still comes with the kernel version 5.10, which is vulnerable to the Dirty Pipe Vulnerability,
this scirpt is made for manually compile and install the kernel version 5.18 which is not vulnerable.

## Usage
1. Clone the repository
2. Run the bash script with sudo permissons 
3. Reboot the system

## Notes
- Do not do configurations in the first make config
- Clear the cryptograpic key locations in the oldconfig
- Make the proper Kernel Hacks and Drivere configurations in the make config screen

## Special Credits
- https://youtu.be/gfqeyxP4wWY
