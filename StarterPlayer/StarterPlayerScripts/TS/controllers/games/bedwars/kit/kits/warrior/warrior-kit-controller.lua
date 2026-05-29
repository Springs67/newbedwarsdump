local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AbilityState
local u5 = v3.AnimationUtil
local u6 = v3.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Players
local u13 = v11.ReplicatedStorage
local u14 = v11.RunService
local u15 = v11.Workspace
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "warrior", "warrior-kit-util").WarriorUtil
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u31 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u32 = v1.import(script, script.Parent, "ui", "warrior-grit-bar").WarriorGritBar
local u33 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 38 ]]
        return "WarriorKitController"
    end,
    ["__index"] = u31
})
u33.__index = u33
function u33.new(...) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u33
    --]]
    local v34 = u33
    local v35 = setmetatable({}, v34)
    return v35:constructor(...) or v35
end
function u33.constructor(p36) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u31
        [2] = u24
    --]]
    u31.constructor(p36, u24.WARRIOR)
    p36.Name = "WarriorKitController"
    p36.bubbleEffectMaidMap = {}
end
function u33.KnitStart(p37) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u31
    --]]
    u31.KnitStart(p37)
end
function u33.onKitLocalActivated(u38, p39) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u20
        [3] = u29
        [4] = u2
        [5] = u10
        [6] = u32
        [7] = u18
        [8] = u19
        [9] = u26
        [10] = u12
        [11] = u27
        [12] = u4
        [13] = u17
        [14] = u22
    --]]
    u7.Controllers.PreloadController:runPreload({
        ["animations"] = { u20.JUGGERNAUT_SPIN, u20.JUGGERNAUT_SWING, u20.JUGGERNAUT_LEAP_ATTACK },
        ["sounds"] = {
            u29.JUGGERNAUT_SPIN,
            u29.JUGGERNAUT_GROUND_SMASH,
            u29.JUGGERNAUT_LEAP,
            u29.STOMPER_HIT
        }
    })
    p39:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u10.createFragment({
        ["WarriorGritBar"] = u10.createElement(u32)
    })))
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u18.WARRIOR_STRIKE, u19[u18.WARRIOR_STRIKE].triggerConfig)
    u38.abilityRef = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u18.WARRIOR_STRIKE)
    local v40 = u26.getInventory(u12.LocalPlayer).hand
    if v40 ~= nil then
        v40 = v40.itemType
    end
    if u38.abilityRef and not (v40 and u27(v40).sword) then
        u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u38.abilityRef, u4.DISABLED)
    end
    u17.changed:connect(function(p41, p42) --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u4
            [3] = u27
            [4] = u2
            [5] = u22
        --]]
        local v43 = p42.Inventory.observedInventory.inventory.hand
        if v43 ~= nil then
            v43 = v43.itemType
        end
        local v44 = p41.Inventory.observedInventory.inventory.hand
        if v44 ~= nil then
            v44 = v44.itemType
        end
        if v43 == v44 then
            return nil
        end
        local v45 = u38.abilityRef
        if v45 ~= nil then
            v45 = v45.abilityState
        end
        if v45 == u4.DISABLED then
            if v44 and u27(v44).sword then
                if u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(u22.WARROIR_STRIKE) > 0 then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u38.abilityRef, u4.ON_COOLDOWN)
                else
                    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u38.abilityRef, u4.READY)
                end
            end
        elseif u38.abilityRef and not (v44 and u27(v44).sword) then
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u38.abilityRef, u4.DISABLED)
        end
    end)
