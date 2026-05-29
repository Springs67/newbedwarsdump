local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType
local u5 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "FireworkKillEffect"
    end,
    ["__index"] = u5
})
u6.__index = u6
function u6.new(...) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9, ...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p9, ...)
end
function u6.onKill(_, _, _, u10) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
        [3] = u4
    --]]
    local u11 = u3.new()
    task.spawn(function() --[[ Line: 26 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u10
            [3] = u4
            [4] = u11
        --]]
        local v12 = u2.Controllers.FireworkController
        local v13 = u10.Position
        local v14 = math.random() * 7 - 3.5
        local v15 = math.random() * 7 - 3.5
        local v16 = math.random() * 7 - 3.5
        u11:GiveTask((v12:playFireworkEffect(v13 + Vector3.new(v14, v15, v16), u4.NEW_YEARS, {
            ["sizeMultiplier"] = 0.7,
            ["popSoundPlaybackSpeedMultiplier"] = 1
        })))
    end)
    return u11
end
return u6