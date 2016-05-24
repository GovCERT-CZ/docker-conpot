#!/bin/bash
set -e

chown -R conpot:conpot /opt/conpot/log
chown conpot:conpot /opt/conpot/conpot/conpot.cfg

if [ -z "$CONPOT_TEMPLATE" ]; then CONPOT_TEMPLATE="default"; fi

/usr/local/bin/conpot -c /opt/conpot/conpot/conpot.cfg -l /opt/conpot/log/conpot.log --template "$CONPOT_TEMPLATE" > /opt/conpot/log/conpot.out 2> /opt/conpot/log/conpot.err

