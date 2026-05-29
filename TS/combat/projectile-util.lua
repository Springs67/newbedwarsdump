local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local v3 = v2.ConstantManager
local u4 = v2.GameQueryUtil
local u5 = v2.SoundManager
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.KnitServer
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.CollectionService
local u13 = v11.Debris
local u14 = v11.PhysicsService
local u15 = v11.Players
local u16 = v11.ReplicatedStorage
local u17 = v11.RunService
local u18 = v11.Workspace
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "grappling-hook", "grappling-hook-util").GrapplingHookFunctions
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-meta").ProjectileMeta
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-skin-meta").getProjectileSkinMeta
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u28 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents
local u29 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "draw")
local u30 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "id-util").IdUtil
local u31 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u32 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "team-util").getPlayerTeamId
local u33 = v3.registerConstants(script, {
    ["RelX"] = 0.8,
    ["RelY"] = -0.6,
    ["RelZ"] = 0,
    ["DebugLagCompensation"] = false,
    ["LagCompensation"] = true,
    ["DebugProjectileTiming"] = false
})
local u34 = u16:WaitForChild("Assets"):WaitForChild("Projectiles")
local function u39(p35, p36) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u33
    --]]
    if not u33.DebugProjectileTiming then
        return p36()
    end
    debug.profilebegin(p35)
    local v37, v38 = pcall(p36)
    debug.profileend()
    if not v37 then
        error(v38)
    end
    return v38
