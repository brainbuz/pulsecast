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

You will need to know the soundcard name for /boot/config.txt
    soundcard_name

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

Dependencies
------------

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: raspbian
      roles:
         - brainbuz.pulsecast

License
-------

GPL3

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
