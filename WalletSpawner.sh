#!/bin/bash

PRV1=""
PRV2=""
PRV3=""
PRV4=""
PRV5=""
PRV6=""
PRV7=""
PRV8=""
PRV9=""
PRV10=""
PRV11=""
PRV12=""
PRV13=""
PRV14=""
PRV15=""
PRV16=""
PRV17=""
PRV18=""
PRV19=""
PRV20=""

CL_NO=""
Bench=""
PASS=""

for ((i=1;i<=CL_NO;i++))
do
  KEY="PRV$i"
  echo "Making Address "$i
  sudo docker exec -i ${Bench} bash -c '/matrix/gman attach /matrix/chaindata/gman.ipc -exec personal.importRawKey\(\"'${!KEY}'\",\"'${PASS}'\"\)'
done
