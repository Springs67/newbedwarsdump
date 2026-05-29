local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.RandomUtil
local u6 = v3.SoundManager
local u7 = v3.WatchCharacter
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u9 = v8.KnitClient
local u10 = v8.KnitClient
local v11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u12 = v11.InExpo
local u13 = v11.Linear
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v17 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u18 = v17.PhysicsService
local u19 = v17.Players
local u20 = v17.ReplicatedStorage
local u21 = v17.Workspace
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u23 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u24 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "screen-shake", "screen-shake-util").ScreenShakeUtil
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u28 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u29 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "knockback-util").KnockbackUtil
local u30 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u31 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u32 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u33 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u34 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "tinker", "tinker-util").TinkerBalance
local v35 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u36 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local v37 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u38 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u39 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u40 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u41 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u42 = u1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u43 = u1.import(script, script.Parent, "tinker-armor-component").TinkerArmorComponent
local _ = {
    v37.WOOD_CHAINSAW,
    v37.IRON_CHAINSAW,
    v37.DIAMOND_CHAINSAW,
    v37.EMERALD_CHAINSAW,
    v37.VOID_CHAINSAW
}
local u44 = {
    v35.WOOD_TINKER_MECH,
    v35.IRON_TINKER_MECH,
    v35.DIAMOND_TINKER_MECH,
    v35.EMERALD_TINKER_MECH,
    v35.VOID_TINKER_MECH
}
local u45 = {
    u39.TINKER_FOOTSTEP_1,
    u39.TINKER_FOOTSTEP_2,
    u39.TINKER_FOOTSTEP_3,
    u39.TINKER_FOOTSTEP_4
}
local u46 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 52 ]]
        return "TinkerKitController"
    end,
    ["__index"] = u42
})
u46.__index = u46
function u46.new(...) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u46
    --]]
    local v47 = u46
    local v48 = setmetatable({}, v47)
    return v48:constructor(...) or v48
end
function u46.constructor(p49) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u42
        [2] = u33
        [3] = u27
        [4] = u39
        [5] = u44
        [6] = u14
    --]]
    u42.constructor(p49, u33.TINKER, {
        ["animations"] = {
            u27.TINKER_PLACE_BLOCK,
            u27.TINKER_BREAK_BLOCK,
            u27.SIT_ON_DODO_BIRD,
            u27.TINKER_AIM,
            u27.TINKER_ATTACK,
            u27.TINKER_HEAVY_ATTACK,
            u27.SUMMON_SNOW
        },
        ["sounds"] = {
            u39.TINKER_FOOTSTEP_1,
            u39.TINKER_FOOTSTEP_2,
            u39.TINKER_FOOTSTEP_3,
            u39.TINKER_FOOTSTEP_4,
            u39.TINKER_MACHINE_DEPLOY,
            u39.TINKER_EXIT,
            u39.DRILL_ATTACK_1,
            u39.TINKER_HEAVY_ATTACK,
            u39.FIREWORK_LAUNCH,
            u39.DRILL_DEPLOY,
            u39.REPAIR_LOOP
        },
        ["imageIds"] = u44
    })
    p49.Name = "TinkerKitController"
    p49.userMap = {}
    p49.abilityMaid = u14.new()
    p49.selfDestructionEnabled = false
    p49.whirlingDeathEnabled = false
    p49.mounted = false
    p49.handItemMap = {}
    p49.animationMap = {
        ["rbxassetid://4866397461"] = u27.TINKER_PLACE_BLOCK,
        ["rbxassetid://6322507715"] = u27.TINKER_BREAK_BLOCK
    }
    p49.lastAttack = -1
    p49.animationMaid = u14.new()
    p49.aimAnimationMap = {}
    p49.footStepMaid = {}
    p49.tinkerSummonMaid = u14.new()
end
function u46.KnitStart(p50) --[[ Line: 85 ]]
    --[[
    Upvalues:
        [1] = u42
    --]]
    u42.KnitStart(p50)
