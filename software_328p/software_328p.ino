/* ************************
	Julien BESSE
	https://julienbesse.fr

	First sketch for the soldering station.

	Compile it for "Arduino breadboard 8 MHz" :
		Go to https://www.arduino.cc/en/Tutorial/ArduinoToBreadboard,
		Then read "Minimal Circuit"

	Upload it to the microcontroller with an ISP programmer

This software is VERY UGLY as I just made a sketch to test the hardware. I need to clean it and use english instead of french.

*/

/*********************************************************************
This example is for a 128x64 size display using I2C to communicate
3 pins are required to interface (2 I2C and one reset)

Adafruit invests time and resources providing this open source code, 
please support Adafruit and open-source hardware by purchasing 
products from Adafruit!

Written by Limor Fried/Ladyada  for Adafruit Industries.  
BSD license, check license.txt for more information
All text above, and the splash screen must be included in any redistribution
*********************************************************************/
#include <EEPROM.h>
#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include <SparkFun_MMA8452Q.h>
#include <Adafruit_MLX90614.h>
#include "Adafruit_MPR121.h"
#include <avr/wdt.h>

#define OLED_RESET 7
Adafruit_SSD1306 display(OLED_RESET);

#define NUMFLAKES 10
#define XPOS 0
#define YPOS 1
#define DELTAY 2

#define pin_n 3
#define pin_p 2
#define pin_bp 4

MMA8452Q accel;
Adafruit_MLX90614 mlx = Adafruit_MLX90614();

Adafruit_MPR121 cap = Adafruit_MPR121();

uint16_t TemperatureCible = 300;
uint16_t acc;
uint8_t capteurIR = 0; // Booléen indiquant la présence d'un capteur GY-906
uint8_t MPR = 0; // Pareil pour capteur tacile et LED

#define LOGO_H 49 
#define LOGO_W  72
const unsigned char logo [] PROGMEM = {
  // 'g4798'
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
  0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1c, 0x00, 0x00, 0x00, 0x00, 0x00, 
  0x00, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf0, 0x00, 0x00, 0x00, 
  0x00, 0x00, 0x00, 0x00, 0x03, 0xe0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0xc0, 0x00, 
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7e, 
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xfc, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
  0x13, 0xf0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x6f, 0xe0, 0x00, 0x00, 0x00, 0x00, 0x00, 
  0x00, 0x00, 0xdf, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0xff, 0x00, 0x00, 0x00, 0x00, 
  0x00, 0x00, 0x00, 0x07, 0xfc, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1f, 0xf8, 0x00, 0x06, 
  0x00, 0x00, 0x00, 0x00, 0x40, 0x3f, 0xe0, 0x00, 0x3c, 0x00, 0x00, 0x00, 0x00, 0x40, 0x7f, 0xc0, 
  0x00, 0xf8, 0x00, 0x00, 0x00, 0x00, 0xc1, 0xff, 0x00, 0x07, 0xe0, 0x00, 0x00, 0x00, 0x01, 0x83, 
  0xfe, 0x00, 0x1f, 0xc0, 0x00, 0x00, 0x00, 0x03, 0x9f, 0xf8, 0x00, 0xff, 0x00, 0x00, 0x00, 0x00, 
  0x03, 0x3f, 0xf0, 0x37, 0xf8, 0x00, 0x1f, 0xf0, 0x7f, 0xff, 0xff, 0xc3, 0xff, 0xe0, 0x00, 0x1f, 
  0xf0, 0x7f, 0xff, 0xff, 0x9f, 0xff, 0x80, 0x00, 0x1f, 0xf0, 0x7f, 0xff, 0xfe, 0xff, 0xfc, 0x00, 
  0x00, 0x01, 0xf0, 0x7c, 0x3f, 0xff, 0xff, 0xe0, 0x00, 0x00, 0x01, 0xf0, 0x7c, 0x1f, 0xff, 0xff, 
  0x00, 0x00, 0x00, 0x01, 0xf0, 0x7c, 0x1f, 0xff, 0xfc, 0x00, 0x00, 0x00, 0x01, 0xf0, 0x7c, 0x1f, 
  0xff, 0xe0, 0x00, 0x00, 0x1c, 0x01, 0xf0, 0x7f, 0xff, 0xff, 0x00, 0x00, 0x1f, 0xf8, 0x01, 0xf0, 
  0x7f, 0xff, 0xf0, 0xff, 0xbf, 0xff, 0xc0, 0x01, 0xf0, 0x7f, 0xff, 0xff, 0xff, 0xff, 0xfc, 0x00, 
  0x01, 0xf0, 0x7f, 0xff, 0xff, 0xff, 0xff, 0xc0, 0x00, 0x01, 0xf0, 0x7c, 0x0f, 0xff, 0xff, 0xf0, 
  0x00, 0x00, 0x01, 0xf0, 0x7c, 0x07, 0xff, 0xfc, 0x00, 0x00, 0x00, 0x01, 0xf0, 0x7c, 0x07, 0xfc, 
  0x00, 0x00, 0x00, 0x00, 0x01, 0xf0, 0x7c, 0x0f, 0xff, 0x80, 0x00, 0x00, 0x00, 0x83, 0xf0, 0x7c, 
  0x1f, 0xff, 0xfc, 0x00, 0x00, 0x00, 0xff, 0xf0, 0x7f, 0xff, 0xff, 0xfe, 0x00, 0x00, 0x00, 0xff, 
  0xe0, 0x7f, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0xff, 0xc0, 0x7f, 0xff, 0xc7, 0xff, 0xff, 0xfe, 
  0x00, 0x7f, 0x00, 0x00, 0x1f, 0xf8, 0x01, 0xff, 0xfe, 0x00, 0x00, 0x00, 0x00, 0x03, 0xfe, 0x00, 
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
  0x1f, 0xe0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0xf0, 0x00, 0x00, 0x00, 0x00, 0x00, 
  0x00, 0x00, 0x00, 0x7e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0xc0, 0x00, 0x00, 
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00
};

