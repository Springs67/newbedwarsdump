local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AbilityState
local u5 = v3.GameQueryUtil
local u6 = v3.MobileTouchType
local u7 = v3.SoundManager
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src", "Knit", "KnitClient").Player
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutExpo
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u17 = v16.ContextActionService
local u18 = v16.Players
local u19 = v16.ReplicatedStorage
local u20 = v16.RunService
local u21 = v16.Workspace
local u22 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u23 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "infernal-shield-balance").InfernalShieldBalance
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "ability-indicator", "ability-indicator-util").AbilityIndicatorUtil
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil
local u36 = v1.import(script, script.Parent, "shield-energy-component").ShieldEnergyComponent
local u37 = v1.import(script, script.Parent, "shield-ult-charge-component").ShieldUltChargeComponent
local u38 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 43 ]]
        return "InfernalShieldController"
    end,
    ["__index"] = u23
})
u38.__index = u38
function u38.new(...) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u38
    --]]
    local v39 = u38
    local v40 = setmetatable({}, v39)
    return v40:constructor(...) or v40
end
function u38.constructor(p41) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u21
        [3] = u33
        [4] = u12
    --]]
    u23.constructor(p41)
    p41.Name = "InfernalShieldController"
    p41.camera = u21.CurrentCamera
    p41.infernalShieldState = u33.Client:Get("UseInfernalShield")
    p41.maid = u12.new()
    p41.raisedMaid = u12.new()
    p41.lastShieldRaised = 0
    p41.uiMaid = u12.new()
    p41.targetMarked = false
    p41.indicatorShown = false
    p41.launchMaid = u12.new()
    p41.effectMaids = {}
    p41.initializedEnergyBar = false
end
function u38.KnitStart(u42) --[[ Line: 68 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u21
        [3] = u33
        [4] = u7
        [5] = u34
        [6] = u18
        [7] = u22
        [8] = u24
        [9] = u9
        [10] = u2
        [11] = u27
        [12] = u4
        [13] = u32
        [14] = u8
        [15] = u30
    --]]
    u23.KnitStart(u42)
    u42.camera = u21.CurrentCamera
    u33.Client:OnEvent("ReflectProjectileEffects", function(p43) --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        u42:playEffects(p43.player)
    end)
    u33.Client:OnEvent("ProjectileDeflected", function(p44) --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u34
            [3] = u18
        --]]
        local v45 = u7
        local v46 = u34.SHIELD_BLOCKED
        local v47 = {}
        local v48
        if p44.deflector == u18.LocalPlayer then
            v48 = nil
        else
            v48 = p44.position
        end
        v47.position = v48
        v45:playSound(v46, v47)
    end)
    u22.AbilityUsed:connect(function(p49) --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u24
            [3] = u42
        --]]
        if p49.userCharacter ~= u18.LocalPlayer.Character then
            return nil
        end
        if p49.ability == u24.ACTIVE_SHIELDER_INDICATOR then
            if u42.indicator then
                local v50 = u18.LocalPlayer.Character
                if v50 ~= nil then
                    v50:SetAttribute("Transparency", 0)
                end
                u42:setIndicatorTransparency(1)
                u42:useUlt()
                u42:disableIndicator(true)
            else
                u42:activateIndicator()
            end
        end
        if p49.ability == u24.SHIELDER_ULT then
            local v51 = u18.LocalPlayer.Character
            if v51 ~= nil then
                v51:SetAttribute("Transparency", 0)
            end
            u42:setIndicatorTransparency(1)
            u42:useUlt()
            u42:disableIndicator(true)
        end
    end)
    u18.LocalPlayer:GetAttributeChangedSignal("InfernalShieldUltCharge"):Connect(function() --[[ Line: 106 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u2
            [3] = u24
            [4] = u27
            [5] = u4
        --]]
        local v52 = u9:GetAttribute("InfernalShieldUltCharge")
        local v53 = v52 == nil and 0 or v52
        local v54 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u24.ACTIVE_SHIELDER_INDICATOR)
        if v54 then
            if v53 < u27.SHIELD_ULT_CHARGE_REQ then
                u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v54, u4.DISABLED)
            else
                u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v54, u4.READY)
            end
        else
            return nil
        end
    end)
    u22.MatchStateChange:connect(function(p55) --[[ Line: 122 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u18
            [3] = u8
            [4] = u30
        --]]
        if p55.matchState == u32.RUNNING then
            for _, v56 in u18:GetPlayers() do
                local v57 = v56.Character
                if v57 then
                    local v58 = u30[u8.Controllers.KitSkinController:getKitSkin(v57)]
                    local v59 = v58.shielder
                    if v59 ~= nil then
                        v59 = v59.sound
                    end
                    if v59 then
                        local v60 = u8.Controllers.PreloadController
                        local v61 = {}
                        local v62 = v58.shielder
                        if v62 ~= nil then
                            v62 = v62.sound.landingSound
                        end
                        local v63 = v58.shielder
                        if v63 ~= nil then
                            v63 = v63.sound.launchSound
                        end
                        local v64 = v58.shielder
                        if v64 ~= nil then
                            v64 = v64.sound.leapSound
                        end
                        v61.sounds = { v62, v63, v64 }
                        v60:runPreload(v61)
                        return
                    end
                end
            end
        end
    end)
