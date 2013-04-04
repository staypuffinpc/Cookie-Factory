----------------------------------------------------------------------------------
---- loadingDock.lua
------------------------------------------------------------------------------------
local generate = require "generateNumInfo"
local number = require "generateNumber"
local itemInfo= require "items"
local spawn= require "spawnCookie"
local storyboard = require "storyboard" 
local widget= require "widget"
local scene = storyboard.newScene()
physics.setGravity(0,0)
local sheetInfo = require "trucks"
local shapes = (require "shapes_all@2x").physicsData(.5)
themes = {"oreo", "pb","jelly","chocchip"}

_H = display.contentHeight
_W = display.contentWidth

--Variables and Functions
local onBtnRelease
local factoryBG, homeBtn
local pallet
local myObject
local startDrag
local level
local totalTrucks
local totalItems
local itemsCreated
local newList
local inArray
local createKey
local themePics, cookieInfo --vars to load the img sheet into
local specificShape
local touching = false
local touchedTruck = {}
local redGradient = graphics.newGradient( {255, 0,0}, {255, 0,0}, "down" )
local greenGradient = graphics.newGradient( {0, 255,0}, {0, 255,0}, "down" )
local threeTrucks
local onePallet

	--From generateNumInfo
	local newList
	local value
	local omittedNum
	
	--From generateNumber
	local generateNumber
	
	--From spawnCookie
	local items
	



----------------------------------------------------------------------------------
-- 
--	NOTE:
--	
--	Code outside of listener functions (below) will only be executed once,
--	unless storyboard.removeScene() is called.
-- 
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- Called when the scene's view does not exist:

--Get the level from the user's selection later... this controls the # trucks and items to spawn
level=4	
totalTrucks=level
totalItems=level-1
palletPositions={330, 500, 670}
print(palletPositions[1])
local numTrucksToCreate = 3

-- 'onRelease' event listener for return to main menu
function onBtnRelease(event)
	
	-- go to scene1.lua scene
	print (event.target.scene)
	storyboard.gotoScene(event.target.scene)
	return true	-- indicates successful touch
end



function scene:createScene( event )
	local group = self.view

	function onLocalCollision( self, event )
		if ( event.phase == "began" ) then
			touchedTruck = event.other
			touching = true
				touchedTruck.image:setSequence( "opening" )
				touchedTruck.image:play()

		elseif ( event.phase == "ended" ) then
			local function idle()
				touchedTruck.image:setSequence( "idling" )
				touchedTruck.image:play()
			end
			local function close()
				touchedTruck.image:setSequence( "closing" )
				touchedTruck.image:play()
				timer.performWithDelay ( 300, idle )
			end
			close()

			print( self.myName .. " ended a collision with " )--.. touchedTruck.myName )
			touchedTruck = {}
			touching = false
			return true
		end
	end

	function recreate()
		print ("yes ma'am")
		local function onePallet()
		end
		local function threeTrucks()
		end
	end

--Spawn cookies, which should be the #trucks-1
--local themes= {"creme", "pb","jelly","chocchip"}
local theme = themes[level]


items=itemInfo.createItemsForThisLevel(theme)

	--the omitted# from the trucks (with the exception of 1) will determine the cookie to appear



-------------------General Scene Images-----------------

	factoryBG= display.newImageRect("images/TruckBG.png", _W, _H)
	factoryBG:setReferencePoint(display.CenterReferencePoint)
	factoryBG.x = _W/2
	factoryBG.y = _H/2
	factoryBG.scene="menu"
	
	homeBtn=widget.newButton{
		default="images/btnHome.png",
		width=80,
		height=80,
		onRelease = onBtnRelease	-- event listener function
		}
	homeBtn:setReferencePoint(display.CenterReferencePoint)
	homeBtn.x = _W*.06
	homeBtn.y = _H*.07
	homeBtn.scene="menu"
	
	
	group:insert(factoryBG)
	group:insert(homeBtn)
	
	return true
	-----------------------------------------------------------------------------
		
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
	
	-----------------------------------------------------------------------------
	
end


-------ENTER SCENE----------
--
function scene:enterScene( event )
physics.start()
recreate()

