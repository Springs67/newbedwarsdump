local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutQuad
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.ContextActionService
local u14 = v12.Players
local u15 = v12.ReplicatedStorage
local u16 = v12.TweenService
local u17 = v12.Workspace
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit", "oasis", "oasis-constants")
local u28 = v27.OasisBalance
local u29 = v27.OasisTargetIndicator
local u30 = v27.OasisVesselMode
local u31 = v27.OasisVesselScaling
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local v36 = v1.import(script, script.Parent.Parent.Parent, "target-selector", "target-selector-util")
local u37 = v36.TargetSelector
local u38 = v36.TargetType
local u39 = v1.import(script, script.Parent, "ui", "oasis-vessel-indicator-ui").OasisVesselModeUi
local u40 = {
    u33.OASIS_HEAL_PROJECTILE_1,
    u33.OASIS_HEAL_PROJECTILE_2,
    u33.OASIS_HEAL_PROJECTILE_3,
    u33.OASIS_HEAL_PROJECTILE_4
}
local u41 = {
    u33.OASIS_HEAL_PROJECTILE_1,
    u33.OASIS_HEAL_PROJECTILE_2,
    u33.OASIS_HEAL_PROJECTILE_3,
    u33.OASIS_HEAL_PROJECTILE_4
}
local u42 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 48 ]]
        return "OasisVesselController"
    end,
    ["__index"] = u20
})
u42.__index = u42
function u42.new(...) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u42
    --]]
    local v43 = u42
    local v44 = setmetatable({}, v43)
    return v44:constructor(...) or v44
end
function u42.constructor(p45) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u10
        [3] = u30
        [4] = u32
    --]]
    u20.constructor(p45)
    p45.Name = "OasisVesselController"
    p45.maid = u10.new()
    p45.vesselMode = u30.HEAL
    p45.enabledAbility = nil
    p45.handItemModel = nil
    p45.viewmodelHandItemModel = nil
    p45.attemptFireProjectilesRemote = u32.Client:Get("AttemptFireOasisProjectiles")
    p45.projectilesFiredEvent = u32.Client:Get("OasisProjectileFired")
    p45.projectileLoopMaid = u10.new()
    p45.modeTree = nil
    p45.settingUpStackTree = false
    p45.lastFire = 0
end
function u42.KnitStart(u46) --[[ Line: 73 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u19
        [3] = u14
        [4] = u21
        [5] = u30
        [6] = u37
    --]]
    u20.KnitStart(u46)
    u19.AbilityUsed:connect(function(p47) --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u21
            [3] = u46
            [4] = u30
        --]]
        if p47:isCancelled() then
            return nil
        end
        if p47.userCharacter ~= u14.LocalPlayer.Character then
            return nil
        end
        if p47.ability ~= u21.OASIS_SWAP_STAFF then
            return nil
        end
        local v48
        if u46.vesselMode == u30.HEAL then
            v48 = u30.BUFF
        else
            v48 = u30.HEAL
        end
        u46:setState(v48)
    end)
    u19.AbilityUsed:connect(function(p49) --[[ Line: 88 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u46
        --]]
        if p49:isCancelled() then
            return nil
        end
        if p49.userCharacter ~= u14.LocalPlayer.Character then
            return nil
        end
        if not u46:isOrbAbility(p49.ability) then
            return nil
        end
        u46:attemptFireProjectile(false)
    end)
    u19.CanUseLocalAbility:connect(function(p50) --[[ Line: 100 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u46
            [3] = u37
        --]]
        if p50:isCancelled() then
            return nil
        end
        if p50.userCharacter ~= u14.LocalPlayer.Character then
            return nil
        end
        if not u46:isOrbAbility(p50.ability) then
            return nil
        end
        if not u37:getTargetEntity() then
            p50:setCancelled(true)
            return nil
        end
    end)
    u19.AbilityInputStateChanged:connect(function(p51) --[[ Line: 115 ]]
        --[[
        Upvalues:
            [1] = u46
        --]]
        if u46:isOrbAbility(p51.ability.abilityId) then
            local v52 = p51.inputState
            if v52 == Enum.UserInputState.Begin then
                u46:beginProjectileFireLoop()
                return
            elseif v52 == Enum.UserInputState.End then
                u46:endProjectileFireLoop()
            end
        else
            return nil
        end
    end)
    u46.projectilesFiredEvent:Connect(function(p53, p54, p55, p56) --[[ Line: 133 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u46
        --]]
        local v57 = u14:GetPlayerByUserId(p53)
        local v58 = u14:GetPlayerByUserId(p54)
        if not (v57 and v58) then
            return nil
        end
        u46:createProjectilesEffect(v57, v58, p55, p56)
    end)
