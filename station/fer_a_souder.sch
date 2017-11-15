EESchema Schematic File Version 2
LIBS:fds6898a
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
LIBS:ina331
LIBS:lm397
LIBS:conn_15
LIBS:crystal4pin
LIBS:mma8452q
LIBS:ltc2485
LIBS:mcp3221
LIBS:mpr121
LIBS:mcp1804-sot235
LIBS:fer_a_souder-cache
EELAYER 27 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "Station WMRP"
Date "17 mar 2017"
Rev "5"
Comp "BESSE Julien"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L GND #PWR01
U 1 1 5664604D
P 3300 2950
F 0 "#PWR01" H 3300 2950 30  0001 C CNN
F 1 "GND" H 3300 2880 30  0001 C CNN
F 2 "" H 3300 2950 60  0000 C CNN
F 3 "" H 3300 2950 60  0000 C CNN
	1    3300 2950
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 5664607C
P 2700 2400
F 0 "C1" H 2700 2500 40  0000 L CNN
F 1 "10u" H 2706 2315 40  0000 L CNN
F 2 "~" H 2738 2250 30  0000 C CNN
F 3 "~" H 2700 2400 60  0000 C CNN
	1    2700 2400
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG02
U 1 1 5664611E
P 2700 1550
F 0 "#FLG02" H 2700 1645 30  0001 C CNN
F 1 "PWR_FLAG" H 2700 1730 30  0000 C CNN
F 2 "" H 2700 1550 60  0000 C CNN
F 3 "" H 2700 1550 60  0000 C CNN
	1    2700 1550
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR03
U 1 1 56646315
P 2550 1750
F 0 "#PWR03" H 2550 1700 20  0001 C CNN
F 1 "+12V" H 2550 1850 30  0000 C CNN
F 2 "" H 2550 1750 60  0000 C CNN
F 3 "" H 2550 1750 60  0000 C CNN
	1    2550 1750
	0    -1   -1   0   
$EndComp
$Comp
L PWR_FLAG #FLG04
U 1 1 566CD074
P 2700 3050
F 0 "#FLG04" H 2700 3145 30  0001 C CNN
F 1 "PWR_FLAG" H 2700 3230 30  0000 C CNN
F 2 "" H 2700 3050 60  0000 C CNN
F 3 "" H 2700 3050 60  0000 C CNN
	1    2700 3050
	-1   0    0    1   
$EndComp
Text Notes 6450 750  0    60   ~ 0
BESSE Julien\nStation WMRP\nRev 6
$Comp
L CONN_1 P2
U 1 1 56F887A6
P 1450 1950
F 0 "P2" H 1530 1950 40  0000 L CNN
F 1 "CONN_1" H 1450 2005 30  0001 C CNN
F 2 "" H 1450 1950 60  0000 C CNN
F 3 "" H 1450 1950 60  0000 C CNN
	1    1450 1950
	0    1    -1   0   
$EndComp
$Comp
L +3.3V #PWR05
U 1 1 574B429C
P 4000 1600
F 0 "#PWR05" H 4000 1560 30  0001 C CNN
F 1 "+3.3V" H 4000 1710 30  0000 C CNN
F 2 "" H 4000 1600 60  0000 C CNN
F 3 "" H 4000 1600 60  0000 C CNN
	1    4000 1600
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 574B432F
P 4000 2350
F 0 "C2" H 4000 2450 40  0000 L CNN
F 1 "1u" H 4006 2265 40  0000 L CNN
F 2 "~" H 4038 2200 30  0000 C CNN
F 3 "~" H 4000 2350 60  0000 C CNN
	1    4000 2350
	1    0    0    -1  
$EndComp
$Comp
L MMA8452Q U2
U 1 1 574B72FF
P 5400 1850
F 0 "U2" H 5150 1850 60  0000 C CNN
F 1 "MMA8452Q" H 5250 1600 60  0000 C CNN
F 2 "" H 5250 2000 60  0000 C CNN
F 3 "" H 5250 2000 60  0000 C CNN
	1    5400 1850
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 574B730E
P 4700 2400
F 0 "C4" H 4700 2500 40  0000 L CNN
F 1 "0.1u" H 4706 2315 40  0000 L CNN
F 2 "~" H 4738 2250 30  0000 C CNN
F 3 "~" H 4700 2400 60  0000 C CNN
	1    4700 2400
	1    0    0    -1  
