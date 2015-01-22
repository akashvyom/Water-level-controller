EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:promini
LIBS:pcbWaterFinal-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "9 oct 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L POWERIN U5
U 1 1 542AACE6
P 8400 2400
F 0 "U5" H 8800 3300 60  0000 C CNN
F 1 "POWERIN" H 8800 3550 60  0000 C CNN
F 2 "" H 8400 2400 60  0000 C CNN
F 3 "" H 8400 2400 60  0000 C CNN
	1    8400 2400
	1    0    0    -1  
$EndComp
$Comp
L US U4
U 1 1 542AAD2C
P 7800 4400
F 0 "U4" H 7950 4450 60  0000 C CNN
F 1 "US" H 7950 4550 60  0000 C CNN
F 2 "~" H 7800 4400 60  0000 C CNN
F 3 "~" H 7800 4400 60  0000 C CNN
	1    7800 4400
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR01
U 1 1 542AAD46
P 7800 4050
F 0 "#PWR01" H 7800 4150 30  0001 C CNN
F 1 "VCC" H 7800 4150 30  0000 C CNN
F 2 "" H 7800 4050 60  0000 C CNN
F 3 "" H 7800 4050 60  0000 C CNN
	1    7800 4050
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR02
U 1 1 542AAD5A
P 7700 4350
F 0 "#PWR02" H 7700 4350 30  0001 C CNN
F 1 "GND" H 7700 4280 30  0001 C CNN
F 2 "" H 7700 4350 60  0000 C CNN
F 3 "" H 7700 4350 60  0000 C CNN
	1    7700 4350
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR03
U 1 1 542AAD8D
P 6950 3850
F 0 "#PWR03" H 6950 3950 30  0001 C CNN
F 1 "VCC" H 6950 3950 30  0000 C CNN
F 2 "" H 6950 3850 60  0000 C CNN
F 3 "" H 6950 3850 60  0000 C CNN
	1    6950 3850
	0    1    1    0   
$EndComp
$Comp
L GND #PWR04
U 1 1 542AADA7
P 6100 3850
F 0 "#PWR04" H 6100 3850 30  0001 C CNN
F 1 "GND" H 6100 3780 30  0001 C CNN
F 2 "" H 6100 3850 60  0000 C CNN
F 3 "" H 6100 3850 60  0000 C CNN
	1    6100 3850
	0    1    1    0   
$EndComp
$Comp
L RTCDS1307 U3
U 1 1 542AADE0
P 7700 5650
F 0 "U3" H 8200 6200 60  0000 C CNN
F 1 "RTCDS1307" H 8250 6350 60  0000 C CNN
F 2 "" H 7700 5650 60  0000 C CNN
F 3 "" H 7700 5650 60  0000 C CNN
	1    7700 5650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 542AAE0E
P 7600 4850
F 0 "#PWR05" H 7600 4850 30  0001 C CNN
F 1 "GND" H 7600 4780 30  0001 C CNN
F 2 "" H 7600 4850 60  0000 C CNN
F 3 "" H 7600 4850 60  0000 C CNN
	1    7600 4850
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR06
U 1 1 542AAE1D
P 7600 4950
F 0 "#PWR06" H 7600 5050 30  0001 C CNN
F 1 "VCC" H 7600 5050 30  0000 C CNN
F 2 "" H 7600 4950 60  0000 C CNN
F 3 "" H 7600 4950 60  0000 C CNN
	1    7600 4950
	0    -1   -1   0   
$EndComp
$Comp
L RALAY5V U1
U 1 1 542AAE96
P 4450 4100
F 0 "U1" H 4700 4350 60  0000 C CNN
F 1 "RALAY5V" H 4700 4450 60  0000 C CNN
F 2 "~" H 4450 4100 60  0000 C CNN
F 3 "~" H 4450 4100 60  0000 C CNN
	1    4450 4100
	1    0    0    -1  
$EndComp
$Comp
L NPN Q1
U 1 1 542AAEAD
P 3800 4150
F 0 "Q1" H 3800 4000 50  0000 R CNN
F 1 "NPN" H 3800 4300 50  0000 R CNN
F 2 "~" H 3800 4150 60  0000 C CNN
F 3 "~" H 3800 4150 60  0000 C CNN
	1    3800 4150
	0    -1   -1   0   
