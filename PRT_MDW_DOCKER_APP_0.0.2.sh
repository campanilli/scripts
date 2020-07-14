#!/bin/bash

data=`date +%Y%m%d%H%M`
container=$(docker ps -a --filter ancestor=$image1:$init -q)
image2=`docker ps -a | awk '{ print $1,$2 }' | grep $image1 | awk '{print $2 }'`

if [[ "$version" == 0 ]]; then
  if [[ "$container" == "$null" ]]; then
    docker run --name $name --net $net -p $port1:$port2 -d $image1:$init
  else
    docker stop $container
    docker rm $container
    docker run --name $name --net $net -p $port1:$port2 -d $image2
  fi
else
  if [[ "$container" == "$null" ]]; then
    docker run --name $name --net $net -p $port1:$port2 -d $image1:$init
  else
    docker commit $container $image1:$data
    docker stop $container
    docker rm $container
    docker run --name $name --net $net -p $port1:$port2 -d $image1:$data
  fi
fi
 
docker image ls | grep $image1
 
