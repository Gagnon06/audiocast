#!/bin/bash

SNAPSERVER_CONF_DIR=/root/.config/snapserver
SNAPSERVER_CONF_FILE=$SNAPSERVER_CONF_DIR/snapserver.conf

# Use default snapserver.conf if needed
if [ ! -f "$SNAPSERVER_CONF_FILE" ]; then
    mkdir -p $SNAPSERVER_CONF_DIR
    cp /etc/snapserver.conf $SNAPSERVER_CONF_FILE
fi

snapserver -c $SNAPSERVER_CONF_FILE &
mopidy &
  
# Wait for any process to exit
wait -n
  
# Exit with status of process that exited first
exit $?
