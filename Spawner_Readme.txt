A)Description:
This Script works by leveraging Disarmm's dockerized gman (which runs through a container), to create multiple keystores in a go.
Usefull if you have to many Keystores that need to be created, which would take to much time using the Web Wallet

B)Requirements:
--Disarmms containerized gman working and running, it doesnt need to be synced.

C)What you need to add to the script in order to make it actually work
C.1)Add the private keys of the addresses you need to swapn the keystore for
C.2)Add as many Addresses as you need to create keystores for
C.3)Specify their number, variable CL_NO, line 24
C.4)Specify the name of the container running gman, that will do the heavy lifting
    Variable Bench, line 25
C.5)Specify the password the Keystores will be create with

E)Starting the Script
Starting the script creates the Keystores, provided the containerized gman works properly

Copyright AncientHodler
