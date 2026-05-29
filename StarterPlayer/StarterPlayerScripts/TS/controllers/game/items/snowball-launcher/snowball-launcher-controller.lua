local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.CollectionService
local u9 = v7.Players
local u10 = v7.ReplicatedStorage
local u11 = v7.Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "effect", "vignette", "vignette-meta").VignetteType
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "snowball-launcher", "snowball-launcher-util")
local u18 = v17.SnowballLauncherMode
local u19 = v17.SnowballLauncherUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u25 = v1.import(script, script.Parent, "snowball-launcher-progress-bar").SnowballLauncherProgressBar
local u26 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 31 ]]
        return "SnowballLauncherController"
    end,
    ["__index"] = u14
})
u26.__index = u26
function u26.new(...) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    local v27 = u26
    local v28 = setmetatable({}, v27)
    return v28:constructor(...) or v28
end
function u26.constructor(p29) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u5
        [3] = u20
        [4] = u21
    --]]
    u14.constructor(p29)
    p29.Name = "SnowballLauncherController"
    p29.abilityMaid = u5.new()
    p29.abilityIcon = u20(u21.SNOWBALL_LAUNCHER).image
    p29.frostedMaids = {}
    p29.frozenMaids = {}
end
function u26.KnitStart(u30) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u4
        [3] = u21
        [4] = u22
        [5] = u12
        [6] = u23
        [7] = u16
        [8] = u9
        [9] = u24
        [10] = u15
        [11] = u3
        [12] = u6
        [13] = u25
        [14] = u19
    --]]
    u14.KnitStart(u30)
    u4.Controllers.PreloadController:preloadForItemType(u21.SNOWBALL_LAUNCHER, {
        ["sounds"] = {
            u22.SNOWBALL_LAUNCHER_SINGLE_SHOT_1,
            u22.SNOWBALL_LAUNCHER_SINGLE_SHOT_2,
            u22.SNOWBALL_LAUNCHER_SINGLE_SHOT_3,
            u22.SNOWBALL_LAUNCHER_SINGLE_SHOT_4,
            u22.SNOWBALL_LAUNCHER_POWER_SHOT,
            u22.SNOWBALL_LAUNCHER_SPREAD_SHOT,
            u22.SNOWBALL_LAUNCHER_RAPID_SHOT,
            u22.SNOWBALL_LAUNCHER_CHARGE_UP,
            u22.SNOWBALL_LAUNCHER_SWITCH_MODE
        }
    })
    u12.StatusEffectAdded:connect(function(p31) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u16
            [3] = u30
        --]]
        if p31.statusEffect ~= u23.FROZEN then
            return nil
        end
        local v32 = u16:getPlayerFromEntityInstance(p31.entityInstance)
        u30.frozenMaids[p31.entityInstance] = u30:setFrozenEffects(p31.entityInstance, v32)
    end)
    u12.StatusEffectRemoved:connect(function(p33) --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u30
        --]]
        if p33.statusEffect ~= u23.FROZEN then
            return nil
        end
        u30:removeFrozenEffects(p33.entityInstance)
    end)
    u12.StatusEffectAdded:connect(function(p34) --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u16
            [3] = u9
            [4] = u30
            [5] = u4
        --]]
        if p34.statusEffect ~= u23.FROSTED then
            return nil
        end
        local v35 = u16:getPlayerFromEntityInstance(p34.entityInstance)
        if u9.LocalPlayer == v35 then
            u30.speedMaid = u4.Controllers.SprintController:getMovementStatusModifier():addModifier({
                ["blockSprint"] = false,
                ["moveSpeedMultiplier"] = 0.5
            })
        end
        u30:setFrostedEffects(p34.entityInstance, v35)
    end)
    u12.BeginProjectileTargeting:connect(function(p36) --[[ Line: 88 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u16
            [3] = u9
            [4] = u24
            [5] = u23
        --]]
        if p36.handItem.itemType == u21.TELEPEARL then
            local v37 = u16:getEntity(u9.LocalPlayer)
            if v37 ~= nil then
                v37 = v37:getInstance()
            end
            if v37 and u24:isActive(v37, u23.FROSTED) then
                p36:setCancelled(true)
            end
        end
    end)
    u12.StatusEffectRemoved:connect(function(p38) --[[ Line: 100 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u16
            [3] = u9
            [4] = u30
        --]]
        if p38.statusEffect ~= u23.FROSTED then
            return nil
        end
        if u16:getPlayerFromEntityInstance(p38.entityInstance) == u9.LocalPlayer and u30.speedMaid then
            u30.speedMaid:Destroy()
            u30.speedMaid = nil
        end
        u30:removeFrostedEffects(p38.entityInstance)
    end)
    u12.AbilityUsed:connect(function(p39) --[[ Line: 114 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u9
            [3] = u3
            [4] = u22
            [5] = u30
            [6] = u6
            [7] = u25
            [8] = u19
        --]]
        if p39.ability ~= u15.SNOWBALL_LAUNCHER_CYCLE then
            return nil
        end
        if p39.userCharacter ~= u9.LocalPlayer.Character then
            return nil
        end
        u3:playSound(u22.SNOWBALL_LAUNCHER_SWITCH_MODE)
        task.spawn(function() --[[ Line: 122 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u6
                [3] = u25
                [4] = u19
                [5] = u9
            --]]
            if u30.tree then
                u6.unmount(u30.tree)
            end
            u30.tree = u6.mount(u6.createElement("ScreenGui", {}, { u6.createElement(u25, {
                    ["noBar"] = true,
                    ["chargeTime"] = 1,
                    ["title"] = u19.getTitle(u9.LocalPlayer:GetAttribute("SnowballLauncherCycle"))
                }) }), u9.LocalPlayer:WaitForChild("PlayerGui"), "ChargeSnowballLauncher")
        end)
    end)