end
function u42.beginProjectileFireLoop(u59) --[[ Line: 142 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u19
        [3] = u28
    --]]
    u59.projectileLoopMaid:DoCleaning()
    local v60 = u10.new()
    u59.projectileLoopMaid = v60
    local u61 = 0
    local u62 = u19.AbilityCooldownModifierCheck:fire(u28.ProjectileCooldown).cooldown
    v60:GiveTask(task.spawn(function() --[[ Line: 148 ]]
        --[[
        Upvalues:
            [1] = u61
            [2] = u59
            [3] = u62
        --]]
        while true do
            u61 = os.clock()
            u59:attemptFireProjectile(true)
            task.wait(u62)
        end
    end))
end
function u42.endProjectileFireLoop(p63) --[[ Line: 156 ]]
    p63.projectileLoopMaid:DoCleaning()
end
function u42.isOrbAbility(_, p64) --[[ Line: 159 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    return p64 == u21.OASIS_HEAL_PROJECTILE and true or p64 == u21.OASIS_BUFF_PROJECTILE
end
function u42.setState(p65, p66) --[[ Line: 162 ]]
    --[[
    Upvalues:
        [1] = u30
    --]]
    p65.vesselMode = p66
    if p65.vesselMode == u30.HEAL then
        p65:enableHealAbility()
    else
        p65:enableBuffAbility()
    end
    p65:swapHandItemColorScheme()
    p65:swapTargetIndicator()
    p65:updateTree()
end
function u42.swapTargetIndicator(p67) --[[ Line: 177 ]]
    --[[
    Upvalues:
        [1] = u37
        [2] = u29
    --]]
    local v68 = u37:getBillboard()
    if not v68 then
        return nil
    end
    local v69 = u29[p67.vesselMode]
    u37:setTargetIcon(v69.Icon)
    v68.ImageLabel.Size = v69.ImageSize
    local v70 = v68:WaitForChild("TextLabel", 3)
    if v70 then
        v70.Size = v69.TextLabelSize
    end
end
function u42.swapHandItemColorScheme(p71) --[[ Line: 192 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u28
        [3] = u16
    --]]
    local u72
    if p71.vesselMode == u30.HEAL then
        u72 = u28.HealingColor
    else
        u72 = u28.DamageBuffColor
    end
    if p71.handItemModel then
        local u73 = p71.handItemModel.Light
        task.spawn(function() --[[ Line: 195 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u73
                [3] = u72
            --]]
            local v74 = {
                ["Color"] = u72
            }
            u16:Create(u73, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), v74):Play()
        end)
        if p71.handItemModel.Beads then
            local u75 = p71.handItemModel.Beads
            task.spawn(function() --[[ Line: 195 ]]
                --[[
                Upvalues:
                    [1] = u16
                    [2] = u75
                    [3] = u72
                --]]
                local v76 = {
                    ["Color"] = u72
                }
                u16:Create(u75, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), v76):Play()
            end)
        end
    end
    if p71.viewmodelHandItemModel then
        local u77 = p71.viewmodelHandItemModel.Light
        task.spawn(function() --[[ Line: 195 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u77
                [3] = u72
            --]]
            local v78 = {
                ["Color"] = u72
            }
            u16:Create(u77, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), v78):Play()
        end)
        if p71.viewmodelHandItemModel.Beads then
            local u79 = p71.viewmodelHandItemModel.Beads
            task.spawn(function() --[[ Line: 195 ]]
                --[[
                Upvalues:
                    [1] = u16
                    [2] = u79
                    [3] = u72
                --]]
                local v80 = {
                    ["Color"] = u72
                }
                u16:Create(u79, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), v80):Play()
            end)
        end
    end
