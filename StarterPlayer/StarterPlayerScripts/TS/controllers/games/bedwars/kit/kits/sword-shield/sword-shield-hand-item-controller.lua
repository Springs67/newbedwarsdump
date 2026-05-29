local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local v4 = v2.ConstantManager
local u5 = v2.SoundManager
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v7 = v6.KnitClient
local u8 = v6.KnitClient
local v9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u10 = v9.Linear
local u11 = v9.OutQuad
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v14 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.Debris
local u16 = v14.Players
local u17 = v14.TweenService
local u18 = v14.Workspace
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u20 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u21 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "sword-shield-kit-balance").SwordShieldKitBalance
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-melees").getPlayerBestBaseSword
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u28 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u29 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u30 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u31 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u32 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents
local u33 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u34 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u35 = v4.registerConstants(script, {
    ["velX"] = 5,
    ["velY"] = 9,
    ["velZ"] = 5,
    ["gravityDamage"] = 0.9,
    ["gravityHeal"] = 0.98,
    ["textSize"] = 28,
    ["blowUpCompleteDuration"] = 0.05,
    ["blowUpDuration"] = 0.125,
    ["blowUpSize"] = 76,
    ["anchoredDuration"] = 0.4,
    ["strokeThickness"] = 1.5
})
local u36 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 53 ]]
        return "SwordShieldController"
    end,
    ["__index"] = u21
})
u36.__index = u36
function u36.new(...) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u36
    --]]
    local v37 = u36
    local v38 = setmetatable({}, v37)
    return v38:constructor(...) or v38
end
function u36.constructor(p39) --[[ Line: 63 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u12
    --]]
    u21.constructor(p39)
    p39.Name = "SwordShieldController"
    p39.shieldCooldownList = {}
    p39.shieldMap = {}
    p39.animationMaid = u12.new()
end
function u36.KnitStart(u40) --[[ Line: 70 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u32
        [3] = u16
        [4] = u24
        [5] = u28
        [6] = u31
    --]]
    u21.KnitStart(u40)
    u32.HandItemRendered:connect(function(p41) --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u24
            [3] = u28
            [4] = u40
        --]]
        local v42 = u16:GetPlayerFromCharacter(p41.entity)
        if not v42 then
            return nil
        end
        local v43 = u24.SwordsToExclude
        local v44 = p41.itemType
        if table.find(v43, v44) ~= nil or not u28(p41.itemType).sword then
            u40:removeShield(v42)
            return nil
        end
        u40:equipShield(v42)
    end)
    u31.Client:Get("ShieldBreak"):Connect(function(p45) --[[ Line: 89 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u16
        --]]
        u40:breakShield(p45.player)
        if p45.attacker == u16.LocalPlayer then
            local v46 = p45.player.Character
            if v46 ~= nil then
                v46 = v46.PrimaryPart
                if v46 ~= nil then
                    v46 = v46.Position
                end
            end
            if not v46 then
                return nil
            end
            u40:spawnDamageIndicator(v46, p45.amountBlocked)
        end
    end)
    u31.Client:Get("EntityDeathEvent"):Connect(function(p47) --[[ Line: 106 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u40
        --]]
        local v48 = u16:GetPlayerFromCharacter(p47.entityInstance)
        if not v48 then
            return nil
        end
        u40:removeShield(v48)
        if u40.shieldCooldownList[v48] ~= nil then
            u40.shieldCooldownList[v48] = nil
        end
    end)
end
function u36.isRelevantMatchState(_) --[[ Line: 117 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u30
    --]]
    return u8.Controllers.MatchController:getMatchState() ~= u30.PRE
end
function u36.isRelevantKit(_, p49) --[[ Line: 120 ]]
    --[[
    Upvalues:
        [1] = u33
        [2] = u27
    --]]
    return u33(p49, u27.SWORD_SHIELD)
end
function u36.isRelevantItem(_, p50) --[[ Line: 123 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u28
    --]]
    local v51 = u24.SwordsToExclude
    local v52 = p50.itemType
    local v53 = table.find(v51, v52) == nil
    if v53 then
        v53 = u28(p50.itemType).sword ~= nil
    end
    return v53
