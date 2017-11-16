/* 

  Julien BESSE

  Use board "Attiny 85" at 8 MHz :
  https://github.com/damellis/attiny/archive/master.zip

  Upload it to the microcontroller with an ISP programmer

*/


#include <TinyWireS.h>
//#include <usiTwiSlave.h>

// D4   : Pont_en
// A3 D3: Courant
// D2   : SCL
// D1   : Pont_in
// D0   : SDA

//Sine Wave Look Up Table 
const unsigned char demisinus[] = {
  0,   3,   6,   9,  12,  15,  18,  22,  25,  28,  31,  34,  37,  40,  43,  47,  50,  53,  56,  59,  62,  65,  68,  71,  74,  77,  80,  83,  86,  89,  92,  95,  98, 101, 104, 106, 109, 112, 115, 118, 121, 123, 126, 129, 132, 134, 137, 140, 142, 145, 147, 150, 152, 155, 157, 160, 162, 165, 167, 170, 172, 174, 176, 179, 181, 183, 185, 187, 190, 192, 194, 196, 198, 200, 202, 204, 205, 207, 209, 211, 213, 214, 216, 218, 219, 221, 222, 224, 225, 227, 228, 230, 231, 232, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 247, 248, 249, 250, 250, 251, 251, 252, 252, 253, 253, 253, 254, 254, 254, 254, 254, 254, 254, 255, 254, 254, 254, 254, 254, 254, 254, 253, 253, 253, 252, 252, 251, 251, 250, 250, 249, 248, 247, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 232, 231, 230, 228, 227, 225, 224, 222, 221, 219, 218, 216, 214, 213, 211, 209, 207, 205, 204, 202, 200, 198, 196, 194, 192, 190, 187, 185, 183, 181, 179, 176, 174, 172, 170, 167, 165, 162, 160, 157, 155, 152, 150, 147, 145, 142, 140, 137, 134, 132, 129, 126, 123, 121, 118, 115, 112, 109, 106, 104, 101,  98,  95,  92,  89,  86,  83,  80,  77,  74,  71,  68,  65,  62,  59,  56,  53,  50,  47,  43,  40,  37,  34,  31,  28,  25,  22,  18,  15,  12,   9,   6,   3,   0,
};

uint16_t courant_cible = 0;

void setup() {
  pinMode(4, OUTPUT);
  pinMode(1, OUTPUT);
  digitalWrite(1, LOW);

  TinyWireS.begin(24);  // Activation de l'I2C avec l'adresse 24, soit Ox18.

  // Activation de la PLL 64 Mhz
  PLLCSR |= (1 << PLLE);
  delayMicroseconds(100);
  while(!(PLLCSR & (1 << PLOCK)));  // On attend qu'elle se verrouille

  // Config des registres PWM pour sortie sur OC1B (pin 3, port 4)
  PLLCSR |= (1<<PCKE);
  TCCR1 = (0 << PWM1A) | (0 << COM1A0) | (1 << CS10) | (1 << CS11);
  GTCCR = (1 << PWM1B) | (1 << COM1B1);

}

unsigned int pic_courant = 0;
unsigned int n_impulsions = 0;
float puissance = 0.1;

void loop() {
 // while(n_impulsions > 0) {
    if (n_impulsions > 0) {
      digitalWrite(1, HIGH);
      TCCR1 = (0 << PWM1A) | (0 << COM1A0) | (1 << CS10) | (1 << CS11);
      for(int i = 0; i < 255; i++) {
        OCR1B = (uint8_t) demisinus[i] * puissance;
        if (i == 127) {
          pic_courant = analogRead(A3);
          delay(n_impulsions);
        }
      }
      digitalWrite(1, LOW);
      TCCR1 = 0;
  
      n_impulsions = 0;
    }
  //  n_impulsions--;
 // }
  
  if (TinyWireS.available()){          
    n_impulsions = TinyWireS.receive();
    puissance    = TinyWireS.receive() / 255.;
    TinyWireS.send(pic_courant >> 8);
    TinyWireS.send(pic_courant & 0xFF);

    if (n_impulsions > 80) n_impulsions = 0;
    if (puissance > 1) n_impulsions = 0;
  }
}
