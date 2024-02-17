# (LINUX ONLY)

# Computer
a script that is a universal alias writen in bash to install/search/update/remove programs on linux

# Usage
    computer install "program"
    computer upgrade/update "program"
    computer search "program"
    computer remove/unistall "program"
    
# AUTOMATIC INSTALATION
## clone this repository
    git clone https://gitlab.com/mr-draxs/mkdesk.git
## run ./install as sudo
    chmod +x ./install
    sudo ./install

# MANUAL INSTALATION
## clone this repository
    git clone https://gitlab.com/mr-draxs/mkdesk.git
## copy computer to a $PATH directory
    sudo cp scripts/computer.sh /usr/bin/computer
    sudo chmod +x /usr/bin/computer
