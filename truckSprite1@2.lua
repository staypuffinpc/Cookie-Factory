--[[
Spriteloq metadata
Generated by SpriteLoq: Loqheart's Flash SWF to sprite sheet Corona SDK exporter (c) Loqheart 2011
version 1.4.10
target Corona SDK
extension lua
exportName sheet
exportPath file:///Users/Anneke/Desktop
sheetSize 1024x1024
sources 1
name; url; referencePoint; startFrame; totalFrames; frameRate; topLeft; bottomRight; sourceRect; loopParam; includeReverse; rasterize
TruckOpening; ../Documents/iPad Project/TruckOpening.swf; (x=0, y=0); 1; 90; 30; (x=-154, y=-100); (x=154, y=94); (x=-156, y=-102, w=312, h=198); 1; false; false
assetShapes 0
]]

local sheet = false
local setInfo = false
local msFactor = 500  -- This should be 1000 ms. Corona BUG: The frame rate is playing back at around half speed at 30fps.

local function newSpriteSet(_sheet, _name, _startFrame, _frameCount, _frameRate, _loopParam, _xReference, _yReference, _spriteSourceWidth, _spriteSourceHeight, _unscaledSpriteX, _unscaledSpriteY, _unscaledSpriteWidth, _unscaledSpriteHeight, _frames, _shapeOnly)
    if (_shapeOnly) then
        return
    end

    local set = sprite.newSpriteSet(_sheet, _startFrame, _frameCount)
    sprite.add(set, _name, 1, _frameCount, (_frameCount / _frameRate) * msFactor, _loopParam)
    setInfo[_name] = {set = set, xReference = _xReference, yReference = _yReference, spriteSourceSize = {width = _spriteSourceWidth, height = _spriteSourceHeight}, unscaledSpriteRect = {x = _unscaledSpriteX, y = _unscaledSpriteY, width = _unscaledSpriteWidth, height = _unscaledSpriteHeight}, frames = _frames, frameRate = _frameRate, frameCount = _frameCount, fpss = _frameRate / 1000, startFrame = _startFrame}
end

