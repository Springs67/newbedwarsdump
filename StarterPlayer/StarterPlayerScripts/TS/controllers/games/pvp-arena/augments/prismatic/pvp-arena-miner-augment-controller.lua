local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-type").PvPArenaAugmentType
local u5 = v1.import(script, script.Parent.Parent.Parent, "pvp-arena-base-augment-controller").PvPArenaBaseAugmentController
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "PvPArenaMinerAugmentController"
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
function u6.constructor(p9) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
    --]]
    u5.constructor(p9, u4.MINER)
    p9.Name = "PvPArenaMinerAugmentController"
end
function u6.onActivated(_) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    u2.Controllers.MinerController:add(u3.LocalPlayer)
    u2.Controllers.MinerController:initKit(u3.LocalPlayer)
    u2.Controllers.MinerController:setupMinerPrompts(1)
end
u2.CreateController(u6.new())
return nil