end
function u33.onKitLocalDeactivated(_) --[[ Line: 107 ]] end
function u33.onKitReplicationActivated(u46, p47) --[[ Line: 109 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u20
        [3] = u29
        [4] = u5
        [5] = u21
        [6] = u12
        [7] = u7
        [8] = u6
        [9] = u16
        [10] = u30
    --]]
    u28.Client:Get("WarriorStrike"):Connect(function(p48) --[[ Line: 110 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u29
            [3] = u46
            [4] = u5
            [5] = u21
            [6] = u12
            [7] = u7
            [8] = u6
        --]]
        local v49 = u20.JUGGERNAUT_SPIN
        local v50 = u20.JUGGERNAUT_SPIN_FP
        local v51 = u29.JUGGERNAUT_SPIN
        local u52 = p48.user.Character
        if u52 ~= nil then
            u52 = u52.PrimaryPart
            if u52 ~= nil then
                u52 = u52.Position
            end
        end
        local v53 = p48.strikeLevel
        if v53 == 1 then
            v49 = u20.JUGGERNAUT_SWING
            v50 = u20.NEW_SWORD_SWING_FP
            v51 = u29.JUGGERNAUT_GROUND_SMASH
            u46:strikeEffect(p48.user)
        elseif v53 == 2 then
            v49 = u20.JUGGERNAUT_LEAP_ATTACK
            v51 = u29.JUGGERNAUT_LEAP
            v50 = u20.JUGGERNAUT_LEAP_FP
            u46:fullGritStrikeEffect(p48.user)
        elseif v53 == 3 then
            v49 = u20.JUGGERNAUT_LEAP_ATTACK
            v50 = u20.JUGGERNAUT_LEAP_FP
            v51 = u29.JUGGERNAUT_LEAP
            u46:fullGritStrikeEffect(p48.user)
        elseif v53 == 0 then
            u46:spinEffect(p48.user)
        end
        u5:playAnimation(p48.user, u21:getAssetId(v49), {
            ["looped"] = false
        })
        if p48.user == u12.LocalPlayer then
            u5:playAnimation(p48.user, u21:getAssetId(v49), {
                ["looped"] = false
            })
            u7.Controllers.ViewmodelController:playAnimation(v50)
        end
        if u52 then
            u6:playSound(v51, {
                ["position"] = u52
            })
            if p48.strikeLevel > 1 then
                task.delay(0.7, function() --[[ Line: 165 ]]
                    --[[
                    Upvalues:
                        [1] = u6
                        [2] = u29
                        [3] = u52
                    --]]
                    local v54 = {
                        ["position"] = u52
                    }
                    u6:playSound(u29.STOMPER_HIT, v54)
                end)
            end
        end
    end)
    p47:GiveTask(u16.StatusEffectAdded:connect(function(p55) --[[ Line: 173 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u46
        --]]
        if p55.statusEffect == u30.WARRIOR_FINAL_STAND then
            u46:createBubble(p55.entityInstance)
        end
    end))
    p47:GiveTask(u16.StatusEffectRemoved:connect(function(p56) --[[ Line: 178 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u12
            [3] = u46
        --]]
        local v57 = p56.statusEffect == u30.WARRIOR_FINAL_STAND and u12:GetPlayerFromCharacter(p56.entityInstance)
        if v57 then
            local v58 = u46.bubbleEffectMaidMap[v57]
            if v58 ~= nil then
                v58:DoCleaning()
            end
            u46.bubbleEffectMaidMap[v57] = nil
        end
    end))
    u28.Client:Get("WarriorRevive"):Connect(function(p59) --[[ Line: 191 ]]
        --[[
        Upvalues:
            [1] = u46
        --]]
        u46:playReviveEffect(p59.player)
    end)
end
function u33.onKitReplicationDeactivated(_) --[[ Line: 195 ]] end
function u33.onInnateAbilityEnabled(_, _, _) --[[ Line: 197 ]] end
function u33.onAbilityUsed(_, _, _) --[[ Line: 199 ]] end
function u33.spinEffect(_, p60) --[[ Line: 201 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u13
        [3] = u15
        [4] = u14
    --]]
    local u61 = u8.new()
    local u62 = u13.Assets.Effects.JuggernautSpin:Clone()
    u62.Parent = u15
    local u63 = p60.Character
    if u63 ~= nil then
        u63 = u63.PrimaryPart
    end
    if not u63 then
        return nil
    end
    u61:GiveTask(u62)
    u61:GiveTask(u14.Heartbeat:Connect(function(_) --[[ Line: 214 ]]
        --[[
        Upvalues:
            [1] = u63
            [2] = u62
        --]]
        local v64 = u63.Position
        if v64 then
            u62.Position = v64
        end
    end))
    task.delay(0.5, function() --[[ Line: 220 ]]
        --[[
        Upvalues:
            [1] = u61
        --]]
        u61:DoCleaning()
    end)
