local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ExpireList
local u4 = v2.SoundManager
local u5 = v2.WatchCharacterAnimation
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.Lighting
local u14 = v12.Players
local u15 = v12.ReplicatedStorage
local u16 = v12.TweenService
local u17 = v12.Workspace
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "screen-shake", "screen-shake-util").ScreenShakeUtil
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "charge-state").ChargeState
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-melees").BedWarsGreatHammers
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "weapons", "hammer-util").HammerUtil
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "base-weapon", "base-weapon-balance").BaseWeaponBalance
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u34 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 39 ]]
        return "GreatHammerController"
    end,
    ["__index"] = u21
})
u34.__index = u34
function u34.new(...) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u34
    --]]
    local v35 = u34
    local v36 = setmetatable({}, v35)
    return v36:constructor(...) or v36
end
function u34.constructor(p37) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u3
        [3] = u28
        [4] = u10
    --]]
    u21.constructor(p37)
    p37.Name = "GreatHammerController"
    p37.effectCooldown = u3.new(u28.HAMMER_CHARGE_TIME * 0.9)
    p37.localAnimMaid = u10.new()
end
function u34.KnitStart(u38) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u19
        [3] = u26
        [4] = u27
        [5] = u25
        [6] = u14
        [7] = u29
        [8] = u24
        [9] = u8
        [10] = u30
        [11] = u23
        [12] = u5
        [13] = u10
    --]]
    u21.KnitStart(u38)
    u38:preloadHammers()
    u19.SwordSwing:connect(function(u39) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u27
            [3] = u25
            [4] = u14
            [5] = u38
        --]]
        if u39:isCancelled() then
            return nil
        end
        local v40 = u39.swordType
        if table.find(u26, v40) == nil then
            return nil
        end
        local v41 = u39.chargedAttack
        if v41 ~= nil then
            v41 = v41.chargeRatio
        end
        if v41 ~= 1 then
            return nil
        end
        task.delay(u27.chargedAttackSwingDuration, function() --[[ Line: 74 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u14
                [3] = u39
                [4] = u38
            --]]
            local v42 = u25:getEntity(u14.LocalPlayer)
            if v42 ~= nil then
                v42 = v42:getHandItemInstanceFromCharacter()
            end
            if u39.targetEntity and v42 then
                u38:applyChargedHitEffect(u39.targetEntity, v42)
            end
        end)
    end)
    u19.SwordChargedSwing:connect(function(p43) --[[ Line: 86 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u29
            [3] = u25
            [4] = u38
        --]]
        if p43:isCancelled() then
            return nil
        end
        local v44 = p43.weapon.Name
        if table.find(u26, v44) == nil then
            return nil
        end
        if not p43.chargedAttack then
            return nil
        end
        local v45 = u29(v44).sword
        if v45 ~= nil then
            v45 = v45.chargedAttack
        end
        if not v45 then
            return nil
        end
        if p43.chargedAttack.chargeTime < v45.maxChargeTimeSec then
            return nil
        end
        local v46 = u25:getEntity(p43.fromPlayer)
        if v46 ~= nil then
            v46 = v46:getHandItemInstanceFromCharacter()
        end
        if not v46 or v46.Name ~= p43.weapon.Name then
            return nil
        end
        u38:playChargedAttackEffect(p43.fromPlayer, v46)
    end)
    u19.SwordCharge:connect(function(u47) --[[ Line: 120 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u29
            [3] = u24
            [4] = u14
            [5] = u25
            [6] = u38
            [7] = u8
            [8] = u30
        --]]
        local v48 = u47.itemType
        if table.find(u26, v48) == nil then
            return nil
        end
        local v49 = u29(u47.itemType)
        local v50 = u47.chargeState
        if v50 == u24.Charged then
            local v51 = u14.LocalPlayer.Character
            if v51 then
                local v52 = u25:getEntity(u14.LocalPlayer)
                if v52 ~= nil then
                    v52 = v52:getHandItemInstanceFromCharacter()
                end
                u38.localAnimMaid:GiveTask(u38:playChargedEffect(v51, u47.itemType, v52))
                return
            end
        elseif v50 == u24.Charging then
            if u14.LocalPlayer.Character then
                local u53 = u25:getEntity(u14.LocalPlayer)
                if u53 ~= nil then
                    u53 = u53:getHandItemInstanceFromCharacter()
                end
                local u54 = v49.sword
                if u54 ~= nil then
                    u54 = u54.chargedAttack
                end
                if not u54 then
                    return nil
                end
                local v55 = u54.showHoldProgressAfterSec
                local u56 = v55 == nil and 0 or v55
                task.delay(u56, function() --[[ Line: 164 ]]
                    --[[
                    Upvalues:
                        [1] = u47
                        [2] = u8
                        [3] = u54
                        [4] = u56
                        [5] = u38
                        [6] = u53
                        [7] = u30
                    --]]
                    local v57 = u47.refId
                    if v57 == "" or not v57 then
                        return nil
                    end
                    if not u8.Controllers.SwordChargeController:isWeaponCharging(u47.itemType) then
                        return nil
                    end
                    local v58 = u54.maxChargeTimeSec - u56
                    local v59 = u38:playChargingEffect(u47.itemType, u53, v58)
                    if u47.itemType == u30.MYTHIC_GREAT_HAMMER then
                        u38:enableMythicHealAura()
                    end
                    if v59 then
                        u38.localAnimMaid:GiveTask(v59)
                    end
                end)
                return
            end
        elseif v50 == u24.Idle then
            u38.localAnimMaid:DoCleaning()
            return
        end
    end)
    local function v66(p60, p61) --[[ Line: 191 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u23
        --]]
        local v62 = u29(p61).sword
        if v62 ~= nil then
            v62 = v62.chargedAttack
            if v62 ~= nil then
                v62 = v62.chargedSwingAnimations
            end
        end
        if v62 ~= nil then
            for v63, v64 in v62 do
                local _ = v63 - 1
                local v65 = u23:getAssetId(v64)
                table.insert(p60, v65)
            end
        end
        return p60
    end
    local v67 = {}
    for v68 = 1, #u26 do
        v67 = v66(v67, u26[v68], v68 - 1, u26)
    end
    u5(v67, function(u69, p70) --[[ Line: 221 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u10
            [3] = u25
        --]]
        if not u69.Character then
            return nil
        end
        if u38.effectCooldown:has(u69.UserId) then
            return nil
        end
        u38.effectCooldown:add(u69.UserId)
        local u71 = u10.new()
        u71:GiveTask(p70.Destroying:Connect(function() --[[ Line: 232 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u69
                [3] = u71
            --]]
            local v72 = u25:getEntity(u69)
            if v72 ~= nil then
                v72 = v72:getHandItemInstanceFromCharacter()
            end
            u71:DoCleaning()
        end))
    end)
