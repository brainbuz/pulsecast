#!/bin/bash
#/usr/local/sbin/startpulse.sh
while [ 1 ]; do
  ## start does not return error if daemon already loaded
  /usr/bin/pulseaudio --start --disallow-module-loading
  sleep 60
done