#if (SSD1306_LCDHEIGHT != 64)
#error("Height incorrect, please fix Adafruit_SSD1306.h!");
#endif

int16_t setHeatgetCurrent(uint8_t n, uint8_t puissance) {
  Wire.beginTransmission(0x18);
  Wire.write(n);
  Wire.write(puissance);
  Wire.endTransmission();
  Wire.requestFrom(0x18, 2);
  return ((Wire.read() << 8 | Wire.read()) - 517) * 3.22265625 / 0.110 / 1.1384615384615384615384615384615;
 //return Wire.read() << 8 | Wire.read();
}

uint16_t getTemp() {
  do {
  Wire.beginTransmission(0x4D);
  } while (Wire.endTransmission());
  Wire.requestFrom(0x4D, 2);
  return 0.1224 / 1.1515 * (Wire.read() << 8 | Wire.read()) + 96;
}

uint16_t getAcc() {
  static int16_t ax, ay, az, dx, dy, dz, ds;
  accel.read();
  dx = accel.x - ax;
  dy = accel.y - ay;
  dz = accel.z - az;
  ax = accel.x;
  ay = accel.y;
  az = accel.z;
  return (uint16_t)sqrt(pow(dx,2)+pow(dy,2)+pow(dz,2));
}

// Fonction appelée lors d'une interruption déclenchée par un changement d'état sur un des pins du bouton rotatif
void Encodeur() {
  if(digitalRead(pin_n)==HIGH){
    if (TemperatureCible <= 410) {
      TemperatureCible += 10;
    }
  }else {
    if (TemperatureCible >= 210) {
      TemperatureCible -= 10;
    }
  }
}

#define debug_x 2
#define debug_y 1
#define debug_ok_y 110

