local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local v3 = v2.ConstantManager
local u4 = v2.DeviceUtil
local u5 = v2.GameQueryUtil
local u6 = v2.RandomUtil
local u7 = v2.SoundManager
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "bezier", "out").default
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.CollectionService
local u14 = v12.Players
local u15 = v12.RunService
local u16 = v12.Workspace
local u17 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u18 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "projectile-util").ProjectileUtil
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").getItemSkinMeta
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-meta").ProjectileMeta
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "id-util").IdUtil
local u26 = u1.import(script, script.Parent, "projectile-handler").ProjectileHandler
local u27 = v3.registerConstants(script, {
    ["RelX"] = 0.8,
    ["RelY"] = -0.6,
    ["RelZ"] = 0,
    ["CameraMultiplier"] = 10,
    ["BeamGrowthMultiplier"] = 0.08,
    ["YTargetOffset"] = u4.isMobileControls() and 0.25 or 0.05
})
local u28 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 41 ]]
        return "ProjectileController"
    end,
    ["__index"] = u18
})
u28.__index = u28
function u28.new(...) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    local v29 = u28
    local v30 = setmetatable({}, v29)
    return v30:constructor(...) or v30
end
function u28.constructor(p31, ...) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u10
    --]]
    u18.constructor(p31, ...)
    p31.Name = "ProjectileController"
    p31.isTargeting = false
    p31.targetingId = 0
    p31.targetingMaid = u10.new()
end
function u28.KnitStart(p32) --[[ Line: 58 ]]
    p32:projectileSetup()