end
function u38.isRelevantItem(_, p65) --[[ Line: 159 ]]
    --[[
    Upvalues:
        [1] = u31
    --]]
    return p65.itemType == u31.INFERNAL_SHIELD
end
function u38.onEnable(p66, _) --[[ Line: 162 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u24
        [3] = u9
        [4] = u27
        [5] = u4
        [6] = u14
        [7] = u36
        [8] = u18
    --]]
    p66:raiseShield()
    p66.uiMaid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u24.ACTIVE_SHIELDER_INDICATOR, {
        ["abilityType"] = "ItemPrimary",
        ["abilityButton"] = {
            ["icon"] = "rbxassetid://7051149149"
        }
    }):expect())
    local v67 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u24.ACTIVE_SHIELDER_INDICATOR)
    local v68 = u9:GetAttribute("InfernalShieldUltCharge")
    if (v68 == nil and 0 or v68) < u27.SHIELD_ULT_CHARGE_REQ and v67 then
        u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v67, u4.DISABLED)
    end
    if not p66.initializedEnergyBar then
        u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u14.createElement(u36, {
            ["player"] = u18.LocalPlayer
        }))
        p66.initializedEnergyBar = true
    end
end
function u38.onDisable(p69) --[[ Line: 187 ]]
    p69:lowerShield()
    p69.maid:DoCleaning()
    p69:disableIndicator()
end
function u38.raiseShield(u70) --[[ Line: 192 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u26
        [3] = u25
        [4] = u18
        [5] = u8
        [6] = u2
        [7] = u14
        [8] = u37
    --]]
    if os.clock() - u70.lastShieldRaised < 0.2 then
        return nil
    end
    u70.lastShieldRaised = os.clock()
    u70.infernalShieldState:SendToServer({
        ["raised"] = true
    })
    u70.raisedMaid:GiveTask(function() --[[ Line: 200 ]]
        --[[
        Upvalues:
            [1] = u70
        --]]
        u70.infernalShieldState:SendToServer({
            ["raised"] = false
        })
    end)
    local v71 = u13("Animation", {
        ["AnimationId"] = u26:getAssetId(u25.KNIGHT_SHIELD_RAISE_SHIELD)
    })
    local v72 = u18.LocalPlayer.Character
    if v72 ~= nil then
        v72 = v72:FindFirstChild("Humanoid")
    end
    local v73
    if v72 == nil then
        v73 = v72
    else
        v73 = v72:FindFirstChild("Animator")
    end
    if v72 and v73 then
        local u74 = v73:LoadAnimation(v71)
        u74.Looped = true
        u74:Play()
        u70.raisedMaid:GiveTask(function() --[[ Line: 222 ]]
            --[[
            Upvalues:
                [1] = u74
            --]]
            u74:Stop()
            u74:Destroy()
        end)
        local u75 = u8.Controllers.ViewmodelController:playAnimation(u25.FP_SHIELD_USE, {
            ["looped"] = true
        })
        u70.raisedMaid:GiveTask(function() --[[ Line: 229 ]]
            --[[
            Upvalues:
                [1] = u75
            --]]
            local v76 = u75
            if v76 ~= nil then
                v76:Stop()
            end
        end)
        u70.uiMaid:DoCleaning()
        u70.uiMaid = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u14.createElement(u37, {
            ["player"] = u18.LocalPlayer
        }))
    end
