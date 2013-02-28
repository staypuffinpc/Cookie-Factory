-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

_W=display.contentWidth
_H=display.contentHeight
_mainFont = "Bell Gothic Std Black"
_size = 20
physics = require "physics"

-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

-- include the Corona "storyboard" module
storyboard = require "storyboard"
storyboard.isDebug = true

-- load menu screen
storyboard.gotoScene( "menu" )
storyboard.purgeOnSceneChange = true