$EndComp
Text Label 6150 2050 2    60   ~ 0
SDA
Text Label 6150 2150 2    60   ~ 0
SCL
NoConn ~ 5800 1850
NoConn ~ 5800 1950
Wire Wire Line
	5800 2050 6150 2050
Wire Wire Line
	6150 2150 5800 2150
Connection ~ 5500 2900
Wire Wire Line
	5900 2900 5900 2250
Wire Wire Line
	5900 2250 5800 2250
Connection ~ 5400 2900
Wire Wire Line
	5500 2900 5500 2500
Wire Wire Line
	4700 2600 4700 2900
Connection ~ 5300 2900
Wire Wire Line
	5400 2900 5400 2500
Wire Wire Line
	5300 2500 5300 3000
Wire Wire Line
	4700 2000 4700 2200
Wire Wire Line
	5000 2000 4700 2000
Connection ~ 5350 1400
Wire Wire Line
	5450 1400 5450 1550
Wire Wire Line
	5350 1250 5350 1550
Wire Wire Line
	4000 2850 4000 2550
Connection ~ 4000 1750
Wire Wire Line
	3750 1750 4250 1750
Wire Wire Line
	4000 1600 4000 2150
Wire Wire Line
	3300 2100 3300 2950
Connection ~ 2700 2850
Connection ~ 3300 2850
Wire Wire Line
	2700 2600 2700 3050
Connection ~ 2700 1750
Wire Wire Line
	2700 1550 2700 2200
$Comp
L +3.3V #PWR06
U 1 1 57670F20
P 5350 1250
F 0 "#PWR06" H 5350 1210 30  0001 C CNN
F 1 "+3.3V" H 5350 1360 30  0000 C CNN
F 2 "" H 5350 1250 60  0000 C CNN
F 3 "" H 5350 1250 60  0000 C CNN
	1    5350 1250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 5767D367
P 5300 3000
F 0 "#PWR07" H 5300 3000 30  0001 C CNN
F 1 "GND" H 5300 2930 30  0001 C CNN
F 2 "" H 5300 3000 60  0000 C CNN
F 3 "" H 5300 3000 60  0000 C CNN
	1    5300 3000
	1    0    0    -1  
$EndComp
NoConn ~ 16200 9050
$Comp
L INA331 U3
U 1 1 581D0475
P 8650 1800
F 0 "U3" H 9150 2050 60  0000 C CNN
F 1 "INA331" H 9000 1500 60  0000 C CNN
F 2 "~" H 8700 1900 60  0000 C CNN
F 3 "~" H 8700 1900 60  0000 C CNN
	1    8650 1800
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 581D0484
P 8500 1200
F 0 "R4" V 8580 1200 40  0000 C CNN
F 1 "8k2" V 8507 1201 40  0000 C CNN
F 2 "~" V 8430 1200 30  0000 C CNN
F 3 "~" H 8500 1200 30  0000 C CNN
	1    8500 1200
	0    -1   -1   0   
$EndComp
$Comp
L R R5
U 1 1 581D04A2
P 9350 1200
F 0 "R5" V 9430 1200 40  0000 C CNN
F 1 "680k" V 9357 1201 40  0000 C CNN
F 2 "~" V 9280 1200 30  0000 C CNN
F 3 "~" H 9350 1200 30  0000 C CNN
	1    9350 1200
	0    -1   -1   0   
$EndComp
$Comp
L R R3
U 1 1 581D050A
P 7450 2100
F 0 "R3" V 7530 2100 40  0000 C CNN
F 1 "10k" V 7457 2101 40  0000 C CNN
F 2 "~" V 7380 2100 30  0000 C CNN
F 3 "~" H 7450 2100 30  0000 C CNN
	1    7450 2100
	0    -1   -1   0   
