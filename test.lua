local ej = require "ejoy2d"
local geo = require "ejoy2d.geometry"
local spr = require "ejoy2d.sprite"
local fw = require "ejoy2d.framework"
local pack = require "ejoy2d.simplepackage"
local shader = require "ejoy2d.shader"
local ppm = require "ejoy2d.ppm"
local frame = require "examples/frame"

local pack = require "ejoy2d.simplepackage"

pack.load {
	pattern = fw.WorkDir..[[examples/asset/?]],
	"rect",
}

pack.load {
	pattern = fw.WorkDir..[[examples/asset/?]],
	"ui",
}

pack.load {
	pattern = fw.WorkDir..[[examples/asset/?]],
	"next",
}

local square1 = ej.sprite("rect", "square1")
local square2 = ej.sprite("rect", "square2")
local square3 = ej.sprite("rect", "square3")
local square4 = ej.sprite("rect", "square4")
local square5 = ej.sprite("rect", "square5")
local square6 = ej.sprite("rect", "square6")
local square7 = ej.sprite("rect", "square7")
local square8 = ej.sprite("rect", "square8")
local square9 = ej.sprite("rect", "square9")

local shadow1 = ej.sprite("rect", "shadow1")
local shadow2 = ej.sprite("rect", "shadow2")
local shadow3 = ej.sprite("rect", "shadow3")
local shadow4 = ej.sprite("rect", "shadow4")
local shadow5 = ej.sprite("rect", "shadow5")
local shadow6 = ej.sprite("rect", "shadow6")
local shadow7 = ej.sprite("rect", "shadow7")

local btn_start = ej.sprite("ui", "btn_start")
local btn_pause = ej.sprite("ui", "btn_pause")
local ui_next = ej.sprite("ui", "next")
local ui_erase = ej.sprite("ui", "erase")
local ui_pause = ej.sprite("ui", "pause")
local ui_gameover = ej.sprite("ui","gameover")
local startAni = ej.sprite("ui", "start");

local next1 = ej.sprite("next","next1")
local next2 = ej.sprite("next","next2")
local next3 = ej.sprite("next","next3")
local next4 = ej.sprite("next","next4")
local next5 = ej.sprite("next","next5")
local next6 = ej.sprite("next","next6")
local next7 = ej.sprite("next","next7")

local FRAMEID = 12
local RECTID = 1
ppm.texture(FRAMEID, fw.WorkDir.."examples/asset/Window2");
-- ppm.texture(RECTID, fw.WorkDir.."examples/asset/rect.1")

-- local t = ppm.load(fw.WorkDir.."examples/asset/window");
-- print(type(t))
local game = {}

local scale = 4;

local squareW = 30
local row = 20
local col = 10
local gameFrameX = 355
local gameFrameY = 80
local gameFrameW = col * squareW
local gameFrameH = squareW * row

local map = {}
local t
local currentRect= {}
local shadowRect = {}
local currentRotatePoint = {}
local generatefun
local nextRect
local count = 0
local cuurentTime = 0
local removeCount = 0
local canRemove = 0
local rowTable = {}
local isStart = false
local isStarting = false
local isPause = false
local isGameOver = false
local startTime = 0

local rect = {
	{{x = 1, y = 5},{x = 1, y = 6}, {x = 2, y = 5}, {x = 2, y = 6}},
    {{x = 1, y = 4},{x = 1, y = 5}, {x = 2, y = 5}, {x = 2, y = 6}},
	{{x = 1, y = 5},{x = 1, y = 6}, {x = 2, y = 4}, {x = 2, y = 5}},
	{{x = 1, y = 4},{x = 1, y = 5}, {x = 1, y = 6}, {x = 1, y = 7}},
	{{x = 1, y = 4},{x = 1, y = 5}, {x = 1, y = 6}, {x = 2, y = 5}},
	{{x = 1, y = 4},{x = 1, y = 5}, {x = 1, y = 6}, {x = 2, y = 6}},
	{{x = 1, y = 4},{x = 1, y = 5}, {x = 1, y = 6}, {x = 2, y = 4}},
}

local rotatePoint = {
	{2,6} ,{1.5,5.5},{1.5,5.5},{1.5,5.5},{2,6},{1.5,5.5},{2.5,5.5}
}

local btnStartCoord = {x = 768, y = 636, scale = 1}
local btnPauseCoord = {x = 870, y = 636, scale = 1}

local square = {
    square1,square2,square3,
	square4,square5,square6,
	square7,square8,square9
}
local shadow = {
    shadow1, shadow2,shadow3,shadow4,shadow5,shadow6,shadow7    
}
local nexts = {
	next1,next2,next3,next4,next5,next6,next7,
}

math.randomseed(tostring(os.time()):reverse():sub(1, 6))
nextRect =math.ceil(math.random() * 1000 % 7)
function game.start()
	startAni.frame = 0
	isStart = false
	isStarting = true
	startTime = 0
	if isPause == false or isGameOver then
		isGameOver = false
		for i = 1, row do
			map[i] = {}
			for j = 1, col do
				map[i][j] = 0
			end
		end
		for i = 1, row do
			map[i] = {}
			for j = 1, col do
				map[i][j] = 0
			end
		end
		generateSquare()
	end
