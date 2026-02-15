/* See LICENSE file for copyright and license details. */

#define TERMINAL "st"

/* appearance */
static const unsigned int borderpx  = 4;        /* border pixel of windows */
static const unsigned int gappx     = 5;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int swallowfloating    = 0;        /* 1 means swallow floating windows by default */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int vertpad            = 6;       /* vertical padding of bar */
static const int sidepad            = 6;       /* horizontal padding of bar */
static const char *fonts[]          = {
    "SauceCodePro Nerd Font Mono:pixelsize=20:antialias=true:autohint=true",
    "SourceHanSansCN:pixelsize=20:antialias=true:autohint=true",
};
static const char dmenufont[]       = "SauceCodePro Nerd Font Mono:pixelsize=20:antialias=true:autohint=true";
static const char normfgcolor[]     = "#434C5E";
static const char normbgcolor[]     = "#FFD6E1";
static const char normbordercolor[] = "#FFD6E1";
static const char selfgcolor[]      = "#434C5E";
static const char selbgcolor[]      = "#FFB6C1";
static const char selbordercolor[]  = "#FF7681";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { normfgcolor, normbgcolor, normbordercolor },
	[SchemeSel]  = { selfgcolor, selbgcolor, selbordercolor },
};

typedef struct {
	const char *name;
	const void *cmd;
} Sp;
const char *spcmd1[] = {TERMINAL, "-n", "spterm", "-g", "120x34", NULL};
static Sp scratchpads[] = {
	/* name          cmd  */
	{"spterm",      spcmd1},
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   isterminal   noswallow   monitor */
	// { "Firefox",  NULL,         NULL,       1 << 8,         0,            0,          -1,        -1 },
    { TERMINAL,   NULL,         NULL,       0,              0,            1,           0,        -1 },
	{ NULL,		  "spterm",		NULL,		SPTAG(0),		1,			  1,           0,        -1 },
};

/* layout(s) */
static const float mfact     = 0.5; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "",      tile },    /* first entry is default */
};

/* key definitions */
#define MODKEY Mod4Mask  /* Win key */
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

#define STATUSBAR "dwmblocks"

/* commands */
static const char *termcmd[]  = { "st", NULL };

#include <X11/XF86keysym.h>

static const Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_d,      spawn,          SHCMD("dmenu_run") },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
    { MODKEY|ShiftMask,             XK_Return, togglescratch,  {.ui = 0} },
    { MODKEY,                       XK_apostrophe,spawn,       SHCMD(TERMINAL " -e tm-markdown") }, // note
    // { MODKEY,                       XK_apostrophe,spawn,       SHCMD("tm-markdown") }, // note
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
    { MODKEY,                       XK_f,      togglefullscr,  {0} },
	{ MODKEY,                       XK_space,  zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_q,      killclient,     {0} },
	{ MODKEY|ShiftMask,             XK_f,  togglefloating, {0} },
	// { MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	// { MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
    { MODKEY|ShiftMask,             XK_comma,  spawn,          SHCMD("dm-monitor") },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_a,      setgaps,        {.i = -1 } },
	{ MODKEY,                       XK_a,      setgaps,        {.i = +1 } },
    { 0,                            XK_Print,  spawn,          SHCMD("screenshot") },
    { ShiftMask,                    XK_Print,  spawn,          SHCMD("dm-screenshot") },
    { MODKEY,                       XK_Print,  spawn,          SHCMD("dm-record") },
    { MODKEY,                       XK_Delete, spawn,          SHCMD("dm-record kill") },
    { MODKEY,                       XK_minus,  spawn,          SHCMD("pamixer --allow-boost -d 5; kill -41 $(pidof dwmblocks)") },
    { MODKEY,                       XK_equal,  spawn,          SHCMD("pamixer --allow-boost -i 5; kill -41 $(pidof dwmblocks)") },
    { MODKEY,                       XK_w,      spawn,          SHCMD("$BROWSER") },
    { MODKEY|ShiftMask,             XK_w,      spawn,          SHCMD(TERMINAL " -e sudo nmtui") },
    { MODKEY,                       XK_m,      spawn,          SHCMD(TERMINAL " -e ncmpcpp") },
    { MODKEY|ShiftMask,             XK_m,      spawn,          SHCMD("pamixer -t; kill -41 $(pidof dwmblocks)") },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
    { 0,            XF86XK_AudioMute,          spawn,          SHCMD("pamixer -t; kill -41 $(pidof dwmblocks)") },
    { 0,            XF86XK_AudioRaiseVolume,   spawn,          SHCMD("pamixer --allow-boost -i 3; kill -41 $(pidof dwmblocks)") },
    { 0,            XF86XK_AudioLowerVolume,   spawn,          SHCMD("pamixer --allow-boost -d 3; kill -41 $(pidof dwmblocks)") },
    { 0,            XF86XK_AudioPrev,          spawn,          SHCMD("mpc prev") },
    { 0,            XF86XK_AudioNext,          spawn,          SHCMD("mpc next") },
    { 0,            XF86XK_AudioPause,         spawn,          SHCMD("mpc pause") },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkStatusText,        0,              Button1,        sigstatusbar,   {.i = 1} },
	{ ClkStatusText,        0,              Button2,        sigstatusbar,   {.i = 2} },
	{ ClkStatusText,        0,              Button3,        sigstatusbar,   {.i = 3} },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

