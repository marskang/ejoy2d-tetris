return {

{
	type = "label",
	id = 12,
	export = "default_label",
	width = 200,
	height = 100,
	font = "",
	align = 0,
	size = 16,
	color = 0xffffffff,
	noedge = true,
},
{
	type = "picture",
	id = 5,
	export = "next",
	{
		tex = 1,
		src = { 328, 121, 328, 184, 437, 184, 437, 121 },
		screen = { -824, -400, -824, 608, 920, 608, 920, -400 },
	},
},
{
	type = "picture",
	id = 8,
	export = "start1",
	{
		tex = 1,
		src = { 435, 66, 435, 114, 455, 114, 455, 66 },
		screen = { -120, -320, -120, 448, 200, 448, 200, -320 },
	},
},
{
	type = "picture",
	id = 1,
	export = "btn_start",
	{
		tex = 1,
		src = { 83, 1, 83, 92, 185, 92, 185, 1 },
		screen = { -816, -728, -816, 728, 816, 728, 816, -728 },
	},
},
{
	type = "picture",
	id = 6,
	export = "pause",
	{
		tex = 1,
		src = { 328, 186, 328, 248, 484, 248, 484, 186 },
		screen = { -1224, -400, -1224, 592, 1272, 592, 1272, -400 },
	},
},
{
	type = "picture",
	id = 10,
	export = "start3",
	{
		tex = 1,
		src = { 457, 66, 457, 114, 498, 114, 498, 66 },
		screen = { -272, -376, -272, 392, 384, 392, 384, -376 },
	},
},
{
	type = "picture",
	id = 0,
	export = "btn_pause",
	{
		tex = 1,
		src = { 1, 1, 1, 73, 81, 73, 81, 1 },
		screen = { -632, -576, -632, 576, 648, 576, 648, -576 },
	},
},
{
	type = "picture",
	id = 4,
	export = "go",
	{
		tex = 1,
		src = { 435, 1, 435, 64, 500, 64, 500, 1 },
		screen = { -472, -456, -472, 552, 568, 552, 568, -456 },
	},
},
{
	type = "picture",
	id = 2,
	export = "erase",
	{
		tex = 1,
		src = { 187, 1, 187, 44, 326, 44, 326, 1 },
		screen = { -1104, -288, -1104, 400, 1120, 400, 1120, -288 },
	},
},
{
	type = "picture",
	id = 9,
	export = "start2",
	{
		tex = 1,
		src = { 471, 250, 471, 299, 510, 299, 510, 250 },
		screen = { -280, -328, -280, 456, 344, 456, 344, -328 },
	},
},
{
	type = "picture",
	id = 3,
	export = "gameover",
	{
		tex = 1,
		src = { 187, 46, 187, 119, 433, 119, 433, 46 },
		screen = { -1968, -584, -1968, 584, 1968, 584, 1968, -584 },
	},
},
{
	type = "picture",
	id = 7,
	export = "ready",
	{
		tex = 1,
		src = { 328, 250, 328, 346, 469, 346, 469, 250 },
		screen = { -1096, -720, -1096, 816, 1160, 816, 1160, -720 },
	},
},
{
	type = "animation",
	id = 11,
	export = "start",
	component = {
		{ id = 7, name = "ready" },
		{ id = 10, name = "start3" },
		{ id = 9, name = "start2" },
		{ id = 8, name = "start1" },
		{ id = 4, name = "go"},
	},
	{
		{ 0 },
		{ 1 },
		{ 2 },
		{ 3 },
		{ 4 },
	},
},

}
