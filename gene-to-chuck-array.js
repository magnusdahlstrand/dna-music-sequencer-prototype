#!/usr/bin/env node

var fs = require('fs');

if(process.argv.length === 2) {
	console.log(`usage: ./gene-to-chuck-array.js geneFile.txt [major|minor]`);
	process.exit(1);
}

var geneFile = process.argv[2];

var scaleChoice = process.argv[3] || 'major';

var scales = {
	major: {
		A: 0,
		T: 4,
		G: 7,
		C: 11,
	},
	minor: {
		A: 0,
		T: 3,
		G: 7,
		C: 10,
	}
}


if(!(scaleChoice in scales)) {
	// console.log(scaleChoice);
	throw new Error('scale not recognised');
}

fs.readFile(geneFile, 'utf8', function(err, geneData) {
	if(err) {
		throw err;
	}
	geneData = geneData.split(/\n/).join('');
	var geneLength = geneData.length;
	var scale = scales[scaleChoice];
	console.log(`${geneLength} => int geneLength;`);
	console.log(`int notes[geneLength];`);
	var note;
	for(var i = 0; i < geneLength; i++) {
		note = scale[geneData[i]];
		console.log(`${note} => notes[${i}];`)
		if(Number.isNaN(note)) {
			console.log(geneData[i], i, scale[geneData[i]]);
			throw new Error('weird character');
		}
	}
});