$EndComp
$Comp
L R R1
U 1 1 542AAECD
P 3800 4650
F 0 "R1" V 3880 4650 40  0000 C CNN
F 1 "R" V 3807 4651 40  0000 C CNN
F 2 "~" V 3730 4650 30  0000 C CNN
F 3 "~" H 3800 4650 30  0000 C CNN
	1    3800 4650
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR07
U 1 1 542AAF7E
P 4450 4250
F 0 "#PWR07" H 4450 4250 30  0001 C CNN
F 1 "GND" H 4450 4180 30  0001 C CNN
F 2 "" H 4450 4250 60  0000 C CNN
F 3 "" H 4450 4250 60  0000 C CNN
	1    4450 4250
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR08
U 1 1 542AAFF6
P 4900 3500
F 0 "#PWR08" H 4900 3600 30  0001 C CNN
F 1 "VCC" H 4900 3600 30  0000 C CNN
F 2 "" H 4900 3500 60  0000 C CNN
F 3 "" H 4900 3500 60  0000 C CNN
	1    4900 3500
	1    0    0    -1  
$EndComp
$Comp
L DIODE D1
U 1 1 542AB024
P 4650 3200
F 0 "D1" H 4650 3300 40  0000 C CNN
F 1 "DIODE" H 4650 3100 40  0000 C CNN
F 2 "~" H 4650 3200 60  0000 C CNN
F 3 "~" H 4650 3200 60  0000 C CNN
	1    4650 3200
	1    0    0    -1  
$EndComp
Text Label 4050 4650 0    28   ~ 0
TORELOUT
Text Label 6000 3950 0    28   ~ 0
TORELOUT
$Comp
L POT RV1
U 1 1 542AB0E8
P 5650 4250
F 0 "RV1" H 5650 4150 50  0000 C CNN
F 1 "10K" H 5650 4250 50  0000 C CNN
F 2 "~" H 5650 4250 60  0000 C CNN
F 3 "~" H 5650 4250 60  0000 C CNN
	1    5650 4250
	-1   0    0    1   
$EndComp
Text Label 5650 4400 0    28   ~ 0
V0
Text Label 5750 6200 0    28   ~ 0
V0
$Comp
L VCC #PWR09
U 1 1 542AB3EB
P 5900 6300
F 0 "#PWR09" H 5900 6400 30  0001 C CNN
F 1 "VCC" H 5900 6400 30  0000 C CNN
F 2 "" H 5900 6300 60  0000 C CNN
F 3 "" H 5900 6300 60  0000 C CNN
	1    5900 6300
	0    1    1    0   
$EndComp
$Comp
L GND #PWR010
U 1 1 542AB3FA
P 5950 6400
F 0 "#PWR010" H 5950 6400 30  0001 C CNN
F 1 "GND" H 5950 6330 30  0001 C CNN
F 2 "" H 5950 6400 60  0000 C CNN
F 3 "" H 5950 6400 60  0000 C CNN
	1    5950 6400
	0    -1   -1   0   
$EndComp
$Comp
L PROMINI P1
U 1 1 542AAB35
P 6200 4650
F 0 "P1" H 6500 5250 60  0000 C CNN
F 1 "PROMINI" H 6500 5350 60  0000 C CNN
F 2 "~" H 6200 4650 60  0000 C CNN
F 3 "~" H 6200 4650 60  0000 C CNN
	1    6200 4650
	1    0    0    -1  
$EndComp
Text Label 6200 4450 0    28   ~ 0
D7
Text Label 5750 5100 0    28   ~ 0
D7
Text Label 5750 5300 0    28   ~ 0
D5
Text Label 6200 4550 0    28   ~ 0
D5
$Comp
L GND #PWR012
U 1 1 542AB694
P 5400 4350
F 0 "#PWR012" H 5400 4350 30  0001 C CNN
F 1 "GND" H 5400 4280 30  0001 C CNN
F 2 "" H 5400 4350 60  0000 C CNN
F 3 "" H 5400 4350 60  0000 C CNN
	1    5400 4350
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR013
U 1 1 542AB6A3
P 5900 4350
F 0 "#PWR013" H 5900 4450 30  0001 C CNN
F 1 "VCC" H 5900 4450 30  0000 C CNN
F 2 "" H 5900 4350 60  0000 C CNN
F 3 "" H 5900 4350 60  0000 C CNN
	1    5900 4350
	-1   0    0    1   