local function load()
    local frameSets = {}
    local allFrames = {}

    frameSets["TruckOpening"] = {
        {
            name="TruckOpening-1",
            spriteColorRect={x=0, y=3},
            textureRect={x=0, y=587, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-2",
            spriteColorRect={x=0, y=3},
            textureRect={x=312, y=0, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-3",
            spriteColorRect={x=0, y=3},
            textureRect={x=624, y=0, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-4",
            spriteColorRect={x=0, y=3},
            textureRect={x=936, y=0, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-5",
            spriteColorRect={x=0, y=3},
            textureRect={x=1248, y=0, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-6",
            spriteColorRect={x=0, y=3},
            textureRect={x=624, y=977, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-7",
            spriteColorRect={x=0, y=3},
            textureRect={x=0, y=197, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-8",
            spriteColorRect={x=0, y=3},
            textureRect={x=312, y=197, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-9",
            spriteColorRect={x=0, y=3},
            textureRect={x=624, y=197, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-10",
            spriteColorRect={x=0, y=3},
            textureRect={x=936, y=197, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-11",
            spriteColorRect={x=0, y=3},
            textureRect={x=1248, y=197, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-12",
            spriteColorRect={x=0, y=3},
            textureRect={x=1560, y=197, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-13",
            spriteColorRect={x=0, y=3},
            textureRect={x=0, y=392, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-14",
            spriteColorRect={x=0, y=3},
            textureRect={x=312, y=392, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-15",
            spriteColorRect={x=0, y=3},
            textureRect={x=624, y=392, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-16",
            spriteColorRect={x=0, y=3},
            textureRect={x=936, y=392, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-17",
            spriteColorRect={x=0, y=3},
            textureRect={x=1248, y=392, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-18",
            spriteColorRect={x=0, y=3},
            textureRect={x=1560, y=392, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-19",
            spriteColorRect={x=0, y=3},
            textureRect={x=1248, y=977, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-20",
            spriteColorRect={x=0, y=3},
            textureRect={x=312, y=587, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-21",
            spriteColorRect={x=0, y=3},
            textureRect={x=624, y=587, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-22",
            spriteColorRect={x=0, y=3},
            textureRect={x=936, y=587, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-23",
            spriteColorRect={x=0, y=3},
            textureRect={x=1248, y=587, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-24",
            spriteColorRect={x=0, y=3},
            textureRect={x=312, y=977, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-25",
            spriteColorRect={x=0, y=3},
            textureRect={x=0, y=782, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-26",
            spriteColorRect={x=0, y=3},
            textureRect={x=936, y=977, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-27",
            spriteColorRect={x=0, y=3},
            textureRect={x=624, y=782, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-28",
            spriteColorRect={x=0, y=3},
            textureRect={x=936, y=782, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-29",
            spriteColorRect={x=0, y=3},
            textureRect={x=1248, y=782, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-30",
            spriteColorRect={x=0, y=3},
            textureRect={x=1560, y=782, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-31",
            spriteColorRect={x=0, y=2},
            textureRect={x=0, y=977, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-32",
            spriteColorRect={x=0, y=2},
            textureRect={x=0, y=977, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-33",
            spriteColorRect={x=0, y=2},
            textureRect={x=0, y=977, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-34",
            spriteColorRect={x=0, y=2},
            textureRect={x=0, y=977, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-35",
            spriteColorRect={x=0, y=0},
            textureRect={x=0, y=0, width=312, height=197},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-36",
            spriteColorRect={x=0, y=0},
            textureRect={x=0, y=0, width=312, height=197},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-37",
            spriteColorRect={x=0, y=0},
            textureRect={x=0, y=0, width=312, height=197},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-38",
            spriteColorRect={x=0, y=0},
            textureRect={x=0, y=0, width=312, height=197},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-39",
            spriteColorRect={x=0, y=0},
            textureRect={x=0, y=0, width=312, height=197},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-40",
            spriteColorRect={x=0, y=2},
            textureRect={x=0, y=977, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-41",
            spriteColorRect={x=0, y=2},
            textureRect={x=0, y=977, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-42",
            spriteColorRect={x=0, y=2},
            textureRect={x=0, y=977, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-43",
            spriteColorRect={x=0, y=2},
            textureRect={x=0, y=977, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-44",
            spriteColorRect={x=0, y=2},
            textureRect={x=0, y=977, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-45",
            spriteColorRect={x=0, y=0},
            textureRect={x=0, y=0, width=312, height=197},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-46",
            spriteColorRect={x=0, y=0},
            textureRect={x=0, y=0, width=312, height=197},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-47",
            spriteColorRect={x=0, y=0},
            textureRect={x=0, y=0, width=312, height=197},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-48",
            spriteColorRect={x=0, y=0},
            textureRect={x=0, y=0, width=312, height=197},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-49",
            spriteColorRect={x=0, y=0},
            textureRect={x=0, y=0, width=312, height=197},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-50",
            spriteColorRect={x=0, y=2},
            textureRect={x=0, y=977, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-51",
            spriteColorRect={x=0, y=2},
            textureRect={x=0, y=977, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-52",
            spriteColorRect={x=0, y=2},
            textureRect={x=0, y=977, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-53",
            spriteColorRect={x=0, y=2},
            textureRect={x=0, y=977, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-54",
            spriteColorRect={x=0, y=2},
            textureRect={x=0, y=977, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-55",
            spriteColorRect={x=0, y=0},
            textureRect={x=0, y=0, width=312, height=197},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-56",
            spriteColorRect={x=0, y=0},
            textureRect={x=0, y=0, width=312, height=197},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-57",
            spriteColorRect={x=0, y=0},
            textureRect={x=0, y=0, width=312, height=197},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-58",
            spriteColorRect={x=0, y=0},
            textureRect={x=0, y=0, width=312, height=197},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-59",
            spriteColorRect={x=0, y=0},
            textureRect={x=0, y=0, width=312, height=197},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-60",
            spriteColorRect={x=0, y=2},
            textureRect={x=0, y=977, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-61",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=977, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-62",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=977, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-63",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=977, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-64",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=977, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-65",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=977, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-66",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=977, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-67",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=977, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-68",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=977, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-69",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=977, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-70",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=0, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-71",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=0, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-72",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=0, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-73",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=0, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-74",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=0, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-75",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=0, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-76",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=0, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-77",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=0, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-78",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=0, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-79",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=0, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-80",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=587, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-81",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=587, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-82",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=587, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-83",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=587, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-84",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=587, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-85",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=587, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-86",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=587, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-87",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=587, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-88",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=587, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-89",
            spriteColorRect={x=0, y=2},
            textureRect={x=1560, y=587, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        },
        {
            name="TruckOpening-90",
            spriteColorRect={x=0, y=2},
            textureRect={x=312, y=782, width=312, height=195},
            spriteSourceSize={width=312, height=198},
            spriteTrimmed=true,
        }
    }
    allFrames = table.copy(allFrames, frameSets["TruckOpening"])


    sheet = sprite.newSpriteSheetFromData("sheet.png", {frames = allFrames })

    -- setInfo table contains info about sprites: { (spriteName = {set: set, xReference: xReference, yReference: yReference, spriteSourceSize = {width: width, height: height}})+ }
    setInfo = {}
    newSpriteSet(sheet, "TruckOpening", 1, 90, 30, 1, 0 - (312/2 + -156), 0 - (198/2 + -102), 312, 198, 0, 3, 312, 195, frameSets["TruckOpening"], false)

    local shapes = {}
    shapes["TruckOpening"] = {

    }

    return { sheet = sheet, setInfo = setInfo, shapes = shapes }
end

local function destroy()
    sheet:dispose()
    sheet = nil
    setInfo = nil
end

return { load = load, destroy = destroy }