$EndComp
$Comp
L R R2
U 1 1 581D0526
P 7050 2500
F 0 "R2" V 7130 2500 40  0000 C CNN
F 1 "3.3M" V 7057 2501 40  0000 C CNN
F 2 "~" V 6980 2500 30  0000 C CNN
F 3 "~" H 7050 2500 30  0000 C CNN
	1    7050 2500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7050 2250 7050 2100
Wire Wire Line
	6400 2100 7200 2100
Wire Wire Line
	7900 1600 7750 1600
Wire Wire Line
	7750 1200 7750 1950
Wire Wire Line
	8750 1200 9100 1200
Wire Wire Line
	8950 1200 8950 1400
Connection ~ 8950 1200
Wire Wire Line
	9600 1200 9750 1200
Wire Wire Line
	9750 1200 9750 1850
Wire Wire Line
	9450 1850 10050 1850
Wire Wire Line
	7900 2100 7700 2100
Wire Wire Line
	7050 2750 7050 2900
Wire Wire Line
	7050 2900 8650 2900
Wire Wire Line
	8500 2900 8500 2250
Wire Wire Line
	8650 2250 8650 3000
Connection ~ 8500 2900
$Comp
L GND #PWR08
U 1 1 581D08A1
P 7600 1950
F 0 "#PWR08" H 7600 1950 30  0001 C CNN
F 1 "GND" H 7600 1880 30  0001 C CNN
F 2 "" H 7600 1950 60  0000 C CNN
F 3 "" H 7600 1950 60  0000 C CNN
	1    7600 1950
	0    1    1    0   
$EndComp
Connection ~ 7750 1600
$Comp
L GND #PWR09
U 1 1 581D0908
P 8800 3000
F 0 "#PWR09" H 8800 3000 30  0001 C CNN
F 1 "GND" H 8800 2930 30  0001 C CNN
F 2 "" H 8800 3000 60  0000 C CNN
F 3 "" H 8800 3000 60  0000 C CNN
	1    8800 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 3000 8800 2250
$Comp
L +3.3V #PWR010
U 1 1 581D096B
P 8650 3000
F 0 "#PWR010" H 8650 2960 30  0001 C CNN
F 1 "+3.3V" H 8650 3110 30  0000 C CNN
F 2 "" H 8650 3000 60  0000 C CNN
F 3 "" H 8650 3000 60  0000 C CNN
	1    8650 3000
	-1   0    0    1   
$EndComp
Connection ~ 8650 2900
Connection ~ 9750 1850
Wire Wire Line
	7750 1200 8250 1200
Wire Wire Line
	7600 1950 7900 1950
Connection ~ 7750 1950
Connection ~ 7050 2100
Text Label 6400 2100 0    60   ~ 0
thermocouple
Wire Wire Line
	2550 1750 2850 1750
$Comp
L C C6
U 1 1 581D1573
P 8200 2600
F 0 "C6" H 8200 2700 40  0000 L CNN
F 1 "0.1u" H 8206 2515 40  0000 L CNN
F 2 "~" H 8238 2450 30  0000 C CNN
F 3 "~" H 8200 2600 60  0000 C CNN
	1    8200 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 2800 8200 2900
Connection ~ 8200 2900
Wire Wire Line
	8200 2300 8200 2400
Wire Wire Line
	8200 2300 8800 2300
Connection ~ 8800 2300
Text Label 1950 2850 1    60   ~ 0
thermocouple
$Comp
L CONN_1 P10
U 1 1 581D227E
P 1550 1950
F 0 "P10" H 1630 1950 40  0000 L CNN
F 1 "CONN_1" H 1550 2005 30  0001 C CNN
F 2 "" H 1550 1950 60  0000 C CNN
F 3 "" H 1550 1950 60  0000 C CNN
	1    1550 1950
	0    -1   -1   0   
$EndComp
$Comp
L CONN_1 P11
U 1 1 581D2284
P 1650 1950
F 0 "P11" H 1730 1950 40  0000 L CNN
F 1 "CONN_1" H 1650 2005 30  0001 C CNN
F 2 "" H 1650 1950 60  0000 C CNN
F 3 "" H 1650 1950 60  0000 C CNN
	1    1650 1950
	0    -1   -1   0   
