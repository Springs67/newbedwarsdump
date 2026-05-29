local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.SoundManager
local u5 = v3.WatchCharacter
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.ReplicatedStorage
local u12 = v9.RunService
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "werewolf-tail-balance").WerewolfTailBalance
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "werewolf-tail", "werewolf-tail-attributes").WerewolfTailAttributes
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").GetAttributeChangedSignal
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u26 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 30 ]]
        return "WerewolfAOEIndicatorData"
    end
})
u26.__index = u26
function u26.new(...) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    local v27 = u26
    local v28 = setmetatable({}, v27)
    return v28:constructor(...) or v28
end
function u26.constructor(p29, p30, p31, p32) --[[ Line: 39 ]]
    p29.player = p30
    p29.indicator = p31
    p29.chargingEffect = p32
end
local u33 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 49 ]]
        return "WerewolfTailController"
    end,
    ["__index"] = u14
})
u33.__index = u33
function u33.new(...) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u33
    --]]
    local v34 = u33
    local v35 = setmetatable({}, v34)
    return v35:constructor(...) or v35
end
function u33.constructor(p36) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u8
    --]]
    u14.constructor(p36)
    p36.Name = "WerewolfTailController"
    p36.aoeIndicators = {}
    p36.isChargingHowl = false
    p36.fearStatusEffectMaid = u8.new()
    p36.chargingHowlMaid = u8.new()
    p36.abilityMaid = u8.new()
end
function u33.onDisable(p37) --[[ Line: 68 ]]
    p37.isChargingHowl = false
end
function u33.becomeWerewolf(u38, p39) --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u2
        [3] = u15
        [4] = u20
    --]]
    if p39.entityInstance ~= u10.LocalPlayer.Character then
        return nil
    end
    local u40 = true
    u38.abilityMaid:GiveTask(function() --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u40
        --]]
        u40 = false
        return u40
    end)
    task.spawn(function() --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u15
            [3] = u20
            [4] = u40
            [5] = u38
        --]]
        local v41 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v42 = u15.WEREWOLF_HOWL
        local v43 = {
            ["abilityType"] = "MiscPrimary",
            ["abilityButton"] = {
                ["icon"] = u20.WEREWOLF_HOWL_ABILITY
            }
        }
        local v44 = v41:enableAbility(v42, v43):expect()
        if u40 then
            u38.abilityMaid:GiveTask(v44)
        else
            v44.Destroy()
        end
    end)