end
function u38.lowerShield(p77) --[[ Line: 241 ]]
    p77.raisedMaid:DoCleaning()
    p77.uiMaid:DoCleaning()
end
function u38.playEffects(u78, p79) --[[ Line: 245 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u12
        [3] = u19
        [4] = u15
        [5] = u21
        [6] = u5
        [7] = u35
        [8] = u10
        [9] = u20
        [10] = u11
    --]]
    local u80 = u28:getEntity(p79)
    if u80 == nil then
        return nil
    end
    local u81 = u12.new()
    local v82 = u78.effectMaids[p79]
    if v82 ~= nil then
        v82:DoCleaning()
    end
    u78.effectMaids[p79] = u81
    local u83 = u19.Assets.Effects.InfernalShields:Clone()
    u78:changeShielderColor(p79, u83)
    u83:PivotTo(u80:getInstance():GetPivot())
    u15(u83, 0.06)
    u83.Parent = u21
    for _, v84 in u83:GetChildren() do
        if v84:IsA("BasePart") then
            u5:setQueryIgnored(v84, true)
        end
    end
    u35.tweenModelSize(u83, 0, u10, 10)
    local u85 = 0
    local u90 = u20.Heartbeat:Connect(function(p86) --[[ Line: 272 ]]
        --[[
        Upvalues:
            [1] = u80
            [2] = u85
            [3] = u83
            [4] = u78
            [5] = u81
            [6] = u11
        --]]
        local v87 = u80:getInstance():GetPivot()
        local v88 = CFrame.new(v87.Position)
        local v89 = CFrame.Angles(0, u85 * 0.8, 0)
        u83.Shields.CFrame = (v88 + Vector3.new(0, -0.25, 0)) * v89
        if not u78:validPlayerConditions(u80) then
            u81:DoCleaning()
            return nil
        end
        u85 = u85 + p86
        if u83.PrimaryPart == nil then
            u11.Error("Shield effect has no primary part")
            return nil
        end
    end)
    u81:GiveTask(function() --[[ Line: 288 ]]
        --[[
        Upvalues:
            [1] = u90
            [2] = u83
        --]]
        u90:Disconnect()
        u83:Destroy()
    end)
end
function u38.validPlayerConditions(_, p91) --[[ Line: 293 ]]
    --[[
    Upvalues:
        [1] = u31
    --]]
    if not p91:isAlive() then
        return false
    end
    if p91:getInstance():GetAttribute("InfernalShieldRaised") ~= true then
        return false
    end
    local v92 = p91:getItemInHand()
    if v92 ~= nil then
        v92 = v92.Name
    end
    if v92 ~= u31.INFERNAL_SHIELD then
        return false
    end
    if p91:getInstance().PrimaryPart == nil then
        return false
    end
    local v93 = p91:getPlayer()
    if v93 ~= nil then
        v93 = v93:GetAttribute("InfernalShieldEnergy")
    end
    return v93 == nil or v93 > 0
