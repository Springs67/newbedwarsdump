local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.RandomUtil
local u5 = v3.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "HeavyHitterToolEnchantController"
    end,
    ["__index"] = u7
})
u10.__index = u10
function u10.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p13)
    p13.Name = "HeavyHitterToolEnchantController"
end
function u10.KnitStart(p14) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
        [3] = u5
        [4] = u4
        [5] = u9
        [6] = u2
    --]]
    u7.KnitStart(p14)
    u8.Client:Get("HeavyHitterHit"):Connect(function(p15) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u9
            [4] = u2
        --]]
        u5:playSound(u4.fromList(u9.HEAVY_HITTER_HIT_1, u9.HEAVY_HITTER_HIT_2, u9.HEAVY_HITTER_HIT_3), {
            ["volumeMultiplier"] = 0.8,
            ["position"] = u2:getWorldPosition(p15.blockPosition)
        })
    end)
end
v6.CreateController(u10.new())
return nil