end
function u34.playChargingEffect(_, p73, p74, p75) --[[ Line: 244 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u10
        [3] = u17
        [4] = u16
        [5] = u8
    --]]
    local v76 = u29(p73)
    local v77 = v76.sword
    if v77 ~= nil then
        v77 = v77.chargedAttack
    end
    if not v77 then
        return nil
    end
    local v78 = u10.new()
    local u79 = u17.CurrentCamera
    if u79 then
        local v80 = u16
        if p75 == nil then
            p75 = v76.sword.chargedAttack.maxChargeTimeSec
        end
        local u81 = v80:Create(u79, TweenInfo.new(p75, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
            ["FieldOfView"] = u8.Controllers.FovController:getFOV() - 5
        })
        u81:Play()
        v78:GiveTask(function() --[[ Line: 267 ]]
            --[[
            Upvalues:
                [1] = u81
                [2] = u16
                [3] = u79
                [4] = u8
            --]]
            u81:Cancel()
            u16:Create(u79, TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                ["FieldOfView"] = u8.Controllers.FovController:getFOV()
            }):Play()
        end)
    end
    if p74 ~= nil then
        p74 = p74:FindFirstChild("Handle")
    end
    if p74 ~= nil then
        p74 = p74:FindFirstChild("StrikePosition")
    end
    return v78
