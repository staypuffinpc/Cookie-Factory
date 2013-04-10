-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
--globals
_W=display.contentWidth
_H=display.contentHeight
--_mainFont = "Bell Gothic Std Black" --TO DO: get this working on the iPad and turn back on
_mainFont = "Helvetica"
_size = 20
levels = {}
levels[1] = { digits = 3, theme = "oreo", unlock = "next level", stars=1, starImg = "oreo_star.png", count = 3, timed = 60 }
levels[2] = { digits = 3, theme= "pb", unlock = "next level", stars = 2, starImg = "pb_star.png", count = 5, timed = 60}
levels[3] = { digits = 4, theme= "jelly", unlock = "multiplier", stars = 2, starImg = "jelly_star.png",  count = 5, timed = 60}
levels[4] = { digits = 4, theme= "chocchip", unlock= "next level", stars = 3,  starImg = "starTimesTen.png", count = 15, timed = 60}
levels[5] = { digits = 5, theme= "jelly", unlock= "divisor", stars = 4,  starImg = "chocchip_star.png", count = 5, timed = 60 }
levels[6] = { digits = 5, theme= "oreo", unlock = "next level", stars = 4,  starImg = "StarHammer.png", count = 5, timed = 60}


physics = require "physics"
local widget = require "widget"

-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

-- include the Corona "storyboard" module
storyboard = require "storyboard"
storyboard.isDebug = true

--load background music
local bgroundMusic = audio.loadStream("Sounds/cookie.mp3")
local bgMusicChannel = audio.play(bgroundMusic, {channel = 2, loops = -1})

-- toggle music
local function toggleMusic(event)
	if event.target.music == "on" then
		print ("music was ON")
		audio.pause(bgMusicChannel)
		event.target.music = "off"
		event.target.defaultFile = "images/btnMusicOff.png"
	else
		print ("music was OFF")
		audio.play(bgMusicChannel)
		event.target.music = "on"
		event.target.defaultFile = "images/btnMusicOff.png"
	end
end
-- load music button
local musicBtn = widget.newButton{
	defaultFile = "images/btnMusicOn.png",
	id = "musicBtn",
	onRelease = toggleMusic
}
musicBtn.x, musicBtn.y = 30, _H-50
musicBtn.music = "on"

-- load menu screen
storyboard.gotoScene( "menu" )
storyboard.purgeOnSceneChange = true
