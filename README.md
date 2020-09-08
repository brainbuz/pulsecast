PulseCast
=========

Install a Single Board Computer with Raspbian and a SoundCard as a PulseAudio based music player.

For more information on the project search for pulsecast on [https://techinfo.brainbuz.org](https://techinfo.brainbuz.org/?s=pulsecast)

Requirements
------------

This role has no external dependencies but is both limited in hardware that would work with it and to the Raspbian Debian distribution.

Role Variables
--------------

The daemon values are those that I've needed to set. These values will be set in /etc/pulse/daemon.conf

    daemon_fragments
    daemon_fragment_size_msec
    daemon_deferred_volume_safety_margin_usec

You will need to know the soundcard name for /boot/config.txt, default is for hifiberry.

    soundcard_name: my_hifi_soundcard

If you are using ufw it will open all ports to the allow_hosts list.

    use_ufw: boolean

If you wish to set an acl for pulse tcp connections this will put your allow_hosts in the list.

    use_pulseacl: boolean

If either use_ufw or use_pulseacl are true there must be at least one valid ip address in allow_hosts. If you are not using either this variable may be undefined.

    allow_hosts:
      - ip_address1
      - ip_address2

Options to disable wife and bluetooth if they're not in use.

    allow_bluetooth: boolean
    allow_wifi: boolean

Crontab to restart pulseaudio every day.

Shown are the default values to restart the pulse daemon every day at 6:30 AM. Check your timezone with `ls -l /etc/localtime`, Raspberry Pi defaults to UK for timezone. The audio from your devices may pick up lag and drift between devices over time, the daily restart fixes this problem.

    dailypulserestart: true
    dailypulserestart_hour: '6'
    dailypulserestart_minute: '30'

Dependencies
------------

Example Playbook
----------------

    - hosts: pi
      vars:
        soundcard_name: my_hifi_soundcard
        use_ufw: true
        use_pulseacl: false
        allow_hosts: [ '192.168.1.11', '192.168.11.1' ]
        allow_bluetooth: false
        allow_wifi: false
      roles:
        - brainbuz.pulsecast

License
-------

GPL3
