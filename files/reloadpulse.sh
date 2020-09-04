#!/bin/bash
#/usr/local/sbin/reloadpulse.sh
## kill all pulse processes
/usr/bin/pkill pulseaudio
/usr/bin/pulseaudio --start --disallow-module-loading
