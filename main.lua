-----------------------------------------------------------------------------------------
--
-- main.lua
-- Created by: Wendi Yu
-- Created on: Apr 2018
--
-- character move use the button and have gravity
-----------------------------------------------------------------------------------------

-- Gravity
local physics = require("physics")

physics.start()
physics.setGravity(0, 20)
--physics.setDrawMode("hybrid")

local theGround = display.newImageRect( "./assets/sprites/land.png", 1700, 150 )
theGround.x = display.contentCenterX + 170
theGround.y = display.contentCenterY + 650
theGround.id = "the ground"
physics.addBody(theGround, "static", {
	friction = 0.5,
	bounce = 0.3
	})

local theLand = display.newImageRect( "./assets/sprites/land.png", 600, 150 )
theLand.x = display.contentCenterX 
theLand.y = display.contentCenterY 
theLand.id = "the land"
physics.addBody(theLand, "static", {
	friction = 0.3,
	bounce = 0.2
	})

-- Character move
local SnowMen = display.newImageRect( "./assets/sprites/SnowMan.png", 250, 250 )
SnowMen.x = display.contentCenterX
SnowMen.y = display.contentCenterY
SnowMen.id = "the character"
physics.addBody(SnowMen, "dynamic", {
	density = 2.5,
	friction = 0.1,
	bounce = 0.2
	})

local dPad = display.newImageRect( "./assets/sprites/d-pad.png", 300, 300 )
dPad.x = 150
dPad.y = display.contentHeight - 160
dPad.id = "d-pad"
dPad.alpha = 0.5

local upArrow = display.newImage( "./assets/sprites/upArrow.png" )
upArrow.x = 150
upArrow.y = display.contentHeight - 270
upArrow.id = "up arrow"
upArrow.alpha = 1

local downArrow = display.newImage( "./assets/sprites/downArrow.png" )
downArrow.x = 150
downArrow.y = display.contentHeight - 50
downArrow.id = "down arrow"
downArrow.alpha = 1

local leftArrow = display.newImage( "./assets/sprites/leftArrow.png" )
leftArrow.x = 40
leftArrow.y = display.contentHeight - 160
leftArrow.id = "left arrow"
leftArrow.alpha = 1

local rightArrow = display.newImage( "./assets/sprites/rightArrow.png" )
rightArrow.x = 260
rightArrow.y = display.contentHeight - 160
rightArrow.id = "right arrow"
rightArrow.alpha = 1
 
function upArrow:touch( event )

    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( SnowMen, { 
        	x = 0, -- move 0 in the x direction 
        	y = -50, -- move up 50 pixels
        	time = 1000 -- move in a 1/10 of a second
        	} )
    end

    return true
end

function downArrow:touch( event )
	-- body
	if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( SnowMen, { 
        	x = 0, -- move 0 in the x direction 
        	y = 50, -- move up 50 pixels
        	time = 1000 -- move in a 1/10 of a second
        	} )
    end 
    
    return true    
end

function leftArrow:touch( event )
	-- body
	if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( SnowMen, { 
        	x = -100, -- move 0 in the x direction 
        	y = 0, -- move up 50 pixels
        	time = 1000 -- move in a 1/10 of a second
        	} )
    end 
    
    return true    
end

function rightArrow:touch( event )
	-- body
	if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( SnowMen, { 
        	x = 100, -- move 0 in the x direction 
        	y = 0, -- move up 50 pixels
        	time = 1000 -- move in a 1/10 of a second
        	} )
    end 
    
    return true    
end

upArrow:addEventListener( "touch", upArrow )
downArrow:addEventListener( "touch", downArrow )
leftArrow:addEventListener( "touch", leftArrow )
rightArrow:addEventListener( "touch", rightArrow )