end
function u33.strikeEffect(u65, u66) --[[ Line: 224 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u13
        [3] = u15
        [4] = u14
    --]]
    local u67 = u8.new()
    local u68 = u13.Assets.Effects.JuggernautSpin:Clone()
    u68.Parent = u15
    local u69 = u66.Character
    if u69 ~= nil then
        u69 = u69.PrimaryPart
    end
    if not u69 then
        return nil
    end
    task.delay(0.3, function() --[[ Line: 236 ]]
        --[[
        Upvalues:
            [1] = u65
            [2] = u66
        --]]
        u65:playSlashEffect(u66)
    end)
    u67:GiveTask(u68)
    u67:GiveTask(u14.Heartbeat:Connect(function(_) --[[ Line: 240 ]]
        --[[
        Upvalues:
            [1] = u69
            [2] = u68
        --]]
        local v70 = u69.CFrame
        if v70 then
            u68:PivotTo(v70 * CFrame.Angles(3.141592653589793, 0, 5.497787143782138))
        end
    end))
    task.delay(0.4, function() --[[ Line: 248 ]]
        --[[
        Upvalues:
            [1] = u67
        --]]
        u67:DoCleaning()
    end)
end
function u33.fullGritStrikeEffect(u71, u72) --[[ Line: 252 ]]
    task.delay(0.25, function() --[[ Line: 253 ]]
        --[[
        Upvalues:
            [1] = u71
            [2] = u72
        --]]
        u71:playSlashEffect(u72)
    end)
    task.delay(0.7, function() --[[ Line: 256 ]]
        --[[
        Upvalues:
            [1] = u71
            [2] = u72
        --]]
        u71:playParticleEffect(u72)
    end)
end
function u33.playSlashEffect(_, p73) --[[ Line: 260 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u15
    --]]
    local v74 = p73.Character
    if v74 ~= nil then
        v74 = v74.PrimaryPart
        if v74 ~= nil then
            v74 = v74.CFrame
        end
    end
    if not v74 then
        return nil
    end
    local u75 = u13.Assets.Effects.WarriorStrike:Clone()
    u75:PivotTo(v74)
    u75.Parent = u15
    u75:PivotTo(v74 * CFrame.new(0, 0, -6))
    task.delay(0.15, function() --[[ Line: 279 ]]
        --[[
        Upvalues:
            [1] = u75
        --]]
        u75:Destroy()
    end)
end
function u33.playParticleEffect(p76, p77) --[[ Line: 283 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u15
        [3] = u12
    --]]
    local v78 = p77.Character
    if v78 ~= nil then
        v78 = v78.PrimaryPart
        if v78 ~= nil then
            v78 = v78.CFrame
        end
    end
    local v79
    if v78 == nil then
        v79 = v78
    else
        v79 = v78.Position
    end
    if not (v79 and v78) then
        return nil
    end
    local v80 = v78.LookVector * 3
    local v81 = v79 + Vector3.new(0, -2, 0) + v80
    local u82 = u13.Assets.Effects.JuggernautStabGround:Clone()
    local u83 = u13.Assets.Effects.GroudCrack:Clone()
    u82.Position = v81
    u82.Parent = u15
    u83.Position = v81
    u83.Parent = u15
    local v84 = u12.LocalPlayer.Character
    if v84 ~= nil then
        v84 = v84.PrimaryPart
        if v84 ~= nil then
            v84 = v84.Position
        end
    end
    if v84 then
        v84 = (v84 - v81).Magnitude <= 20
    end
    if v84 then
        p76:shakeScreen(v81)
    end
    for v85, v86 in u82:GetDescendants() do
        local _ = v85 - 1
        if v86:IsA("ParticleEmitter") then
            v86:Emit(30)
        end
    end
    task.delay(1, function() --[[ Line: 336 ]]
        --[[
        Upvalues:
            [1] = u82
            [2] = u83
        --]]
        u82:Destroy()
        u83:Destroy()
    end)
