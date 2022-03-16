#!/bin/sh
# CRE

virtualenv --python=python3.8 env

env/bin/pip3 install -r requirements.txt
#env/bin/pip3 install -r requirements.txt -e .