end
function u28.projectileSetup(u33) --[[ Line: 61 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u16
        [3] = u24
        [4] = u21
        [5] = u17
    --]]
    u33.projectileTargetingFolder = u11("Folder", {
        ["Name"] = "ProjectileTargeting",
        ["Parent"] = u16
    })
    u24.Client:OnEvent("ProjectileLaunchClient", function(p34) --[[ Line: 66 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u33
        --]]
        local v35 = p34.shooter
        local v36
        if v35 then
            v36 = u21:getEntity(v35)
        else
            v36 = nil
        end
        local v37 = u33
        local v38 = p34.ammoType
        local v39 = p34.projectileType
        local v40 = p34.positionFrom
        local v41 = p34.projectileRefId
        local v42 = p34.initialVelocity
        local v43
        if p34 == nil then
            v43 = p34
        else
            v43 = p34.launchData
        end
        local v44 = v43 == nil and {} or v43
        local v45 = {}
        local v46 = p34.config
        if v46 ~= nil then
            v46 = v46.projectileModel
        end
        v45.projectileModel = v46
        local v47 = p34.config
        if v47 ~= nil then
            v47 = v47.projectileModelScale
        end
        v45.projectileModelScale = v47
        local v48 = p34.config
        if v48 ~= nil then
            v48 = v48.relativeOverride
        end
        v45.relativeOverride = v48
        local v49 = p34.config
        if v49 ~= nil then
            v49 = v49.launchSound
        end
        v45.launchSound = v49
        local v50 = p34.config
        if v50 ~= nil then
            v50 = v50.projectileOverrideName
        end
        v45.projectileNameOverride = v50
        v37:createLocalProjectile(nil, v38, v39, v40, v41, v42, v44, v45, v36)
    end)
    u17.FireClientProjectile:connect(function(p51) --[[ Line: 119 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        u33:createLocalProjectile(p51.projectileSource, p51.ammoType, p51.projectileType, p51.positionFrom, p51.projectileRefId, p51.initialVelocity, p51.launchData, p51.config)
    end)
end
function u28.enableTargeting(u52, _, p53, u54, p55, p56) --[[ Line: 123 ]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u8
        [3] = u19
        [4] = u14
    --]]
    if u52.isTargeting then
        u52:disableTargeting()
    end
    local u57 = (u52.targetingId + 1) % 10000
    u52.targetingId = u57
    u52.isTargeting = true
    local v58
    if p56 == nil then
        v58 = p56
    else
        v58 = p56.initialVelocityMultiplier
    end
    local v59 = v58 == nil and 1 or v58
    local v60
    if p55 == nil then
        v60 = nil
    else
        v60 = {
            ["inputObject"] = p55
        }
        local v61
        if p55 == nil then
            v61 = p55
        else
            v61 = p55.Position.X
        end
        if p55 ~= nil then
            p55 = p55.Position.Y
        end
        v60.initialPosition = Vector2.new(v61, p55)
    end
    local v62
    if p56 == nil then
        v62 = p56
    else
        v62 = p56.lockedAimPoint
    end
    local v63
    if p56 == nil then
        v63 = p56
    else
        v63 = p56.startAtCenterOfCamera
    end
    local u64 = u26.new(1, v59, p53, v60, nil, nil, nil, v62, u57, v63)
    local v65 = task
    if p56 ~= nil then
        p56 = p56.displayBeamDelay
    end
    local v66 = p56 == nil and 0 or p56
    v65.delay(v66, function() --[[ Line: 176 ]]
        --[[
        Upvalues:
            [1] = u52
            [2] = u54
            [3] = u8
            [4] = u19
            [5] = u14
            [6] = u57
            [7] = u64
        --]]
        if not u52.isTargeting then
            return nil
        end
        local v67 = u54.firstPerson
        if v67 ~= nil then
            v67 = v67.aimAnimation
        end
        if v67 ~= 0 and (v67 == v67 and v67) then
            local u68 = u8.Controllers.ViewmodelController:playAnimation(u54.firstPerson.aimAnimation, {
                ["looped"] = true,
                ["fadeTime"] = 0.18
            })
            u52.targetingMaid:GiveTask(function() --[[ Line: 190 ]]
                --[[
                Upvalues:
                    [1] = u68
                --]]
                local v69 = u68
                if v69 ~= nil then
                    v69:Stop()
                end
            end)
        end
        local v70 = u54.thirdPerson
        if v70 ~= nil then
            v70 = v70.aimAnimation
        end
        if v70 ~= 0 and (v70 == v70 and v70) then
            local u71 = u19:playAnimation(u14.LocalPlayer, u54.thirdPerson.aimAnimation, {
                ["looped"] = true
            })
            u52.targetingMaid:GiveTask(function() --[[ Line: 205 ]]
                --[[
                Upvalues:
                    [1] = u71
                --]]
                local v72 = u71
                if v72 ~= nil then
                    v72:Stop()
                end
            end)
        end
        local v73 = u54.thirdPerson
        if v73 ~= nil then
            v73 = v73.drawAnimation
        end
        if v73 ~= 0 and (v73 == v73 and v73) then
            local u74 = u19:playAnimation(u14.LocalPlayer, u54.thirdPerson.drawAnimation, {
                ["looped"] = false
            })
            u52.targetingMaid:GiveTask(function() --[[ Line: 220 ]]
                --[[
                Upvalues:
                    [1] = u74
                --]]
                local v75 = u74
                if v75 ~= nil then
                    v75:Stop()
                end
            end)
        end
        u52:enableBeam(u57, u64, nil, u54.beamModifier)
    end)
    return u64
end
function u28.getLaunchPosition(_, p76) --[[ Line: 231 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v77
    if p76 == nil then
        v77 = p76
    else
        v77 = p76:IsA("BasePart")
    end
    if v77 then
        return p76.Head.BulletOrigin.WorldPosition
    end
    local v78 = u14.LocalPlayer.Character
    if v78 ~= nil then
        v78 = v78.PrimaryPart
        if v78 ~= nil then
            v78 = v78.Position
        end
    end
    return v78
end
function u28.disableTargeting(p79, _) --[[ Line: 249 ]]
    p79.targetingMaid:DoCleaning()
    p79.isTargeting = false
end
u28.launchProjectile = u1.async(function(p80, _, p81, p82, p83, p84, p85, p86) --[[ Line: 253 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v87 = p80:calculateImportantLaunchValues(p82, false, p83)
    if not v87 then
        p80:disableTargeting()
        return nil
    end
    local v88 = p83:GetAttribute("ItemSkin")
    if v88 then
        local v89 = u22(v88)
        if v89 then
            p84 = {}
            for v90, v91 in p84 do
                p84[v90] = v91
            end
            local v92 = v89.projectileSourceOverrides
            if type(v92) == "table" then
                for v93, v94 in v92 do
                    p84[v93] = v94
                end
            end
        end
    end
    return p80:launchProjectileWithValues(v87, p83, p84, p81, p85, p86)
end)
u28.launchProjectileWithValues = u1.async(function(p95, p96, u97, p98, u99, p100, p101) --[[ Line: 278 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u25
        [3] = u7
        [4] = u6
        [5] = u8
        [6] = u19
        [7] = u14
        [8] = u21
        [9] = u24
        [10] = u16
        [11] = u1
    --]]
    local v102 = p100 == nil and {} or p100
    if p96 then
        if u17.PerformCombat:fire():isCancelled() then
            return nil
        else
            local v103 = u25.generateId(8)
            local u104 = p101 or p98.projectileType(u99)
            if u17.StartLaunchProjectile:fire(u104, p98):isCancelled() then
                return nil
            else
                local u105 = p96.initialVelocity
                local u106 = p96.positionFrom
                local _ = p96.deltaT
                local _ = p96.gravitationalAcceleration
                local u107 = {}
                for v108, v109 in v102 do
                    u107[v108] = v109
                end
                u107.shotId = v103
                u107.drawDurationSec = p96.drawDurationSeconds
                if p98.launchSound then
                    local v110 = p98.launchSoundConfig
                    local v111
                    if v110 == nil then
                        v111 = v110
                    else
                        v111 = v110.pitch
                    end
                    local v112 = u7
                    local v113 = u6
                    local v114
                    if p98 == nil then
                        v114 = p98
                    else
                        v114 = p98.launchSound
                    end
                    local v115 = v113.fromList(unpack(v114))
                    local v116 = {}
                    local v117
                    if v111 then
                        v117 = math.random() * (v111.Max - v111.Min) + v111.Min
                    else
                        v117 = nil
                    end
                    v116.playbackSpeedMultiplier = v117
                    if v110 ~= nil then
                        v110 = v110.volumeMultiplier
                    end
                    v116.volumeMultiplier = v110 == nil and 1 or v110
                    v112:playSound(v115, v116)
                end
                local v118 = p98.launchOverlaySound
                if v118 ~= "" and v118 then
                    local v119 = p98.launchSoundConfig
                    if v119 ~= nil then
                        v119 = v119.launchOverlayPitch
                    end
                    local v120 = u7
                    local v121 = p98.launchOverlaySound
                    local v122 = {}
                    local v123
                    if v119 then
                        v123 = math.random() * (v119.Max - v119.Min) + v119.Min
                    else
                        v123 = nil
                    end
                    v122.playbackSpeedMultiplier = v123
                    v120:playSound(v121, v122)
                end
                local v124 = p98.firstPerson
                if v124 ~= nil then
                    v124 = v124.fireAnimation
                end
                if v124 ~= 0 and (v124 == v124 and v124) then
                    u8.Controllers.ViewmodelController:playAnimation(p98.firstPerson.fireAnimation, {
                        ["fadeTime"] = 0.12
                    })
                end
                local v125 = p98.thirdPerson
                if v125 ~= nil then
                    v125 = v125.fireAnimation
                end
                if v125 ~= 0 and (v125 == v125 and v125) then
                    u19:playAnimation(u14.LocalPlayer, p98.thirdPerson.fireAnimation)
                end
                local u126 = u25.generateId(8)
                local v127 = p95:createLocalProjectile(p98, u99, u104, u106, u126, u105, u107, nil, nil, u97)
                if v127 then
                    local v128 = u17.ProjectileLaunched
                    local v129 = u21:getLocalPlayerEntity()
                    if v129 ~= nil then
                        v129 = v129:getInstance()
                    end
                    v128:fire(u104, v127, u105, u106, v129, u107)
                end
                local u130 = u14.LocalPlayer.Character
                if u130 ~= nil then
                    u130 = u130.PrimaryPart
                    if u130 ~= nil then
                        u130 = u130.Position
                    end
                end
                if u130 == nil then
                    return nil
                else
                    local v131 = u24.Client:WaitFor("ProjectileFire")
                    local function v133(p132) --[[ Line: 386 ]]
                        --[[
                        Upvalues:
                            [1] = u97
                            [2] = u99
                            [3] = u104
                            [4] = u106
                            [5] = u130
                            [6] = u105
                            [7] = u126
                            [8] = u107
                            [9] = u16
                        --]]
                        p132:CallServerAsync(u97, u99, u104, u106, u130, u105, u126, u107, u16:GetServerTimeNow() - 0.045)
                    end
                    local v134 = u1.await(v131:andThen(v133))
                    if v134 and v134.PrimaryPart then
                        return v134
                    else
                        return nil
                    end
                end
            end
        end
    else
        return nil
    end
end)
function u28.createLocalProjectile(_, p135, p136, p137, p138, u139, p140, p141, p142, p143, p144) --[[ Line: 395 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u14
        [3] = u20
        [4] = u21
        [5] = u7
        [6] = u24
        [7] = u17
    --]]
    local u145
    if p137 then
        u145 = u23[p137]
    else
        u145 = nil
    end
    local v146 = u14.LocalPlayer.Character:GetPrimaryPartCFrame()
    local v147
    if p135 then
        v147 = p135.relativeOverride
    elseif p142 == nil then
        v147 = p142
    else
        v147 = p142.relativeOverride
    end
    local v148 = u20
    local v149 = u21:getLocalPlayerEntity()
    local v150 = {}
    local v151
    if p142 == nil then
        v151 = p142
    else
        v151 = p142.projectileModel
    end
    v150.projectileModel = v151
    local v152
    if p142 == nil then
        v152 = p142
    else
        v152 = p142.projectileNameOverride
    end
    v150.projectileName = v152
    local v153
    if p142 == nil then
        v153 = p142
    else
        v153 = p142.projectileModelScale
    end
    v150.projectileModelScale = v153
    local u154 = v148.createProjectile(v149, p137, p136, v146, v150)
    if not u154 then
        return nil
    end
    local v155
    if u145 == nil then
        v155 = u145
    else
        v155 = u145.useServerModel
    end
    if not v155 then
        u20.setupProjectileConstantOrientation(u154, u14.LocalPlayer, p141.shotId)
        local v156 = 1
        local v157 = p141.drawDurationSec ~= nil
        if v157 then
            if p135 == nil then
                v157 = p135
            else
                v157 = p135.maxStrengthChargeSec
            end
        end
        if v157 ~= 0 and (v157 == v157 and v157) then
            local v158 = p141.drawDurationSec / p135.maxStrengthChargeSec
            v156 = math.clamp(v158, 0, 1)
        end
        local v159
        if p142 == nil then
            v159 = p142
        else
            v159 = p142.launchSound
        end
        if v159 ~= "" and v159 then
            u7:playSound(p142.launchSound, {
                ["position"] = p138
            })
        end
        local v160 = p143 or u21:getLocalPlayerEntity()
        local v161 = u20
        local v162
        if u145 == nil then
            v162 = u145
        else
            v162 = u145.gravitationalAcceleration
        end
        local v163 = v162 == nil and 196.2 or v162
        v161.fireProjectile(v160, u154, u139, p138, p140, v163, function(p164, p165) --[[ Line: 476 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u24
                [3] = u139
                [4] = u17
                [5] = u154
                [6] = u145
            --]]
            local v166 = u21:getEntityFromDescendant(p165)
            local v167 = u24.Client:Get("ProjectileHit")
            local v168 = u139
            local v169
            if v166 == nil then
                v169 = v166
            else
                v169 = v166:getInstance()
            end
            v167:SendToServer(v168, v169)
            u17.LocalProjectileImpact:fire(u154, p164, v166, p165)
            local v170 = u145
            if v170 ~= nil then
                v170 = v170.returnOnHit
            end
            local v171 = not v170
            if v171 then
                local v172 = u145
                if v172 ~= nil then
                    v172 = v172.keepProjectileOnHit
                end
                v171 = not (v172 and v166)
            end
            if v171 then
                u154:Destroy()
            end
        end, nil, p141, {
            ["relative"] = v147,
            ["drawPercent"] = v156,
            ["projectileSource"] = p144
        })
        return u154
    end
    u154:Destroy()
end
function u28.calculateImportantLaunchValues(p173, p174, p175, p176, p177) --[[ Line: 516 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u14
        [3] = u27
    --]]
    local v178 = p177 or p173:getLaunchPosition(p176)
    if not v178 then
        return nil
    end
    local v179 = p174:getProjectileMeta()
    local v180
    if v179.getProjectileOverridesFunction then
        v180 = v179.getProjectileOverridesFunction(p174.player)
    else
        v180 = nil
    end
    local v181
    if v180 == nil then
        v181 = v180
    else
        v181 = v180.launchVelocityOverride
    end
    if v181 == nil then
        local v182 = v179.launchVelocity
        v181 = v182 == nil and 100 or v182
    end
    local v183 = v181 * p174.velocityMultiplier
    local v184 = v179.gravitationalAcceleration
    local v185 = (v184 == nil and 196.2 or v184) * p174.gravityMultiplier
    local v186
    if v180 == nil then
        v186 = v180
    else
        v186 = v180.lifetimeOverride
    end
    if v186 == nil then
        v186 = v179.lifetimeSec
    end
    if v180 ~= nil then
        v180 = v180.predictionLifetimeOverride
    end
    if v180 == nil then
        v180 = v179.predictionLifetimeSec
    end
    if p175 then
        v186 = v180
    end
    local v187 = v186 == nil and 3 or v186
    local v188 = u16.CurrentCamera.CFrame
    local v189 = v178 + p174.fromPositionOffset
    local v190
    if p174.targetPoint == nil or p174.lockedAimPoint then
        local v191 = u14.LocalPlayer:GetMouse()
        local v192 = Vector2.new(v191.X, v191.Y)
        local v193 = p174.inputInfo
        if v193 then
            v192 = v193.initialPosition
        end
        if p174.lockedAimPoint then
            v192 = p174.lockedAimPoint
        end
        if p174.startAtCenterOfCamera then
            local v194 = u16.CurrentCamera.ViewportSize
            v192 = Vector2.new(v194.X / 2, v194.Y / 2)
        end
        local v195 = u16.CurrentCamera:ScreenPointToRay(v192.X, v192.Y).Unit.Direction
        local v196 = u27.YTargetOffset
        local v197 = (v195 + Vector3.new(0, v196, 0)).Unit
        v190 = (v188.Position + v197 * ((v188.Position - v189).Magnitude * u27.CameraMultiplier) - v189).Unit
    else
        v190 = (p174.targetPoint - v189).Unit
    end
    return {
        ["initialVelocity"] = v190 * v183,
        ["positionFrom"] = v189,
        ["deltaT"] = v187,
        ["gravitationalAcceleration"] = v185,
        ["drawDurationSeconds"] = p174.drawDurationSeconds
    }
end
function u28.enableBeam(u198, u199, u200, u201, p202) --[[ Line: 613 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u5
        [3] = u4
        [4] = u13
        [5] = u10
        [6] = u16
        [7] = u15
        [8] = u27
        [9] = u9
    --]]
    if u199 ~= u198.targetingId then
        return nil
    end
    local v203 = {
        ["Transparency"] = 1,
        ["CanCollide"] = false,
        ["Anchored"] = true,
        ["Parent"] = u198.projectileTargetingFolder
    }
    local u204 = u11("Part", v203)
    local u205 = u11("Part", v203)
    u5:setQueryIgnored(u204, true)
    u5:setQueryIgnored(u205, true)
    u198.targetingMaid:GiveTask(u204)
    u198.targetingMaid:GiveTask(u205)
    local v206 = u11("Attachment", {
        ["Parent"] = u204
    })
    local v207 = u11("Attachment", {
        ["Parent"] = u205
    })
    local v208 = u4.isMobileControls() and 3 or 1
    local v209 = {
        ["FaceCamera"] = true,
        ["Segments"] = 300,
        ["Brightness"] = 1,
        ["Attachment0"] = v206,
        ["Attachment1"] = v207
    }
    local v210
    if p202 == nil then
        v210 = p202
    else
        v210 = p202.color
    end
    local v211
    if v210 then
        v211 = p202.color
    else
        v211 = ColorSequence.new(Color3.fromRGB(255, 229, 127))
    end
    v209.Color = v211
    v209.Transparency = NumberSequence.new(0)
    v209.Width0 = v208 * 0.08
    v209.Width1 = (0.08 + 2.22 * ((u204.Position - u205.Position).Magnitude / 100)) * v208
    v209.Parent = u198.projectileTargetingFolder
    local u212 = u11("Beam", v209)
    u13:AddTag(u212, "projectile-preview-beam")
    u198.targetingMaid:GiveTask(u212)
    u10.new()
    local u213 = u200:getProjectileMeta()
    local v214 = u16:FindFirstChild("Map")
    local u215 = RaycastParams.new()
    if v214 then
        u215.FilterType = Enum.RaycastFilterType.Include
        u215.FilterDescendantsInstances = { v214 }
    end
    local u216 = false
    local u217 = Vector3.new(0, 0, 0)
    local u218 = Vector3.new(0, 0, 0)
    local u219 = nil
    local u220 = Vector3.new(0, 0, 0)
    local u221 = nil
    u198.targetingMaid:GiveTask(function() --[[ Line: 676 ]]
        --[[
        Upvalues:
            [1] = u198
        --]]
        if u198.hitIndicatorPart then
            u198.hitIndicatorPart.Transparency = 1
        end
    end)
    local v222 = u198:calculateImportantLaunchValues(u200, true, u201)
    local u223
    if v222 == nil then
        u223 = v222
    else
        u223 = v222.initialVelocity
    end
    local u224
    if v222 == nil then
        u224 = v222
    else
        u224 = v222.positionFrom
    end
    local u225
    if v222 == nil then
        u225 = v222
    else
        u225 = v222.deltaT
    end
    if v222 ~= nil then
        v222 = v222.gravitationalAcceleration
    end
    local u226 = v222
    u15:BindToRenderStep("projectile-beam-targeting", Enum.RenderPriority.Camera.Value + 1, function() --[[ Line: 703 ]]
        --[[
        Upvalues:
            [1] = u199
            [2] = u198
            [3] = u200
            [4] = u201
            [5] = u223
            [6] = u224
            [7] = u225
            [8] = u226
            [9] = u27
            [10] = u204
            [11] = u205
            [12] = u212
            [13] = u216
            [14] = u213
            [15] = u219
            [16] = u9
            [17] = u217
            [18] = u218
            [19] = u220
            [20] = u16
            [21] = u221
            [22] = u215
            [23] = u13
        --]]
        if u199 ~= u198.targetingId then
            return nil
        end
        local v227 = u198:calculateImportantLaunchValues(u200, true, u201)
        if not v227 then
            u198:disableTargeting()
            return nil
        end
        u223 = v227.initialVelocity
        u224 = v227.positionFrom
        u225 = v227.deltaT
        u226 = v227.gravitationalAcceleration
        local v228 = u224
        local v229 = u224
        local v230 = u223
        local v231 = CFrame.new(v228, v229 + v230)
        local v232 = CFrame.new
        local v233 = u27.RelX
        local v234 = u27.RelY
        local v235 = u27.RelZ
        u224 = (v231 * v232((Vector3.new(v233, v234, v235)))).Position
        local v236 = u225 / 2
        local v237 = u223.X * v236 + u224.X
        local v238 = u225 / 2
        local v239 = -0.5 * u226 * v238 ^ 2 + u223.Y * v238 + u224.Y
        local v240 = u225 / 2
        local v241 = u223.Z * v240 + u224.Z
        local v242 = Vector3.new(v237, v239, v241)
        local v243 = u225
        local v244 = u223.X * v243 + u224.X
        local v245 = u225
        local v246 = -0.5 * u226 * v245 ^ 2 + u223.Y * v245 + u224.Y
        local v247 = u225
        local v248 = u223.Z * v247 + u224.Z
        local v249 = Vector3.new(v244, v246, v248)
        local v250 = (v242 - u224 * 0.25 - v249 * 0.25) * 2
        local v251 = v250 * 0.6666666666666666 + u224 * 0.3333333333333333
        local v252 = v250 * 0.6666666666666666 + v249 * 0.3333333333333333
        u204.CFrame = CFrame.new(u224, v251) * CFrame.Angles(0, 1.5707963267948966, 0)
        u205.CFrame = CFrame.new(v249, v252) * CFrame.Angles(0, -1.5707963267948966, 0)
        u212.CurveSize0 = (v251 - u204.Position).Magnitude
        u212.CurveSize1 = (v252 - u205.Position).Magnitude
        u212.Width1 = 0.08 + u27.BeamGrowthMultiplier * ((u204.Position - u205.Position).Magnitude / 100)
        u216 = false
        if u213.showIndicatorAtAimingBeamHit then
            local v253 = {
                u224,
                v251,
                v242,
                v252,
                v249
            }
            u219 = u9.new(v253)
            local v254 = false
            local v255 = 0
            while true do
                if v254 then
                    v255 = v255 + 1
                else
                    v254 = true
                end
                if v255 >= 10 then
                    break
                end
                u217 = u219:calculate(v255 / 10)
                u218 = u219:calculate((v255 + 1) / 10)
                u220 = u218 - u217
                u221 = u16:Raycast(u217, u220.Unit * (u220.Magnitude * 0.97), u215)
                if u221 and not u13:HasTag(u221.Instance, "DontBlockProjectileRaycast") then
                    u198:showHitIndicator(u221.Position, Color3.fromRGB(56, 194, 33), u213.hitIndicatorConfig, u213.customHitIndicator)
                    u216 = true
                    break
                end
            end
            if not u216 then
                u198:showHitIndicator(v249, Color3.fromRGB(199, 41, 41), u213.hitIndicatorConfig, u213.customHitIndicator)
            end
        end
    end)
    u198.targetingMaid:GiveTask(function() --[[ Line: 805 ]]
        --[[
        Upvalues:
            [1] = u15
        --]]
        return u15:UnbindFromRenderStep("projectile-beam-targeting")
    end)
end
function u28.showHitIndicator(p256, p257, p258, p259, p260) --[[ Line: 809 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u11
        [3] = u16
    --]]
    if p260 == "" or not p260 then
        if p256.hitIndicatorPart == nil then
            local v261 = {
                ["CastShadow"] = false,
                ["Anchored"] = true
            }
            local v262
            if p259 == nil then
                v262 = p259
            else
                v262 = p259.radius
            end
            local v263
            if v262 == 0 or (v262 ~= v262 or not v262) then
                v263 = Vector3.new(2, 2, 2)
            else
                local v264 = p259.radius
                local v265 = p259.radius
                local v266 = p259.radius
                v263 = Vector3.new(v264, v265, v266)
            end
            v261.Size = v263
            v261.TopSurface = Enum.SurfaceType.Smooth
            v261.Material = Enum.Material.Neon
            local v267
            if p259 == nil then
                v267 = p259
            else
                v267 = p259.color
            end
            if v267 == nil then
                v267 = p258
            end
            v261.Color = v267
            v261.Position = p257
            v261.CanCollide = false
            v261.CanQuery = false
            v261.CanTouch = false
            v261.Shape = Enum.PartType.Ball
            local v268
            if p259 == nil then
                v268 = p259
            else
                v268 = p259.transparency
            end
            v261.Transparency = v268 == nil and 0.5 or v268
            p256.hitIndicatorPart = u11("Part", v261)
            p256.hitIndicatorPart.Parent = u16
        end
        p256.hitIndicatorPart:PivotTo(CFrame.new(p257))
        local v269
        if p259 == nil then
            v269 = p259
        else
            v269 = p259.color
        end
        if v269 ~= nil then
            p258 = v269
        end
        p256.hitIndicatorPart.Color = p258
        if p259 ~= nil then
            p259 = p259.transparency
        end
        local v270 = p259 == nil and 0.5 or p259
        p256.hitIndicatorPart.Transparency = v270
    elseif p260 == "spirit_summoner" then
        u8.Controllers.SpiritSummonerIndicatorController:showHitIndicator(p257, p256.targetingMaid)
        return
    end
end
return {
    ["ProjectileController"] = u8.CreateController(u28.new())
}