end
function u34.playChargedEffect(u82, p83, _, u84) --[[ Line: 290 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u15
        [3] = u32
        [4] = u33
        [5] = u4
        [6] = u31
        [7] = u14
    --]]
    local v85 = u10.new()
    if u84 ~= nil then
        u84 = u84:FindFirstChild("Handle")
    end
    local v86
    if u84 == nil then
        v86 = u84
    else
        v86 = u84:FindFirstChild("StrikePosition")
    end
    if v86 then
        local u87 = u15.Assets.Effects.PulseEffect:Clone()
        u87.Pulse.Orientation = Enum.ParticleOrientation.FacingCamera
        u87.Position = v86.WorldCFrame.Position
        u87.Parent = u84
        u32:playEffects({ u87 }, nil, {
            ["destroyAfterSec"] = 1
        })
        local u88 = u15.Assets.Effects.BannerPoint:Clone()
        for v89, v90 in u88:GetDescendants() do
            local _ = v89 - 1
            v90:SetAttribute("FirstPersonVisible", false)
        end
        u88.Point.Cubes.Color = ColorSequence.new(Color3.fromRGB(243, 255, 115))
        u88.Point.Gradient.Color = ColorSequence.new(Color3.fromRGB(243, 255, 115))
        u88.Point.Shine.Color = ColorSequence.new(Color3.fromRGB(243, 255, 115))
        u88.Point.PointLight.Color = Color3.fromRGB(243, 255, 115)
        u88.Position = v86.WorldCFrame.Position
        u88.Parent = u84
        u32:playEffects({ u88 }, nil, {
            ["sizeMultiplier"] = 3
        })
        u33:weldParts(u84, u88)
        v85:GiveTask(function() --[[ Line: 329 ]]
            --[[
            Upvalues:
                [1] = u87
                [2] = u88
            --]]
            u87:Destroy()
            u88:Destroy()
        end)
    end
    if u84 then
        local u91 = true
        v85:GiveTask(function() --[[ Line: 336 ]]
            --[[
            Upvalues:
                [1] = u91
            --]]
            u91 = false
            return u91
        end)
        task.spawn(function() --[[ Line: 340 ]]
            --[[
            Upvalues:
                [1] = u82
                [2] = u84
                [3] = u91
            --]]
            while true do
                u82:flashPart(u84)
                local v92 = task.wait(1)
                if v92 ~= 0 and (v92 == v92 and v92) then
                    v92 = u91
                end
                if v92 == 0 or (v92 ~= v92 or not v92) then
                    return
                end
            end
        end)
    end
    local v93 = u4
    local v94 = u31.JUGG_BARB_COOLDOWN_COMPLETE
    local v95 = {
        ["volumeMultiplier"] = 2
    }
    local v96
    if p83 == u14.LocalPlayer.Character then
        v96 = nil
    else
        v96 = p83:GetPrimaryPartCFrame().Position
    end
    v95.position = v96
    local u97 = v93:playSound(v94, v95)
    v85:GiveTask(function() --[[ Line: 356 ]]
        --[[
        Upvalues:
            [1] = u97
        --]]
        local v98 = u97
        if v98 ~= nil then
            v98:Destroy()
        end
    end)
    return v85
end
function u34.playChargedAttackEffect(_, p99, _) --[[ Line: 364 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u7
        [3] = u25
        [4] = u4
        [5] = u31
        [6] = u32
    --]]
    local u100 = u10.new()
    u100:GiveTask(u7.Controllers.SprintController:getMovementStatusModifier():addModifier({
        ["moveSpeedMultiplier"] = 0,
        ["blockSprint"] = true
    }))
    task.delay(1, function() --[[ Line: 371 ]]
        --[[
        Upvalues:
            [1] = u100
        --]]
        local v101 = u100
        if v101 ~= nil then
            v101:DoCleaning()
        end
    end)
    local v102 = u25:getEntity(p99)
    if v102 ~= nil then
        v102 = v102:getHandItemInstanceFromCharacter()
    end
    if v102 then
        local v103 = u4
        local v104 = u31.JUGGERNAUT_ATTACK_SWING_3
        local v105 = {}
        local v106 = v102.Parent
        if v106 ~= nil then
            v106 = v106.Parent
        end
        v105.position = v106:GetPivot().Position
        v103:playSound(v104, v105)
        u100:GiveTask((u32:enableInstanceEffect(v102)))
    end
    return u100
end
function u34.playSwingAnimEndEffect(_, p107, p108) --[[ Line: 399 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u15
        [3] = u32
        [4] = u4
        [5] = u31
        [6] = u14
        [7] = u11
        [8] = u13
        [9] = u18
        [10] = u9
        [11] = u20
    --]]
    local v109 = u10.new()
    local v110 = p108:FindFirstChild("Handle")
    local v111
    if v110 == nil then
        v111 = v110
    else
        v111 = v110:FindFirstChild("StrikePosition")
    end
    if not v111 then
        return v109
    end
    local v112 = u15.Assets.Effects.DefaultLightningImpact:Clone()
    v112.Position = v111.WorldCFrame.Position
    v112.Parent = v110
    u32:playEffects({ v112 }, nil, {
        ["destroyAfterSec"] = 3,
        ["sizeMultiplier"] = 0.5
    })
    local v113 = u4
    local v114 = u31.JUGGERNAUT_GROUND_SMASH
    local v115 = {}
    local v116
    if p107 == u14.LocalPlayer.Character then
        v116 = nil
    else
        v116 = p107:GetPrimaryPartCFrame().Position
    end
    v115.position = v116
    v113:playSound(v114, v115)
    if u14.LocalPlayer.Character == p107 then
        local u117 = u11("DepthOfFieldEffect", {
            ["Name"] = "HammerDepthOfField",
            ["InFocusRadius"] = 20,
            ["FocusDistance"] = 0,
            ["FarIntensity"] = 0,
            ["Parent"] = u13
        })
        local u119 = u18(0.14, u9, function(p118) --[[ Line: 430 ]]
            --[[
            Upvalues:
                [1] = u117
            --]]
            u117.FarIntensity = (math.sqrt(p118) - p118) / 1.2
        end)
        task.spawn(function() --[[ Line: 434 ]]
            --[[
            Upvalues:
                [1] = u119
                [2] = u117
            --]]
            u119:Wait()
            u117:Destroy()
        end)
        u20.shakeScreenDirection(Vector2.new(1, 1), {
            ["zMagnitude"] = 1,
            ["duration"] = 0.4
        })
    end
    return v109
