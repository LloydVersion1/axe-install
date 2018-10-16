#!/usr/bin/env bash

#A Bash script to install the AWS AXE tool created by @kxseven. This script needs to run as "$ sudo su" && "./axe-install.sh" and run it at /home/user/ location.

apt-get install -y \
libkrb5-dev \
python-gssapi \
python-kerberos \
python-requests-kerberos \
python-simplejson \
bash-completion \
git \
jq \
graphviz \
build-essential \
python-pip \
libssl-dev \
python-dev \

sudo apt install virtualenv

git clone https://bitbucket.org/kxseven/axe.git

cd axe
AXE_ROOT=$(pwd)
export AXE_ROOT
cd $AXE_ROOT
virtualenv local/python
source $AXE_ROOT/etc/axerc
pip install -r requirements/requirements.python2 -I

cat >> ~/.bashrc <<-EOF
# AXE Environment
AXE_ROOT=$AXE_ROOT
PATH=\$PATH:\$AXE_ROOT/bin
export AXE_ROOT PATH
# Useful Aliases
alias goaxe='cd \$AXE_ROOT; . etc/axerc'

EOF

