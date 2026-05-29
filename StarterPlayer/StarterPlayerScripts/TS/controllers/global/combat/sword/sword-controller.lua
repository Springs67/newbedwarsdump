local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.DeviceUtil
local u6 = v4.GameQueryUtil
local u7 = v4.MobileTouchType
local u8 = v4.RandomUtil
local u9 = v4.SoundManager
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.CollectionService
local u15 = v13.HttpService
local u16 = v13.Players
local u17 = v13.RunService
local u18 = v13.UserInputService
local u19 = v13.Workspace
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local v25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "combat-constant")
local u26 = v25.CombatConstant
local u27 = v25.SwordsConstants
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").getItemSkinMeta
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "base-weapon", "base-weapon-balance").BaseWeaponBalance
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil
local u37 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "id-util").IdUtil
local u38 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u39 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 46 ]]
        return "SwordController"
    end,
    ["__index"] = u21
})
u39.__index = u39
function u39.new(...) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u39
    --]]
    local v40 = u39
    local v41 = setmetatable({}, v40)
    return v41:constructor(...) or v41
end
function u39.constructor(p42) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u12
        [3] = u37
    --]]
    u21.constructor(p42)
    p42.Name = "SwordController"
    p42.maid = u12.new()
    p42.lastAttack = 0
    p42.lastSwing = 0
    p42.bufferedMobileAttack = false
    p42.thirdPersonAnimPlaying = false
    p42.disableSwingState = false
    p42.holdAutoSwingMaid = u12.new()
    p42.holdAutoSwingDisabled = false
    p42.swordActionIdHandler = u37.IncrementingId.new(0, 65535, true)
    p42.activeSwordActionId = p42.swordActionIdHandler:getCurrId()
    p42.swingCounter = 0
    p42.lastChargedAttackTimeMap = {}
end
function u39.KnitStart(u43) --[[ Line: 72 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u20
        [3] = u11
        [4] = u32
        [5] = u19
        [6] = u27
        [7] = u18
    --]]
    u21.KnitStart(u43)
    u20.SwordSwing:setPriority(u11.NORMAL - 1):connect(function(p44) --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u19
            [3] = u43
            [4] = u27
        --]]
        if p44:isCancelled() then
            return nil
        end
        local v45 = u32(p44.swordType)
        local v46 = u32(p44.swordType).sword
        local v47 = p44.attackSpeed
        local v48 = u19:GetServerTimeNow() - u43.lastAttack
        if v48 < v47 then
            local v49 = (v47 - v48) * 1.01
            local v50 = v47 * u27.swordSwingBufferMultiplier
            local v51 = v49 < math.min(v50, 0.2)
            local v52 = not (v46.respectAttackSpeedForEffects or v46.applyCooldownOnMiss)
            if v52 then
                v52 = v46.skipSwingEffects ~= true
            end
            if v52 then
                local v53 = p44.config
                if v53 ~= nil then
                    v53 = v53.respectAttackSpeedOverride
                end
                v52 = not v53
            end
            if v52 then
                local v54 = u43
                local v55 = p44.chargedAttack
                if v55 ~= nil then
                    v55 = v55.chargeRatio
                end
                local v56 = (v55 == nil and 0 or v55) >= 1
                local v57 = {}
                local v58 = p44.config
                if v58 ~= nil then
                    v58 = v58.itemSkin
                end
                v57.itemSkin = v58
                v54:playSwordEffect(v45, v56, v57)
            end
            if v51 then
                p44:bufferAttack(v49)
            end
            p44:setCancelled(true)
        end
    end)
    u18.GamepadDisconnected:Connect(function() --[[ Line: 124 ]]
        --[[
        Upvalues:
            [1] = u43
        --]]
        print("[Sword-Gamepad] Disconnected")
        u43.activeSwordActionId = -1
        u43.holdAutoSwingMaid:DoCleaning()
    end)
end
function u39.isRelevantItem(_, p59) --[[ Line: 130 ]]
    --[[
    Upvalues:
        [1] = u32
    --]]
    return u32(p59.itemType).sword ~= nil
end
function u39.bufferMobileAttack(p60) --[[ Line: 134 ]]
    p60.bufferedMobileAttack = true
end
function u39.mobileSwingPressed(p61) --[[ Line: 137 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u20
        [3] = u10
        [4] = u19
    --]]
    if p61.disableSwingState then
        return nil
    else
        local v62 = u16.LocalPlayer:GetAttribute("IsCasting")
        if v62 == 0 or (v62 ~= v62 or (v62 == "" or not v62)) then
            u20.SwordSwingDown:fire()
            if u10.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
                p61:swingSwordAtViewportPoint(u19.CurrentCamera.ViewportSize / 2)
                return
            elseif u10.Controllers.MobileShiftLockController:isEnabled() then
                p61:swingSwordAtViewportPoint(u19.CurrentCamera.ViewportSize / 2)
            else
                p61:swingSwordAtMouse()
            end
        else
            return nil
        end
    end
