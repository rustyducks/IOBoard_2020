EESchema Schematic File Version 4
LIBS:CDR2020_IO_board-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L mySymbols:NUCLEO32-L432KC U8
U 1 1 5E60F15C
P 5650 3400
F 0 "U8" H 5650 4325 50  0000 C CNN
F 1 "NUCLEO32-L432KC" H 5650 4234 50  0000 C CNN
F 2 "myFootprints:NUCLEO32" H 5350 4100 50  0001 C CNN
F 3 "https://www.st.com/content/ccc/resource/technical/document/user_manual/e3/0e/88/05/e8/74/43/a0/DM00231744.pdf/files/DM00231744.pdf/jcr:content/translations/en.DM00231744.pdf" H 5450 4200 50  0001 C CNN
	1    5650 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 2700 5100 2700
Wire Wire Line
	4750 2800 5200 2800
Wire Wire Line
	5200 3100 4750 3100
Wire Wire Line
	4750 3200 5200 3200
Wire Wire Line
	5200 3300 4750 3300
Wire Wire Line
	4750 3400 5200 3400
Wire Wire Line
	5200 3500 4750 3500
Wire Wire Line
	5200 3800 4750 3800
Wire Wire Line
	4750 3900 5200 3900
Wire Wire Line
	5200 4000 4750 4000
Wire Wire Line
	4750 4100 5200 4100
Text Label 4750 2700 0    50   ~ 0
DYN_TX
Text Label 4750 2800 0    50   ~ 0
PUMP1
Text Label 4750 3100 0    50   ~ 0
PUMP2
Text Label 4750 3200 0    50   ~ 0
SRV1
Text Label 4750 3500 0    50   ~ 0
SRV2
Text Label 4750 3800 0    50   ~ 0
SRV3
Text Label 4750 3900 0    50   ~ 0
SRV4
Text Label 4750 3300 0    50   ~ 0
I2C_SDA
Text Label 4750 3400 0    50   ~ 0
I2C_SCL
Text Label 4750 4000 0    50   ~ 0
EV1
Text Label 4750 4100 0    50   ~ 0
EV2
Wire Wire Line
	6100 3100 6450 3100
Wire Wire Line
	6450 3200 6100 3200
Wire Wire Line
	6100 3300 6450 3300
Wire Wire Line
	6600 3400 6100 3400
Wire Wire Line
	6100 3500 6450 3500
Wire Wire Line
	6450 3600 6100 3600
Wire Wire Line
	6100 3800 6450 3800
Wire Wire Line
	6100 4100 6450 4100
Text Label 6450 3100 2    50   ~ 0
U2_TX
Text Label 6450 3200 2    50   ~ 0
tirette
Text Label 6450 3300 2    50   ~ 0
color
Text Label 6600 3400 2    50   ~ 0
EV_SENSOR
Text Label 6450 3500 2    50   ~ 0
ADC
Text Label 6450 3600 2    50   ~ 0
U2_RX
Text Label 6450 3700 2    50   ~ 0
AN1
Text Label 6450 3800 2    50   ~ 0
AN2
$Comp
L power:GND #PWR0101
U 1 1 5E6104FC
P 5200 3000
F 0 "#PWR0101" H 5200 2750 50  0001 C CNN
F 1 "GND" V 5205 2872 50  0000 R CNN
F 2 "" H 5200 3000 50  0001 C CNN
F 3 "" H 5200 3000 50  0001 C CNN
	1    5200 3000
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0102
U 1 1 5E610571
P 6200 3000
F 0 "#PWR0102" H 6200 2850 50  0001 C CNN
F 1 "+5V" V 6215 3128 50  0000 L CNN
F 2 "" H 6200 3000 50  0001 C CNN
F 3 "" H 6200 3000 50  0001 C CNN
	1    6200 3000
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J14
U 1 1 5E6106D6
P 9400 800
F 0 "J14" H 9479 842 50  0000 L CNN
F 1 "U2" H 9479 751 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B03B-XH-A_1x03_P2.50mm_Vertical" H 9400 800 50  0001 C CNN
F 3 "~" H 9400 800 50  0001 C CNN
	1    9400 800 
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J15
U 1 1 5E61082C
P 10600 800
F 0 "J15" H 10680 842 50  0000 L CNN
F 1 "I2C" H 10680 751 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B03B-XH-A_1x03_P2.50mm_Vertical" H 10600 800 50  0001 C CNN
F 3 "~" H 10600 800 50  0001 C CNN
	1    10600 800 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5E610870
P 9150 700
F 0 "#PWR0103" H 9150 450 50  0001 C CNN
F 1 "GND" V 9155 572 50  0000 R CNN
F 2 "" H 9150 700 50  0001 C CNN
F 3 "" H 9150 700 50  0001 C CNN
	1    9150 700 
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5E610890
P 10350 700
F 0 "#PWR0104" H 10350 450 50  0001 C CNN
F 1 "GND" V 10355 572 50  0000 R CNN
F 2 "" H 10350 700 50  0001 C CNN
F 3 "" H 10350 700 50  0001 C CNN
	1    10350 700 
	0    1    1    0   
$EndComp
Wire Wire Line
	9200 800  8750 800 
Wire Wire Line
	8750 900  9200 900 
Wire Wire Line
	10400 800  10350 800 
Wire Wire Line
	9950 900  10100 900 
