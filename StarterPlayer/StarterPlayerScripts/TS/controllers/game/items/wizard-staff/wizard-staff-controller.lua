local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.DeviceUtil
local u6 = v3.getAbilityMeta
local u7 = v3.MobileButton
local u8 = v3.MobileTouchType
local u9 = v3.PressMode
local u10 = v3.SoundManager
local u11 = v3.WatchCharacter
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u13 = v12.KnitClient
local u14 = v12.KnitClient
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u18 = v17.ContextActionService
local u19 = v17.Players
local u20 = v17.ReplicatedStorage
local u21 = v17.RunService
local u22 = v17.Workspace
local u23 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u24 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u25 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "ability-indicator", "ability-indicator-util").AbilityIndicatorUtil
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "wizard", "wizard-util").WizardUtil
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u37 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u38 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound.WIZARD_LIGHTNING_STORM
local u39 = u20.Assets.Effects.StormCloud:Clone()
local u40 = Color3.fromRGB(4, 175, 236)
local u41 = Color3.fromRGB(219, 184, 0)
local u42 = Color3.fromRGB(219, 97, 99)
local u43 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 50 ]]
        return "WizardStaffController"
    end,
    ["__index"] = u24
})
u43.__index = u43
function u43.new(...) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u43
    --]]
    local v44 = u43
    local v45 = setmetatable({}, v44)
    return v45:constructor(...) or v45
end
function u43.constructor(p46) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u15
    --]]
    u24.constructor(p46)
    p46.Name = "WizardStaffController"
    p46.castAvailable = false
    p46.targetingMaid = u15.new()
    p46.itemMaid = u15.new()
    p46.shockwaveBound = false
