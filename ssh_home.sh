#!/bin/bash

while true; do
	ssh -p 22222 -L 9091:localhost:9091 -D 65000 glecoz@gaelpierre.internet-box.ch
done
