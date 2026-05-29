local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-type").PvPArenaAugmentType
local u6 = v1.import(script, script.Parent.Parent.Parent, "pvp-arena-base-augment-controller").PvPArenaBaseAugmentController
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "PvPArenaFleetFootedAugmentController"
    end,
    ["__index"] = u6
})
u7.__index = u7
function u7.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
    --]]
    u6.constructor(p10, u5.FLEET_FOOTED)
    p10.Name = "PvPArenaFleetFootedAugmentController"
    p10.fleetFootStackCount = 0
end
function u7.onGameInit(u11) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u2
        [3] = u4
    --]]
    u6.onGameInit(u11)
    u2(function(p12) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u11
        --]]
        if p12 == u4.LocalPlayer and u11.fleetFootStackCount > 0 then
            u11:addSpeedModifier()
        end
    end)
end
function u7.onActivated(p13) --[[ Line: 35 ]]
    p13.fleetFootStackCount = p13.fleetFootStackCount + 1
    p13:addSpeedModifier()
end
function u7.addSpeedModifier(p14) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    if p14.speedModifier then
        u3.Controllers.SprintController:getMovementStatusModifier():removeModifier(p14.speedModifier)
    end
    p14.speedModifier = {
        ["blockSprint"] = false,
        ["moveSpeedMultiplier"] = 1 + (p14.config.speedMultiplier - 1) * p14.fleetFootStackCount
    }
    u3.Controllers.SprintController:getMovementStatusModifier():addModifier(p14.speedModifier)
end
u3.CreateController(u7.new())
return nil