$EndComp
NoConn ~ 6800 3750
NoConn ~ 6200 3650
NoConn ~ 6200 3750
NoConn ~ 6200 3550
NoConn ~ 4673 3600
$Comp
L PWR_FLAG #FLG014
U 1 1 542AB7FD
P 3100 1500
F 0 "#FLG014" H 3100 1595 30  0001 C CNN
F 1 "PWR_FLAG" H 3100 1680 30  0000 C CNN
F 2 "" H 3100 1500 60  0000 C CNN
F 3 "" H 3100 1500 60  0000 C CNN
	1    3100 1500
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG015
U 1 1 542AB80C
P 3350 1500
F 0 "#FLG015" H 3350 1595 30  0001 C CNN
F 1 "PWR_FLAG" H 3350 1680 30  0000 C CNN
F 2 "" H 3350 1500 60  0000 C CNN
F 3 "" H 3350 1500 60  0000 C CNN
	1    3350 1500
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR016
U 1 1 542AB81B
P 3100 1650
F 0 "#PWR016" H 3100 1750 30  0001 C CNN
F 1 "VCC" H 3100 1750 30  0000 C CNN
F 2 "" H 3100 1650 60  0000 C CNN
F 3 "" H 3100 1650 60  0000 C CNN
	1    3100 1650
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR017
U 1 1 542AB82A
P 3350 1700
F 0 "#PWR017" H 3350 1700 30  0001 C CNN
F 1 "GND" H 3350 1630 30  0001 C CNN
F 2 "" H 3350 1700 60  0000 C CNN
F 3 "" H 3350 1700 60  0000 C CNN
	1    3350 1700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR018
U 1 1 542AC974
P 6700 3650
F 0 "#PWR018" H 6700 3650 30  0001 C CNN
F 1 "GND" H 6700 3580 30  0001 C CNN
F 2 "" H 6700 3650 60  0000 C CNN
F 3 "" H 6700 3650 60  0000 C CNN
	1    6700 3650
	0    1    1    0   
$EndComp
$Comp
L BUTTON B1
U 1 1 542B1057
P 6250 5000
F 0 "B1" H 6450 5050 60  0000 C CNN
F 1 "BUTTON" H 6450 5150 60  0000 C CNN
F 2 "" H 6250 5000 60  0000 C CNN
F 3 "" H 6250 5000 60  0000 C CNN
	1    6250 5000
	1    0    0    -1  
$EndComp
$Comp
L BUTTON B2
U 1 1 542B1067
P 6250 5300
F 0 "B2" H 6450 5350 60  0000 C CNN
F 1 "BUTTON" H 6450 5450 60  0000 C CNN
F 2 "" H 6250 5300 60  0000 C CNN
F 3 "" H 6250 5300 60  0000 C CNN
	1    6250 5300
	1    0    0    -1  
$EndComp
$Comp
L BUTTON B3
U 1 1 542B1076
P 6250 5600
F 0 "B3" H 6450 5650 60  0000 C CNN
F 1 "BUTTON" H 6450 5750 60  0000 C CNN
F 2 "" H 6250 5600 60  0000 C CNN
F 3 "" H 6250 5600 60  0000 C CNN
	1    6250 5600
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR019
U 1 1 542B1085
P 6250 4900
F 0 "#PWR019" H 6250 5000 30  0001 C CNN
F 1 "VCC" H 6250 5000 30  0000 C CNN
F 2 "" H 6250 4900 60  0000 C CNN
F 3 "" H 6250 4900 60  0000 C CNN
	1    6250 4900
	0    -1   -1   0   
$EndComp
$Comp
L VCC #PWR020
U 1 1 542B1099
P 6250 5200
F 0 "#PWR020" H 6250 5300 30  0001 C CNN
F 1 "VCC" H 6250 5300 30  0000 C CNN
F 2 "" H 6250 5200 60  0000 C CNN
F 3 "" H 6250 5200 60  0000 C CNN
	1    6250 5200
	0    -1   -1   0   
$EndComp
$Comp
L VCC #PWR021
U 1 1 542B10B2
P 6250 5500
F 0 "#PWR021" H 6250 5600 30  0001 C CNN
F 1 "VCC" H 6250 5600 30  0000 C CNN
F 2 "" H 6250 5500 60  0000 C CNN
F 3 "" H 6250 5500 60  0000 C CNN
	1    6250 5500
	0    -1   -1   0   
