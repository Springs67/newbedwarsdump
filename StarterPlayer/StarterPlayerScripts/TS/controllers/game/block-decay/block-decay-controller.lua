local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u9 = { v8.ROCK_CRUMBLE_1, v8.ROCK_CRUMBLE_2, v8.ROCK_CRUMBLE_3 }
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "BlockDecayController"
    end,
    ["__index"] = u6
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
        [1] = u6
    --]]
    u6.constructor(p13)
    p13.Name = "BlockDecayController"
end
function u10.KnitStart(p14) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
        [3] = u3
        [4] = u9
        [5] = u4
    --]]
    u6.KnitStart(p14)
    u7.Client:Get("RandomNearbyBlockDecaySound"):Connect(function(p15) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u9
            [3] = u4
        --]]
        local v16 = u9
        u4:playSound(u3.fromList(unpack(v16)), {
            ["volumeMultiplier"] = 0.5,
            ["position"] = p15.position
        })
    end)
end
v5.CreateController(u10.new())
return nil