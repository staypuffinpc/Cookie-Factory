--create other objects and start physics
local physics = require( "physics" )
physics.start()
physics.setGravity(0,0)
physics.setDrawMode("normal")

local truck
--create a display group for all the display items
local group = display.newGroup()

-- create object and BETTER dragability
local pallet = display.newRect( 0, 0, 100, 100 )
pallet:setFillColor( 200, 54, 84 )
pallet.myName = "pallet"

local touching = false

function pallet:touch( event )
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
			function moveTruck()
				local end_x=display.contentWidth/2+600
				truck:setSequence( "moving" )  
				truck:play()
				transition.to( truck, { time=2000, alpha=1, x=end_x, onComplete=removeObject } )
				self:removeSelf() 
				self=nil
			end
			function closeTruck()
				truck:setSequence( "closing" )  
				truck:play()
				timer.performWithDelay ( 200, moveTruck )
			end
			if touching == true then
				transition.to (self, { time=300, xScale=.01, yScale=.01, x=truck.x-truck.width/2.5, y=truck.y, onComplete=closeTruck} )				
			end
	--end focus
			display.getCurrentStage():setFocus( self, nil )
			self.isFocus = false
		end 
	end
	--event handled
	return true
end 

-- make 'pallet' listen for touch events
pallet:addEventListener( "touch", pallet )


--create the sheet
local sheetInfo = require("trucks")
local truckImageSheet = graphics.newImageSheet( "trucks.png", sheetInfo:getSheet() )

--define sequences
local sequenceData = 
{
   { name = "idling", frames = { 3,4}, time = 250, loopCount = 0 },
   { name = "opening", frames = { 1,2,7,12,14, 15, 16, 17, 18, 19}, time = 300, loopCount = 1 },
   { name = "closing", frames = { 19,18,17,16,15,14,12,7,2,1}, time = 300, loopCount = 1 },
   { name = "moving", frames = { 5,6,8,9,10,11,13}, time = 250, loopCount = 0 }
 }

truck = display.newSprite( truckImageSheet , sequenceData ) 

truck.x = display.contentWidth/2
truck.y = display.contentHeight/2

truck:setSequence("idling")
truck:play()



--[[set up the listener to have it go from the normalRun to the fastRun
local function mySpriteListener( event )

  if ( event.phase == "ended" ) then --it listens for when the normalRun has looped its 4 times
    local thisSprite = event.target  --"event.target" references the sprite
    thisSprite:setSequence( "opening" )  --switch to "fastRun" sequence
    thisSprite:play()  --play the new sequence; it won't play automatically!
  end

end

truck:addEventListener( "trucks", mySpriteListener )  --add a sprite listener to your sprite
]]
--catShape={-256,-128,  256,-128,  128,0, 256,128,  -256,128}
--add them to physics
local shapes = (require "shapes_all@2x").physicsData(.5)

local specificShape = shapes:get("chocchip1")

physics.addBody( pallet, "dynamic", specificShape )--, { density=3.0, friction=0.5, bounce=0.3 } )
physics.addBody( truck, "dynamic" )--, {shape=catShape} )


--??I can't tell which this should be, mySheet or pallet??

--truck:addEventListener( "collision", truck )

function onCollide(self, event)
	if event.phase == "began" then
		touching = true
		local thisSprite = event.target  --"event.target" references the sprite
			thisSprite:setSequence( "opening" )  --switch to "fastRun" sequence
			thisSprite:play()  --play the new sequence; it won't play automatically!
		if event.other.myName == "pallet" then
			print ("Well, hello there "..event.other.myName..".  Come on in.")
			--self.strokeWidth = 10 --put a border on the box so I can see something is "inside" of it
			--self:setStrokeColor(255) --255,255,255 is the same as 255
		end
	
	elseif event.phase == "ended" or event.phase == "cancelled" then
		touching = false
		
		if event.other.myName == "pallet" then
			print ("see you later, "..event.other.myName)
			--self.strokeWidth = 0
		end
	end
end
	
truck.isSensor = "false"
truck.collision = onCollide
truck:addEventListener( "collision", truck )


--insert everything into the display group
group:insert(truck)
group:insert(pallet)
 