end
function u26.isRelevantItem(_, p40) --[[ Line: 136 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    return p40.itemType == u21.SNOWBALL_LAUNCHER
end
function u26.onEnable(p41, _, _) --[[ Line: 139 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u18
    --]]
    u9.LocalPlayer:SetAttribute("SnowballLauncherCycle", u18.POWER)
    p41:mountCycleAbility()
end
function u26.onDisable(p42) --[[ Line: 143 ]]
    p42:unmountAbility()
end
function u26.mountCycleAbility(p43) --[[ Line: 146 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u15
    --]]
    local v44 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v45 = u15.SNOWBALL_LAUNCHER_CYCLE
    local v46 = {}
    local v47 = {}
    local v48 = p43.abilityIcon
    v47.icon = v48 == nil and "" or v48
    v46.abilityButton = v47
    v46.abilityType = "ItemPrimary"
    local u49 = v44:enableAbility(v45, v46):expect()
    p43.abilityMaid:GiveTask(function() --[[ Line: 161 ]]
        --[[
        Upvalues:
            [1] = u49
        --]]
        u49.Destroy()
    end)
end
function u26.unmountAbility(p50) --[[ Line: 165 ]]
    p50.abilityMaid:DoCleaning()
end
function u26.removeFrozenEffects(p51, p52) --[[ Line: 168 ]]
    local v53 = p51.frozenMaids[p52]
    if v53 ~= nil then
        v53:DoCleaning()
    end
end
function u26.setFrozenEffects(_, _, p54) --[[ Line: 176 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u9
        [3] = u4
        [4] = u13
    --]]
    local v55 = u5.new()
    if p54 == u9.LocalPlayer then
        u4.Controllers.VignetteController:createVignette(u13.ICE)
        v55:GiveTask(function() --[[ Line: 180 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u13
            --]]
            u4.Controllers.VignetteController:destroyVignette(u13.ICE)
        end)
    end
    return v55
end
function u26.removeFrostedEffects(p56, p57) --[[ Line: 186 ]]
    local v58 = p56.frostedMaids[p57]
    if v58 then
        v58:DoCleaning()
        p56.frostedMaids[p57] = nil
    end
end
function u26.setFrostedEffects(p59, p60, p61, p62) --[[ Line: 197 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u10
        [3] = u11
        [4] = u8
        [5] = u9
        [6] = u4
        [7] = u13
    --]]
    local v63 = u5.new()
    if p59.frostedMaids[p60] ~= nil then
        return v63
    end
    local v64 = u10.Assets.Effects.FrostedEffect:Clone()
    v64.Parent = u11
    for v65, v66 in v64:GetChildren() do
        local _ = v65 - 1
        v66.Parent = p60.UpperTorso
        v63:GiveTask(v66)
        u8:AddTag(v66, "FirstPersonHidden")
        v66:SetAttribute("FirstPersonVisible", false)
    end
    if p61 == u9.LocalPlayer then
        u4.Controllers.VignetteController:createVignette(u13.FROSTED, {
            ["transparencyMultiplier"] = p62
        })
        v63:GiveTask(function() --[[ Line: 220 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u13
            --]]
            u4.Controllers.VignetteController:destroyVignette(u13.FROSTED)
        end)
    end
    p59.frostedMaids[p60] = v63
    return v63
end
u4.CreateController(u26.new())
return nil