end
function u42.createProjectilesEffect(_, p81, u82, u83, p84) --[[ Line: 214 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u23
        [3] = u22
        [4] = u14
        [5] = u7
        [6] = u31
        [7] = u30
        [8] = u15
        [9] = u17
        [10] = u28
        [11] = u18
        [12] = u9
        [13] = u40
        [14] = u41
        [15] = u5
    --]]
    local u85 = p81.Character
    if u85 ~= nil then
        u85 = u85:GetPivot()
    end
    if not u85 then
        return nil
    end
    u4:playAnimation(p81, u23:getAssetId(u22.PUNCH))
    if p81 == u14.LocalPlayer then
        u7.Controllers.ViewmodelController:playAnimation(u22.FP_USE_ITEM)
    end
    local v86 = u31[p84].numberOrbs
    local u87 = 0
    local v88 = false
    while true do
        if v88 then
            u87 = u87 + 1
        else
            v88 = true
        end
        if u87 >= v86 then
            return
        end
        local u89
        if u83 == u30.HEAL then
            u89 = u15.Assets.Effects.OasisHealProjectile:Clone()
        else
            u89 = u15.Assets.Effects.OasisBuffProjectile:Clone()
        end
        u89.Parent = u17
        u89:PivotTo(u85)
        local v90 = math.random(-2, 2)
        local v91 = math.random(3, 4)
        local v92 = math.random
        local u93 = Vector3.new(v90, v91, v92(-2, 2))
        task.spawn(function() --[[ Line: 245 ]]
            --[[
            Upvalues:
                [1] = u87
                [2] = u28
                [3] = u18
                [4] = u9
                [5] = u82
                [6] = u85
                [7] = u93
                [8] = u89
                [9] = u83
                [10] = u30
                [11] = u40
                [12] = u41
                [13] = u5
            --]]
            task.wait(u87 * u28.ProjectileInterval)
            u18(u28.ProjectileTravelTime, u9, function(p94) --[[ Line: 247 ]]
                --[[
                Upvalues:
                    [1] = u82
                    [2] = u85
                    [3] = u93
                    [4] = u89
                --]]
                local v95 = u82.Character
                if v95 ~= nil then
                    v95 = v95:GetPivot()
                end
                if not v95 then
                    return nil
                end
                local v96 = p94 * 3.141592653589793
                local v97 = math.sin(v96)
                u89:PivotTo((u85:Lerp(v95, p94) + u93 * Vector3.new(v97, v97, v97)) * CFrame.Angles(6.283185307179586 * (p94 % 2), 6.283185307179586 * (p94 % 3), 6.283185307179586 * (p94 % 1.5)))
            end, 0, 1):Wait()
            local v98
            if u83 == u30.HEAL then
                local v99 = u40
                local v100 = u87
                local v101 = #u40 - 1
                v98 = v99[math.min(v100, v101) + 1]
            else
                local v102 = u41
                local v103 = u87
                local v104 = #u41 - 1
                v98 = v102[math.min(v103, v104) + 1]
            end
            local v105 = u5
            local v106 = {}
            local v107 = u82.Character
            if v107 ~= nil then
                v107 = v107:GetPivot().Position
            end
            v106.position = v107
            v105:playSound(v98, v106)
            for v108, v109 in u89:GetDescendants() do
                local _ = v108 - 1
                if v109:IsA("BasePart") then
                    v109.Transparency = 1
                elseif v109:IsA("ParticleEmitter") then
                    v109.Enabled = false
                end
            end
            task.delay(2, function() --[[ Line: 287 ]]
                --[[
                Upvalues:
                    [1] = u89
                --]]
                u89:Destroy()
            end)
        end)
    end
