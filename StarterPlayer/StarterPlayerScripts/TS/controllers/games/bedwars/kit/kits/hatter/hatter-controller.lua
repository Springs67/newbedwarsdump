local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Lighting
local u10 = v8.Players
local u11 = v8.ReplicatedStorage
local u12 = v8.TweenService
local u13 = v8.Workspace
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u15 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "umbra-balance").UmbraBalance
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u28 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u29 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u30 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u31 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u32 = u1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u33 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 38 ]]
        return "HatterController"
    end,
    ["__index"] = u32
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
        [1] = u32
        [2] = u25
        [3] = u6
        [4] = u13
        [5] = u7
        [6] = u12
    --]]
    u32.constructor(p36, u25.HATTER)
    p36.Name = "HatterController"
    p36.speedMaid = u6.new()
    p36.teleportMaid = u6.new()
    p36.targetAlertMaid = u6.new()
    p36.peekMaid = u6.new()
    p36.teleportChannelMaid = {}
    p36.currentBorrowedHats = {}
    p36.hatterIsPeeking = false
    p36.hatterCanUseAbilities = true
    p36.initialCameraMinZoom = 0
    p36.initialCameraMaxZoom = 0
    p36.hatterToHatOrbMap = {}
    p36.camera = u13.CurrentCamera
    p36.peekingFilterTweenDuration = 0.4
    p36.colorCorrectionEffect = u7("ColorCorrectionEffect", {
        ["Brightness"] = 0.3,
        ["Contrast"] = 0.8,
        ["Saturation"] = -1,
        ["TintColor"] = Color3.fromRGB(80, 90, 87)
    })
    p36.tweenColorCorrectionUp = u12:Create(p36.colorCorrectionEffect, TweenInfo.new(p36.peekingFilterTweenDuration), {
        ["Brightness"] = 0.3,
        ["Contrast"] = 0.8,
        ["Saturation"] = -1,
        ["TintColor"] = Color3.fromRGB(80, 90, 87)
    })
    p36.defaultColorCorrectionTween = {
        ["Brightness"] = 0,
        ["Contrast"] = 0.05,
        ["Saturation"] = 0,
        ["TintColor"] = Color3.fromRGB(255, 255, 255)
    }
    p36.bloomEffect = u7("BloomEffect", {
        ["Intensity"] = 0.8,
        ["Size"] = 31,
        ["Threshold"] = 0.95
    })
    p36.tweenBloomUp = u12:Create(p36.bloomEffect, TweenInfo.new(p36.peekingFilterTweenDuration), {
        ["Intensity"] = 0.8,
        ["Size"] = 31,
        ["Threshold"] = 0.95
    })
    p36.defaultBloomTween = {
        ["Intensity"] = 0,
        ["Size"] = 0,
        ["Threshold"] = 0
    }
end
function u33.onKitLocalActivated(p37, p38) --[[ Line: 98 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u1
        [3] = u23
        [4] = u21
        [5] = u2
        [6] = u26
        [7] = u27
        [8] = u22
    --]]
    p37:onKitEnabled()
    p38:GiveTask(u15.LocalProjectileImpact:connect(function(p39) --[[ Line: 101 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u23
            [3] = u21
            [4] = u2
            [5] = u26
            [6] = u27
            [7] = u22
        --]]
        if p39.projectile.Name ~= "teleport_hat" then
            return nil
        end
        if u1.instanceof(p39.hitEntity, u23) then
            local v40 = p39.hitEntity:getPlayer():GetAttribute("UmbraNumHats")
            if (v40 == nil and 0 or v40) >= u21.MAX_HATS_ON_TARGET then
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    ["message"] = "Maximum Umbra Hats Reached"
                })
                local v41 = u26(u27.TELEPORT_HAT).projectileSource.fireDelaySec
                u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):removeCooldown(u22.HAT_TOSS)
                u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(u22.HAT_TOSS, v41 * u21.HIT_MAX_HAT_TARGET_CD_REDUCTION)
            end
        end
    end))
