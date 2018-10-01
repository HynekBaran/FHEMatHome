#!/bin/bash
case "$1" in

"on")  echo "Motion ON"
    curl "http://tlustoch:Averbuch@192.168.1.1:7080/0/detection/start" > /dev/null
    ;;
"off")  echo  "Motion OFF"
    curl "http://tlustoch:Averbuch@192.168.1.1:7080/0/detection/pause"  > /dev/null
    ;;
"status")
    
    status=`curl "http://tlustoch:Averbuch@192.168.1.1:7080/0/detection/status" | egrep  'Detection status (.*)$' | egrep -c "ACTIVE"`
    echo $status
    exit $status
    ;;
*) echo "Wrong motion script $0 parameter $1"
   ;;
esac