$EndComp
$Comp
L CONN_1 P12
U 1 1 581D228A
P 1950 1950
F 0 "P12" H 2030 1950 40  0000 L CNN
F 1 "CONN_1" H 1950 2005 30  0001 C CNN
F 2 "" H 1950 1950 60  0000 C CNN
F 3 "" H 1950 1950 60  0000 C CNN
	1    1950 1950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1650 2850 1650 2100
Wire Wire Line
	1950 2100 1950 2850
Wire Wire Line
	1550 2850 1550 2100
$Comp
L +12V #PWR011
U 1 1 58275573
P 1450 2850
F 0 "#PWR011" H 1450 2800 20  0001 C CNN
F 1 "+12V" H 1450 2950 30  0000 C CNN
F 2 "" H 1450 2850 60  0000 C CNN
F 3 "" H 1450 2850 60  0000 C CNN
	1    1450 2850
	-1   0    0    1   
$EndComp
Wire Wire Line
	1450 2850 1450 2100
$Comp
L GND #PWR012
U 1 1 582755E8
P 1750 2850
F 0 "#PWR012" H 1750 2850 30  0001 C CNN
F 1 "GND" H 1750 2780 30  0001 C CNN
F 2 "" H 1750 2850 60  0000 C CNN
F 3 "" H 1750 2850 60  0000 C CNN
	1    1750 2850
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P13
U 1 1 582755EE
P 1750 1950
F 0 "P13" H 1830 1950 40  0000 L CNN
F 1 "CONN_1" H 1750 2005 30  0001 C CNN
F 2 "" H 1750 1950 60  0000 C CNN
F 3 "" H 1750 1950 60  0000 C CNN
	1    1750 1950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1750 2100 1750 2850
Wire Notes Line
	1400 1750 1400 1700
Wire Notes Line
	1400 1700 1800 1700
Wire Notes Line
	1800 1700 1800 1750
Text Notes 1750 1550 2    60   ~ 0
Vers la\n base
Text Notes 2000 1700 1    60   ~ 0
Thermocouple
Entry Bus Bus
	25800 7850 25900 7950
Wire Wire Line
	2700 2850 4250 2850
Text Label 1650 2850 1    60   ~ 0
SDA
Text Label 1550 2850 1    60   ~ 0
SCL
$Comp
L MCP3221 U4
U 1 1 5837461B
P 10450 1850
F 0 "U4" H 10750 2100 60  0000 C CNN
F 1 "MCP3221" H 10450 2100 60  0000 C CNN
F 2 "~" H 10450 1850 60  0000 C CNN
F 3 "~" H 10450 1850 60  0000 C CNN
	1    10450 1850
	1    0    0    -1  
$EndComp
Text Label 11300 1900 2    60   ~ 0
SDA
Text Label 11300 1800 2    60   ~ 0
SCL
Wire Wire Line
	10950 1900 11300 1900
Wire Wire Line
	11300 1800 10950 1800
$Comp
L +3.3V #PWR013
U 1 1 58374795
P 11050 1600
F 0 "#PWR013" H 11050 1560 30  0001 C CNN
F 1 "+3.3V" H 11050 1710 30  0000 C CNN
F 2 "" H 11050 1600 60  0000 C CNN
F 3 "" H 11050 1600 60  0000 C CNN
	1    11050 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	11050 1600 11050 1700
Wire Wire Line
	11050 1700 10950 1700
$Comp
L GND #PWR014
U 1 1 583747E1
P 11050 2150
F 0 "#PWR014" H 11050 2150 30  0001 C CNN
F 1 "GND" H 11050 2080 30  0001 C CNN
F 2 "" H 11050 2150 60  0000 C CNN
F 3 "" H 11050 2150 60  0000 C CNN
	1    11050 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	11050 2150 11050 2000
Wire Wire Line
	11050 2000 10950 2000
Wire Wire Line
	5350 1400 5450 1400
Wire Wire Line
	4700 2900 5900 2900
Wire Wire Line
	2850 1900 2700 1900