end
function u43.KnitStart(u47) --[[ Line: 68 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u13
        [3] = u27
        [4] = u23
        [5] = u26
        [6] = u19
        [7] = u36
        [8] = u14
        [9] = u31
        [10] = u30
        [11] = u37
        [12] = u10
        [13] = u38
        [14] = u4
        [15] = u28
        [16] = u11
    --]]
    u24.KnitStart(u47)
    u13.Controllers.PreloadController:runPreload({
        ["animations"] = {
            u27.WIZARD_ABILITY_SWITCH,
            u27.WIZARD_LIGHTNING_CAST,
            u27.WIZARD_BALL_CAST,
            u27.WIZARD_LIGHTNING_STRIKE_CAST
        }
    })
    u23.CanUseLocalAbility:connect(function(p48) --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u47
        --]]
        local v49 = { u26.LIGHTNING_STRIKE, u26.LIGHTNING_STORM, u26.SHOCKWAVE }
        local v50 = p48.ability
        if table.find(v49, v50) == nil then
            return nil
        end
        if not u47:canCastAbility(p48.ability) then
            p48:setCancelled(true)
        end
    end)
    u19.LocalPlayer:GetAttributeChangedSignal("WizardAbility"):Connect(function() --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u47
            [2] = u19
            [3] = u26
        --]]
        u47.itemMaid:DoCleaning()
        local v51 = u19.LocalPlayer
        local v52 = v51:GetAttribute("WizardAbility")
        if v51 then
            if v52 == u26.LIGHTNING_STRIKE then
                u47:toggleStormIndicator(false)
                u47:activateIndicator(u26.LIGHTNING_STRIKE)
                u47:createShockwaveAction()
                return
            elseif v52 == u26.LIGHTNING_STORM then
                u47:disableIndicator(u26.LIGHTNING_STRIKE)
                u47:toggleStormIndicator(true)
                u47:createShockwaveAction()
                return
            elseif v52 == nil then
                u47.itemMaid:DoCleaning()
            end
        else
            return nil
        end
    end)
    u23.MatchStateChange:connect(function(p53) --[[ Line: 110 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u19
            [3] = u14
            [4] = u31
            [5] = u30
        --]]
        if p53.matchState ~= u36.RUNNING then
            return nil
        end
        for _, u54 in u19:GetPlayers() do
            task.spawn(function() --[[ Line: 115 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u54
                    [3] = u31
                    [4] = u30
                --]]
                if not u14.Controllers.KitController:isUsingKit(u54, u31.WIZARD) then
                    return nil
                end
                local v55 = u14.Controllers.KitController:getKitSkin(u54.Character)
                if not v55 then
                    return nil
                end
                if v55 == u30.EMERALD_VICTORIOUS_WIZARD or v55 == u30.NIGHTMARE_VICTORIOUS_WIZARD then
                    local v56 = u54.Character
                    if v56 ~= nil then
                        local v57 = v56:WaitForChild("HumanoidRootPart")
                        if v57 ~= nil then
                            local v58 = v57:WaitForChild("Summon")
                            if v58 ~= nil then
                                for v59, v60 in v58:GetChildren() do
                                    local _ = v59 - 1
                                    if v60:IsA("ParticleEmitter") then
                                        v60.Enabled = false
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)
    u37.Client:OnEvent("WizardLightningStorm", function(u61) --[[ Line: 147 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u14
            [3] = u30
            [4] = u10
            [5] = u38
            [6] = u13
        --]]
        local v62 = u61.target
        if not (v62 and u19.LocalPlayer.Character) then
            return nil
        end
        task.spawn(function() --[[ Line: 153 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u61
                [3] = u30
            --]]
            local v63 = u14.Controllers.KitController:getKitSkin(u61.caster.Character)
            if v63 == u30.EMERALD_VICTORIOUS_WIZARD or v63 == u30.NIGHTMARE_VICTORIOUS_WIZARD then
                local v64 = u61.caster.Character
                if v64 ~= nil then
                    local v65 = v64:WaitForChild("HumanoidRootPart")
                    if v65 ~= nil then
                        local v66 = v65:WaitForChild("Summon")
                        if v66 ~= nil then
                            for v67, u68 in v66:GetChildren() do
                                local _ = v67 - 1
                                if u68:IsA("ParticleEmitter") then
                                    u68.Enabled = true
                                    task.delay(2, function() --[[ Line: 167 ]]
                                        --[[
                                        Upvalues:
                                            [1] = u68
                                        --]]
                                        u68.Enabled = false
                                    end)
                                end
                            end
                        end
                    end
                end
            end
        end)
        u10:playSound(u38, {
            ["rollOffMaxDistance"] = 200,
            ["rollOffMinDistance"] = 35,
            ["volumeMultiplier"] = 0.7,
            ["position"] = v62
        })
        u13.Controllers.WizardLightningStrikeController:playStrikeImpactEffects(v62, u61.caster == u19.LocalPlayer, u61.caster)
    end)
    u23.AbilityUsed:connect(function(p69) --[[ Line: 190 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u26
            [3] = u4
            [4] = u28
            [5] = u27
        --]]
        local v70 = u19:GetPlayerFromCharacter(p69.userCharacter)
        if not v70 then
            return nil
        end
        if p69.ability == u26.SHOCKWAVE then
            local v71 = u4:playAnimation(v70, u28:getAssetId(u27.RAVEN_THROW))
            if v71 then
                v71:AdjustSpeed(2.5)
                return
            end
        elseif p69.ability == u26.LIGHTNING_STORM or p69.ability == u26.LIGHTNING_STRIKE then
            u4:playAnimation(v70, u28:getAssetId(u27.WIZARD_LIGHTNING_CAST))
        end
    end)
    u11(function(p72, u73) --[[ Line: 204 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u47
            [3] = u13
        --]]
        if p72 ~= u19.LocalPlayer then
            return nil
        end
        u73:GetAttributeChangedSignal("WizardCastSlow"):Connect(function() --[[ Line: 208 ]]
            --[[
            Upvalues:
                [1] = u73
                [2] = u47
                [3] = u13
            --]]
            if u73:GetAttribute("WizardCastSlow") == nil then
                local v74 = u47.speedMaid
                if v74 ~= nil then
                    v74:Destroy()
                end
                u47.speedMaid = nil
            else
                u47.speedMaid = u13.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    ["blockSprint"] = false,
                    ["moveSpeedMultiplier"] = u73:GetAttribute("WizardCastSlow")
                })
            end
        end)
    end)
