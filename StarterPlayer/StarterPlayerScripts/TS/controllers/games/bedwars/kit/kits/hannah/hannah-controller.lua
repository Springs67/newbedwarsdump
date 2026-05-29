local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.CollectionService
local u12 = v10.Players
local u13 = v10.ReplicatedStorage
local u14 = v10.TweenService
local u15 = v10.Workspace
local v16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller")
local u17 = v16.InteractionCategory
local u18 = v16.InteractionPriority
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u35 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u36 = v1.import(script, script.Parent, "ui", "hannah-combo").HannahCombo
local u37 = {
    [u24.HANNAH_GHOST] = {
        ["swordSkin"] = "ghost",
        ["slashColor"] = Color3.fromRGB(5, 161, 107)
    },
    [u24.HANNAH_VICTORIOUS] = {
        ["swordSkin"] = "victorious",
        ["slashColor"] = Color3.fromRGB(255, 250, 33),
        ["executeSound"] = u31.HANNAH_EXECUTE_VICTORIOUS
    },
    [u24.HANNAH_BUNNY] = {
        ["swordSkin"] = "bunny",
        ["slashColor"] = Color3.fromRGB(255, 140, 40),
        ["executeSound"] = u31.HANNAH_EXECUTE_BUNNY
    },
    [u24.HANNAH_LUNAR] = {
        ["swordSkin"] = "lunar",
        ["slashColor"] = Color3.fromRGB(255, 41, 41),
        ["executeSound"] = u31.HANNAH_EXECUTE_LUNAR
    }
}
local u38 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 63 ]]
        return "HannahController"
    end,
    ["__index"] = u35
})
u38.__index = u38
function u38.new(...) --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u38
    --]]
    local v39 = u38
    local v40 = setmetatable({}, v39)
    return v40:constructor(...) or v40
end
function u38.constructor(p41) --[[ Line: 73 ]]
    --[[
    Upvalues:
        [1] = u35
        [2] = u25
        [3] = u31
        [4] = u20
    --]]
    u35.constructor(p41, u25.HANNAH, {
        ["sounds"] = { u31.HANNAH_EXECUTE, u31.HANNAH_UNSHEATH_SWORD, u31.HANNAH_EXECUTE_VICTORIOUS },
        ["animations"] = { u20.HANNAH_ATTACK, u20.FP_HANNAH_ATTACK }
    })
    p41.Name = "HannahController"
end
function u38.onKitLocalActivated(p42, p43) --[[ Line: 80 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u2
        [3] = u36
    --]]
    p43:GiveTask(p42:registerExecuteInteractions())
    u12.LocalPlayer:SetAttribute("UseKitAbility", true)
    local v44 = {
        ["appId"] = "HannahCombo",
        ["app"] = u36
    }
    u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addApp(v44, {})