end
function u36.onEnable(p54, _, _) --[[ Line: 132 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    p54:equipShield(u16.LocalPlayer)
end
function u36.onDisable(p55) --[[ Line: 135 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    p55:cleanUpAnimation()
    p55:removeShield(u16.LocalPlayer)
end
function u36.equipShield(u56, u57) --[[ Line: 139 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u25
        [3] = u24
        [4] = u28
        [5] = u26
        [6] = u29
        [7] = u34
        [8] = u5
    --]]
    if not u56:isRelevantMatchState() then
        return nil
    end
    if not u56:isRelevantKit(u57) then
        return nil
    end
    if u56.shieldCooldownList[u57] ~= nil then
        return nil
    end
    if u57 == u16.LocalPlayer then
        u56:setUpAnimation()
    end
    local v58 = u25:getEntity(u57)
    if not v58 then
        return nil
    end
    local v59 = u57.Character
    if not v59 then
        return nil
    end
    local v60 = v58:getHandItemInstanceFromCharacter()
    if not v60 then
        return nil
    end
    local v61 = v60.Name
    if table.find(u24.SwordsToExclude, v61) ~= nil then
        return nil
    end
    if not u28(v61).sword then
        return nil
    end
    local v62 = u26(u57)
    if v62 == nil then
        v62 = u24.getEquivalentNormalSwordFromSpecialSword(v61)
    end
    if v62 == nil then
        return nil
    end
    local v63
    if v62 then
        v63 = u24.ShieldMap[v62]
        if v63 ~= nil then
            v63 = v63.Name
        end
    else
        v63 = u24.ShieldMap[u29.WOOD_SWORD]
        if v63 ~= nil then
            v63 = v63.Name
        end
    end
    if v63 == nil then
        return nil
    end
    local v64 = u56.shieldMap[u57]
    if v64 ~= nil then
        if v64.Name == v63 then
            return nil
        end
        v64:Destroy()
        u56.shieldMap[u57] = nil
    end
    local u65
    if v62 then
        u65 = u24.ShieldMap[v62]
        if u65 ~= nil then
            u65 = u65:Clone()
        end
    else
        u65 = u24.ShieldMap[u29.WOOD_SWORD]
        if u65 ~= nil then
            u65 = u65:Clone()
        end
    end
    if not u65 then
        return nil
    end
    u65.Parent = v59
    u34:weldCharacterAccessories(v59)
    u56.shieldMap[u57] = u65
    v60.Destroying:Connect(function() --[[ Line: 246 ]]
        --[[
        Upvalues:
            [1] = u65
            [2] = u56
            [3] = u57
        --]]
        local v66 = u65
        if v66 ~= nil then
            v66:Destroy()
        end
        u56.shieldMap[u57] = nil
    end)
    if u57 == u16.LocalPlayer then
        local v67 = u24.ShieldSounds[u65.Name]
        if v67 ~= nil then
            v67 = v67[2]
        end
        if v67 ~= "" and v67 then
            u5:playSound(v67, {
                ["parent"] = v59.PrimaryPart
            })
        end
    end
end
function u36.breakShield(u68, u69) --[[ Line: 270 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u18
        [3] = u24
        [4] = u5
        [5] = u20
    --]]
    if u69 == u16.LocalPlayer then
        u68:cleanUpAnimation()
    end
    local u70 = u68.shieldMap[u69]
    if not u70 then
        return nil
    end
    local v71 = u70.Name
    u70.Parent = u18
    task.spawn(function() --[[ Line: 282 ]]
        --[[
        Upvalues:
            [1] = u70
        --]]
        u70.Handle.Full:Destroy()
        u70.Handle.Transparency = 1
    end)
    task.spawn(function() --[[ Line: 286 ]]
        --[[
        Upvalues:
            [1] = u70
        --]]
        local v72 = u70.Handle.Broken
        if v72 ~= nil then
            for v73, v74 in v72:GetDescendants() do
                local _ = v73 - 1
                if v74:IsA("WeldConstraint") then
                    v74:Destroy()
                end
                if v74:IsA("MeshPart") then
                    v74.CanCollide = true
                    v74.Massless = true
                    v74.CollisionGroup = "Players"
                end
            end
        end
    end)
    local v75 = u69.Character
    if v75 ~= nil then
        v75 = v75.PrimaryPart
        if v75 ~= nil then
            v75 = v75.Position
        end
    end
    if v75 then
        local v76 = u24.ShieldSounds[v71]
        if v76 ~= nil then
            v76 = v76[1]
        end
        if v76 ~= "" and v76 then
            u5:playSound(v76, {
                ["position"] = v75
            })
        end
    end
    u68.shieldCooldownList[u69] = true
    task.delay(3, function() --[[ Line: 328 ]]
        --[[
        Upvalues:
            [1] = u70
        --]]
        u70:Destroy()
    end)
    u68.shieldMap[u69] = nil
    local v77 = u20.AbilityCooldownModifierCheck:fire(u24.ShieldCooldown).cooldown
    task.delay(v77, function() --[[ Line: 335 ]]
        --[[
        Upvalues:
            [1] = u68
            [2] = u69
        --]]
        u68.shieldCooldownList[u69] = nil
        u68:equipShield(u69)
    end)
end
function u36.setUpAnimation(u78) --[[ Line: 367 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u3
        [3] = u23
        [4] = u22
    --]]
    local u79 = u16.LocalPlayer
    local v80 = u79.Character
    if not v80 then
        return nil
    end
    local u81 = v80.Humanoid
    local u82 = false
    local u83 = u3:playAnimation(u79, u23:getAssetId(u22.SHIELD_SWORD_IDLE))
    u78.animationMaid:GiveTask(function() --[[ Line: 377 ]]
        --[[
        Upvalues:
            [1] = u83
        --]]
        local v84 = u83
        if v84 ~= nil then
            v84:Stop()
        end
        local v85 = u83
        if v85 ~= nil then
            v85:Destroy()
        end
    end)
    u78.animationMaid:GiveTask(u81:GetPropertyChangedSignal("MoveDirection"):Connect(function() --[[ Line: 387 ]]
        --[[
        Upvalues:
            [1] = u81
            [2] = u82
            [3] = u78
            [4] = u79
            [5] = u83
            [6] = u3
            [7] = u23
            [8] = u22
        --]]
        if u81.MoveDirection.Magnitude > 0 and (u81:GetState() == Enum.HumanoidStateType.Running and (not u82 and u78.shieldCooldownList[u79] == nil)) then
            local v86 = u83
            if v86 ~= nil then
                v86:Stop()
            end
            local v87 = u83
            if v87 ~= nil then
                v87:Destroy()
            end
            u83 = u3:playAnimation(u79, u23:getAssetId(u22.SHIELD_SWORD_WALKING))
            u82 = true
        end
        if u81.MoveDirection.Magnitude == 0 and (u81:GetState() == Enum.HumanoidStateType.Running and u78.shieldCooldownList[u79] == nil) then
            u82 = false
            local v88 = u83
            if v88 ~= nil then
                v88:Stop()
            end
            local v89 = u83
            if v89 ~= nil then
                v89:Destroy()
            end
            u82 = false
            u83 = u3:playAnimation(u79, u23:getAssetId(u22.SHIELD_SWORD_IDLE))
        end
    end))
end
function u36.cleanUpAnimation(p90) --[[ Line: 415 ]]
    p90.animationMaid:DoCleaning()
end
function u36.spawnDamageIndicator(_, p91, p92) --[[ Line: 418 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u35
        [3] = u13
        [4] = u19
        [5] = u10
        [6] = u17
        [7] = u1
        [8] = u11
        [9] = u15
    --]]
    if (u18.CurrentCamera.CFrame.Position - p91).Magnitude > 200 then
        return nil
    end
    local u93 = Instance.new("Part")
    u93.Name = "DamageIndicatorPart"
    u93.Size = Vector3.new(1, 1, 1)
    u93.Transparency = 1
    u93.CanCollide = false
    u93.CanQuery = false
    u93.CFrame = CFrame.new(p91)
    u93:SetAttribute("FirstPersonVisible", false)
    u93.Anchored = true
    task.delay(u35.anchoredDuration, function() --[[ Line: 433 ]]
        --[[
        Upvalues:
            [1] = u93
        --]]
        u93.Anchored = false
    end)
    local v94 = Instance.new("BodyForce")
    local v95 = u35.gravityHeal
    local v96 = u93:GetMass() * u18.Gravity * v95
    v94.Force = Vector3.new(0, v96, 0)
    v94.Parent = u93
    local v97 = math.random(-50, 50) / 100 * u35.velX
    local v98 = math.random(-50, 50) / 100 * u35.velZ
    u93.Velocity = Vector3.new(v97, 0, v98)
    local v99 = Instance.new("BillboardGui")
    v99.Size = UDim2.new(5.88, 0, 2.8, 0)
    v99.AlwaysOnTop = true
    v99.MaxDistance = 100
    local u100 = u13("Frame", {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 1),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Parent"] = v99
    })
    local u101 = Instance.new("TextLabel")
    u101.Name = "DamageIndicatorTextLabel"
    u101.Text = "Blocked (" .. tostring(p92) .. ")"
    u101.Size = UDim2.new(0.5, 0, 1, 0)
    u101.BackgroundTransparency = 1
    u101.BorderSizePixel = 0
    u101.Font = Enum.Font.GothamBlack
    u101.Position = UDim2.fromScale(0.5, 0.5)
    u101.AnchorPoint = Vector2.new(0, 0.5)
    u101.TextSize = 25
    u101.TextXAlignment = Enum.TextXAlignment.Left
    u101.TextColor3 = Color3.fromRGB(209, 209, 209)
    u101:SetAttribute("FirstPersonVisible", false)
    local v102 = u13("UIStroke", {
        ["Parent"] = u101,
        ["Thickness"] = u35.strokeThickness,
        ["Color"] = Color3.fromRGB(0, 0, 0)
    })
    u101.Parent = u100
    v99.Parent = u93
    u93.Parent = u18
    task.spawn(function() --[[ Line: 476 ]]
        --[[
        Upvalues:
            [1] = u101
            [2] = u100
            [3] = u35
            [4] = u19
            [5] = u10
        --]]
        local u103 = u101.TextSize
        local u104 = u100.Size
        local u105 = u35.blowUpSize / u103
        local v112 = u19(u35.blowUpDuration, u10, function(p106) --[[ Line: 483 ]]
            --[[
            Upvalues:
                [1] = u101
                [2] = u103
                [3] = u35
                [4] = u104
                [5] = u105
                [6] = u100
            --]]
            u101.TextSize = u103 * (1 - p106) + p106 * u35.blowUpSize
            local v107 = u104
            local v108 = 1 - p106
            local v109 = UDim2.new(v107.X.Scale * v108, v107.X.Offset * v108, v107.Y.Scale * v108, v107.Y.Offset * v108)
            local v110 = u104
            local v111 = p106 * u105
            u100.Size = v109 + UDim2.new(v110.X.Scale * v111, v110.X.Offset * v111, v110.Y.Scale * v111, v110.Y.Offset * v111)
        end, 0, 1)
        v112:Play()
        v112:Wait()
        u103 = u101.TextSize
        u104 = u100.Size
        local u113 = u35.textSize / u103
        u19(u35.blowUpCompleteDuration, u10, function(p114) --[[ Line: 494 ]]
            --[[
            Upvalues:
                [1] = u101
                [2] = u103
                [3] = u35
                [4] = u104
                [5] = u113
                [6] = u100
            --]]
            u101.TextSize = u103 * (1 - p114) + p114 * u35.textSize
            local v115 = u104
            local v116 = 1 - p114
            local v117 = UDim2.new(v115.X.Scale * v116, v115.X.Offset * v116, v115.Y.Scale * v116, v115.Y.Offset * v116)
            local v118 = u104
            local v119 = p114 * u113
            u100.Size = v117 + UDim2.new(v118.X.Scale * v119, v118.X.Offset * v119, v118.Y.Scale * v119, v118.Y.Offset * v119)
        end, 0, 1):Play()
    end)
    local u120 = u17:Create(v102, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ["Transparency"] = 1
    })
    u1.Promise.delay(u35.anchoredDuration + 0.3):andThen(function() --[[ Line: 507 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u11
            [3] = u101
            [4] = u120
        --]]
        u19(0.2, u11, function(p121) --[[ Line: 508 ]]
            --[[
            Upvalues:
                [1] = u101
            --]]
            u101.TextTransparency = p121
        end, 0, 1)
        u120:Play()
    end)
    u15:AddItem(u93, 0.5)
end
function u36.removeShield(p122, p123) --[[ Line: 516 ]]
    local v124 = p122.shieldMap[p123]
    if not v124 then
        return nil
    end
    v124:Destroy()
    p122.shieldMap[p123] = nil
end
v7.CreateController(u36.new())
return nil