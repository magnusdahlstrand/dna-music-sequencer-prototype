#include <MIDI.h>
#define LED 13
#define A_PIN A0
#define A_NOTE 30
#define B_PIN A1
#define B_NOTE 31
#define C_PIN A2
#define C_NOTE 32

// Connect three potentiometers:
// AGND to one ear
// 3.3V to the other
// A0 - A2 to the middle
// Add a 100nF/0.1uF capacitor between the ground ear
// and the middle to smooth the input signal


int midiChannel = 1;

void setup(void) {
	while(!Serial) {
		;
	}
	Serial.println("ready");
	pinMode(LED, OUTPUT);
	pinMode(A_PIN, INPUT_PULLUP);
	pinMode(B_PIN, INPUT_PULLUP);
	pinMode(C_PIN, INPUT_PULLUP);
}

int updatePot(int pin, int oldValue, int midiNote, int minSize, int maxSize) {
	int newValue = analogRead(pin);
	if(abs(newValue - oldValue) > 4) {
		usbMIDI.sendControlChange(midiNote, map(newValue, 0, 1023, minSize, maxSize), midiChannel);
		return newValue;
	}
	return oldValue;
}

int valuePotA, valuePotB, valuePotC;
void loop(void) {
	valuePotA = updatePot(A_PIN, valuePotA, A_NOTE, 0, 127);
	delay(5);
	valuePotB = updatePot(B_PIN, valuePotB, B_NOTE, 1, 32);
	delay(5);
	valuePotC = updatePot(C_PIN, valuePotC, C_NOTE, 0, 127);
	delay(5);
}
