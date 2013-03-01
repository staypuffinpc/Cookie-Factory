----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------
physics.start()

local widget= require"widget"
local scene = storyboard.newScene()
local onBtnRelease
local factoryBG
local homeBtn
local linkToURL

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
-- 'onRelease' event listener for return to main menu
function onBtnRelease(event)
	
	-- go to scene1.lua scene
	print (event.target.scene)
		storyboard.gotoScene(event.target.scene)
	return true	-- indicates successful touch
end

function linkToURL(event)
    system.openURL( event.target.url ); 
end


function scene:createScene( event )
	local group = self.view
	
	factoryBG= display.newImageRect("images/brickBackground.png", _W, _H)
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

	local coreTitle=display.newText("Common Core Standards - Mathematics", 0, 0, native.systemFontBold, 53)
	coreTitle:setTextColor(255)
	coreTitle:setReferencePoint( display.CenterReferencePoint )
	coreTitle.x = _W/2+5
	coreTitle.y = _H/2-260
	
	local coreText=display.newText("Domain: Number and Operations in Base Ten", 0, 0, native.systemFontBold, 41)
	coreText:setTextColor(255)
	coreText:setReferencePoint( display.CenterReferencePoint )
	coreText.x = _W/2+5
	coreText.y = _H/2-200	

	local jellyButton2grade=display.newImageRect("images/JellyButton.png", 25, 25)
	jellyButton2grade:setReferencePoint( display.CenterReferencePoint )
	jellyButton2grade.x = _W/2-300 
	jellyButton2grade.y = _H/2-145

	local grade2title=display.newText("Grade 2:", _W/2-275, _H/2-167, 600, 0, native.systemFontBold, 40)
	grade2title:addEventListener("tap", linkToURL)
	grade2title.url="http://www.corestandards.org/Math/Content/2/NBT"
	
	local textgrade2=display.newText("Understand place value. Use place value understanding and properties of operations to add and subtract.", _W/2-250, _H/2-125, 600, 0, native.systemFontBold, 30)
	
	local jellyButton3grade=display.newImageRect("images/JellyButton.png", 25, 25)
	jellyButton3grade:setReferencePoint( display.CenterReferencePoint )
	jellyButton3grade.x = _W/2-300 
	jellyButton3grade.y = _H/2+15

	local grade3title=display.newText("Grade 3:", _W/2-275, _H/2-7, 600, 0, native.systemFontBold, 40)
	grade3title:addEventListener("tap", linkToURL)
	grade3title.url="http://www.corestandards.org/Math/Content/3/NBT"
	
	local textgrade3=display.newText("Use place value understanding and properties of operations to perform multi-digit arithmetic.", _W/2-250, _H/2+35, 600, 0, native.systemFontBold, 30)	
	
	local jellyButton4grade=display.newImageRect("images/JellyButton.png", 25, 25)
	jellyButton4grade:setReferencePoint( display.CenterReferencePoint )
	jellyButton4grade.x = _W/2-300 
	jellyButton4grade.y = _H/2+175

	local grade4title=display.newText("Grade 4:", _W/2-275, _H/2+153, 600, 0, native.systemFontBold, 40)
	grade4title:addEventListener("tap", linkToURL)
	grade4title.url="http://www.corestandards.org/Math/Content/4/NBT"
	
	local textgrade4=display.newText("Generalize place value understanding for multi-digit whole numbers. Use place value understanding and properties of operations to perform multi-digit arithmetic.", _W/2-250, _H/2+195, 600, 0, native.systemFontBold, 30)

    
    
    --make sure to add all display items to local group
	group:insert(factoryBG)
	group:insert(jellyButton2grade)
	group:insert(jellyButton3grade)
	group:insert(jellyButton4grade)
	group:insert(coreTitle)
	group:insert(coreText)
	group:insert(homeBtn)
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
	-----------------------------------------------------------------------------
	
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
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