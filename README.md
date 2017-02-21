# DNA Music Sequencer prototype

Very rudimentary prototype which converts a gene to playable MIDI

## Usage

`./gene-to-chuck-array.js BRCA1.txt major` writes gene data transcribed into chuck code to the command line, which you have to paste into `midi-arp.ck`, replacing the array which is already in there. The first 111 notes of the BRCA1-gene in major are already in there for you to test with. Possible scales are `major` and `minor`.

Check which midi port you want to output the notes to with `chuck --probe`, then replace the `$VARIABLES` in the following command with the actual port number, start, end, and optionally tonic: `chuck midi-arp.ck:$PORT:$START:$END:$TONIC` (e.g. `chuck midi-arp.ck:0:3:17:48`). Tonic isn't required and defaults to 36 (C in the third octave).

You can modify the tempo by adjusting the rest and duration variables in the `midi-arp.ck` file.