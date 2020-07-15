#!/bin/bash

data=`date +%Y%m%d%H%M`
container=$(docker ps -a --filter ancestor=$image1:$init -q)
image2=`docker ps -a | awk '{ print $1,$2 }' | grep $image1 | awk '{print $2 }'`

if [[ "$version" == 0 ]]; then
  if [[ "$container" == "$null" ]]; then
    docker run -it --name $name -d -p $port1:$port2 -d -p $port3:$port4 -d -p $port5:$port6 -d -p $port7:$port8 $image1:$init
  else
    docker stop $container
    docker rm $container
    docker run -it --name $name -d -p $port1:$port2 -d -p $port3:$port4 -d -p $port5:$port6 -d -p $port7:$port8 $image2
  fi
else
  if [[ "$container" == "$null" ]]; then
    docker run -it --name $name -d -p $port1:$port2 -d -p $port3:$port4 -d -p $port5:$port6 -d -p $port7:$port8 $image1:$init
  else
    docker commit $container $image1:$data
    docker stop $container
    docker rm $container
    docker run -it --name $name -d -p $port1:$port2 -d -p $port3:$port4 -d -p $port5:$port6 -d -p $port7:$port8 $image1:$data
  fi
fi
 
docker image ls | grep $image1
 