end
function u39.canSee(_, p63) --[[ Line: 156 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u6
        [3] = u14
    --]]
    local v64 = u16.LocalPlayer.Character
    if not v64 then
        return false
    end
    if not p63 then
        return false
    end
    local v65 = v64:FindFirstChildWhichIsA("Humanoid")
    if v65 ~= nil then
        v65 = v65:FindFirstChild("BodyHeightScale")
    end
    if v65 ~= nil then
        v65 = v65.Value
    end
    local v66 = 5 * (v65 == nil and 1 or v65)
    local v67
    if v64.PrimaryPart then
        local v68 = v64:FindFirstChildWhichIsA("Humanoid")
        local v69 = not v68 and 0 or v68.HipHeight
        local v70 = v64.PrimaryPart.Position
        local v71 = -1 * (v69 + v64.PrimaryPart.Size.Y / 2)
        v67 = v70 + Vector3.new(0, v71, 0)
    else
        v67 = nil
    end
    local v72 = p63:getInstance()
    local v73
    if v72.PrimaryPart then
        local v74 = v72:FindFirstChildWhichIsA("Humanoid")
        local v75 = not v74 and 0 or v74.HipHeight
        local v76 = v72.PrimaryPart.Position
        local v77 = -1 * (v75 + v72.PrimaryPart.Size.Y / 2)
        v73 = v76 + Vector3.new(0, v77, 0)
    else
        v73 = nil
    end
    if not (v67 and v73) then
        return false
    end
    local v78 = v67 + Vector3.new(0, v66, 0)
    local v79 = v73 + Vector3.new(0, v66, 0)
    local v80 = { v64, p63:getInstance() }
    local v81 = #v80
    local v82 = u14:GetTagged("DontBlockSwordRaycast")
    table.move(v82, 1, #v82, v81 + 1, v80)
    local v83 = RaycastParams.new()
    v83.FilterDescendantsInstances = v80
    v83.FilterType = Enum.RaycastFilterType.Blacklist
    local v84 = u6:raycast(v67, v73 - v67, v83) ~= nil
    if not v84 then
        local v85 = RaycastParams.new()
        v85.FilterDescendantsInstances = v80
        v85.FilterType = Enum.RaycastFilterType.Blacklist
        v84 = u6:raycast(v73, v67 - v73, v85) ~= nil
    end
    local v86 = not v84
    if not v86 then
        local v87 = RaycastParams.new()
        v87.FilterDescendantsInstances = v80
        v87.FilterType = Enum.RaycastFilterType.Blacklist
        local v88 = u6:raycast(v78, v79 - v78, v87) ~= nil
        if not v88 then
            local v89 = RaycastParams.new()
            v89.FilterDescendantsInstances = v80
            v89.FilterType = Enum.RaycastFilterType.Blacklist
            v88 = u6:raycast(v79, v78 - v79, v89) ~= nil
        end
        v86 = not v88
        if not v86 then
            local v90 = (v67 + v78) / 2
            local v91 = (v73 + v79) / 2
            local v92 = RaycastParams.new()
            v92.FilterDescendantsInstances = v80
            v92.FilterType = Enum.RaycastFilterType.Blacklist
            local v93 = u6:raycast(v90, v91 - v90, v92) ~= nil
            if not v93 then
                local v94 = RaycastParams.new()
                v94.FilterDescendantsInstances = v80
                v94.FilterType = Enum.RaycastFilterType.Blacklist
                v93 = u6:raycast(v91, v90 - v91, v94) ~= nil
            end
            v86 = not v93
        end
    end
    return v86
end
function u39.attackEntity(u95, u96, u97, p98, p99) --[[ Line: 222 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u19
        [3] = u32
        [4] = u20
        [5] = u26
        [6] = u12
        [7] = u2
        [8] = u28
        [9] = u34
    --]]
    local v100 = u16.LocalPlayer.Character
    if v100 ~= nil then
        v100 = v100.PrimaryPart
    end
    if not (v100 and u19.CurrentCamera) then
        return false
    end
    local v101 = u95:getHandItem()
    if v101 ~= nil then
        v101 = v101.tool
    end
    if not v101 then
        return false
    end
    local v102 = u32(v101.Name)
    local v103 = u20.BeforeSwordSwing:fire(v101.Name, v102).weaponMetaClone
    if v103 ~= nil then
        v103 = v103.sword
    end
    local v104 = v101:GetAttribute("ItemSkin")
    if v104 == "" then
        v104 = nil
    end
    if not v103 then
        return false
    end
    if u96 then
        local v105 = u96:getInstance()
        if not (v105.Parent and v105.PrimaryPart) then
            return false
        end
        local v106 = (u16.LocalPlayer.Character.PrimaryPart.Position - v105.PrimaryPart.Position).Magnitude
        local v107
        if v103 then
            v107 = v103.attackRange
        else
            v107 = v103
        end
        local v108
        if v107 == 0 or (v107 ~= v107 or not v107) then
            v108 = u26.RAYCAST_SWORD_CHARACTER_DISTANCE
        else
            v108 = v103.attackRange
        end
        if v108 + 2 <= v106 then
            return false
        end
    end
    local v109 = 0
    local v110 = v103.chargedAttack
    if v110 then
        if p98 == nil then
            v110 = p98
        else
            v110 = p98.chargeTime
        end
    end
    if v110 ~= 0 and (v110 == v110 and v110) then
        local v111 = math
        local v112 = p98.chargeTime
        local v113 = v103.chargedAttack
        if v113 ~= nil then
            v113 = v113.maxChargeTimeSec
        end
        local v114 = v112 / v113
        v109 = v111.clamp(v114, 0, 1)
    end
    local u115 = u20.SwordSwing:fire(u96, v101.Name, v103.attackSpeed, v109 ~= 0 and (v109 == v109 and v109) and {
        ["chargeRatio"] = v109
    } or nil, {
        ["itemSkin"] = v104
    })
    if u115.bufferTime ~= nil then
        local u116 = true
        u95.maid:GiveTask(function() --[[ Line: 293 ]]
            --[[
            Upvalues:
                [1] = u116
            --]]
            u116 = false
        end)
        task.delay(u115.bufferTime, function() --[[ Line: 296 ]]
            --[[
            Upvalues:
                [1] = u116
                [2] = u96
                [3] = u115
                [4] = u95
                [5] = u97
            --]]
            if not u116 then
                return nil
            end
            if u96 then
                local v117 = u115.config
                if v117 ~= nil then
                    v117 = v117.respectAttackSpeedOverride
                end
                local v118 = v117 == true
                if u95:attackEntity(u96, u97, nil, {
                    ["playAnimation"] = v118,
                    ["playSound"] = v118
                }) then
                    return nil
                end
            end
            u95:swingSwordInRegion()
        end)
    end
    if u115:isCancelled() then
        return false
    end
    if u20.PerformCombat:fire():isCancelled() then
        return false
    end
    local v119 = v102.sword
    if v119 ~= nil then
        v119 = v119.skipSwingEffects
    end
    if not v119 then
        local v120 = v109 >= 1
        local v121 = {}
        local v122
        if p99 == nil then
            v122 = p99
        else
            v122 = p99.playAnimation
        end
        v121.playAnimation = v122
        if p99 ~= nil then
            p99 = p99.playSound
        end
        v121.playSound = p99
        v121.itemSkin = v104
        u95:playSwordEffect(v102, v120, v121)
    end
    if v103.cooldown ~= nil then
        if u95.cooldownMaid ~= nil then
            u95.cooldownMaid:DoCleaning()
        end
        u95.cooldownMaid = u12.new()
        u95.cooldownMaid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(u28.SWORD))
        u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(u28.SWORD, u32(v101.Name).sword.attackSpeed, v103.cooldown)
        u95.cooldownMaid:GiveTask(function() --[[ Line: 352 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u28
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):removeCooldown(u28.SWORD)
        end)
    end
    if v109 == 1 then
        u95.lastChargedAttackTimeMap[v101.Name] = u19:GetServerTimeNow()
    end
    if u96 then
        u95.lastAttack = u19:GetServerTimeNow()
        u95:sendServerRequest(u96, v109, {
            ["rayDirection"] = u97
        })
    else
        if v103.applyCooldownOnMiss == true then
            u95.lastAttack = u19:GetServerTimeNow()
        end
        local v123 = v103.multiHitCheckDurationSec
        if v123 == 0 or (v123 ~= v123 or not v123) then
            u34.Client:Get("SwordSwingMiss"):SendToServer({
                ["weapon"] = v101,
                ["chargeRatio"] = v109
            })
        end
    end
    return true
end
function u39.playSwordEffect(u124, u125, p126, u127) --[[ Line: 383 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u35
        [3] = u30
        [4] = u8
        [5] = u23
        [6] = u16
        [7] = u10
        [8] = u9
        [9] = u32
    --]]
    local v128 = u125.sword
    if v128 ~= nil then
        v128 = v128.swingAnimations
    end
    local u129 = v128 == nil and { u22.SWORD_SWING } or v128
    local v130 = u125.sword
    if v130 ~= nil then
        v130 = v130.firstPersonSwingAnimations
    end
    local u131 = v130 == nil and { u22.FP_SWING_SWORD } or v130
    local v132 = u125.sword
    if v132 ~= nil then
        v132 = v132.swingSounds
    end
    local u133 = v132 == nil and { u35.SWORD_SWING_1, u35.SWORD_SWING_2 } or v132
    local v134
    if u127 == nil then
        v134 = u127
    else
        v134 = u127.itemSkin
    end
    if v134 then
        local v135 = u30(u127.itemSkin)
        if v135 ~= nil then
            v135 = v135.sword
            if v135 ~= nil then
                v135 = v135.swingSounds
            end
        end
        u133 = v135 or u133
    end
    if p126 then
        u129 = { u22.NEW_SWORD_SWING }
        u131 = { u22.NEW_SWORD_SWING_FP }
    end
    local v136 = u125.sword
    if v136 ~= nil then
        v136 = v136.chargedAttack
    end
    if v136 then
        if p126 and v136.chargedSwingAnimations then
            u129 = v136.chargedSwingAnimations
        end
        if p126 and v136.firstPersonChargedSwingAnimations then
            u131 = v136.firstPersonChargedSwingAnimations
        end
        if p126 and v136.chargedSwingSounds then
            u133 = v136.chargedSwingSounds
        end
    end
    local function v161(_) --[[ Line: 451 ]]
        --[[
        Upvalues:
            [1] = u125
            [2] = u124
            [3] = u129
            [4] = u8
            [5] = u127
            [6] = u23
            [7] = u16
            [8] = u10
            [9] = u131
            [10] = u133
            [11] = u9
        --]]
        local v137 = false
        local v138 = u125.sword
        if v138 ~= nil then
            v138 = v138.randomizeSwingAnimations
        end
        if v138 == nil then
            v138 = false
        end
        if not u124.thirdPersonAnimPlaying then
            local _ = u129[1]
            local v139
            if v138 then
                local v140 = u129
                v139 = u8.fromList(unpack(v140))
            else
                local v141 = u129
                local v142 = u124.swingCounter
                local v143 = #u129 - 1
                v139 = v141[math.min(v142, v143) + 1]
            end
            local v144 = u125.sword
            if v144 ~= nil then
                v144 = v144.swingAnimations
            end
            if v144 then
                v144 = #u125.sword.swingAnimations == 0
            end
            if v144 then
                return nil
            end
            v137 = true
            local v145 = u127
            if v145 ~= nil then
                v145 = v145.playAnimation
            end
            if v145 ~= false then
                local v146 = {
                    ["fadeSamePriorityTracks"] = false
                }
                local v147 = u127
                if v147 ~= nil then
                    v147 = v147.character
                end
                local v148
                if v147 then
                    local v149 = u23
                    local v150 = u127
                    if v150 ~= nil then
                        v150 = v150.character
                    end
                    v148 = v149:playAnimation(v150, v139, v146)
                else
                    v148 = u23:playAnimation(u16.LocalPlayer, v139, v146)
                end
                if v148 then
                    v148.Stopped:Connect(function() --[[ Line: 506 ]]
                        --[[
                        Upvalues:
                            [1] = u124
                        --]]
                        u124.thirdPersonAnimPlaying = false
                    end)
                else
                    u124.thirdPersonAnimPlaying = false
                end
            end
        end
        if u10.Controllers.ViewmodelController:isVisible() then
            v137 = true
            local _ = u131[1]
            local v151
            if v138 then
                local v152 = u131
                v151 = u8.fromList(unpack(v152))
            else
                local v153 = u131
                local v154 = u124.swingCounter
                local v155 = #u131 - 1
                v151 = v153[math.min(v154, v155) + 1]
            end
            local v156 = u127
            if v156 ~= nil then
                v156 = v156.playAnimation
            end
            if v156 ~= false then
                u10.Controllers.ViewmodelController:playAnimation(v151)
            end
        end
        if v137 then
            if u124.swingCounter + 1 < #u129 then
                local v157 = u124
                v157.swingCounter = v157.swingCounter + 1
            else
                u124.swingCounter = 0
            end
            local v158 = #u133 ~= 0
            if v158 then
                local v159 = u127
                if v159 ~= nil then
                    v159 = v159.playSound
                end
                v158 = v159 ~= false
            end
            if v158 then
                local v160 = u133
                u9:playSound(u8.fromList(unpack(v160)))
            end
        end
    end
    local v162 = u124:getHandItem()
    if v162 ~= nil then
        v162 = v162.tool
    end
    if not v162 then
        return nil
    end
    local v163 = u32(v162.Name).sword.chargedAttack
    if v163 ~= nil then
        v163 = v163.ignoreEffectsOnFullyCharged
    end
    local v164 = v163 == true
    if v164 then
        v164 = p126
    end
    if v164 then
        return nil
    end
    v161(v162)
end
function u39.swingSwordAtViewportPoint(p165, p166) --[[ Line: 573 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u16
        [3] = u32
        [4] = u19
        [5] = u26
    --]]
    if p165:isClickingTooFast() then
        return nil
    end
    local v167 = p165:getHandItem()
    if not v167 then
        return nil
    end
    local v168 = u29:getEntity(u16.LocalPlayer)
    if not v168 then
        return nil
    end
    local v169 = u32(v167.itemType).sword
    local v170 = u16.LocalPlayer.Character
    if v170 ~= nil then
        v170 = v170.PrimaryPart
    end
    if not v170 then
        return nil
    end
    local v171 = u19.CurrentCamera:ViewportPointToRay(p166.X, p166.Y)
    local v172 = RaycastParams.new()
    v172.FilterDescendantsInstances = { u16.LocalPlayer.Character }
    v172.FilterType = Enum.RaycastFilterType.Exclude
    local v173 = u19:Raycast(v171.Origin, v171.Direction * 200, v172)
    local v174
    if v173 == nil then
        v174 = v173
    else
        v174 = v173.Instance
    end
    if v174 then
        local v175 = (u16.LocalPlayer.Character.PrimaryPart.Position - v173.Instance.Position).Magnitude
        local v176
        if v169 then
            v176 = v169.attackRange
        else
            v176 = v169
        end
        local v177
        if v176 == 0 or (v176 ~= v176 or not v176) then
            v177 = u26.RAYCAST_SWORD_CHARACTER_DISTANCE
        else
            v177 = v169.attackRange
        end
        if v175 <= v177 then
            local v178 = u29:getEntity(v173.Instance)
            if v178 and (v168:canAttack(v178) and p165:canSee(v178)) then
                p165:attackEntity(v178, v171.Direction)
                return nil
            end
        end
    end
    p165:swingSwordInRegion()
end
function u39.swingSwordAtMouse(p179, p180) --[[ Line: 622 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u16
        [3] = u32
        [4] = u19
        [5] = u26
    --]]
    if p179:isClickingTooFast() then
        return nil
    end
    local v181 = p179:getHandItem()
    if not v181 then
        return nil
    end
    local v182 = u29:getEntity(u16.LocalPlayer)
    if not v182 then
        return nil
    end
    local v183 = u32(v181.itemType).sword
    local v184 = u16.LocalPlayer.Character
    if v184 ~= nil then
        v184 = v184.PrimaryPart
    end
    if not v184 then
        return nil
    end
    local v185 = RaycastParams.new()
    v185.FilterDescendantsInstances = { u16.LocalPlayer.Character }
    v185.FilterType = Enum.RaycastFilterType.Blacklist
    local v186 = u16.LocalPlayer:GetMouse()
    local v187 = v186.UnitRay.Direction
    local v188 = u19:Raycast(v186.UnitRay.Origin, v187 * 200, v185)
    local v189
    if v188 == nil then
        v189 = v188
    else
        v189 = v188.Instance
    end
    if v189 then
        local v190 = (u16.LocalPlayer.Character.PrimaryPart.Position - v188.Instance.Position).Magnitude
        local v191
        if v183 then
            v191 = v183.attackRange
        else
            v191 = v183
        end
        local v192
        if v191 == 0 or (v191 ~= v191 or not v191) then
            v192 = u26.RAYCAST_SWORD_CHARACTER_DISTANCE
        else
            v192 = v183.attackRange
        end
        if v190 <= v192 then
            local v193 = u29:getEntity(v188.Instance)
            if v193 and (v182:canAttack(v193) and p179:canSee(v193)) then
                p179:attackEntity(v193, v187, p180 ~= 0 and (p180 == p180 and p180) and {
                    ["chargeTime"] = p180
                } or nil)
                return nil
            end
        end
    end
    p179:swingSwordInRegion(p180)
end
function u39.swingSwordInRegion(p194, p195) --[[ Line: 672 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u32
        [3] = u24
        [4] = u5
        [5] = u26
        [6] = u19
    --]]
    if not u29:getLocalPlayerEntity() then
        return nil
    end
    local v196 = p194:getHandItem()
    if v196 ~= nil then
        v196 = v196.tool
    end
    if not v196 then
        return nil
    end
    local v197 = u32(v196.Name).sword
    local v198 = 3.8 * u24
    local v199 = v197.attackRange
    if v199 == 0 or (v199 ~= v199 or not v199) then
        if u5.isMobileControls() then
            v198 = u26.REGION_SWORD_CHARACTER_DISTANCE
        end
    else
        v198 = v197.attackRange
    end
    local v200 = v197.multiHitCheckDurationSec
    local v201 = v200 == nil and 0 or v200
    local v202 = p194:getTargetInRegion(v198, p195)
    if not p194:attackEntity(v202, nil, p195 ~= 0 and (p195 == p195 and p195) and {
        ["chargeTime"] = p195
    } or nil) then
        return nil
    end
    if v202 or v201 == 0 then
        return nil
    end
    local v203 = u19:GetServerTimeNow()
    local v204 = v201 / 0.1
    local v205 = math.ceil(v204)
    local v206 = false
    local v207 = 0
    while true do
        if v206 then
            v207 = v207 + 1
        else
            v206 = true
        end
        if v207 >= v205 then
            return
        end
        task.wait((math.min(0.1, v201)))
        v201 = v201 - 0.1
        local v208 = p194:getTargetInRegion(v198, p195)
        local v209 = v197.chargedAttack and p195
        local v210
        if v209 == 0 or (v209 ~= v209 or not v209) then
            v210 = 0
        else
            local v211 = math
            local v212 = v197.chargedAttack
            if v212 ~= nil then
                v212 = v212.maxChargeTimeSec
            end
            local v213 = p195 / v212
            v210 = v211.clamp(v213, 0, 1)
        end
        if v208 then
            p194:sendServerRequest(v208, v210, {
                ["swingStartTime"] = v203
            })
            return
        end
    end
end
function u39.onEnable(u214, u215) --[[ Line: 750 ]]
    --[[
    Upvalues:
        [1] = u32
        [2] = u23
        [3] = u16
        [4] = u18
        [5] = u20
        [6] = u15
        [7] = u2
        [8] = u31
        [9] = u17
        [10] = u7
        [11] = u10
    --]]
    local u216 = u32(u215.itemType)
    local u217 = u216.sword
    if u217 ~= nil then
        u217 = u217.idleAnimation
    end
    if u217 ~= 0 and (u217 == u217 and u217) then
        u214:setupYield(function() --[[ Line: 758 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u16
                [3] = u217
            --]]
            local u218 = u23:playAnimation(u16.LocalPlayer, u217, {
                ["looped"] = true
            })
            return function() --[[ Line: 762 ]]
                --[[
                Upvalues:
                    [1] = u218
                --]]
                local v219 = u218
                if v219 ~= nil then
                    v219:Stop()
                end
                local v220 = u218
                if v220 ~= nil then
                    v220:Destroy()
                end
            end
        end)
    end
    if u18.TouchEnabled then
        u214.maid:GiveTask(u20.MobileSwordButtonPressed:connect(function(p221) --[[ Line: 775 ]]
            --[[
            Upvalues:
                [1] = u216
                [2] = u214
            --]]
            if p221.state == "up" then
                local v222 = u216.sword
                if v222 ~= nil then
                    v222 = v222.chargedAttack
                end
                if v222 == nil then
                    u214:mobileSwingPressed()
                end
            end
        end))
    end
    local v223 = "swing-sword-" .. u15:GenerateGUID(false)
    local v224 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController")
    local v233 = {
        ["action"] = "Attack",
        ["actionId"] = v223,
        ["boundFunction"] = function(_, p225, p226) --[[ Name: boundFunction, Line 793 ]]
            --[[
            Upvalues:
                [1] = u214
                [2] = u16
                [3] = u216
                [4] = u31
                [5] = u17
                [6] = u20
            --]]
            if u214.disableSwingState then
                return nil
            end
            u214.activeSwordActionId = u214.swordActionIdHandler:getNextId()
            if p225 == Enum.UserInputState.Begin then
                local v227 = u16.LocalPlayer:GetAttribute("IsCasting")
                if v227 ~= 0 and (v227 == v227 and (v227 ~= "" and v227)) then
                    return nil
                end
                local v228 = u216.sword
                if v228 ~= nil then
                    v228 = v228.chargedAttack
                end
                if v228 == nil then
                    u214:swingSwordAtMouse()
                    if p226.UserInputType == Enum.UserInputType.Gamepad1 and not u214.holdAutoSwingDisabled then
                        local v229 = u216.sword
                        if v229 ~= nil then
                            v229 = v229.attackSpeed
                        end
                        if v229 == nil then
                            v229 = u31.SWORD_SWING_COOLDOWN
                        end
                        local u230 = v229 * 0.5
                        task.delay(u230, function() --[[ Line: 823 ]]
                            --[[
                            Upvalues:
                                [1] = u214
                                [2] = u17
                                [3] = u230
                            --]]
                            if u214.activeSwordActionId ~= u214.swordActionIdHandler:getCurrId() then
                                return nil
                            end
                            u214.holdAutoSwingMaid:DoCleaning()
                            local u231 = 0
                            u214:swingSwordAtMouse()
                            u214.holdAutoSwingMaid:GiveTask(u17.Heartbeat:Connect(function(p232) --[[ Line: 831 ]]
                                --[[
                                Upvalues:
                                    [1] = u231
                                    [2] = u230
                                    [3] = u214
                                --]]
                                if u230 < u231 then
                                    if u214.holdAutoSwingDisabled then
                                        u214.holdAutoSwingMaid:DoCleaning()
                                        return nil
                                    end
                                    u214:swingSwordAtMouse()
                                    u231 = 0
                                else
                                    u231 = u231 + p232
                                end
                            end))
                        end)
                    end
                end
                u20.SwordSwingDown:fire()
            elseif p225 == Enum.UserInputState.End then
                u20.SwordSwingUp:fire()
                u214.activeSwordActionId = -1
                u214.holdAutoSwingMaid:DoCleaning()
            end
            return Enum.ContextActionResult.Pass
        end,
        ["mobile"] = {
            ["touchType"] = u7.TouchTap,
            ["mobileBoundFunction"] = function(_) --[[ Name: mobileBoundFunction, Line 858 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u215
                    [3] = u214
                --]]
                if u10.Controllers.SwordChargeController:isWeaponCharging(u215.itemType) then
                    return nil
                end
                u214:mobileSwingPressed()
            end
        }
    }
    local v234 = v224:bindAction(v233)
    u214.maid:GiveTask(v234)
    if u214.bufferedMobileAttack then
        u214.bufferedMobileAttack = false
        u214:setupYield(function() --[[ Line: 870 ]]
            --[[
            Upvalues:
                [1] = u214
            --]]
            u214:mobileSwingPressed()
            return function() --[[ Line: 872 ]] end
        end)
    end
end
function u39.onDisable(p235) --[[ Line: 876 ]]
    p235.maid:DoCleaning()
end
function u39.toggleSwordSwing(p236, p237) --[[ Line: 879 ]]
    p236.disableSwingState = p237
end
function u39.getSwordSwingDisabled(p238) --[[ Line: 882 ]]
    return p238.disableSwingState
end
function u39.isClickingTooFast(p239) --[[ Line: 885 ]]
    if tick() - p239.lastSwing < 0.1111111111111111 then
        return true
    end
    p239.lastSwing = tick()
    return false
end
function u39.isOnChargeAttackCooldown(p240, p241) --[[ Line: 892 ]]
    --[[
    Upvalues:
        [1] = u32
    --]]
    local v242 = u32(p241).sword
    if v242 ~= nil then
        v242 = v242.chargedAttack
    end
    if v242 then
        if v242.attackCooldown == nil then
            return false
        else
            return p240:getRemainingSwingCooldown(p241) > 0 or (p240:getRemainingChargeCooldown(p241) > 0 or p240:getRemainingCastingTime() > 0)
        end
    else
        return false
    end
end
function u39.getRemainingChargeCooldown(p243, p244) --[[ Line: 912 ]]
    --[[
    Upvalues:
        [1] = u32
        [2] = u3
        [3] = u19
    --]]
    local v245 = u32(p244).sword
    if v245 ~= nil then
        v245 = v245.chargedAttack
    end
    if not v245 or v245.attackCooldown == nil then
        return 0
    end
    local v246 = u3.getOrCreate(p243.lastChargedAttackTimeMap, p244, 0)
    if v246 == 0 then
        return 0
    end
    local v247 = v246 + v245.attackCooldown - u19:GetServerTimeNow()
    return math.max(v247, 0)
end
function u39.getRemainingCastingTime(_) --[[ Line: 929 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u19
    --]]
    local v248 = u16.LocalPlayer:GetAttribute("IsCasting")
    if v248 == 0 or (v248 ~= v248 or not v248) then
        return 0
    end
    if v248 == true then
        return 0.3
    end
    local v249 = v248 - u19:GetServerTimeNow()
    local v250
    if v249 == 0 or (v249 ~= v249 or not v249) then
        v250 = v249
    else
        v250 = v249 > 0
    end
    return (v250 == 0 or (v250 ~= v250 or not v250)) and 0 or v249
end
function u39.getRemainingSwingCooldown(p251, p252) --[[ Line: 947 ]]
    --[[
    Upvalues:
        [1] = u32
        [2] = u19
    --]]
    local v253 = u32(p252).sword
    if not v253 then
        return 0
    end
    if p251.lastAttack == 0 then
        return 0
    end
    local v254 = p251.lastAttack + v253.attackSpeed - u19:GetServerTimeNow()
    return math.max(v254, 0)
end
function u39.getTargetInRegion(p255, p256, _) --[[ Line: 960 ]]
    --[[
    Upvalues:
        [1] = u38
        [2] = u10
        [3] = u33
        [4] = u16
        [5] = u29
        [6] = u36
    --]]
    if not u38.isGameServer() or u10.Controllers.MatchController:getMatchState() ~= u33.RUNNING then
        return nil
    end
    local v257 = 1.5
    local v258 = u16.LocalPlayer.Character
    if v258 ~= nil then
        v258 = v258.PrimaryPart
    end
    if not v258 then
        return nil
    end
    local v259 = u16.LocalPlayer.Character:FindFirstChild("Humanoid")
    if v259 then
        v257 = v259.HipHeight
    end
    local v260 = u29:getLocalPlayerEntity()
    if not v260 then
        return nil
    end
    local v261 = u16.LocalPlayer.Character.PrimaryPart.Position + u16.LocalPlayer.Character.PrimaryPart.CFrame.LookVector.Unit * (p256 / 2)
    local v262 = p256 / 2
    local v263 = math.max(3, v257)
    local v264 = p256 / 2
    local v265 = v261 - Vector3.new(v262, v263, v264)
    local v266 = p256 / 2
    local v267 = math.max(3, v257)
    local v268 = p256 / 2
    local v269 = Vector3.new(v266, v267, v268)
    local v270 = Region3.new(v265, v261 + v269)
    for _, v271 in u36.getEntitiesWithinBox(v270.CFrame, v270.Size) do
        local v272 = v271:getInstance()
        local v273 = v272.PrimaryPart
        if v273 and (v272 ~= u16.LocalPlayer.Character and (v260:canAttack(v271) and (p256 >= (v273.Position - u16.LocalPlayer.Character.PrimaryPart.Position).Magnitude and p255:canSee(v271)))) then
            return v271
        end
    end
end
function u39.sendServerRequest(p274, p275, p276, p277) --[[ Line: 1012 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u19
        [3] = u34
    --]]
    local v278 = u16.LocalPlayer.Character
    if v278 ~= nil then
        v278 = v278.PrimaryPart
    end
    if not (v278 and u19.CurrentCamera) then
        return false
    end
    local v279 = p274:getHandItem()
    if v279 ~= nil then
        v279 = v279.tool
    end
    if not v279 then
        return false
    end
    local v280 = u19.CurrentCamera.CFrame.Position
    local v281 = p275:getInstance():GetPivot().Position
    local v282 = u16.LocalPlayer.Character:GetPivot().Position
    local v283
    if p277 == nil then
        v283 = p277
    else
        v283 = p277.rayDirection
    end
    local v284 = v283 and {
        ["cameraPosition"] = {
            ["value"] = v280
        },
        ["cursorDirection"] = {
            ["value"] = p277.rayDirection
        }
    } or nil
    local v285 = u34.Client:Get("SwordHit")
    local v286 = {
        ["weapon"] = v279,
        ["entityInstance"] = p275:getInstance(),
        ["validate"] = {
            ["raycast"] = v284,
            ["targetPosition"] = {
                ["value"] = v281
            },
            ["selfPosition"] = {
                ["value"] = v282
            }
        },
        ["chargedAttack"] = {
            ["chargeRatio"] = p276
        }
    }
    local v287
    if p277 == nil then
        v287 = p277
    else
        v287 = p277.swingStartTime
    end
    local v288
    if v287 == 0 or (v287 ~= v287 or not v287) then
        v288 = nil
    else
        v288 = u19:GetServerTimeNow() - p277.swingStartTime
    end
    v286.timeSinceSwingStart = v288
    v285:SendToServer(v286)
end
function u39.enableHoldAutoSwing(p289) --[[ Line: 1072 ]]
    p289.holdAutoSwingDisabled = false
end
function u39.disableHoldAutoSwing(p290) --[[ Line: 1075 ]]
    p290.holdAutoSwingDisabled = true
    p290.activeSwordActionId = -1
    p290.holdAutoSwingMaid:DoCleaning()
end
function u39.isHoldAutoSwingDisabled(p291) --[[ Line: 1080 ]]
    return p291.holdAutoSwingDisabled
end
return {
    ["SwordController"] = u10.CreateController(u39.new())
}