end
function u34.applyChargedHitEffect(_, p120, _) --[[ Line: 445 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u13
        [3] = u18
        [4] = u9
        [5] = u20
        [6] = u15
        [7] = u32
    --]]
    local u121 = u11("DepthOfFieldEffect", {
        ["Name"] = "ChargedHammerDepthOfField",
        ["InFocusRadius"] = 20,
        ["FocusDistance"] = 0,
        ["FarIntensity"] = 0,
        ["Parent"] = u13
    })
    local u123 = u18(0.14, u9, function(p122) --[[ Line: 454 ]]
        --[[
        Upvalues:
            [1] = u121
        --]]
        u121.FarIntensity = (math.sqrt(p122) - p122) / 1.2
    end)
    task.spawn(function() --[[ Line: 458 ]]
        --[[
        Upvalues:
            [1] = u123
            [2] = u121
        --]]
        u123:Wait()
        u121:Destroy()
    end)
    u20.shakeScreenDirection(Vector2.new(1, 1), {
        ["zMagnitude"] = 1,
        ["duration"] = 0.4
    })
    local v124 = u15.Assets.Effects.SolidOutlinePulse:Clone()
    v124:PivotTo(p120:getInstance():GetPivot())
    v124.Parent = p120:getInstance()
    u32:enableInstanceEffect(v124)
    u32:playEffects({ v124 }, p120:getInstance(), {
        ["destroyAfterSec"] = 0.5,
        ["sizeMultiplier"] = 1
    })
end
function u34.flashPart(_, u125, u126, p127) --[[ Line: 476 ]]
    if u126 == nil then
        u126 = Color3.fromRGB(255, 255, 255)
    end
    local u128 = p127 == nil and 0.1 or p127
    local function u133(u129) --[[ Line: 483 ]]
        --[[
        Upvalues:
            [1] = u126
            [2] = u128
        --]]
        if not (u129:IsA("BasePart") or u129:IsA("MeshPart")) then
            return nil
        end
        local u130 = not u129:IsA("MeshPart") and "" or u129.TextureID
        local u131 = u129.Material
        local u132 = u129.Color
        if u129:IsA("MeshPart") then
            u129.TextureID = ""
        end
        u129.Material = Enum.Material.Neon
        u129.Color = u126
        task.delay(u128, function() --[[ Line: 500 ]]
            --[[
            Upvalues:
                [1] = u129
                [2] = u130
                [3] = u131
                [4] = u132
            --]]
            if u129:IsA("MeshPart") then
                u129.TextureID = u130
            end
            u129.Material = u131
            u129.Color = u132
        end)
    end
    task.spawn(function() --[[ Line: 509 ]]
        --[[
        Upvalues:
            [1] = u133
            [2] = u125
        --]]
        u133(u125)
        for v134, v135 in u125:GetDescendants() do
            local _ = v134 - 1
            u133(v135)
        end
    end)
end
function u34.enableMythicHealAura(p136) --[[ Line: 520 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u4
        [3] = u31
        [4] = u8
        [5] = u28
    --]]
    local v137 = u14.LocalPlayer.Character
    local v138
    if v137 == nil then
        v138 = v137
    else
        v138 = v137.PrimaryPart
    end
    if not v138 then
        return nil
    end
    local u139 = u4:playModifiableSound(u31.FLAG_BUFF, {
        ["looped"] = true,
        ["position"] = v137.PrimaryPart:GetPivot().Position,
        ["parent"] = v137
    })
    local v140 = u8.Controllers.PirateFlagController:createBuffCircleIndicator(v137:GetPivot().Position, u28.MYTHIC_HAMMER_AURA_HEAL_RADIUS, {
        ["fadeOutAfterSec"] = 1,
        ["transparency"] = 0.5,
        ["color"] = Color3.fromRGB(102, 255, 87)
    })
    v140.Anchored = true
    p136.localAnimMaid:GiveTask(v140)
    p136.localAnimMaid:GiveTask(function() --[[ Line: 542 ]]
        --[[
        Upvalues:
            [1] = u139
            [2] = u4
        --]]
        if not u139 then
            return nil
        end
        u4:tweenSoundVolume(u139, 0, 0.8)
        task.delay(2, function() --[[ Line: 547 ]]
            --[[
            Upvalues:
                [1] = u139
            --]]
            u139:Destroy()
        end)
    end)
