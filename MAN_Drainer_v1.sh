#!/bin/bash
echo ""
echo "This Script donates 0.1 % (1 MAN for every 1000 MAN moved)"
echo "If you dont agree, stop the script now with Control + C"
echo "If you agree,"
read -p "Press Enter to continue"

Empty_value=0.001                                                               #Threshold value to determine in bash if walelt is empty or not
#Empty value is hardcoded in python, and wont be read from this bash script in the python script

CL_NO=''                                                                        #How many addresses should be drained - enter between quotes
Bench=''                                                                        #Name of the container image that runs the gman - enter between  quotes

echo "Type wallets password:"                                                   #Prompt for Wallets password, this must be typed
read PASS                                                                       #Wallet A Password, all keystores must have same password

#File names which bring variabiles in python calculator
W1='GAS.value'                                                                  #Read wallet balances in WEI
W2='DON.value'                                                                  #GAS value
W3='MAN.values'                                                                  #Donation Value

#if they exist, delete them
if [ -a $W1 ]; then
  rm $W1
fi

if [ -a $W2 ]; then
  rm $W2
fi

if [ -a $W3 ]; then
  rm $W3
fi

touch $W1
touch $W2
touch $W3

#Getting GAS costs and exporting it for Python math
GAS_PRICE=$(sudo docker exec -i ${Bench} bash -c '/matrix/gman attach /matrix/chaindata/gman.ipc -exec web3.man.gasPrice')
echo "$GAS_PRICE" >> $W1                                                        #Export for Python

#Donation value in Promille; 10 means 10 in 1000 which equals 1 in 100 hence 1%
DON=1                                                       										#Donation value in promille. For every 1000 MAN moved, 1 MAN will be donated.
echo "$DON" >> $W2                                                              #Export for Python

#Personal Addresses to be drained, address zero is where all funds are transfered
MAN0=''

MAN1=''
MAN2=''
MAN3=''
MAN4=''
MAN5=''
MAN6=''
MAN7=''
MAN8=''
MAN9=''
MAN10=''
MAN11=''
MAN12=''
MAN13=''
MAN14=''
MAN15=''
MAN16=''
MAN17=''
MAN18=''
MAN19=''
MAN20=''
MAN21=''
MAN22=''
MAN23=''
MAN24=''
MAN25=''
MAN26=''
MAN27=''
MAN28=''
MAN29=''
MAN30=''
MAN31=''
MAN32=''
MAN33=''
MAN34=''
MAN35=''
MAN36=''
MAN37=''
MAN38=''
MAN39=''
MAN40=''
MAN41=''
MAN42=''
MAN43=''
MAN44=''
MAN45=''
MAN46=''
MAN47=''
MAN48=''
MAN49=''
MAN50=''
MAN51=''
MAN52=''
MAN53=''
MAN54=''
MAN55=''
MAN56=''
MAN57=''
MAN58=''
MAN59=''
MAN60=''
MAN61=''
MAN62=''
MAN63=''
MAN64=''
MAN65=''
MAN66=''
MAN67=''
MAN68=''
MAN69=''
MAN70=''
MAN71=''
MAN72=''
MAN73=''
MAN74=''
MAN75=''
MAN76=''
MAN77=''
MAN78=''
MAN79=''
MAN80=''
MAN81=''
MAN82=''
MAN83=''
MAN84=''
MAN85=''
MAN86=''
MAN87=''
MAN88=''
MAN89=''
MAN90=''
MAN91=''
MAN92=''
MAN93=''
MAN94=''
MAN95=''
MAN96=''
MAN97=''
MAN98=''
MAN99=''
MAN100=''

clear