end
function u38.onKitLocalDeactivated(_) --[[ Line: 88 ]] end
function u38.onKitReplicationActivated(u45, p46) --[[ Line: 90 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u12
        [3] = u23
        [4] = u9
        [5] = u26
        [6] = u11
        [7] = u8
        [8] = u19
        [9] = u22
        [10] = u7
        [11] = u37
        [12] = u31
        [13] = u5
    --]]
    p46:GiveTask((u30.Client:Get("HealthDropBelowThresholdHannah"):Connect(function(p47) --[[ Line: 91 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u23
            [3] = u9
            [4] = u26
            [5] = u11
        --]]
        if u12:GetPlayerFromCharacter(p47.entity) == u12.LocalPlayer then
            return nil
        end
        local v48 = u23:getLocalPlayerEntity()
        local v49 = u23:getEntity(p47.entity)
        if not u12:GetPlayerFromCharacter(p47.entity) then
            return nil
        end
        if v48 and (v49 and not v48:canAttack(v49)) then
            return nil
        end
        local v50 = u9
        local v51 = {
            ["Name"] = "Hannah Execution Icon",
            ["AlwaysOnTop"] = true,
            ["MaxDistance"] = 100,
            ["StudsOffset"] = Vector3.new(-1.5, 7, 0),
            ["Parent"] = p47.entity,
            ["Adornee"] = p47.entity.Head,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Children"] = { u9("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["Image"] = u26.PIRATE_SKULL_ICON,
                    ["Size"] = UDim2.fromScale(3, 3),
                    ["ScaleType"] = Enum.ScaleType.Fit
                }) }
        }
        v50("BillboardGui", v51)
        u11:AddTag(p47.entity, "HannahExecuteInteraction")
    end)))
    p46:GiveTask((u30.Client:Get("HealthHealAboveThresholdHannah"):Connect(function(p52) --[[ Line: 122 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        local v53 = p52.entity:FindFirstChild("Hannah Execution Icon")
        if v53 then
            v53:Destroy()
        end
        u8.Controllers.InteractionRegistryController:removePrompt(p52.entity, "HannahExecuteInteraction")
    end)))
    p46:GiveTask((u30.Client:Get("EntityDeathEvent"):Connect(function(p54) --[[ Line: 130 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        local v55 = p54.entityInstance:FindFirstChild("Hannah Execution Icon")
        if v55 then
            v55:Destroy()
        end
        u8.Controllers.InteractionRegistryController:removePrompt(p54.entityInstance, "HannahExecuteInteraction")
    end)))
    local u56 = tick()
    p46:GiveTask((u30.Client:Get("HannahTeleport"):Connect(function(u57) --[[ Line: 139 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u56
            [3] = u19
            [4] = u22
            [5] = u7
            [6] = u37
            [7] = u31
            [8] = u5
            [9] = u45
        --]]
        local u58 = u57.player == u12.LocalPlayer
        if u58 then
            local u59 = tick()
            u56 = u59
            u19:dispatch({
                ["type"] = "KitHannahSetCombo",
                ["combo"] = u57.comboSize
            })
            task.delay(u22.HANNAH_COMBO_EXPIRATION_SEC, function() --[[ Line: 148 ]]
                --[[
                Upvalues:
                    [1] = u56
                    [2] = u59
                    [3] = u19
                --]]
                if u56 == u59 then
                    u19:dispatch({
                        ["type"] = "KitHannahSetCombo",
                        ["combo"] = 0
                    })
                end
            end)
        end
        local v60 = u7.Controllers.KitController:getKitSkin(u57.player.Character)
        local u61 = u37[v60]
        if u61 ~= nil then
            u61 = u61.executeSound
        end
        local v62 = u37[v60]
        if v62 ~= nil then
            v62 = v62.soundDelay
        end
        local v63 = v62 == nil and 0.3 or v62
        if u61 == "" or not u61 then
            u61 = u31.HANNAH_EXECUTE
        end
        local v64 = u5
        local v65 = u31.HANNAH_UNSHEATH_SWORD
        local v66 = {}
        local v67
        if u58 then
            v67 = nil
        else
            v67 = u57.player.Character
            if v67 ~= nil then
                v67 = v67:GetPrimaryPartCFrame().Position
            end
        end
        v66.position = v67
        v66.rollOffMaxDistance = 45
        v66.volumeMultiplier = 0.7
        v64:playSound(v65, v66)
        task.delay(v63, function() --[[ Line: 195 ]]
            --[[
            Upvalues:
                [1] = u57
                [2] = u12
                [3] = u61
                [4] = u31
                [5] = u5
                [6] = u58
            --]]
            local v68 = u57.player.Character
            if v68 ~= nil then
                v68 = v68.PrimaryPart
                if v68 ~= nil then
                    v68 = v68.CFrame
                end
            end
            if v68 or u57.player == u12.LocalPlayer then
                if u61 == "" or not u61 then
                    u61 = u31.HANNAH_EXECUTE
                end
                local v69 = u5
                local v70 = u61
                local v71 = {}
                if u58 then
                    v68 = nil
                elseif v68 ~= nil then
                    v68 = v68.Position
                end
                v71.position = v68
                v71.rollOffMaxDistance = 80
                v71.volumeMultiplier = 0.7
                v69:playSound(v70, v71)
            end
        end)
        u45:pullOutSword(u57.player, u57.targetPosition)
    end)))
end
function u38.onKitReplicationDeactivated(_) --[[ Line: 233 ]] end
function u38.onInnateAbilityEnabled(_, _, _) --[[ Line: 235 ]] end
function u38.onAbilityUsed(_, _, _) --[[ Line: 237 ]] end
function u38.pullOutSword(u72, u73, u74) --[[ Line: 239 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u20
        [3] = u12
        [4] = u29
        [5] = u28
        [6] = u8
        [7] = u23
        [8] = u9
        [9] = u34
        [10] = u13
    --]]
    if not u73.Character then
        return nil
    end
    task.delay(0.5, function() --[[ Line: 243 ]]
        --[[
        Upvalues:
            [1] = u73
            [2] = u72
        --]]
        local v75 = u73.Character
        if v75 ~= nil then
            v75 = v75:GetPrimaryPartCFrame()
        end
        if v75 then
            u72:playSlashEffect(v75, u73)
        end
    end)
    local u76 = u21:playAnimation(u73, u20.HANNAH_ATTACK, {
        ["looped"] = false
    })
    if u73 == u12.LocalPlayer then
        local v77 = u29.createItemInstance(u28.PIRATE_SWORD_FP)
        u8.Controllers.ViewmodelController:setHeldItem(v77)
        u8.Controllers.ViewmodelController:playAnimation(u20.FP_HANNAH_ATTACK)
    end
    local v78 = u73.Character
    if v78 ~= nil then
        v78 = v78:FindFirstChild("pirate_sword_back")
    end
    local v79 = u23:getEntity(u73)
    if v79 ~= nil then
        v79 = v79:getHandItemInstanceFromCharacter()
        if v79 ~= nil then
            v79 = v79:WaitForChild("Handle", 3)
        end
    end
    if v79 then
        v79.Transparency = 1
    end
    local u80
    if v78 then
        u80 = u73.Character
        if u80 ~= nil then
            u80 = u80:WaitForChild("pirate_sword_back"):Clone()
        end
        for _, v81 in v78:GetChildren() do
            if v81:IsA("BasePart") then
                v81.Transparency = 1
            end
        end
        local v82 = u80:WaitForChild("Handle")
        local v83 = u80:FindFirstChild("Handle")
        if v83 ~= nil then
            v83 = v83:FindFirstChild("SwordAttachment")
        end
        local v84 = v83.CFrame * CFrame.Angles(0, 3.141592653589793, 0)
        v82:ClearAllChildren()
        u9("Attachment", {
            ["Name"] = "RightGripAttachment",
            ["Parent"] = v82,
            ["CFrame"] = v84
        })
        u80.Parent = u73.Character
        u34:weldCharacterAccessories(u73.Character)
    else
        u80 = u13.Assets.Effects.PirateSword:Clone()
        u80.Parent = u73.Character
        u34:weldCharacterAccessories(u73.Character)
    end
    if u76 then
        u76:GetMarkerReachedSignal("start"):Connect(function() --[[ Line: 313 ]]
            --[[
            Upvalues:
                [1] = u72
                [2] = u73
                [3] = u74
            --]]
            u72:createTrail(u73, u74)
        end)
        u76:GetMarkerReachedSignal("end"):Connect(function() --[[ Line: 316 ]]
            --[[
            Upvalues:
                [1] = u80
                [2] = u72
                [3] = u73
                [4] = u76
            --]]
            if u80 then
                u72:putSwordBack(u73, u80)
            end
            local v85 = u76
            if v85 ~= nil then
                v85:Stop()
            end
            local v86 = u76
            if v86 ~= nil then
                v86:Destroy()
            end
        end)
        u76.Destroying:Connect(function() --[[ Line: 329 ]]
            --[[
            Upvalues:
                [1] = u80
                [2] = u72
                [3] = u73
            --]]
            if u80 then
                u72:putSwordBack(u73, u80)
            end
        end)
    end
end
function u38.putSwordBack(_, p87, p88) --[[ Line: 336 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u12
        [3] = u27
        [4] = u29
        [5] = u8
    --]]
    p88:Destroy()
    local v89 = u23:getEntity(p87)
    if v89 ~= nil then
        v89 = v89:getHandItemInstanceFromCharacter()
        if v89 ~= nil then
            v89 = v89:WaitForChild("Handle", 3)
        end
    end
    v89.Transparency = 0
    local v90 = p87.Character
    if v90 ~= nil then
        v90 = v90:FindFirstChild("pirate_sword_back")
    end
    if v90 then
        for _, v91 in v90:GetChildren() do
            if v91:IsA("BasePart") then
                v91.Transparency = 0
            end
        end
    end
    if p87 == u12.LocalPlayer then
        local v92 = u27.getInventory(p87).hand
        if v92 ~= nil then
            v92 = v92.itemType
        end
        if not v92 then
            return nil
        end
        local v93 = u29.createItemInstance(v92)
        u8.Controllers.ViewmodelController:setHeldItem(v93)
    end
end
function u38.createTrail(_, u94, p95) --[[ Line: 373 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u15
        [3] = u9
        [4] = u21
        [5] = u20
        [6] = u14
    --]]
    if u94.Character then
        u94.Character.Archivable = true
    end
    local u96 = u94.Character
    if u96 ~= nil then
        u96 = u96:Clone()
    end
    if not u96 then
        return nil
    end
    local v97 = u96.Humanoid.Animator
    local v98 = u94.Character
    if not u96.PrimaryPart then
        return nil
    end
    if u94 == u12.LocalPlayer then
        if u96.Humanoid == nil or not v98 then
            return nil
        end
        u15.CurrentCamera.CameraSubject = u96.Humanoid
    end
    local v99 = u94.Character
    if v99 ~= nil then
        v99:SetAttribute("Transparency", 1)
    end
    u96:PivotTo(CFrame.new(v98:GetPrimaryPartCFrame().Position, p95))
    u96.Parent = u15
    v97:LoadAnimation(u9("Animation", {
        ["AnimationId"] = u21:getAssetId(u20.HANNAH_ATTACK)
    })):Play()
    local v100 = TweenInfo.new(0.6)
    local v101 = u14:Create(u96.PrimaryPart, v100, {
        ["CFrame"] = CFrame.new(p95)
    })
    v101:Play()
    v101.Completed:Connect(function() --[[ Line: 412 ]]
        --[[
        Upvalues:
            [1] = u96
            [2] = u94
            [3] = u12
            [4] = u15
        --]]
        u96:Destroy()
        if u94.Character then
            u94.Character:SetAttribute("Transparency", 0)
            u94.Character.Archivable = false
        end
        if u94 == u12.LocalPlayer then
            u15.CurrentCamera.CameraSubject = u94.Character.Humanoid
        end
    end)
end
function u38.playSlashEffect(_, p102, p103) --[[ Line: 423 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u13
        [3] = u24
        [4] = u15
    --]]
    if not (p102 and p103.Character) then
        return nil
    end
    local v104 = u7.Controllers.KitController:getKitSkin(p103.Character)
    local u105 = u13.Assets.Effects.HannahSwordSwing:Clone()
    local v106 = u105:FindFirstChild("Main")
    if v106 ~= nil then
        v106 = v106:FindFirstChild("Color")
    end
    if v106 and v104 == u24.HANNAH_GHOST then
        v106.Color = Color3.fromRGB(5, 161, 107)
    end
    u105:PivotTo(p102)
    u105.Parent = u15
    u105:PivotTo(p102 * CFrame.new(0, 0, -2))
    task.delay(0.15, function() --[[ Line: 443 ]]
        --[[
        Upvalues:
            [1] = u105
        --]]
        u105:Destroy()
    end)
end
function u38.registerExecuteInteractions(_) --[[ Line: 447 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u22
        [3] = u4
        [4] = u18
        [5] = u17
        [6] = u12
        [7] = u23
        [8] = u33
        [9] = u32
        [10] = u30
    --]]
    return u7.Controllers.InteractionRegistryController:RegisterInteraction({
        ["interactionLabel"] = "Blood For Blood!",
        ["interactionObjectText"] = "Execute",
        ["interactionTag"] = "HannahExecuteInteraction",
        ["instantActivation"] = true,
        ["removePromptOnInteract"] = true,
        ["maxActivationDistance"] = u22.HANNAH_EXECUTE_MAX_DISTANCE,
        ["clickablePrompt"] = u4.isMobileControls(),
        ["priority"] = u18.ABILITY,
        ["category"] = u17.ABILITY,
        ["onInteracted"] = function(p107, p108, _) --[[ Name: onInteracted, Line 458 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u23
                [3] = u33
                [4] = u32
                [5] = u30
            --]]
            if not p108:IsA("Model") then
                return nil
            end
            if not u12:GetPlayerFromCharacter(p108) then
                return nil
            end
            local v109 = u23:getEntity(p107)
            if v109 ~= nil then
                v109 = v109:getInstance()
            end
            if v109 and u33:isActive(v109, u32.GROUNDED) then
                return nil
            end
            if v109 and u33:isActive(v109, u32.FROSTED) then
                return nil
            end
            local v110 = u30.Client:Get("HannahPromptTrigger"):CallServer({
                ["user"] = u12.LocalPlayer,
                ["victimEntity"] = p108
            }) and p108:FindFirstChild("Hannah Execution Icon")
            if v110 then
                v110:Destroy()
            end
        end
    })
end
u7.CreateController(u38.new())
return nil