#!/bin/bash

#Variable for Script Paths
full_path=$(realpath $0)
#echo $full_path
dir_path=$(dirname $full_path)
#echo $dir_path

FCT.GetVAR () {
  local A B C

  echo "Enter the name of the container that will create the wallets:"
  read A
  eval Bench=$A
  echo ""

  echo "Enter the Password that will be used to create the wallets:"
  read B
  eval PASS=$B
  echo ""

  echo "How many Keystores do you want to generate "$type" ?"
  read C
  eval CL_NO=$C
  echo ""

  echo "What is the starting number you want the public keys to be printed with for the transfer and balance scripts ?"
  echo "Enter 1 for default, or a higher number if you need:"
  read Starting_Number
  eval Offset=$((Starting_Number-1))
  echo ""
}

FCT.Generate () {
  D1=$(date +%A)
  D2=$(date +%d)
  D3=$(date +%B)
  D4=$(date +%m)
  D5=$(date +%Y)
  D6=$(date +%T)
  Date=$D5'_'$D4'('$D3')_'$D2'@'$D6
  Export1="Private_Keys_"$Date
  Export2="Public_Keys_"$Date
  Export3="Public_Keys_4Script_"$Date
  touch $Export1
  touch $Export2
  touch $Export3

  for ((i=1;i<=CL_NO;i++))
  do
    KEY="PRV$i"
    echo "Making Address "$i
    PB=$(sudo docker exec -i ${Bench} bash -c '/matrix/gman attach /matrix/chaindata/gman.ipc -exec personal.importRawKey\(\"'${!KEY}'\",\"'${PASS}'\"\)')
    PB=$(sed 's/.//;s/.$//' <<< "$PB")
    echo ${!KEY} >> $Export1
    echo $PB >> $Export2

    j=$((Offset+i))
    Script="MAN"$j"='$PB'"
    echo $Script >> $Export3
    echo ""
  done
  echo "Done exporting Private and Public Keys"
  echo ""
}


#Starting Script

echo ""
echo "Do you want to use existent private keys to generate wallets, or do you want to generate new wallets with random private keys ?"
echo "For randomly generate wallets, their private keys will be exported."
echo ""
echo "Type existent for first option or random for second option"
read OPTION
echo ""


if [ "$OPTION" == "existent" ]; then
  type="from private keys"
  FCT.GetVAR

  for ((i=1;i<=CL_NO;i++))
  do
    echo "Type in the private key of wallet "$i"/"$CL_NO":"
    read PRV
    eval PRV$i=$PRV
  done
  echo ""
  FCT.Generate
elif [ "$OPTION" == "random" ]; then
  type="randomly"
  FCT.GetVAR

  for ((i=1;i<=CL_NO;i++))
  do
    PRV=$(openssl rand -hex 32)
    eval PRV$i=$PRV
  done
  echo ""
  FCT.Generate
fi