end
function u42.attemptFireProjectile(p110, u111) --[[ Line: 295 ]]
    --[[
    Upvalues:
        [1] = u37
        [2] = u19
        [3] = u28
        [4] = u5
        [5] = u33
    --]]
    local v112 = u37:getTargetEntity()
    if not v112 then
        return nil
    end
    local v113 = v112:getPlayer()
    if v113 ~= nil then
        v113 = v113.UserId
    end
    if v113 == 0 or (v113 ~= v113 or not v113) then
        return nil
    end
    local v114 = u19.AbilityCooldownModifierCheck:fire(u28.ProjectileCooldown).cooldown
    if os.clock() - p110.lastFire <= v114 * 0.99 then
        return nil
    end
    p110.lastFire = os.clock()
    p110.attemptFireProjectilesRemote:CallServerAsync(v113, p110.vesselMode):andThen(function(p115) --[[ Line: 314 ]]
        --[[
        Upvalues:
            [1] = u111
            [2] = u5
            [3] = u33
        --]]
        if not (p115 or u111) then
            u5:playSound(u33.OASIS_CANNOT_TARGET)
        end
    end)
end
function u42.isRelevantItem(_, p116) --[[ Line: 322 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    local v117 = u28.VesselItems
    local v118 = p116.itemType
    return table.find(v117, v118) ~= nil
end
function u42.onEnable(u119, u120, u121) --[[ Line: 327 ]]
    --[[
    Upvalues:
        [1] = u37
        [2] = u38
        [3] = u28
        [4] = u30
        [5] = u35
        [6] = u34
        [7] = u15
        [8] = u2
        [9] = u21
        [10] = u25
    --]]
    u37:enableTargetSelector(u38.TEAMMATES, {
        ["requireSight"] = true,
        ["positionDistanceOnly"] = true,
        ["overrideOriginDistance"] = 70,
        ["distance"] = u28.ProjectileRange,
        ["callback"] = function(p122) --[[ Name: callback, Line 333 ]]
            --[[
            Upvalues:
                [1] = u119
                [2] = u30
                [3] = u35
                [4] = u34
                [5] = u28
                [6] = u37
            --]]
            local v123
            if u119.vesselMode == u30.HEAL then
                v123 = p122:getHealthPercent() ~= 1
            else
                v123 = u35:getStacks(p122:getInstance(), u34.OASIS_BUFF_CHARGE) < u28.MaxBuffStacks
            end
            if v123 and u119.vesselMode == u30.BUFF then
                local v124 = u35
                local v125 = p122:getInstance()
                local v126 = u34.OASIS_BUFF_CHARGE
                local v127 = tostring(v124:getStacks(v125, v126))
                local v128 = u37:getBillboard()
                if v128 ~= nil then
                    v128 = v128:WaitForChild("TextLabel", 3)
                end
                if v128 then
                    v128.Text = v127
                end
            end
            return v123
        end
    })
    u37:setCustomBillboard((u15.Assets.Misc.TargetSelectorBillboard_Oasis:Clone()))
    local v129 = u119.maid
    local v130 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v131 = u21.OASIS_SWAP_STAFF
    local v132 = {
        ["abilityType"] = "ItemSecondary",
        ["abilityButton"] = {
            ["icon"] = u25.OASIS_SWAP
        }
    }
    v129:GiveTask(v130:enableAbility(v131, v132):expect())
    u119:setState(u119.vesselMode)
    u119.maid:GiveTask(function() --[[ Line: 360 ]]
        --[[
        Upvalues:
            [1] = u119
        --]]
        if u119.enabledAbility then
            u119.enabledAbility.Destroy()
        end
    end)
    task.delay(0.5, function() --[[ Line: 366 ]]
        --[[
        Upvalues:
            [1] = u121
            [2] = u119
            [3] = u120
        --]]
        if not u121() then
            return nil
        end
        u119:storeHandItem(u120.itemType)
    end)
    u119:setUpTree()
end
function u42.setUpTree(p133) --[[ Line: 375 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u11
        [3] = u39
    --]]
    if not (p133.modeTree or p133.settingUpStackTree) then
        p133.settingUpStackTree = true
        p133.modeTree = u7.Controllers.StatusInfoListController:waitForSetupAddElement(u11.createElement(u39, {
            ["mode"] = p133.vesselMode
        }))
    end
end
function u42.updateTree(p134) --[[ Line: 383 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u39
    --]]
    if p134.modeTree then
        u11.update(p134.modeTree, u11.createElement(u39, {
            ["mode"] = p134.vesselMode
        }))
    end
end
function u42.storeHandItem(u135, u136) --[[ Line: 390 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u14
        [3] = u26
        [4] = u8
    --]]
    task.spawn(function() --[[ Line: 391 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u14
            [3] = u135
            [4] = u26
        --]]
        local v137 = u24:getEntity(u14.LocalPlayer)
        if v137 ~= nil then
            v137 = v137:getHandItemInstanceFromCharacter()
        end
        if not v137 then
            return nil
        end
        local v138 = v137:WaitForChild("Handle", 3)
        if not v138 then
            return nil
        end
        local v139 = u135
        local v140 = {
            ["Light"] = v138:WaitForChild("Light", 3)
        }
        local v141
        if v137.Name == u26.OASIS_VESSEL_3 then
            v141 = v138:WaitForChild("Beads", 1)
        else
            v141 = nil
        end
        v140.Beads = v141
        v139.handItemModel = v140
        u135:swapHandItemColorScheme()
    end)
    task.spawn(function() --[[ Line: 410 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u136
            [3] = u135
            [4] = u26
        --]]
        local v142 = u8.Controllers.ViewmodelController:getViewModel()
        if v142 ~= nil then
            v142 = v142:FindFirstChild(u136)
        end
        if not v142 then
            return nil
        end
        local v143 = v142:WaitForChild("Handle", 3)
        if not v143 then
            return nil
        end
        local v144 = u135
        local v145 = {
            ["Light"] = v143:WaitForChild("Light", 3)
        }
        local v146
        if v142.Name == u26.OASIS_VESSEL_3 then
            v146 = v143:WaitForChild("Beads", 1)
        else
            v146 = nil
        end
        v145.Beads = v146
        v144.viewmodelHandItemModel = v145
        u135:swapHandItemColorScheme()
    end)
end
function u42.enableHealAbility(p147) --[[ Line: 430 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u21
        [3] = u5
        [4] = u33
    --]]
    local v148 = p147.enabledAbility
    if v148 ~= nil then
        v148.Destroy()
    end
    p147.enabledAbility = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u21.OASIS_HEAL_PROJECTILE, {
        ["clickToTrigger"] = true,
        ["abilityType"] = "ItemPrimary"
    }):expect()
    u5:playSound(u33.OASIS_SWAP_HEAL, {
        ["position"] = nil
    })
end
function u42.enableBuffAbility(p149) --[[ Line: 443 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u21
        [3] = u5
        [4] = u33
    --]]
    local v150 = p149.enabledAbility
    if v150 ~= nil then
        v150.Destroy()
    end
    p149.enabledAbility = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u21.OASIS_BUFF_PROJECTILE, {
        ["clickToTrigger"] = true,
        ["abilityType"] = "ItemPrimary"
    }):expect()
    u5:playSound(u33.OASIS_SWAP_BUFF, {
        ["position"] = nil
    })
end
function u42.onDisable(p151) --[[ Line: 456 ]]
    --[[
    Upvalues:
        [1] = u37
        [2] = u13
    --]]
    u37:disableTargetSelector()
    p151.maid:DoCleaning()
    u13:UnbindAction("OASIS-VESSEL")
end
u7.CreateController(u42.new())
return nil