end
function u33.shakeScreen(_, p87) --[[ Line: 341 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u7
    --]]
    local v88 = u12.LocalPlayer.Character
    if v88 ~= nil then
        v88 = v88:GetPrimaryPartCFrame()
    end
    if not v88 then
        return nil
    end
    u7.Controllers.ScreenShakeController:shake(p87, v88.LookVector, {
        ["magnitude"] = 5,
        ["cycles"] = 5,
        ["duration"] = 0.4
    })
end
function u33.createBubble(p89, p90) --[[ Line: 356 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u12
        [3] = u23
        [4] = u9
        [5] = u15
        [6] = u29
        [7] = u25
    --]]
    local v91 = p90.PrimaryPart
    local v92 = p90.PrimaryPart
    if v92 ~= nil then
        v92 = v92.Position
    end
    local u93 = u8.new()
    local u94 = u12:GetPlayerFromCharacter(p90)
    if not (v92 and (v91 and (u94 and u23:getEntity(p90)))) then
        return nil
    end
    p89.bubbleEffectMaidMap[u94] = u93
    local u95 = u9("Part", {
        ["Name"] = "FinalStandBubble",
        ["Size"] = Vector3.new(5, 5, 5),
        ["Anchored"] = false,
        ["CanCollide"] = false,
        ["CanQuery"] = false,
        ["CanTouch"] = false,
        ["Transparency"] = 0,
        ["Massless"] = true,
        ["CFrame"] = v91.CFrame,
        ["Material"] = Enum.Material.ForceField,
        ["Shape"] = Enum.PartType.Ball,
        ["Parent"] = u15,
        ["Color"] = Color3.fromRGB(255, 0, 0)
    })
    u95:SetAttribute("FirstPersonVisible", false)
    u9("WeldConstraint", {
        ["Part1"] = u95,
        ["Part0"] = v91,
        ["Parent"] = u95
    })
    u93:GiveTask(u95)
    local v96 = u9("Sound", {
        ["RollOffMinDistance"] = 20,
        ["RollOffMaxDistance"] = 40,
        ["Volume"] = 0.5,
        ["Playing"] = true,
        ["Looped"] = true,
        ["SoundId"] = u29.WARRIOR_FINAL_STAND_LOOP,
        ["Parent"] = u95
    })
    v96:Play()
    u93:GiveTask(v96)
    u94:GetAttributeChangedSignal(u25.GRIT_ATTRIBUTE):Connect(function() --[[ Line: 403 ]]
        --[[
        Upvalues:
            [1] = u95
            [2] = u94
            [3] = u25
        --]]
        u95.Transparency = 1 - u94:GetAttribute(u25.GRIT_ATTRIBUTE) / 50
    end)
    v91.Destroying:Connect(function() --[[ Line: 406 ]]
        --[[
        Upvalues:
            [1] = u93
        --]]
        u93:DoCleaning()
    end)
end
function u33.playReviveEffect(_, p97) --[[ Line: 410 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u13
        [3] = u15
        [4] = u6
        [5] = u29
        [6] = u14
    --]]
    local u98 = p97.Character
    if u98 ~= nil then
        u98 = u98.PrimaryPart
    end
    if not u98 then
        return nil
    end
    local u99 = u8.new()
    local u100 = u13.Assets.Effects.WarriorEffect:Clone()
    u99:GiveTask(u100)
    u100.Parent = u15
    u100.Position = u98.Position
    u6:playSound(u29.WARRIOR_FINAL_STAND_KILL, {
        ["position"] = u98.Position
    })
    for v101, v102 in u100:GetDescendants() do
        local _ = v101 - 1
        if v102:IsA("ParticleEmitter") then
            v102:Emit(30)
        end
    end
    u99:GiveTask(u14.Heartbeat:Connect(function() --[[ Line: 436 ]]
        --[[
        Upvalues:
            [1] = u98
            [2] = u100
        --]]
        local v103 = u98.Position
        if v103 then
            u100.Position = v103
        end
    end))
    task.delay(1, function() --[[ Line: 442 ]]
        --[[
        Upvalues:
            [1] = u99
        --]]
        u99:DoCleaning()
    end)
end
u7.CreateController(u33.new())
return nil