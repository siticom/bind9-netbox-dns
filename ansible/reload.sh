#!/bin/sh

if [ $(pgrep s6-setlock | wc -l) -gt 0 ]; then
    echo "A reload process is already running and anotherone is waiting, skipping request"
    return 0
fi

/bin/s6-setlock /tmp/dns_reload_hook.lock ansible-playbook configure.yml --tags reload
