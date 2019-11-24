A)Description:
This Script works by leveraging Disarmm's dockerized gman (which runs through a container), to drain multiple MAN Addresses, to a single Address of choice.

B)Requirements:
--Disarmms containerized gman working and running, with the node synced
--bc module installed (for the math computation), if you dont have it, simply run "sudo apt-get install bc"

*Do note that the computation are actually done through Python using the decimal module.

C)What you need to add to the script in order to make it actually work
C.1)Add destination address, this is the variable MAN0, (on line 54)
C.2)Add as many Addresses as you need to drain, variabile MAN1 through MAN100 (lines 56 through 155)
C.3)Specify their number, variable CL_NO, line 11
C.4)Specify the name of the container running gman, that will do the heavy lifting
    Variable Bench, line 12

D)Keystore Preparation
D1)Create all keystores from WebWallet, which represent the Addresses that will be drained
D2)Upon creation, use for all of them the same password
D3)Move all the Keystores to the keystore folder of the gman Container (Container can be kept running)
If you have too many addresses, you can create them in one go, using IPC (See 2nd Script here - WalletSpawner.sh)

E)Starting the Script
E1)Upon starting the script, a prompt will appear to notify you that the Script donates 0.1 % off all transferable MAN to AncientHodler
This allows AncientHodler to continue developing the Script and make improvements for it.
IF YOU DONT AGREE WITH THIS, YOU CAN CANCEL AT THIS POINT, OR MODIFY SCRIPT AT YOUR OWN RISK.
E2)The script will prompt you to enter the Keystores Password
E3)It then proceeds to decrypt the Donation address. This process takes aprox 40 seconds.


  Each address requires at minimum 0.01 MAN for the transfers to be initiated.
  If the amounts detected have more than 2 decimals, the amounts will be trimmed first.
  Trimming means the minimum value is computed that must be removed in order to create a 2 decimal value of MAN on said address.
  This is required because, even though python can compute the values properly up the the last 18th decimal,
    if the MAN value has two many decimals, IPC will fail to transfer such amount, even though the web wallet is perfectly able to transfer the exact same amounts.

E4)If a transferable amount of MAN is detected on at least one of the addresses, the script starts to compute required amounts
  The amounts to be trimmed, if trimm is required
  The amounts to be donated,
  The amounts to be drained.
E5)The script will then proceed to send trim transaction, if the are required
E6)If no trim transactions are required, Donations will be sent First
E8)After donations are sent, the rest of the MAN will be drained to the destination Address MAN0

E9)After all operations are done, a summary will be posted with the amounts trimmed, donated and amounts drained.
E10)If no transferable amount is detected on any of the addresses, the script will display that the addresses are empty

HISTORY
=======
MAN_Drainer_v1
First Version leveraging Bash Functions and Python decimal to transfer (using trimming if required) any amount greater than 0.01 MAN from multiple addresses in a go

=======

Copyright AncientHodler:
The Donation cost is set to 0.1%.
Your Donations are appreciated, and allows me to continue maintaining this script, add new features and improve it.
