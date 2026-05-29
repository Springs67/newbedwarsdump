local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AbilityState
local u5 = v3.AnimationUtil
local u6 = v3.RandomUtil
local u7 = v3.SoundManager
local u8 = v3.getAbilityMeta
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.Players
local u15 = v13.ReplicatedStorage
local u16 = v13.RunService
local u17 = v13.TweenService
local u18 = v13.Workspace
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "nyoka", "ui", "mending-staff-charge-ui").MendingStaffChargeApp
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "nyoka", "ui", "nyoka-progress-bar").NyokaProgressApp
local u22 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "nyoka-balance").NyokaBalance
local v27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "nyoka", "nyoka-util").NyokaUtil
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u36 = Color3.fromRGB(112, 189, 92)
local u37 = Vector3.new(0, v27, 0)
local u38 = Vector3.new(0, v27, 0)
local u39 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 46 ]]
        return "MendingCanopyStaffController"
    end,
    ["__index"] = u22
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
        [1] = u22
        [2] = u10
    --]]
    u22.constructor(p42)
    p42.Name = "MendingCanopyStaffController"
    p42.chargeEnabledMaid = u10.new()
    p42.chargeDisabledMaid = u10.new()
    p42.glideMaid = u10.new()
    p42.overchargeMaid = u10.new()
    p42.equippedStaffsMap = {}
    p42.allyStaffMap = {}
    p42.chargedStaffs = {}
    p42.glidePhysicsEnabled = false
