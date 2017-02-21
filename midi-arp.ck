MidiIn min;
MidiMsg inmsg;
MidiOut mou;
MidiMsg outmsg;

0 => int input_device;
1 => int output_device;

if( me.args() ) me.arg(0) => Std.atoi => input_device;
if( me.args() ) me.arg(1) => Std.atoi => output_device;

if(!min.open(input_device)) me.exit();
if(!mou.open(output_device)) me.exit();

<<< "Midi output: ", mou.name() >>>;
<<< "Midi input: ", min.name() >>>;

0 => int start;
4 => int length;
36 => int tonic;
if(me.args() > 2) {
	me.arg(2) => Std.atoi => tonic;
}
else {
	36 => tonic;
}

75::ms => dur rest;
100::ms => dur duration;

0 => int cursor;

250 => int geneLength;
int notes[250];
0 => notes[0];
4 => notes[1];
7 => notes[2];
7 => notes[3];
0 => notes[4];
4 => notes[5];
4 => notes[6];
4 => notes[7];
0 => notes[8];
4 => notes[9];
11 => notes[10];
4 => notes[11];
7 => notes[12];
11 => notes[13];
4 => notes[14];
11 => notes[15];
4 => notes[16];
4 => notes[17];
11 => notes[18];
7 => notes[19];
11 => notes[20];
7 => notes[21];
4 => notes[22];
4 => notes[23];
7 => notes[24];
0 => notes[25];
0 => notes[26];
7 => notes[27];
0 => notes[28];
0 => notes[29];
7 => notes[30];
4 => notes[31];
0 => notes[32];
11 => notes[33];
0 => notes[34];
0 => notes[35];
0 => notes[36];
0 => notes[37];
4 => notes[38];
7 => notes[39];
4 => notes[40];
11 => notes[41];
0 => notes[42];
4 => notes[43];
4 => notes[44];
0 => notes[45];
0 => notes[46];
4 => notes[47];
7 => notes[48];
11 => notes[49];
4 => notes[50];
0 => notes[51];
4 => notes[52];
7 => notes[53];
11 => notes[54];
0 => notes[55];
7 => notes[56];
0 => notes[57];
0 => notes[58];
0 => notes[59];
0 => notes[60];
4 => notes[61];
11 => notes[62];
4 => notes[63];
4 => notes[64];
0 => notes[65];
7 => notes[66];
0 => notes[67];
7 => notes[68];
4 => notes[69];
7 => notes[70];
4 => notes[71];
11 => notes[72];
11 => notes[73];
11 => notes[74];
0 => notes[75];
4 => notes[76];
11 => notes[77];
4 => notes[78];
7 => notes[79];
4 => notes[80];
11 => notes[81];
4 => notes[82];
7 => notes[83];
7 => notes[84];
0 => notes[85];
7 => notes[86];
4 => notes[87];
4 => notes[88];
7 => notes[89];
0 => notes[90];
4 => notes[91];
11 => notes[92];
0 => notes[93];
0 => notes[94];
7 => notes[95];
7 => notes[96];
0 => notes[97];
0 => notes[98];
11 => notes[99];
11 => notes[100];
4 => notes[101];
7 => notes[102];
4 => notes[103];
11 => notes[104];
4 => notes[105];
11 => notes[106];
11 => notes[107];
0 => notes[108];
11 => notes[109];
0 => notes[110];
0 => notes[111];
0 => notes[112];
7 => notes[113];
4 => notes[114];
7 => notes[115];
4 => notes[116];
7 => notes[117];
0 => notes[118];
11 => notes[119];
11 => notes[120];
0 => notes[121];
11 => notes[122];
0 => notes[123];
4 => notes[124];
0 => notes[125];
4 => notes[126];
4 => notes[127];
4 => notes[128];
4 => notes[129];
7 => notes[130];
11 => notes[131];
0 => notes[132];
0 => notes[133];
0 => notes[134];
4 => notes[135];
4 => notes[136];
4 => notes[137];
4 => notes[138];
7 => notes[139];
11 => notes[140];
0 => notes[141];
4 => notes[142];
7 => notes[143];
11 => notes[144];
4 => notes[145];
7 => notes[146];
0 => notes[147];
0 => notes[148];
0 => notes[149];
11 => notes[150];
4 => notes[151];
4 => notes[152];
11 => notes[153];
4 => notes[154];
11 => notes[155];
0 => notes[156];
0 => notes[157];
11 => notes[158];
11 => notes[159];
0 => notes[160];
7 => notes[161];
0 => notes[162];
0 => notes[163];
7 => notes[164];
0 => notes[165];
0 => notes[166];
0 => notes[167];
7 => notes[168];
7 => notes[169];
7 => notes[170];
11 => notes[171];
11 => notes[172];
4 => notes[173];
4 => notes[174];
11 => notes[175];
0 => notes[176];
11 => notes[177];
0 => notes[178];
7 => notes[179];
4 => notes[180];
7 => notes[181];
4 => notes[182];
11 => notes[183];
11 => notes[184];
4 => notes[185];
4 => notes[186];
4 => notes[187];
0 => notes[188];
4 => notes[189];
7 => notes[190];
4 => notes[191];
0 => notes[192];
0 => notes[193];
7 => notes[194];
0 => notes[195];
0 => notes[196];
4 => notes[197];
7 => notes[198];
0 => notes[199];
4 => notes[200];
0 => notes[201];
4 => notes[202];
0 => notes[203];
0 => notes[204];
11 => notes[205];
11 => notes[206];
0 => notes[207];
0 => notes[208];
0 => notes[209];
0 => notes[210];
7 => notes[211];
7 => notes[212];
0 => notes[213];
7 => notes[214];
11 => notes[215];
11 => notes[216];
4 => notes[217];
0 => notes[218];
11 => notes[219];
0 => notes[220];
0 => notes[221];
7 => notes[222];
0 => notes[223];
0 => notes[224];
0 => notes[225];
7 => notes[226];
4 => notes[227];
0 => notes[228];
11 => notes[229];
7 => notes[230];
0 => notes[231];
7 => notes[232];
0 => notes[233];
4 => notes[234];
4 => notes[235];
4 => notes[236];
0 => notes[237];
7 => notes[238];
4 => notes[239];
11 => notes[240];
0 => notes[241];
0 => notes[242];
11 => notes[243];
4 => notes[244];
4 => notes[245];
7 => notes[246];
4 => notes[247];
4 => notes[248];
7 => notes[249];
0 => notes[249];


while(true) {
	rest => now;
	// on
	144 => outmsg.data1;
	notes[cursor + start] + tonic => outmsg.data2;
	127 => outmsg.data3;
	mou.send(outmsg);
	duration => now;
	// off
	128 => outmsg.data1;
	mou.send(outmsg);
	while(min.recv(inmsg)) {
		if(inmsg.data1 == 176) {
			if(inmsg.data2 == 30) {
				inmsg.data3 => start;
				if(start >= geneLength) {
					geneLength - 1 => start;
				}
				<<< "start: ", start >>>;
			}
			if(inmsg.data2 == 31) {
				inmsg.data3 => length;
				<<< "length", length >>>;
			}
			if(inmsg.data2 == 32) {
				inmsg.data3::ms => rest;
				<<< "rest", rest >>>;
			}
			//<<< inmsg.data1, inmsg.data2, inmsg.data3 >>>;
		}
	}
	cursor++;
	if(cursor >= length) {
		0 => cursor;
	}
}