Connection ~ 2700 1900
$Comp
L R R1
U 1 1 58CA9E6E
P 4150 4950
F 0 "R1" V 4230 4950 40  0000 C CNN
F 1 "75k" V 4157 4951 40  0000 C CNN
F 2 "~" V 4080 4950 30  0000 C CNN
F 3 "~" H 4150 4950 30  0000 C CNN
	1    4150 4950
	-1   0    0    1   
$EndComp
Wire Wire Line
	4150 4550 4650 4550
$Comp
L C C3
U 1 1 58CA9EC9
P 4400 4950
F 0 "C3" H 4400 5050 40  0000 L CNN
F 1 "0.1u" H 4406 4865 40  0000 L CNN
F 2 "~" H 4438 4800 30  0000 C CNN
F 3 "~" H 4400 4950 60  0000 C CNN
	1    4400 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 4550 4150 4700
Wire Wire Line
	4400 4650 4400 4750
Wire Wire Line
	4400 4650 4650 4650
Wire Wire Line
	4400 5350 4400 5150
Wire Wire Line
	4150 5200 4150 5450
Connection ~ 4150 5350
$Comp
L GND #PWR015
U 1 1 58CAA21A
P 4150 5450
F 0 "#PWR015" H 4150 5450 30  0001 C CNN
F 1 "GND" H 4150 5380 30  0001 C CNN
F 2 "" H 4150 5450 60  0000 C CNN
F 3 "" H 4150 5450 60  0000 C CNN
	1    4150 5450
	1    0    0    -1  
$EndComp
NoConn ~ 4650 4250
$Comp
L +3.3V #PWR016
U 1 1 58CAA27D
P 4450 3700
F 0 "#PWR016" H 4450 3660 30  0001 C CNN
F 1 "+3.3V" H 4450 3810 30  0000 C CNN
F 2 "" H 4450 3700 60  0000 C CNN
F 3 "" H 4450 3700 60  0000 C CNN
	1    4450 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 3700 4450 3850
Wire Wire Line
	4450 3850 4650 3850
Text Label 4350 4150 0    60   ~ 0
SDA
Wire Wire Line
	4650 4150 4350 4150
Text Label 4350 4050 0    60   ~ 0
SCL
Wire Wire Line
	4350 4050 4650 4050
NoConn ~ 5600 3850
NoConn ~ 5600 3950
NoConn ~ 5600 4050
NoConn ~ 5600 4650
NoConn ~ 5600 4750
NoConn ~ 5600 4850
NoConn ~ 5600 4950
$Comp
L MPR121 U5
U 1 1 58CA9E4B
P 5150 4350
F 0 "U5" H 5150 4700 60  0000 C CNN
F 1 "MPR121" H 5150 5000 60  0000 C CNN
F 2 "~" H 5200 4700 60  0000 C CNN
F 3 "~" H 5200 4700 60  0000 C CNN
	1    5150 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 4250 6850 4250
Wire Wire Line
	5600 4350 6550 4350
Wire Wire Line
	5600 4450 6350 4450
Wire Wire Line
	5600 4550 6150 4550
Text Label 6750 4250 2    60   ~ 0
T2
Text Label 6150 5350 2    60   ~ 0
B
Text Label 6350 5350 2    60   ~ 0
G
Text Label 6550 5350 2    60   ~ 0
R
Wire Wire Line
	5600 4150 6850 4150
Text Label 6750 4150 2    60   ~ 0
T1
Wire Wire Line
	4650 4950 4600 4950
Wire Wire Line
	4600 4950 4600 5350
Connection ~ 4400 5350
$Comp
L R R6
U 1 1 58CB0068
P 6150 4950
F 0 "R6" V 6230 4950 40  0000 C CNN
F 1 "R" V 6157 4951 40  0000 C CNN
F 2 "~" V 6080 4950 30  0000 C CNN
F 3 "~" H 6150 4950 30  0000 C CNN
	1    6150 4950
	-1   0    0    1   