void setup() { 
  wdt_disable();
  wdt_enable(WDTO_1S);
  pinMode(pin_n, INPUT_PULLUP);
  pinMode(pin_p, INPUT_PULLUP);
  pinMode(pin_bp, INPUT_PULLUP);
  wdt_reset();
  delay(500);
  display.begin(SSD1306_SWITCHCAPVCC, 0x3C);
  display.display();
  display.fillScreen(BLACK);
  display.setTextSize(1);
  display.setTextColor(WHITE);
  display.setCursor(debug_x, debug_y);
  delay(1);
  wdt_reset();

  display.drawBitmap(128/2-LOGO_W/2, 64-LOGO_H, logo, LOGO_W, LOGO_H, WHITE);
  display.display();

  display.print("Attiny85...");
  display.display();
  do {
  Wire.beginTransmission(0x18); // Tentative de connexion à l'attiny85
  } while (Wire.endTransmission());
  display.fillRect(0, 0, 128, 20, BLACK);
  wdt_reset();
  
  display.setCursor(debug_x, debug_y);
  display.print("ADC...");
  display.display();
  do {
  Wire.beginTransmission(0x4D);
  } while (Wire.endTransmission());
  display.fillRect(0, 0, 128, 20, BLACK);
  wdt_reset();
  
  display.setCursor(debug_x, debug_y);
  display.print("Accelerometre...");
  display.display();
  do {
  Wire.beginTransmission(0x1C);
  } while (Wire.endTransmission());
  display.fillRect(0, 0, 128, 20, BLACK);
  accel.init(SCALE_2G, ODR_50);
  //getAcc();
  acc = getAcc();
  wdt_reset();

  display.setCursor(debug_x, debug_y);
  display.print("EEPROM...");
  display.display();
  TemperatureCible = EEPROM.read(0x00) | EEPROM.read(0x01) << 8 | EEPROM.read(0x02) << 16 | EEPROM.read(0x03) << 24;
    if (TemperatureCible > 420 || TemperatureCible < 200) {
    TemperatureCible = 320;
  }
  display.fillRect(0, 0, 128, 20, BLACK);
  wdt_reset();
  
  display.setCursor(debug_x, debug_y);
  display.print("Capteur IR...");
  display.display();
  Wire.beginTransmission(0x5A);
  int retourIR = Wire.endTransmission();

  if (retourIR == 0) {
    capteurIR = 1;
  } else {
    capteurIR = 0;
  } 
  display.display();
  display.fillRect(0, 0, 128, 20, BLACK);
  wdt_reset();
  
  display.setCursor(debug_x, debug_y);
  display.print("Tactile/LED...");
  display.display();

  if (cap.begin(0x5C)) {
    MPR = 1;
  } else {
    MPR = 0;
  } 
  display.fillRect(0, 0, 128, 20, BLACK);
  wdt_reset();
  attachInterrupt(digitalPinToInterrupt(pin_p), Encodeur, RISING); // L'interruption pour le bouton rotatif
}



