# WMRP-Station

Seeing the quality of WMRP tips from Weller, I wanted to buil my own station, cheaper that the official one.
It is still in development and some improvements are still to be made.
There is two PCBs : The first one seats in the base, and the other one is in the handle.

The first circuit has two microcontrollers, one dedicated to power regulation, and the other one for everything else. The power regulation is made with a half-bridge filtered with two LC low-pass filters. The PWM frequency is at about 100 KHz (I'm not sure, I need to check that), this way, the heating element will receive a smooth current and voltage. On an early version of this station, which was sending square-waves, it seemed to break the heating element.

The second is just made of some sensors to measure temperature of the tip, measure the acceleration of the handle (for automatic start and stop), to detect touch and finally to light up an RGB LED. These two last functions are not yet implemented, I neeed to make an other PCB.

To order the last version of PCBs :
https://pcbs.io/share/zjX5Z
https://pcbs.io/share/z5bD1

BOM is coming soon.