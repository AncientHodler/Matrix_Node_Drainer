#!/usr/bin/env python3
from decimal import *

WEI = Decimal(10) ** 18
MAN_Precision = Decimal(10) ** -18
WEI_Precision = Decimal(10) ** 1
TRIM = Decimal(10) ** 16

def print_list(items):
    for x in items:
        print (x)
    return

def Read_Single_Value(x):
    single_list_int = []
    sum = 0
    with open(x, 'r') as filehandle:
        list_string = [line.rstrip('\n') for line in open(x)]
    for i in list_string:
        i = int(i)
        single_list_int.append(i)
    for i in single_list_int:
        sum = sum + i
    value = Decimal(sum)
    return value

#Reads a list of Man Values from a file and transforms them to a list of WEI values
def ReadMAN2WEI(x):
# citit fisier intro lista de stringuri
    with open(x, 'r') as filehandle:
        list_string = [line.rstrip('\n') for line in open(x)]
# decimalizat list
    list_decimal = []
    for i in list_string:
        i = Decimal(i)
        i = Decimal(i * WEI).quantize(WEI_Precision)
        list_decimal.append(i)
    return list_decimal

#Uses MAN as computing Values
def python_computer(items):
    list_trim = []
    list_donation = []
    list_transfer = []
    Threshold = Decimal("0.01") * (Decimal(10) ** 18)
    Rest, Trimv, Donation, Transfer = 0, 0, 0, 0
    for x in items:
        if x > Threshold:
            Trimv = Decimal_checker(x)
            Rest = Decimal(x - Trimv).quantize(WEI_Precision, rounding=ROUND_UP)
            Rest = Decimal(Rest - Double_GAS_Cost_wei).quantize(WEI_Precision, rounding=ROUND_UP)
            Donation = Decimal((Rest * DON_Value) / 1000).quantize(WEI_Precision, rounding=ROUND_UP)
            Transfer = Decimal(Rest - Donation).quantize(WEI_Precision, rounding=ROUND_UP)
        else:
            Trimv = 0
            Donation = 0
            Transfer = 0
        list_trim.append(Trimv)
        list_donation.append(Donation)
        list_transfer.append(Transfer)
    return list_trim, list_donation, list_transfer

#Adds WEI values and outputs MAN values
def sum_list_MAN(items):
    sum_numbers = 0
    #print ("Amounts above 1000 MAN are:")
    for x in items:
        #print (x)
        sum_numbers += x
    sum_numbers = Decimal(sum_numbers / WEI).quantize(MAN_Precision)
    return sum_numbers

#Takes WEI values and outputs them as MAN values to an outer file
def Write_MAN_Values(name, list):
    f = open(name, "w+")
    for i in list:
        if i == 0:
            x = 0
            f.write(str(x) + '\n')
        else:
            x = Decimal(i / WEI).quantize(MAN_Precision)
            f.write(str(x) + '\n')
    f.close()
    return

def Write_WEI_Values(name, list):
    f = open(name, "w+")
    for i in list:
        if i == 0:
            x = 0
            f.write(str(x) + '\n')
        else:
            x = Decimal(i).quantize(WEI_Precision)
            f.write(str(x) + '\n')
    f.close()
    return

def Write_WEI_Value(name, value):
    f = open(name, "w+")
    value = Decimal(value).quantize(WEI_Precision)
    f.write(str(value) + '\n')
    f.close()
    return

def Write_MAN_Value(name, value):
    f = open(name, "w+")
    value = Decimal(value).quantize(MAN_Precision)
    f.write(str(value) + '\n')
    f.close()
    return

def Decimal_checker(x):
    modulo, trim_value = 0, 0
    modulo = x % TRIM
    if modulo == 0:
        trim_value = 0
    else:
        x = Decimal(x - GAS_Cost_wei).quantize(WEI_Precision)
        trim_value = Decimal(x % TRIM).quantize(WEI_Precision)
    return trim_value

GAS_Value = Read_Single_Value("GAS.value")
DON_Value = Read_Single_Value("DON.value")
GAS = Decimal("21000")

GAS_Cost_wei = Decimal(GAS_Value * GAS).quantize(WEI_Precision, rounding=ROUND_UP)
GAS_Cost_man = Decimal(GAS_Cost_wei * MAN_Precision).quantize(MAN_Precision, rounding=ROUND_UP)
Double_GAS_Cost_wei = Decimal(GAS_Cost_wei * 2).quantize(WEI_Precision, rounding=ROUND_UP)

WEI_List = ReadMAN2WEI("MAN.values")
L_trim, L_donn, L_tran = python_computer(WEI_List)

L_trim_Summ = sum_list_MAN(L_trim)
L_donn_Summ = sum_list_MAN(L_donn)
L_tran_Summ = sum_list_MAN(L_tran)

Name1='Computed_Summ_Trimms.comp'
Name2='Computed_Summ_Donations.comp'
Name3='Computed_Summ_Transfers.comp'
Name4='Computed_Values_Trimms.comp'
Name5='Computed_Values_Donations.comp'
Name6='Computed_Values_Transfers.comp'

if L_trim_Summ == 0:
    Write_WEI_Value(Name1, L_trim_Summ)
    print("Summ of Trimmings in MAN will be:")
    print(Decimal(L_trim_Summ).quantize(WEI_Precision))
    print("")
else:
    Write_MAN_Value(Name1, L_trim_Summ)
    print("Summ of Trimmings in MAN will be:")
    print(Decimal(L_trim_Summ).quantize(MAN_Precision))
    print("")

if L_donn_Summ == 0:
    Write_WEI_Value(Name2, L_donn_Summ)
    print("Summ of Donations in MAN will be:")
    print(Decimal(L_donn_Summ).quantize(WEI_Precision))
    print("")
else:
    Write_MAN_Value(Name2, L_donn_Summ)
    print("Summ of Donations in MAN will be:")
    print(Decimal(L_donn_Summ).quantize(MAN_Precision))
    print("")

if L_tran_Summ == 0:
    Write_WEI_Value(Name3, L_tran_Summ)
    print("Summ of Transfers in MAN will be:")
    print(Decimal(L_tran_Summ).quantize(WEI_Precision))
    print("")
else:
    Write_MAN_Value(Name3, L_tran_Summ)
    print("Summ of Transfers in MAN will be:")
    print(Decimal(L_tran_Summ).quantize(MAN_Precision))
    print("")

Write_WEI_Values(Name4, L_trim)
Write_WEI_Values(Name5, L_donn)
Write_WEI_Values(Name6, L_tran)