end
function u46.onKitLocalActivated(_, _) --[[ Line: 88 ]] end
function u46.onKitLocalDeactivated(_) --[[ Line: 90 ]] end
function u46.onKitReplicationActivated(u51, p52) --[[ Line: 92 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u19
        [3] = u28
        [4] = u27
        [5] = u38
        [6] = u10
        [7] = u14
        [8] = u23
        [9] = u31
        [10] = u36
        [11] = u41
        [12] = u39
        [13] = u45
        [14] = u32
        [15] = u6
        [16] = u2
        [17] = u16
        [18] = u43
        [19] = u21
        [20] = u25
        [21] = u1
        [22] = u30
        [23] = u9
        [24] = u33
    --]]
    u7(function(p53, p54) --[[ Line: 94 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u51
            [3] = u28
            [4] = u27
            [5] = u38
            [6] = u10
        --]]
        if p53 ~= u19.LocalPlayer then
            return nil
        end
        local v55 = p54:WaitForChild("Humanoid", 3)
        if v55 ~= nil then
            v55 = v55:WaitForChild("Animator", 3)
        end
        if v55 then
            v55.AnimationPlayed:Connect(function(p56) --[[ Line: 104 ]]
                --[[
                Upvalues:
                    [1] = u51
                    [2] = u19
                    [3] = u28
                    [4] = u27
                    [5] = u38
                    [6] = u10
                --]]
                if u51.userMap[u19.LocalPlayer] == nil then
                    return nil
                end
                local v57 = p56.Animation
                if v57 ~= nil then
                    v57 = v57.Name
                end
                local v58 = v57 == "WalkAnim"
                if not v58 then
                    local v59 = p56.Animation
                    if v59 ~= nil then
                        v59 = v59.Name
                    end
                    v58 = v59 == "RunAnim"
                end
                if v58 then
                    return nil
                end
                local v60 = p56.Animation
                if v60 ~= nil then
                    v60 = v60.AnimationId
                end
                if v60 == "" then
                    v60 = false
                end
                local v61 = not v60
                if not v61 then
                    local v62 = p56.Animation
                    if v62 ~= nil then
                        v62 = v62.AnimationId
                    end
                    v61 = v62 == u28:getAssetId(u27.SIT_ON_DODO_BIRD)
                end
                if v61 then
                    return nil
                end
                local v63 = u51.animationMap[p56.Animation.AnimationId]
                local v64 = u51.userMap[u19.LocalPlayer]
                local v65
                if v63 == 0 or v63 ~= v63 then
                    v65 = v63
                elseif v63 then
                    v65 = v64
                else
                    v65 = v63
                end
                if v65 ~= 0 and (v65 == v65 and v65) then
                    u38.Client:Get("TinkerAnimationRequest"):SendToServer({
                        ["animation"] = v63
                    })
                    u10.Controllers.MountAnimationController:playAnimationInMount(v64, v63, 2, false)
                end
                p56:Stop()
                p56:Destroy()
            end)
        end
    end)
    u38.Client:Get("TinkerAnimation"):Connect(function(p66) --[[ Line: 164 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u51
            [3] = u10
        --]]
        if p66.player == u19.LocalPlayer then
            return nil
        end
        local v67 = u51.userMap[p66.player]
        if v67 then
            local v68 = u10.Controllers.MountAnimationController
            local v69 = p66.animation
            local v70 = p66.config
            if v70 ~= nil then
                v70 = v70.speed
            end
            if p66 ~= nil then
                p66 = p66.config
                if p66 ~= nil then
                    p66 = p66.looped
                end
            end
            v68:playAnimationInMount(v67, v69, v70, p66)
        end
    end)
    u38.Client:Get("TinkerAimAnimation"):Connect(function(p71) --[[ Line: 188 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u14
            [3] = u51
            [4] = u10
            [5] = u27
        --]]
        if p71.player == u19.LocalPlayer then
            return nil
        elseif p71.beginAiming then
            local v72 = u14.new()
            local v73 = u51.userMap[p71.player]
            if not v73 then
                return nil
            end
            local u74 = u10.Controllers.MountAnimationController:playAnimationInMount(v73, u27.TINKER_AIM)
            if not u74 then
                return nil
            end
            v72:GiveTask(function() --[[ Line: 204 ]]
                --[[
                Upvalues:
                    [1] = u74
                --]]
                u74:AdjustSpeed(1)
            end)
            v72:GiveTask(u74:GetMarkerReachedSignal("stop"):Connect(function() --[[ Line: 207 ]]
                --[[
                Upvalues:
                    [1] = u74
                --]]
                u74:AdjustSpeed(0)
            end))
            u51.aimAnimationMap[p71.player] = v72
        else
            local v75 = u51.aimAnimationMap[p71.player]
            if not v75 then
                return nil
            end
            v75:DoCleaning()
        end
    end)
    p52:GiveTask(u23.GenericMountMounted:connect(function(p76) --[[ Line: 223 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u36
            [3] = u41
            [4] = u51
            [5] = u39
            [6] = u45
            [7] = u32
            [8] = u6
            [9] = u10
            [10] = u19
            [11] = u2
            [12] = u16
            [13] = u43
        --]]
        local v77 = string.match(p76.mountType, "tinker")
        if v77 ~= 0 and (v77 == v77 and (v77 ~= "" and v77)) then
            local v78 = u31:getEntity(p76.player)
            local v79 = v78 and v78:getHandItemInstanceFromCharacter()
            if v79 then
                if not u36(v79.Name).sword then
                    local v80 = v79:Clone()
                    local v81 = v80:FindFirstChild("Handle")
                    if v81 ~= nil then
                        v81 = v81:FindFirstChild("RightGripAttachment")
                    end
                    if v81 then
                        v81.Name = "Grip"
                    end
                    v80.Parent = p76.model
                    u41:weldAccessory(p76.model, v80)
                    u51.handItemMap[p76.model] = v80
                end
                v79:Destroy()
            end
            local v82 = u51:getSkin(p76.player)
            local v83 = u39.TINKER_MACHINE_DEPLOY
            local v84 = u45
            local v85
            if v82 then
                local v86 = u32[v82]
                if v86 ~= nil then
                    v86 = v86.tinker
                    if v86 ~= nil then
                        v86 = v86.sound
                        if v86 ~= nil then
                            v86 = v86.spawn
                        end
                    end
                end
                if v86 ~= "" then
                    v83 = v86 or v83
                end
                v85 = u32[v82]
                if v85 ~= nil then
                    v85 = v85.tinker
                    if v85 ~= nil then
                        v85 = v85.sound
                        if v85 ~= nil then
                            v85 = v85.footsteps
                        end
                    end
                end
                if not v85 then
                    v85 = v84
                end
            else
                v85 = v84
            end
            local v87 = u6
            local v88 = {}
            local v89 = p76.player.Character
            if v89 ~= nil then
                v89 = v89.PrimaryPart
                if v89 ~= nil then
                    v89 = v89.Position
                end
            end
            v88.position = v89
            v87:playSound(v83, v88)
            u51.userMap[p76.player] = p76.model
            local v90 = u10.Controllers.FootstepsController:hookCharacter(p76.player, p76.player.Character, {
                ["walk"] = v85,
                ["run"] = v85
            })
            u51.footStepMaid[p76.player] = v90
            if p76.player == u19.LocalPlayer then
                u51.tinkerSummonMaid:DoCleaning()
                u51.mounted = true
                u51:mountSelfRepairAbility()
                if u51.selfDestructionEnabled then
                    task.delay(0.5, function() --[[ Line: 314 ]]
                        --[[
                        Upvalues:
                            [1] = u51
                        --]]
                        u51:mountSelfDestructionAbility()
                    end)
                end
                if u51.whirlingDeathEnabled then
                    task.delay(0.2, function() --[[ Line: 319 ]]
                        --[[
                        Upvalues:
                            [1] = u51
                        --]]
                        u51:mountDeathWhirlAbility()
                    end)
                end
                u51.abilityMaid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u16.createElement(u43, {
                    ["player"] = p76.player
                })))
                u19.LocalPlayer.Character.Humanoid.CameraOffset = Vector3.new(0, 3, 0)
            end
        end
    end))
    p52:GiveTask(u23.GenericMountDismounted:connect(function(p91) --[[ Line: 332 ]]
        --[[
        Upvalues:
            [1] = u51
            [2] = u19
            [3] = u39
            [4] = u6
        --]]
        local v92 = string.match(p91.mountType, "tinker")
        if v92 ~= 0 and (v92 == v92 and (v92 ~= "" and v92)) then
            u51.userMap[p91.player] = nil
            local v93 = u51.footStepMaid[p91.player]
            if v93 ~= nil then
                v93:DoCleaning()
            end
        end
        local v94 = string.match(p91.mountType, "tinker")
        if v94 ~= 0 and (v94 == v94 and (v94 ~= "" and v94)) then
            v94 = p91.player == u19.LocalPlayer
        end
        if v94 ~= 0 and (v94 == v94 and (v94 ~= "" and v94)) then
            u51:dismountCleanUp()
            local v95 = u51:getSkinMeta(p91.player)
            if v95 ~= nil then
                v95 = v95.tinker
                if v95 ~= nil then
                    v95 = v95.sound
                    if v95 ~= nil then
                        v95 = v95.exit
                    end
                end
            end
            if v95 == "" or not v95 then
                v95 = u39.TINKER_EXIT
            end
            u6:playSound(v95)
            u19.LocalPlayer.Character.Humanoid.CameraOffset = Vector3.new(0, 0, 0)
        end
    end))
    p52:GiveTask(u23.SwordSwing:connect(function(_) --[[ Line: 369 ]]
        --[[
        Upvalues:
            [1] = u51
            [2] = u19
            [3] = u21
            [4] = u39
            [5] = u6
            [6] = u10
            [7] = u27
        --]]
        local v96 = u51.userMap[u19.LocalPlayer]
        if not v96 then
            return nil
        end
        if u51.lastAttack + 0.35 > u21:GetServerTimeNow() then
            return nil
        end
        u51.lastAttack = u21:GetServerTimeNow()
        local v97 = u51:getSkinMeta(u19.LocalPlayer)
        if v97 ~= nil then
            v97 = v97.tinker
            if v97 ~= nil then
                v97 = v97.sound
                if v97 ~= nil then
                    v97 = v97.attack
                end
            end
        end
        if v97 == "" or not v97 then
            v97 = u39.DRILL_ATTACK_1
        end
        u6:playSound(v97)
        u10.Controllers.MountAnimationController:playAnimationInMount(v96, u27.TINKER_ATTACK, 1.85)
    end))
    u38.Client:Get("TinkerSwordSwing"):Connect(function(p98) --[[ Line: 395 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u51
            [3] = u21
            [4] = u10
            [5] = u27
        --]]
        if p98.player == u19.LocalPlayer then
            return nil
        end
        local v99 = u51.userMap[p98.player]
        if not v99 then
            return nil
        end
        if u51.lastAttack + 0.4 > u21:GetServerTimeNow() then
            return nil
        end
        u51.lastAttack = u21:GetServerTimeNow()
        u10.Controllers.MountAnimationController:playAnimationInMount(v99, u27.TINKER_ATTACK, 1.5)
    end)
    u38.Client:Get("TinkerSelfDestruction"):Connect(function(p100) --[[ Line: 411 ]]
        --[[
        Upvalues:
            [1] = u51
        --]]
        u51:selfDestructEffect(p100.player, p100.active, p100.endTime, p100.secret)
    end)
    u38.Client:Get("TinkerUnlockAbility"):Connect(function(p101) --[[ Line: 414 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u51
        --]]
        local v102 = p101.ability
        if v102 == u25.TINKER_SELF_DESTRUCTION then
            u51.selfDestructionEnabled = true
            u51:mountSelfDestructionAbility()
            return
        elseif v102 == u25.WHIRLING_DEATH then
            u51.whirlingDeathEnabled = true
            u51:mountDeathWhirlAbility()
        end
    end)
    p52:GiveTask(u23.HandItemRendered:connect(function(p103) --[[ Line: 430 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u51
            [3] = u36
            [4] = u41
        --]]
        local v104 = u19:GetPlayerFromCharacter(p103.entity)
        if not v104 then
            return nil
        end
        local v105 = u51.userMap[v104]
        if not v105 then
            return nil
        end
        local v106 = u51.handItemMap[v105]
        if v106 ~= nil then
            v106:Destroy()
        end
        if u36(p103.itemType).sword then
            p103.tool:Destroy()
            return nil
        end
        local v107 = p103.tool:Clone()
        local v108 = v107:FindFirstChild("Handle")
        if v108 ~= nil then
            v108 = v108:FindFirstChild("RightGripAttachment")
        end
        if v108 then
            v108.Name = "Grip"
        end
        v107.Parent = v105
        u41:weldAccessory(v105, v107)
        u51.handItemMap[v105] = v107
        p103.tool:Destroy()
    end))
    p52:GiveTask(u23.EntityChangeHeldItem:connect(function(p109) --[[ Line: 464 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u30
            [3] = u51
        --]]
        if u1.instanceof(p109.entity, u30) then
            local v110 = p109.entity:getPlayer()
            local v111 = u51.userMap[v110]
            if not v111 then
                return nil
            end
            if not p109.item then
                local v112 = u51.handItemMap[v111]
                if v112 ~= nil then
                    v112:Destroy()
                end
            end
        end
    end))
    p52:GiveTask(u23.BeginProjectileTargeting:connect(function(p113) --[[ Line: 489 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u19
            [3] = u33
            [4] = u51
            [5] = u38
            [6] = u10
            [7] = u27
        --]]
        if p113:isCancelled() then
            return nil
        end
        if not u9.Controllers.KitController:isUsingKit(u19.LocalPlayer, u33.TINKER) then
            return nil
        end
        local v114 = u51.userMap[u19.LocalPlayer]
        if not v114 then
            return nil
        end
        u38.Client:Get("TinkerAimRequest"):SendToServer({
            ["beginAiming"] = true
        })
        local u115 = u10.Controllers.MountAnimationController:playAnimationInMount(v114, u27.TINKER_AIM)
        if not u115 then
            return nil
        end
        u51.animationMaid:GiveTask(function() --[[ Line: 509 ]]
            --[[
            Upvalues:
                [1] = u115
            --]]
            local v116 = u115
            if v116 ~= nil then
                v116:AdjustSpeed(1)
            end
        end)
        u51.animationMaid:GiveTask(u115:GetMarkerReachedSignal("stop"):Connect(function() --[[ Line: 515 ]]
            --[[
            Upvalues:
                [1] = u115
            --]]
            u115:AdjustSpeed(0)
        end))
    end))
    p52:GiveTask(u23.ProjectileTargetingEnded:connect(function(_) --[[ Line: 519 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u19
            [3] = u33
            [4] = u51
            [5] = u38
        --]]
        if not u9.Controllers.KitController:isUsingKit(u19.LocalPlayer, u33.TINKER) then
            return nil
        end
        if not u51.userMap[u19.LocalPlayer] then
            return nil
        end
        u38.Client:Get("TinkerAimRequest"):SendToServer({
            ["beginAiming"] = false
        })
        u51.animationMaid:DoCleaning()
    end))
    p52:GiveTask(u23.AbilityUsed:connect(function(p117) --[[ Line: 534 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u25
            [3] = u39
            [4] = u51
            [5] = u10
            [6] = u27
            [7] = u6
        --]]
        if p117.userCharacter == u19.LocalPlayer.Character and p117.ability == u25.WHIRLING_DEATH then
            local v118 = u39.TINKER_HEAVY_ATTACK
            local v119 = u51:getSkinMeta(u19.LocalPlayer)
            if v119 ~= nil then
                v119 = v119.tinker
                if v119 ~= nil then
                    v119 = v119.sound
                    if v119 ~= nil then
                        v119 = v119.spin
                    end
                end
            end
            if v119 ~= "" then
                v118 = v119 or v118
            end
            local v120 = u51.userMap[u19.LocalPlayer]
            if not v120 then
                return nil
            end
            u10.Controllers.MountAnimationController:playAnimationInMount(v120, u27.TINKER_HEAVY_ATTACK, 2)
            u6:playSound(v118)
        end
    end))
    u38.Client:Get("TinkerSummonEffect"):Connect(function(p121) --[[ Line: 561 ]]
        --[[
        Upvalues:
            [1] = u51
        --]]
        u51:tinkerSummonEffect(p121.player, p121.mountType)
    end)
    p52:GiveTask(u19.LocalPlayer:GetAttributeChangedSignal("SelfRepairing"):Connect(function() --[[ Line: 565 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u51
        --]]
        local v122 = u19.LocalPlayer:GetAttribute("SelfRepairing")
        if v122 == 0 or (v122 ~= v122 or (v122 == "" or not v122)) then
            u51:stopSelfRepairEffect()
        else
            u51:startSelfRepairEffect()
        end
    end))