end
function u43.createShockwaveAction(u75) --[[ Line: 224 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u26
    --]]
    if u75.shockwaveBound then
        return nil
    end
    local v78 = {
        ["action"] = "ItemSecondary",
        ["actionId"] = "shockwave",
        ["boundFunction"] = function(_, p76, p77) --[[ Name: boundFunction, Line 232 ]]
            --[[
            Upvalues:
                [1] = u75
                [2] = u2
                [3] = u26
            --]]
            if p76 == Enum.UserInputState.Cancel then
                return Enum.ContextActionResult.Pass
            end
            if not u75:isStaffInHand() then
                return nil
            end
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u26.SHOCKWAVE, p77, {
                ["target"] = Vector3.new()
            })
        end
    }
    local u79 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction(v78)
    u75.shockwaveBound = true
    u75.itemMaid:GiveTask(function() --[[ Line: 249 ]]
        --[[
        Upvalues:
            [1] = u79
            [2] = u75
        --]]
        u79:DoCleaning()
        u75.shockwaveBound = false
    end)
end
function u43.canCastAbility(_, p80) --[[ Line: 254 ]]
    --[[
    Upvalues:
        [1] = u34
        [2] = u19
        [3] = u32
        [4] = u6
        [5] = u2
    --]]
    local v81 = u34.getInventory(u19.LocalPlayer).hand
    if v81 ~= nil then
        v81 = v81.itemType
    end
    if not v81 then
        return false
    end
    if not u32:hasAbility(v81, p80) then
        return false
    end
    local v82 = u32:getManaId(v81)
    if v82 == nil then
        return false
    end
    local v83 = u6(v82).usableProgress
    if v83 ~= nil then
        v83 = v83.progressNeededPerUse
    end
    local v84 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getProgress(v82)
    if v83 == nil or v84 == nil then
        return false
    end
    local v85 = u32:getAbilityCost(p80)
    if v85 == nil then
        return false
    end
    if v84 < v83 * v85 then
        return false
    end
    local v86 = u6(p80)
    return not (v86.cooldown and u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(v86.cooldown.id))
end
function u43.toggleStormIndicator(u87, p88) --[[ Line: 295 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u22
        [3] = u18
        [4] = u2
        [5] = u26
        [6] = u8
    --]]
    local v89 = u87.wizardIndicator
    if v89 ~= nil then
        v89 = v89.Parent
    end
    if not v89 then
        u87.wizardIndicator = u20.Assets.Misc.WizardIndicator:Clone()
        u87.wizardIndicator.Parent = u22
    end
    if not p88 then
        local v90 = u87.wizardIndicator
        if v90 ~= nil then
            v90:Destroy()
        end
        u87.wizardIndicator = nil
        u18:UnbindAction("Lightning Storm")
        return nil
    end
    u18:UnbindAction("Lightning Strike")
    local v91 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController")
    local v98 = {
        ["action"] = "Attack",
        ["actionId"] = "Lightning Storm",
        ["boundFunction"] = function(_, p92, p93) --[[ Name: boundFunction, Line 318 ]]
            --[[
            Upvalues:
                [1] = u87
                [2] = u2
                [3] = u26
            --]]
            if p92 == Enum.UserInputState.Cancel then
                return Enum.ContextActionResult.Pass
            end
            if not u87.castAvailable then
                return Enum.ContextActionResult.Pass
            end
            if p93.UserInputType == Enum.UserInputType.Touch and p92 ~= Enum.UserInputState.End then
                return Enum.ContextActionResult.Pass
            end
            local v94 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
            local v95 = u26.LIGHTNING_STORM
            local v96 = {}
            local v97 = u87.wizardIndicator
            if v97 ~= nil then
                v97 = v97.Position
            end
            v96.target = v97
            v94:useAbility(v95, p93, v96)
        end,
        ["mobile"] = {
            ["touchType"] = u8.TouchBeginEnd
        }
    }
    local v99 = v91:bindAction(v98)
    u87.itemMaid:GiveTask(v99)
    u87:enableAbilityTargeting(u26.LIGHTNING_STORM)
