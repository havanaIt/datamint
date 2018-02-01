#!/bin/bash

# Variable env

FROM=
TO=

# Create virtual machines
# ...

# Copy files HOST TO MNAGER1
docker-machine scp -r $FROM manager1:$TO

# ***** Deploy on manager1 ****
docker-machine ssh manager1

for node in {worker1 worker2} 
do
	sed -ie 's@@@g'	

done