end
function u46.onKitReplicationDeactivated(_) --[[ Line: 574 ]] end
function u46.onInnateAbilityEnabled(_, _, _) --[[ Line: 576 ]] end
function u46.onAbilityUsed(_, _, _) --[[ Line: 578 ]] end
function u46.mountSelfRepairAbility(p123) --[[ Line: 580 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u25
        [3] = u26
    --]]
    local v124 = p123.abilityMaid
    local v125 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v126 = u25.TINKER_SELF_REPAIR
    local v127 = {}
    for v128, v129 in u26[u25.TINKER_SELF_REPAIR].triggerConfig do
        v127[v128] = v129
    end
    v124:GiveTask(v125:enableAbility(v126, v127):expect())
    p123.enabledSelfRepairAbility = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u25.TINKER_SELF_REPAIR)
end
function u46.mountSelfDestructionAbility(p130) --[[ Line: 591 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u44
        [3] = u2
        [4] = u25
        [5] = u26
    --]]
    if not p130.mounted then
        return nil
    end
    local v131 = u19.LocalPlayer:GetAttribute("TinkerMachineLevel")
    local v132 = u44[(v131 == nil and 1 or v131) - 1 + 1]
    local v133 = p130.abilityMaid
    local v134 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v135 = u25.TINKER_SELF_DESTRUCTION
    local v136 = {}
    for v137, v138 in u26[u25.TINKER_SELF_DESTRUCTION].triggerConfig do
        v136[v137] = v138
    end
    v136.abilityButton = {
        ["icon"] = v132
    }
    v133:GiveTask(v134:enableAbility(v135, v136):expect())
