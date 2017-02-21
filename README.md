# DNA Music Sequencer prototype

A prototype which converts DNA gene data to MIDI arpeggios.

## What?

Three parts:
- a script which converts DNA nucleotides (`GATCCATA`) to semitone offsets (`0, 4, 7, 11` for the major scale).
- a midi arpeggiator which loops over the semitone offsets
- a teensy (arduino) sketch for a 3 knob arpeggiator controller (start, length, tempo).

A simpler version which doesn't require the 3 knob controller can be found under the `initial` tag.

## Usage

`./gene-to-chuck-array.js BRCA1.txt major` writes gene data transcribed into chuck code to the command line, which you have to paste into `midi-arp.ck`, replacing the array which is already in there. The first 111 notes of the BRCA1-gene in major are already in there for you to test with. Possible scales are `major` and `minor`.

Check which midi port you want to use for input and output with `chuck --probe`, then replace the `$VARIABLES` in the following command with the actual port numbers, and optionally the tonic: `chuck midi-arp.ck:$INPUT:$OUTPUT:$TONIC` (e.g. `chuck midi-arp.ck:0:1:48` if your rotary controller is on port 0, the MIDI instrument on port 2, and you want to start on C in the fourth octave). Tonic isn't required and defaults to 36 (C in the third octave).

The `midi-arp.ck` chuck script listens to control change (CC) MIDI messages on Note number 30, 31 and 32 (start, length and tonic respectively).

## Needs

- [NodeJS](https://nodejs.org/en/)
- [Chuck](http://chuck.cs.princeton.edu/)
- A midi controller (I've provided a script in case you have an arduino/teensy, three potentiometers, three capacitors, a few wires, and an urge to make everything yourself).