Text Label 8750 800  0    50   ~ 0
U2_TX
Text Label 8750 900  0    50   ~ 0
U2_RX
Text Label 9950 800  0    50   ~ 0
I2C_SDA
Text Label 9950 900  0    50   ~ 0
I2C_SCL
$Comp
L Connector_Generic:Conn_01x03 J10
U 1 1 5E61162E
P 10250 2600
F 0 "J10" H 10329 2642 50  0000 L CNN
F 1 "SERVO" H 10329 2551 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 10250 2600 50  0001 C CNN
F 3 "~" H 10250 2600 50  0001 C CNN
	1    10250 2600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J11
U 1 1 5E611730
P 10250 2950
F 0 "J11" H 10329 2992 50  0000 L CNN
F 1 "SERVO" H 10329 2901 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 10250 2950 50  0001 C CNN
F 3 "~" H 10250 2950 50  0001 C CNN
	1    10250 2950
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J12
U 1 1 5E6117B1
P 10250 3300
F 0 "J12" H 10329 3342 50  0000 L CNN
F 1 "SERVO" H 10329 3251 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 10250 3300 50  0001 C CNN
F 3 "~" H 10250 3300 50  0001 C CNN
	1    10250 3300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J13
U 1 1 5E6117D7
P 10250 3650
F 0 "J13" H 10329 3692 50  0000 L CNN
F 1 "SERVO" H 10329 3601 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 10250 3650 50  0001 C CNN
F 3 "~" H 10250 3650 50  0001 C CNN
	1    10250 3650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5E611813
P 10050 2500
F 0 "#PWR0105" H 10050 2250 50  0001 C CNN
F 1 "GND" V 10055 2372 50  0000 R CNN
F 2 "" H 10050 2500 50  0001 C CNN
F 3 "" H 10050 2500 50  0001 C CNN
	1    10050 2500
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5E61183A
P 10050 2850
F 0 "#PWR0106" H 10050 2600 50  0001 C CNN
F 1 "GND" V 10055 2722 50  0000 R CNN
F 2 "" H 10050 2850 50  0001 C CNN
F 3 "" H 10050 2850 50  0001 C CNN
	1    10050 2850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5E611853
P 10050 3200
F 0 "#PWR0107" H 10050 2950 50  0001 C CNN
F 1 "GND" V 10055 3072 50  0000 R CNN
F 2 "" H 10050 3200 50  0001 C CNN
F 3 "" H 10050 3200 50  0001 C CNN
	1    10050 3200
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5E61186C
P 10050 3550
F 0 "#PWR0108" H 10050 3300 50  0001 C CNN
F 1 "GND" V 10055 3422 50  0000 R CNN
F 2 "" H 10050 3550 50  0001 C CNN
F 3 "" H 10050 3550 50  0001 C CNN
	1    10050 3550
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0109
U 1 1 5E61192D
P 10050 2600
F 0 "#PWR0109" H 10050 2450 50  0001 C CNN
F 1 "+5V" V 10065 2728 50  0000 L CNN
F 2 "" H 10050 2600 50  0001 C CNN
F 3 "" H 10050 2600 50  0001 C CNN
	1    10050 2600
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0110
U 1 1 5E611D1A
P 10050 2950
F 0 "#PWR0110" H 10050 2800 50  0001 C CNN
F 1 "+5V" V 10065 3078 50  0000 L CNN
F 2 "" H 10050 2950 50  0001 C CNN
F 3 "" H 10050 2950 50  0001 C CNN
	1    10050 2950
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0111
U 1 1 5E611D33
P 10050 3300
F 0 "#PWR0111" H 10050 3150 50  0001 C CNN
F 1 "+5V" V 10065 3428 50  0000 L CNN
F 2 "" H 10050 3300 50  0001 C CNN
F 3 "" H 10050 3300 50  0001 C CNN
	1    10050 3300
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0112
U 1 1 5E611D4C
P 10050 3650
F 0 "#PWR0112" H 10050 3500 50  0001 C CNN
F 1 "+5V" V 10065 3778 50  0000 L CNN
F 2 "" H 10050 3650 50  0001 C CNN
F 3 "" H 10050 3650 50  0001 C CNN
	1    10050 3650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10050 2700 9600 2700
Wire Wire Line
	9600 3050 10050 3050
Wire Wire Line
	10050 3400 9600 3400
Wire Wire Line
	9600 3750 10050 3750
Text Label 9600 2700 0    50   ~ 0
SRV1
Text Label 9600 3050 0    50   ~ 0
SRV2
Text Label 9600 3400 0    50   ~ 0
SRV3
Text Label 9600 3750 0    50   ~ 0
SRV4
$Comp
L Connector_Generic:Conn_01x02 J9
U 1 1 5E61338F
P 8350 1200
F 0 "J9" H 8430 1192 50  0000 L CNN
F 1 "COL" H 8430 1101 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B02B-XH-A_1x02_P2.50mm_Vertical" H 8350 1200 50  0001 C CNN
F 3 "~" H 8350 1200 50  0001 C CNN
	1    8350 1200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5E6133C1
P 8100 700
F 0 "#PWR0113" H 8100 450 50  0001 C CNN
F 1 "GND" V 8105 572 50  0000 R CNN
F 2 "" H 8100 700 50  0001 C CNN
F 3 "" H 8100 700 50  0001 C CNN
	1    8100 700 
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5E6133DE
P 8100 1200
F 0 "#PWR0114" H 8100 950 50  0001 C CNN
F 1 "GND" V 8105 1072 50  0000 R CNN
F 2 "" H 8100 1200 50  0001 C CNN
F 3 "" H 8100 1200 50  0001 C CNN
	1    8100 1200
	0    1    1    0   
