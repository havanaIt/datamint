#!/bin/bash

for i in $(docker ps -a | awk '{print $1}' | tail -n 5) ; do docker rm $i; done
