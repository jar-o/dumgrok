#!/bin/bash

# Start and background our services
dumdum --file dum.stanza --verbose &
./ngrok http localhost:8001 > ngrok.log &

sleep 2
echo 'You will need to point to one of these URLs'

wget -q -O - 2>&1 http://localhost:4040/api/tunnels | python -mjson.tool | grep public_url

# Since we've backgrounded ngrok, let's at least see what it says when we hit
# the server. Although we really are more interested in the dumdum output.
tail -f /ngrok.log
