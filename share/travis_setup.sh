#!/bin/bash
set -evx

mkdir ~/.rapturecore

# safety check
if [ ! -f ~/.rapturecore/.rapture.conf ]; then
  cp share/rapture.conf.example ~/.rapturecore/rapture.conf
fi
