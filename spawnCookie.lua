-----------------------------------------------------------------------------------------
-- PURPOSE: To create a cookie object
-----------------------------------------------------------------------------------------
module(..., package.seeall)

--public variables
moveRate = 4 -- how fast the cookie moves across the screen
touchingOnRelease = false
answerSent = false
sentValue = 0
local scaleFactor = .5
local bodies = (require "shapes_all@2x").physicsData(scaleFactor)

local debugger = require "debugger"


--forward declarations
local disappear, itemHit, onLocalCollision
local cookieGroup = display.newGroup()
local cloud = display.newImageRect("images/cloud.png",256,256) --cloud for transformations
cloud.x = -200
cloud.y = -200 
local generatedItems = {}


--initialize all the cookie image sheets? (not sure if this is the best thing for memory consumption)
local cookies = {"oreo","jelly","pb","chocchip"}
local imageSheets = {}
for i=1, #cookies do
    local v = cookies[i]
    imageSheets[v] = {
    	sheetData = require(v.."_sheet"),
    	name = v
    }
    imageSheets[v].sheet = graphics.newImageSheet(v.."_sheet.png",imageSheets[v].sheetData:getSheet())
end



--fcn to check if an item is already in an array
local function inArray(array, value)
    local is = false
    for i, thisValue in ipairs(array) do
        if thisValue == value then 
        	is = true; 
        	break 
    	end
    end
    return is
end
	
--send an answer with its value
local function sendAnswer(value)
	sentValue = value
	answerSent = true
end
	
--handler for making a new item appear
local function comboItem(x,y, remainder, newItems, newValue,units)
	--cancel all the timers
	timer.cancel(disappearTimer)
	timer.cancel(itemHitTimer)
	timer.cancel(onLocalCollisionTimer)
	if (newItems == "same" or newItems=="nextItem") then
		--see if this stays in the same units or if it moves up a unit
		if (newItems == "nextItem") then
			thisValue = units*10
		else
			thisValue = newValue
		end
		local i = items[thisValue]
		local newUnits = i.units
		local name = i.name
--		local w = i.w 
--		local h = i.h 
		local radius = i.radius
		print(name..newValue)
		local shape = bodies:get(name..newValue)
		local cookie1=spawnCookie(name, thisValue , newUnits, radius, shape, x+i.w/2, y+i.h/3)
		cookie1.moved="yes"
		cookieGroup:insert(cookie1)
		generatedItems[cookie1.key] = cookie1
		return true
	elseif (newItems == "twoItems") then
		--get the info for an item 1 type up 
		print ("creating an image a unit up")
		local newUnits = units*10
		local n = items[newUnits]
		local newName = n.name
--		local newW = n.w 
--		local newH = n.h 
		local newUnits = n.units
		local newRadius = n.radius
		local newShape = bodies:get(newName..newValue)
		local cookie2 = spawnCookie(newName, units*10, newUnits, newRadius, newShape, x-30, y)
		cookie2.moved ="yes"
		generatedItems[cookie2.key] = cookie2
		--now create the same kind of item, with the remaining value
		local j = items[remainder]
		local newUnits = j.units
		local name = j.name
--		local w = j.w TODO: either delete or uncomment
--		local h = j.h 
		local radius = j.radius
		local shape = bodies:get(name..newValue) 
		local cookie1=spawnCookie(name, remainder, units, radius, shape, x+j.w/2, y+j.h/3)
		cookie1.moved="yes"
		cookieGroup:insert(cookie1)
		cookieGroup:insert(cookie2)
		generatedItems[cookie1.key] = cookie1
		return true
	end
end

--handler to make the cloud disappear
function disappear(x,y,obj1, obj2)
	--first, get info about these two items before we destroy them
	print ("value1: "..obj1.value, "v2: "..obj2.value)
	local total = obj1.value + obj2.value
	print ("total: "..total)
	local newItems --use this to see how many and what type of new items I'll need to create
	--check to see if we need to create 1 or 2 new objects
	if (total > (obj1.units*10)) then
		print ("create TWO items")
		newItems = "twoItems"
		remainder = total - (obj1.units*10)
	elseif (total == obj1.units*10) then 
		newItems = "nextItem"
		newValue = obj1.units*10
		remainder = 0
	elseif (total < obj1.units*10) then
		newItems = "same"
		newValue = total
		remainder = 0
	end
	local units = obj1.units
	--check to see if I got all of the needed values
	print ("remainder: "..remainder,"newItems: "..newItems,"new value: "..newValue)
	print ("units1: "..obj1.units,"units2: "..obj2.units)
	--now get rid of the old items
	if (obj1) then
		generatedItems[obj1.key] = nil
		obj1:removeSelf()
		Runtime:removeEventListener("enterFrame", obj1)
		obj1 = nil
		collectgarbage("collect")
	end
	if (obj2 ~= nil) then
		generatedItems[obj2.key] = nil
		obj2:removeSelf()
		Runtime:removeEventListener("enterFrame", obj2)
		obj2 = nil
		collectgarbage("collect")
	end
	cloud.x = -200
	cloud.y = -200
	--closure for passing arguments in a fcn inside of a timer 
	local closure = function() return comboItem(x,y,remainder,newItems,newValue,units) end
	disappearTimer = timer.performWithDelay(100,closure,1)