end
function u43.enableAbilityTargeting(u100, u101) --[[ Line: 348 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u16
        [3] = u33
        [4] = u25
        [5] = u9
        [6] = u7
        [7] = u19
        [8] = u21
        [9] = u22
        [10] = u29
        [11] = u20
        [12] = u40
        [13] = u41
        [14] = u34
        [15] = u32
        [16] = u42
    --]]
    u100.targetingMaid:DoCleaning()
    u100.itemMaid:GiveTask(u100.targetingMaid)
    local v102 = u100.wizardIndicator
    if v102 ~= nil then
        v102 = v102.Parent
    end
    if v102 then
        u100.targetingMaid:GiveTask(u100.wizardIndicator)
    end
    local u103 = false
    if u5.isMobileControls() then
        local v104 = u16
        local v105 = {}
        local v106 = #v105
        local v107 = {
            ["Image"] = u33.BOW_MOBILE,
            ["Position"] = u25:getActionMobileButtonPosition() - UDim2.fromScale(0.08, 0),
            ["PressMode"] = u9.FREE_MOVING_HOLD,
            ["OnPressDown"] = function() --[[ Line: 386 ]]
                --[[
                Upvalues:
                    [1] = u103
                --]]
                u103 = true
            end,
            ["OnPressUp"] = function() --[[ Line: 389 ]]
                --[[
                Upvalues:
                    [1] = u103
                --]]
                u103 = false
            end
        }
        v105[v106 + 1] = u16.createElement(u7, v107)
        local u108 = v104.mount(u16.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, v105), u19.LocalPlayer:WaitForChild("PlayerGui"))
        u100.targetingMaid:GiveTask(function() --[[ Line: 394 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u108
            --]]
            return u16.unmount(u108)
        end)
    end
    u100.targetingMaid:GiveTask(u21.Heartbeat:Connect(function() --[[ Line: 398 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u100
            [3] = u5
            [4] = u103
            [5] = u22
            [6] = u29
            [7] = u20
            [8] = u40
            [9] = u101
            [10] = u41
            [11] = u34
            [12] = u32
            [13] = u42
        --]]
        local v109 = u19.LocalPlayer.Character
        if v109 ~= nil then
            v109 = v109:GetPivot().Position
        end
        if v109 then
            local v110 = u19.LocalPlayer:GetMouse().UnitRay
            local v111
            if u5.isMobileControls() and not u103 then
                v111 = nil
            else
                local v112 = u22.CurrentCamera
                if u103 and v112 then
                    local v113 = v112.ViewportSize / 2 - Vector2.new(0, game:GetService("GuiService"):GetGuiInset().Y / 2)
                    v110 = v112:ViewportPointToRay(v113.X, v113.Y).Unit
                end
                v111 = u29:calculatePlayerTargetPoint(u19.LocalPlayer, v110.Origin, v110.Direction, 300)
            end
            if v111 then
                local v114 = u100.wizardIndicator
                if v114 ~= nil then
                    v114 = v114.Parent
                end
                if not v114 then
                    u100.wizardIndicator = u20.Assets.Misc.WizardIndicator:Clone()
                    u100.wizardIndicator.Parent = u22
                    u100.targetingMaid:GiveTask(u100.wizardIndicator)
                end
                u100.wizardIndicator:PivotTo(CFrame.new(v111))
                u100.wizardIndicator.Position = v111
                u100.castAvailable = true
                local v115 = u40
                if not u100:canCastAbility(u101) then
                    v115 = u41
                end
                local v116 = u34.getInventory(u19.LocalPlayer).hand
                if v116 ~= nil then
                    v116 = v116.itemType
                end
                if (v111 - v109).Magnitude > u32:getCastRange(v116) then
                    v115 = u42
                    u100.castAvailable = false
                end
                for v117, v118 in u100.wizardIndicator:GetChildren() do
                    local _ = v117 - 1
                    if v118:IsA("BasePart") then
                        v118.Color = v115
                    end
                end
            else
                u100.castAvailable = false
                local v119 = u100.wizardIndicator
                if v119 ~= nil then
                    v119 = v119.Parent
                end
                if v119 then
                    local v120 = u100.wizardIndicator
                    if v120 ~= nil then
                        v120:Destroy()
                    end
                end
            end
        else
            u100.targetingMaid:DoCleaning()
            return nil
        end
    end))