end
function u46.mountDeathWhirlAbility(p139) --[[ Line: 613 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u25
        [3] = u26
    --]]
    if not p139.mounted then
        return nil
    end
    local v140 = p139.abilityMaid
    local v141 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v142 = u25.WHIRLING_DEATH
    local v143 = {}
    for v144, v145 in u26[u25.WHIRLING_DEATH].triggerConfig do
        v143[v144] = v145
    end
    v140:GiveTask(v141:enableAbility(v142, v143):expect())
end
function u46.mountTinkerSummonAbility(p146) --[[ Line: 626 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u44
        [3] = u2
        [4] = u25
        [5] = u26
    --]]
    local v147 = u19.LocalPlayer:GetAttribute("TinkerMachineLevel")
    local v148 = u44[(v147 == nil and 1 or v147) - 1 + 1]
    local v149 = p146.tinkerSummonMaid
    local v150 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v151 = u25.TINKER_SUMMON
    local v152 = {}
    for v153, v154 in u26[u25.TINKER_SUMMON].triggerConfig do
        v152[v153] = v154
    end
    v152.abilityButton = {
        ["icon"] = v148
    }
    v149:GiveTask(v150:enableAbility(v151, v152):expect())
    u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(u25.TINKER_SUMMON, 15)
end
function u46.dismountCleanUp(p155) --[[ Line: 646 ]]
    p155.mounted = false
    p155.abilityMaid:DoCleaning()
    p155:mountTinkerSummonAbility()