end
function u38.activateIndicator(u94) --[[ Line: 320 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u19
        [3] = u21
        [4] = u2
        [5] = u24
        [6] = u6
        [7] = u20
        [8] = u29
        [9] = u27
    --]]
    local v95 = u18.LocalPlayer.Character
    if v95 ~= nil then
        v95:SetAttribute("Transparency", 0.9)
    end
    if u94.indicator then
        return nil
    end
    u94.indicator = u19.Assets.Misc.ShieldIndicator:Clone()
    u94:changeIndicatorColor(u18.LocalPlayer, u94.indicator)
    u94.indicator.Parent = u21
    local v96 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController")
    local v97 = {
        ["action"] = "Attack",
        ["actionId"] = "Shield Ult",
        ["boundFunction"] = function(_, _, _) --[[ Name: boundFunction, Line 335 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u24
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u24.SHIELDER_ULT)
        end,
        ["mobile"] = {
            ["touchType"] = u6.TouchTap,
            ["mobileBoundFunction"] = function() --[[ Name: mobileBoundFunction, Line 340 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u24
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u24.SHIELDER_ULT)
            end
        }
    }
    local v98 = v96:bindAction(v97)
    u94.maid:GiveTask(v98)
    local u99 = nil
    u99 = u20.Heartbeat:Connect(function() --[[ Line: 347 ]]
        --[[
        Upvalues:
            [1] = u94
            [2] = u99
            [3] = u18
            [4] = u29
            [5] = u27
        --]]
        if u94.camera then
            if u94.indicator then
                local v100 = u18.LocalPlayer.Character
                if v100 ~= nil then
                    v100 = v100.PrimaryPart
                    if v100 ~= nil then
                        v100 = v100.Position
                    end
                end
                local v101 = u29:calculateBlockTargetPoint(u94.camera.CFrame.Position, u94.camera.CFrame.LookVector.Unit, u27.SHIELD_ULT_RANGE, v100)
                if v101 then
                    local v102 = u94.camera.CFrame.Position.X
                    local v103 = v101.Y
                    local v104 = u94.camera.CFrame.Position.Z
                    local v105 = Vector3.new(v102, v103, v104)
                    u94.indicator:PivotTo(CFrame.lookAt(v101, v105) * CFrame.Angles(0, 3.141592653589793, 0))
                    if not u94.indicatorShown then
                        u94:setIndicatorTransparency(0)
                        u94.indicatorShown = true
                    end
                    u94.targetMarked = true
                else
                    if u94.indicatorShown then
                        u94:setIndicatorTransparency(1)
                        u94.indicatorShown = false
                    end
                    u94.targetMarked = false
                end
            else
                u99:Disconnect()
                return nil
            end
        else
            return nil
        end
    end)
end
function u38.disableIndicator(p106, p107) --[[ Line: 384 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u18
    --]]
    local v108 = p106.indicator
    if v108 ~= nil then
        v108:Destroy()
    end
    p106.launchMaid:DoCleaning()
    p106.indicator = nil
    u17:UnbindAction("Shield Ult")
    if p107 then
        return nil
    end
    local v109 = u18.LocalPlayer.Character
    if v109 ~= nil then
        v109:SetAttribute("Transparency", 0)
    end
end
function u38.useUlt(p110) --[[ Line: 400 ]]
    --[[
    Upvalues:
        [1] = u33
    --]]
    if p110.targetMarked and p110.indicator then
        return u33.Client:Get("ShieldUlt"):CallServer({
            ["target"] = p110.indicator.Position
        })
    else
        return false
    end
end
function u38.setIndicatorTransparency(p111, p112) --[[ Line: 409 ]]
    if not p111.indicator then
        return nil
    end
    for v113, v114 in p111.indicator:GetChildren() do
        local _ = v113 - 1
        if v114:IsA("Part") or (v114:IsA("MeshPart") or v114:IsA("UnionOperation")) then
            v114.Transparency = p112
        end
    end
end
function u38.getKitSkinMeta(_, p115) --[[ Line: 423 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u30
    --]]
    local v116 = p115.Character
    if v116 then
        return u30[u8.Controllers.KitSkinController:getKitSkin(v116)]
    else
        return nil
    end
end
function u38.changeShielderColor(p117, p118, p119) --[[ Line: 432 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    if p118.Team ~= u18.LocalPlayer.Team then
        return nil
    end
    local v120 = p117:getKitSkinMeta(p118)
    if not v120 then
        return nil
    end
    local v121 = v120.shielder
    if v121 ~= nil then
        v121 = v121.effectColor
    end
    if v121 then
        for v122, v123 in p119:GetDescendants() do
            local _ = v122 - 1
            if v123:IsA("MeshPart") then
                v123.Color = v121
            end
            if v123:IsA("ImageLabel") then
                v123.ImageColor3 = v121
            end
        end
    end
end
function u38.changeIndicatorColor(p124, p125, p126) --[[ Line: 460 ]]
    local v127 = p124:getKitSkinMeta(p125)
    if not v127 then
        return nil
    end
    local v128
    if v127 == nil then
        v128 = v127
    else
        v128 = v127.shielder
    end
    if v128 then
        local v129 = v127.shielder.bubbleColor
        local v130 = v127.shielder.effectColor
        if v129 then
            p126:WaitForChild("DragonSymbol", 1).Color = v129
        end
        if v130 then
            p126:WaitForChild("Inner", 1).Color = v130
        end
    end
end
u8.CreateController(u38.new())
return nil