end
function u33.onKitLocalDeactivated(_) --[[ Line: 122 ]] end
function u33.onKitReplicationActivated(u42, u43) --[[ Line: 124 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u10
        [3] = u6
        [4] = u20
        [5] = u19
        [6] = u13
        [7] = u24
        [8] = u1
        [9] = u23
        [10] = u16
        [11] = u11
        [12] = u3
        [13] = u29
        [14] = u30
        [15] = u4
    --]]
    u43:GiveTask((u28.Client:Get("EntityDeathEvent"):Connect(function(p44) --[[ Line: 125 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u42
        --]]
        local v45 = u10:GetPlayerFromCharacter(p44.entityInstance)
        if not v45 then
            return nil
        end
        u42:cleanTargetPlayer(v45)
    end)))
    u43:GiveTask(u10.PlayerRemoving:Connect(function(p46) --[[ Line: 133 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        if not p46 then
            return nil
        end
        u42:cleanTargetPlayer(p46)
    end))
    u28.Client:OnEvent("HatterChannelTeleport", function(p47) --[[ Line: 140 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u20
            [3] = u19
            [4] = u42
            [5] = u13
        --]]
        if not p47.player.Character then
            return nil
        end
        local v48 = u6.new()
        local u49 = u20:playAnimation(p47.player, u19.USE_CROSS, {
            ["looped"] = true
        })
        v48:GiveTask(function() --[[ Line: 149 ]]
            --[[
            Upvalues:
                [1] = u49
            --]]
            local v50 = u49
            if v50 ~= nil then
                v50:Stop()
            end
            local v51 = u49
            if v51 ~= nil then
                v51:Destroy()
            end
        end)
        u42.teleportChannelMaid[p47.player.UserId] = v48
        task.delay(p47.endTime - u13:GetServerTimeNow(), function() --[[ Line: 162 ]]
            --[[
            Upvalues:
                [1] = u49
            --]]
            local v52 = u49
            if v52 ~= nil then
                v52:Stop()
            end
            local v53 = u49
            if v53 ~= nil then
                v53:Destroy()
            end
        end)
    end):andThen(function(p54) --[[ Line: 172 ]]
        --[[
        Upvalues:
            [1] = u43
        --]]
        u43:GiveTask(p54)
    end)
    u28.Client:OnEvent("HatterChannelCancel", function(p55) --[[ Line: 175 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u10
        --]]
        local v56 = u42.teleportChannelMaid[p55.player.UserId]
        if v56 ~= nil then
            v56:DoCleaning()
        end
        if p55.player == u10.LocalPlayer then
            u42.hatterCanUseAbilities = true
        end
        u42:handleTeleportAbilityUI(u42.hatterTarget ~= nil)
        u42:handlePeekAbilityUI(u42.hatterTarget ~= nil)
    end):andThen(function(p57) --[[ Line: 187 ]]
        --[[
        Upvalues:
            [1] = u43
        --]]
        u43:GiveTask(p57)
    end)
    u28.Client:OnEvent("HatterUseTeleport", function(p58) --[[ Line: 190 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u1
            [3] = u23
            [4] = u42
            [5] = u13
            [6] = u10
            [7] = u16
        --]]
        local v59 = u24:getEntity(p58.hatterPlayer)
        if not u1.instanceof(v59, u23) then
            return nil
        end
        local v60 = p58.hatterPlayer
        local v61 = u42.teleportChannelMaid[v60.UserId]
        if v61 ~= nil then
            v61:DoCleaning()
        end
        local v62 = v59:getInstance().PrimaryPart
        if not v62 then
            return nil
        end
        local v63 = u42:generateRandomizedPath(p58.hatterInitialPosition, p58.targetPosition, 4, 1.5, 6)
        local v64 = p58.arriveTime - u13:GetServerTimeNow()
        if v60.UserId == u10.LocalPlayer.UserId then
            u16:dispatch({
                ["type"] = "UnequipItemInHand",
                ["equip"] = false
            })
        end
        u42:updateTargetHatOrb(v60)
        u42:traverseTeleportPath(v63, v60, v62, v64)
    end):andThen(function(p65) --[[ Line: 220 ]]
        --[[
        Upvalues:
            [1] = u43
        --]]
        u43:GiveTask(p65)
    end)
    u28.Client:OnEvent("HatterTargetSelected", function(p66) --[[ Line: 223 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        u42:handleTargetSelected(p66.hatterPlayer, p66.targetPlayer)
    end):andThen(function(p67) --[[ Line: 225 ]]
        --[[
        Upvalues:
            [1] = u43
        --]]
        u43:GiveTask(p67)
    end)
    u28.Client:OnEvent("HatterProtectInvulnPlayer", function(p68) --[[ Line: 228 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u13
            [3] = u3
            [4] = u29
            [5] = u30
        --]]
        local v69 = p68.targetInstance.PrimaryPart
        if v69 ~= nil then
            v69 = v69.Position
        end
        if v69 then
            local v70 = u11.Assets.Effects.HatterDudEffect:Clone()
            v70.CFrame = CFrame.new(v69, v69 + v69)
            v70.Parent = u13
            u3:playSound(u29.UMBRA_INVULNERABILITY_HIT, {
                ["volumeMultiplier"] = 1.5,
                ["position"] = v69
            })
            u30:playEffects({ v70 }, p68.targetInstance, {
                ["destroyAfterSec"] = p68.duration
            })
        end
    end):andThen(function(p71) --[[ Line: 248 ]]
        --[[
        Upvalues:
            [1] = u43
        --]]
        u43:GiveTask(p71)
    end)
    u28.Client:OnEvent("HatterTargetArrival", function(p72) --[[ Line: 252 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u4
            [3] = u10
            [4] = u16
        --]]
        local v73 = {
            ["blockSprint"] = false,
            ["constantSpeedMultiplier"] = p72.speedMultiplier
        }
        u42.speedMaid:GiveTask(u4.Controllers.SprintController:getMovementStatusModifier():addModifier(v73))
        if p72.hatterPlayer.UserId == u10.LocalPlayer.UserId then
            u16:dispatch({
                ["type"] = "UnequipItemInHand",
                ["equip"] = true
            })
        end
        if u42.currentBorrowedHats[p72.hatterPlayer.UserId] ~= nil then
            u42.currentBorrowedHats[p72.hatterPlayer.UserId] = nil
        end
        if next(u42.currentBorrowedHats) == nil then
            u42:handleTargetAlertAbilityUI(false)
        end
        task.delay(3, function() --[[ Line: 275 ]]
            --[[
            Upvalues:
                [1] = u42
            --]]
            local v74 = u42.speedMaid
            if v74 ~= nil then
                v74:DoCleaning()
            end
        end)
        if u42.hatterToHatOrbMap[p72.hatterPlayer] ~= nil then
            u42.hatterToHatOrbMap[p72.hatterPlayer] = nil
        end
    end):andThen(function(p75) --[[ Line: 289 ]]
        --[[
        Upvalues:
            [1] = u43
        --]]
        u43:GiveTask(p75)
    end)
end
function u33.onKitReplicationDeactivated(_) --[[ Line: 293 ]] end
function u33.onInnateAbilityEnabled(_, _, _) --[[ Line: 295 ]] end
function u33.onAbilityUsed(p76, p77, p78) --[[ Line: 297 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u24
        [3] = u1
        [4] = u23
        [5] = u17
    --]]
    if p78:isCancelled() then
        return nil
    elseif p77 == u10.LocalPlayer.Character then
        local v79 = u24:getEntity(p77)
        if u1.instanceof(v79, u23) then
            local v80 = p78.ability
            if v80 == u17.HATTER_TELEPORT then
                p76.hatterCanUseAbilities = false
                p76:handleTeleportAbilityUI(false)
                p76:handlePeekAbilityUI(false)
                p76:cleanupHatterPeek()
            elseif v80 == u17.HATTER_PEEK then
                if p76.hatterCanUseAbilities then
                    p76:handleHatterPeek(v79)
                    return
                end
            else
                local _ = v80 == u17.HATTER_TARGET_ALERT
            end
        else
            return nil
        end
    else
        return nil
    end
end
function u33.generateRandomizedPath(_, p81, p82, p83, p84, p85) --[[ Line: 329 ]]
    local v86 = 1 / p83
    local v87 = -math.abs(p85)
    local v88 = false
    local v89 = 1
    local v90 = { p81 }
    while true do
        if v88 then
            v89 = v89 + 1
        else
            v88 = true
        end
        if v89 >= p83 then
            table.insert(v90, p82)
            return v90
        end
        local v91 = v89 * v86
        local v92 = p81.X + v91 * (p82.X - p81.X) + (math.random() * 2 - 1) * p84 * math.random() * (p85 - v87) + v87
        local v93 = p81.Y + v91 * (p82.Y - p81.Y) + math.random() * 2 * p84 * p85
        local v94 = p81.Z + v91 * (p82.Z - p81.Z) + (math.random() * 2 - 1) * p84 * math.random() * (p85 - v87) + v87
        local v95 = Vector3.new(v92, v93, v94)
        table.insert(v90, v95)
    end
end
function u33.traverseTeleportPath(p96, p97, p98, p99, p100) --[[ Line: 359 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u11
        [3] = u13
        [4] = u29
        [5] = u3
        [6] = u10
        [7] = u14
        [8] = u5
        [9] = u30
    --]]
    local v101 = u6.new()
    local v102 = false
    local v103 = 0
    local v104 = 0
    while true do
        if v102 then
            v103 = v103 + 1
        else
            v102 = true
        end
        if v103 >= #p97 - 1 then
            break
        end
        v104 = v104 + (p97[v103 + 1] - p97[v103 + 1 + 1]).Magnitude
    end
    local u105 = u11.Assets.Misc:FindFirstChild("TeleportingHatter")
    if u105 ~= nil then
        u105 = u105:Clone()
    end
    local v106 = u105:FindFirstChild("Root")
    if v106 ~= nil then
        local v107 = v106:FindFirstChild("EntryEffects")
        if v107 ~= nil then
            for v108, v109 in v107:GetDescendants() do
                local _ = v108 - 1
                if v109:IsA("ParticleEmitter") then
                    v109.Enabled = true
                end
                if v109:IsA("Trail") then
                    v109.Enabled = true
                end
            end
        end
    end
    u105.Parent = u13
    local u110 = os.clock()
    local v111 = {
        u29.UMBRA_TELEPORT_BOUNCE_1,
        u29.UMBRA_TELEPORT_BOUNCE_2,
        u29.UMBRA_TELEPORT_BOUNCE_3,
        u29.UMBRA_TELEPORT_BOUNCE_4
    }
    local v112 = u3:playSound(u29.UMBRA_TELEPORT_LOOP, {
        ["rollOffMaxDistance"] = 120,
        ["rollOffMinDistance"] = 50,
        ["looped"] = true,
        ["volumeMultiplier"] = 2,
        ["parent"] = u105.PrimaryPart
    })
    local v113, v114
    if p98 == u10.LocalPlayer then
        local v115 = u105.PrimaryPart
        if v115 then
            p96.camera.CameraSubject = v115
            u10.LocalPlayer.CameraMinZoomDistance = p96.initialCameraMaxZoom
        end
        p99.Anchored = true
        v113 = false
        v114 = 0
    else
        v113 = false
        v114 = 0
    end
    while true do
        if v113 then
            v114 = v114 + 1
        else
            v113 = true
        end
        if v114 >= #p97 - 1 then
            v101:DoCleaning()
            debug.profilebegin("hatter-end")
            for _, v116 in u105:GetDescendants() do
                if v116:IsA("Decal") then
                    v116.Transparency = 1
                end
                if v116:IsA("BasePart") then
                    v116.Transparency = 1
                    v116.CanCollide = false
                    v116.CanQuery = false
                end
                if v116:IsA("ParticleEmitter") then
                    v116.Enabled = false
                end
                if v116:IsA("PointLight") then
                    v116.Enabled = false
                end
                if v116:IsA("Trail") then
                    v116.Enabled = false
                end
            end
            if v112 then
                u3:tweenSoundVolume(v112, 0, 1)
            end
            if p98 == u10.LocalPlayer then
                p96.hatterTarget = nil
                p96:resetPeekingEffects()
            end
            u105:Destroy()
            debug.profileend()
            return
        end
        local u117 = p97[v114 + 1]
        local u118 = p97[v114 + 1 + 1]
        local v119 = (u117 - u118).Magnitude / v104 * p100
        local u120 = (u118 - u117).Unit
        local u121 = nil
        u121 = u14(v119, u5, function(p122) --[[ Line: 441 ]]
            --[[
            Upvalues:
                [1] = u105
                [2] = u121
                [3] = u110
                [4] = u120
                [5] = u117
                [6] = u118
            --]]
            local v123 = math.pow(p122, 0.6666666666666666)
            local v124 = u105.PrimaryPart
            if v124 ~= nil then
                v124 = v124.Parent
            end
            if not v124 then
                u121:Cancel()
                return nil
            end
            local _ = os.clock() - u110
            local v125 = CFrame.new(Vector3.new(0, 0, 0), u120)
            local v126 = v123 * 3.141592653589793 * 3 * 2
            local v127 = math.sin(v126) * 3
            local v128 = v123 * 3.141592653589793 * 2 * 2
            local v129 = math.sin(v128) * 3
            local v130 = v123 * 3.141592653589793 * 3 * 2
            local v131 = math.sin(v130) * 3
            local v132 = v125 * Vector3.new(v127, v129, v131)
            u105:PivotTo(CFrame.new(u117):Lerp(CFrame.new(u118) + v132, v123))
        end)
        u121:Wait()
        debug.profilebegin("hatter-bounce")
        local v133 = u105:FindFirstChild("Root")
        if v133 ~= nil then
            v133 = v133:FindFirstChild("EntryEffects")
            if v133 ~= nil then
                v133 = v133:FindFirstChild("Blast")
            end
        end
        if v133 then
            u30:playEffects({ v133 }, nil)
        end
        local v134 = #p97 - 2
        local v135 = v111[1]
        if v134 / 2 < v114 then
            v135 = v111[2]
        end
        if v134 / 3 < v114 then
            v135 = v111[3]
        end
        if v114 == #p97 - 1 then
            v135 = v111[4]
        end
        local v136 = v135 == v111[4] and 1 or v114 / (v134 - 1) * 0.2 + 0.9
        u3:playSound(v135, {
            ["rollOffMaxDistance"] = 120,
            ["rollOffMinDistance"] = 50,
            ["position"] = u105:GetPrimaryPartCFrame().Position,
            ["playbackSpeedMultiplier"] = v136
        })
        debug.profileend()
    end
end
function u33.onKitEnabled(p137) --[[ Line: 525 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
    --]]
    p137.initialCameraMinZoom = u10.LocalPlayer.CameraMinZoomDistance
    p137.initialCameraMaxZoom = u10.LocalPlayer.CameraMaxZoomDistance
    p137.hatterIsPeeking = false
    table.clear(p137.currentBorrowedHats)
    p137.bloomEffect.Enabled = false
    p137.bloomEffect.Parent = u9
    p137.colorCorrectionEffect.Enabled = false
    p137.colorCorrectionEffect.Parent = u9
end
function u33.resetPeekingEffects(p138) --[[ Line: 535 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v139 = u10.LocalPlayer.Character
    if v139 ~= nil then
        v139 = v139:FindFirstChildWhichIsA("Humanoid")
    end
    p138.camera.CameraSubject = v139
    u10.LocalPlayer.CameraMinZoomDistance = p138.initialCameraMinZoom
    p138.colorCorrectionEffect.Brightness = p138.defaultColorCorrectionTween.Brightness
    p138.colorCorrectionEffect.Contrast = p138.defaultColorCorrectionTween.Contrast
    p138.colorCorrectionEffect.Saturation = p138.defaultColorCorrectionTween.Saturation
    p138.colorCorrectionEffect.TintColor = p138.defaultColorCorrectionTween.TintColor
    p138.bloomEffect.Intensity = p138.defaultBloomTween.Intensity
    p138.bloomEffect.Size = p138.defaultBloomTween.Size
    p138.bloomEffect.Threshold = p138.defaultBloomTween.Threshold
end
function u33.handleTargetSelected(p140, p141, p142) --[[ Line: 550 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    if u10.LocalPlayer == p141 then
        p140.hatterIsPeeking = false
        p140.hatterCanUseAbilities = true
        p140.hatterTarget = p142
        p140:handleTeleportAbilityUI(true)
        p140:handlePeekAbilityUI(true)
    end
    if u10.LocalPlayer == p142 then
        p140.currentBorrowedHats[p141.UserId] = true
        p140:handleTargetAlertAbilityUI(true)
    end
    p140:refreshBorrowedHats(p141, p142)
end
function u33.refreshBorrowedHats(p143, p144, u145) --[[ Line: 568 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u11
        [3] = u31
    --]]
    local v146 = u145.Character
    local v147
    if v146 == nil then
        v147 = v146
    else
        v147 = v146.Parent
    end
    if not v147 then
        return nil
    end
    local u148 = u6.new()
    local v149 = u145:GetAttribute("UmbraNumHats")
    local v150 = v149 == nil and 0 or v149
    local v151 = false
    local v152 = 0
    while true do
        if v151 then
            v152 = v152 + 1
        else
            v151 = true
        end
        if v152 >= v150 then
            u148:GiveTask(u145:GetAttributeChangedSignal("UmbraHatStatus"):Connect(function() --[[ Line: 623 ]]
                --[[
                Upvalues:
                    [1] = u145
                    [2] = u148
                --]]
                local v153 = u145:GetAttribute("UmbraHatStatus")
                if v153 == 0 or (v153 ~= v153 or (v153 == "" or not v153)) then
                    u148:DoCleaning()
                end
            end))
            return
        end
        local v154 = u11.Assets.Effects.TeleportHat:Clone()
        local v155 = nil
        local v156 = v155
        for v157, v158 in v154:GetDescendants() do
            local _ = v157 - 1
            if v158:IsA("BasePart") then
                v158:SetAttribute("NoArmorHide", true)
            end
            if v158.Name == "Neon2" and v158:IsA("MeshPart") then
                v155 = v158
                v156 = v155
            end
        end
        local v159 = v154.Handle.HatAttachment
        if v156 ~= nil then
            p143.hatterToHatOrbMap[p144] = v156
        end
        v154.Handle.HatAttachment.CFrame = CFrame.new(v159.CFrame.X, v159.CFrame.Y - v152, v159.CFrame.Z)
        v154.Parent = v146
        u31:weldAccessory(v146, v154)
        u148:GiveTask(v154)
    end
end
function u33.cleanTargetPlayer(p160, p161) --[[ Line: 630 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    if p161 then
        local v162 = p160.currentBorrowedHats
        local v163 = p161.UserId
        local v164 = v162[v163] ~= nil
        v162[v163] = nil
        if v164 and next(p160.currentBorrowedHats) == nil then
            p160:handleTargetAlertAbilityUI(false)
        end
        if p161 == u10.LocalPlayer then
            p160.hatterTarget = nil
            table.clear(p160.currentBorrowedHats)
            p160:handleTeleportAbilityUI(false)
            p160:handlePeekAbilityUI(false)
            p160:handleTargetAlertAbilityUI(false)
            p160:resetPeekingEffects()
            return nil
        end
        if p161 == p160.hatterTarget then
            p160.hatterTarget = nil
            p160:handleTeleportAbilityUI(false)
            p160:handlePeekAbilityUI(false)
            p160:handleTargetAlertAbilityUI(false)
            p160:resetPeekingEffects()
            return nil
        end
    end
end
function u33.handleHatterPeek(p165, _) --[[ Line: 665 ]]
    if p165.hatterTarget then
        if not p165.hatterIsPeeking then
            local v166 = p165.hatterTarget.Character
            if v166 ~= nil then
                v166 = v166:FindFirstChildWhichIsA("Humanoid")
            end
            p165.camera.CameraSubject = v166
            p165.bloomEffect.Enabled = true
            p165.colorCorrectionEffect.Enabled = true
            p165.tweenColorCorrectionUp:Play()
            p165.tweenBloomUp:Play()
            p165.hatterIsPeeking = true
            return
        end
        p165:cleanupHatterPeek()
    end
end
function u33.cleanupHatterPeek(p167) --[[ Line: 683 ]]
    p167:resetPeekingEffects()
    p167.bloomEffect.Enabled = false
    p167.colorCorrectionEffect.Enabled = false
    p167.hatterIsPeeking = false
end
function u33.handleTargetAlertAbilityUI(p168, p169) --[[ Line: 689 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u17
        [3] = u18
    --]]
    if p169 then
        local v170 = p168.targetAlertMaid
        local v171 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v172 = u17.HATTER_TARGET_ALERT
        local v173 = {}
        for v174, v175 in u18[u17.HATTER_TARGET_ALERT].triggerConfig do
            v173[v174] = v175
        end
        v170:GiveTask(v171:enableAbility(v172, v173):expect())
    else
        local v176 = p168.targetAlertMaid
        if v176 ~= nil then
            v176:DoCleaning()
            return
        end
    end
end
function u33.handleTeleportAbilityUI(p177, p178) --[[ Line: 706 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u17
        [3] = u18
    --]]
    if p178 then
        local v179 = p177.teleportMaid
        local v180 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v181 = u17.HATTER_TELEPORT
        local v182 = {}
        for v183, v184 in u18[u17.HATTER_TELEPORT].triggerConfig do
            v182[v183] = v184
        end
        v179:GiveTask(v180:enableAbility(v181, v182):expect())
    else
        local v185 = p177.teleportMaid
        if v185 ~= nil then
            v185:DoCleaning()
            return
        end
    end
end
function u33.handlePeekAbilityUI(p186, p187) --[[ Line: 723 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u17
        [3] = u18
    --]]
    if p187 then
        local v188 = p186.peekMaid
        local v189 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v190 = u17.HATTER_PEEK
        local v191 = {}
        for v192, v193 in u18[u17.HATTER_PEEK].triggerConfig do
            v191[v192] = v193
        end
        v188:GiveTask(v189:enableAbility(v190, v191):expect())
    else
        local v194 = p186.peekMaid
        if v194 ~= nil then
            v194:DoCleaning()
            return
        end
    end
end
function u33.updateTargetHatOrb(p195, p196) --[[ Line: 740 ]]
    local v197 = p195.hatterToHatOrbMap[p196]
    if v197 == nil then
        return nil
    end
    v197.Color = Color3.new(0.8902, 0.7294, 0.0353)
end
u4.CreateController(u33.new())
return nil