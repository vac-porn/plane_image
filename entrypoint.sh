#!/bin/bash
cd /home/container/plane


# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container/plane$ ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}