$EndComp
Wire Wire Line
	8150 900  7600 900 
Wire Wire Line
	7600 1300 8150 1300
Text Label 7600 900  0    50   ~ 0
tirette
Text Label 7600 1300 0    50   ~ 0
color
$Comp
L mySymbols:ABPDJJT A1
U 1 1 5E6141BF
P 8750 2500
F 0 "A1" H 8978 2546 50  0000 L CNN
F 1 "ABPDJJT" H 8978 2455 50  0000 L CNN
F 2 "myFootprints:DIP762W50P254L730H410Q6" H 9000 2300 50  0001 C CNN
F 3 "" H 9000 2300 50  0001 C CNN
	1    8750 2500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0115
U 1 1 5E616B6B
P 8650 2850
F 0 "#PWR0115" H 8650 2700 50  0001 C CNN
F 1 "+5V" H 8665 3023 50  0000 C CNN
F 2 "" H 8650 2850 50  0001 C CNN
F 3 "" H 8650 2850 50  0001 C CNN
	1    8650 2850
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 5E616B94
P 8650 2150
F 0 "#PWR0116" H 8650 1900 50  0001 C CNN
F 1 "GND" H 8655 1977 50  0000 C CNN
F 2 "" H 8650 2150 50  0001 C CNN
F 3 "" H 8650 2150 50  0001 C CNN
	1    8650 2150
	-1   0    0    1   
$EndComp
Wire Wire Line
	8850 2150 9050 2150
$Comp
L Device:C C2
U 1 1 5E6199F6
P 8350 2500
F 0 "C2" H 8465 2546 50  0000 L CNN
F 1 "100n" H 8465 2455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8388 2350 50  0001 C CNN
F 3 "~" H 8350 2500 50  0001 C CNN
	1    8350 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 2350 8350 2150
Wire Wire Line
	8350 2150 8650 2150
Connection ~ 8650 2150
Wire Wire Line
	8350 2650 8350 2850
Wire Wire Line
	8350 2850 8650 2850
Connection ~ 8650 2850
$Comp
L mySymbols:22-03-5035 J6
U 1 1 5E61BE2D
P 6150 750
F 0 "J6" H 6778 696 50  0000 L CNN
F 1 "22-03-5035" H 6778 605 50  0000 L CNN
F 2 "myFootprints:SHDR3W70P0X250_1X3_990X490X590P" H 6800 850 50  0001 L CNN
F 3 "http://www.molex.com/pdm_docs/sd/022035035_sd.pdf" H 6800 750 50  0001 L CNN
F 4 "Header 2.5mm SPOX,WTB,vert, shrouded, 3w Molex SPOX Series, Series Number 5267, 2.5mm Pitch 3 Way 1 Row Straight PCB Header, Solder Termination, 3A" H 6800 650 50  0001 L CNN "Description"
F 5 "5.9" H 6800 550 50  0001 L CNN "Height"
F 6 "Molex" H 6800 450 50  0001 L CNN "Manufacturer_Name"
F 7 "22-03-5035" H 6800 350 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "6878048P" H 6800 250 50  0001 L CNN "RS Part Number"
F 9 "http://uk.rs-online.com/web/p/products/6878048P" H 6800 150 50  0001 L CNN "RS Price/Stock"
F 10 "70248167" H 6800 50  50  0001 L CNN "Allied_Number"
F 11 "https://www.alliedelec.com/molex-incorporated-22-03-5035/70248167/" H 6800 -50 50  0001 L CNN "Allied Price/Stock"
F 12 "538-22-03-5035" H 6800 -150 50  0001 L CNN "Mouser Part Number"
F 13 "https://www.mouser.com/Search/Refine.aspx?Keyword=538-22-03-5035" H 6800 -250 50  0001 L CNN "Mouser Price/Stock"
	1    6150 750 
	1    0    0    -1  
$EndComp
$Comp
L mySymbols:22-03-5035 J7
U 1 1 5E61BF55
P 6150 1250
F 0 "J7" H 6778 1196 50  0000 L CNN
F 1 "22-03-5035" H 6778 1105 50  0000 L CNN
F 2 "myFootprints:SHDR3W70P0X250_1X3_990X490X590P" H 6800 1350 50  0001 L CNN
F 3 "http://www.molex.com/pdm_docs/sd/022035035_sd.pdf" H 6800 1250 50  0001 L CNN
F 4 "Header 2.5mm SPOX,WTB,vert, shrouded, 3w Molex SPOX Series, Series Number 5267, 2.5mm Pitch 3 Way 1 Row Straight PCB Header, Solder Termination, 3A" H 6800 1150 50  0001 L CNN "Description"
F 5 "5.9" H 6800 1050 50  0001 L CNN "Height"
F 6 "Molex" H 6800 950 50  0001 L CNN "Manufacturer_Name"
F 7 "22-03-5035" H 6800 850 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "6878048P" H 6800 750 50  0001 L CNN "RS Part Number"
F 9 "http://uk.rs-online.com/web/p/products/6878048P" H 6800 650 50  0001 L CNN "RS Price/Stock"
F 10 "70248167" H 6800 550 50  0001 L CNN "Allied_Number"
F 11 "https://www.alliedelec.com/molex-incorporated-22-03-5035/70248167/" H 6800 450 50  0001 L CNN "Allied Price/Stock"
F 12 "538-22-03-5035" H 6800 350 50  0001 L CNN "Mouser Part Number"
F 13 "https://www.mouser.com/Search/Refine.aspx?Keyword=538-22-03-5035" H 6800 250 50  0001 L CNN "Mouser Price/Stock"
	1    6150 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5E625029
