local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u4 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 8 ]]
        return "BalloonSkin"
    end
})
u4.__index = u4
function u4.new(...) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v5 = u4
    local v6 = setmetatable({}, v5)
    return v6:constructor(...) or v6
end
function u4.constructor(_) --[[ Line: 17 ]] end
u4.BALLOON_SKIN_MODELS = {
    "InflatedBalloon",
    "InflatedBalloonGhost1",
    "InflatedBalloonDino",
    "InflatedBalloonGoose",
    "InflatedBalloonPenguin",
    "InflatedBalloonDodo"
}
u4.BALLOON_POP_SOUNDS = { v3.BALLOON_POP_GHOSTLY }
u4.BALLOON_SKIN_MODELS_LOBBY = {
    "InflatedBalloonDodo",
    "InflatedBalloonDino",
    "InflatedBalloonGoose",
    "InflatedBalloonPenguin"
}
u4.BALLOON_FLOAT_AWAY_SKIN_MODELS = {
    "InflatedBalloonDodo",
    "InflatedBalloonDino",
    "InflatedBalloonGoose",
    "InflatedBalloonPenguin"
}
u4.BALLOON_SKIN_MODELS_COLORS = {
    ["InflatedBalloonDodo"] = Color3.fromHex("#e67c05"),
    ["InflatedBalloonDino"] = Color3.fromHex("#3a9c47"),
    ["InflatedBalloonGoose"] = Color3.fromHex("#e3b707"),
    ["InflatedBalloonPenguin"] = v2.WHITE
}
return {
    ["BalloonSkin"] = u4
}