end

--handler for when boxes collide
function itemHit(x,y, obj1, obj2)
	print ("cloud should appear")
	--make the cloud appear on top
	--group:insert(cloud)
	cloud.x = x
	cloud.y = y
	--wrap the fcn I really want to run inside of a closure so that I can pass it an argument
	local closure = function() return disappear(x,y,obj1, obj2) end
	itemHitTimer = timer.performWithDelay(100, closure, 1)
end


function onLocalCollision(self, event)
		if event.phase == "began" then
			local hitX = self.x 
			local hitY = self.y 
			local obj1 = self
			local obj2 = event.other
			if self.dragging == 1 then
				if ((obj1.units == obj2.units) and (obj1.y > 300) and (obj2.y >300)) then--units are the same
					--check to see if this is the 10,000 units hitting each other, b/c we don't have a graphic for that
					if (obj1.value + obj2.value >= 100000) then--too big so exit fcn
						--TODO: play "bonk!" sound and exit
						print ("sorry, haven't got anything higher")
						return false
					elseif (self.copied ~= true) then
						self.copied = true -- set right away so as not to propagate creation
						--commence transformation
						print ("obj1:"..obj1.units, "obj2: "..obj2.units)
						print ("collision began")
						--local closure = function() return itemHit(hitX,hitY,obj1, obj2) end
						onLocalCollisionTimer = timer.performWithDelay(100, function()
								return itemHit(hitX,hitY, obj1, obj2)
							end, 1)
						return true;
					end
				else --units are different, so play sound and exit fcn
					--print ("sorry, these two objects are not from the same mother")
					return false
				end
			end
		end
	return true
end


local function genKey(array)
	local key = "cookie"..math.random(1,100000000)
	if inArray(array,key) == true then return genKey(array) end
	return key
end