end


function flashLine() 
	local i = row
	rowTable = {}
	local index = 1
	canRemove = 2
	while(i >= 1) do
		local flag = 1
		for j = 1, col do 
			if map[i][j] == 0 then 
				flag = 0
				break
			end
		end
		if flag == 1 then 
			rowTable[index] = i
			index = index + 1
			canRemove = 1
		end
		i = i - 1
	end
end

function removeLine()
	i = row;
	while(i >= 1) do
		flag = 1
		for j = 1, col do 
			if map[i][j] == 0 then 
				flag = 0
				break
			end
		end
		if flag == 1 then 
			for k = i, 2 , -1 do 
				for j = 1, col do 
					map[k][j] = map[k-1][j]
				end
			end
		else 
			i = i - 1
		end
	end
end
 
 function judgeGameOver()
	for i = 1, col do
		if map[1][i] == 1 then
			return true
		end
	end
	return false
end
 
function rotate() 
	if isPause or isStarting or isGameOver then
		return
	end
	local rx = currentRotatePoint.x
	local ry = currentRotatePoint.y
	flag = 1
	for i = 1, 4 do 
		local rightTopX = currentRect[i].x
		local rightTopY = currentRect[i].y + 1
		local newLeftTopX = ry - rightTopY + rx
		local newLeftTopY = rightTopX - rx + ry
		if judge(newLeftTopX,newLeftTopY) == 0 then
			flag = 0
			break
		end
	end
	if flag == 0 then return end
	--print(rx,ry)
	for i = 1, 4 do 
		local rightTopX = currentRect[i].x
		local rightTopY = currentRect[i].y + 1
		local newLeftTopX = ry - rightTopY + rx
		local newLeftTopY = rightTopX - rx + ry
		--print(newLeftTopX, newLeftTopY)
		currentRect[i].x = newLeftTopX
		currentRect[i].y = newLeftTopY
	end
end

function judge(x,y) 
	if x < 1 or x > row or y < 1 or y > col then 
		return 0
	end
	if map[x][y] == 0 then
		return 1
	else 
		return 0
	end
end

function move(x,y) 
	if isPause or isStarting or isGameOver then
		return
	end
	local flag = 1
	for i = 1,4 do 
		tx = currentRect[i].x + x
		ty = currentRect[i].y + y
		if judge(tx,ty) == 0 then
			flag = 0
			break
		end
	end
	if flag == 0 then return end
	for i = 1,4 do
		currentRect[i].x = currentRect[i].x + x
		currentRect[i].y = currentRect[i].y + y
	end
	currentRotatePoint.x = currentRotatePoint.x + x
	currentRotatePoint.y = currentRotatePoint.y + y
end

function fall() 
	local flag = down() 
    while(flag == 1) do
        flag = down()
    end
end

function shadowFall()
    local flag = shadowDown()
    while flag == 1 do
        flag = shadowDown()
    end
end

function shadowDown() 
    local flag = 1
    for i = 1, 4 do
        local tx = shadowRect[i].x + 1
        local ty = shadowRect[i].y + 0
        if judge(tx,ty) == 0 then
            flag = 0
            break
        end
    end
    if flag == 1 then
        for i = 1, 4 do
            shadowRect[i].x = shadowRect[i].x + 1
            shadowRect[i].y = shadowRect[i].y + 0
        end
    end 
    return flag
end
function calShadowRect()
    for i = 1, 4 do
        shadowRect[i] = {}
        shadowRect[i].x = currentRect[i].x  
        shadowRect[i].y = currentRect[i].y
    end
    shadowFall()
end
function down() 
	if isPause or isStarting or isGameOver then
		return
	end
	local flag = 1
	for i = 1,4 do 
		local tx = currentRect[i].x + 1
		local ty = currentRect[i].y + 0
		if judge(tx,ty) == 0 then
			flag = 0
			break
		end
	end
	if flag == 0 then 
		for i = 1, 4 do
			local tx = currentRect[i].x
			local ty = currentRect[i].y
			map[tx][ty] = 1
		end
		flashLine()
	else
		for i = 1,4 do
			currentRect[i].x = currentRect[i].x + 1
			currentRect[i].y = currentRect[i].y + 0
		end
		currentRotatePoint.x = currentRotatePoint.x + 1
		currentRotatePoint.y = currentRotatePoint.y + 0
	end
	isGameOver = judgeGameOver()
    return flag
end


generateSquare = function() 
	if nextRect then
		t = nextRect
	else
		t = math.ceil(math.random() * 1000 % 7)
	end
	nextRect = math.ceil(math.random() * 1000 % 7)
	while(true) do
		if(nextRect == t) then
			nextRect = math.ceil(math.random() * 1000 % 7)
		else 
			break
		end
	end
	for i = 1,4 do
		currentRect[i] = {}
		currentRect[i].x = rect[t][i].x
		currentRect[i].y = rect[t][i].y
        shadowRect[i] = {}
        shadowRect[i].x = currentRect[i].x
        shadowRect[i].y = currentRect[i].y
	end
	currentRotatePoint.x = rotatePoint[t][1]
	currentRotatePoint.y = rotatePoint[t][2]
    calShadowRect()
