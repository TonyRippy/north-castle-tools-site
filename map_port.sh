#!/bin/bash
echo Mapping 127.0.0.1:8080 to public port 8088...
echo Hit Ctrl-C to exit. 
sudo socat TCP-LISTEN:8088,fork TCP:127.0.0.1:8080