end
function u43.activateIndicator(u121, u122) --[[ Line: 477 ]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u20
        [3] = u22
        [4] = u2
        [5] = u8
    --]]
    local v123 = "Lightning Strike"
    if u122 == u26.LIGHTNING_STRIKE then
        u121.wizardIndicator = u20.Assets.Misc.WizardIndicator:Clone()
    elseif u122 == u26.LIGHTNING_STORM then
        u121.wizardIndicator = u20.Assets.Misc.WizardIndicator:Clone()
        v123 = "Lightning Storm"
    end
    u121.wizardIndicator.Parent = u22
    local v124 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController")
    local v131 = {
        ["action"] = "Attack",
        ["actionId"] = v123,
        ["boundFunction"] = function(_, p125, p126) --[[ Name: boundFunction, Line 495 ]]
            --[[
            Upvalues:
                [1] = u121
                [2] = u2
                [3] = u122
            --]]
            if p125 == Enum.UserInputState.Cancel then
                return Enum.ContextActionResult.Pass
            end
            if not (u121.castAvailable and u121:isStaffInHand()) then
                return Enum.ContextActionResult.Pass
            end
            if p126.UserInputType == Enum.UserInputType.Touch and p125 ~= Enum.UserInputState.End then
                return Enum.ContextActionResult.Pass
            end
            local v127 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
            local v128 = u122
            local v129 = {}
            local v130 = u121.wizardIndicator
            if v130 ~= nil then
                v130 = v130.Position
            end
            v129.target = v130
            v127:useAbility(v128, p126, v129)
        end,
        ["mobile"] = {
            ["touchType"] = u8.TouchBeginEnd
        }
    }
    local v132 = v124:bindAction(v131)
    u121.itemMaid:GiveTask(v132)
    u121:enableAbilityTargeting(u26.LIGHTNING_STRIKE)
end
function u43.disableIndicator(p133, p134) --[[ Line: 525 ]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u18
    --]]
    local v135 = p133.wizardIndicator
    if v135 ~= nil then
        v135:Destroy()
    end
    p133.wizardIndicator = nil
    u18:UnbindAction((p134 == u26.LIGHTNING_STRIKE or p134 ~= u26.LIGHTNING_STORM) and "Lightning Strike" or "Lightning Storm")
end
function u43.isStaffInHand(_) --[[ Line: 543 ]]
    --[[
    Upvalues:
        [1] = u34
        [2] = u19
        [3] = u35
    --]]
    local v136 = u34.getInventory(u19.LocalPlayer).hand
    if not v136 then
        return false
    end
    local v137 = { u35.WIZARD_STAFF, u35.WIZARD_STAFF_2, u35.WIZARD_STAFF_3 }
    local v138 = v136.itemType
    return table.find(v137, v138) ~= nil
end
function u43.createStormCloud(_, p139, p140) --[[ Line: 552 ]]
    --[[
    Upvalues:
        [1] = u39
        [2] = u22
    --]]
    local v141 = math.random(9, 12)
    local v142 = false
    local v143 = 0
    while true do
        if v142 then
            v143 = v143 + 1
        else
            v142 = true
        end
        if v143 > v141 then
            return
        end
        local u144 = u39:Clone()
        local v145 = math.random(-20, 20)
        local v146 = math.random(25, 33)
        local v147 = math.random
        local v148 = p139 + Vector3.new(v145, v146, v147(-20, 20))
        local v149 = math.random(0, 259)
        local v150 = math.rad(v149)
        local v151 = CFrame.Angles(0, v150, 0)
        u144:PivotTo(CFrame.new(v148))
        local v152 = u144.PrimaryPart
        if v152 then
            u144:PivotTo(v152.CFrame * v151)
        end
        u144.Parent = u22
        task.delay(p140 + 1, function() --[[ Line: 578 ]]
            --[[
            Upvalues:
                [1] = u144
            --]]
            u144:Destroy()
        end)
    end
end
u13.CreateController(u43.new())
return nil