
frame = {}

border = 7;
local borderW = 50;
local borderH = 50;


local tBorder = border << 4;

function frame.draw(shader, TEXID, x, y, width, height) 

	x = (x << 4) - (512 << 4)
	y = (y << 4) - (384 << 4)
	width = width << 4;
	height = height << 4;
	sx1 = 0;sy1 = 0
	sx2 = 0;sy2 = border
	sx3 = border;sy3 = border
	sx4 = border;sy4 = 0
	
	dx1 = 0 + x;dy1 =   y 
	dx2 = 0 + x;dy2 = tBorder + y
	dx3 = tBorder + x;dy3 = tBorder + y
	dx4 = tBorder + x;dy4 =  y
	shader.draw(TEXID, {
		sx1,sy1, sx2, sy2,sx3, sy3, sx4,sy4, 	-- texture coord
		dx1, dy1, dx2, dy2, dx3, dy3, dx4, dy4, -- screen coord, 16x pixel, (0,0) is the center of screen
	})
	sx1 = 0;sy1 = border
	sx2 = border;sy2 = border
	sx3 = border;sy3 = border + borderH
	sx4 = 0;sy4 = border + borderH
	
	dx1 = 0 + x;dy1 = tBorder + y
	dx2 = 0 + x;dy2 = height + y + tBorder
	dx3 = tBorder + x;dy3 = height + y + tBorder
	dx4 = tBorder + x;dy4 = tBorder + y
	--[[shader.draw(TEXID, {
		sx1,sy1,sx2, sy2, sx3, sy3,sx4, sy4,  	-- texture coord
		dx1, dy1, dx2, dy2, dx3, dy3, dx4, dy4,-- screen coord, 16x pixel, (0,0) is the center of screen
	})]]
	shader.draw(TEXID, {
		sx1,sy1,sx4,sy4,sx3,sy3,sx2,sy2,
		dx1, dy1, dx2, dy2, dx3, dy3, dx4, dy4,
	})
	
	sx1 = border;sy1 = 0
	sx2 = border;sy2 = border
	sx3 = border + borderW;sy3 = border
	sx4 = border + borderW;sy4 = 0
	
	dx1 = tBorder + x;dy1 =  y
	dx2 = tBorder + x;dy2 = tBorder + y
	dx3 = tBorder + width + x;dy3 = tBorder + y
	dx4 = tBorder + width + x;dy4 =  y
	shader.draw(TEXID, {
		sx1,sy1, sx2, sy2,sx3, sy3, sx4,sy4, 	-- texture coord
		dx1, dy1, dx2, dy2, dx3, dy3, dx4, dy4, -- screen coord, 16x pixel, (0,0) is the center of screen
	})
	
	sx1 = border + borderW;sy1 = 0
	sx2 = border + borderW;sy2 = border
	sx3 = (border << 1) + borderW;sy3 = border
	sx4 = (border << 1) + borderW;sy4 = 0
	
	dx1 = tBorder + width + x;dy1 =  y
	dx2 = tBorder + width + x;dy2 = tBorder + y
	dx3 = tBorder + width + tBorder + x;dy3 = tBorder + y
	dx4 = tBorder + width + tBorder + x;dy4 =  y
	shader.draw(TEXID, {
		sx1,sy1, sx2, sy2,sx3, sy3, sx4,sy4, 	-- texture coord
		dx1, dy1, dx2, dy2, dx3, dy3, dx4, dy4, -- screen coord, 16x pixel, (0,0) is the center of screen
	})
	
	sx1 = border + borderW;sy1 = border
	sx2 = border + borderW;sy2 = border + borderH
	sx3 = (border << 1) + borderW;sy3 = border + borderH
	sx4 = (border << 1) + borderW;sy4 = border
	
	dx1 = tBorder + width + x;dy1 = tBorder + y
	dx2 = tBorder + width + x;dy2 = height + y + tBorder
	dx3 = tBorder + width + tBorder + x;dy3 = height + y + tBorder
	dx4 = tBorder + width + tBorder + x;dy4 = tBorder + y
	shader.draw(TEXID, {
		sx1,sy1, sx2, sy2,sx3, sy3, sx4,sy4, 	-- texture coord
		dx1, dy1, dx2, dy2, dx3, dy3, dx4, dy4, -- screen coord, 16x pixel, (0,0) is the center of screen
	})
	
	sx1 = border + borderW;sy1 = border + borderH
	sx2 = border + borderW;sy2 = (border << 1) + borderH
	sx3 = (border << 1) + borderW;sy3 = (border << 1) + borderH
	sx4 = (border << 1) + borderW;sy4 = border + borderH
	
	dx1 = tBorder + width + x;dy1 = height + y + tBorder
	dx2 = tBorder + width + x;dy2 = height + tBorder + y + tBorder
	dx3 = tBorder + width + tBorder + x;dy3 = height + tBorder + y + tBorder
	dx4 = tBorder + width + tBorder + x;dy4 = height + y
	shader.draw(TEXID, {
		sx1,sy1, sx2, sy2,sx3, sy3, sx4,sy4, 	-- texture coord
		dx1, dy1, dx2, dy2, dx3, dy3, dx4, dy4, -- screen coord, 16x pixel, (0,0) is the center of screen
	})
	
	sx1 = border;sy1 = border + borderH
	sx2 = border;sy2 = (border << 1) + borderH
	sx3 = border + borderW;sy3 = (border << 1) + borderH
	sx4 = border + borderW;sy4 = border + borderH
	
	dx1 = tBorder  + x;dy1 = height + y + tBorder
	dx2 = tBorder  + x;dy2 = height + tBorder + y + tBorder
	dx3 = tBorder + width + x;dy3 = height + tBorder + y + tBorder
	dx4 = tBorder + width + x;dy4 = height + y + tBorder
	shader.draw(TEXID, {
		sx1,sy1, sx2, sy2,sx3, sy3, sx4,sy4, 	-- texture coord
		dx1, dy1, dx2, dy2, dx3, dy3, dx4, dy4, -- screen coord, 16x pixel, (0,0) is the center of screen
	})
	
	sx1 = 0;sy1 = border + borderH
	sx2 = 0;sy2 = (border << 1) + borderH
	sx3 = border;sy3 = (border << 1) + borderH
	sx4 = border;sy4 = border + borderH
	
	dx1 = 0  + x;dy1 = height + y + tBorder
	dx2 = 0  + x;dy2 = height + tBorder + y + tBorder
	dx3 = tBorder + x;dy3 = height + tBorder + y + tBorder
	dx4 = tBorder + x;dy4 = height + y + tBorder
	shader.draw(TEXID, {
		sx1,sy1, sx2, sy2,sx3, sy3, sx4,sy4, 	-- texture coord
		dx1, dy1, dx2, dy2, dx3, dy3, dx4, dy4, -- screen coord, 16x pixel, (0,0) is the center of screen
	})
	
	sx1 = border;sy1 = border
	sx2 = border;sy2 = border + borderH
	sx3 = border + borderW;sy3 = border + borderH
	sx4 = border + borderW;sy4 = border
	
	dx1 = tBorder  + x;dy1 = y + tBorder
	dx2 = tBorder + x;dy2 = height + tBorder + y
	dx3 = tBorder + x + width;dy3 = height + y + tBorder
	dx4 = tBorder + width + x;dy4 =  y + tBorder
	shader.draw(TEXID, {
		sx1,sy1, sx2, sy2,sx3, sy3, sx4,sy4, 	-- texture coord
		dx1, dy1, dx2, dy2, dx3, dy3, dx4, dy4, -- screen coord, 16x pixel, (0,0) is the center of screen
	})
end

return frame;