$EndComp
$Comp
L MARKER U6
U 1 1 542B80E0
P 2650 2900
F 0 "U6" H 2850 2950 60  0000 C CNN
F 1 "MARKER" H 2850 3000 60  0000 C CNN
F 2 "" H 2650 2900 60  0000 C CNN
F 3 "" H 2650 2900 60  0000 C CNN
	1    2650 2900
	1    0    0    -1  
$EndComp
$Comp
L MARKER U8
U 1 1 542B80EF
P 2800 3150
F 0 "U8" H 3000 3200 60  0000 C CNN
F 1 "MARKER" H 3000 3250 60  0000 C CNN
F 2 "" H 2800 3150 60  0000 C CNN
F 3 "" H 2800 3150 60  0000 C CNN
	1    2800 3150
	1    0    0    -1  
$EndComp
$Comp
L MARKER U9
U 1 1 542B80FE
P 2800 3400
F 0 "U9" H 3000 3450 60  0000 C CNN
F 1 "MARKER" H 3000 3500 60  0000 C CNN
F 2 "" H 2800 3400 60  0000 C CNN
F 3 "" H 2800 3400 60  0000 C CNN
	1    2800 3400
	1    0    0    -1  
$EndComp
$Comp
L MARKER U7
U 1 1 542B810D
P 2750 3600
F 0 "U7" H 2950 3650 60  0000 C CNN
F 1 "MARKER" H 2950 3700 60  0000 C CNN
F 2 "" H 2750 3600 60  0000 C CNN
F 3 "" H 2750 3600 60  0000 C CNN
	1    2750 3600
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 54317DFF
P 7350 5600
F 0 "R2" V 7430 5600 40  0000 C CNN
F 1 "330" V 7357 5601 40  0000 C CNN
F 2 "~" V 7280 5600 30  0000 C CNN
F 3 "~" H 7350 5600 30  0000 C CNN
	1    7350 5600
	0    -1   -1   0   
$EndComp
$Comp
L R R3
U 1 1 54317E18
P 7350 5750
F 0 "R3" V 7430 5750 40  0000 C CNN
F 1 "330" V 7357 5751 40  0000 C CNN
F 2 "~" V 7280 5750 30  0000 C CNN
F 3 "~" H 7350 5750 30  0000 C CNN
	1    7350 5750
	0    -1   -1   0   
$EndComp
$Comp
L R R4
U 1 1 54317E27
P 7350 5900
F 0 "R4" V 7430 5900 40  0000 C CNN
F 1 "330" V 7357 5901 40  0000 C CNN
F 2 "~" V 7280 5900 30  0000 C CNN
F 3 "~" H 7350 5900 30  0000 C CNN
	1    7350 5900
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR022
U 1 1 54317E4C
P 7600 5600
F 0 "#PWR022" H 7600 5600 30  0001 C CNN
F 1 "GND" H 7600 5530 30  0001 C CNN
F 2 "" H 7600 5600 60  0000 C CNN
F 3 "" H 7600 5600 60  0000 C CNN
	1    7600 5600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR023
U 1 1 54317E5B
P 7600 5750
F 0 "#PWR023" H 7600 5750 30  0001 C CNN
F 1 "GND" H 7600 5680 30  0001 C CNN
F 2 "" H 7600 5750 60  0000 C CNN
F 3 "" H 7600 5750 60  0000 C CNN
	1    7600 5750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR024
U 1 1 54317E6A
P 7600 5900
F 0 "#PWR024" H 7600 5900 30  0001 C CNN
F 1 "GND" H 7600 5830 30  0001 C CNN
F 2 "" H 7600 5900 60  0000 C CNN
F 3 "" H 7600 5900 60  0000 C CNN
	1    7600 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 2600 8650 3550
Wire Wire Line
	8650 3550 6800 3550
Wire Wire Line
	7800 4350 7700 4350
Wire Wire Line
	6800 3950 7450 3950
Wire Wire Line
	7450 3950 7450 4150
Wire Wire Line
	7450 4150 7800 4150
Wire Wire Line
	7800 4250 7350 4250
