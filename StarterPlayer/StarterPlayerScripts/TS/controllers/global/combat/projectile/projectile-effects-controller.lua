local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u6 = v5.KnitClient
local u7 = v5.KnitClient
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u10 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local v11 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network")
local u12 = v11.ProjectileImpactZap
local u13 = v11.ProjectileLaunchZap
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "projectile-util").ProjectileUtil
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").getItemSkinMeta
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-meta").ProjectileMeta
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-skin-meta").getProjectileSkinMeta
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u23 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u24 = {}
local u25 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 31 ]]
        return "ProjectileEffectController"
    end,
    ["__index"] = u10
})
u25.__index = u25
function u25.new(...) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    local v26 = u25
    local v27 = setmetatable({}, v26)
    return v27:constructor(...) or v27
end
function u25.constructor(p28, ...) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p28, ...)
    p28.Name = "ProjectileEffectController"
end
function u25.KnitStart(u29) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u9
        [3] = u7
        [4] = u12
        [5] = u21
        [6] = u20
        [7] = u4
        [8] = u3
        [9] = u22
        [10] = u14
        [11] = u17
        [12] = u25
        [13] = u13
        [14] = u16
        [15] = u1
        [16] = u15
        [17] = u19
        [18] = u8
    --]]
    u23.StartLaunchProjectile:connect(function(p30) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u7
        --]]
        if p30:isCancelled() then
            return nil
        end
        if p30.projectileSource.launchScreenShake then
            local v31 = p30.projectileSource.launchScreenShake.config
            local v32 = u9.LocalPlayer.Character
            if v32 ~= nil then
                v32 = v32:GetPrimaryPartCFrame()
            end
            if v32 then
                u7.Controllers.ScreenShakeController:shake(v32.Position, v32 * Vector3.new(-0.25, 0, -1) - v32.Position, v31)
            end
        end
    end)
    u12.On(function(p33, p34, p35, p36, p37, p38, p39, p40) --[[ Line: 141 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u21
            [3] = u20
            [4] = u4
            [5] = u3
            [6] = u9
            [7] = u22
            [8] = u14
            [9] = u17
            [10] = u25
        --]]
        local v41 = p35.Name
        local v42
        if p38 == nil then
            v42 = p38
        else
            v42 = p38.Character
        end
        local v43 = nil
        if v42 then
            local v44 = u29:getProjectileSkin(v41)
            if v44 then
                v43 = u21(v44)
            end
        end
        local v45 = {}
        for v46, v47 in u20[v41] do
            v45[v46] = v47
        end
        if v43 ~= nil then
            v43 = v43.projectileMetaOverrides
        end
        if type(v43) == "table" then
            for v48, v49 in v43 do
                v45[v48] = v49
            end
        end
        if v45.impactSound then
            local v50 = u4
            local v51 = u3.fromList
            local v52 = v45.impactSound
            v50:playSound(v51(unpack(v52)), {
                ["looped"] = false,
                ["position"] = p33
            })
        end
        if p38 == u9.LocalPlayer then
            if p40 then
                u4:playSound(u22.HEADSHOT)
            end
            if p39 ~= nil then
                p39 = p39:GetAttribute("HostingMinigame")
            end
            if p39 == true then
                u4:playSound(u22.HALLOWEEN_BOSS_HIT)
            elseif p34 ~= 0 and (p34 == p34 and p34) then
                local v53 = v45.hitSounds
                local v54 = p36 or p37
                local v55
                if v54 then
                    local v56 = u14.getProjectileSource(v41, v54)
                    if v56 then
                        local v57 = v54:GetAttribute("ItemSkin")
                        if v57 then
                            local v58 = u17(v57)
                            if v58 then
                                v56 = {}
                                for v59, v60 in v56 do
                                    v56[v59] = v60
                                end
                                local v61 = v58.projectileSourceOverrides
                                if type(v61) == "table" then
                                    for v62, v63 in v61 do
                                        v56[v62] = v63
                                    end
                                end
                            end
                        end
                        v55 = {}
                        if type(v53) == "table" then
                            for v64, v65 in v53 do
                                v55[v64] = v65
                            end
                        end
                        if v56 ~= nil then
                            v56 = v56.hitSounds
                        end
                        if type(v56) == "table" then
                            for v66, v67 in v56 do
                                v55[v66] = v67
                            end
                        end
                    else
                        v55 = v53
                    end
                else
                    v55 = v53
                end
                local v68 = v55 and v55[p34]
                if v68 then
                    u4:playSound(u3.fromList(unpack(v68)))
                end
                local v69
                if v55 == nil then
                    v69 = v55
                else
                    v69 = v55[1]
                end
                local v70 = not v69 or #v55[1] == 0
                if v70 then
                    v70 = p34 == 1
                end
                if v70 then
                    u4:playSound(u22.ARROW_HIT)
                end
            end
        end
        u25:destroyProjectile(p35)
    end)
    u13.On(function(p71, p72, u73, p74, p75, p76, p77, p78, p79, p80, p81) --[[ Line: 257 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u16
            [3] = u1
            [4] = u15
            [5] = u9
            [6] = u19
            [7] = u4
            [8] = u3
            [9] = u14
            [10] = u25
            [11] = u8
        --]]
        local v82 = u20[u73.Name]
        local v83
        if p77 then
            v83 = u16:getEntity(p77)
        else
            v83 = nil
        end
        if not u1.instanceof(v83, u15) then
            v83 = nil
        end
        local v84
        if v83 == nil then
            v84 = v83
        else
            v84 = v83:getPlayer().UserId
        end
        local v85 = v84 == u9.LocalPlayer.UserId
        if v85 then
            local v86
            if v82 == nil then
                v86 = v82
            else
                v86 = v82.useServerModel
            end
            v85 = not v86
        end
        if not v85 then
            local v87
            if v82 == nil then
                v87 = v82
            else
                v87 = v82.firedFromServer
            end
            if v87 then
                local v88
                if v82 == nil then
                    v88 = v82
                else
                    v88 = v82.useServerModel
                end
                v87 = not v88
            end
            v85 = v87 or p80
        end
        if v85 then
            u73:Destroy()
            return nil
        end
        if p75 ~= nil then
            p75 = p75.Name
        end
        if p75 == nil then
            if p76 ~= nil then
                p76 = p76.Name
            end
        else
            p76 = p75
        end
        local v89 = u19(p76)
        local v90
        if v89 == nil then
            v90 = v89
        else
            v90 = v89.projectileSource
        end
        if v90 == nil then
            if v89 ~= nil then
                v89 = v89.block
                if v89 ~= nil then
                    v89 = v89.projectileSource
                end
            end
        elseif v89 ~= nil then
            v89 = v89.projectileSource
        end
        if v89 then
            local v91
            if v83 == nil then
                v91 = v83
            else
                v91 = v83:getPlayer()
            end
            if v91 ~= u9.LocalPlayer then
                local v92
                if v89 == nil then
                    v92 = v89
                else
                    v92 = v89.launchSound
                end
                if v92 then
                    local v93 = v89.launchSoundConfig
                    local v94
                    if v93 == nil then
                        v94 = v93
                    else
                        v94 = v93.pitch
                    end
                    local v95 = u4
                    local v96 = u3
                    local v97
                    if v89 == nil then
                        v97 = v89
                    else
                        v97 = v89.launchSound
                    end
                    local v98 = v96.fromList(unpack(v97))
                    local v99 = {
                        ["position"] = p72
                    }
                    local v100
                    if v94 then
                        v100 = math.random() * (v94.Max - v94.Min) + v94.Min
                    else
                        v100 = nil
                    end
                    v99.playbackSpeedMultiplier = v100
                    if v93 ~= nil then
                        v93 = v93.volumeMultiplier
                    end
                    v99.volumeMultiplier = v93 == nil and 1 or v93
                    v95:playSound(v98, v99)
                end
                local v101 = v89.launchOverlaySound
                if v101 ~= "" and v101 then
                    local v102 = v89.launchSoundConfig
                    if v102 ~= nil then
                        v102 = v102.launchOverlayPitch
                    end
                    local v103 = u4
                    local v104 = v89.launchOverlaySound
                    local v105 = {}
                    local v106
                    if v102 then
                        v106 = math.random() * (v102.Max - v102.Min) + v102.Min
                    else
                        v106 = nil
                    end
                    v105.playbackSpeedMultiplier = v106
                    v103:playSound(v104, v105)
                end
            end
        end
        if not u73.PrimaryPart then
            u73:GetPropertyChangedSignal("PrimaryPart"):Wait()
            if not u73.PrimaryPart then
                return nil
            end
        end
        local v107
        if v82 == nil then
            v107 = v82
        else
            v107 = v82.useServerModel
        end
        local v108
        if v107 then
            v108 = u73
        else
            v108 = u73:Clone()
            v108.Parent = u73.Parent
            u73:Destroy()
        end
        local v109
        if v82 == nil then
            v109 = v82
        else
            v109 = v82.useServerModel
        end
        local v110 = not v109
        if not v110 then
            local v111
            if v83 == nil then
                v111 = v83
            else
                v111 = v83:getPlayer().UserId
            end
            v110 = v111 == u9.LocalPlayer.UserId
        end
        if v110 then
            local v112 = v108.PrimaryPart
            if v112 ~= nil then
                local v113 = v112:FindFirstChildWhichIsA("BodyForce")
                if v113 ~= nil then
                    v113:Destroy()
                end
            end
            local v114
            if p77 then
                v114 = u16:getEntity(p77)
            else
                v114 = nil
            end
            local v115 = u14
            local v116
            if v82 == nil then
                v116 = v82
            else
                v116 = v82.gravitationalAcceleration
            end
            local v117 = v116 == nil and 196.2 or v116
            local function v118(_, _) --[[ Line: 438 ]]
                --[[
                Upvalues:
                    [1] = u73
                --]]
                u73:Destroy()
            end
            local v119 = {}
            if v89 ~= nil then
                v89 = v89.relativeOverride
            end
            v119.relative = v89
            if p81 ~= nil then
                p81 = p81.detectHitTerrain
            end
            v119.detectHitTerrain = p81
            if not p79 then
                if v82 ~= nil then
                    v82 = v82.useServerModel
                end
                p79 = v82 == true
                if p79 then
                    if v83 ~= nil then
                        v83 = v83:getPlayer().UserId
                    end
                    p79 = v83 == u9.LocalPlayer.UserId
                end
            end
            v115.fireProjectile(v114, v108, p74, p72, p71, v117, v118, nil, p78, v119, p79)
        end
        u25:createProjectile(u73, v108, p71, p72, p77, p78)
        local u120 = u8.new()
        u120:GiveTask(function() --[[ Line: 475 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u73
            --]]
            u25:destroyProjectile(u73)
        end)
        if v108 then
            u120:GiveTask(v108.AncestryChanged:Once(function() --[[ Line: 479 ]]
                --[[
                Upvalues:
                    [1] = u120
                --]]
                u120:DoCleaning()
            end))
        end
        local v121 = u14.setupProjectileConstantOrientation
        local v122
        if u1.instanceof(p77, u15) then
            v122 = p77:getPlayer()
        else
            v122 = nil
        end
        u120:GiveTask(v121(v108, v122))
    end)
