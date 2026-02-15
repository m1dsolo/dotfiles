/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static int centered = 0;                    /* -c option; centers dmenu on screen */
static int min_width = 500;                    /* minimum width when centered */
static const float menu_height_ratio = 4.0f;  /* This is the ratio used in the original calculation */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
    "SauceCodePro Nerd Font Mono:pixelsize=20:antialias=true:autohint=true",
    "SourceHanSansCN:pixelsize=20:antialias=true:autohint=true",
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*                   fg         bg */
	[SchemeNorm] = { "#434C5E", "#FFD6E1" },
	[SchemeSel] =  { "#434C5E", "#FFB6C1" },
	[SchemeOut] =  { "#FFFFFF", "#FF7681" },
	[SchemeBorder] = { "#FF7681", NULL },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/* Size of the window border */
static unsigned int border_width = 3;