P 5100 2450
F 0 "R1" H 5170 2496 50  0000 L CNN
F 1 "1k" H 5170 2405 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5030 2450 50  0001 C CNN
F 3 "~" H 5100 2450 50  0001 C CNN
	1    5100 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 2600 5100 2700
Connection ~ 5100 2700
Wire Wire Line
	5100 2700 4750 2700
$Comp
L power:+5V #PWR0117
U 1 1 5E6257C9
P 5100 2300
F 0 "#PWR0117" H 5100 2150 50  0001 C CNN
F 1 "+5V" V 5115 2428 50  0000 L CNN
F 2 "" H 5100 2300 50  0001 C CNN
F 3 "" H 5100 2300 50  0001 C CNN
	1    5100 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 5E62597E
P 6150 750
F 0 "#PWR0118" H 6150 500 50  0001 C CNN
F 1 "GND" V 6155 622 50  0000 R CNN
F 2 "" H 6150 750 50  0001 C CNN
F 3 "" H 6150 750 50  0001 C CNN
	1    6150 750 
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 5E6259DD
P 6150 1250
F 0 "#PWR0119" H 6150 1000 50  0001 C CNN
F 1 "GND" V 6155 1122 50  0000 R CNN
F 2 "" H 6150 1250 50  0001 C CNN
F 3 "" H 6150 1250 50  0001 C CNN
	1    6150 1250
	0    1    1    0   
$EndComp
$Comp
L power:+12V #PWR0120
U 1 1 5E625A61
P 6150 850
F 0 "#PWR0120" H 6150 700 50  0001 C CNN
F 1 "+12V" V 6165 978 50  0000 L CNN
F 2 "" H 6150 850 50  0001 C CNN
F 3 "" H 6150 850 50  0001 C CNN
	1    6150 850 
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR0121
U 1 1 5E625AB9
P 6150 1350
F 0 "#PWR0121" H 6150 1200 50  0001 C CNN
F 1 "+12V" V 6165 1478 50  0000 L CNN
F 2 "" H 6150 1350 50  0001 C CNN
F 3 "" H 6150 1350 50  0001 C CNN
	1    6150 1350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6150 1450 5800 1450
Wire Wire Line
	5800 1450 5800 950 
Wire Wire Line
	5800 950  6150 950 
Wire Wire Line
	5800 950  5450 950 
Connection ~ 5800 950 
Text Label 5450 950  0    50   ~ 0
DYN_TX
$Comp
L power:GND #PWR0122
U 1 1 5E6278DD
P 6200 2800
F 0 "#PWR0122" H 6200 2550 50  0001 C CNN
F 1 "GND" V 6205 2672 50  0000 R CNN
F 2 "" H 6200 2800 50  0001 C CNN
F 3 "" H 6200 2800 50  0001 C CNN
	1    6200 2800
	0    -1   -1   0   
$EndComp
$Comp
L mySymbols:TSR_2-24120 U2
U 1 1 5E627DB9
P 1800 1150
F 0 "U2" H 2400 1415 50  0000 C CNN
F 1 "TSR_2-24120" H 2400 1324 50  0000 C CNN
F 2 "myFootprints:TSR-2" H 2850 1250 50  0001 L CNN
F 3 "https://assets.tracopower.com/20180205131340/TSR2/documents/tsr2-datasheet.pdf" H 2850 1150 50  0001 L CNN
F 4 "Non-Isolated DC/DC Converters 15-36Vin 12V 2A SIP switching regulator" H 2850 1050 50  0001 L CNN "Description"
F 5 "Traco Power" H 2850 850 50  0001 L CNN "Manufacturer_Name"
F 6 "TSR 2-24120" H 2850 750 50  0001 L CNN "Manufacturer_Part_Number"
F 7 "9068493" H 2850 650 50  0001 L CNN "RS Part Number"
F 8 "http://uk.rs-online.com/web/p/products/9068493" H 2850 550 50  0001 L CNN "RS Price/Stock"
F 9 "71066177" H 2850 450 50  0001 L CNN "Allied_Number"
F 10 "https://www.alliedelec.com/tracopower-tsr-2-24120/71066177/" H 2850 350 50  0001 L CNN "Allied Price/Stock"
F 11 "495-TSR2-24120" H 2850 250 50  0001 L CNN "Mouser Part Number"
F 12 "https://www.mouser.com/Search/Refine.aspx?Keyword=495-TSR2-24120" H 2850 150 50  0001 L CNN "Mouser Price/Stock"
	1    1800 1150
	1    0    0    -1  
