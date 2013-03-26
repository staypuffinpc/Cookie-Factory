----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------
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
function onBtnRelease(event)
	
	-- go to scene1.lua scene
	print (event.target.scene)
	storyboard.gotoScene(event.target.scene)
	return true	-- indicates successful touch
end

function scene:createScene( event )
	local group = self.view

		--DRAG FUNCTION	
	function startDrag( event )
		local t = event.target
	
		local phase = event.phase
		if "began" == phase then
			display.getCurrentStage():setFocus( t )
			t.isFocus = true
	
			-- Store initial position
			t.x0 = event.x - t.x
			t.y0 = event.y - t.y
			
			-- Make body type temporarily "kinematic" (to avoid gravitional forces)
			event.target.bodyType = "kinematic"
			event.target.isFixedRotation= true
			
		elseif t.isFocus then
			if "moved" == phase then
				t.x = event.x - t.x0
				t.y = event.y - t.y0
	
			elseif "ended" == phase or "cancelled" == phase then
				display.getCurrentStage():setFocus( nil )
				t.isFocus = false
				
				-- Switch body type back to "dynamic", unless we've marked this sprite as a platform
				if ( not event.target.isPlatform ) then
					event.target.bodyType = "dynamic"
				end
			end
		end
		--end the touch event when ended
		return true
	end
	
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
	-----------------------------------------------------------------------------
		
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
	
	-----------------------------------------------------------------------------
	
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