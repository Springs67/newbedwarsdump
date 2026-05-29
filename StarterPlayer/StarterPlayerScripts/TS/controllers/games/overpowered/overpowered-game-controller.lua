local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u7 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "overpowered", "overpowered-game-balance").OverpoweredGameBalance
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "OverpoweredGameController"
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
        [2] = u8
        [3] = u4
    --]]
    u7.constructor(p13, { u8.OVERPOWERED })
    p13.Name = "OverpoweredGameController"
    p13.moveSpeedModifierMaid = u4.new()
end
function u10.KnitStart(p14) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.KnitStart(p14)
end
function u10.onGameInit(u15) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
        [3] = u3
        [4] = u9
        [5] = u6
    --]]
    u2(function(p16, _) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u15
            [3] = u3
            [4] = u9
        --]]
        if p16 == u5.LocalPlayer then
            task.delay(0.1, function() --[[ Line: 37 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u3
                    [3] = u9
                --]]
                u15.moveSpeedModifierMaid:DoCleaning()
                local v17 = u3.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    ["moveSpeedMultiplier"] = u9.MoveSpeedMultiplier
                })
                u15.moveSpeedModifierMaid:GiveTask(v17)
            end)
        end
    end)
    u6.AbilityCooldownModifierCheck:connect(function(p18) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        p18.cooldown = p18.cooldown * u9.AbilityCooldownMultiplier
    end)
    u6.ProjectileCooldownModifierCheck:connect(function(p19) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        p19.cooldown = p19.cooldown * u9.ProjectileCooldownMultiplier
    end)
    u6.ProjectileMaxChargeTimeModifierCheck:connect(function(p20) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        p20.maxChargeTime = p20.maxChargeTime * u9.ProjectileMaxChargeTimeMultiplier
    end)
    u6.CropGrowthTimeModifierCheck:connect(function(p21) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        p21.growthTime = p21.growthTime * u9.CropGrowthTimeMultiplier
    end)
    u6.KitProgressModifierCheck:connect(function(p22) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        p22.amount = p22.amount * u9.KitProgressMultiplier
    end)
    u6.ItemCooldownModifierCheck:connect(function(p23) --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        p23.cooldown = p23.cooldown * u9.ItemCooldownMultiplier
    end)
    u6.ResourceSpawnDelayModifierCheck:connect(function(p24) --[[ Line: 66 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        p24.spawnDelay = p24.spawnDelay * u9.ResourceSpawnDelayMultiplier
    end)
    u6.RepeatingGiveItemModifierCheck:connect(function(p25) --[[ Line: 69 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        p25.interval = p25.interval * u9.RepeatingGiveItemIntervalMultiplier
    end)
    u6.BuffDurationModifierCheck:connect(function(p26) --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        p26.duration = p26.duration * u9.BuffDurationMultiplier
    end)
    u6.DebuffDurationModifierCheck:connect(function(p27) --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        p27.duration = p27.duration * u9.DebuffDurationMultiplier
    end)
    u6.CastTimeModifierCheck:connect(function(p28) --[[ Line: 78 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        p28.castTime = p28.castTime * u9.CastTimeMultiplier
    end)
    u6.AbilityTickDelayModifierCheck:connect(function(p29) --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        p29.tickDelay = p29.tickDelay * u9.AbilityTickDelayMultiplier
    end)
    u6.ConsumableConsumeTimeModifierCheck:connect(function(p30) --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        p30.consumeTime = p30.consumeTime * u9.ConsumableConsumeTimeMultiplier
    end)
    u6.SwordChargeTimeModifierCheck:connect(function(p31) --[[ Line: 87 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        p31.maxChargeTime = p31.maxChargeTime * u9.SwordChargeTimeMultiplier
        if p31.minChargeTime ~= nil then
            p31.minChargeTime = p31.minChargeTime * u9.SwordChargeTimeMultiplier
        end
    end)
end
u3.CreateController(u10.new())
return nil