end
function u25.createProjectile(_, p123, p124, p125, p126, p127, p128) --[[ Line: 589 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u24
    --]]
    local v129 = p124.Name
    u23.ProjectileLaunched:fire(v129, p124, p125, p126, p127 or nil, p128)
    u24[p123] = p124
end
function u25.destroyProjectile(_, p130) --[[ Line: 596 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u23
    --]]
    local v131 = u24[p130]
    if not v131 then
        return nil
    end
    local v132 = v131.Name
    if not u23.ProjectileDestroy:fire(v132, v131):isCancelled() then
        v131:Destroy()
    end
    u24[p130] = nil
end
function u25.getClientProjectile(_, p133) --[[ Line: 610 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    return u24[p133]
end
function u25.getProjectileSkin(_, p134) --[[ Line: 614 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u6
        [3] = u18
        [4] = u21
    --]]
    local v135 = u9.LocalPlayer.Character
    if not v135 then
        return nil
    end
    local v136 = u18[u6.Controllers.KitSkinController:getKitSkin(v135)].projectileSkins
    if v136 ~= nil then
        v136 = nil
        for v137, v138 in v136 do
            local _ = v137 - 1
            if u21(v138).projectileType == p134 == true then
                v136 = v138
                break
            end
        end
    end
    return v136
end
return {
    ["ClientProjectileMap"] = u24,
    ["ProjectileEffectController"] = u6.CreateController(u25.new())
}