$EndComp
$Comp
L mySymbols:TSR_2-2450 U3
U 1 1 5E627FA0
P 1800 1750
F 0 "U3" H 2400 2015 50  0000 C CNN
F 1 "TSR_2-2450" H 2400 1924 50  0000 C CNN
F 2 "myFootprints:TSR-2" H 2850 1850 50  0001 L CNN
F 3 "https://assets.tracopower.com/20180205131340/TSR2/documents/tsr2-datasheet.pdf" H 2850 1750 50  0001 L CNN
F 4 "Non-Isolated DC/DC Converters 15-36Vin 5V 2A SIP switching regulator" H 2850 1650 50  0001 L CNN "Description"
F 5 "Traco Power" H 2850 1450 50  0001 L CNN "Manufacturer_Name"
F 6 "TSR 2-2450" H 2850 1350 50  0001 L CNN "Manufacturer_Part_Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=495-TSR2-2450" H 2850 1250 50  0001 L CNN "Mouser Price/Stock"
	1    1800 1750
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0123
U 1 1 5E62824A
P 3600 1150
F 0 "#PWR0123" H 3600 1000 50  0001 C CNN
F 1 "+12V" V 3615 1278 50  0000 L CNN
F 2 "" H 3600 1150 50  0001 C CNN
F 3 "" H 3600 1150 50  0001 C CNN
	1    3600 1150
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0124
U 1 1 5E62846F
P 3550 1750
F 0 "#PWR0124" H 3550 1600 50  0001 C CNN
F 1 "+5V" V 3565 1878 50  0000 L CNN
F 2 "" H 3550 1750 50  0001 C CNN
F 3 "" H 3550 1750 50  0001 C CNN
	1    3550 1750
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 5E62857A
P 1750 1850
F 0 "#PWR0125" H 1750 1600 50  0001 C CNN
F 1 "GND" V 1755 1722 50  0000 R CNN
F 2 "" H 1750 1850 50  0001 C CNN
F 3 "" H 1750 1850 50  0001 C CNN
	1    1750 1850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0126
U 1 1 5E6285A5
P 1750 1250
F 0 "#PWR0126" H 1750 1000 50  0001 C CNN
F 1 "GND" V 1755 1122 50  0000 R CNN
F 2 "" H 1750 1250 50  0001 C CNN
F 3 "" H 1750 1250 50  0001 C CNN
	1    1750 1250
	0    1    1    0   
$EndComp
$Comp
L mySymbols:Power_pads P1
U 1 1 5E6287C9
P 1000 1200
F 0 "P1" H 981 1575 50  0000 C CNN
F 1 "Power_pads" H 981 1484 50  0000 C CNN
F 2 "myFootprints:Power_pads" H 850 1350 50  0001 C CNN
F 3 "" H 1000 1200 50  0001 C CNN
	1    1000 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 1750 1450 1150
$Comp
L power:GND #PWR0127
U 1 1 5E629FB6
P 1200 1050
F 0 "#PWR0127" H 1200 800 50  0001 C CNN
F 1 "GND" V 1205 922 50  0000 R CNN
F 2 "" H 1200 1050 50  0001 C CNN
F 3 "" H 1200 1050 50  0001 C CNN
	1    1200 1050
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C1
U 1 1 5E62A973
P 6600 2800
F 0 "C1" H 6715 2846 50  0000 L CNN
F 1 "100n" H 6715 2755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6638 2650 50  0001 C CNN
F 3 "~" H 6600 2800 50  0001 C CNN
	1    6600 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 2650 6600 2650
Wire Wire Line
	6100 3000 6200 3000
Wire Wire Line
	6200 3000 6200 2950
Wire Wire Line
	6200 2950 6600 2950
Connection ~ 6200 3000
$Comp
L mySymbols:IRLML6344 U5
U 1 1 5E62FA0E
P 3400 5750
F 0 "U5" H 3505 5796 50  0000 L CNN
F 1 "IRLML6344" H 3505 5705 50  0000 L CNN
F 2 "myFootprints:SOT-23" H 3750 5600 50  0001 C CNN
F 3 "https://docs-emea.rs-online.com/webdocs/0f87/0900766b80f8731b.pdf" H 3450 6200 50  0001 C CNN
	1    3400 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0128
U 1 1 5E62FE7D
P 3400 5950
F 0 "#PWR0128" H 3400 5700 50  0001 C CNN
F 1 "GND" V 3405 5822 50  0000 R CNN
F 2 "" H 3400 5950 50  0001 C CNN
F 3 "" H 3400 5950 50  0001 C CNN
	1    3400 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 5750 2950 5750
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 5E6311E5
P 3200 5450
F 0 "J3" H 3280 5442 50  0000 L CNN
F 1 "EV" H 3280 5351 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B02B-XH-A_1x02_P2.50mm_Vertical" H 3200 5450 50  0001 C CNN
F 3 "~" H 3200 5450 50  0001 C CNN
	1    3200 5450
	-1   0    0    1   
$EndComp
Wire Wire Line
	3400 5550 3400 5450
Wire Wire Line
	3400 5350 3400 5200
$Comp
L power:+12V #PWR0129
U 1 1 5E6338EB
P 3400 5200
F 0 "#PWR0129" H 3400 5050 50  0001 C CNN
F 1 "+12V" H 3415 5373 50  0000 C CNN
F 2 "" H 3400 5200 50  0001 C CNN
F 3 "" H 3400 5200 50  0001 C CNN
	1    3400 5200
	1    0    0    -1  
$EndComp
Text Label 2950 5750 0    50   ~ 0
EV2
$Comp
L mySymbols:IRLML6344 U4
U 1 1 5E635036
P 2400 5750
F 0 "U4" H 2505 5796 50  0000 L CNN
F 1 "IRLML6344" H 2505 5705 50  0000 L CNN
F 2 "myFootprints:SOT-23" H 2750 5600 50  0001 C CNN
F 3 "https://docs-emea.rs-online.com/webdocs/0f87/0900766b80f8731b.pdf" H 2450 6200 50  0001 C CNN
	1    2400 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0130
