--create other objects and start physics
local physics = require( "physics" )
physics.start()
physics.setGravity(0,0)
physics.setDrawMode("hybrid")

-- create object and BETTER dragability
local myObject = display.newRect( 0, 0, 100, 100 )
myObject:setFillColor( 200, 54, 84 )
myObject.myName = "myObject"

function myObject:touch( event )
--begin focus
	if event.phase == "began" then
		display.getCurrentStage():setFocus( self, event.id )
		self.isFocus = true
		self.markX = self.x
		self.markY = self.y
	elseif self.isFocus then
	--drag touch object 
		if event.phase == "moved" then
			self.x = event.x - event.xStart + self.markX
			self.y = event.y - event.yStart + self.markY
	
		elseif event.phase == "ended" or event.phase == "cancelled" then
	--end focus
			display.getCurrentStage():setFocus( self, nil )
			self.isFocus = false
		end
	end
	--event handled
	return true
end 

-- make 'myObject' listen for touch events
myObject:addEventListener( "touch", myObject )


--create the sheet
local sheetInfo = require("trucks")
local myImageSheet = graphics.newImageSheet( "trucks.png", sheetInfo:getSheet() )

--define sequences
local sequenceData = 
{
   { name = "idling", frames = { 3,4}, time = 250, loopCount = 0 },
   { name = "opening", frames = { 1,7,12,14, 15, 16, 17, 18, 19, 2}, time = 1000, loopCount = 1 },
   { name = "moving", frames = { 5,6,8,9,10,11,13}, time = 250, loopCount = 0 }
 }

local animation = display.newSprite( myImageSheet , sequenceData ) 

animation.x = display.contentWidth/2
animation.y = display.contentHeight/2

animation:setSequence("idling")
animation:play()



--[[set up the listener to have it go from the normalRun to the fastRun
local function mySpriteListener( event )

  if ( event.phase == "ended" ) then --it listens for when the normalRun has looped its 4 times
    local thisSprite = event.target  --"event.target" references the sprite
    thisSprite:setSequence( "opening" )  --switch to "fastRun" sequence
    thisSprite:play()  --play the new sequence; it won't play automatically!
  end

end

animation:addEventListener( "trucks", mySpriteListener )  --add a sprite listener to your sprite
]]
--catShape={-256,-128,  256,-128,  128,0, 256,128,  -256,128}
--add them to physics
physics.addBody( myObject, "dynamic" )--, { density=3.0, friction=0.5, bounce=0.3 } )
physics.addBody( animation, "dynamic" )--, {shape=catShape} )

--??I can't tell which this should be, mySheet or myObject??

--animation:addEventListener( "collision", animation )

function onCollide(self, event)
	if event.phase == "began" then
		
		local thisSprite = event.target  --"event.target" references the sprite
			thisSprite:setSequence( "opening" )  --switch to "fastRun" sequence
			thisSprite:play()  --play the new sequence; it won't play automatically!

		if event.other.myName == "myObject" then
			print ("Well, hello there "..event.other.myName..".  Come on in.")
			self.strokeWidth = 10 --put a border on the box so I can see something is "inside" of it
			self:setStrokeColor(255) --255,255,255 is the same as 255
		end
	
	elseif event.phase == "ended" then

	local thisSprite = event.target  --"event.target" references the sprite
			thisSprite:setSequence( "moving" )  --switch to "fastRun" sequence
			thisSprite:play()  --play the new sequence; it won't play automatically!
		
		if event.other.myName == "myObject" then
			print ("see you later, "..event.other.myName)
			self.strokeWidth = 0
		end
	end
end

animation.isSensor = "false"
animation.collision = onCollide
animation:addEventListener( "collision", animation )
 