end

function drawRect()
	obj = nexts[nextRect]
	obj:ps(760,250)
	obj:draw()
	obj = square[8]
	if isGameOver then
		obj = square[9]
	end
	for i = 1, row do
		local flag = 0
		if(canRemove == 1 and removeCount % 4 == 0) then 
			for k,v in pairs(rowTable) do
				if(v == i) then 
					flag = 1
					break;
				end
			end
		end
		if(flag == 0) then
			for j = 1, col do
				if map[i][j] == 1 then
					x = squareW * (j - 1) + gameFrameX + border
					y = squareW * (i - 1) + gameFrameY + border
					obj:ps(x,y,1)
					obj:draw()
				end
			end
		end
	end
	if(canRemove ~= 1 and isGameOver == false) then
		obj = shadow[t]
		for i, v in pairs(shadowRect) do
			x = squareW * (v.y - 1) + gameFrameX + border
			y = squareW * (v.x - 1) + gameFrameY + border
			obj:ps(x + 1,y + 1,1)
			obj:draw()
		end
		obj = square[t]
		for i, v in pairs(currentRect) do 
			x = squareW * (v.y - 1) + gameFrameX + border
			y = squareW * (v.x - 1) + gameFrameY + border
			obj:ps(x,y,1)
			obj:draw()
		end
	end
end

function gameFrame()
	--geo.line(0,0, 120,120, 0xff0000)
	--geo.frame(10,10,100,100, 0xff0000)
	frame.draw(shader, FRAMEID, gameFrameX,gameFrameY,gameFrameW,gameFrameH)
	x1 = gameFrameX + border
	x2 = gameFrameX + gameFrameW + border
	for i = 1, row-1 do
		y = i * squareW + gameFrameY + border
		geo.line(x1,y,x2,y,0x5c5c5c)
	end
	y1 = gameFrameY + border
	y2 = gameFrameY + gameFrameH + border
	for i = 1, col-1 do
		x = i * squareW + gameFrameX + border
		geo.line(x,y1,x,y2,0x5c5c5c)
	end
	if isStart or isPause then
		drawRect()
	end
	--[[if isPause then
		drawRect()
	end]]
end

function game.update()
	if isGameOver then
		return
	end
	if isStarting then
		startTime = startTime + 1
		if startTime % 20 == 0 then
			startAni.frame = startAni.frame + 1
			if startAni.frame == 5 then
				isStarting = false
				isStart = true
				isPause = false
			end
		end
	end
	if isPause == false then
		if isStart then
			if canRemove == 1 and removeCount <= 12 then 
				removeCount = removeCount + 1
				count = 0
			elseif canRemove == 1 and removeCount > 12 then
				removeCount = 0
				canRemove = 0
				count = 0
				removeLine()
				generateSquare()
			elseif canRemove == 2 then 
				generateSquare()
				canRemove = 0
			else
				count = count + 1;
				if count % 20 == 0 then 
					down() 
					count = 0
				end
			end
		end
	end
	
end

function game.drawframe()
    ej.clear(0xff808080)
    gameFrame()
	 --btn_start:ps(btnStartCoord)
	btn_start:draw(btnStartCoord)
	--btn_pause:ps(870,636)
	btn_pause:draw(btnPauseCoord)
	ui_next:ps(760,147)
	ui_next:draw()
	if isGameOver then
		ui_gameover:ps(512,384)
		ui_gameover:draw()
	end
	if isPause and isStarting == false 
		and isGameOver == false then
		ui_pause:ps(512, 384)
		ui_pause:draw()
	end
	if isStarting and isGameOver == false then
		startAni:ps(512,384)
		startAni:draw()
	end
end

function game.touch(what, x, y)
	if what == "END" then
		local btnStartTouch = btn_start:test(x, y, btnStartCoord)
		if btnStartTouch then
			game.start()
		end
		local btnPauseTouch = btn_pause:test(x, y, btnPauseCoord)
		if btnPauseTouch then
			if isPause == false and isStarting == false then
				isPause = true
			end
		end
	end
end

function game.keypress(wParam)
	if wParam == 87 or wParam == 38 then
		rotate()
        calShadowRect()
	elseif wParam == 40 or wParam == 83 then
		down() 
        calShadowRect()
	elseif wParam == 65 or wParam == 37 then
		move(0, -1) 
        calShadowRect()
	elseif wParam == 68 or wParam == 39 then
		move(0,1) 
        calShadowRect()
	elseif wParam == 32 then
		fall()
	end
end

function game.message(...)
end

function game.handle_error(...)
end

function game.on_resume()
end

function game.on_pause()
end

ej.start(game)