U 1 1 5E63503D
P 2400 5950
F 0 "#PWR0130" H 2400 5700 50  0001 C CNN
F 1 "GND" V 2405 5822 50  0000 R CNN
F 2 "" H 2400 5950 50  0001 C CNN
F 3 "" H 2400 5950 50  0001 C CNN
	1    2400 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 5750 1950 5750
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 5E635044
P 2200 5450
F 0 "J2" H 2280 5442 50  0000 L CNN
F 1 "EV" H 2280 5351 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B02B-XH-A_1x02_P2.50mm_Vertical" H 2200 5450 50  0001 C CNN
F 3 "~" H 2200 5450 50  0001 C CNN
	1    2200 5450
	-1   0    0    1   
$EndComp
Wire Wire Line
	2400 5550 2400 5450
Wire Wire Line
	2400 5350 2400 5200
$Comp
L power:+12V #PWR0131
U 1 1 5E63504D
P 2400 5200
F 0 "#PWR0131" H 2400 5050 50  0001 C CNN
F 1 "+12V" H 2415 5373 50  0000 C CNN
F 2 "" H 2400 5200 50  0001 C CNN
F 3 "" H 2400 5200 50  0001 C CNN
	1    2400 5200
	1    0    0    -1  
$EndComp
Text Label 1950 5750 0    50   ~ 0
EV1
$Comp
L mySymbols:IRLML6344 U1
U 1 1 5E636369
P 1400 5750
F 0 "U1" H 1505 5796 50  0000 L CNN
F 1 "IRLML6344" H 1505 5705 50  0000 L CNN
F 2 "myFootprints:SOT-23" H 1750 5600 50  0001 C CNN
F 3 "https://docs-emea.rs-online.com/webdocs/0f87/0900766b80f8731b.pdf" H 1450 6200 50  0001 C CNN
	1    1400 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0132
U 1 1 5E636370
P 1400 5950
F 0 "#PWR0132" H 1400 5700 50  0001 C CNN
F 1 "GND" V 1405 5822 50  0000 R CNN
F 2 "" H 1400 5950 50  0001 C CNN
F 3 "" H 1400 5950 50  0001 C CNN
	1    1400 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 5750 650  5750
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 5E636377
P 1200 5450
F 0 "J1" H 1280 5442 50  0000 L CNN
F 1 "EV" H 1280 5351 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B02B-XH-A_1x02_P2.50mm_Vertical" H 1200 5450 50  0001 C CNN
F 3 "~" H 1200 5450 50  0001 C CNN
	1    1200 5450
	-1   0    0    1   
$EndComp
Wire Wire Line
	1400 5550 1400 5450
Wire Wire Line
	1400 5350 1400 5200
$Comp
L power:+12V #PWR0133
U 1 1 5E636380
P 1400 5200
F 0 "#PWR0133" H 1400 5050 50  0001 C CNN
F 1 "+12V" H 1415 5373 50  0000 C CNN
F 2 "" H 1400 5200 50  0001 C CNN
F 3 "" H 1400 5200 50  0001 C CNN
	1    1400 5200
	1    0    0    -1  
$EndComp
Text Label 650  5750 0    50   ~ 0
EV_SENSOR
$Comp
L mySymbols:IRLML6344 U6
U 1 1 5E637C6E
P 4450 5750
F 0 "U6" H 4555 5796 50  0000 L CNN
F 1 "IRLML6344" H 4555 5705 50  0000 L CNN
F 2 "myFootprints:SOT-23" H 4800 5600 50  0001 C CNN
F 3 "https://docs-emea.rs-online.com/webdocs/0f87/0900766b80f8731b.pdf" H 4500 6200 50  0001 C CNN
	1    4450 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0134
U 1 1 5E637C75
P 4450 5950
F 0 "#PWR0134" H 4450 5700 50  0001 C CNN
F 1 "GND" V 4455 5822 50  0000 R CNN
F 2 "" H 4450 5950 50  0001 C CNN
F 3 "" H 4450 5950 50  0001 C CNN
	1    4450 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 5750 3900 5750
$Comp
L Connector_Generic:Conn_01x02 J4
U 1 1 5E637C7C
P 4250 5450
F 0 "J4" H 4330 5442 50  0000 L CNN
F 1 "EV" H 4330 5351 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B02B-XH-A_1x02_P2.50mm_Vertical" H 4250 5450 50  0001 C CNN
F 3 "~" H 4250 5450 50  0001 C CNN
	1    4250 5450
	-1   0    0    1   
$EndComp
Wire Wire Line
	4450 5550 4450 5450
Wire Wire Line
	4450 5350 4450 5200
$Comp
L power:+12V #PWR0135
U 1 1 5E637C85
P 4450 5200
F 0 "#PWR0135" H 4450 5050 50  0001 C CNN
F 1 "+12V" H 4465 5373 50  0000 C CNN
F 2 "" H 4450 5200 50  0001 C CNN
F 3 "" H 4450 5200 50  0001 C CNN
	1    4450 5200
	1    0    0    -1  
