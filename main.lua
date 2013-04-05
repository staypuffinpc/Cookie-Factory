-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
--globals
_W=display.contentWidth
_H=display.contentHeight
_mainFont = "Bell Gothic Std Black"
_size = 20
levels = {}
levels[1] = { digits= 2, theme = "oreo", unlock = "next level", stars=1, starImg = "oreo_star.png", count = 3, timed = 3 }
levels[2] = { digits = 3, theme= "pb", unlock = "next level", stars = 2, starImg = "pb_star.png", count = 3, timed = 3}
levels[3] = { digits = 3, theme= "jelly", unlock = "multiplier", stars = 2, starImg = "jelly_star.png",  count = 3, timed = 3}
levels[4] = { digits = 4, theme= "jelly", unlock= "next level", stars = 3,  starImg = "starTimesTen.png", count = 3, timed = 3}
levels[5] = { digits = 5, theme= "chocchip", unlock= "divisor", stars = 4,  starImg = "chocchip_star.png", count = 3, timed = 3 }
levels[6] = { digits = 5, theme= "chocchip", unlock = "next level", stars = 4,  starImg = "StarHammer.png", count = 3, timed = 3}


physics = require "physics"

-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

-- include the Corona "storyboard" module
storyboard = require "storyboard"
storyboard.isDebug = true

-- load menu screen
storyboard.gotoScene( "menu" )
storyboard.purgeOnSceneChange = true
