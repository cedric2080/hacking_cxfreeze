#!/bin/sh
# CRE

# Configuring a bit the echo system :))
echo_parameter=
echo_e=echo $echo_parameter
# printf "I ${RED}love${NC} Stack Overflow\n" # Now we know where I picked this color definition command :D
PUR='\033[0;35m'
BLU='\033[0;34m'
GRE='\033[0;32m'
RED='\033[0;31m'
REDINVBLINK='\033[31;5;7m'
REDINV='\033[31;7m'
GREINV='\033[32;7m'
NC='\033[0m' # No Color

# For some reason, we need this and cannot run env/bin/python directly because of the way cx-Freeze works
# It seems like even when used from a virtualenv, it keep seeking for system packages
# with a failing dependency coming from patchelf (system is 0.10 and cx-Freeze needs 0.12)
/bin/bash -c ". ./env/bin/activate"
#https://www.geeksforgeeks.org/using-cx_freeze-python/
python -m cx_Freeze test.py --target-name=test

# Inspired from https://stackoverflow.com/a/62415977
mkdir library
cp build/exe.linux-x86_64-3.8/lib/library.zip ./library
cd library
unzip library.zip
cd ..

python -m uncompile.py

$echo_e "${GREINV}Your code is here: $envchosen ${NC}"
cat ./library/test_main_reverse_eng.py

rm -rf build

# Exiting the script automatically deactivate the "thing" :)