end
function u46.selfDestructEffect(_, p156, p157, u158, u159) --[[ Line: 651 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u20
        [3] = u15
        [4] = u18
        [5] = u21
        [6] = u6
        [7] = u39
        [8] = u29
        [9] = u19
        [10] = u38
        [11] = u34
    --]]
    local v160 = u9.Controllers.MountController:getMountModelFromPlayer(p156)
    local v161
    if v160 == nil then
        v161 = v160
    else
        v161 = v160.PrimaryPart
        if v161 ~= nil then
            v161 = v161.CFrame
        end
    end
    if not (v160 and v161) then
        return nil
    end
    local u162 = u20.Assets.Mounts:FindFirstChild(v160.Name)
    if u162 ~= nil then
        u162 = u162:Clone()
    end
    if not u162 then
        return nil
    end
    u15("Humanoid", {
        ["Parent"] = u162
    }):ChangeState(Enum.HumanoidStateType.Running)
    u162.PrimaryPart.CanCollide = true
    u162.PrimaryPart.Massless = false
    u18:SetPartCollisionGroup(u162.PrimaryPart, "FallingBlocks")
    u18:SetPartCollisionGroup(u162.PrimaryPart, "ItemDrops")
    u162:PivotTo(v161)
    u162.PrimaryPart.Anchored = false
    u162.Parent = u21
    local u163 = u15("Highlight", {
        ["Enabled"] = false,
        ["FillTransparency"] = 0.5,
        ["OutlineTransparency"] = 0,
        ["DepthMode"] = Enum.HighlightDepthMode.Occluded,
        ["FillColor"] = Color3.fromRGB(255, 59, 59),
        ["OutlineColor"] = Color3.fromRGB(255, 59, 59),
        ["Parent"] = u162
    })
    task.delay(0.5, function() --[[ Line: 692 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u39
            [3] = u162
            [4] = u21
            [5] = u158
            [6] = u163
        --]]
        u6:playSound(u39.TNT_HISS_1, {
            ["position"] = u162.PrimaryPart.Position
        })
        local v164 = 0
        while u162 and u21:GetServerTimeNow() < u158 do
            if v164 % 2 == 0 then
                u163.Enabled = true
                u6:playSound(u39.COUNTDOWN_TICK, {
                    ["position"] = u162:GetPivot().Position
                })
            else
                u163.Enabled = false
            end
            task.wait(0.2 - v164 * 0.01)
            v164 = v164 + 1
        end
    end)
    local u165 = u162.PrimaryPart
    if u165 ~= nil then
        u165 = u165.Position
    end
    local v166 = p157 and u159
    if v166 ~= "" and v166 then
        u29.applyKnockbackDirection(u162.PrimaryPart, u162.PrimaryPart.Mass, u162.PrimaryPart.CFrame.LookVector.Unit * 50, {
            ["horizontal"] = 1,
            ["vertical"] = 1
        })
        local v167 = u15
        local v168 = {}
        local v169 = u162.PrimaryPart:GetMass() * u21.Gravity * 0.5
        v168.Force = Vector3.new(0, v169, 0)
        v168.Parent = u162.PrimaryPart
        v167("BodyForce", v168)
        local u170 = u15("Part", {
            ["Transparency"] = 1,
            ["Anchored"] = true,
            ["CanCollide"] = false,
            ["CanQuery"] = false,
            ["CFrame"] = u162.PrimaryPart.CFrame,
            ["Parent"] = u21
        })
        u15("AlignOrientation", {
            ["Parent"] = u170,
            ["Attachment0"] = u15("Attachment", {
                ["Parent"] = u170
            }),
            ["Attachment1"] = u15("Attachment", {
                ["Parent"] = u162.PrimaryPart
            })
        })
        if p156 == u19.LocalPlayer then
            task.delay(u158 - u21:GetServerTimeNow() - 0.2, function() --[[ Line: 745 ]]
                --[[
                Upvalues:
                    [1] = u162
                    [2] = u165
                    [3] = u38
                    [4] = u159
                    [5] = u170
                --]]
                local v171 = u162.PrimaryPart
                if v171 ~= nil then
                    v171 = v171.Position
                end
                local v172 = v171 or u165
                if v172 then
                    local v173 = {
                        ["position"] = v172,
                        ["secret"] = u159
                    }
                    u38.Client:Get("TinkerActiveExplosion"):SendToServer(v173)
                end
                u170:Destroy()
            end)
        end
    end
    task.delay(u34.TIME_TO_SELF_DESTRUCT, function() --[[ Line: 764 ]]
        --[[
        Upvalues:
            [1] = u162
            [2] = u165
        --]]
        local v174 = u162.PrimaryPart
        if v174 ~= nil then
            v174 = v174.Position
        end
        u165 = v174
        u162:Destroy()
    end)
    return u162
