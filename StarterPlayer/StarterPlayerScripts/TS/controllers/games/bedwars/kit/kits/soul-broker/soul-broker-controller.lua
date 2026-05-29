local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out", "util", "map-util").MapUtil
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.AnimationUtil
local u6 = v4.ColorUtil
local u7 = v4.SoundManager
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v9 = v8.KnitClient
local u10 = v8.KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u16 = v15.Players
local u17 = v15.ReplicatedStorage
local u18 = v15.RunService
local u19 = v15.TweenService
local u20 = v15.Workspace
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "soul-broker", "soul-broker-constants").SoulBrokerConstants
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "raycast", "raycast-util").RaycastUtil
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil
local u35 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u36 = v1.import(script, script.Parent, "ui", "soul-link-indicator").SoulLinkIndicator
local u37 = v1.import(script, script.Parent, "ui", "soul-target").SoulTarget
local u38 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 46 ]]
        return "SoulBrokerController"
    end,
    ["__index"] = u35
})
u38.__index = u38
function u38.new(...) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u38
    --]]
    local v39 = u38
    local v40 = setmetatable({}, v39)
    return v40:constructor(...) or v40
end
function u38.constructor(p41) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u35
        [2] = u26
    --]]
    u35.constructor(p41, u26.SOUL_BROKER)
    p41.Name = "SoulBrokerController"
    p41.soulLinkMaids = {}
    p41.beamMap = {}
    p41.enemyLinksMap = {}
    p41.allyLinksMap = {}
end
function u38.KnitStart(p42) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u35
    --]]
    u35.KnitStart(p42)