end
function u39.KnitStart(u43) --[[ Line: 68 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u32
        [3] = u19
        [4] = u14
        [5] = u23
        [6] = u7
        [7] = u33
        [8] = u6
        [9] = u34
    --]]
    u22.KnitStart(u43)
    u32.Client:OnEvent("MendingCanopyStaffEquippedEvent", function(p44, p45) --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u43
        --]]
        local v46 = u43.equippedStaffsMap[p44]
        if v46 ~= nil then
            local v47 = v46.staffMaid
            if v47 ~= nil then
                v47:DoCleaning()
            end
        end
        u43:staffEquipped(p44, p45)
    end)
    u32.Client:OnEvent("MendingCanopyStaffUnequippedEvent", function(p48) --[[ Line: 82 ]]
        --[[
        Upvalues:
            [1] = u43
        --]]
        local v49 = u43.equippedStaffsMap[p48]
        if v49 ~= nil then
            local v50 = v49.staffMaid
            if v50 ~= nil then
                v50:DoCleaning()
            end
        end
    end)
    u19.AbilityUsed:connect(function(p51) --[[ Line: 94 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        local v52 = u14.LocalPlayer
        local _ = p51.userCharacter == v52.Character
    end)
    u19.AbilityUsed:connect(function(p53) --[[ Line: 100 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u7
            [3] = u33
            [4] = u43
        --]]
        local v54 = p53.userCharacter
        if v54 == nil then
            return nil
        end
        local _ = p53.ability == u23.MENDING_CANOPY_STAFF_CHARGE_ENABLED
        local _ = p53.ability == u23.MENDING_CANOPY_STAFF_CHARGE_DISABLED
        if p53.ability == u23.MENDING_CANOPY_STAFF_OVERCHARGE then
            local v55 = u7
            local v56 = u33.NYOKA_MENDING_STAFF_OVERCHARGE
            local v57 = {
                ["volumeMultiplier"] = 0.7
            }
            local v58 = v54.PrimaryPart
            if v58 ~= nil then
                v58 = v58.Position
            end
            v57.position = v58
            v55:playSound(v56, v57)
            local v59 = 0
            for _ in u43.chargedStaffs do
                v59 = v59 + 1
            end
            local v60 = v59 > 0
            if v60 then
                v60 = u43.chargedStaffsConnection == nil
            end
            if v60 then
                u43.chargedStaffsConnection = u43:watchChargedStaffs()
            end
        end
    end)
    u32.Client:OnEvent("MendingCanopyStaffHealEvent", function(p61) --[[ Line: 137 ]]
        --[[
        Upvalues:
            [1] = u43
            [2] = u7
            [3] = u6
            [4] = u33
        --]]
        local v62 = p61.targetPlayer.Character
        if v62 ~= nil then
            v62 = v62.PrimaryPart
        end
        local v63
        if v62 == nil then
            v63 = v62
        else
            v63 = v62.Position
        end
        local v64 = u43.equippedStaffsMap[p61.fromPlayer]
        if v64 ~= nil then
            v64 = v64.staff
        end
        if v64 ~= nil then
            u43:createHealEffects(p61.fromPlayer, p61.targetPlayer)
        end
        if v63 == nil then
            return nil
        end
        u7:playSound(u6.fromList(u33.NYOKA_HEAL_APPLIED_0, u33.NYOKA_HEAL_APPLIED_1, u33.NYOKA_HEAL_APPLIED_2, u33.NYOKA_HEAL_APPLIED_3), {
            ["rollOffMaxDistance"] = 180,
            ["volumeMultiplier"] = 0.5,
            ["looped"] = false,
            ["parent"] = v62,
            ["position"] = v63
        })
    end)
    u19.StatusEffectAdded:connect(function(p65) --[[ Line: 170 ]]
        --[[
        Upvalues:
            [1] = u34
            [2] = u14
            [3] = u7
            [4] = u33
            [5] = u43
        --]]
        if p65.statusEffect ~= u34.MENDING_CANOPY_GLIDE then
            return nil
        end
        local v66 = p65.entityInstance
        if v66 == nil then
            return nil
        end
        if u14.LocalPlayer.Character == v66 then
            local v67 = u7
            local v68 = u33.NYOKA_MENDING_STAFF_GLIDE_AVAILABLE
            local v69 = {}
            local v70 = p65.entityInstance.PrimaryPart
            if v70 ~= nil then
                v70 = v70.Position
            end
            v69.position = v70
            v69.volumeMultiplier = 0.8
            v67:playSound(v68, v69)
            u43:enableGlidePhysics(v66, v66.Humanoid.Animator)
        end
    end)
    u19.StatusEffectRemoved:connect(function(p71) --[[ Line: 196 ]]
        --[[
        Upvalues:
            [1] = u34
            [2] = u14
            [3] = u43
        --]]
        if p71.statusEffect ~= u34.MENDING_CANOPY_GLIDE then
            return nil
        end
        if u14.LocalPlayer.Character == p71.entityInstance then
            local v72 = u43.glideMaid
            if v72 ~= nil then
                v72:DoCleaning()
            end
        end
    end)
end
function u39.isRelevantItem(_, p73) --[[ Line: 209 ]]
    --[[
    Upvalues:
        [1] = u29
    --]]
    return u29:isMendingCanopyStaff(p73.itemType)
end
function u39.onEnable(_, _, _) --[[ Line: 212 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v74 = u14.LocalPlayer.Character
    if v74 ~= nil then
        v74 = v74.PrimaryPart
        if v74 ~= nil then
            v74 = v74:FindFirstChild("MendingCanopyStaffGlideForce")
        end
    end
end
function u39.onDisable(_) --[[ Line: 222 ]] end
function u39.onStartCharging(_) --[[ Line: 224 ]] end
function u39.onStopCharging(_) --[[ Line: 226 ]] end
function u39.onLaunch(_) --[[ Line: 228 ]] end
function u39.onStartReload(_) --[[ Line: 230 ]] end
function u39.staffEquipped(u75, u76, u77) --[[ Line: 232 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u31
        [3] = u14
        [4] = u16
        [5] = u37
        [6] = u7
        [7] = u33
        [8] = u5
        [9] = u25
        [10] = u24
        [11] = u26
        [12] = u28
        [13] = u38
        [14] = u29
        [15] = u8
        [16] = u2
        [17] = u12
        [18] = u21
        [19] = u30
        [20] = u20
    --]]
    local v78 = u10.new()
    local v79 = u10.new()
    local u80 = u76.Character
    if u80 ~= nil then
        u80 = u80.PrimaryPart
    end
    local v81 = u31.getGamePlayer(u14.LocalPlayer):getTeamId()
    local v82 = u31.getGamePlayer(u76):getTeamId()
    if u80 == nil then
        return nil
    end
    if v81 == v82 then
        local u83 = u75:createRadius(u80)
        local u86 = u16.Heartbeat:Connect(function() --[[ Line: 248 ]]
            --[[
            Upvalues:
                [1] = u80
                [2] = u37
                [3] = u83
            --]]
            local v84 = u80.Position - u37
            local v85 = CFrame.new(v84)
            if u83 ~= nil then
                u83.CFrame = v85
                u83.Orientation = Vector3.new(0, 0, 90)
            end
        end)
        local u87 = u75:createHealIndicatorTween(u76, u83, 0, u77)
        u87:Play()
        local u88 = u7:playSound(u33.NYOKA_MENDING_RADIUS_LOOP, {
            ["rollOffMaxDistance"] = 180,
            ["volumeMultiplier"] = 0.2,
            ["looped"] = true,
            ["parent"] = u83,
            ["position"] = u80.Position
        })
        u75.allyStaffMap[u76] = {
            ["staff"] = u77,
            ["allyMaid"] = v79,
            ["healIndicator"] = u83,
            ["healIndicatorTween"] = u87
        }
        if v79 ~= nil then
            v79:GiveTask(function() --[[ Line: 278 ]]
                --[[
                Upvalues:
                    [1] = u83
                    [2] = u86
                    [3] = u87
                    [4] = u88
                --]]
                local v89 = u83
                if v89 ~= nil then
                    v89:Destroy()
                end
                local v90 = u86
                if v90 ~= nil then
                    v90:Disconnect()
                end
                local v91 = u87
                if v91 ~= nil then
                    v91:Cancel()
                end
                local v92 = u87
                if v92 ~= nil then
                    v92:Destroy()
                end
                local v93 = u88
                if v93 ~= nil then
                    v93:Stop()
                end
                local v94 = u88
                if v94 ~= nil then
                    v94:Destroy()
                end
            end)
        end
    end
    u75.equippedStaffsMap[u76] = {
        ["staff"] = u77,
        ["staffMaid"] = v78
    }
    local u95 = u76.Character
    local u96
    if u95 == nil then
        u96 = u95
    else
        u96 = u95.Humanoid.Animator
    end
    local u97 = u5:playAnimation(u96, u25:getAssetId(u24.MENDING_CANOPY_CHARGE), {
        ["looped"] = false
    })
    if u97 ~= nil then
        u97:Stop()
    end
    u25:getAssetId(u24.MENDING_CANOPY_CHARGE)
    u25:getAnimation(u24.MENDING_CANOPY_CHARGE)
    local u98 = u7:createSound(u33.NYOKA_MENDING_STAFF_CHARGING)
    u98.Looped = true
    u98.Volume = 0.4
    local u112 = u77:GetAttributeChangedSignal("StaffCharge"):Connect(function() --[[ Line: 335 ]]
        --[[
        Upvalues:
            [1] = u77
            [2] = u98
            [3] = u95
            [4] = u75
            [5] = u76
            [6] = u26
            [7] = u96
            [8] = u97
        --]]
        local v99 = u77:GetAttribute("StaffCharge")
        if u98.Parent ~= u95 then
            u98.Parent = u95.PrimaryPart
        end
        if v99 > 0 then
            if u75.chargedStaffs[u76] == nil then
                u75.chargedStaffs[u76] = u77
            end
            local v100 = 0.6 + 0.8 * (v99 / u26.STAFF_MAX_CHARGE)
            if u98.IsPlaying then
                u98.PlaybackSpeed = v100
            else
                u98:Play()
            end
            local v101 = u96
            if v101 then
                local v102 = u97
                if v102 ~= nil then
                    v102 = v102.IsPlaying
                end
                v101 = not v102
                if v101 then
                    local v103 = u97
                    if v103 ~= nil then
                        v103 = v103.Speed
                    end
                    v101 = v103 ~= 0
                end
            end
            if v101 then
                local v104 = u97
                if v104 ~= nil then
                    v104:Play()
                end
                local v105 = u97
                if v105 ~= nil then
                    v105:GetMarkerReachedSignal("ChargingAnimationEnd"):Connect(function() --[[ Line: 380 ]]
                        --[[
                        Upvalues:
                            [1] = u97
                        --]]
                        print("ChargingAnimationEnd")
                        local v106 = u97
                        if v106 ~= nil then
                            v106:AdjustSpeed(0)
                        end
                    end)
                end
            end
        else
            local v107 = u97
            if v107 ~= nil then
                v107:Stop()
            end
            if u97 ~= nil then
                u97:AdjustSpeed(1)
            end
            local v108 = u98
            if v108 ~= nil then
                v108 = v108.IsPlaying
            end
            if v108 then
                local v109 = u98
                if v109 ~= nil then
                    v109:Stop()
                end
            end
        end
        local v110 = 0
        for _ in u75.chargedStaffs do
            v110 = v110 + 1
        end
        local v111 = v110 > 0
        if v111 then
            v111 = u75.chargedStaffsConnection == nil
        end
        if v111 then
            u75.chargedStaffsConnection = u75:watchChargedStaffs()
        end
    end)
    local u113 = nil
    local u114 = nil
    local u128 = u76:GetAttributeChangedSignal("MendingStaffKnockbackEnabled"):Connect(function() --[[ Line: 430 ]]
        --[[
        Upvalues:
            [1] = u76
            [2] = u28
            [3] = u113
            [4] = u75
            [5] = u80
            [6] = u114
            [7] = u16
            [8] = u38
            [9] = u77
            [10] = u26
        --]]
        local v115 = u76:GetAttribute("MendingStaffKnockbackEnabled")
        local v116 = u28:getEntity(u76)
        if v116 ~= nil then
            v116 = v116:getInstance()
        end
        u28:getEntity(u76)
        if v115 then
            if v116 and u113 == nil then
                u113 = u75:createKnockbackEffects(u80.CFrame, v116)
            end
            u114 = u16.Heartbeat:Connect(function() --[[ Line: 443 ]]
                --[[
                Upvalues:
                    [1] = u76
                    [2] = u80
                    [3] = u38
                    [4] = u113
                    [5] = u77
                    [6] = u26
                --]]
                local v117 = u76:GetAttribute("MendingStaffKnockbackEnabled")
                if v117 ~= 0 and (v117 == v117 and (v117 ~= "" and v117)) then
                    local v118 = u80.Position - u38
                    local v119 = CFrame.new(v118)
                    if u113 ~= nil then
                        local v120 = nil
                        local v121 = v120
                        for v122, v123 in u113:GetDescendants() do
                            local _ = v122 - 1
                            if v123:IsA("ParticleEmitter") then
                                v120 = v123
                                v121 = v120
                            end
                        end
                        u113:PivotTo(v119)
                        if v121 ~= nil then
                            local v124 = u77:GetAttribute("StaffCharge") / u26.STAFF_MAX_CHARGE
                            v121.Rate = 0.3 + 2.7 * v124
                            local v125 = 3 + 7 * v124
                            v121.Size = NumberSequence.new(0, v125)
                        end
                    end
                end
            end)
        else
            local v126 = u113
            if v126 ~= nil then
                v126:Destroy()
            end
            u113 = nil
            local v127 = u114
            if v127 ~= nil then
                v127:Disconnect()
            end
        end
    end)
    if u14.LocalPlayer == u76 then
        u75:enableStaffChargeAbility()
        local v129 = u29:getMendingStaffTierData(u77.Name)
        if v129 == nil then
            return nil
        end
        local v130
        if v129 == nil then
            v130 = v129
        else
            v130 = v129.manaId
        end
        local v131 = u8(v130).usableProgress
        local v132
        if v131 == nil then
            v132 = v131
        else
            v132 = v131.stacks
        end
        if v132 == nil then
            return nil
        end
        local u133 = v129.extraAbilities
        if u133 == nil then
            u133 = false
        end
        if u133 then
            u75:enableOverchargeAbility()
        end
        local u137 = u77:GetAttributeChangedSignal("Charging"):Connect(function() --[[ Line: 519 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u76
                [3] = u77
                [4] = u75
                [5] = u133
            --]]
            if u14.LocalPlayer == u76 then
                local v134 = u77:GetAttribute("Charging")
                if v134 == 0 or (v134 ~= v134 or (v134 == "" or not v134)) then
                    local v135 = u75.chargeDisabledMaid
                    if v135 ~= nil then
                        v135:DoCleaning()
                    end
                    u75:enableStaffChargeAbility()
                else
                    local v136 = u75.chargeEnabledMaid
                    if v136 ~= nil then
                        v136:DoCleaning()
                    end
                    u75:disableStaffChargeAbility()
                end
                if u133 then
                    u75:enableOverchargeAbility()
                end
            end
        end)
        local u138 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u12.createElement(u21, {
            ["player"] = u76,
            ["maxProgress"] = v131.stacks
        }))
        if v129 ~= nil then
            v129 = v129.itemType
        end
        local v139 = {
            ["staff"] = u77,
            ["icon"] = u30(v129).image
        }
        local u140 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u12.createElement(u20, v139))
        if v78 ~= nil then
            v78:GiveTask(function() --[[ Line: 557 ]]
                --[[
                Upvalues:
                    [1] = u138
                    [2] = u140
                    [3] = u137
                    [4] = u75
                --]]
                local v141 = u138
                if v141 ~= nil then
                    v141:DoCleaning()
                end
                local v142 = u138
                if v142 ~= nil then
                    v142:Destroy()
                end
                local v143 = u140
                if v143 ~= nil then
                    v143:DoCleaning()
                end
                local v144 = u140
                if v144 ~= nil then
                    v144:Destroy()
                end
                local v145 = u137
                if v145 ~= nil then
                    v145:Disconnect()
                end
                local v146 = u75.chargeEnabledMaid
                if v146 ~= nil then
                    v146:DoCleaning()
                end
                local v147 = u75.chargeDisabledMaid
                if v147 ~= nil then
                    v147:DoCleaning()
                end
                local v148 = u75.overchargeMaid
                if v148 ~= nil then
                    v148:DoCleaning()
                end
            end)
        end
    end
    local v149 = u7
    local v150 = u33.NYOKA_MENDING_RADIUS_LOOP
    local v151 = {
        ["parent"] = u77.Handle
    }
    local v152 = u76.Character
    if v152 ~= nil then
        v152 = v152.PrimaryPart
        if v152 ~= nil then
            v152 = v152.Position
        end
    end
    v151.position = v152
    v151.rollOffMaxDistance = 180
    v151.volumeMultiplier = 0.3
    v151.looped = false
    local u153 = v149:playSound(v150, v151)
    if v78 ~= nil then
        v78:GiveTask(function() --[[ Line: 613 ]]
            --[[
            Upvalues:
                [1] = u153
                [2] = u75
                [3] = u76
                [4] = u112
                [5] = u128
                [6] = u114
                [7] = u113
            --]]
            local v154 = u153
            if v154 ~= nil then
                v154:Destroy()
            end
            if u75.chargedStaffs[u76] then
                u75.chargedStaffs[u76] = nil
            end
            local v155 = u112
            if v155 ~= nil then
                v155:Disconnect()
            end
            local v156 = u128
            if v156 ~= nil then
                v156:Disconnect()
            end
            local v157 = u114
            if v157 ~= nil then
                v157:Disconnect()
            end
            local v158 = u113
            if v158 ~= nil then
                v158:Destroy()
            end
            u113 = nil
            u75.equippedStaffsMap[u76] = nil
            local v159 = u75.allyStaffMap[u76]
            if v159 ~= nil then
                v159.allyMaid:DoCleaning()
            end
            u75.allyStaffMap[u76] = nil
        end)
    end
end
function u39.watchChargedStaffs(u160) --[[ Line: 659 ]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u16
    --]]
    local u161 = u26.STAFF_CHARGE_TICK_RATE
    local u162 = tick() + u161
    local u163 = nil
    u163 = u16.Heartbeat:Connect(function() --[[ Line: 664 ]]
        --[[
        Upvalues:
            [1] = u162
            [2] = u161
            [3] = u160
            [4] = u163
        --]]
        if u162 <= tick() then
            u162 = tick() + u161
            local v164 = u160.chargedStaffs
            local function v170(p165, p166) --[[ Line: 668 ]]
                --[[
                Upvalues:
                    [1] = u160
                --]]
                local v167 = p165:GetAttribute("StaffCharge")
                local v168 = u160.allyStaffMap[p166]
                if v168 == nil then
                    return nil
                end
                local v169 = v168.healIndicatorTween
                if v169 then
                    v169:Cancel()
                end
                v168.healIndicatorTween = u160:createHealIndicatorTween(p166, v168.healIndicator, v167, v168.staff)
                v168.healIndicatorTween:Play()
                if v167 == nil or v167 == 0 then
                    u160.chargedStaffs[p166] = nil
                end
            end
            for v171, v172 in v164 do
                v170(v172, v171, v164)
            end
        end
        if next(u160.chargedStaffs) == nil then
            local v173 = u163
            if v173 ~= nil then
                v173:Disconnect()
            end
            u160.chargedStaffsConnection = nil
            return nil
        end
    end)
    return u163
end
function u39.enableStaffChargeAbility(p174) --[[ Line: 706 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u23
        [3] = u4
    --]]
    local v175 = p174.chargeEnabledMaid
    if v175 ~= nil then
        v175:DoCleaning()
    end
    local v176 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v177 = u23.MENDING_CANOPY_STAFF_CHARGE_ENABLED
    local v178 = {
        ["abilityType"] = "KitPrimary"
    }
    local v179 = {
        ["icon"] = "rbxassetid://16812685736",
        ["layoutOrder"] = -1,
        ["stateColors"] = {
            [u4.READY] = Color3.fromRGB(255, 243, 1)
        }
    }
    v178.abilityButton = v179
    local u180 = v176:enableAbility(v177, v178):expect()
    p174.chargeEnabledMaid:GiveTask(function() --[[ Line: 721 ]]
        --[[
        Upvalues:
            [1] = u180
        --]]
        u180.Destroy()
    end)
end
function u39.disableStaffChargeAbility(p181) --[[ Line: 725 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u23
        [3] = u4
    --]]
    local v182 = p181.chargeDisabledMaid
    if v182 ~= nil then
        v182:DoCleaning()
    end
    local v183 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v184 = u23.MENDING_CANOPY_STAFF_CHARGE_DISABLED
    local v185 = {
        ["abilityType"] = "KitPrimary"
    }
    local v186 = {
        ["icon"] = "rbxassetid://16812686987",
        ["layoutOrder"] = 0,
        ["stateColors"] = {
            [u4.READY] = Color3.fromRGB(255, 243, 1)
        }
    }
    v185.abilityButton = v186
    local u187 = v183:enableAbility(v184, v185):expect()
    p181.chargeDisabledMaid:GiveTask(function() --[[ Line: 740 ]]
        --[[
        Upvalues:
            [1] = u187
        --]]
        u187.Destroy()
    end)
end
function u39.enableOverchargeAbility(p188) --[[ Line: 744 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u23
        [3] = u4
    --]]
    local v189 = p188.overchargeMaid
    if v189 ~= nil then
        v189:DoCleaning()
    end
    local v190 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v191 = u23.MENDING_CANOPY_STAFF_OVERCHARGE
    local v192 = {
        ["abilityType"] = "ItemSecondary"
    }
    local v193 = {
        ["icon"] = "rbxassetid://16909403219",
        ["layoutOrder"] = 100,
        ["stateColors"] = {
            [u4.READY] = Color3.fromRGB(0, 0, 0)
        }
    }
    v192.abilityButton = v193
    local u194 = v190:enableAbility(v191, v192):expect()
    p188.overchargeMaid:GiveTask(function() --[[ Line: 759 ]]
        --[[
        Upvalues:
            [1] = u194
        --]]
        u194.Destroy()
    end)
end
function u39.enableGlidePhysics(u195, u196, _) --[[ Line: 763 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u18
        [3] = u26
        [4] = u11
    --]]
    local v197 = u195.glideMaid
    if v197 ~= nil then
        v197:DoCleaning()
    end
    u195.glidePhysicsEnabled = true
    local u209 = u16.Stepped:Connect(function(_) --[[ Line: 769 ]]
        --[[
        Upvalues:
            [1] = u195
            [2] = u196
            [3] = u18
            [4] = u26
            [5] = u11
        --]]
        if u195.glidePhysicsEnabled then
            local v198 = u196
            if v198 ~= nil then
                v198 = v198.PrimaryPart
            end
            if v198 then
                local v199 = (u196.PrimaryPart.AssemblyLinearVelocity * Vector3.new(0, 1, 0)).Magnitude
                local v200 = math.pow(v199, 2) / 2 * 4.5
                local v201 = u196.PrimaryPart.AssemblyLinearVelocity.Y
                local v202 = v200 * math.sign(v201) / 13
                local v203 = u196.PrimaryPart.AssemblyMass
                local v204 = (u18.Gravity * u26.STAFF_GLIDE_GRAVITY_MULTIPLIER - v202) * v203
                local v205 = math.max(0, v204)
                local v206 = Vector3.new(0, v205, 0)
                local v207 = v206.Y > 5000 and Vector3.new(0, 5000, 0) or v206
                local v208 = u196.PrimaryPart
                if v208 ~= nil then
                    v208 = v208:FindFirstChild("MendingCanopyStaffGlideForce")
                end
                if v208 then
                    v208.Force = v207
                else
                    u11("BodyForce", {
                        ["Name"] = "MendingCanopyStaffGlideForce",
                        ["Force"] = v207,
                        ["Parent"] = u196.PrimaryPart
                    })
                end
            else
                return nil
            end
        else
            return nil
        end
    end)
    local v210 = u195.glideMaid
    if v210 ~= nil then
        v210:GiveTask(function() --[[ Line: 819 ]]
            --[[
            Upvalues:
                [1] = u195
                [2] = u209
                [3] = u196
            --]]
            u195.glidePhysicsEnabled = false
            local v211 = u209
            if v211 ~= nil then
                v211:Disconnect()
            end
            if u196.Parent then
                local v212 = u196.PrimaryPart
                if v212 ~= nil then
                    v212 = v212:FindFirstChild("MendingCanopyStaffGlideForce")
                end
                if v212 then
                    v212:Destroy()
                end
            end
        end)
    end
end
function u39.createRadius(_, p213) --[[ Line: 847 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u18
        [3] = u26
        [4] = u37
        [5] = u36
    --]]
    local v214 = u11
    local v215 = {
        ["Name"] = "NyokaHealAOE",
        ["Orientation"] = Vector3.new(0, 0, 90),
        ["Transparency"] = 0,
        ["CastShadow"] = false,
        ["Reflectance"] = 0,
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["CanTouch"] = false,
        ["CanQuery"] = false,
        ["Parent"] = u18
    }
    local v216 = u26.MIN_HEAL_RADIUS
    v215.Size = Vector3.new(v216, 0, 0)
    v215.CFrame = CFrame.new(p213.Position) - u37
    v215.Shape = Enum.PartType.Cylinder
    v215.Color = u36
    v215.Material = Enum.Material.ForceField
    return v214("Part", v215)
end
function u39.createHealIndicatorTween(p217, p218, p219, p220, p221) --[[ Line: 867 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u26
        [3] = u17
    --]]
    local v222 = p217.allyStaffMap[p218]
    if v222 ~= nil then
        v222 = v222.healIndicatorTween
    end
    if v222 ~= nil then
        v222:Cancel()
    end
    local v223 = u29:getMendingStaffTierData(p221.Name)
    local v224
    if v223 == nil then
        v224 = v223
    else
        v224 = v223.minHealRadius
    end
    if v224 == nil then
        v224 = u26.MIN_HEAL_RADIUS
    end
    if v223 ~= nil then
        v223 = v223.maxHealRadius
    end
    if v223 == nil then
        v223 = u26.MAX_HEAL_RADIUS
    end
    local v225 = v224 + (v223 - v224) * (p220 / u26.STAFF_MAX_CHARGE)
    local v226 = u17
    local v227 = TweenInfo.new(0.1, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut)
    local v228 = {}
    local v229 = v225 * 2
    local v230 = v225 * 2
    v228.Size = Vector3.new(0.7, v229, v230)
    return v226:Create(p219, v227, v228)
end
function u39.createKnockbackEffects(_, p231, p232) --[[ Line: 904 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u38
        [3] = u35
    --]]
    local v233 = u15.Assets.Effects.MendingStaffKnockback:Clone()
    v233:PivotTo(p231 - u38)
    v233.Parent = p232
    v233.Anchored = true
    u35:playEffects({ v233 }, p232, {})
    return v233
end
function u39.staffSpinnablesConnection(u234, u235) --[[ Line: 912 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u26
    --]]
    local u236 = u235:FindFirstChild("Handle")
    if u236 ~= nil then
        u236 = u236:FindFirstChild("StaffPivot")
    end
    local u237 = u235:FindFirstChild("Handle")
    if u237 ~= nil then
        u237 = u237:FindFirstChild("StaffPivotAttachment")
    end
    if u236 == nil or u237 == nil then
        return nil
    end
    local v238 = u235:FindFirstChild("Handle")
    if v238 ~= nil then
        v238 = v238:FindFirstChild("StaffSpinnables")
    end
    if v238 == nil then
        return nil
    end
    local u239 = v238:FindFirstChild("CenterSphere")
    local u240 = u239.Size
    local v241
    if u237 == nil then
        v241 = u237
    else
        v241 = u237:FindFirstChild("FinLeftTopInitialAttachment")
    end
    local v242
    if u237 == nil then
        v242 = u237
    else
        v242 = u237:FindFirstChild("FinRightTopInitialAttachment")
    end
    local _ = u237.WorldCFrame
    return u16.Heartbeat:Connect(function() --[[ Line: 948 ]]
        --[[
        Upvalues:
            [1] = u235
            [2] = u237
            [3] = u236
            [4] = u26
            [5] = u239
            [6] = u240
            [7] = u234
        --]]
        local v243 = u235:GetAttribute("StaffCharge")
        if v243 == nil then
            return nil
        end
        if v243 == 0 and (u237 and u236) then
            u236.CFrame = u237.WorldCFrame
            return nil
        end
        local v244 = 0 + 16 * (v243 / u26.STAFF_MAX_CHARGE)
        local v245 = u239.CFrame
        local v246 = 0 + 3 * (v243 / u26.STAFF_MAX_CHARGE)
        local v247 = v245.X
        local v248 = v245.Y + v246
        local v249 = v245.Z
        local _ = v245 + Vector3.new(v247, v248, v249)
        local v250 = u240
        local v251 = u240.X * 0.2
        local v252 = v250.X + v251 * u234:quadraticEaseInOut(v243 / u26.STAFF_MAX_CHARGE)
        if u237 and u236 then
            u237.CFrame = u237.CFrame * CFrame.Angles(0, math.rad(v244), 0)
            u236.CFrame = u237.WorldCFrame
            u239.Size = Vector3.new(v252, v252, v252)
        end
    end)
end
function u39.quadraticEaseInOut(_, p253) --[[ Line: 1026 ]]
    if p253 < 0.5 then
        return 2 * p253 * p253
    else
        return -1 + (4 - 2 * p253) * p253
    end
end
function u39.createHealEffects(_, p254, p255) --[[ Line: 1029 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u11
        [3] = u17
    --]]
    local v256 = u28:getEntity(p254)
    if v256 ~= nil then
        v256 = v256:getHandItemInstanceFromCharacter()
    end
    if v256 == nil then
        return nil
    end
    local v257 = v256:FindFirstChild("Handle")
    if v257 ~= nil then
        v257 = v257:FindFirstChild("StaffPivotAttachment")
    end
    local v258 = p255.Character
    if v258 == nil then
        return nil
    end
    local v259 = v258:FindFirstChild("UpperTorso")
    if v259 ~= nil then
        v259 = v259:FindFirstChild("BodyFrontAttachment")
    end
    if v259 == nil or v257 == nil then
        return nil
    end
    local u260 = u11("Beam", {
        ["Name"] = "MendingBeam",
        ["Width0"] = 0.1,
        ["Width1"] = 0.25,
        ["FaceCamera"] = true,
        ["TextureLength"] = 3,
        ["Segments"] = 1,
        ["Brightness"] = 2,
        ["LightEmission"] = 1,
        ["Attachment0"] = v257,
        ["Attachment1"] = v259,
        ["Color"] = ColorSequence.new(Color3.fromRGB(255, 243, 1)),
        ["Parent"] = v257,
        ["Transparency"] = NumberSequence.new(0.5, 0.25)
    })
    u17:Create(u260, TweenInfo.new(0.27999999999999997), {
        ["Width0"] = 0.13,
        ["Width1"] = 0.5,
        ["Brightness"] = 4
    }):Play()
    task.delay(0.29, function() --[[ Line: 1078 ]]
        --[[
        Upvalues:
            [1] = u260
        --]]
        local v261 = u260
        if v261 ~= nil then
            v261:Destroy()
        end
    end)
end
v9.CreateController(u39.new())
return nil