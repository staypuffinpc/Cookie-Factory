--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:bf1a9ec1fb9699c44d17ffc945292574$
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
            -- Truck animations3_1
            x=4,
            y=1568,
            width=494,
            height=308,

            sourceX = 62,
            sourceY = 80,
            sourceWidth = 616,
            sourceHeight = 460
        },
        {
            -- Truck animations3_10
            x=4,
            y=1256,
            width=494,
            height=308,

            sourceX = 62,
            sourceY = 80,
            sourceWidth = 616,
            sourceHeight = 460
        },
        {
            -- Truck animations3_11
            x=4,
            y=1256,
            width=494,
            height=308,

            sourceX = 62,
            sourceY = 80,
            sourceWidth = 616,
            sourceHeight = 460
        },
        {
            -- Truck animations3_17
            x=4,
            y=4,
            width=494,
            height=312,

            sourceX = 62,
            sourceY = 76,
            sourceWidth = 616,
            sourceHeight = 460
        },
        {
            -- Truck animations3_18
            x=4,
            y=944,
            width=494,
            height=308,

            sourceX = 62,
            sourceY = 80,
            sourceWidth = 616,
            sourceHeight = 460
        },
        {
            -- Truck animations3_19
            x=4,
            y=944,
            width=494,
            height=308,

            sourceX = 62,
            sourceY = 80,
            sourceWidth = 616,
            sourceHeight = 460
        },
        {
            -- Truck animations3_2
            x=1498,
            y=628,
            width=494,
            height=308,

            sourceX = 62,
            sourceY = 80,
            sourceWidth = 616,
            sourceHeight = 460
        },
        {
            -- Truck animations3_20
            x=4,
            y=944,
            width=494,
            height=308,

            sourceX = 62,
            sourceY = 80,
            sourceWidth = 616,
            sourceHeight = 460
        },
        {
            -- Truck animations3_21
            x=4,
            y=944,
            width=494,
            height=308,

            sourceX = 62,
            sourceY = 80,
            sourceWidth = 616,
            sourceHeight = 460
        },
        {
            -- Truck animations3_22
            x=1000,
            y=628,
            width=494,
            height=308,

            sourceX = 62,
            sourceY = 80,
            sourceWidth = 616,
            sourceHeight = 460
        },
        {
            -- Truck animations3_26
            x=4,
            y=632,
            width=494,
            height=308,

            sourceX = 62,
            sourceY = 80,
            sourceWidth = 616,
            sourceHeight = 460
        },
        {
            -- Truck animations3_3
            x=502,
            y=628,
            width=494,
            height=308,

            sourceX = 62,
            sourceY = 80,
            sourceWidth = 616,
            sourceHeight = 460
        },
        {
            -- Truck animations3_30
            x=1498,
            y=316,
            width=494,
            height=308,

            sourceX = 62,
            sourceY = 80,
            sourceWidth = 616,
            sourceHeight = 460
        },
        {
            -- Truck animations3_4
            x=1000,
            y=316,
            width=494,
            height=308,

            sourceX = 62,
            sourceY = 80,
            sourceWidth = 616,
            sourceHeight = 460
        },
        {
            -- Truck animations3_5
            x=4,
            y=320,
            width=494,
            height=308,

            sourceX = 62,
            sourceY = 80,
            sourceWidth = 616,
            sourceHeight = 460
        },
        {
            -- Truck animations3_6
            x=502,
            y=316,
            width=494,
            height=308,

            sourceX = 62,
            sourceY = 80,
            sourceWidth = 616,
            sourceHeight = 460
        },
        {
            -- Truck animations3_7
            x=1498,
            y=4,
            width=494,
            height=308,

            sourceX = 62,
            sourceY = 80,
            sourceWidth = 616,
            sourceHeight = 460
        },
        {
            -- Truck animations3_8
            x=1000,
            y=4,
            width=494,
            height=308,

            sourceX = 62,
            sourceY = 80,
            sourceWidth = 616,
            sourceHeight = 460
        },
        {
            -- Truck animations3_9
            x=502,
            y=4,
            width=494,
            height=308,

            sourceX = 62,
            sourceY = 80,
            sourceWidth = 616,
            sourceHeight = 460
        },
    },
    
    sheetContentWidth = 2048,
    sheetContentHeight = 2048
}

SheetInfo.frameIndex =
{

    ["Truck animations3_1"] = 1,
    ["Truck animations3_10"] = 2,
    ["Truck animations3_11"] = 3,
    ["Truck animations3_17"] = 4,
    ["Truck animations3_18"] = 5,
    ["Truck animations3_19"] = 6,
    ["Truck animations3_2"] = 7,
    ["Truck animations3_20"] = 8,
    ["Truck animations3_21"] = 9,
    ["Truck animations3_22"] = 10,
    ["Truck animations3_26"] = 11,
    ["Truck animations3_3"] = 12,
    ["Truck animations3_30"] = 13,
    ["Truck animations3_4"] = 14,
    ["Truck animations3_5"] = 15,
    ["Truck animations3_6"] = 16,
    ["Truck animations3_7"] = 17,
    ["Truck animations3_8"] = 18,
    ["Truck animations3_9"] = 19,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