end
function u46.tinkerSummonEffect(u175, u176, p177) --[[ Line: 774 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u21
        [3] = u4
        [4] = u28
        [5] = u27
        [6] = u22
        [7] = u13
        [8] = u6
        [9] = u39
        [10] = u34
        [11] = u12
        [12] = u45
        [13] = u5
        [14] = u40
        [15] = u24
    --]]
    local v178 = u176.Character
    local u179
    if v178 == nil then
        u179 = v178
    else
        u179 = v178.PrimaryPart
        if u179 ~= nil then
            u179 = u179.CFrame
        end
    end
    if not u179 then
        return nil
    end
    local u180 = u20.Assets.Mounts:FindFirstChild(p177)
    if u180 ~= nil then
        u180 = u180:Clone()
    end
    if not u180 then
        return nil
    end
    local v181 = v178:GetPivot()
    local v182 = v178:GetPivot().LookVector
    local v183 = Vector3.new(5)
    local v184 = v181 + Vector3.new(0, 35, 0) + v182 * v183
    local v185 = v178:GetPivot()
    local v186 = v178:GetPivot().LookVector
    local v187 = Vector3.new(5)
    local u188 = v185 + Vector3.new(0, 0, 0) + v186 * v187
    u180.Parent = u21
    u180.PrimaryPart.Anchored = true
    u180:PivotTo(v184)
    u4:playAnimation(u176, u28:getAssetId(u27.SUMMON_SNOW))
    local u189 = u20.Assets.Effects.NewYearsFireworkRocket:Clone()
    u189.Parent = u21
    u189:PivotTo(u179)
    local u190 = u179.Position + Vector3.new(0, 48, 0)
    u22(1, u13, function(p191) --[[ Line: 819 ]]
        --[[
        Upvalues:
            [1] = u179
            [2] = u190
            [3] = u189
        --]]
        local v192 = u179.Position:Lerp(u190, p191)
        u189:PivotTo(CFrame.new(v192))
        u189.Transparency = p191
    end):Play()
    u6:playSound(u39.FIREWORK_LAUNCH, {
        ["position"] = u179.Position
    })
    task.wait(0.5)
    local v193 = u34.SUMMON_DURATION
    u22(v193, u12, function(p194) --[[ Line: 831 ]]
        --[[
        Upvalues:
            [1] = u180
        --]]
        u180:PivotTo(p194)
    end, u180.PrimaryPart.CFrame, u188)
    task.delay(v193 - 0.15, function() --[[ Line: 835 ]]
        --[[
        Upvalues:
            [1] = u45
            [2] = u175
            [3] = u176
            [4] = u6
            [5] = u5
            [6] = u188
            [7] = u20
            [8] = u21
            [9] = u40
            [10] = u24
        --]]
        local v195 = u45
        local v196 = u175:getSkinMeta(u176)
        if v196 ~= nil then
            v196 = v196.tinker
            if v196 ~= nil then
                v196 = v196.sound
                if v196 ~= nil then
                    v196 = v196.footsteps
                end
            end
        end
        if v196 then
            v195 = u175:getSkinMeta(u176).tinker.sound.footsteps
        end
        u6:playSound(u5.fromList(unpack(v195)), {
            ["position"] = u188.Position
        })
        local v197 = u20.Assets.Effects.DustLandEffect:Clone()
        v197.Parent = u21
        v197.CFrame = u188
        u40:playEffects({ v197 }, nil, {
            ["destroyAfterSec"] = 3
        })
        u24.shake(u188.Position, Vector3.new(0, -1, 0), {
            ["duration"] = 0.22,
            ["magnitude"] = 0.6
        })
    end)
    task.delay(v193 + 0.4, function() --[[ Line: 868 ]]
        --[[
        Upvalues:
            [1] = u180
        --]]
        u180:Destroy()
    end)