--couldn't seem to get external classes to work, so I'm going to use Rafael Hernandez's method of spawning objects as seen in the Bubble Ball exercise
function spawnCookie(name, value, units, radius, shape,x,y)
	--create a group to insert everything into about that cookie
	local cookie = display.newGroup()
	
	
	--cookie image
	--This is for when I figure out how to set the keys of one array to be the values of another:
	local obj = imageSheets[name]
	local image = display.newImage(obj.sheet, obj.sheetData:getFrameIndex(name..value))
	image.x = 0; image.y = 0;
		
	cookie:insert(image)
	
	--[[ TO Do: figure out how to make a weld joint properly
	--generate an invisible shape with the same body that is dynamic so that it can interact with sensors at all times
	local invImg = display.newImage(obj.sheet, obj.sheetData:getFrameIndex(name..value))
	invImg.x, invImg.y = cookie.x,cookie.y
	invImg.alpha = .8 --TO DO: make this .01 once it works
	
	cookie:insert(invImg)
	]]
	--cookie badge (needs text and a rounded rectangle grouped together)
	local badge = display.newGroup()
	local badgeText = display.newText(value,5,-2,"Arial",24)
	badgeText:setTextColor(255,255,255)
	local badgeRect = display.newRoundedRect(0,0,badgeText.width+10,badgeText.height, 8)
	badgeRect:setReferencePoint(display.TopLeftReferencePoint)
	badgeRect.strokeWidth = 2
	badgeRect:setFillColor(255,0,0)
	badgeRect:setStrokeColor(255)
	
	badge:insert(badgeRect)
	badge:insert(badgeText)
	cookie:insert(badge)
	badge.x=-25; badge.y = image.height*.3
	
	--create num to be displayed above cookie when dragged
	local dragNumDisp = display.newText(cookie,value,-image.width/4,-image.height,"Arial",48)
	dragNumDisp.alpha = 0
	--cookie properties
	cookie.dragNumDisp = dragNumDisp
	cookie.image = image
	cookie.invImg = invImg
	cookie.badgeText = badgeText
	cookie.badgeRect = badgeRect
	cookie:setReferencePoint(display.BottomRightReferencePoint)
	cookie.name = name
	cookie.value = value or 1
	cookie.x = x or(_W+100)
	cookie.y = y or 260
	cookie.units = units
	cookie.dragging = 0
	cookie.copied = false
	cookie.touching = false
	cookie.isFixedRotation = true
	cookie.linearDamping = 1
	image.isFixedRotation = true
	--invImg.isFixedRotation = true
	image:setReferencePoint(display.BottomRightReferencePoint)
	--invImg:setReferencePoint(display.BottomRightReferencePoint)
	--physics.addBody(image, "kinematic", bodies:get(name..value))
	physics.addBody(cookie, "dymamic", bodies:get(name..value))
	--physics.addBody(invImg, "kinematic", bodies:get(name..value))
	--weld the two bodies together so that you have a combined dymamic + kinematic body type
	--physics.newJoint("weld", cookie, invImg, 0,0)

	cookie.collision = onLocalCollision
	cookie:addEventListener("collision",cookie)
	--generate a unique key to refer to this cookie
	cookie.key = genKey(generatedItems)
	generatedItems[cookie.key] = cookie
	cookie:addEventListener("tap",cookie)

		
	--for double taps (so we can multiply the cookie x10
	function cookie:tap(event)
		if (self.lastTapped) then
			--get the time at which the cookie was last tapped
			if (os.difftime(os.time(),self.lastTapped)<1) then
				local newVal = self.value*10
				--TO DO:make the 10x appear with a sound
				self:setReferencePoint(display.CenterReferencePoint)
				local x, y = self.x+self.width/2+20, self.y+self.height/2+20
				local newCookie = spawnCookie(self.name, newVal, self.units*10, 50, bodies:get(self.name..newVal),x, y)
				newCookie.moved = "yes"
				timer.performWithDelay(100, function()  
								Runtime:removeEventListener("enterFrame",self)
								generatedItems[self.key] = nil
								collectgarbage("collect")
								self:removeSelf()
								self = nil
							end, 1)
				
			end
		end
		self.lastTapped = os.time()
	end
	
	--touch
	function cookie:touch(event)
		if event.phase == "began" then
			cookie:setReferencePoint(display.CenterReferencePoint)
			offset = self.height/2 + 20
			self.isFixedRotation = true
			--show the value of the cookie on top of the cookie
			self.dragNumDisp.alpha = 1
			
			display.getCurrentStage():setFocus( self, event.id)
			self.isFocus = true
			self.markX = self.x 
			self.markY = self.y 
            
			return true
		elseif self.isFocus then
			if event.phase == "moved" then
				self.dragging = 1 --only make new cookies if this is 1
				--set a variable to know that the cookie has been moved and should no longer move across the screen
				self.moved = "yes"
				--move the cookie around the screen
				self.x = event.x-event.xStart+self.markX 
				self.y = event.y - event.yStart+self.markY

				return true
			elseif event.phase == "ended" or event.phase == "cancelled" then
				self.dragging = 0
				--hide the item's value
				self.dragNumDisp.alpha = 0
				display.getCurrentStage():setFocus(self,nil)
				self.isFocus=false
				--get rid of temporary physics joint: TO DO: turn this back on
				--self.tempJoint:removeSelf()
				--self.tempJoint = nil
				if self.touching == true then
					--package is in the dropzone and ready to be delivered
					--check the number against the current number
					print ("cookie: " .. self.value,"answer: ".._G.currNum.omittedValue)
					if _G.currNum.omittedValue ~= self.value then --values don't match
						transition.to(self, {time = 500, y = 450})
					else 
						transition.to(self, {time=300, yScale = .01, xScale = .01, x = self.x, y = 665, alpha = 0})
						--store item info to check if it's right or not
						local checkedVal = self.value
						print(checkedVal)
						timer.performWithDelay(200, function()  
								Runtime:removeEventListener("enterFrame",self)
								generatedItems[self.key] = nil
								collectgarbage("collect")
								self:removeSelf()
								self = nil
							end, 1)
						--send a notification to a runtime event that's listening for 
						sendAnswer(checkedVal)
					end
					--touchingOnRelease = false -- if you don't set this back to false, all future items get "sucked in" TO DO: Delete this.  I think I fixed it by creating a "touching" property on each cookie
				end
				return true
			end
		end
		
	end
	
	--make the cookie move across the screen
	function cookie:enterFrame(event)
		if cookie.y < 200-cookie.height/2 then --cookie is in top area
			cookie.y = 244-cookie.height/3
			self.isFixedRotation = false
		end
		if cookie.y < 275-cookie.height/3 then --cookie is in conveyor area, so start it moving again
			cookie.moved = "no"
			self.isFixedRotation = false
			self.bodyType = "dynamic"
--			self.isBodyActive = true			
		end
		if self.y > 275 and cookie.y < 600 then
			self.rotation = 0
		end
		if (cookie.moved ~= "yes") then
			cookie.x = cookie.x - moveRate
		end
		if cookie.x < -50 then 
			Runtime:removeEventListener("enterFrame",cookie)
			generatedItems[cookie.key] = nil
			collectgarbage("collect")
			cookie:removeSelf()
			cookie = nil
		end
	end
	--attach listeners
	cookie:addEventListener("touch",cookie)
	Runtime:addEventListener("enterFrame", cookie)
	return cookie
end


--method to destroy all the cookies in generated items array
function cleanUp()
	for k, v in pairs(generatedItems) do 
		print (k)
	end
	--delete all the cookies that were generated
	for k, v in pairs(generatedItems) do 
		--print ("removing: "..k)
		generatedItems[k] = nil
		Runtime:removeEventListener("enterFrame", v)
		v:removeSelf()
		v = nil
	end	
	--generatedItems = nil
	--generatedItems = {}
	

end