void loop() {
  wdt_reset();
  if (accel.available())
  {
    acc = getAcc();
  }

  

  Wire.beginTransmission(0x5A);
  int retourIR = Wire.endTransmission();
  if (retourIR == 0) {
    capteurIR = 1;
  } else {
    capteurIR = 0;
  }

  static char etatPrecedent = 0;
  static char  on = 0;
  if (acc > 500 || acc > 50 && etatPrecedent) on = 30;
  if (on > 0) etatPrecedent = on--;

  if (digitalRead(pin_bp)){
    EEPROM.write(0x00, TemperatureCible & 0xFF);
    EEPROM.write(0x01, (TemperatureCible << 8) & 0xFF);
    EEPROM.write(0x02, (TemperatureCible << 16)  & 0xFF);
    EEPROM.write(0x03, (TemperatureCible << 24)  & 0xFF);
  }

  int16_t courant = setHeatgetCurrent(0, 0);
  static int16_t courantLisse = 0;
   courantLisse = (courantLisse + courant) / 2;
  delay(1); // On attend un peu avant de mesurer la température
  
  uint16_t Temperature = getTemp();
  static uint16_t TemperatureLisse = 0;
  TemperatureLisse = (TemperatureLisse * 2 + Temperature) / 3;

  uint8_t nchauffage = 0;

  if (Temperature > TemperatureCible) nchauffage = 0;
  else  if (on) {
    uint16_t diff = TemperatureCible - Temperature;
    if (diff < 5) nchauffage = 5;
    else if (diff < 20) nchauffage = 40;
    else nchauffage = 80; 
  }

  const uint16_t puissanceCible = 40000;
  static uint8_t valPWM = 100;
  uint32_t puissance = (uint16_t) courant * (12 * valPWM / 255.);
  if (puissance > puissanceCible + 10000) {
    valPWM = (valPWM > 50) ? valPWM - 15 : 0;
  } else if (puissance > puissanceCible + 5000) {
    valPWM = (valPWM > 20) ? valPWM - 2 : 0;
  } else if (puissance > puissanceCible + 2000) {
    valPWM = (valPWM > 1) ? valPWM - 1 : 0;
  } else if (puissance < puissanceCible - 2000) {
    valPWM = (valPWM < 255 - 50) ? valPWM + 15 : 255;
  } else if (puissance < puissanceCible - 5000) {
    valPWM = (valPWM < 255 - 20) ? valPWM + 2 : 255;
  } else if (puissance < puissanceCible - 10000) {
    valPWM = (valPWM < 255 - 1) ? valPWM + 1 : 255;
  }
  
  if (on) setHeatgetCurrent(nchauffage, valPWM); //

  display.fillScreen(BLACK);

  if(capteurIR) {
    display.setTextSize(3);
    display.setCursor(2,22);
    if (Temperature >= 120 && Temperature < 529) {
      display.print(TemperatureLisse);  // On affiche la température si elle est supérieure à 100°CLisse
      display.setTextSize(2);
      display.print("C");
    }
    else {
      display.print("---");
    }
    display.setTextSize(2);
    display.setCursor(88,15);
    display.print(mlx.readObjectTempC(),0);
    display.setTextSize(1);
    display.print("C");
    display.setTextSize(2);
    display.setCursor(88,31);
    display.print(mlx.readAmbientTempC(),0);
    display.setTextSize(1);
    display.print("C");
    
  } else {
    display.setTextSize(4);
    display.setCursor(2,22);
    if (Temperature >= 120 && Temperature < 529) {
      display.print(TemperatureLisse);  // On affiche la température si elle est supérieure à 100°CLisse
    }
    else {
      display.print("---");
    }
    display.setCursor(85,18);
    display.setTextSize(2);
    display.print("o");
    display.setCursor(100,18);
    display.setTextSize(3);
    display.print("C");
  }
  display.setTextSize(2);
  display.setCursor(1,1);
  char TemperatureCibleAffichage[6];
  sprintf(TemperatureCibleAffichage, "%3d", TemperatureCible);
  display.print(TemperatureCibleAffichage);
  display.setTextSize(1);
  display.print("C");


  char enHautADroite2[10];
  display.drawFastHLine(55, 0, sqrt(acc), WHITE); 
  display.setTextSize(1);
  if ( Temperature < 529) {
    sprintf(enHautADroite2, "%ld", puissance);
  } else {
    sprintf(enHautADroite2, "-.--");
  }
  display.setCursor(93,4);
  display.print(enHautADroite2);
  display.setCursor(55, 4);
  char enHautADroite1[10];
  if (on)
  sprintf(enHautADroite1, "ON %2d", on);
  else
  sprintf(enHautADroite1, "OFF");

  display.print(enHautADroite1);

  if ( Temperature < 529) {
    display.fillRect(0,57 , (TemperatureLisse>80) ? (TemperatureLisse-60)*128./370 : 1, 6, WHITE);
    display.fillTriangle( (TemperatureCible-60)*128./370. - 2 , 50, (TemperatureCible-60)*128./370., 55, (TemperatureCible-60)*128./370. +2, 50, WHITE);
  }
/*
  if(MPR) {
    display.setCursor(1, 55);
    display.print(cap.touched(), BIN);
    
  }
    */
  display.display();
  display.fillScreen(BLACK);
  display.setCursor(1,1);
}