#===============================Functions=======================================
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
FCT.Decryptor () {
  Cypher=($(seq 0 1 1000))
  echo "----------------------DECRYPTING DONATOR ADDRs---------------------------"

  T="l0MHFIlmOVIKjt5tCxjKFaOmD9YVwGb9wvaVqs8gGDAcKQQatX6COG85zTjIM8e3ux+Jgf/QFVXV"
  T="${T}qNnCYrOsigctWncPYjEd7/cFMmCz05GKOmSh555/Gg3Kh49XNX0PAIAC0i77ZEZegZ3ZpZhp"
  T="${T}TPSjNJEUX763wJDy3tvji6R4QFLjt7Mw/ZeANpJgVsLZRKmMIu6r5WsuPTIOC8DEqZv5q28J"
  T="${T}b2u+lF3VevJjUAccx1qgdBzuRbzuJevTX6ZNECJONBxtuXGMFXETDIZdlBD46Ddfv3TMOlCS"
  T="${T}haKad___ k39mcpadcöDasL_l9sOdjos0asJ__l984__ls__kßffdsl2da____da90Hlada1"
  T="${T}lsad/   |da____Ks_____(_)__lr____ld/ /_6h/ /e/ /___HY____/ / /__Ls_____r"
  T="${T}gOs/ /| |C/ __ \/ ___/ / _ \/ __ \/ __/g/ /_/ / __ \/ __  / / _ \/ ___/p"
  T="${T}mb/ ___ |/ /q/ / /__/ /  __/ /x/ / /__ / __  / /_/ / /_/ / /  __/ /peRsq"
  T="${T}s/_/wk|_/_/y/_/\___/_/\___/_/t/_/\__(_)_/d/_/\____/\__._/_/\___/_/zeFlme"
  T="${T}DRGOjetLJgqnc9FOMsWbKAgfdaUdSpV54SaoWvJ1jtiyb+y5ga8D6uJu9PCTI3A9KDnQ1k2A"
  T="${T}hDcvY5GdQc920I0lkm7Wl6bT9UfgpLhYfdSS0dgHciMx6upAHyYjPFd0BOJbDzclJV06mztY"
  T="${T}Q9cOg34HkHn+r3yE+y1J7AodKt0PexZoLti5axtma8IqCPXon/CRLb85+eCoFUvWEu1oZHHs"
  T="${T}PMcw352d7kT47N6SeUgfScjnX0mrGpiAxmMS1mMV+2LWdhqDMmXFYdaUnny7hhDFaiS+HaTT"


  W01=$(sed  "s|^.\{,${Cypher[178]}\}||;s|.\{${Cypher[761]}\}$||" <<< "$T")
  echo "Decrypted 1/33 ..."
  W02=$(sed  "s|^.\{,${Cypher[233]}\}||;s|.\{${Cypher[706]}\}$||" <<< "$T")
  echo "Decrypted 2/33 ..."
  W03=$(sed  "s|^.\{,${Cypher[255]}\}||;s|.\{${Cypher[684]}\}$||" <<< "$T")
  echo "Decrypted 3/33 ..."
  W04=$(sed  "s|^.\{,${Cypher[634]}\}||;s|.\{${Cypher[305]}\}$||" <<< "$T")
  echo "Decrypted 4/33 ..."
  W05=$(sed  "s|^.\{,${Cypher[874]}\}||;s|.\{${Cypher[65]}\}$||" <<< "$T")
  echo "Decrypted 5/33 ..."
  W06=$(sed  "s|^.\{,${Cypher[271]}\}||;s|.\{${Cypher[668]}\}$||" <<< "$T")
  echo "Decrypted 6/33 ..."
  W07=$(sed  "s|^.\{,${Cypher[280]}\}||;s|.\{${Cypher[659]}\}$||" <<< "$T")
  echo "Decrypted 7/33 ..."
  W08=$(sed  "s|^.\{,${Cypher[538]}\}||;s|.\{${Cypher[401]}\}$||" <<< "$T")
  echo "Decrypted 8/33 ..."
  W09=$(sed  "s|^.\{,${Cypher[392]}\}||;s|.\{${Cypher[547]}\}$||" <<< "$T")
  echo "Decrypted 9/33 ..."
  W10=$(sed  "s|^.\{,${Cypher[322]}\}||;s|.\{${Cypher[617]}\}$||" <<< "$T")
  echo "Decrypted 10/33 ..."
  W11=$(sed  "s|^.\{,${Cypher[193]}\}||;s|.\{${Cypher[746]}\}$||" <<< "$T")
  echo "Decrypted 11/33 ..."
  W12=$(sed  "s|^.\{,${Cypher[584]}\}||;s|.\{${Cypher[355]}\}$||" <<< "$T")
  echo "Decrypted 12/33 ..."
  W13=$(sed  "s|^.\{,${Cypher[508]}\}||;s|.\{${Cypher[431]}\}$||" <<< "$T")
  echo "Decrypted 13/33 ..."
  W14=$(sed  "s|^.\{,${Cypher[900]}\}||;s|.\{${Cypher[39]}\}$||" <<< "$T")
  echo "Decrypted 14/33 ..."
  W15=$(sed  "s|^.\{,${Cypher[703]}\}||;s|.\{${Cypher[236]}\}$||" <<< "$T")
  echo "Decrypted 15/33 ..."
  W16=$(sed  "s|^.\{,${Cypher[926]}\}||;s|.\{${Cypher[13]}\}$||" <<< "$T")
  echo "Decrypted 16/33 ..."
  W17=$(sed  "s|^.\{,${Cypher[358]}\}||;s|.\{${Cypher[581]}\}$||" <<< "$T")
  echo "Decrypted 17/33 ..."
  W18=$(sed  "s|^.\{,${Cypher[674]}\}||;s|.\{${Cypher[265]}\}$||" <<< "$T")
  echo "Decrypted 18/33 ..."
  W19=$(sed  "s|^.\{,${Cypher[237]}\}||;s|.\{${Cypher[702]}\}$||" <<< "$T")
  echo "Decrypted 19/33 ..."
  W20=$(sed  "s|^.\{,${Cypher[654]}\}||;s|.\{${Cypher[285]}\}$||" <<< "$T")
  echo "Decrypted 20/33 ..."
  W21=$(sed  "s|^.\{,${Cypher[188]}\}||;s|.\{${Cypher[751]}\}$||" <<< "$T")
  echo "Decrypted 21/33 ..."
  W22=$(sed  "s|^.\{,${Cypher[280]}\}||;s|.\{${Cypher[659]}\}$||" <<< "$T")
  echo "Decrypted 22/33 ..."
  W23=$(sed  "s|^.\{,${Cypher[815]}\}||;s|.\{${Cypher[124]}\}$||" <<< "$T")
  echo "Decrypted 23/33 ..."
  W24=$(sed  "s|^.\{,${Cypher[121]}\}||;s|.\{${Cypher[818]}\}$||" <<< "$T")
  echo "Decrypted 24/33 ..."
  W25=$(sed  "s|^.\{,${Cypher[796]}\}||;s|.\{${Cypher[143]}\}$||" <<< "$T")
  echo "Decrypted 25/33 ..."
  W26=$(sed  "s|^.\{,${Cypher[74]}\}||;s|.\{${Cypher[865]}\}$||" <<< "$T")
  echo "Decrypted 26/33 ..."
  W27=$(sed  "s|^.\{,${Cypher[173]}\}||;s|.\{${Cypher[766]}\}$||" <<< "$T")
  echo "Decrypted 27/33 ..."
  W28=$(sed  "s|^.\{,${Cypher[291]}\}||;s|.\{${Cypher[648]}\}$||" <<< "$T")
  echo "Decrypted 28/33 ..."
  W29=$(sed  "s|^.\{,${Cypher[520]}\}||;s|.\{${Cypher[419]}\}$||" <<< "$T")
  echo "Decrypted 29/33 ..."
  W30=$(sed  "s|^.\{,${Cypher[219]}\}||;s|.\{${Cypher[720]}\}$||" <<< "$T")
  echo "Decrypted 30/33 ..."
  W31=$(sed  "s|^.\{,${Cypher[379]}\}||;s|.\{${Cypher[560]}\}$||" <<< "$T")
  echo "Decrypted 31/33 ..."
  W32=$(sed  "s|^.\{,${Cypher[58]}\}||;s|.\{${Cypher[881]}\}$||" <<< "$T")
  echo "Decrypted 32/33 ..."
  W33=$(sed  "s|^.\{,${Cypher[672]}\}||;s|.\{${Cypher[267]}\}$||" <<< "$T")
  echo "Decrypted 33/33 ..."
  W_0="$W01$W02$W03$W04$W05$W06$W07$W08$W09$W10"
  W_1="$W11$W12$W13$W14$W15$W16$W17$W18$W19$W20"
  W_2="$W21$W22$W23$W24$W25$W26$W27$W28$W29$W30"
  W_3="$W31$W32$W33"
  eval MAN="$W_0$W_1$W_2$W_3"
  echo "Donator Address decrypted and composed"
  echo "------------------DONE DECRYPTING DONATOR ADDRESS------------------------"
  echo ""
}
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#Function 1        --- Reading External value Files
FCT.Read_Values () {
  n=1
  while read line; do
  # reading each line
  #echo "Line No. $n : $line"
  eval $VAR_Name$n=$line
  #VAR_echo=$VAR_Name$n
  n=$((n+1))
  #echo "Variabila citita este "${!VAR_echo}
  done < $File_to_be_read

}
#Function 1        --- END Reading External value Files
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
FCT.Transfer () {
  for ((i=1;i<=CL_NO;i++))
  do
    WalletA="MAN$i"
    Value=$VAR_Name$i

    if [ "${!Value}" == "0" ]; then
      echo "==================================================================="
      echo "Wallet "$i" getting skipped"
      echo "==================================================================="
      echo ""
    else
      echo "==================================================================="
      echo "Unlocking Wallet "$i
      echo $PASS | sudo docker exec -i ${Bench} bash -c '/matrix/gman attach /matrix/chaindata/gman.ipc -exec personal.unlockAccount\(\"'${!WalletA}'\"\)'
      ARG1='man.sendTransaction({from:"'${!WalletA}'", to:"'$Target'", value: '${!Value}'})'
      echo "Donating ..."
      sleep 1
      echo $ARG1 | sudo docker exec -i ${Bench} bash -c '/matrix/gman attach /matrix/chaindata/gman.ipc'
      echo "Locking Account ..."
      sudo docker exec -i ${Bench} bash -c '/matrix/gman attach /matrix/chaindata/gman.ipc -exec personal.lockAccount\(\"'${!WalletA}'\"\)'
      echo "5 Second coldown between transfers, please wait ..."
      seq 1 5 | while read i; do echo -en "\r$i seconds..." && sleep 1; done
      echo ""
      echo "==================================================================="
    fi
  done
}
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#Function 3        --- Reading Wallet Values
FCT.Read_WalletValues () {
  echo ""
  echo "--------------------------READING WALLET ADDRESSES-----------------------"
  for ((i=1;i<=CL_NO;i++))
  do
    WalletA="MAN$i"
    echo "Reading Wallet "$i": "${!WalletA}

    Raw_wei=$(sudo docker exec -i ${Bench} bash -c '/matrix/gman attach /matrix/chaindata/gman.ipc -exec man.getBalance\(\"'${!WalletA}'\"\)' | grep -m 1 balance | cut -d" " -f6)
    E_TEST=$(sed 's|[^e]||g' <<< "$Raw_wei")

    if [ "$E_TEST" == "e" ]; then
      Raw_wei_Last2=$(sed -r 's|.*(.{2})|\1|' <<< "$Raw_wei")
      if [ "$Raw_wei_Last2" == "21" ]; then
        Raw_man=$(sudo docker exec -i ${Bench} bash -c '/matrix/gman attach /matrix/chaindata/gman.ipc -exec man.getBalance\(\"'${!WalletA}'\"\)' | grep -m 1 balance | cut -d" " -f6 | sed 's|e.*||' | sed 's|[^0-9]||' | sed 's|^\(.\{4\}\)|\1.|' )
        eval Raw$i=$Raw_man
      elif [ "$Raw_wei_Last2" == "22" ]; then
        Raw_man=$(sudo docker exec -i ${Bench} bash -c '/matrix/gman attach /matrix/chaindata/gman.ipc -exec man.getBalance\(\"'${!WalletA}'\"\)' | grep -m 1 balance | cut -d" " -f6 | sed 's|e.*||' | sed 's|[^0-9]||' | sed 's|^\(.\{5\}\)|\1.|' )
        eval Raw$i=$Raw_man
      elif [ "$Raw_wei_Last2" == "23" ]; then
        Raw_man=$(sudo docker exec -i ${Bench} bash -c '/matrix/gman attach /matrix/chaindata/gman.ipc -exec man.getBalance\(\"'${!WalletA}'\"\)' | grep -m 1 balance | cut -d" " -f6 | sed 's|e.*||' | sed 's|[^0-9]||' | sed 's|^\(.\{6\}\)|\1.|' )
        eval Raw$i=$Raw_man
      elif [ "$Raw_wei_Last2" == "24" ]; then
        Raw_man=$(sudo docker exec -i ${Bench} bash -c '/matrix/gman attach /matrix/chaindata/gman.ipc -exec man.getBalance\(\"'${!WalletA}'\"\)' | grep -m 1 balance | cut -d" " -f6 | sed 's|e.*||' | sed 's|[^0-9]||' | sed 's|^\(.\{7\}\)|\1.|' )
        eval Raw$i=$Raw_man
      elif [ "$Raw_wei_Last2" == "25" ]; then
        Raw_man=$(sudo docker exec -i ${Bench} bash -c '/matrix/gman attach /matrix/chaindata/gman.ipc -exec man.getBalance\(\"'${!WalletA}'\"\)' | grep -m 1 balance | cut -d" " -f6 | sed 's|e.*||' | sed 's|[^0-9]||' | sed 's|^\(.\{8\}\)|\1.|' )
        eval Raw$i=$Raw_man
      elif [ "$Raw_wei_Last2" == "26" ]; then
        Raw_man=$(sudo docker exec -i ${Bench} bash -c '/matrix/gman attach /matrix/chaindata/gman.ipc -exec man.getBalance\(\"'${!WalletA}'\"\)' | grep -m 1 balance | cut -d" " -f6 | sed 's|e.*||' | sed 's|[^0-9]||' | sed 's|^\(.\{9\}\)|\1.|' )
        eval Raw$i=$Raw_man
      fi
    else
      Raw_man=`echo "scale=18; $Raw_wei / 1000000000000000000" | bc`
      eval Raw$i=$Raw_man
    fi
  done
  echo "---------------------DONE READING WALLET ADDRESSES-----------------------"
  echo ""
}
#Function 3        --- END Reading Wallet Values
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#Function 4        --- Exporting RAW Wallet Values
FCT.Export_WalletValues () {
  for ((i=1;i<=CL_NO;i++))
  do
    RAW="Raw"$i
    echo "${!RAW}" >> $W3
  done
}
#Function 4        --- END Exporting RAW Wallet Values
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#Function 5        --- Latency
FCT.Latency () {
  echo $Type" latency detected, Cooldown period "$Duration" seconds, please wait ..."
  seq 1 $Duration | while read i; do echo -en "\r$i seconds..." && sleep 1; done
  echo ""
  echo ""
}
#Function 5        --- END Latency
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#Function 6        --- Donate and Transfer
FCT.Donate_and_Transfer () {

  File_to_be_read='Computed_Summ_Donations.comp'
  VAR_Name='SD'
  FCT.Read_Values

  if [ "${SD1}" != "0" ] ; then
    #Importing computed Donation-values.
    echo "Importing Python Computed Donation values..."
    File_to_be_read='Computed_Values_Donations.comp'
    VAR_Name='Donation'
    FCT.Read_Values
    echo "DONE Importing Python Computed Donation values..."
    echo ""
    #DONE Importing computed Donation-values.

    #Importing computed Transfer-values.
    echo "Importing Python Computed Transfer values..."
    File_to_be_read='Computed_Values_Transfers.comp'
    VAR_Name='Transfer'
    FCT.Read_Values
    echo "DONE Importing Python Computed Transfer values..."
    echo ""
    #DONE Importing computed Transfer-values.


    #Starting Donating Loop
    echo "--------------------------------DONATING:--------------------------------"
    VAR_Name='Donation'
    Target=$MAN
    FCT.Transfer
    echo "------------------------------DONE DONATING------------------------------"
    echo ""
    #END Donating Loop

    Type='Donation'
    Duration='30'
    FCT.Latency

    #Starting Transfer Loop
    echo "--------------------------------DRAINING:--------------------------------"
    VAR_Name='Transfer'
    Target=$MAN0
    FCT.Transfer
    echo "------------------------------DONE DRAINING------------------------------"
    echo ""
    #END Transfer Loop
  else
    echo "Wallets are Empty, nothing to move ..."
    echo ""
  fi
}
#Function 6        --- END Donate and Transfer
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

