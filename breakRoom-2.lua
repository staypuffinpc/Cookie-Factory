

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-----------------------------------------------------------------------
local widget = require "widget"


-- Called when the scene's view does not exist:
function scene:createScene( event )
	function onBtnRelease(event)
		print (event.target.scene)
			storyboard.gotoScene(event.target.scene)
		return true	-- indicates successful touch
	end
	
	local group = self.view
	
	local bg = display.newImage("images/Breakroom.png", 0, 0)
	
	local homeBg = display.newCircle(60, 40, 50)
	homeBg:setFillColor(0)
	
	local homeBtn=widget.newButton{
		defaultFile="images/btnHome.png",
		width=80,
		height=80,
		onRelease = onBtnRelease	-- event listener function
		}
	homeBtn.scene = "menu"
	homeBtn:setReferencePoint(display.CenterReferencePoint)
	homeBtn.x = 60
	homeBtn.y = 40
	
	group:insert(bg)
	group:insert(homeBg)
	group:insert(homeBtn)		
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	

	
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	

	
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view

	
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