local sideBar = display.newGroup()
	levelBar = display.newImageRect("images/levelbar.png",93,_H)
	levelBar:setReferencePoint(display.TopRightReferencePoint)
	levelBar.x = 0; levelBar.y=0
	sideBar:insert(levelBar)
	sideBar.x = _W; sideBar.y =0
	
	--generate stars on levelBar
	function genStars()
		local gradient = graphics.newGradient(
			{134,10,200},{100, 0},"down"
		)
		-- first, put the black stars on the screen
		local starY = _H - 50
		for i=1, #levels do 
			local star = display.newImageRect("images/black_star.png",66,67)
			star.x = -41; star.y = starY;
			starY = starY - 90
			sideBar:insert(star)
		end
		starY = _H - 50 -- return and fill in the completed levels
		--now, generate the levels the user has accomplished so far, greying out the last one
		for i=1, currLevel do 
			local star = display.newImageRect("images/"..levels[i].starImg,66,67)
			star.x = -41; star.y = starY
			starY = starY-90
			--check if this is the level they're currently working on.  If so, put a gradient on the image, or change it's opacity
			if i == currLevel then
				star:setFillColor(100) -- for some reason I get an error "gradients cannot be applied to image objects"
				star.alpha = .3
			end
			sideBar:insert(star)
		end
	end

	local group = self.view
touching = false
    --1 Generate 4 truck numbers (SessionNumbers)
    createdItems={}
    usedPositions={}
    
    newList = generate.generateNumInfos(numTrucksToCreate,5)
    level = 3 --TO DO: load the level dynamicall from some global
    theme = themes[level]
    --create the appropriate image sheet for this level
	cookieInfo = require (theme.."_sheet")
	themePics = graphics.newImageSheet(theme.."_sheet.png",cookieInfo:getSheet())
    items = itemInfo.createItemsForThisLevel(theme)
    

    --needle in a haystack fcn
	function inArray(array, value)
		local is = false
		for i, thisValue in ipairs(array) do
			if thisValue == value then 
				is = true; break end
		end
		return is
	end
		
	--create a unique key for each item generated (used to reference that item later on)	
	function createKey(array)
		local key = "object"..math.random(1,100000000)
		if inArray(array,key) == true then return createKey(array) end
		return key
	end

--[[
function palletPositionsTaken(array)
	local position = "position"..math.random(1,100000000)
	if inArray(array,position) == true then return palletPositionsTaken(array) end
	return position
end
]]

--local sheetInfo = require("trucks")
local truckImageSheet = graphics.newImageSheet( "trucks.png", sheetInfo:getSheet() )


--define sequences
sequenceData = 
{
   { name = "idling", frames = { 3,4}, time = 250, loopCount = 0 },
   { name = "opening", frames = { 1,2,7,12,14, 15, 16, 17, 18, 19}, time = 300, loopCount = 1 },
   { name = "closing", frames = { 19,18,17,16,15,14,12,7,2,3}, time = 300, loopCount = 1 },
   { name = "moving", frames = { 5,6,8,9,10,11,13}, time = 250, loopCount = 0 }
 }
	
--Create a function that generates trucks
	function createTruck(truckX,truckY, numObj)
		truck = display.newGroup()
		--truck:setReferencePoint(display.TopRightReferencePoint) --TO DO: REPLACE LINE 235-237 WITH TRUCK SPRITE
		local image = display.newSprite( truckImageSheet , sequenceData )
		image:setSequence("idling")
		image:play()
		truck:insert(image)
		truck.image=image
		local numberText = display.newEmbossedText(numObj.omittedNum, 0, 0, native.systemFontBold, 35)
			numberText.x = -10; numberText.y = -30
			numberText:setTextColor(75)
			truck:insert(numberText)
		truck.value = numObj.omittedValue
		truck.myName ="Truck Number: "..truck.value
			print(truck.myName)
		key = createKey(createdItems)
		truck.key = key
		createdItems[key] = truck
		truck.x = truckX
		truck.y = truckY
		specificShape = shapes:get("truck")
		physics.addBody(truck, "dynamic", specificShape) --TO DO: GIVE A SHAPE FROM SHAPES ALL
		group:insert(truck)
		return truck
	end

