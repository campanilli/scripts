#!/bin/sh
 
cd /home/pi/CAMPANILLI/scripts

echo '"Alterações realizadas em '`date +%d/%m/%Y-%H:%M`'"'
 
git status
 
git add .
 
git pull
 
git status
 
git commit -m '"Alterações realizadas em '`date +%d/%m/%Y-%H:%M`'"'
 
git push -u origin master
