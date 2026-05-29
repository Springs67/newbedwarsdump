local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").CollectionTagAdded
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "DuckController"
    end,
    ["__index"] = u6
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p12)
    p12.Name = "DuckController"
end
function u9.KnitStart(p13) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u2
        [3] = u7
        [4] = u5
        [5] = u8
    --]]
    u6.KnitStart(p13)
    u2("Monster", function(u14) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u5
            [3] = u8
        --]]
        if u14:GetAttribute("MonsterType") == u7.DUCK then
            task.spawn(function() --[[ Line: 32 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u14
                    [3] = u8
                --]]
                u5.Controllers.FootstepsController:hookCharacter(nil, u14, {
                    ["walk"] = { u8.DUCK_FOOTSTEP_1, u8.DUCK_FOOTSTEP_2, u8.DUCK_FOOTSTEP_3 },
                    ["run"] = { u8.DUCK_FOOTSTEP_1, u8.DUCK_FOOTSTEP_2, u8.DUCK_FOOTSTEP_3 }
                })
            end)
        end
    end)
end
v4.CreateController(u9.new())
return nil