end
function u34.disableMythicHealAura(_) --[[ Line: 552 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v141 = u14.LocalPlayer.Character
    local v142
    if v141 == nil then
        v142 = v141
    else
        v142 = v141.PrimaryPart
    end
    if not v142 then
        return nil
    end
    local v143 = v141:FindFirstChild("BuffCircle")
    if v143 ~= nil then
        v143:Destroy()
    end
end
function u34.preloadHammers(_) --[[ Line: 566 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u30
        [3] = u22
        [4] = u7
    --]]
    local v144 = u29(u30.WOOD_GREAT_HAMMER).sword
    if not v144 then
        return nil
    end
    local v145 = { u22.GREAT_HAMMER_CHARGE, u22.GREAT_HAMMER_CHARGE_FP }
    local v146
    if v144.swingAnimations then
        v146 = {}
        local v147 = #v146
        local v148 = #v145
        table.move(v145, 1, v148, v147 + 1, v146)
        local v149 = v147 + v148
        local v150 = v144.swingAnimations
        table.move(v150, 1, #v150, v149 + 1, v146)
    else
        v146 = v145
    end
    local v151
    if v144.firstPersonSwingAnimations then
        v151 = {}
        local v152 = #v151
        local v153 = #v146
        table.move(v146, 1, v153, v152 + 1, v151)
        local v154 = v152 + v153
        local v155 = v144.firstPersonSwingAnimations
        table.move(v155, 1, #v155, v154 + 1, v151)
    else
        v151 = v146
    end
    local v156 = v144.chargedAttack
    if v156 ~= nil then
        v156 = v156.chargedSwingAnimations
    end
    local v157
    if v156 then
        v157 = {}
        local v158 = #v157
        local v159 = #v151
        table.move(v151, 1, v159, v158 + 1, v157)
        local v160 = v158 + v159
        local v161 = v144.chargedAttack.chargedSwingAnimations
        table.move(v161, 1, #v161, v160 + 1, v157)
    else
        v157 = v151
    end
    local v162 = v144.chargedAttack
    if v162 ~= nil then
        v162 = v162.firstPersonChargedSwingAnimations
    end
    local v163
    if v162 then
        v163 = {}
        local v164 = #v163
        local v165 = #v157
        table.move(v157, 1, v165, v164 + 1, v163)
        local v166 = v164 + v165
        local v167 = v144.chargedAttack.firstPersonChargedSwingAnimations
        table.move(v167, 1, #v167, v166 + 1, v163)
    else
        v163 = v157
    end
    local v168 = {}
    local v169
    if v144.swingSounds then
        v169 = {}
        local v170 = #v169
        local v171 = #v168
        table.move(v168, 1, v171, v170 + 1, v169)
        local v172 = v170 + v171
        local v173 = v144.swingSounds
        table.move(v173, 1, #v173, v172 + 1, v169)
    else
        v169 = v168
    end
    local v174 = v144.hitSound
    local v175
    if v174 == "" or not v174 then
        v175 = v169
    else
        v175 = {}
        local v176 = #v175
        local v177 = #v169
        table.move(v169, 1, v177, v176 + 1, v175)
        v175[v176 + v177 + 1] = v144.hitSound
    end
    local v178 = v144.chargedAttack
    if v178 ~= nil then
        v178 = v178.chargedSwingSounds
    end
    local v179
    if v178 then
        v179 = {}
        local v180 = #v179
        local v181 = #v175
        table.move(v175, 1, v181, v180 + 1, v179)
        local v182 = v180 + v181
        local v183 = v144.chargedAttack.chargedSwingSounds
        table.move(v183, 1, #v183, v182 + 1, v179)
    else
        v179 = v175
    end
    u7.Controllers.PreloadController:preloadForItemType(u30.WOOD_GREAT_HAMMER, {
        ["animations"] = v163,
        ["sounds"] = v179
    })
end
u7.CreateController(u34.new())
return nil