$EndComp
Text Label 3900 5750 0    50   ~ 0
PUMP1
$Comp
L mySymbols:IRLML6344 U7
U 1 1 5E644C1E
P 5450 5750
F 0 "U7" H 5555 5796 50  0000 L CNN
F 1 "IRLML6344" H 5555 5705 50  0000 L CNN
F 2 "myFootprints:SOT-23" H 5800 5600 50  0001 C CNN
F 3 "https://docs-emea.rs-online.com/webdocs/0f87/0900766b80f8731b.pdf" H 5500 6200 50  0001 C CNN
	1    5450 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0136
U 1 1 5E644C25
P 5450 5950
F 0 "#PWR0136" H 5450 5700 50  0001 C CNN
F 1 "GND" V 5455 5822 50  0000 R CNN
F 2 "" H 5450 5950 50  0001 C CNN
F 3 "" H 5450 5950 50  0001 C CNN
	1    5450 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 5750 4900 5750
$Comp
L Connector_Generic:Conn_01x02 J5
U 1 1 5E644C2C
P 5250 5450
F 0 "J5" H 5330 5442 50  0000 L CNN
F 1 "EV" H 5330 5351 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B02B-XH-A_1x02_P2.50mm_Vertical" H 5250 5450 50  0001 C CNN
F 3 "~" H 5250 5450 50  0001 C CNN
	1    5250 5450
	-1   0    0    1   
$EndComp
Wire Wire Line
	5450 5550 5450 5450
Wire Wire Line
	5450 5350 5450 5200
Text Label 4900 5750 0    50   ~ 0
PUMP2
$Comp
L power:+5V #PWR0137
U 1 1 5E6464E0
P 5450 5200
F 0 "#PWR0137" H 5450 5050 50  0001 C CNN
F 1 "+5V" V 5465 5328 50  0000 L CNN
F 2 "" H 5450 5200 50  0001 C CNN
F 3 "" H 5450 5200 50  0001 C CNN
	1    5450 5200
	1    0    0    -1  
$EndComp
NoConn ~ 6100 3900
NoConn ~ 6100 4000
NoConn ~ 5200 3700
NoConn ~ 5200 3600
NoConn ~ 5200 2900
NoConn ~ 6100 2900
NoConn ~ 6100 2700
Wire Wire Line
	6100 3700 6450 3700
$Comp
L Connector_Generic:Conn_01x04 J16
U 1 1 5E657008
P 10250 4500
F 0 "J16" H 10329 4492 50  0000 L CNN
F 1 "DISPLAY" H 10329 4401 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B04B-XH-A_1x04_P2.50mm_Vertical" H 10250 4500 50  0001 C CNN
F 3 "~" H 10250 4500 50  0001 C CNN
	1    10250 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0138
U 1 1 5E6573A2
P 10050 4500
F 0 "#PWR0138" H 10050 4250 50  0001 C CNN
F 1 "GND" V 10055 4372 50  0000 R CNN
F 2 "" H 10050 4500 50  0001 C CNN
F 3 "" H 10050 4500 50  0001 C CNN
	1    10050 4500
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0139
U 1 1 5E6573E7
P 10050 4400
F 0 "#PWR0139" H 10050 4250 50  0001 C CNN
F 1 "+5V" V 10065 4528 50  0000 L CNN
F 2 "" H 10050 4400 50  0001 C CNN
F 3 "" H 10050 4400 50  0001 C CNN
	1    10050 4400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10050 4600 9600 4600
Wire Wire Line
	9600 4700 10050 4700
Text Label 9600 4600 0    50   ~ 0
AN1
Text Label 9600 4700 0    50   ~ 0
AN2
$Comp
L Device:LED D1
U 1 1 5E65B567
P 7050 4100
F 0 "D1" H 7042 3845 50  0000 C CNN
F 1 "LED" H 7042 3936 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 7050 4100 50  0001 C CNN
F 3 "~" H 7050 4100 50  0001 C CNN
	1    7050 4100
	-1   0    0    1   
$EndComp
$Comp
L Device:R R2
U 1 1 5E65B74B
P 6600 4100
F 0 "R2" V 6807 4100 50  0000 C CNN
F 1 "390" V 6716 4100 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6530 4100 50  0001 C CNN
F 3 "~" H 6600 4100 50  0001 C CNN
	1    6600 4100
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0140
U 1 1 5E65B8F4
P 7350 4100
F 0 "#PWR0140" H 7350 3850 50  0001 C CNN
F 1 "GND" V 7355 3972 50  0000 R CNN
F 2 "" H 7350 4100 50  0001 C CNN
F 3 "" H 7350 4100 50  0001 C CNN
	1    7350 4100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7350 4100 7200 4100
Wire Wire Line
	6900 4100 6750 4100
Wire Wire Line
	1450 1750 1800 1750
Wire Wire Line
	6200 2800 6100 2800
Wire Wire Line
	8150 700  8100 700 
Wire Wire Line
	8100 1200 8150 1200
Wire Wire Line
	10400 700  10350 700 
Wire Wire Line
	9200 700  9150 700 
Wire Wire Line
	1200 1050 1150 1050
Wire Wire Line
	6200 2800 6200 2650
Connection ~ 6200 2800
Wire Wire Line
	1800 1250 1750 1250
Wire Wire Line
	1800 1150 1450 1150
Wire Wire Line
	1450 1150 1150 1150
Connection ~ 1450 1150
Wire Wire Line
	1800 1850 1750 1850
