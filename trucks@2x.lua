--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:0b6f2910894ebe7bff2bd3db0003e458$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- Truck animations3/0002
            x=824,
            y=1532,
            width=820,
            height=508,

            sourceX = 106,
            sourceY = 137,
            sourceWidth = 1028,
            sourceHeight = 768
        },
        {
            -- Truck animations3/0003
            x=2,
            y=1532,
            width=820,
            height=508,

            sourceX = 106,
            sourceY = 137,
            sourceWidth = 1028,
            sourceHeight = 768
        },
        {
            -- Truck animations3/0004
            x=824,
            y=1022,
            width=820,
            height=508,

            sourceX = 106,
            sourceY = 137,
            sourceWidth = 1028,
            sourceHeight = 768
        },
        {
            -- Truck animations3/0005
            x=2,
            y=1022,
            width=820,
            height=508,

            sourceX = 106,
            sourceY = 137,
            sourceWidth = 1028,
            sourceHeight = 768
        },
        {
            -- Truck animations3/0006
            x=824,
            y=512,
            width=820,
            height=508,

            sourceX = 106,
            sourceY = 137,
            sourceWidth = 1028,
            sourceHeight = 768
        },
        {
            -- Truck animations3/0007
            x=2,
            y=512,
            width=820,
            height=508,

            sourceX = 106,
            sourceY = 137,
            sourceWidth = 1028,
            sourceHeight = 768
        },
        {
            -- Truck animations3/0008
            x=824,
            y=2,
            width=820,
            height=508,

            sourceX = 106,
            sourceY = 137,
            sourceWidth = 1028,
            sourceHeight = 768
        },
        {
            -- Truck animations3/0009
            x=2,
            y=2,
            width=820,
            height=508,

            sourceX = 106,
            sourceY = 137,
            sourceWidth = 1028,
            sourceHeight = 768
        },
    },
    
    sheetContentWidth = 2048,
    sheetContentHeight = 2048
}

SheetInfo.frameIndex =
{

    ["Truck animations3/0002"] = 1,
    ["Truck animations3/0003"] = 2,
    ["Truck animations3/0004"] = 3,
    ["Truck animations3/0005"] = 4,
    ["Truck animations3/0006"] = 5,
    ["Truck animations3/0007"] = 6,
    ["Truck animations3/0008"] = 7,
    ["Truck animations3/0009"] = 8,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
