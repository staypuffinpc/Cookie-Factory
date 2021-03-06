-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------


local scene = storyboard.newScene()
physics.start()
physics.setDrawMode("normal")

--get required files
local widget = require "widget"
local shapes = (require "shapes_all@2x").physicsData(.5)

--initialize all the cookie image sheets? (not sure if this is the best thing for memory consumption)
local cookies = {"chocchip","oreo","jelly","pb"}
local imageSheets = {}
for i=1, #cookies do
    local v = cookies[i]
    imageSheets[v] = {
    	sheetData = require(v.."_sheet"),
    	name = v
    }
    imageSheets[v].sheet = graphics.newImageSheet(v.."_sheet.png",imageSheets[v].sheetData:getSheet())
end
--------------------------------------------


-- forward declarations and other locals
local trainingBtn
local deliveryBtn
local supervisorBtn
local onEnterFrame
local rainTimer, spawnCookieDrop, rain
local cookieArray = {}
--local onTrainingBtnRelease={}


-- 'onRelease' event listener for trainingBtn
function onBtnRelease(event)
	--stop raining cookies
	timer.cancel(rainTimer)
	-- go to scene1.lua scene
	storyboard.gotoScene( event.target.scene)
	return true	-- indicates successful touch
end

-----------------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
-- 
-- NOTE: Code outside of listener functions (below) will only be executed once,
--		 unless storyboard.removeScene() is called.
-- 
-----------------------------------------------------------------------------------------

	
	
-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	-- display a background image
	local background = display.newImageRect( "images/Splash-background.png", _W, _H)
	background:setReferencePoint( display.CenterReferencePoint )
	background.x=_W/2
	background.y=_H/2
	
	
	-- create a widget button (which will loads scene1.lua on release)
	packagingBtn = widget.newButton{
		defaultFile = "images/btnPacking.png",
		onRelease = onBtnRelease	-- event listener function
		}
	packagingBtn:setReferencePoint( display.CenterReferencePoint )
	packagingBtn.x = _W*0.5 - 116
	packagingBtn.y = _H/2 - 60
	packagingBtn.scene="training"


	loadingDockBtn = widget.newButton{
		defaultFile="images/btnLoading.png",
		onRelease = onBtnRelease	-- event listener function
	}
	loadingDockBtn:setReferencePoint( display.CenterReferencePoint )
	loadingDockBtn.x = _W*0.5 - 80
	loadingDockBtn.y = _H/2 + 15
	loadingDockBtn.scene= "loadingDock"
	
	
	standardsBtn = widget.newButton{
		defaultFile="images/btnStandards.png",
		onRelease = onBtnRelease	-- event listener function
	}
	standardsBtn:setReferencePoint( display.CenterReferencePoint )
	standardsBtn.x = _W*0.5 - 61
	standardsBtn.y = _H/2 + 90
	standardsBtn.scene= "corestandards"
	
	--create a floor for cookies to bounce against
	local menuFloor = display.newRect(0,_H+80,_W, 10)
	physics.addBody(menuFloor, "static", {friction=1, bounce=.5})

	-- all display objects must be inserted into group
	group:insert( background )
	group:insert( packagingBtn )
	group:insert( loadingDockBtn )
	group:insert( standardsBtn )
	group:insert(menuFloor)

end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	physics.start()
	physics.setGravity(0,10)

	local group = self.view
	-- INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	function spawnCookieDrop()
		local index = math.random(1,#cookies)
		local startX = math.random(0,_W)
		local name = cookies[index]
		local obj = imageSheets[name]
		local cookie = display.newImage(obj.sheet, obj.sheetData:getFrameIndex(name.."1"))
		cookie.x = startX; cookie.y = -50
		local shape = shapes:get(name.."1")
		physics.addBody(cookie,"dynamic",shape)
		cookie.key = "cookie_"..math.random(1,1000000000)
		cookie.type = "cookie"
		
		--insert into array for cleanup
		cookieArray[cookie.key] = cookie
		function cookie:enterFrame(event)
			if self.x then
				if self.x < -50 or self.x > _W+50 then
					--destroy cookie
					--print ("destroying cookie "..self.key)
					physics.removeBody(cookieArray[self.key])
					cookieArray[self.key]= nil
					Runtime:removeEventListener("enterFrame",self)
					self:removeSelf()
					self = nil
				end
			end
		end
		
		Runtime:addEventListener("enterFrame",cookie)
		return cookie
	end
	
	function rain(event)
		local cookie = spawnCookieDrop()
		cookieArray[cookie.key] = cookie
		group:insert(cookie)
	end
	--rain decadent cookies from above
	rainTimer = timer.performWithDelay(1000,rain,0)
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	physics.setGravity(0,0)
	function cleanUp()
		physics.pause()
		--delete all the cookies that were generated
		for k, v in pairs(cookieArray) do 
			--print ("removing: "..k)
			physics.removeBody(cookieArray[k])
			cookieArray[k] = nil
			v:removeSelf()
			v = nil
		end	
		--generatedItems = nil
		--generatedItems = {}
	end
	cleanUp()
	-- INSERT code here (e.g. stop timers, remove listenets, unload sounds, etc.)
	
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroyScene( event )
	local group = self.view

	if playBtn then
		print "playBtn exists"
		playBtn:removeSelf( )	-- widgets must be manually removed
		playBtn = nil
	end
end

-----------------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
-----------------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched whenever before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

-----------------------------------------------------------------------------------------

return scene