$EndComp
$Comp
L R R7
U 1 1 58CB0075
P 6350 4950
F 0 "R7" V 6430 4950 40  0000 C CNN
F 1 "R" V 6357 4951 40  0000 C CNN
F 2 "~" V 6280 4950 30  0000 C CNN
F 3 "~" H 6350 4950 30  0000 C CNN
	1    6350 4950
	-1   0    0    1   
$EndComp
$Comp
L R R8
U 1 1 58CB007B
P 6550 4950
F 0 "R8" V 6630 4950 40  0000 C CNN
F 1 "R" V 6557 4951 40  0000 C CNN
F 2 "~" V 6480 4950 30  0000 C CNN
F 3 "~" H 6550 4950 30  0000 C CNN
	1    6550 4950
	-1   0    0    1   
$EndComp
Wire Wire Line
	6150 4550 6150 4700
Wire Wire Line
	6350 4450 6350 4700
Wire Wire Line
	6550 4350 6550 4700
Wire Wire Line
	6150 5200 6150 5500
Wire Wire Line
	6350 5200 6350 5500
Wire Wire Line
	6550 5200 6550 5500
$Comp
L CONN_1 P5
U 1 1 58CB0606
P 7000 4150
F 0 "P5" H 7080 4150 40  0000 L CNN
F 1 "CONN_1" H 7000 4205 30  0001 C CNN
F 2 "" H 7000 4150 60  0000 C CNN
F 3 "" H 7000 4150 60  0000 C CNN
	1    7000 4150
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P6
U 1 1 58CB0613
P 7000 4250
F 0 "P6" H 7080 4250 40  0000 L CNN
F 1 "CONN_1" H 7000 4305 30  0001 C CNN
F 2 "" H 7000 4250 60  0000 C CNN
F 3 "" H 7000 4250 60  0000 C CNN
	1    7000 4250
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P1
U 1 1 58CB0619
P 6150 5650
F 0 "P1" H 6230 5650 40  0000 L CNN
F 1 "CONN_1" H 6150 5705 30  0001 C CNN
F 2 "" H 6150 5650 60  0000 C CNN
F 3 "" H 6150 5650 60  0000 C CNN
	1    6150 5650
	0    1    1    0   
$EndComp
$Comp
L CONN_1 P3
U 1 1 58CB061F
P 6350 5650
F 0 "P3" H 6430 5650 40  0000 L CNN
F 1 "CONN_1" H 6350 5705 30  0001 C CNN
F 2 "" H 6350 5650 60  0000 C CNN
F 3 "" H 6350 5650 60  0000 C CNN
	1    6350 5650
	0    1    1    0   
$EndComp
$Comp
L CONN_1 P4
U 1 1 58CB0625
P 6550 5650
F 0 "P4" H 6630 5650 40  0000 L CNN
F 1 "CONN_1" H 6550 5705 30  0001 C CNN
F 2 "" H 6550 5650 60  0000 C CNN
F 3 "" H 6550 5650 60  0000 C CNN
	1    6550 5650
	0    1    1    0   
$EndComp
$Comp
L C C5
U 1 1 58CBE3EA
P 4250 2350
F 0 "C5" H 4250 2450 40  0000 L CNN
F 1 "1u" H 4256 2265 40  0000 L CNN
F 2 "~" H 4288 2200 30  0000 C CNN
F 3 "~" H 4250 2350 60  0000 C CNN
	1    4250 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 2850 4250 2550
Connection ~ 4000 2850
Wire Wire Line
	4250 1750 4250 2150
Wire Wire Line
	4600 5350 4150 5350
Wire Wire Line
	4550 4150 4550 4450
Wire Wire Line
	4550 4450 4650 4450
Connection ~ 4550 4150
Text Notes 3550 4350 0    60   ~ 0
Adresse 0x5C  -->
$Comp
L MCP1804-SOT235 U1
U 1 1 58CBF0FC
P 3300 1800
F 0 "U1" H 3050 2000 40  0000 C CNN
F 1 "MCP1804-SOT235" H 3500 2000 40  0000 C CNN
F 2 "SOT-23-5" H 3300 1900 35  0000 C CIN
F 3 "~" H 3300 1800 60  0000 C CNN
	1    3300 1800
	1    0    0    -1  
$EndComp
$EndSCHEMATC