end
local u356 = {
    ["generateRefId"] = function() --[[ Name: generateRefId, Line 59 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        return u30.generateId(8)
    end,
    ["isProjectileItemsSetupReady"] = function() --[[ Name: isProjectileItemsSetupReady, Line 63 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        return u16:FindFirstChild("ProjectilesReady").Value
    end,
    ["waitForProjectileItemsSetupAsync"] = function() --[[ Name: waitForProjectileItemsSetupAsync, Line 68 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u16
        --]]
        return u1.Promise.new(function(p40) --[[ Line: 69 ]]
            --[[
            Upvalues:
                [1] = u16
            --]]
            local v41 = u16:WaitForChild("ProjectilesReady")
            if v41.Value then
                p40(v41.Value)
            else
                p40((v41.Changed:Wait()))
            end
        end)
    end,
    ["fireProjectile"] = function(u42, u43, p44, u45, u46, p47, u48, u49, u50, u51, p52, p53) --[[ Name: fireProjectile, Line 79 ]]
        --[[
        Upvalues:
            [1] = u356
            [2] = u33
            [3] = u18
            [4] = u10
            [5] = u25
            [6] = u9
            [7] = u14
            [8] = u1
            [9] = u19
            [10] = u5
            [11] = u17
            [12] = u39
            [13] = u28
            [14] = u15
            [15] = u23
            [16] = u8
            [17] = u27
            [18] = u4
            [19] = u12
            [20] = u20
            [21] = u32
            [22] = u29
            [23] = u13
            [24] = u31
        --]]
        local v54 = p52 == nil and true or p52
        local u55 = p44
        if u55 == nil then
            u55 = u356.generateRefId()
        end
        if not u43.PrimaryPart then
            error("Projectile " .. u43.Name .. " has no primary part.")
        end
        for v56, v57 in u43:GetDescendants() do
            local _ = v56 - 1
            if v57:IsA("BasePart") then
                v57.CollisionGroup = "DisablePlayerCollisions"
            end
        end
        local v58
        if u51 == nil then
            v58 = u51
        else
            v58 = u51.relative
        end
        local v59
        if v58 == nil then
            v59 = u33.RelX
        else
            v59 = u51.relative.relX
        end
        local v60
        if u51 == nil then
            v60 = u51
        else
            v60 = u51.relative
        end
        local v61
        if v60 == nil then
            v61 = u33.RelY
        elseif u51 == nil then
            v61 = u51
        else
            v61 = u51.relative.relY
        end
        local v62
        if u51 == nil then
            v62 = u51
        else
            v62 = u51.relative
        end
        local v63
        if v62 == nil then
            v63 = u33.RelZ
        elseif u51 == nil then
            v63 = u51
        else
            v63 = u51.relative.relZ
        end
        u43:PivotTo(CFrame.new(u45, u45 + u46) * CFrame.new((Vector3.new(v59, v61, v63))))
        u43.Parent = u18
        local v64 = u10
        local v65 = {
            ["Parent"] = u43.PrimaryPart
        }
        local v66 = (u18.Gravity - p47) * u43.PrimaryPart.AssemblyMass
        v65.Force = Vector3.new(0, v66, 0)
        v64("BodyForce", v65)
        if v54 then
            u43.PrimaryPart:ApplyImpulse(u46 * u43.PrimaryPart.AssemblyMass)
        end
        local u67 = u43.Name or (p53 or "block_kicker_block")
        local u68 = u25[u67]
        local u69 = u9.new()
        u69:GiveTask(u43.PrimaryPart.AncestryChanged:Connect(function() --[[ Line: 161 ]]
            --[[
            Upvalues:
                [1] = u69
            --]]
            u69:DoCleaning()
        end))
        u69:GiveTask(u43.Destroying:Connect(function() --[[ Line: 164 ]]
            --[[
            Upvalues:
                [1] = u69
            --]]
            u69:DoCleaning()
        end))
        local v70
        if u51 == nil then
            v70 = u51
        else
            v70 = u51.playerCollisionDisabled
        end
        local v71 = v70 == true
        if not v71 then
            local v72
            if u68 == nil then
                v72 = u68
            else
                v72 = u68.playerCollisionDisabled
            end
            v71 = v72 == true
        end
        if v71 then
            u14:SetPartCollisionGroup(u43.PrimaryPart, "DisablePlayerCollisions")
        end
        local v73
        if u51 == nil then
            v73 = u51
        else
            v73 = u51.collisionDisabled
        end
        local v74 = v73 == true
        if not v74 then
            local v75
            if u68 == nil then
                v75 = u68
            else
                v75 = u68.collisionDisabled
            end
            v74 = v75 == true
        end
        if v74 then
            return nil
        end
        local u76
        if u1.instanceof(u42, u19) then
            u76 = u42
        else
            u76 = nil
        end
        local v77
        if u68 == nil then
            v77 = u68
        else
            v77 = u68.travelSound
        end
        if v77 ~= "" and v77 then
            u5:playSound(v77, {
                ["fadeOutTime"] = 1,
                ["parent"] = u43
            })
        end
        local u78
        if u76 == nil then
            u78 = u76
        else
            u78 = u76:getPlayer()
        end
        local u79
        if u78 then
            u79 = u78.Character
            if u79 ~= nil then
                u79 = u79:FindFirstChild("RightHand")
            end
        else
            u79 = nil
        end
        local v80
        if u68 == nil then
            v80 = u68
        else
            v80 = u68.getProjectileOverridesFunction
        end
        local u81
        if v80 then
            u81 = u68.getProjectileOverridesFunction(u78)
        else
            u81 = nil
        end
        local u82
        if u81 == nil then
            u82 = u81
        else
            u82 = u81.launchVelocityOverride
        end
        if u82 == nil then
            if u68 == nil then
                u82 = u68
            else
                u82 = u68.launchVelocity
            end
        end
        local u83
        if u81 == nil then
            u83 = u81
        else
            u83 = u81.returnDistanceOverride
        end
        if u83 == nil then
            if u68 == nil then
                u83 = u68
            else
                u83 = u68.returnDistance
            end
        end
        local u84 = 0
        local u85 = false
        local u86 = -1
        local v87
        if u68 == nil then
            v87 = u68
        else
            v87 = u68.returnDuration
        end
        local u88 = v87 == nil and 0.2 or v87
        local u89 = u43.PrimaryPart.Position
        local v90
        if u68 == nil then
            v90 = u68
        else
            v90 = u68.returnDestroyDistance
        end
        local u91 = v90 == nil and 10 or v90
        local v92
        if u68 == nil then
            v92 = u68
        else
            v92 = u68.returnConstantVelocityOverride
        end
        if v92 ~= nil then
            u82 = v92
        end
        local u93 = true
        local u94 = false
        local u95 = false
        local u96 = 0
        u69:GiveTask(function() --[[ Line: 296 ]]
            --[[
            Upvalues:
                [1] = u93
            --]]
            u93 = false
        end)
        u69:GiveTask(u17.Heartbeat:Connect(function(u97) --[[ Line: 299 ]]
            --[[
            Upvalues:
                [1] = u39
                [2] = u84
                [3] = u43
                [4] = u17
                [5] = u83
                [6] = u78
                [7] = u94
                [8] = u85
                [9] = u68
                [10] = u88
                [11] = u82
                [12] = u86
                [13] = u89
                [14] = u49
                [15] = u28
                [16] = u15
                [17] = u23
                [18] = u91
                [19] = u95
                [20] = u79
                [21] = u51
                [22] = u76
                [23] = u8
                [24] = u27
                [25] = u50
                [26] = u67
                [27] = u55
                [28] = u69
                [29] = u93
                [30] = u4
                [31] = u12
                [32] = u20
                [33] = u42
                [34] = u1
                [35] = u19
                [36] = u81
                [37] = u25
                [38] = u45
                [39] = u32
                [40] = u48
                [41] = u33
                [42] = u29
                [43] = u13
                [44] = u45
                [45] = u46
                [46] = u18
                [47] = u96
            --]]
            u39("projectile-step", function() --[[ Line: 301 ]]
                --[[
                Upvalues:
                    [1] = u84
                    [2] = u97
                    [3] = u43
                    [4] = u17
                    [5] = u83
                    [6] = u78
                    [7] = u94
                    [8] = u85
                    [9] = u68
                    [10] = u88
                    [11] = u82
                    [12] = u86
                    [13] = u89
                    [14] = u49
                    [15] = u28
                    [16] = u15
                    [17] = u23
                    [18] = u91
                    [19] = u95
                    [20] = u79
                    [21] = u51
                    [22] = u76
                    [23] = u8
                    [24] = u27
                    [25] = u50
                    [26] = u67
                    [27] = u55
                    [28] = u69
                    [29] = u39
                    [30] = u93
                    [31] = u4
                    [32] = u12
                    [33] = u20
                    [34] = u42
                    [35] = u1
                    [36] = u19
                    [37] = u81
                    [38] = u25
                    [39] = u45
                    [40] = u32
                    [41] = u48
                    [42] = u33
                    [43] = u29
                    [44] = u13
                    [45] = u45
                    [46] = u46
                    [47] = u18
                    [48] = u96
                --]]
                u84 = u84 + u97
                local v98 = u43
                if v98 ~= nil then
                    v98 = v98.PrimaryPart
                end
                if not v98 then
                    return nil
                end
                local v99 = u43.PrimaryPart.CFrame
                local v100 = u17:IsServer()
                if u83 ~= 0 and (u83 == u83 and u83) then
                    if u78 == nil then
                        return nil
                    end
                    local v101 = u78.Character
                    if v101 ~= nil then
                        v101 = v101.PrimaryPart
                        if v101 ~= nil then
                            v101 = v101.CFrame
                        end
                    end
                    if v101 == nil then
                        return nil
                    end
                    local v102 = (v101 - v99.Position).Position.Magnitude
                    if (u83 < v102 or u94) and not u85 then
                        local v103 = u68
                        if v103 ~= nil then
                            v103 = v103.returnWithConstantVelocity
                        end
                        if v103 then
                            u88 = (v101 - v99.Position).Position.Magnitude / u82
                            u88 = u88 * 2
                        end
                        u85 = true
                        u86 = tick()
                        u89 = u43.PrimaryPart.Position
                        if u49 == true then
                            u28.HookFunctionSwapEvent:fire(u15.LocalPlayer, u23.HOOK_BACKWARD_TRANSIT)
                        end
                    else
                        local v104
                        if v102 < u91 then
                            v104 = u85
                        else
                            v104 = false
                        end
                        if v104 then
                            local v105 = u68
                            if v105 ~= nil then
                                v105 = v105.destroyOnReturnLerpFinished
                            end
                            v104 = not v105
                        end
                        if v104 then
                            u95 = true
                        end
                    end
                    if u85 and not u95 then
                        local v106 = (tick() - u86) / u88
                        local v107 = u68
                        if v107 ~= nil then
                            v107 = v107.returnWithConstantVelocity
                        end
                        if v107 then
                            local v108 = u78.Character.PrimaryPart.Position
                            if u68.returnToRightHand and u79 then
                                v108 = u79.Position
                            end
                            local v109 = u89:Lerp(v108, v106)
                            local v110 = CFrame.new(v109, v108)
                            local v111 = u51
                            if v111 ~= nil then
                                v111 = v111.flightRotation
                            end
                            if v111 == nil then
                                v111 = u68.flightRotation
                            end
                            if v111 then
                                v110 = v110 * CFrame.Angles(v111.X, v111.Y, v111.Z)
                            end
                            u43:PivotTo(v110)
                        else
                            local v112 = u51
                            if v112 ~= nil then
                                v112 = v112.flightRotation
                            end
                            if v112 == nil then
                                v112 = u68
                                if v112 ~= nil then
                                    v112 = v112.flightRotation
                                end
                            end
                            if v112 then
                                v101 = v101 * CFrame.Angles(v112.X, v112.Y, v112.Z)
                            end
                            u43:PivotTo((v99:Lerp(v101, v106)))
                        end
                        local v113 = u68
                        if v113 ~= nil then
                            v113 = v113.destroyOnReturnLerpFinished
                        end
                        if v113 then
                            v113 = v106 >= 1
                        end
                        if v113 then
                            u95 = true
                        end
                    end
                    if u95 then
                        u85 = false
                        if u49 == true then
                            u28.HookFunctionSwapEvent:fire(u15.LocalPlayer, u23.HOOK_CHAMBERED)
                        end
                        u43:Destroy()
                        local v114 = u68
                        if v114 ~= nil then
                            v114 = v114.equipItemOnReturn
                        end
                        if v114 then
                            v114 = u76
                        end
                        if v114 then
                            u8.Services.InventoryService:giveItem(u76:getPlayer(), u68.equipItemOnReturn, 1, {
                                ["maxAmount"] = 1
                            })
                        end
                        if u49 and u76 then
                            local v115 = u27.Server:Get("ProjectileReturned")
                            local v116 = u50
                            if v116 ~= nil then
                                v116 = v116.shotId
                            end
                            v115:SendToAllPlayers(v116, u67, u76:getPlayer())
                            u28.ProjectileReturned:fire(u78, u67, u55)
                        end
                        u69:DoCleaning()
                        return nil
                    end
                end
                local v117
                if v100 then
                    v117 = u51
                    if v117 ~= nil then
                        v117 = v117.serverTime
                    end
                    if v117 ~= 0 and (v117 == v117 and v117) then
                        v117 = u33.LagCompensation
                    end
                else
                    v117 = v100
                end
                if v117 ~= 0 and (v117 == v117 and v117) then
                    u8.Services.LagCompensationService:pushToPointInTime(u51.serverTime + u84)
                end
                if u33.DebugLagCompensation then
                    for _, v118 in u15:GetPlayers() do
                        if u17:IsServer() and v118.Character then
                            local v119 = u8.Services.LagCompensationService:getHitbox(v118.Character)
                            if v119 then
                                local v120 = u29
                                local v121 = CFrame.new(v119.Position)
                                local v122 = CFrame.new(0, 1, 0)
                                local v123 = v120.box(v121 * v122, Vector3.new(2, 4, 2), Color3.fromRGB(255, 0, 0))
                                v123.Transparency = 0.9
                                u4:setQueryIgnored(v123, true)
                                u13:AddItem(v123, 5)
                            end
                        elseif u17:IsClient() and v118.Character then
                            local v124 = u29.box(CFrame.new(v118.Character:GetPrimaryPartCFrame().Position), Vector3.new(1.8, 3.6, 1.8), Color3.fromRGB(0, 255, 0))
                            v124.Transparency = 0.9
                            u4:setQueryIgnored(v124, true)
                            u13:AddItem(v124, 5)
                        end
                    end
                end
                local v125 = v99.Position
                local v126 = {}
                if u45 == u45 then
                    local v127 = u45
                    table.insert(v126, v127)
                end
                local v128 = u46.Magnitude / 170
                local v129 = math.ceil(v128)
                local v130 = v125 - u45
                local v131 = false
                local v132 = 0
                while true do
                    if true then
                        if v131 then
                            v132 = v132 + 1
                        else
                            v131 = true
                        end
                    end
                    if v132 >= v129 - 1 then
                        break
                    end
                    local v133 = u45 + v130 * ((v132 + 1) / v129)
                    table.insert(v126, v133)
                end
                u45 = v125
                table.insert(v126, v125)
                local v134 = u68
                if v134 ~= nil then
                    v134 = v134.hitscanRegionMultiplier
                end
                local v135 = v134 == nil and 1 or v134
                for _, u136 in v126 do
                    local v137 = u51
                    if v137 ~= nil then
                        v137 = v137.getSuggestedTarget
                    end
                    if v137 then
                        local v138 = u51.getSuggestedTarget()
                        if v138 then
                            local v139 = u136 - Vector3.new(6, 3, 6) * v135
                            local v140 = Vector3.new(6, 3, 6) * v135
                            local v141 = Region3.new(v139, u136 + v140)
                            local v142 = OverlapParams.new()
                            v142.FilterType = Enum.RaycastFilterType.Whitelist
                            v142.FilterDescendantsInstances = { v138 }
                            for _, v143 in u18:GetPartBoundsInBox(v141.CFrame, v141.Size, v142) do
                                local u144 = v143
                                local u145 = false
                                if u39("projectile-hit-detection", function() --[[ Line: 514 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u93
                                        [2] = u43
                                        [3] = u144
                                        [4] = u51
                                        [5] = u4
                                        [6] = u12
                                        [7] = u20
                                        [8] = u76
                                        [9] = u42
                                        [10] = u1
                                        [11] = u19
                                        [12] = u81
                                        [13] = u68
                                        [14] = u145
                                        [15] = u25
                                        [16] = u45
                                        [17] = u78
                                        [18] = u32
                                        [19] = u28
                                        [20] = u55
                                        [21] = u136
                                        [22] = u50
                                        [23] = u85
                                        [24] = u48
                                        [25] = u94
                                        [26] = u69
                                    --]]
                                    if not u93 then
                                        return false
                                    end
                                    local v146 = u43
                                    if v146 ~= nil then
                                        v146 = v146.PrimaryPart
                                        if v146 ~= nil then
                                            v146 = v146.Parent
                                        end
                                    end
                                    if not (v146 and u43.Parent) then
                                        return false
                                    end
                                    if u144:IsDescendantOf(u43) then
                                        return false
                                    end
                                    local v147 = u51
                                    if v147 ~= nil then
                                        v147 = v147.projectileSource
                                    end
                                    if v147 and (u144 == v147 or u144:IsDescendantOf(v147)) then
                                        return false
                                    end
                                    if u4:isQueryIgnored(u144) and not u12:HasTag(u144, "Hitbox") then
                                        return false
                                    end
                                    if u12:HasTag(u144, "ProjectilesIgnore") then
                                        return false
                                    end
                                    if u144:GetAttribute("IgnoreProjectileCollision") == true then
                                        return false
                                    end
                                    local v148 = u144.Parent
                                    if v148 ~= nil then
                                        v148 = v148.Name
                                    end
                                    if v148 == "ArcParticles" then
                                        return false
                                    end
                                    local v149 = u20:getEntityFromDescendant(u144)
                                    if u12:HasTag(u144, "Hitbox") then
                                        local v150 = u144:FindFirstChild("EntityValue")
                                        if v150 and v150.Value then
                                            v149 = u20:getEntity(v150.Value)
                                        end
                                    end
                                    local v151 = not v149
                                    if v151 then
                                        v151 = u51
                                        if v151 ~= nil then
                                            v151 = v151.ignoreNonEntity
                                        end
                                    end
                                    if v151 then
                                        return false
                                    end
                                    if v149 then
                                        if u144:FindFirstAncestorWhichIsA("Accessory") or u144:IsA("Accessory") then
                                            return false
                                        end
                                        u144 = v149:getInstance().PrimaryPart or u144
                                        local v152 = u76
                                        if v152 == nil then
                                            v152 = u51
                                            if v152 ~= nil then
                                                v152 = v152.npcShooterEntity
                                            end
                                            if v152 == nil then
                                                v152 = u42
                                            end
                                        end
                                        local v153 = u1.instanceof(v149, u19)
                                        if v153 then
                                            v153 = u1.instanceof(v152, u19)
                                        end
                                        if v153 then
                                            local v154 = v149:getPlayer()
                                            local v155
                                            if v152 == nil then
                                                v155 = v152
                                            else
                                                v155 = v152:getPlayer()
                                            end
                                            v153 = v154 == v155
                                        end
                                        if v153 then
                                            return false
                                        end
                                        local v156 = v149:getInstance()
                                        local v157 = u76
                                        if v157 ~= nil then
                                            v157 = v157:getInstance()
                                        end
                                        if v156 == v157 then
                                            return false
                                        end
                                        local v158 = u51
                                        if v158 ~= nil then
                                            v158 = v158.npcShooterEntity
                                        end
                                        if v158 then
                                            v158 = v149:getInstance() == u51.npcShooterEntity:getInstance()
                                        end
                                        if v158 then
                                            return false
                                        end
                                        local v159 = u81
                                        if v159 ~= nil then
                                            v159 = v159.canHitAlliesOverride
                                        end
                                        if v159 == nil then
                                            v159 = u68
                                            if v159 ~= nil then
                                                v159 = v159.canHitAllyPlayers
                                            end
                                            if v159 == nil then
                                                v159 = false
                                            end
                                        end
                                        if v152 and not v152:canAttack(v149, {
                                            ["friendlyFire"] = v159
                                        }) then
                                            return false
                                        end
                                    end
                                    if u145 and (not v149 and table.find(u12:GetTags(u144), "falling-block") == nil) then
                                        return false
                                    end
                                    local v160 = u144:FindFirstAncestorOfClass("Model")
                                    if v160 and u25[v160.Name] ~= nil then
                                        return false
                                    end
                                    if u144:HasTag("ProjectileShield") then
                                        local v161 = u144:GetAttribute("ShieldCenter") or Vector3.new()
                                        local v162 = u144:GetAttribute("ShieldRadius")
                                        local v163 = (v162 == nil and 0 or v162) / 2
                                        local v164 = (u45 - v161).Magnitude
                                        if math.abs(v164) < v163 then
                                            return false
                                        end
                                        local v165 = u144:GetAttribute("ShieldTeamId")
                                        if v165 ~= "" and v165 and (not u78 and "" or u32(u78)) == v165 then
                                            return false
                                        end
                                    end
                                    local v166 = u51
                                    if v166 ~= nil then
                                        v166 = v166.npcShooterEntity
                                    end
                                    local v167 = u28.ProjectileHit
                                    local v168 = u76 or (v166 or u42)
                                    local v169 = u43.Name
                                    local v170 = u43
                                    local v171 = u55
                                    local v172 = u51
                                    if v172 ~= nil then
                                        v172 = v172.projectileSource
                                    end
                                    local v173 = {
                                        ["hitCFrame"] = CFrame.new(u136) * (u43:GetPivot() - u43:GetPivot().Position),
                                        ["velocity"] = u43.PrimaryPart.AssemblyLinearVelocity,
                                        ["part"] = u144
                                    }
                                    local v174 = u51
                                    if v174 ~= nil then
                                        v174 = v174.drawPercent
                                    end
                                    local v175 = v174 == nil and 1 or v174
                                    local v176 = u51
                                    if v176 ~= nil then
                                        v176 = v176.projectileDamageMult
                                    end
                                    local v177 = v176 == nil and 1 or v176
                                    local v178 = u50
                                    local v179 = u51
                                    if v179 ~= nil then
                                        v179 = v179.projectileKnockbackMult
                                    end
                                    local v180 = u51
                                    if v180 ~= nil then
                                        v180 = v180.metadata
                                    end
                                    local v181 = u85
                                    local v182 = u51
                                    if v182 ~= nil then
                                        v182 = v182.customAbilityId
                                    end
                                    if v167:fire(v168, v169, v170, v171, v172, v173, v149, v175, v177, v178, v179, v180, nil, v181, v182):isCancelled() then
                                        return false
                                    end
                                    u48(u136, u144)
                                    local v183 = u68
                                    if v183 ~= nil then
                                        v183 = v183.returnOnHit
                                    end
                                    if v183 then
                                        v183 = not v149
                                    end
                                    if v183 then
                                        u94 = true
                                    else
                                        local v184 = u68
                                        if v184 ~= nil then
                                            v184 = v184.keepProjectileOnHit
                                        end
                                        if not v184 then
                                            u69:DoCleaning()
                                        end
                                    end
                                    return true
                                end) then
                                    if v100 then
                                        v100 = u51
                                        if v100 ~= nil then
                                            v100 = v100.serverTime
                                        end
                                        if v100 ~= 0 and (v100 == v100 and v100) then
                                            v100 = u33.LagCompensation
                                        end
                                    end
                                    if v100 ~= 0 and (v100 == v100 and v100) then
                                        u8.Services.LagCompensationService:pop()
                                    end
                                    return nil
                                end
                            end
                        end
                    end
                    local v185 = u136 - Vector3.new(1.5, 0.5, 1.5) * v135
                    local v186 = Vector3.new(1.5, 0.5, 1.5) * v135
                    local v187 = Region3.new(v185, u136 + v186)
                    for _, v188 in u18:GetPartBoundsInBox(v187.CFrame, v187.Size) do
                        if v188:IsA("BasePart") then
                            local u189 = v188
                            local u190 = true
                            if u39("projectile-hit-detection", function() --[[ Line: 514 ]]
                                --[[
                                Upvalues:
                                    [1] = u93
                                    [2] = u43
                                    [3] = u189
                                    [4] = u51
                                    [5] = u4
                                    [6] = u12
                                    [7] = u20
                                    [8] = u76
                                    [9] = u42
                                    [10] = u1
                                    [11] = u19
                                    [12] = u81
                                    [13] = u68
                                    [14] = u190
                                    [15] = u25
                                    [16] = u45
                                    [17] = u78
                                    [18] = u32
                                    [19] = u28
                                    [20] = u55
                                    [21] = u136
                                    [22] = u50
                                    [23] = u85
                                    [24] = u48
                                    [25] = u94
                                    [26] = u69
                                --]]
                                if not u93 then
                                    return false
                                end
                                local v191 = u43
                                if v191 ~= nil then
                                    v191 = v191.PrimaryPart
                                    if v191 ~= nil then
                                        v191 = v191.Parent
                                    end
                                end
                                if not (v191 and u43.Parent) then
                                    return false
                                end
                                if u189:IsDescendantOf(u43) then
                                    return false
                                end
                                local v192 = u51
                                if v192 ~= nil then
                                    v192 = v192.projectileSource
                                end
                                if v192 and (u189 == v192 or u189:IsDescendantOf(v192)) then
                                    return false
                                end
                                if u4:isQueryIgnored(u189) and not u12:HasTag(u189, "Hitbox") then
                                    return false
                                end
                                if u12:HasTag(u189, "ProjectilesIgnore") then
                                    return false
                                end
                                if u189:GetAttribute("IgnoreProjectileCollision") == true then
                                    return false
                                end
                                local v193 = u189.Parent
                                if v193 ~= nil then
                                    v193 = v193.Name
                                end
                                if v193 == "ArcParticles" then
                                    return false
                                end
                                local v194 = u20:getEntityFromDescendant(u189)
                                if u12:HasTag(u189, "Hitbox") then
                                    local v195 = u189:FindFirstChild("EntityValue")
                                    if v195 and v195.Value then
                                        v194 = u20:getEntity(v195.Value)
                                    end
                                end
                                local v196 = not v194
                                if v196 then
                                    v196 = u51
                                    if v196 ~= nil then
                                        v196 = v196.ignoreNonEntity
                                    end
                                end
                                if v196 then
                                    return false
                                end
                                if v194 then
                                    if u189:FindFirstAncestorWhichIsA("Accessory") or u189:IsA("Accessory") then
                                        return false
                                    end
                                    u189 = v194:getInstance().PrimaryPart or u189
                                    local v197 = u76
                                    if v197 == nil then
                                        v197 = u51
                                        if v197 ~= nil then
                                            v197 = v197.npcShooterEntity
                                        end
                                        if v197 == nil then
                                            v197 = u42
                                        end
                                    end
                                    local v198 = u1.instanceof(v194, u19)
                                    if v198 then
                                        v198 = u1.instanceof(v197, u19)
                                    end
                                    if v198 then
                                        local v199 = v194:getPlayer()
                                        local v200
                                        if v197 == nil then
                                            v200 = v197
                                        else
                                            v200 = v197:getPlayer()
                                        end
                                        v198 = v199 == v200
                                    end
                                    if v198 then
                                        return false
                                    end
                                    local v201 = v194:getInstance()
                                    local v202 = u76
                                    if v202 ~= nil then
                                        v202 = v202:getInstance()
                                    end
                                    if v201 == v202 then
                                        return false
                                    end
                                    local v203 = u51
                                    if v203 ~= nil then
                                        v203 = v203.npcShooterEntity
                                    end
                                    if v203 then
                                        v203 = v194:getInstance() == u51.npcShooterEntity:getInstance()
                                    end
                                    if v203 then
                                        return false
                                    end
                                    local v204 = u81
                                    if v204 ~= nil then
                                        v204 = v204.canHitAlliesOverride
                                    end
                                    if v204 == nil then
                                        v204 = u68
                                        if v204 ~= nil then
                                            v204 = v204.canHitAllyPlayers
                                        end
                                        if v204 == nil then
                                            v204 = false
                                        end
                                    end
                                    if v197 and not v197:canAttack(v194, {
                                        ["friendlyFire"] = v204
                                    }) then
                                        return false
                                    end
                                end
                                if u190 and (not v194 and table.find(u12:GetTags(u189), "falling-block") == nil) then
                                    return false
                                end
                                local v205 = u189:FindFirstAncestorOfClass("Model")
                                if v205 and u25[v205.Name] ~= nil then
                                    return false
                                end
                                if u189:HasTag("ProjectileShield") then
                                    local v206 = u189:GetAttribute("ShieldCenter") or Vector3.new()
                                    local v207 = u189:GetAttribute("ShieldRadius")
                                    local v208 = (v207 == nil and 0 or v207) / 2
                                    local v209 = (u45 - v206).Magnitude
                                    if math.abs(v209) < v208 then
                                        return false
                                    end
                                    local v210 = u189:GetAttribute("ShieldTeamId")
                                    if v210 ~= "" and v210 and (not u78 and "" or u32(u78)) == v210 then
                                        return false
                                    end
                                end
                                local v211 = u51
                                if v211 ~= nil then
                                    v211 = v211.npcShooterEntity
                                end
                                local v212 = u28.ProjectileHit
                                local v213 = u76 or (v211 or u42)
                                local v214 = u43.Name
                                local v215 = u43
                                local v216 = u55
                                local v217 = u51
                                if v217 ~= nil then
                                    v217 = v217.projectileSource
                                end
                                local v218 = {
                                    ["hitCFrame"] = CFrame.new(u136) * (u43:GetPivot() - u43:GetPivot().Position),
                                    ["velocity"] = u43.PrimaryPart.AssemblyLinearVelocity,
                                    ["part"] = u189
                                }
                                local v219 = u51
                                if v219 ~= nil then
                                    v219 = v219.drawPercent
                                end
                                local v220 = v219 == nil and 1 or v219
                                local v221 = u51
                                if v221 ~= nil then
                                    v221 = v221.projectileDamageMult
                                end
                                local v222 = v221 == nil and 1 or v221
                                local v223 = u50
                                local v224 = u51
                                if v224 ~= nil then
                                    v224 = v224.projectileKnockbackMult
                                end
                                local v225 = u51
                                if v225 ~= nil then
                                    v225 = v225.metadata
                                end
                                local v226 = u85
                                local v227 = u51
                                if v227 ~= nil then
                                    v227 = v227.customAbilityId
                                end
                                if v212:fire(v213, v214, v215, v216, v217, v218, v194, v220, v222, v223, v224, v225, nil, v226, v227):isCancelled() then
                                    return false
                                end
                                u48(u136, u189)
                                local v228 = u68
                                if v228 ~= nil then
                                    v228 = v228.returnOnHit
                                end
                                if v228 then
                                    v228 = not v194
                                end
                                if v228 then
                                    u94 = true
                                else
                                    local v229 = u68
                                    if v229 ~= nil then
                                        v229 = v229.keepProjectileOnHit
                                    end
                                    if not v229 then
                                        u69:DoCleaning()
                                    end
                                end
                                return true
                            end) then
                                if v100 then
                                    v100 = u51
                                    if v100 ~= nil then
                                        v100 = v100.serverTime
                                    end
                                    if v100 ~= 0 and (v100 == v100 and v100) then
                                        v100 = u33.LagCompensation
                                    end
                                end
                                if v100 ~= 0 and (v100 == v100 and v100) then
                                    u8.Services.LagCompensationService:pop()
                                end
                                return nil
                            end
                        end
                    end
                    local v230 = u68
                    if v230 ~= nil then
                        v230 = v230.wallHitscanRegionMultiplier
                    end
                    if v230 == nil then
                        v230 = v135
                    end
                    local v231 = u136 - Vector3.new(0.5, 0.25, 0.5) * v230
                    local v232 = Vector3.new(0.5, 0.25, 0.5) * v230
                    local v233 = Region3.new(v231, u136 + v232)
                    for _, v234 in u18:GetPartBoundsInBox(v233.CFrame, v233.Size) do
                        if v234:IsA("BasePart") then
                            local u235 = v234
                            local u236 = false
                            if u39("projectile-hit-detection", function() --[[ Line: 514 ]]
                                --[[
                                Upvalues:
                                    [1] = u93
                                    [2] = u43
                                    [3] = u235
                                    [4] = u51
                                    [5] = u4
                                    [6] = u12
                                    [7] = u20
                                    [8] = u76
                                    [9] = u42
                                    [10] = u1
                                    [11] = u19
                                    [12] = u81
                                    [13] = u68
                                    [14] = u236
                                    [15] = u25
                                    [16] = u45
                                    [17] = u78
                                    [18] = u32
                                    [19] = u28
                                    [20] = u55
                                    [21] = u136
                                    [22] = u50
                                    [23] = u85
                                    [24] = u48
                                    [25] = u94
                                    [26] = u69
                                --]]
                                if not u93 then
                                    return false
                                end
                                local v237 = u43
                                if v237 ~= nil then
                                    v237 = v237.PrimaryPart
                                    if v237 ~= nil then
                                        v237 = v237.Parent
                                    end
                                end
                                if not (v237 and u43.Parent) then
                                    return false
                                end
                                if u235:IsDescendantOf(u43) then
                                    return false
                                end
                                local v238 = u51
                                if v238 ~= nil then
                                    v238 = v238.projectileSource
                                end
                                if v238 and (u235 == v238 or u235:IsDescendantOf(v238)) then
                                    return false
                                end
                                if u4:isQueryIgnored(u235) and not u12:HasTag(u235, "Hitbox") then
                                    return false
                                end
                                if u12:HasTag(u235, "ProjectilesIgnore") then
                                    return false
                                end
                                if u235:GetAttribute("IgnoreProjectileCollision") == true then
                                    return false
                                end
                                local v239 = u235.Parent
                                if v239 ~= nil then
                                    v239 = v239.Name
                                end
                                if v239 == "ArcParticles" then
                                    return false
                                end
                                local v240 = u20:getEntityFromDescendant(u235)
                                if u12:HasTag(u235, "Hitbox") then
                                    local v241 = u235:FindFirstChild("EntityValue")
                                    if v241 and v241.Value then
                                        v240 = u20:getEntity(v241.Value)
                                    end
                                end
                                local v242 = not v240
                                if v242 then
                                    v242 = u51
                                    if v242 ~= nil then
                                        v242 = v242.ignoreNonEntity
                                    end
                                end
                                if v242 then
                                    return false
                                end
                                if v240 then
                                    if u235:FindFirstAncestorWhichIsA("Accessory") or u235:IsA("Accessory") then
                                        return false
                                    end
                                    u235 = v240:getInstance().PrimaryPart or u235
                                    local v243 = u76
                                    if v243 == nil then
                                        v243 = u51
                                        if v243 ~= nil then
                                            v243 = v243.npcShooterEntity
                                        end
                                        if v243 == nil then
                                            v243 = u42
                                        end
                                    end
                                    local v244 = u1.instanceof(v240, u19)
                                    if v244 then
                                        v244 = u1.instanceof(v243, u19)
                                    end
                                    if v244 then
                                        local v245 = v240:getPlayer()
                                        local v246
                                        if v243 == nil then
                                            v246 = v243
                                        else
                                            v246 = v243:getPlayer()
                                        end
                                        v244 = v245 == v246
                                    end
                                    if v244 then
                                        return false
                                    end
                                    local v247 = v240:getInstance()
                                    local v248 = u76
                                    if v248 ~= nil then
                                        v248 = v248:getInstance()
                                    end
                                    if v247 == v248 then
                                        return false
                                    end
                                    local v249 = u51
                                    if v249 ~= nil then
                                        v249 = v249.npcShooterEntity
                                    end
                                    if v249 then
                                        v249 = v240:getInstance() == u51.npcShooterEntity:getInstance()
                                    end
                                    if v249 then
                                        return false
                                    end
                                    local v250 = u81
                                    if v250 ~= nil then
                                        v250 = v250.canHitAlliesOverride
                                    end
                                    if v250 == nil then
                                        v250 = u68
                                        if v250 ~= nil then
                                            v250 = v250.canHitAllyPlayers
                                        end
                                        if v250 == nil then
                                            v250 = false
                                        end
                                    end
                                    if v243 and not v243:canAttack(v240, {
                                        ["friendlyFire"] = v250
                                    }) then
                                        return false
                                    end
                                end
                                if u236 and (not v240 and table.find(u12:GetTags(u235), "falling-block") == nil) then
                                    return false
                                end
                                local v251 = u235:FindFirstAncestorOfClass("Model")
                                if v251 and u25[v251.Name] ~= nil then
                                    return false
                                end
                                if u235:HasTag("ProjectileShield") then
                                    local v252 = u235:GetAttribute("ShieldCenter") or Vector3.new()
                                    local v253 = u235:GetAttribute("ShieldRadius")
                                    local v254 = (v253 == nil and 0 or v253) / 2
                                    local v255 = (u45 - v252).Magnitude
                                    if math.abs(v255) < v254 then
                                        return false
                                    end
                                    local v256 = u235:GetAttribute("ShieldTeamId")
                                    if v256 ~= "" and v256 and (not u78 and "" or u32(u78)) == v256 then
                                        return false
                                    end
                                end
                                local v257 = u51
                                if v257 ~= nil then
                                    v257 = v257.npcShooterEntity
                                end
                                local v258 = u28.ProjectileHit
                                local v259 = u76 or (v257 or u42)
                                local v260 = u43.Name
                                local v261 = u43
                                local v262 = u55
                                local v263 = u51
                                if v263 ~= nil then
                                    v263 = v263.projectileSource
                                end
                                local v264 = {
                                    ["hitCFrame"] = CFrame.new(u136) * (u43:GetPivot() - u43:GetPivot().Position),
                                    ["velocity"] = u43.PrimaryPart.AssemblyLinearVelocity,
                                    ["part"] = u235
                                }
                                local v265 = u51
                                if v265 ~= nil then
                                    v265 = v265.drawPercent
                                end
                                local v266 = v265 == nil and 1 or v265
                                local v267 = u51
                                if v267 ~= nil then
                                    v267 = v267.projectileDamageMult
                                end
                                local v268 = v267 == nil and 1 or v267
                                local v269 = u50
                                local v270 = u51
                                if v270 ~= nil then
                                    v270 = v270.projectileKnockbackMult
                                end
                                local v271 = u51
                                if v271 ~= nil then
                                    v271 = v271.metadata
                                end
                                local v272 = u85
                                local v273 = u51
                                if v273 ~= nil then
                                    v273 = v273.customAbilityId
                                end
                                if v258:fire(v259, v260, v261, v262, v263, v264, v240, v266, v268, v269, v270, v271, nil, v272, v273):isCancelled() then
                                    return false
                                end
                                u48(u136, u235)
                                local v274 = u68
                                if v274 ~= nil then
                                    v274 = v274.returnOnHit
                                end
                                if v274 then
                                    v274 = not v240
                                end
                                if v274 then
                                    u94 = true
                                else
                                    local v275 = u68
                                    if v275 ~= nil then
                                        v275 = v275.keepProjectileOnHit
                                    end
                                    if not v275 then
                                        u69:DoCleaning()
                                    end
                                end
                                return true
                            end) then
                                if v100 then
                                    v100 = u51
                                    if v100 ~= nil then
                                        v100 = v100.serverTime
                                    end
                                    if v100 ~= 0 and (v100 == v100 and v100) then
                                        v100 = u33.LagCompensation
                                    end
                                end
                                if v100 ~= 0 and (v100 == v100 and v100) then
                                    u8.Services.LagCompensationService:pop()
                                end
                                return nil
                            end
                        end
                    end
                    local v276 = u18.Terrain:ReadVoxels(v233:ExpandToGrid(4), 4)
                    local v277 = false
                    local v278 = 0
                    while true do
                        if v277 then
                            v278 = v278 + 1
                        else
                            v277 = true
                        end
                        if v278 >= #v276 then
                            break
                        end
                        local v279 = false
                        local v280 = 0
                        while true do
                            if true then
                                if v279 then
                                    v280 = v280 + 1
                                else
                                    v279 = true
                                end
                            end
                            if v280 >= #v276[v278 + 1] then
                                break
                            end
                            local v281 = false
                            for v282, v283 in v276[v278 + 1][v280 + 1] do
                                local _ = v282 - 1
                                local v284
                                if v283 == Enum.Material.Air then
                                    v284 = false
                                else
                                    v284 = v283 ~= Enum.Material.Water
                                end
                                if v284 then
                                    v281 = true
                                    break
                                end
                            end
                            if v281 then
                                local u285 = u18.Terrain
                                local _, _ = v233:ExpandToGrid(4)
                                local u286 = false
                                if u39("projectile-hit-detection", function() --[[ Line: 514 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u93
                                        [2] = u43
                                        [3] = u285
                                        [4] = u51
                                        [5] = u4
                                        [6] = u12
                                        [7] = u20
                                        [8] = u76
                                        [9] = u42
                                        [10] = u1
                                        [11] = u19
                                        [12] = u81
                                        [13] = u68
                                        [14] = u286
                                        [15] = u25
                                        [16] = u45
                                        [17] = u78
                                        [18] = u32
                                        [19] = u28
                                        [20] = u55
                                        [21] = u136
                                        [22] = u50
                                        [23] = u85
                                        [24] = u48
                                        [25] = u94
                                        [26] = u69
                                    --]]
                                    if not u93 then
                                        return false
                                    end
                                    local v287 = u43
                                    if v287 ~= nil then
                                        v287 = v287.PrimaryPart
                                        if v287 ~= nil then
                                            v287 = v287.Parent
                                        end
                                    end
                                    if not (v287 and u43.Parent) then
                                        return false
                                    end
                                    if u285:IsDescendantOf(u43) then
                                        return false
                                    end
                                    local v288 = u51
                                    if v288 ~= nil then
                                        v288 = v288.projectileSource
                                    end
                                    if v288 and (u285 == v288 or u285:IsDescendantOf(v288)) then
                                        return false
                                    end
                                    if u4:isQueryIgnored(u285) and not u12:HasTag(u285, "Hitbox") then
                                        return false
                                    end
                                    if u12:HasTag(u285, "ProjectilesIgnore") then
                                        return false
                                    end
                                    if u285:GetAttribute("IgnoreProjectileCollision") == true then
                                        return false
                                    end
                                    local v289 = u285.Parent
                                    if v289 ~= nil then
                                        v289 = v289.Name
                                    end
                                    if v289 == "ArcParticles" then
                                        return false
                                    end
                                    local v290 = u20:getEntityFromDescendant(u285)
                                    if u12:HasTag(u285, "Hitbox") then
                                        local v291 = u285:FindFirstChild("EntityValue")
                                        if v291 and v291.Value then
                                            v290 = u20:getEntity(v291.Value)
                                        end
                                    end
                                    local v292 = not v290
                                    if v292 then
                                        v292 = u51
                                        if v292 ~= nil then
                                            v292 = v292.ignoreNonEntity
                                        end
                                    end
                                    if v292 then
                                        return false
                                    end
                                    if v290 then
                                        if u285:FindFirstAncestorWhichIsA("Accessory") or u285:IsA("Accessory") then
                                            return false
                                        end
                                        u285 = v290:getInstance().PrimaryPart or u285
                                        local v293 = u76
                                        if v293 == nil then
                                            v293 = u51
                                            if v293 ~= nil then
                                                v293 = v293.npcShooterEntity
                                            end
                                            if v293 == nil then
                                                v293 = u42
                                            end
                                        end
                                        local v294 = u1.instanceof(v290, u19)
                                        if v294 then
                                            v294 = u1.instanceof(v293, u19)
                                        end
                                        if v294 then
                                            local v295 = v290:getPlayer()
                                            local v296
                                            if v293 == nil then
                                                v296 = v293
                                            else
                                                v296 = v293:getPlayer()
                                            end
                                            v294 = v295 == v296
                                        end
                                        if v294 then
                                            return false
                                        end
                                        local v297 = v290:getInstance()
                                        local v298 = u76
                                        if v298 ~= nil then
                                            v298 = v298:getInstance()
                                        end
                                        if v297 == v298 then
                                            return false
                                        end
                                        local v299 = u51
                                        if v299 ~= nil then
                                            v299 = v299.npcShooterEntity
                                        end
                                        if v299 then
                                            v299 = v290:getInstance() == u51.npcShooterEntity:getInstance()
                                        end
                                        if v299 then
                                            return false
                                        end
                                        local v300 = u81
                                        if v300 ~= nil then
                                            v300 = v300.canHitAlliesOverride
                                        end
                                        if v300 == nil then
                                            v300 = u68
                                            if v300 ~= nil then
                                                v300 = v300.canHitAllyPlayers
                                            end
                                            if v300 == nil then
                                                v300 = false
                                            end
                                        end
                                        if v293 and not v293:canAttack(v290, {
                                            ["friendlyFire"] = v300
                                        }) then
                                            return false
                                        end
                                    end
                                    if u286 and (not v290 and table.find(u12:GetTags(u285), "falling-block") == nil) then
                                        return false
                                    end
                                    local v301 = u285:FindFirstAncestorOfClass("Model")
                                    if v301 and u25[v301.Name] ~= nil then
                                        return false
                                    end
                                    if u285:HasTag("ProjectileShield") then
                                        local v302 = u285:GetAttribute("ShieldCenter") or Vector3.new()
                                        local v303 = u285:GetAttribute("ShieldRadius")
                                        local v304 = (v303 == nil and 0 or v303) / 2
                                        local v305 = (u45 - v302).Magnitude
                                        if math.abs(v305) < v304 then
                                            return false
                                        end
                                        local v306 = u285:GetAttribute("ShieldTeamId")
                                        if v306 ~= "" and v306 and (not u78 and "" or u32(u78)) == v306 then
                                            return false
                                        end
                                    end
                                    local v307 = u51
                                    if v307 ~= nil then
                                        v307 = v307.npcShooterEntity
                                    end
                                    local v308 = u28.ProjectileHit
                                    local v309 = u76 or (v307 or u42)
                                    local v310 = u43.Name
                                    local v311 = u43
                                    local v312 = u55
                                    local v313 = u51
                                    if v313 ~= nil then
                                        v313 = v313.projectileSource
                                    end
                                    local v314 = {
                                        ["hitCFrame"] = CFrame.new(u136) * (u43:GetPivot() - u43:GetPivot().Position),
                                        ["velocity"] = u43.PrimaryPart.AssemblyLinearVelocity,
                                        ["part"] = u285
                                    }
                                    local v315 = u51
                                    if v315 ~= nil then
                                        v315 = v315.drawPercent
                                    end
                                    local v316 = v315 == nil and 1 or v315
                                    local v317 = u51
                                    if v317 ~= nil then
                                        v317 = v317.projectileDamageMult
                                    end
                                    local v318 = v317 == nil and 1 or v317
                                    local v319 = u50
                                    local v320 = u51
                                    if v320 ~= nil then
                                        v320 = v320.projectileKnockbackMult
                                    end
                                    local v321 = u51
                                    if v321 ~= nil then
                                        v321 = v321.metadata
                                    end
                                    local v322 = u85
                                    local v323 = u51
                                    if v323 ~= nil then
                                        v323 = v323.customAbilityId
                                    end
                                    if v308:fire(v309, v310, v311, v312, v313, v314, v290, v316, v318, v319, v320, v321, nil, v322, v323):isCancelled() then
                                        return false
                                    end
                                    u48(u136, u285)
                                    local v324 = u68
                                    if v324 ~= nil then
                                        v324 = v324.returnOnHit
                                    end
                                    if v324 then
                                        v324 = not v290
                                    end
                                    if v324 then
                                        u94 = true
                                    else
                                        local v325 = u68
                                        if v325 ~= nil then
                                            v325 = v325.keepProjectileOnHit
                                        end
                                        if not v325 then
                                            u69:DoCleaning()
                                        end
                                    end
                                    return true
                                end) then
                                    if v100 then
                                        v100 = u51
                                        if v100 ~= nil then
                                            v100 = v100.serverTime
                                        end
                                        if v100 ~= 0 and (v100 == v100 and v100) then
                                            v100 = u33.LagCompensation
                                        end
                                    end
                                    if v100 ~= 0 and (v100 == v100 and v100) then
                                        u8.Services.LagCompensationService:pop()
                                    end
                                    return nil
                                end
                            end
                        end
                    end
                end
                local v326 = u68
                if v326 ~= nil then
                    v326 = v326.spinAxis
                end
                if v326 then
                    local v327 = u68
                    if v327 ~= nil then
                        v327 = v327.spinSpeed
                    end
                    u96 = u96 + (v327 == nil and 1 or v327) * u97
                    local v328 = u43.PrimaryPart.CFrame
                    local v329 = CFrame
                    local v330 = u68
                    if v330 ~= nil then
                        v330 = v330.spinAxis.X
                    end
                    local v331 = v330 * u96
                    local v332 = u68
                    if v332 ~= nil then
                        v332 = v332.spinAxis.Y
                    end
                    local v333 = v332 * u96
                    local v334 = u68
                    if v334 ~= nil then
                        v334 = v334.spinAxis.Z
                    end
                    local v335 = v329.Angles(v331, v333, v334 * u96)
                    u43.PrimaryPart.CFrame = v328 * v335
                end
                if v100 then
                    v100 = u51
                    if v100 ~= nil then
                        v100 = v100.serverTime
                    end
                    if v100 ~= 0 and (v100 == v100 and v100) then
                        v100 = u33.LagCompensation
                    end
                end
                if v100 ~= 0 and (v100 == v100 and v100) then
                    u8.Services.LagCompensationService:pop()
                end
            end)
        end))
        local v336
        if u51 == nil then
            v336 = u51
        else
            v336 = u51.detectHitTerrain
        end
        if v336 or u31.isLobbyServer() then
            local u337 = false
            u69:GiveTask(u43.PrimaryPart.Touched:Connect(function(p338) --[[ Line: 1049 ]]
                --[[
                Upvalues:
                    [1] = u43
                    [2] = u337
                    [3] = u51
                    [4] = u28
                    [5] = u76
                    [6] = u55
                    [7] = u50
                    [8] = u85
                    [9] = u69
                    [10] = u48
                --]]
                if p338.Name == "Terrain" and u43.PrimaryPart then
                    u337 = true
                    local v339 = u51
                    if v339 ~= nil then
                        v339 = v339.npcShooterEntity
                    end
                    local v340 = u28.ProjectileHit
                    local v341 = u76 or v339
                    local v342 = u43.Name
                    local v343 = u43
                    local v344 = u55
                    local v345 = u51
                    if v345 ~= nil then
                        v345 = v345.projectileSource
                    end
                    local v346 = {
                        ["hitCFrame"] = CFrame.new(u43.PrimaryPart.Position) * (u43:GetPivot() - u43:GetPivot().Position),
                        ["velocity"] = u43.PrimaryPart.AssemblyLinearVelocity,
                        ["part"] = p338
                    }
                    local v347 = u51
                    if v347 ~= nil then
                        v347 = v347.drawPercent
                    end
                    local v348 = v347 == nil and 1 or v347
                    local v349 = u51
                    if v349 ~= nil then
                        v349 = v349.projectileDamageMult
                    end
                    local v350 = v349 == nil and 1 or v349
                    local v351 = u50
                    local v352 = u51
                    if v352 ~= nil then
                        v352 = v352.projectileKnockbackMult
                    end
                    local v353 = u51
                    if v353 ~= nil then
                        v353 = v353.metadata
                    end
                    local v354 = u85
                    local v355 = u51
                    if v355 ~= nil then
                        v355 = v355.customAbilityId
                    end
                    if v340:fire(v341, v342, v343, v344, v345, v346, nil, v348, v350, v351, v352, v353, nil, v354, v355):isCancelled() then
                        u337 = false
                        return nil
                    end
                    u69:DoCleaning()
                    u48(u43.PrimaryPart.Position, p338)
                end
            end))
        end
    end
}
local u357 = nil
function u356.createProjectile(p358, p359, _, p360, p361) --[[ Line: 1118 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u21
        [3] = u17
        [4] = u8
        [5] = u7
        [6] = u22
        [7] = u26
        [8] = u34
        [9] = u18
        [10] = u1
        [11] = u19
        [12] = u12
        [13] = u357
    --]]
    local v362
    if p359 then
        v362 = u25[p359]
    else
        v362 = nil
    end
    local v363
    if p361 == nil then
        v363 = p361
    else
        v363 = p361.projectileModel
        if v363 ~= nil then
            v363 = v363.Name
        end
    end
    if v363 == nil then
        if v362 ~= nil then
            v362 = v362.projectileModel
        end
        if v362 == nil then
            v362 = p359
        end
    else
        v362 = v363
    end
    local v364
    if p361 == nil then
        v364 = p361
    else
        v364 = p361.projectileModel
    end
    local v365 = not v364 and v362
    if v365 ~= "" and v365 then
        local v366
        if p358 == nil then
            v366 = p358
        else
            v366 = p358:getInstance()
        end
        local v367 = u21.DEFAULT
        if v366 then
            if u17:IsServer() then
                v367 = u8.Services.KitService:getDisplayedKitSkin(v366)
            else
                v367 = u7.Controllers.KitController:getKitSkin(v366)
            end
        end
        local v368 = u22[v367].projectileSkins
        if v368 ~= nil then
            v368 = nil
            for v369, v370 in v368 do
                local _ = v369 - 1
                if u26(v370).projectileType == p359 == true then
                    v368 = v370
                    break
                end
            end
        end
        if v368 then
            v362 = u26(v368).modelName
        end
        local v371
        if p361 == nil then
            v371 = p361
        else
            v371 = p361.projectileName
        end
        if v371 then
            v362 = p361.projectileName
        end
        v364 = u34:WaitForChild(v362)
    end
    local v372 = "Projectile model for projectile " .. tostring(p359) .. " can\'t be found."
    assert(v364, v372)
    local v373 = v364:Clone()
    local v374
    if p361 == nil then
        v374 = p361
    else
        v374 = p361.projectileModelScale
    end
    if v374 ~= 0 and (v374 == v374 and v374) then
        v373:ScaleTo(p361.projectileModelScale)
    end
    local v375 = v373.PrimaryPart
    local v376 = "Primary part missing on projectile " .. v373.Name
    assert(v375, v376)
    if p359 then
        v373.Name = p359
    end
    if p360 == nil then
        return nil
    end
    v373:PivotTo(p360)
    v373.Parent = u18
    if u1.instanceof(p358, u19) then
        v373:SetAttribute("ProjectileShooter", p358:getPlayer().UserId)
        v373:SetAttribute("ServerProjectile", u17:IsServer())
        u12:AddTag(v373, u357(p358:getPlayer().UserId))
    end
    return v373
end
u357 = function(p377) --[[ Name: getProjectileCST, Line 1218 ]]
    return "projectile:" .. tostring(p377)
end
u356.getProjectileCST = u357
function u356.getProjectileSource(p378, p379) --[[ Line: 1222 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    local v380 = u24(p379.Name)
    if v380 == nil then
        return nil
    end
    local v381 = v380.projectileSource
    if v381 == nil then
        v381 = v380.block
        if v381 ~= nil then
            v381 = v381.projectileSource
        end
    end
    if not v381 and (p378 and v380.multiProjectileSource) then
        v381 = v380.multiProjectileSource[p378]
    end
    return v381
end
local u382 = nil
function u356.setupProjectileConstantOrientation(u383, u384, u385) --[[ Line: 1243 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u25
        [3] = u382
        [4] = u26
        [5] = u15
        [6] = u17
        [7] = u39
        [8] = u28
        [9] = u23
        [10] = u27
    --]]
    local u386 = u9.new()
    local v387 = u25[u383.Name]
    local u388
    if u384 then
        local v389 = u382(u383.Name, u384)
        if v389 then
            u388 = {}
            if type(v387) == "table" then
                for v390, v391 in v387 do
                    u388[v390] = v391
                end
            end
            local v392 = u26(v389).projectileMetaOverrides
            if type(v392) == "table" then
                for v393, v394 in v392 do
                    u388[v393] = v394
                end
            end
        else
            u388 = v387
        end
    else
        u388 = v387
    end
    local v395
    if u388 ~= nil then
        v395 = u388.useServerModel
    end
    if v395 then
        v395 = u384 ~= u15.LocalPlayer
    end
    if v395 then
        return u386
    end
    local u396 = math.random() * 2 * 3.141592653589793
    if u388 ~= nil then
        local v397 = u388.getProjectileOverridesFunction
    end
    local u398
    if v397 then
        u398 = u388.getProjectileOverridesFunction(u384)
    else
        u398 = nil
    end
    local u399
    if u398 == nil then
        u399 = u398
    else
        u399 = u398.returnDistanceOverride
    end
    if u399 == nil then
        if u388 ~= nil then
            u399 = u388.returnDistance
        end
    end
    if u398 ~= nil then
        u398 = u398.lifetimeOverride
    end
    if u398 == nil then
        if u388 ~= nil then
            u398 = u388.lifetimeSec
        end
    end
    task.delay(0, function() --[[ Line: 1310 ]]
        --[[
        Upvalues:
            [1] = u386
            [2] = u17
            [3] = u39
            [4] = u383
            [5] = u398
            [6] = u399
            [7] = u28
            [8] = u15
            [9] = u23
            [10] = u384
            [11] = u385
            [12] = u388
            [13] = u396
            [14] = u27
        --]]
        local u400 = 0
        local u401 = nil
        u386:GiveTask(u17.Heartbeat:Connect(function(u402) --[[ Line: 1313 ]]
            --[[
            Upvalues:
                [1] = u39
                [2] = u383
                [3] = u386
                [4] = u401
                [5] = u400
                [6] = u398
                [7] = u399
                [8] = u28
                [9] = u15
                [10] = u23
                [11] = u384
                [12] = u385
                [13] = u388
                [14] = u396
            --]]
            u39("setupProjectileConstantOrientation", function() --[[ Line: 1314 ]]
                --[[
                Upvalues:
                    [1] = u383
                    [2] = u386
                    [3] = u401
                    [4] = u400
                    [5] = u402
                    [6] = u398
                    [7] = u399
                    [8] = u28
                    [9] = u15
                    [10] = u23
                    [11] = u384
                    [12] = u385
                    [13] = u388
                    [14] = u396
                --]]
                if not u383.Parent then
                    u386:DoCleaning()
                    return nil
                end
                if not u401 then
                    u401 = u383:GetPrimaryPartCFrame()
                end
                u400 = u400 + u402
                local v403 = u398
                if u400 > (v403 == nil and 10 or v403) then
                    if u399 ~= 0 and (u399 == u399 and u399) then
                        u28.HookFunctionSwapEvent:fire(u15.LocalPlayer, u23.HOOK_CHAMBERED)
                    end
                    local v404 = u384
                    if v404 then
                        v404 = u385
                    end
                    if v404 ~= "" and v404 then
                        u28.ProjectileExpired:fire(u384, u383.Name, u383, u385)
                    end
                    u383:Destroy()
                    u386:DoCleaning()
                    return nil
                end
                local v405 = u383:GetPrimaryPartCFrame().Position
                local v406 = u388
                if v406 ~= nil then
                    v406 = v406.flightRotation
                end
                if v406 == nil then
                    v406 = Vector3.new()
                end
                local v407 = CFrame.Angles(v406.X, v406.Y, v406.Z)
                local v408 = u383.PrimaryPart.Velocity
                local v409 = CFrame.new(v405, v405 + v408)
                local v410 = u388
                if v410 ~= nil then
                    v410 = v410.orbit
                end
                if v410 then
                    local v411 = u396 + u400 * 3.141592653589793 * 6
                    local v412 = u388
                    if v412 ~= nil then
                        v412 = v412.orbit.radius
                    end
                    local v413 = v412 == nil and 0.5 or v412
                    local v414 = math
                    local v415 = u400
                    local v416 = u388
                    if v416 ~= nil then
                        v416 = v416.orbit.timeTillMaxOrbit
                    end
                    local v417 = v415 / (v416 == nil and 1 or v416)
                    local v418 = v413 * v414.min(v417, 1)
                    local v419 = v418 * math.sin(v411)
                    local v420 = v418 * math.cos(v411)
                    local v421 = Vector3.new(v419, v420, 0)
                    v409 = CFrame.new(v409 * v421) * (v409 - v409.Position)
                end
                local v422 = u388
                if v422 ~= nil then
                    v422 = v422.noArc
                end
                if not v422 then
                    v409 = v409 * v407
                end
                u383:PivotTo(u28.ProjectileRender:fire(u383, u388, v409, u400, u402).cframe)
            end)
        end))
        u386:GiveTask(u17.Stepped:Connect(function(_) --[[ Line: 1399 ]]
            --[[
            Upvalues:
                [1] = u39
                [2] = u383
                [3] = u386
                [4] = u401
            --]]
            u39("setupProjectileConstantOrientation2", function() --[[ Line: 1400 ]]
                --[[
                Upvalues:
                    [1] = u383
                    [2] = u386
                    [3] = u401
                --]]
                if not u383.Parent then
                    u386:DoCleaning()
                    return nil
                end
                if u401 then
                    u383:PivotTo(u401)
                    u401 = nil
                end
            end)
        end))
        u386:GiveTask(u27.Client:Get("ProjectileReturned"):Connect(function(p423) --[[ Line: 1411 ]]
            --[[
            Upvalues:
                [1] = u385
                [2] = u399
                [3] = u28
                [4] = u15
                [5] = u23
                [6] = u383
                [7] = u386
            --]]
            if p423 == "" or (not p423 or p423 ~= u385) then
                return nil
            end
            if u399 ~= 0 and (u399 == u399 and u399) then
                u28.HookFunctionSwapEvent:fire(u15.LocalPlayer, u23.HOOK_CHAMBERED)
            end
            u383:Destroy()
            u386:DoCleaning()
        end))
    end)
    return u386
end
u382 = function(p424, p425) --[[ Name: getProjectileSkin, Line 1425 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u8
        [3] = u7
        [4] = u22
        [5] = u26
    --]]
    local v426 = p425.Character
    if not v426 then
        return nil
    end
    local v427
    if u17:IsServer() then
        v427 = u8.Services.KitService:getDisplayedKitSkin(v426)
    else
        v427 = u7.Controllers.KitSkinController:getKitSkin(v426)
    end
    local v428 = u22[v427].projectileSkins
    if v428 ~= nil then
        v428 = nil
        for v429, v430 in v428 do
            local _ = v429 - 1
            if u26(v430).projectileType == p424 == true then
                v428 = v430
                break
            end
        end
    end
    return v428
end
return {
    ["ProjectileUtil"] = u356
}