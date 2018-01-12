#!/bin/bash


set -xe

# Variable env

FROM=
TO=
HOME_KAFKA=/Users/alanhared/Documents/projet-Datamind/datamint/KAFKA
HOME_DATAMINT=/home/docker/projet-Datamind/datamint
ID=1

# Create virtual machines
# ...

# Copy files HOST TO MNAGER1
docker-machine scp -r $FROM manager1:$TO

# ***** Deploy on manager1 ****
docker-machine ssh manager1

for node in {worker1 worker2} 
do
        cp $HOME_KAFKA/server.properties_template $HOME_KAFKA/server.properties
	sed -i "s@__NUM__@$ID@g" $HOME_KAFKA/server.properties

	# docker-compose.yml
        cp $HOME_KAFKA/docker-compose_template.yml $HOME_KAFKA/docker-compose.yml
	sed -i "s@__NODE__@$node@g" $HOME_DATAMINT/docker-compose.yml

 	docker stack deploy -c docker-compose.yml testDatamint1.0	
        
	ID=$(($ID + 1))
done