end
function u38.onKitLocalActivated(u43, p44) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u31
        [3] = u28
        [4] = u17
        [5] = u30
        [6] = u16
        [7] = u25
        [8] = u20
        [9] = u19
        [10] = u7
        [11] = u3
    --]]
    u10.Controllers.PreloadController:runPreload({
        ["sounds"] = {
            u31.SOUL_LINK_APPLY_ALLY,
            u31.SOUL_LINK_APPLY_ENEMY,
            u31.SOUL_LINK_DAMAGE_ALLY,
            u31.SOUL_LINK_DAMAGE_ENEMY
        },
        ["imageIds"] = {
            u28.SKULL_SOLID,
            u28.HEART,
            u28.SOUL_LINK_ICON,
            u28.SOUL_UNLINK_ICON
        },
        ["instances"] = {
            u17.Assets.Effects.SoulLinkOrb,
            u17.Assets.Effects.SoulLinkEffect,
            u17.Assets.Effects.SoulGuardEffect,
            u17.Assets.Effects.SoulLinkBeams
        }
    })
    u43:initializeTargetting(p44)
    p44:GiveTask(u30.Client:Get("SoulLinkRemoved"):Connect(function(p45) --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u43
            [3] = u25
        --]]
        local v46 = u16.LocalPlayer == p45.broker
        if p45.guard then
            local v47 = u43.allyLinksMap[p45.broker]
            if not v47 then
                return nil
            end
            local v48 = u25:getEntity(p45.broker)
            if v48 ~= nil then
                v48 = v48:getInstance()
            end
            if v48 then
                u43:detachBeam(p45.target, v48)
            end
            local v49 = u43.allyLinksMap
            local v50 = p45.broker
            local v51 = 0
            local v52 = {}
            for v53, v54 in v47 do
                local _ = v53 - 1
                if v54 ~= p45.target == true then
                    v51 = v51 + 1
                    v52[v51] = v54
                end
            end
            v49[v50] = v52
        else
            local v55 = u43.enemyLinksMap[p45.broker]
            if not v55 then
                return nil
            end
            for v56, v57 in v55 do
                local _ = v56 - 1
                u43:detachBeam(p45.target, v57)
                u43:detachBeam(v57, p45.target)
            end
            local v58 = u43.enemyLinksMap
            local v59 = p45.broker
            local v60 = 0
            local v61 = {}
            for v62, v63 in v55 do
                local _ = v62 - 1
                if v63 ~= p45.target == true then
                    v60 = v60 + 1
                    v61[v60] = v63
                end
            end
            v58[v59] = v61
        end
        if v46 then
            local v64 = u43.soulLinkMaids[p45.target]
            if v64 then
                v64:DoCleaning()
                v64:Destroy()
                u43.soulLinkMaids[p45.target] = nil
            end
            if next(u43.soulLinkMaids) == nil and u43.soulUnlinkAbilityRef then
                u43.soulUnlinkAbilityRef.Destroy()
                u43.soulUnlinkAbilityRef = nil
            end
        end
    end))
    p44:GiveTask(u30.Client:Get("SoulLinkDamage"):Connect(function(p65) --[[ Line: 160 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u20
            [3] = u19
            [4] = u7
            [5] = u31
            [6] = u43
        --]]
        local v66 = p65.to:GetPivot().Position
        local u67 = u17.Assets.Effects.SoulLinkOrb:Clone()
        local v68 = p65.damage / 50
        u67.Size = Vector3.new(5, 5, 5) * math.clamp(v68, 0.2, 1)
        u67.Parent = u20
        u67.Position = p65.from:GetPivot().Position
        local v69 = u19:Create(u67, TweenInfo.new(0.2, Enum.EasingStyle.Cubic), {
            ["Position"] = v66
        })
        v69:Play()
        v69.Completed:Once(function() --[[ Line: 172 ]]
            --[[
            Upvalues:
                [1] = u67
            --]]
            u67:Destroy()
        end)
        local v70 = u7
        local v71
        if p65.guard then
            v71 = u31.SOUL_LINK_DAMAGE_ALLY
        else
            v71 = u31.SOUL_LINK_DAMAGE_ENEMY
        end
        v70:playSound(v71, {
            ["position"] = v66
        })
        local v72 = u43:findBeam(p65.from, p65.to)
        local function v74(u73) --[[ Line: 179 ]]
            --[[
            Upvalues:
                [1] = u19
            --]]
            if u73 then
                u19:Create(u73, TweenInfo.new(0.1, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {
                    ["Brightness"] = 8,
                    ["Width0"] = 4,
                    ["Width1"] = 4
                }):Play()
                task.delay(0.1, function() --[[ Line: 187 ]]
                    --[[
                    Upvalues:
                        [1] = u19
                        [2] = u73
                    --]]
                    u19:Create(u73, TweenInfo.new(0.1, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {
                        ["Brightness"] = 4,
                        ["Width0"] = 1,
                        ["Width1"] = 1
                    }):Play()
                end)
            end
        end
        local v75
        if v72 == nil then
            v75 = v72
        else
            v75 = v72.beamBack
        end
        v74(v75)
        local v76
        if v72 == nil then
            v76 = v72
        else
            v76 = v72.beamFront
        end
        v74(v76)
        local v77
        if v72 == nil then
            v77 = v72
        else
            v77 = v72.beamStream
        end
        v74(v77)
        if v72 ~= nil then
            v72 = v72.beamParticle
        end
        v74(v72)
    end))
    p44:GiveTask(u30.Client:Get("SoulLinkFormed"):Connect(function(p78) --[[ Line: 218 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u3
            [3] = u43
        --]]
        if p78.guard then
            local v79 = u25:getEntity(p78.broker)
            if v79 ~= nil then
                v79 = v79:getInstance()
            end
            if v79 then
                local v80 = u3.getOrCreate(u43.allyLinksMap, p78.broker, {})
                local v81 = p78.target
                table.insert(v80, v81)
                u43:attachBeam(p78.target, v79, true)
                u43.allyLinksMap[p78.broker] = v80
                return
            end
        else
            local v82 = u3.getOrCreate(u43.enemyLinksMap, p78.broker, {})
            for v83, v84 in v82 do
                local _ = v83 - 1
                u43:attachBeam(p78.target, v84)
            end
            local v85 = p78.target
            table.insert(v82, v85)
            u43.enemyLinksMap[p78.broker] = v82
        end
    end))
end
function u38.onKitLocalDeactivated(_) --[[ Line: 250 ]] end
function u38.onKitReplicationActivated(_, _) --[[ Line: 252 ]] end
function u38.onKitReplicationDeactivated(_) --[[ Line: 254 ]] end
function u38.onInnateAbilityEnabled(_, _, _) --[[ Line: 256 ]] end
function u38.onAbilityUsed(u86, p87, p88) --[[ Line: 258 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u25
        [3] = u21
        [4] = u30
        [5] = u11
        [6] = u12
        [7] = u14
        [8] = u36
        [9] = u7
        [10] = u31
        [11] = u17
        [12] = u20
        [13] = u33
        [14] = u5
        [15] = u24
        [16] = u23
        [17] = u2
        [18] = u22
    --]]
    if p88:isCancelled() then
        return nil
    elseif p87 == u16.LocalPlayer.Character then
        local u89 = u25:getEntity(u16.LocalPlayer)
        local v90 = p88.ability
        if v90 == u21.SOUL_LINK then
            u30.Client:Get("AttemptSoulLink"):CallServerAsync(u86.target):andThen(function(p91) --[[ Line: 271 ]]
                --[[
                Upvalues:
                    [1] = u89
                    [2] = u25
                    [3] = u11
                    [4] = u12
                    [5] = u86
                    [6] = u14
                    [7] = u36
                    [8] = u7
                    [9] = u31
                    [10] = u17
                    [11] = u20
                    [12] = u33
                    [13] = u5
                    [14] = u16
                    [15] = u24
                    [16] = u23
                    [17] = u2
                    [18] = u21
                    [19] = u22
                --]]
                if p91 then
                    if not p91.result then
                        return nil
                    end
                    local v92 = p91.targetEntityInstance
                    if not v92 then
                        return nil
                    end
                    if not u89 then
                        return nil
                    end
                    local v93 = u25:getEntity(v92)
                    if not v93 then
                        return nil
                    end
                    local v94 = u11
                    local v95
                    if v92 == nil then
                        v95 = v92
                    else
                        v95 = v92.Name
                    end
                    v94.Info("[SOUL BROKER] Adding soul link " .. v95)
                    local v96 = u89:canAttack(v93)
                    local v97 = u12.new()
                    u86.soulLinkMaids[v92] = v97
                    local u98 = u14.mount(u14.createElement(u36, {
                        ["IsEnemy"] = v96
                    }), v92)
                    v97:GiveTask(function() --[[ Line: 300 ]]
                        --[[
                        Upvalues:
                            [1] = u14
                            [2] = u98
                        --]]
                        return u14.unmount(u98)
                    end)
                    local u99 = u86:highlightLinkedEntity(v92, not v96)
                    v97:GiveTask(function() --[[ Line: 305 ]]
                        --[[
                        Upvalues:
                            [1] = u99
                        --]]
                        return u99:Destroy()
                    end)
                    local v100 = u7
                    local v101
                    if v96 then
                        v101 = u31.SOUL_LINK_APPLY_ENEMY
                    else
                        v101 = u31.SOUL_LINK_APPLY_ALLY
                    end
                    v100:playSound(v101)
                    local v102
                    if v96 then
                        v102 = u17.Assets.Effects.SoulLinkEffect:Clone()
                    else
                        v102 = u17.Assets.Effects.SoulGuardEffect:Clone()
                    end
                    v102.CFrame = v92:GetPivot()
                    v102.Parent = u20
                    u33:playEffects({ v102 }, nil)
                    u5:playAnimation(u16.LocalPlayer, u24:getAssetId(u23.RAVEN_THROW), {
                        ["looped"] = false
                    })
                    if not u86.soulUnlinkAbilityRef then
                        local v103 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
                        local v104 = u21.SOUL_UNLINK
                        local v105 = {}
                        for v106, v107 in u22[u21.SOUL_UNLINK].triggerConfig do
                            v105[v106] = v107
                        end
                        v103:enableAbility(v104, v105):andThen(function(p108) --[[ Line: 328 ]]
                            --[[
                            Upvalues:
                                [1] = u86
                            --]]
                            u86.soulUnlinkAbilityRef = p108
                        end)
                    end
                end
            end)
        elseif v90 == u21.SOUL_UNLINK then
            u11.Info("[SOUL BROKER] Attempting soul unlink")
            u30.Client:Get("AttemptSoulUnlink"):CallServerAsync()
        end
    else
        return nil
    end
end
function u38.initializeTargetting(u109, p110) --[[ Line: 344 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u20
        [3] = u16
        [4] = u25
        [5] = u34
        [6] = u27
        [7] = u29
        [8] = u14
        [9] = u37
    --]]
    local u111 = 0
    p110:GiveTask(u18.Heartbeat:Connect(function(p112) --[[ Line: 346 ]]
        --[[
        Upvalues:
            [1] = u111
            [2] = u20
            [3] = u109
            [4] = u16
            [5] = u25
            [6] = u34
            [7] = u27
            [8] = u29
            [9] = u14
            [10] = u37
        --]]
        u111 = u111 + p112
        if u111 < 0.05 then
            return nil
        end
        u111 = u111 - 0.05
        local v113 = u20.CurrentCamera
        if v113 ~= nil then
            v113 = v113.CFrame
        end
        if not v113 then
            u109:removeTarget()
            return nil
        end
        local v114 = u16.LocalPlayer.Character
        local v115
        if v114 == nil then
            v115 = v114
        else
            v115 = v114.PrimaryPart
            if v115 ~= nil then
                v115 = v115.Position
            end
        end
        if not v115 then
            u109:removeTarget()
            return nil
        end
        if not u25:getLocalPlayerEntity() then
            u109:removeTarget()
            return nil
        end
        local v116 = u34.getEntitiesWithinRadius(v113.Position, u27.TARGETTING_RANGE)
        local v117 = Ray.new(v113.Position, v113.LookVector).Unit
        local v118 = v113.LookVector
        local v119 = (1 / 0)
        local v120 = nil
        for _, v121 in v116 do
            local v122 = u16:GetPlayerFromCharacter(v121:getInstance())
            local v123
            if v122 == nil then
                v123 = v122
            else
                v123 = v122:HasTag("PlayerHidden")
            end
            if not v123 and v122 ~= u16.LocalPlayer then
                local v124 = v121:getInstance():GetPivot().Position
                if (v124 - v113.Position):Dot(v118) >= 0 then
                    local v125 = v117:ClosestPoint(v124)
                    local v126 = (v124 - v125).Magnitude
                    if u27.TARGETTING_RANGE >= v126 then
                        local v127 = v126 + (v117.Origin - v125).Magnitude / 3
                        if v119 > v127 and u29.isUnblocked(v114, v121) then
                            v120 = v121:getInstance()
                            v119 = v127
                        end
                    end
                end
            end
        end
        if u109.target ~= v120 then
            u109:removeTarget()
            if v120 then
                u109.targetIcon = u14.mount(u14.createElement(u37), v120.PrimaryPart)
            end
        end
        u109:setTarget(v120)
    end))
end
function u38.removeTarget(p128) --[[ Line: 430 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    p128.target = nil
    if p128.targetIcon then
        u14.unmount(p128.targetIcon)
    end
end
function u38.setTarget(p129, p130) --[[ Line: 436 ]]
    p129.target = p130
end
function u38.attachBeam(u131, u132, u133, u134) --[[ Line: 439 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u13
        [3] = u6
        [4] = u19
        [5] = u12
        [6] = u18
        [7] = u27
    --]]
    if u132 == u133 then
        return nil
    end
    local u135 = u17.Assets.Effects.SoulLinkBeams
    local u136 = TweenInfo.new(0.33, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, (1 / 0), true)
    local v137 = u132:FindFirstChild("UpperTorso")
    if v137 ~= nil then
        v137 = v137:FindFirstChild("BodyFrontAttachment")
    end
    local v138 = u133:FindFirstChild("UpperTorso")
    if v138 ~= nil then
        v138 = v138:FindFirstChild("BodyFrontAttachment")
    end
    local u139 = v137 or u13("Attachment", {
        ["Parent"] = u132.PrimaryPart
    })
    local u140 = v138 or u13("Attachment", {
        ["Parent"] = u133.PrimaryPart
    })
    local v141 = {}
    local v142 = {}
    local v143 = ColorSequence.new(Color3.fromRGB(0, 255, 195))
    local v144 = ColorSequence.new
    local v145
    if u134 then
        v145 = u6.WHITE
    else
        v145 = u6.BLACK
    end
    __set_list(v142, 1, {v143, v144(v145)})
    __set_list(v141, 1, {v142})
    if u139 and u140 then
        local function u152(p146, p147, p148, p149) --[[ Line: 467 ]]
            --[[
            Upvalues:
                [1] = u140
                [2] = u139
                [3] = u132
                [4] = u19
                [5] = u136
            --]]
            p146.Color = p147
            local v150
            if p149 then
                v150 = u140
            else
                v150 = u139
            end
            p146.Attachment0 = v150
            local v151
            if p149 then
                v151 = u139
            else
                v151 = u140
            end
            p146.Attachment1 = v151
            p146.Parent = u132
            p146.Brightness = 4
            u19:Create(p146, u136, {
                ["CurveSize0"] = -1,
                ["CurveSize1"] = 1,
                ["Width0"] = 1,
                ["Width1"] = 1
            }):Play()
            p148:GiveTask(p146)
            return p146
        end
        local function v165(p153) --[[ Line: 483 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u152
                [3] = u135
                [4] = u134
                [5] = u18
                [6] = u132
                [7] = u133
                [8] = u27
                [9] = u131
            --]]
            local v154 = u12.new()
            local u155 = u152(u135.Beam1:Clone(), p153[1], v154)
            local u156 = u152(u135.Beam1:Clone(), p153[2], v154)
            local u157 = u152(u135.Beam3:Clone(), p153[1], v154, not u134)
            local u158 = u152(u135.Beam4:Clone(), p153[2], v154, not u134)
            v154:GiveTask(u18.Heartbeat:Connect(function() --[[ Line: 489 ]]
                --[[
                Upvalues:
                    [1] = u132
                    [2] = u133
                    [3] = u134
                    [4] = u27
                    [5] = u155
                    [6] = u156
                    [7] = u157
                    [8] = u158
                --]]
                local v159 = (u132:GetPivot().Position - u133:GetPivot().Position).Magnitude
                local v160
                if u134 then
                    v160 = v159 / u27.SOUL_GUARD_MAX_DISTANCE
                else
                    v160 = v159 / u27.SOUL_LINK_MAX_DISTANCE
                end
                local v161 = math.max(v160, 0.1)
                u155.Transparency = NumberSequence.new(v161)
                u156.Transparency = NumberSequence.new(v161)
                u157.Transparency = NumberSequence.new(v161)
                u158.Transparency = NumberSequence.new(v161)
            end))
            local v162 = u131.beamMap[u132]
            if v162 then
                local v163 = {
                    ["target"] = u133,
                    ["maid"] = v154,
                    ["beamFront"] = u155,
                    ["beamBack"] = u156,
                    ["beamStream"] = u157,
                    ["beamParticle"] = u158
                }
                table.insert(v162, v163)
            else
                local v164 = {
                    {
                        ["target"] = u133,
                        ["maid"] = v154,
                        ["beamFront"] = u155,
                        ["beamBack"] = u156,
                        ["beamStream"] = u157,
                        ["beamParticle"] = u158
                    }
                }
                u131.beamMap[u132] = v164
            end
        end
        for v166, v167 in v141 do
            v165(v167, v166 - 1, v141)
        end
    end
end
function u38.detachBeam(p168, p169, p170) --[[ Line: 531 ]]
    local v171 = p168.beamMap[p169]
    local v172
    if v171 == nil then
        v172 = v171
    else
        local v173 = 0
        v172 = {}
        for v174, v175 in v171 do
            local _ = v174 - 1
            if v175.target == p170 == true then
                v173 = v173 + 1
                v172[v173] = v175
            end
        end
    end
    if v171 ~= nil then
        local v176 = 0
        v171 = {}
        for v177, v178 in v171 do
            local _ = v177 - 1
            if v178.target ~= p170 == true then
                v176 = v176 + 1
                v171[v176] = v178
            end
        end
    end
    if v171 then
        p168.beamMap[p169] = v171
        if #v171 == 0 then
            p168.beamMap[p169] = nil
        end
    end
    if v172 ~= nil then
        for v179, v180 in v172 do
            local _ = v179 - 1
            v180.maid:DoCleaning()
            v180.maid:Destroy()
        end
    end
end
function u38.findBeam(p181, p182, p183) --[[ Line: 592 ]]
    local v184 = p181.beamMap[p182]
    if v184 ~= nil then
        v184 = nil
        for v185, v186 in v184 do
            local _ = v185 - 1
            if v186.target == p183 == true then
                v184 = v186
                break
            end
        end
    end
    local v187 = p181.beamMap[p183]
    if v187 ~= nil then
        v187 = nil
        for v188, v189 in v187 do
            local _ = v188 - 1
            if v189.target == p182 == true then
                v187 = v189
                break
            end
        end
    end
    return v184 or v187
end
function u38.highlightLinkedEntity(_, p190, p191) --[[ Line: 635 ]]
    --[[
    Upvalues:
        [1] = u32
        [2] = u13
        [3] = u6
        [4] = u27
    --]]
    local v192 = p190:GetAttribute("EntityUUID")
    local v193
    if v192 == "" or not v192 then
        v193 = nil
    else
        v193 = u32:getGameEntity(v192)
    end
    local v194 = u13
    local v195 = "Highlight"
    local v196 = {
        ["Name"] = "SoulLinkHighlight",
        ["FillTransparency"] = 1,
        ["Parent"] = v193 or p190
    }
    local v197
    if p191 then
        v197 = u6.WHITE
    else
        v197 = u27.SOUL_LINK_COLOR
    end
    v196.OutlineColor = v197
    return v194(v195, v196)
end
v9.CreateController(u38.new())
return nil