end
function u33.removeWerewolf(p45, p46) --[[ Line: 95 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    if p46.entityInstance ~= u10.LocalPlayer.Character then
        return nil
    end
    p45.abilityMaid:DoCleaning()
    p45.isChargingHowl = false
end
function u33.useHowlAbility(p47, p48) --[[ Line: 102 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u10
        [3] = u21
    --]]
    if p48.ability == u15.WEREWOLF_HOWL and p48.userCharacter == u10.LocalPlayer.Character then
        if not u21.Client:Get("UseWerewolfHowlAbility"):CallServer({
            ["player"] = u10.LocalPlayer
        }) then
            return nil
        end
        p47.isChargingHowl = true
    end
end
function u33.playerStartedChargingHowl(p49, p50) --[[ Line: 114 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u22
        [3] = u10
        [4] = u17
        [5] = u16
    --]]
    p49:showAoeIndicator(p50)
    local v51 = u4
    local v52 = u22.WEREWOLF_CHARGE
    local v53 = {}
    local v54 = p50.Character
    if v54 ~= nil then
        v54 = v54:GetPivot().Position
    end
    v53.position = v54
    v51:playSound(v52, v53)
    if p50 ~= u10.LocalPlayer then
        return nil
    end
    u17:playAnimation(u10.LocalPlayer, u16.WEREWOLF_CHARGE)
end
function u33.showAoeIndicator(p55, p56) --[[ Line: 134 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u25
        [3] = u18
        [4] = u10
        [5] = u26
    --]]
    local v57
    if p56 == nil then
        v57 = p56
    else
        v57 = p56.Character
        if v57 ~= nil then
            v57 = v57.PrimaryPart
        end
    end
    if not v57 then
        return nil
    end
    local v58 = u11.Assets.Misc.WerewolfAOEIndicator:Clone()
    local v59 = p56.Character:GetPivot().Position
    v58.Position = v59
    v58.Parent = p56.Character
    u25:weldParts(v58, p56.Character.PrimaryPart)
    local v60 = u18.HOWL_RADIUS * 2
    local v61 = u18.HOWL_RADIUS * 2
    local v62 = u18.HOWL_RADIUS * 2
    v58.Size = Vector3.new(v60, v61, v62)
    local v63 = u11.Assets.Effects.WerewolfCharging:Clone()
    v63:PivotTo(CFrame.new(v59))
    v63.Parent = p56.Character
    u25:weldParts(v63.PrimaryPart, p56.Character.PrimaryPart)
    if p56 == u10.LocalPlayer then
        p55.myChargingParticleParent = v63
        for v64, v65 in p55.myChargingParticleParent:GetDescendants() do
            local _ = v64 - 1
            v65:SetAttribute("FirstPersonVisible", false)
        end
    end
    if p55.aoeIndicators[p56.UserId] ~= nil then
        local v66 = p55.aoeIndicators[p56.UserId]
        if v66 ~= nil then
            local v67 = v66.indicator
            if v67 ~= nil then
                v67:Destroy()
            end
        end
        local v68 = p55.aoeIndicators[p56.UserId]
        if v68 ~= nil then
            local v69 = v68.chargingEffect
            if v69 ~= nil then
                v69:Destroy()
            end
        end
    end
    p55.aoeIndicators[p56.UserId] = u26.new(p56, v58, v63)
end
function u33.addFearStatusEffect(p70, p71) --[[ Line: 202 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u12
        [3] = u18
    --]]
    if p71.entityInstance ~= u10.LocalPlayer.Character then
        return nil
    end
    u12:BindToRenderStep("werewolf-fear-status", Enum.RenderPriority.Character.Value + 1, function(p72) --[[ Line: 207 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u18
        --]]
        local v73 = u10.LocalPlayer.Character
        if v73 ~= nil then
            v73 = v73:FindFirstChild("Humanoid")
        end
        if not v73 then
            return nil
        end
        v73:Move(v73.RootPart.CFrame.LookVector * (p72 * u18.FEAR_WALK_SPEED))
    end)
    p70.fearStatusEffectMaid:GiveTask(function() --[[ Line: 226 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        return u12:UnbindFromRenderStep("werewolf-fear-status")
    end)
end
function u33.removeFearStatusEffect(p74, p75) --[[ Line: 230 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    if p75.entityInstance ~= u10.LocalPlayer.Character then
        return nil
    end
    p74.fearStatusEffectMaid:DoCleaning()
end
function u33.addFeralStatusEffect(_, p76) --[[ Line: 236 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    if p76.entityInstance ~= u10.LocalPlayer.Character then
        return nil
    end
end
function u33.werewolfSpeedBoostAttributeChanged(p77, _, _, p78) --[[ Line: 241 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    if p78 == nil then
        if p77.speedBoostMaid then
            p77.speedBoostMaid:Destroy()
            p77.speedBoostMaid = nil
        end
    else
        p77.speedBoostMaid = u6.Controllers.SprintController:getMovementStatusModifier():addModifier({
            ["blockSprint"] = false,
            ["moveSpeedMultiplier"] = p78
        })
    end
end
function u33.werewolfJumpBoostAttributeChanged(p79, _, _, p80) --[[ Line: 254 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    if p80 == nil then
        if p79.jumpBoostMaid then
            p79.jumpBoostMaid:Destroy()
            p79.jumpBoostMaid = nil
        end
    else
        p79.jumpBoostMaid = u6.Controllers.JumpHeightController:getJumpModifier():addModifier({
            ["jumpHeightMultiplier"] = p80
        })
    end
end
function u33.KnitStart(u81) --[[ Line: 266 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u13
        [3] = u21
        [4] = u23
        [5] = u5
        [6] = u10
        [7] = u24
        [8] = u19
        [9] = u4
        [10] = u22
        [11] = u11
        [12] = u25
        [13] = u17
        [14] = u16
        [15] = u7
    --]]
    u14.KnitStart(u81)
    u13.AbilityUsed:connect(function(p82) --[[ Line: 273 ]]
        --[[
        Upvalues:
            [1] = u81
        --]]
        return u81:useHowlAbility(p82)
    end)
    u21.Client:WaitFor("WerewolfStartChargingHowl"):andThen(function(p83) --[[ Line: 278 ]]
        --[[
        Upvalues:
            [1] = u81
        --]]
        p83:Connect(function(p84) --[[ Line: 279 ]]
            --[[
            Upvalues:
                [1] = u81
            --]]
            return u81:playerStartedChargingHowl(p84.player)
        end)
    end)
    u13.StatusEffectAdded:connect(function(p85) --[[ Line: 285 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u81
        --]]
        if p85.statusEffect == u23.WEREWOLF then
            u81:becomeWerewolf(p85)
        end
        if p85.statusEffect == u23.WEREWOLF_FEAR then
            u81:addFearStatusEffect(p85)
        end
        if p85.statusEffect == u23.WEREWOLF_FERAL then
            u81:addFeralStatusEffect(p85)
        end
    end)
    u13.StatusEffectRemoved:connect(function(p86) --[[ Line: 297 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u81
        --]]
        if p86.statusEffect == u23.WEREWOLF then
            u81:removeWerewolf(p86)
        end
        if p86.statusEffect == u23.WEREWOLF_FEAR then
            u81:removeFearStatusEffect(p86)
        end
    end)
    u5(function(u87, u88, p89) --[[ Line: 306 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u24
            [3] = u19
            [4] = u81
        --]]
        if u87 ~= u10.LocalPlayer then
            return nil
        end
        p89:GiveTask(u24(u88, u19.WerewolfSpeedBoostAttr, function(p90) --[[ Line: 310 ]]
            --[[
            Upvalues:
                [1] = u81
                [2] = u87
                [3] = u88
            --]]
            u81:werewolfSpeedBoostAttributeChanged(u87, u88, p90)
        end))
        p89:GiveTask(u24(u88, u19.WerewolfJumpBoostAttr, function(p91) --[[ Line: 313 ]]
            --[[
            Upvalues:
                [1] = u81
                [2] = u87
                [3] = u88
            --]]
            u81:werewolfJumpBoostAttributeChanged(u87, u88, p91)
        end))
    end)
    u21.Client:WaitFor("WerewolfDestroyIndicator"):andThen(function(p92) --[[ Line: 344 ]]
        --[[
        Upvalues:
            [1] = u81
        --]]
        p92:Connect(function(p93) --[[ Line: 345 ]]
            --[[
            Upvalues:
                [1] = u81
            --]]
            if u81.aoeIndicators[p93.playerID] ~= nil then
                local v94 = u81.aoeIndicators[p93.playerID]
                if v94 ~= nil then
                    local v95 = v94.indicator
                    if v95 ~= nil then
                        v95:Destroy()
                    end
                end
                local v96 = u81.aoeIndicators[p93.playerID]
                if v96 ~= nil then
                    local v97 = v96.chargingEffect
                    if v97 ~= nil then
                        v97:Destroy()
                    end
                end
                u81.aoeIndicators[p93.playerID] = nil
            end
        end)
    end)
    u21.Client:WaitFor("WerewolfHowl"):andThen(function(p98) --[[ Line: 376 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u22
            [3] = u11
            [4] = u25
            [5] = u10
            [6] = u17
            [7] = u16
            [8] = u81
        --]]
        p98:Connect(function(p99) --[[ Line: 377 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u22
                [3] = u11
                [4] = u25
                [5] = u10
                [6] = u17
                [7] = u16
                [8] = u81
            --]]
            local v100 = u4
            local v101 = u22.WEREWOLF_HOWL
            local v102 = {}
            local v103 = p99.player.Character
            if v103 ~= nil then
                v103 = v103:GetPivot().Position
            end
            v102.position = v103
            v100:playSound(v101, v102)
            local u104 = u11.Assets.Effects.WerewolfHowl:Clone()
            u104.Position = p99.player.Character:GetPivot().Position
            u104.Parent = p99.player.Character
            u25:weldParts(u104, p99.player.Character.PrimaryPart)
            if p99.player == u10.LocalPlayer then
                u17:playAnimation(u10.LocalPlayer, u16.WEREWOLF_HOWL)
                u81.myChargingParticleParent = nil
            end
            task.delay(2, function() --[[ Line: 401 ]]
                --[[
                Upvalues:
                    [1] = u104
                --]]
                return u104:Destroy()
            end)
            if p99.player ~= u10.LocalPlayer then
                return nil
            end
            u81.chargingHowlMaid:DoCleaning()
            u81.isChargingHowl = false
        end)
    end)
    u13.SwordSwing:setPriority(u7.HIGHEST):connect(function(p105) --[[ Line: 414 ]]
        --[[
        Upvalues:
            [1] = u81
        --]]
        if u81.isChargingHowl then
            p105:setCancelled(true)
        end
    end)
    u13.AbilityUsed:setPriority(u7.HIGHEST):connect(function(p106) --[[ Line: 419 ]]
        --[[
        Upvalues:
            [1] = u81
        --]]
        if u81.isChargingHowl then
            p106:setCancelled(true)
        end
    end)
    u13.StartLaunchProjectile:setPriority(u7.HIGHEST):connect(function(p107) --[[ Line: 424 ]]
        --[[
        Upvalues:
            [1] = u81
        --]]
        if u81.isChargingHowl then
            p107:setCancelled(true)
        end
    end)
    u13.BeginProjectileTargeting:setPriority(u7.HIGHEST):connect(function(p108) --[[ Line: 429 ]]
        --[[
        Upvalues:
            [1] = u81
        --]]
        if u81.isChargingHowl then
            p108:setCancelled(true)
        end
    end)
    u13.PlaceBlock:setPriority(u7.HIGHEST):connect(function(p109) --[[ Line: 434 ]]
        --[[
        Upvalues:
            [1] = u81
        --]]
        if u81.isChargingHowl then
            p109:setCancelled(true)
        end
    end)
end
u6.CreateController(u33.new())
return nil