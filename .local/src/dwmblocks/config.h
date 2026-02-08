//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"",    "cat /tmp/recordingicon 2>/dev/null",	0,	1},
	{"",	"sb-music",	    0,	2},
	{"",	"sb-cpu-temp",		10,	4},
	{"",	"sb-memory",	10,	3},
	{"",	"sb-gpu-memory",	10,	3},
	{"",	"sb-disk",		10,	5},
	{"",	"sb-nettraf",	1,	6},
	{"",	"sb-volume",	0,	7},
	{"",	"sb-battery",	5,	8},
	{"",	"sb-internet",	5,	9},
	{"",	"sb-clock",	    60,	11},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " ";
static unsigned int delimLen = 2;
