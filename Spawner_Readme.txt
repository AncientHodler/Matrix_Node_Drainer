A)Description:
This Script works by leveraging Disarmm's dockerized gman (which runs through a container), to create multiple keystores in a go.
Usefull if you have to many Keystores that need to be created, which would take to much time using the Web Wallet

B)Requirements:
--Disarmms containerized gman working and running, it doesnt need to be synced.

========================================

C)How to use the Script
As the script starts, it will as if you want to generate MAN Keystores either by
  a)using already known private keys, or
  b)have the script generate random private keys on the fly

1)First Question
First version is chosen by answering the first question with
  existent
Second version is chosen by answering first question with
  random

2)Second Question
The Script asks the name of the container that will make the Keystore files.

3)Third question
The Script asks the password with which the Keystore files will be created.
Note that all Keystore files will have this same password.

4)Fourth question
The Script asks how many Keystores you actually want to create.

5)Fifth Question
Next the script asks the number with which it will start printing the public Keys in an output file in a format,
that can be copy pasted to to the Balance and Drainer Scripts.
If you don't know what to use, type 1
If you already have 5 addresses lets say already in the Balance and Transfer Scripts, you want these newly created addresses to start with 6
So you type 6.
Similarly, if you have already 100 addresses, the next address in line is 101, so you type 101

6)Last Questions
If the script runs with the first option, it will then proceed to ask for private keys,
and you will have to type in as many private keys as you answered previously you want Keystore files to be created.
You will have to input the private keys either by typing them in, or using copy paste into the terminal window

If the Script runs with the second option, it will generate itself random private keys

========================================

Further Considerations:

The Keystore Files will be created inside the Keystore folder of the container that will be used for the spawining of Keysore.
I recommend, you empty this folder before you run the script. Just copy paste the current Keystore files somewhere else,
and leave this folder empty, before you start the Spawner Script.
This way you will know all Keystore files that will exist here after the Spawner Script was ran, are the Keystore Files created by the SCRIPT

Due note that a peculiar observed behavior is that sometimes gman creates some temporary Keystore files,
these have an extension .tmpxxxxxxxxxxxx (where xxxx are some random numbers)
You can ignore these, and delete them (if you can, i cant seem to be able to delete them)

Apart from these temprorary files, if the Keystore Folder was empty before the Spawner was ran, all the Keystore files that will be here,
are the Keystore files created by the Script. You can then proceed to copy them somewhere else, Or leave them here.
I recommend copying them somewhere else.

The Script also outputs, as it creates the Keystores, 3 Output files, these are based on Date
The reason for this is that they wont get overwritten, if you will be running the Script again.

1)First file created, starts with "Private_Keys_"
Here the private keys will be output-ed, regardless if they were input-ed manually or generated randomly.
2)Second file created, starts with "Public_Keys_"
Here the resulting public keys will be output-ed
3)Third file created, starts with "Public_Keys_4Script_"
Here the public Keys will also be exported, in a format that can be directly copied in the Balance and Draining Scripts.


Copyright AncientHodler