$Comp
L Device:C C3
U 1 1 5E689B09
P 3000 2000
F 0 "C3" H 3115 2046 50  0000 L CNN
F 1 "C" H 3115 1955 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 3038 1850 50  0001 C CNN
F 3 "~" H 3000 2000 50  0001 C CNN
	1    3000 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 1750 3000 1850
Connection ~ 3000 1750
Wire Wire Line
	3000 2150 1800 2150
Wire Wire Line
	1800 2150 1800 1850
Connection ~ 1800 1850
$Comp
L Device:R R3
U 1 1 5E69440B
P 9200 2150
F 0 "R3" V 8993 2150 50  0000 C CNN
F 1 "3.3k" V 9084 2150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 9130 2150 50  0001 C CNN
F 3 "~" H 9200 2150 50  0001 C CNN
	1    9200 2150
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5E6944A1
P 9600 2150
F 0 "R4" V 9393 2150 50  0000 C CNN
F 1 "6.8k" V 9484 2150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 9530 2150 50  0001 C CNN
F 3 "~" H 9600 2150 50  0001 C CNN
	1    9600 2150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5E694501
P 9850 2150
F 0 "#PWR02" H 9850 1900 50  0001 C CNN
F 1 "GND" V 9855 2022 50  0000 R CNN
F 2 "" H 9850 2150 50  0001 C CNN
F 3 "" H 9850 2150 50  0001 C CNN
	1    9850 2150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9850 2150 9750 2150
Wire Wire Line
	9450 2150 9400 2150
Wire Wire Line
	9400 2150 9400 2350
Wire Wire Line
	9400 2350 9550 2350
Connection ~ 9400 2150
Wire Wire Line
	9400 2150 9350 2150
Text Label 9550 2350 2    50   ~ 0
ADC
$Comp
L Connector_Generic:Conn_01x03 J8
U 1 1 5E69CE2F
P 8350 800
F 0 "J8" H 8429 842 50  0000 L CNN
F 1 "TIR" H 8429 751 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B03B-XH-A_1x03_P2.50mm_Vertical" H 8350 800 50  0001 C CNN
F 3 "~" H 8350 800 50  0001 C CNN
	1    8350 800 
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01
U 1 1 5E69FCD7
P 8150 800
F 0 "#PWR01" H 8150 650 50  0001 C CNN
F 1 "+5V" V 8165 928 50  0000 L CNN
F 2 "" H 8150 800 50  0001 C CNN
F 3 "" H 8150 800 50  0001 C CNN
	1    8150 800 
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C4
U 1 1 5E6A0D8D
P 3000 1300
F 0 "C4" H 3115 1346 50  0000 L CNN
F 1 "C" H 3115 1255 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 3038 1150 50  0001 C CNN
F 3 "~" H 3000 1300 50  0001 C CNN
	1    3000 1300
	1    0    0    -1  
$EndComp
Connection ~ 3000 1150
Wire Wire Line
	3000 1450 1800 1450
Wire Wire Line
	1800 1450 1800 1250
Connection ~ 1800 1250
$Comp
L Device:C C6
U 1 1 5E6A3E67
P 3350 2000
F 0 "C6" H 3465 2046 50  0000 L CNN
F 1 "100n" H 3465 1955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3388 1850 50  0001 C CNN
F 3 "~" H 3350 2000 50  0001 C CNN
	1    3350 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5E6A3F15
P 3350 1300
F 0 "C5" H 3465 1346 50  0000 L CNN
F 1 "100n" H 3465 1255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3388 1150 50  0001 C CNN
F 3 "~" H 3350 1300 50  0001 C CNN
	1    3350 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 1750 3350 1750
Wire Wire Line
	3350 1850 3350 1750
Connection ~ 3350 1750
Wire Wire Line
	3350 1750 3550 1750
Wire Wire Line
	3350 2150 3000 2150
Connection ~ 3000 2150
Wire Wire Line
	3350 1450 3000 1450
Connection ~ 3000 1450
Wire Wire Line
	3000 1150 3350 1150
Wire Wire Line
	3350 1150 3600 1150
Connection ~ 3350 1150
$Comp
L Device:R R6
U 1 1 5E6C0B1C
P 10350 1150
F 0 "R6" V 10557 1150 50  0000 C CNN
F 1 "2.2k" V 10466 1150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10280 1150 50  0001 C CNN
F 3 "~" H 10350 1150 50  0001 C CNN
	1    10350 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5E6CDA44
P 10100 1150
F 0 "R5" V 10307 1150 50  0000 C CNN
F 1 "2.2k" V 10216 1150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10030 1150 50  0001 C CNN
F 3 "~" H 10100 1150 50  0001 C CNN
	1    10100 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 1000 10350 800 
Connection ~ 10350 800 
Wire Wire Line
	10350 800  9950 800 
Wire Wire Line
	10100 1000 10100 900 
Connection ~ 10100 900 
Wire Wire Line
	10100 900  10400 900 
$Comp
L power:+5V #PWR03
U 1 1 5E6DA9F0
P 10100 1300
F 0 "#PWR03" H 10100 1150 50  0001 C CNN
F 1 "+5V" V 10115 1428 50  0000 L CNN
F 2 "" H 10100 1300 50  0001 C CNN
F 3 "" H 10100 1300 50  0001 C CNN
	1    10100 1300
	-1   0    0    1   
$EndComp
Wire Wire Line
	10350 1300 10100 1300
Connection ~ 10100 1300
$EndSCHEMATC
