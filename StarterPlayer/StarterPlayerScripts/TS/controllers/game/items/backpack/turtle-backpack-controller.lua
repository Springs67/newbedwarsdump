local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "TurtleBackpackController"
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
    p12.Name = "TurtleBackpackController"
end
function u9.KnitStart(p13) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u4
        [4] = u7
        [5] = u2
        [6] = u8
    --]]
    u6.KnitStart(p13)
    u5.BackpackEquipEvent:connect(function(p14) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u7
            [3] = u2
            [4] = u8
        --]]
        if p14.player == u4.LocalPlayer and p14.item == u7.TURTLE_BACKPACK then
            u2:playSound(u8.EQUIP_TURTLE_SHELL)
        end
    end)
end
v3.CreateController(u9.new())
return nil