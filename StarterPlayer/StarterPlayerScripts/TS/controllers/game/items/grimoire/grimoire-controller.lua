local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "GrimoireController"
    end,
    ["__index"] = u5
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p11)
    p11.Name = "GrimoireController"
end
function u8.KnitStart(p12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u6
        [4] = u2
        [5] = u7
    --]]
    u5.KnitStart(p12)
    u4.ItemConsumed:connect(function(p13) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u2
            [3] = u7
        --]]
        if p13.itemType ~= u6.GRIMOIRE then
            return nil
        end
        local v14 = u2
        local v15 = u7.GRIMOIRE_CAST_COMPLETE
        local v16 = {}
        local v17 = p13.entity:getInstance().PrimaryPart
        if v17 ~= nil then
            v17 = v17.Position
        end
        v16.position = v17
        v14:playSound(v15, v16)
    end)
end
v3.CreateController(u8.new())
return nil