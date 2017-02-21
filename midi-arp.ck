MidiOut mou;
MidiMsg msg;

1 => int output_device;

if( me.args() ) me.arg(0) => Std.atoi => output_device;

if(!mou.open(output_device)) me.exit();

<<< "Midi output: ", mou.name() >>>;

int start, end, tonic;
if(me.args() > 1) {
	me.arg(1) => Std.atoi => start;
}
else {
	0 => start;
}
if(me.args() > 2) {
	me.arg(2) => Std.atoi => end;
}
else {
	4 => end;
}
if(me.args() > 3) {
	me.arg(3) => Std.atoi => tonic;
}
else {
	36 => tonic;
}

125::ms => dur rest;
100::ms => dur duration;

start => int cursor;

111 => int length;
int notes[111];
0 => notes[0];
3 => notes[1];
7 => notes[2];
7 => notes[3];
0 => notes[4];
3 => notes[5];
3 => notes[6];
3 => notes[7];
0 => notes[8];
3 => notes[9];
10 => notes[10];
3 => notes[11];
7 => notes[12];
10 => notes[13];
3 => notes[14];
10 => notes[15];
3 => notes[16];
3 => notes[17];
10 => notes[18];
7 => notes[19];
10 => notes[20];
7 => notes[21];
3 => notes[22];
3 => notes[23];
7 => notes[24];
0 => notes[25];
0 => notes[26];
7 => notes[27];
0 => notes[28];
0 => notes[29];
7 => notes[30];
3 => notes[31];
0 => notes[32];
10 => notes[33];
0 => notes[34];
0 => notes[35];
0 => notes[36];
0 => notes[37];
3 => notes[38];
7 => notes[39];
3 => notes[40];
10 => notes[41];
0 => notes[42];
3 => notes[43];
3 => notes[44];
0 => notes[45];
0 => notes[46];
3 => notes[47];
7 => notes[48];
10 => notes[49];
3 => notes[50];
0 => notes[51];
3 => notes[52];
7 => notes[53];
10 => notes[54];
0 => notes[55];
7 => notes[56];
0 => notes[57];
0 => notes[58];
0 => notes[59];
0 => notes[60];
3 => notes[61];
10 => notes[62];
3 => notes[63];
3 => notes[64];
0 => notes[65];
7 => notes[66];
0 => notes[67];
7 => notes[68];
3 => notes[69];
7 => notes[70];
3 => notes[71];
10 => notes[72];
10 => notes[73];
10 => notes[74];
0 => notes[75];
3 => notes[76];
10 => notes[77];
3 => notes[78];
7 => notes[79];
3 => notes[80];
10 => notes[81];
3 => notes[82];
7 => notes[83];
7 => notes[84];
0 => notes[85];
7 => notes[86];
3 => notes[87];
3 => notes[88];
7 => notes[89];
0 => notes[90];
3 => notes[91];
10 => notes[92];
0 => notes[93];
0 => notes[94];
7 => notes[95];
7 => notes[96];
0 => notes[97];
0 => notes[98];
10 => notes[99];
10 => notes[100];
3 => notes[101];
7 => notes[102];
3 => notes[103];
10 => notes[104];
3 => notes[105];
10 => notes[106];
10 => notes[107];
0 => notes[108];
10 => notes[109];
0 => notes[110];

while(true) {
	rest => now;
	<<< "note: ", cursor >>>;	
	// on
	144 => msg.data1;
	notes[cursor] + tonic => msg.data2;
	127 => msg.data3;
	mou.send(msg);
	duration => now;
	// off
	128 => msg.data1;
	mou.send(msg);
	cursor++;
	if(cursor > end) {
		start => cursor;
	}
}