Wire Wire Line
	7350 4250 7350 4050
Wire Wire Line
	7350 4050 6800 4050
Wire Wire Line
	6800 3850 6950 3850
Wire Wire Line
	6100 3850 6200 3850
Wire Wire Line
	7700 5050 7250 5050
Wire Wire Line
	7250 5050 7250 4150
Wire Wire Line
	7250 4150 6800 4150
Wire Wire Line
	6800 4250 7100 4250
Wire Wire Line
	7100 4250 7100 5150
Wire Wire Line
	7100 5150 7700 5150
Wire Wire Line
	7700 4850 7600 4850
Wire Wire Line
	7600 4950 7700 4950
Wire Wire Line
	6800 4350 7000 4350
Wire Wire Line
	7000 4350 7000 5250
Wire Wire Line
	7000 5250 7700 5250
Wire Wire Line
	4450 4250 4000 4050
Wire Wire Line
	3800 4350 3550 4650
Wire Wire Line
	6000 3950 6200 3950
Wire Wire Line
	3600 4050 4050 3950
Wire Wire Line
	4050 3950 4450 3600
Wire Wire Line
	4900 3600 4900 3500
Wire Wire Line
	4450 3600 4450 3200
Wire Wire Line
	4850 3200 5200 3650
Wire Wire Line
	5200 3650 4900 3600
Wire Wire Line
	5750 6300 5900 6300
Wire Wire Line
	5750 5200 6050 5200
Wire Wire Line
	6050 5200 6050 4050
Wire Wire Line
	6050 4050 6200 4050
Wire Wire Line
	5750 5400 6100 5400
Wire Wire Line
	6100 5400 6100 4250
Wire Wire Line
	6100 4250 6200 4250
Wire Wire Line
	5750 5900 6150 5900
Wire Wire Line
	6150 5900 6150 4350
Wire Wire Line
	6150 4350 6200 4350
Wire Wire Line
	5750 6100 6950 6100
Wire Wire Line
	6950 6100 6950 4450
Wire Wire Line
	6950 4450 6800 4450
Wire Wire Line
	5900 4250 5900 4350
Wire Wire Line
	5400 4250 5400 4350
Wire Wire Line
	3350 1500 3350 1700
Wire Wire Line
	3100 1500 3100 1650
Wire Wire Line
	8950 3650 8950 2600
Wire Wire Line
	6700 3650 8950 3650
Connection ~ 6800 3650
Text Label 7100 5600 0    60   ~ 0
b1
Text Label 7100 5750 0    60   ~ 0
b2
Text Label 7100 5900 0    60   ~ 0
b3
Text Label 6450 4900 0    60   ~ 0
b1
Text Label 6450 5200 0    60   ~ 0
b2
Text Label 6450 5500 0    60   ~ 0
b3
Text Label 6200 4650 0    60   ~ 0
b1
Text Label 6800 4550 0    60   ~ 0
b2
Text Label 6800 4650 0    60   ~ 0
b3
$Comp
L 16X2LCD U2
U 1 1 542AB272
P 5750 7650
F 0 "U2" H 6400 9500 60  0000 C CNN
F 1 "16X2LCD" H 6400 9650 60  0000 C CNN
F 2 "" H 5750 7650 60  0000 C CNN
F 3 "" H 5750 7650 60  0000 C CNN
	1    5750 7650
	-1   0    0    -1  
$EndComp
$Comp
L VCC #PWR025
U 1 1 54365738
P 5750 5000
F 0 "#PWR025" H 5750 5100 30  0001 C CNN
F 1 "VCC" H 5750 5100 30  0000 C CNN
F 2 "" H 5750 5000 60  0000 C CNN
F 3 "" H 5750 5000 60  0000 C CNN
	1    5750 5000
	0    1    1    0   
$EndComp
$Comp
L GND #PWR026
U 1 1 54365747
P 5750 4900
F 0 "#PWR026" H 5750 4900 30  0001 C CNN
F 1 "GND" H 5750 4830 30  0001 C CNN
F 2 "" H 5750 4900 60  0000 C CNN
F 3 "" H 5750 4900 60  0000 C CNN
	1    5750 4900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5950 6400 5750 6400
Text Label 5750 6000 0    60   ~ 0
rw
Text Label 6200 4150 0    60   ~ 0
rw
$EndSCHEMATC
