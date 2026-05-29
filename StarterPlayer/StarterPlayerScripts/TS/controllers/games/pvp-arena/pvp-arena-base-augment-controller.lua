local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u3 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-meta").getPvPArenaAugmentMeta
local v6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "PvPArenaBaseAugmentController"
    end,
    ["__index"] = u3
})
v6.__index = v6
function v6.constructor(p7, p8) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
    --]]
    u3.constructor(p7, { u4.PVP_ARENA })
    p7.Name = "PvPArenaBaseAugmentController"
    p7.augmentType = p8
    p7.config = p7:getAugmentConfig()
end
function v6.onGameInit(u9) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    u2.PvPArenaAugmentClientSelected:connect(function(p10) --[[ Line: 24 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        if u9.augmentType == p10.augmentType then
            u9:onActivated()
        end
    end)
end
function v6.getAugmentConfig(p11) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    return u5(p11.augmentType).config()
end
return {
    ["PvPArenaBaseAugmentController"] = v6
}