end
function u46.startSelfRepairEffect(p198) --[[ Line: 872 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u39
        [3] = u9
        [4] = u19
    --]]
    u6:playSound(u39.DRILL_DEPLOY)
    p198.selfRepairingSound = u6:playSound(u39.REPAIR_LOOP, {
        ["looped"] = true,
        ["volumeMultiplier"] = 0.5
    })
    local v199 = u9.Controllers.MountController:getMountModelFromPlayer(u19.LocalPlayer)
    if v199 ~= nil then
        v199 = v199.PrimaryPart
    end
    for v200, v201 in v199:GetDescendants() do
        local _ = v200 - 1
        if v201:IsA("ParticleEmitter") then
            v201.Enabled = true
        end
    end
end
function u46.stopSelfRepairEffect(p202) --[[ Line: 893 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u19
    --]]
    local v203 = p202.selfRepairingSound
    if v203 ~= nil then
        v203:Stop()
    end
    local v204 = p202.selfRepairingSound
    if v204 ~= nil then
        v204:Destroy()
    end
    local v205 = u9.Controllers.MountController:getMountModelFromPlayer(u19.LocalPlayer)
    if v205 ~= nil then
        v205 = v205.PrimaryPart
    end
    for v206, v207 in v205:GetDescendants() do
        local _ = v206 - 1
        if v207:IsA("ParticleEmitter") then
            v207.Enabled = false
        end
    end
end
function u46.getSkin(_, p208) --[[ Line: 917 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v209
    if p208.Character then
        v209 = u9.Controllers.KitSkinController:getKitSkin(p208.Character)
    else
        v209 = nil
    end
    return v209
end
function u46.getSkinMeta(p210, p211) --[[ Line: 924 ]]
    --[[
    Upvalues:
        [1] = u32
    --]]
    local v212 = p210:getSkin(p211)
    if v212 then
        return u32[v212]
    else
        return nil
    end
end
u9.CreateController(u46.new())
return nil