truckX=_W/2 --increase by 100
truckY=200 --increase by 125

	function threeTrucks()
	for i=1, numTrucksToCreate do
		createTruck(truckX, truckY, newList[i])
		truckX=truckX+90
		truckY=truckY+230	
		
	end
	end	
	--2 Generate 3 of the 4 cookie objects 		
	function createPallet(palletY, numObj)
		pallet=display.newGroup()
		pallet:setReferencePoint(display.TopRightReferencePoint)
		local num = numObj.omittedValue
		local imagePallet=display.newImageRect("images/Palette.png", 213, 79)
			pallet:insert(imagePallet)
		local itemImage=display.newImage(themePics, cookieInfo:getFrameIndex(theme..num)) --TO DO: REPLACE WITH COOKIE SPRITE...WHICH SHEET DO I USE....or do i just change newImageRect to newSprite??
			itemImage:setReferencePoint(display.BottomCenterReferencePoint)
			itemImage.x=-10
			itemImage.y=10
			pallet:insert(itemImage)
		numberText=tostring(num)
		print("numberText:"..numberText)
		local numberText=display.newRetinaText(numberText, 0,0, native.systemFontBold, 30)
			numberText:setReferencePoint(TopLeftReferencePoint)
			numberText:setTextColor(50)
			numberText.x=-20 
			numberText.y=10
			pallet:insert(numberText)
		key=createKey(createdItems)
			pallet.key=key
			createdItems[key]=pallet
		pallet.value=numObj.omittedValue--should this actually be the omittedValue so it can be compared to the truck? ???would this make the "checkanswer" work?
			pallet.myName="Palette Number:"..pallet.value
			print(pallet.myName)
		pallet.x=190
		pallet.y=_H/2+70
		physics.addBody(pallet, "dynamic", shapes:get(theme..num))  --TO DO: REPLACE WITH SPECIFIC SHAPE, FROM SHAPES DATA
		pallet.isFixedRotation=true
	end

	function onePallet()
	do 
		local i=math.random(1,numTrucksToCreate)
		createPallet(palletPositions[i], newList[i], items[i])
		print(palletPositions[i])
		print(items[i])
		pallet.collision=onLocalCollision --these collision events must go in here to be applied to all pallets
		pallet:addEventListener( "collision", pallet)
		pallet:addEventListener("touch", pallet)
			--DRAG FUNCTION	
	end
	
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
			print (touchedTruck.myName)
			if self.value == touchedTruck.value then
				touchedTruck.image:setFillColor( 0,255,00 )
			else 
				touchedTruck.image:setFillColor( 255,0,0 )
			end
			function moveTruck()
				local end_x=display.contentWidth/2+800
				touchedTruck.image:setSequence( "moving" )  
				touchedTruck.image:play()
				transition.to( touchedTruck, { time=1500, alpha=1, x=end_x, onComplete=removeObject } )
				self:removeSelf() 
				self=nil
			end
			function closeTruck()
				touchedTruck.image:setSequence( "closing" )  
				touchedTruck.image:play()
				timer.performWithDelay ( 300, moveTruck )
			end
			if touching == true then
				transition.to (self, { time=200, delay=200, xScale=.01, yScale=.01, x=touchedTruck.x-touchedTruck.width/2.5, y=touchedTruck.y, onComplete=closeTruck} )				
			end
	--end focus
			display.getCurrentStage():setFocus( self, nil )
			self.isFocus = false
		end 
	end
	--event handled
	return true
end 
	end

--create a target block (i.e. "dropzone") for delivering the packaged cookies

	
	
--Create a new group of objects so they can collide with one another for the check function


	group:insert(sideBar)






-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
	-----------------------------------------------------------------------------
	
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view

		function cleanUp()
		 for key, value in pairs(createdItems) do
			  --first, remove the item from the array
			  createdItems[key] = nil
			  -- then, remove any event listeners that might be on or related to the item
			  --Runtime:removeEventListener("enterFrame", value)
			  --now, remove the item itself from the display
			  value:removeSelf()
			 --finally, destroy the item so it can get cleaned from memory
			 value = nil
			end
			
			usedPositions=nil
			
		end
	
	cleanUp()
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	
	-----------------------------------------------------------------------------
	
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view

	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. remove listeners, widgets, save state, etc.)
	
	-----------------------------------------------------------------------------
	
end

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene