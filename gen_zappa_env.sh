#!/bin/sh

if [ -s ./venv ]; then
    echo "venv has already been made."
else
    python3 -m venv venv
    . ./venv/bin/activate
    pip3 install zappa flask
    echo "------------------------"
    echo "The process is finished."
fi