echo "First step is decrypting Donator Address"
read -p "Press Enter to continue!"
FCT.Decryptor

echo "Donation and Trimming address is computed"
echo "Transfer addres is "$MAN0
echo "Do you agree ? If NO, press CTRL+C to cancel, if you agree,"
read -p "Press Enter to continue!"

STrimming1=1
#TRIMMING PART =================================================================

while [ "$STrimming1" != "0" ]
do
  FCT.Read_WalletValues
  FCT.Export_WalletValues

  #Running the Python python_computer
  echo "--------------------------Computed Values below -------------------------"
  ./PyComp_v1.py
  read -p "Press Enter to continue!"
  echo "--------------------------Computed Values above -------------------------"
  #Done running Python python_computer

  #Importing computed S_Trim-values.
  #echo "Importing Python Computed Total Trim values..."
  File_to_be_read='Computed_Summ_Trimms.comp'
  VAR_Name='STrimming'
  FCT.Read_Values
  #echo "DONE Importing Python Computed Total Trim values..."
  echo ""
  #Done Importing computed S_Trim-values.

  if [ "${STrimming1}" == "0" ]; then
    echo "No Trimming necesarry..."
    echo ""
    sleep 2
    echo "Moving to Donation and Transfers..."
    echo ""
    sleep 2
    File_to_be_read='Computed_Summ_Trimms.comp'
    VAR_Name='TR'
    FCT.Read_Values
    #Donate and Transfer with no Trimming
    FCT.Donate_and_Transfer
    #END Donate and Transfer with no Trimming
    break
  else
    #Importing computed Trim-values.
    #echo "Importing Python Computed Trim values..."
    File_to_be_read='Computed_Values_Trimms.comp'
    VAR_Name='Trimming'
    FCT.Read_Values
    File_to_be_read='Computed_Summ_Trimms.comp'
    VAR_Name='TR'
    FCT.Read_Values
    #echo "DONE Importing Python Computed Trim values..."
    #echo ""
    #Done Importing computed Trim-values.

    #Starting Trimming Loop
    echo "--------------------------------Trimming:--------------------------------"
    VAR_Name='Trimming'
    Target=$MAN
    FCT.Transfer
    echo "------------------------------DONE Trimming------------------------------"
    echo ""
    #END Donating Loop

    Type='Trimming'
    Duration='60'
    FCT.Latency

    #Donate and Transfer after Trimming
    FCT.Read_WalletValues
    if [ -a $W3 ]; then
      rm $W3
    fi
    touch $W3
    FCT.Export_WalletValues
    #Running the Python python_computer
    echo "--------------------------Computed Values below -------------------------"
    ./PyComp_v1.py
    read -p "Press Enter to continue!"
    echo "--------------------------Computed Values above -------------------------"
    #Done running Python python_computer
    FCT.Donate_and_Transfer
    #END Donate and Transfer after Trimming
    break
  fi
done

#Printing RESULTS
File_to_be_read='Computed_Summ_Donations.comp'
VAR_Name='SD'
FCT.Read_Values

File_to_be_read='Computed_Summ_Transfers.comp'
VAR_Name='ST'
FCT.Read_Values

echo ""
echo "================================Results:================================="
echo "Trimm and Donate addres used is encrypted"
echo "Transfer address used was "$MAN0
echo "-----------------"
echo "A total of "$TR1" MAN has been trimmed to the encrypted address"
echo "A total of "$SD1" MAN has been donated to the encrypted address"
echo "A total of "$ST1" MAN has been transfered"
