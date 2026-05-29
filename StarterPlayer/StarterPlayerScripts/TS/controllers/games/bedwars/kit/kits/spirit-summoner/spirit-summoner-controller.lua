local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out", "util", "map-util").MapUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scalePart
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.CollectionService
local u11 = v9.Players
local u12 = v9.ReplicatedStorage
local u13 = v9.RunService
local u14 = v9.Workspace
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-summoner", "spirit-summoner-constants").SpiritSummonerBalance
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-summoner", "summoned-spirit-type").SummonedSpiritType
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u28 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u29 = v1.import(script, script.Parent, "ui", "spirit-summoner-display").SpiritSummonerDisplay
local u30 = v1.import(script, script.Parent, "ui", "summon-stone-item-timer").SummonStoneItemTimerApp
local u31 = Color3.fromRGB(224, 69, 255)
local u32 = Color3.fromRGB(69, 232, 255)
local u33 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 38 ]]
        return "SpiritSummonerController"
    end,
    ["__index"] = u28
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
        [1] = u28
        [2] = u21
        [3] = u26
        [4] = u17
        [5] = u25
    --]]
    u28.constructor(p36, u21.SPIRIT_SUMMONER, {
        ["sounds"] = {
            u26.SPIRIT_SUMMONING,
            u26.ATTACK_SPIRIT_THROW,
            u26.HEAL_SPIRIT_THROW,
            u26.ATTACK_SPIRIT_APPEAR,
            u26.HEAL_SPIRIT_APPEAR,
            u26.SPIRIT_DISPEL,
            u26.SPIRIT_SUMMONER_CHANGE_AFFINITY
        },
        ["animations"] = {
            u17.WIZARD_BALL_CAST,
            u17.USE_GRAVESTONE,
            u17.SPIRIT_FLOATING_IDLE,
            u17.SPIRIT_HEAL,
            u17.SPIRIT_HEAL_ALT,
            u17.ATTACK_SPIRIT_ATTACK,
            u17.HEAL_SPIRIT_ATTACK,
            u17.HEAL_SPIRIT_ATTACK_ALT
        }
    })
    p36.Name = "SpiritSummonerController"
    p36.spiritSummonedRemote = u25.Client:Get("SpiritSummoned")
    p36.spiritDispelledRemote = u25.Client:Get("SpiritDispelled")
    p36.spirits = {}
    p36.playerLastPos = {}
end
function u33.onKitLocalActivated(_, p37) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u29
        [3] = u11
        [4] = u6
        [5] = u30
    --]]
    local u38 = u7.mount(u7.createElement(u29), u11.LocalPlayer:WaitForChild("PlayerGui"))
    p37:GiveTask(function() --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u38
        --]]
        u7.unmount(u38)
    end)
    local u39 = u6.Controllers.StatusInfoListController:waitForSetupAddElement(u7.createElement(u30))
    p37:GiveTask(function() --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u39
        --]]
        u7.unmount(u39)
    end)
end
function u33.onKitLocalDeactivated(_) --[[ Line: 71 ]] end
function u33.onKitReplicationActivated(u40, u41) --[[ Line: 73 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u24
        [3] = u11
        [4] = u25
        [5] = u19
        [6] = u2
        [7] = u22
        [8] = u6
        [9] = u21
        [10] = u13
        [11] = u18
        [12] = u17
        [13] = u23
    --]]
    local u43 = u40.spiritSummonedRemote:Connect(function(p42) --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u40
        --]]
        u40:spawnSpirit(p42.player, p42.id, p42.type, p42.tier)
    end)
    local u45 = u40.spiritDispelledRemote:Connect(function(p44) --[[ Line: 78 ]]
        --[[
        Upvalues:
            [1] = u40
        --]]
        u40:despawnSpirit(p44.player, p44.id)
    end)
    u41:GiveTask(function() --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u43
            [2] = u45
        --]]
        u43:Disconnect()
        u45:Disconnect()
    end)
    u41:GiveTask(u15.BeginProjectileTargeting:connect(function(p46) --[[ Line: 86 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u11
        --]]
        if p46:isCancelled() then
            return nil
        end
        if p46.handItem.itemType ~= u24.SPIRIT_STAFF then
            return nil
        end
        local v47 = u11.LocalPlayer
        local v48 = v47:GetAttribute("ReadySummonedAttackSpirits")
        local v49 = v48 == nil and 0 or v48
        local v50 = v47:GetAttribute("ReadySummonedHealSpirits")
        if v49 + (v50 == nil and 0 or v50) <= 0 then
            p46:setCancelled(true)
        end
    end))
    local u56 = u25.Client:Get("SpiritBeginTravel"):Connect(function(p51) --[[ Line: 109 ]]
        --[[
        Upvalues:
            [1] = u40
        --]]
        local v52 = nil
        for v53, v54 in u40.spirits do
            local _ = v53 - 1
            local v55
            if v54.owner == p51.owner then
                v55 = v54.id == p51.id
            else
                v55 = false
            end
            if v55 == true then
                v52 = v54
                break
            end
        end
        if v52 then
            v52.instance:PivotTo(CFrame.new(p51.startPos))
            u40:showSpirit(v52)
            if p51.targetEntityInstance then
                u40:moveSpiritToEntity(v52, p51.targetEntityInstance, p51.travelTime)
            elseif p51.targetItemDrop then
                u40:moveSpiritToItem(v52, p51.targetItemDrop, p51.travelTime)
            end
        else
            return nil
        end
    end)
    u41:GiveTask(function() --[[ Line: 135 ]]
        --[[
        Upvalues:
            [1] = u56
        --]]
        u56:Disconnect()
    end)
    local u63 = u25.Client:Get("SpiritBeginReturn"):Connect(function(p57) --[[ Line: 139 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u19
        --]]
        local v58 = nil
        for v59, v60 in u40.spirits do
            local _ = v59 - 1
            local v61
            if v60.owner == p57.owner then
                v61 = v60.id == p57.id
            else
                v61 = false
            end
            if v61 == true then
                v58 = v60
                break
            end
        end
        if not v58 then
            return nil
        end
        v58.instance:PivotTo(CFrame.new(p57.startPos))
        u40:showSpirit(v58)
        local v62 = u19:getEntity(p57.owner)
        if v62 ~= nil then
            v62 = v62:getInstance()
        end
        if v62 then
            u40:moveSpiritToEntity(v58, v62, p57.travelTime)
        end
    end)
    u41:GiveTask(function() --[[ Line: 168 ]]
        --[[
        Upvalues:
            [1] = u63
        --]]
        u63:Disconnect()
    end)
    local u66 = u25.Client:Get("SpiritLaunched"):Connect(function(p64) --[[ Line: 172 ]]
        --[[
        Upvalues:
            [1] = u40
        --]]
        local v65 = u40:getSpiritById(p64.id)
        if not v65 then
            return nil
        end
        u40:hideSpirit(v65)
    end)
    u41:GiveTask(function() --[[ Line: 179 ]]
        --[[
        Upvalues:
            [1] = u66
        --]]
        u66:Disconnect()
    end)
    local u72 = u25.Client:OnEvent("WormholeUse", function(p67, _, _) --[[ Line: 183 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u2
            [3] = u22
        --]]
        local v68 = p67.Character
        if not v68 then
            return nil
        end
        local v69 = u40:getCharacterCenter(v68)
        local v70 = u2.getOrCreate(u40.playerLastPos, p67, {})
        if v69 then
            local v71 = v69 + v68:GetPivot().LookVector.Unit * Vector3.new(-2.5, -2.5, -2.5)
            table.insert(v70, 1, v71)
            if #v70 > u22.SPIRIT_TRAIL_DISTANCE * (u22.SPIRIT_MAX_TRAIL_COUNT + 1) then
                v70[#v70] = nil
            end
        end
    end)
    u41:GiveTask(function() --[[ Line: 202 ]]
        --[[
        Upvalues:
            [1] = u72
        --]]
        u72:cancel()
    end)
    local v73 = u11:GetPlayers()
    local function v78(u74) --[[ Line: 207 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u21
            [3] = u40
            [4] = u41
        --]]
        if u6.Controllers.KitController:isUsingKit(u74, u21.SPIRIT_SUMMONER) then
            local u77 = u74:GetAttributeChangedSignal("SpiritSummonerTier"):Connect(function() --[[ Line: 209 ]]
                --[[
                Upvalues:
                    [1] = u40
                    [2] = u74
                --]]
                for v75, v76 in u40.spirits do
                    local _ = v75 - 1
                    if v76.owner.UserId == u74.UserId then
                        v76.tier = u74:GetAttribute("SpiritSummonerTier")
                        v76.instance:ScaleTo(u40:getSpiritScale(v76.tier))
                    end
                end
            end)
            u41:GiveTask(function() --[[ Line: 221 ]]
                --[[
                Upvalues:
                    [1] = u77
                --]]
                u77:Disconnect()
            end)
        end
    end
    for v79, v80 in v73 do
        v78(v80, v79 - 1, v73)
    end
    local u121 = u13.Heartbeat:Connect(function(p81) --[[ Line: 230 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u40
            [3] = u2
            [4] = u22
            [5] = u18
            [6] = u17
            [7] = u19
            [8] = u23
        --]]
        for _, v82 in u11:GetPlayers() do
            if v82.Character then
                local v83 = u40:getCharacterCenter(v82.Character)
                local v84 = u2.getOrCreate(u40.playerLastPos, v82, {})
                if v83 then
                    local v85 = v83 + v82.Character:GetPivot().LookVector.Unit * Vector3.new(-2.5, -2.5, -2.5)
                    if #v84 == 0 or v84[1] ~= v85 then
                        table.insert(v84, 1, v85)
                        if #v84 > u22.SPIRIT_TRAIL_DISTANCE * (u22.SPIRIT_MAX_TRAIL_COUNT + 1) then
                            v84[#v84] = nil
                        end
                    end
                end
            end
        end
        for _, v86 in u40.spirits do
            if v86.travel.active then
                local v87 = v86.travel
                v87.elapsedTime = v87.elapsedTime + p81
                if v86.targetEntityInstance and not v86.travel.item then
                    v86.travel.destPos = u40:getEntityDestPos(v86).Position
                end
                local v88 = v86.travel.elapsedTime / v86.travel.duration
                local v89 = v86.travel.startPos:Lerp(v86.travel.destPos, v88)
                v86.instance:PivotTo(CFrame.lookAt(v89, v86.travel.destPos))
                if v86.travel.elapsedTime >= v86.travel.duration then
                    v86.travel.active = false
                end
                if v86.animation.animator then
                    if v86.animation.attackAnimationTrack then
                        local v90 = v86.animation.attackAnimationTrack
                        if v90 ~= nil then
                            v90:Stop()
                        end
                        local v91 = v86.animation.attackAnimationTrack
                        if v91 ~= nil then
                            v91:Destroy()
                        end
                        v86.animation.attackAnimationTrack = nil
                    end
                    if v86.animation.healAnimationTrack then
                        local v92 = v86.animation.healAnimationTrack
                        if v92 ~= nil then
                            v92:Stop()
                        end
                        local v93 = v86.animation.healAnimationTrack
                        if v93 ~= nil then
                            v93:Destroy()
                        end
                        v86.animation.healAnimationTrack = nil
                    end
                end
                if v86.animation.animator and not v86.animation.floatAnimationTrack then
                    v86.animation.floatAnimationTrack = u18:playAnimation(v86.animation.animator, u17.SPIRIT_FLOATING_IDLE, {
                        ["looped"] = true
                    })
                end
            else
                local v94 = u19:getPlayerFromEntityInstance(v86.targetEntityInstance)
                if v94 and v94 == v86.owner then
                    u40:setSpiritFollowPosition(v86)
                    local v95 = u40:getCharacterCenter(v86.targetEntityInstance) or v86.targetEntityInstance:GetPivot().Position
                    local v96 = v86.instance:GetPivot().Position.Y
                    local v97 = Vector3.new(0, v96, 0)
                    local v98 = v95 * Vector3.new(1, 0, 1) + v97
                    v86.instance:PivotTo(CFrame.lookAt(v86.instance:GetPivot().Position, v98))
                    v86.floatDelta = v86.floatDelta + p81
                    local v99 = v86.instance
                    local v100 = v86.instance:GetPivot()
                    local v101 = v86.floatDelta * 2 + 6.283185307179586
                    local v102 = math.sin(v101) * 0.8
                    v99:PivotTo(v100 + Vector3.new(0, v102, 0))
                    if v86.animation.animator then
                        if v86.animation.attackAnimationTrack then
                            local v103 = v86.animation.attackAnimationTrack
                            if v103 ~= nil then
                                v103:Stop()
                            end
                            local v104 = v86.animation.attackAnimationTrack
                            if v104 ~= nil then
                                v104:Destroy()
                            end
                            v86.animation.attackAnimationTrack = nil
                        end
                        if v86.animation.healAnimationTrack then
                            local v105 = v86.animation.healAnimationTrack
                            if v105 ~= nil then
                                v105:Stop()
                            end
                            local v106 = v86.animation.healAnimationTrack
                            if v106 ~= nil then
                                v106:Destroy()
                            end
                            v86.animation.healAnimationTrack = nil
                        end
                    end
                    if v86.animation.animator and not v86.animation.floatAnimationTrack then
                        v86.animation.floatAnimationTrack = u18:playAnimation(v86.animation.animator, u17.SPIRIT_FLOATING_IDLE, {
                            ["looped"] = true
                        })
                    end
                else
                    v86.elapsedTime = v86.elapsedTime + p81
                    v86.instance:PivotTo(u40:getEntityDestPos(v86))
                    if v86.animation.animator and v86.animation.floatAnimationTrack then
                        local v107 = v86.animation.floatAnimationTrack
                        if v107 ~= nil then
                            v107:Stop()
                        end
                        local v108 = v86.animation.floatAnimationTrack
                        if v108 ~= nil then
                            v108:Destroy()
                        end
                        v86.animation.floatAnimationTrack = nil
                    end
                    local v109 = u19:getEntity(v86.owner)
                    local v110 = u19:getEntity(v86.targetEntityInstance)
                    if v110 and v86.animation.animator then
                        local v111
                        if v109 == nil then
                            v111 = v109
                        else
                            v111 = v109:canAttack(v110)
                        end
                        if v111 then
                            v111 = not v86.animation.attackAnimationTrack
                        end
                        if v111 then
                            local v112 = v86.animation
                            local v113 = u18
                            local v114 = v86.animation.animator
                            local v115
                            if v86.type == u23.ATTACK then
                                v115 = u17.ATTACK_SPIRIT_ATTACK
                            else
                                v115 = u17.HEAL_SPIRIT_ATTACK
                            end
                            v112.attackAnimationTrack = v113:playAnimation(v114, v115, {
                                ["looped"] = true
                            })
                            if v86.animation.healAnimationTrack then
                                local v116 = v86.animation.healAnimationTrack
                                if v116 ~= nil then
                                    v116:Stop()
                                end
                                local v117 = v86.animation.healAnimationTrack
                                if v117 ~= nil then
                                    v117:Destroy()
                                end
                                v86.animation.healAnimationTrack = nil
                            end
                        else
                            if v109 ~= nil then
                                v109 = v109:canAttack(v110)
                            end
                            local v118 = not v109
                            if v118 then
                                v118 = not v86.animation.healAnimationTrack
                            end
                            if v118 then
                                v86.animation.healAnimationTrack = u18:playAnimation(v86.animation.animator, u17.SPIRIT_HEAL, {
                                    ["looped"] = true
                                })
                                if v86.animation.attackAnimationTrack then
                                    local v119 = v86.animation.attackAnimationTrack
                                    if v119 ~= nil then
                                        v119:Stop()
                                    end
                                    local v120 = v86.animation.attackAnimationTrack
                                    if v120 ~= nil then
                                        v120:Destroy()
                                    end
                                    v86.animation.attackAnimationTrack = nil
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
    u41:GiveTask(function() --[[ Line: 420 ]]
        --[[
        Upvalues:
            [1] = u121
        --]]
        u121:Disconnect()
    end)
end
function u33.onKitReplicationDeactivated(_) --[[ Line: 424 ]] end
function u33.onInnateAbilityEnabled(_, _, _) --[[ Line: 426 ]] end
function u33.onAbilityUsed(_, p122, p123) --[[ Line: 428 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u6
        [3] = u20
        [4] = u16
        [5] = u5
        [6] = u26
        [7] = u4
        [8] = u18
        [9] = u17
    --]]
    if p123:isCancelled() then
        return nil
    end
    local v124 = p122 == u11.LocalPlayer.Character
    local v125 = u20[u6.Controllers.KitSkinController:getKitSkin(p122)].uma
    local v126 = p123.ability
    local v127 = false
    if v126 == u16.CHANGE_SPIRIT_AFFINITY then
        if v124 then
            u5:playSound(u26.SPIRIT_SUMMONER_CHANGE_AFFINITY, {
                ["position"] = nil
            })
            return
        end
    elseif v126 == u16.SUMMON_ATTACK_SPIRIT and true or v127 or v126 == u16.SUMMON_HEAL_SPIRIT then
        local v128
        if v125 then
            v128 = v125.spiritSummonedSound
        else
            v128 = u26.SPIRIT_SUMMONING
        end
        local v129 = u5
        local v130 = {}
        local v131
        if p123.userCharacter == u11.LocalPlayer.Character then
            v131 = nil
        else
            v131 = p123.userCharacter:GetPivot().Position
        end
        v130.position = v131
        v129:playSound(v128, v130)
        if v124 then
            u4:playAnimation(u11.LocalPlayer, u18:getAssetId(u17.USE_GRAVESTONE), {
                ["looped"] = false
            })
            return
        end
    end
end
function u33.KnitStart(p132) --[[ Line: 468 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    u28.KnitStart(p132)
end
function u33.spawnSpirit(p133, u134, p135, p136, p137) --[[ Line: 471 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u20
        [3] = u23
        [4] = u12
        [5] = u31
        [6] = u32
        [7] = u11
        [8] = u10
        [9] = u14
        [10] = u19
        [11] = u8
        [12] = u27
        [13] = u26
        [14] = u5
    --]]
    local v138 = u20[u6.Controllers.KitSkinController:getKitSkin(u134)].uma
    local v139
    if v138 then
        if p136 == u23.ATTACK then
            v139 = v138.attackSpirit:Clone()
        else
            v139 = v138.healSpirit:Clone()
        end
    elseif p136 == u23.ATTACK then
        v139 = u12.Assets.Misc.AttackSpirit:Clone()
    else
        v139 = u12.Assets.Misc.HealSpirit:Clone()
    end
    local v140
    if p136 == u23.ATTACK then
        v140 = u31
    else
        v140 = u32
    end
    v139:ScaleTo(p133:getSpiritScale(p137))
    local v141 = v139:GetDescendants()
    local function v143(p142) --[[ Line: 483 ]]
        --[[
        Upvalues:
            [1] = u134
            [2] = u11
            [3] = u10
        --]]
        if u134 == u11.LocalPlayer then
            p142:SetAttribute("FirstPersonVisible", false)
            u10:AddTag(p142, "FirstPersonHidden")
        end
        if p142:IsA("BasePart") or (p142:IsA("MeshPart") or p142:IsA("Part")) then
            p142:SetAttribute("InitialTransparency", p142.Transparency)
        end
    end
    for v144, v145 in v141 do
        v143(v145, v144 - 1, v141)
    end
    local v146 = math.random(-1, 1)
    local v147 = math.random(-1, 1)
    local v148 = math.random
    local v149 = Vector3.new(v146, v147, v148(0, 2))
    if u134.Character then
        v139.Parent = u14
        local v150 = v139:FindFirstChild("AnimationController")
        if v150 ~= nil then
            v150 = v150:FindFirstChild("Animator")
        end
        local v151 = u19:getEntity(u134)
        if v151 ~= nil then
            v151 = v151:getInstance()
        end
        if v151 then
            local v152 = {
                ["elapsedTime"] = 0,
                ["circlingRadius"] = 5,
                ["speedMultiplier"] = 1,
                ["floatDelta"] = 0,
                ["id"] = p135,
                ["type"] = p136,
                ["tier"] = p137,
                ["instance"] = v139,
                ["owner"] = u134,
                ["targetEntityInstance"] = v151,
                ["offset"] = v149,
                ["animation"] = {
                    ["floatAnimationTrack"] = nil,
                    ["attackAnimationTrack"] = nil,
                    ["healAnimationTrack"] = nil,
                    ["animator"] = v150
                },
                ["travel"] = {
                    ["active"] = false,
                    ["elapsedTime"] = 0,
                    ["startPos"] = Vector3.new(0, 0, 0),
                    ["destPos"] = Vector3.new(0, 0, 0),
                    ["duration"] = 0,
                    ["item"] = false
                }
            }
            local v153 = p133.spirits
            table.insert(v153, v152)
            local v154 = p133:setSpiritFollowPosition(v152)
            local u155 = u12.Assets.Effects.SpiritSummonEffect:Clone()
            u8(u155, 0.5)
            for v156, v157 in u155:GetDescendants() do
                local _ = v156 - 1
                if v157:IsA("ParticleEmitter") then
                    v157.Color = ColorSequence.new(v140)
                end
            end
            u155.Parent = u14
            u155:PivotTo(v154)
            u27:playEffects({ u155 }, nil, {
                ["disableEffectsAfterSec"] = 0.1
            })
            task.delay(0.5, function() --[[ Line: 560 ]]
                --[[
                Upvalues:
                    [1] = u155
                --]]
                u155:Destroy()
            end)
            local v158
            if v138 then
                if p136 == u23.ATTACK then
                    v158 = v138.attackSpiritAppearSound
                else
                    v158 = v138.healSpiritAppearSound
                end
            elseif p136 == u23.ATTACK then
                v158 = u26.ATTACK_SPIRIT_APPEAR
            else
                v158 = u26.HEAL_SPIRIT_APPEAR
            end
            if u134 == u11.LocalPlayer then
                u5:playSound(v158, {
                    ["position"] = nil
                })
                return v152
            else
                if u134.Character then
                    local v159 = u5
                    local v160 = {}
                    local v161 = u134.Character
                    if v161 ~= nil then
                        v161 = v161:GetPivot().Position
                    end
                    v160.position = v161
                    v159:playSound(v158, v160)
                end
                return v152
            end
        else
            return nil
        end
    else
        return nil
    end
end
function u33.despawnSpirit(p162, p163, p164) --[[ Line: 588 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u31
        [3] = u32
        [4] = u12
        [5] = u8
        [6] = u14
        [7] = u27
        [8] = u5
        [9] = u26
    --]]
    local v165 = -1
    for v166, v167 in p162.spirits do
        local _ = v166 - 1
        local v168
        if v167.owner == p163 then
            v168 = v167.id == p164
        else
            v168 = false
        end
        if v168 == true then
            v165 = v166 - 1
            break
        end
    end
    local v169 = p162.spirits[v165 + 1]
    if v169 ~= nil then
        v169.instance:Destroy()
    end
    table.remove(p162.spirits, v165 + 1)
    local v170
    if v169.type == u23.ATTACK then
        v170 = u31
    else
        v170 = u32
    end
    local u171 = u12.Assets.Effects.SpiritDispelEffect:Clone()
    u8(u171, 0.5)
    for v172, v173 in u171:GetDescendants() do
        local _ = v172 - 1
        if v173:IsA("ParticleEmitter") then
            v173.Color = ColorSequence.new(v170)
        end
    end
    u171.Parent = u14
    u171:PivotTo(v169.instance:GetPivot())
    u27:playEffects({ u171 }, nil)
    task.delay(1, function() --[[ Line: 625 ]]
        --[[
        Upvalues:
            [1] = u171
        --]]
        u171:Destroy()
    end)
    u5:playSound(u26.SPIRIT_DISPEL, {
        ["position"] = v169.instance:GetPivot().Position
    })
end
function u33.moveSpiritToEntity(_, p174, p175, p176) --[[ Line: 633 ]]
    p174.travel.active = true
    p174.travel.duration = p176
    p174.travel.elapsedTime = 0
    p174.travel.startPos = p174.instance:GetPivot().Position
    p174.travel.destPos = p175:GetPivot().Position
    p174.targetEntityInstance = p175
    p174.travel.item = false
end
function u33.moveSpiritToItem(_, p177, p178, p179) --[[ Line: 642 ]]
    p177.travel.active = true
    p177.travel.duration = p179
    p177.travel.elapsedTime = 0
    p177.travel.startPos = p177.instance:GetPivot().Position
    p177.travel.destPos = p178:GetPivot().Position
    p177.travel.item = true
end
function u33.getCharacterCenter(_, p180) --[[ Line: 650 ]]
    if not p180.PrimaryPart then
        return nil
    end
    local v181 = p180:FindFirstChildWhichIsA("Humanoid")
    local v182 = not v181 and 0 or v181.HipHeight
    local v183 = p180.PrimaryPart.Position
    local v184 = -1 * (v182 + p180.PrimaryPart.Size.Y / 2)
    return v183 + Vector3.new(0, v184, 0) + Vector3.new(0, 2.5, 0)
end
function u33.setSpiritFollowPosition(p185, p186) --[[ Line: 666 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u22
    --]]
    local v187 = u2.getOrCreate(p185.playerLastPos, p186.owner, {})[(p186.id % u22.SPIRIT_MAX_TRAIL_COUNT + 1) * u22.SPIRIT_TRAIL_DISTANCE + 1]
    p186.instance:PivotTo(CFrame.new(v187) * CFrame.new(p186.offset))
    return p186.instance:GetPivot()
end
function u33.getSpiritById(p188, p189) --[[ Line: 679 ]]
    local v190 = nil
    for v191, v192 in p188.spirits do
        local _ = v191 - 1
        if v192.id == p189 == true then
            return v192
        end
    end
    return v190
end
function u33.hideSpirit(_, p193) --[[ Line: 695 ]]
    for v194, v195 in p193.instance:GetDescendants() do
        local _ = v194 - 1
        if v195:IsA("BasePart") or (v195:IsA("MeshPart") or v195:IsA("Part")) then
            v195.Transparency = 1
        elseif v195:IsA("Trail") then
            v195.Enabled = false
        end
    end
end
function u33.showSpirit(_, p196) --[[ Line: 708 ]]
    local v197 = p196.instance:GetDescendants()
    local function v200(p198) --[[ Line: 710 ]]
        if p198:IsA("BasePart") or (p198:IsA("MeshPart") or p198:IsA("Part")) then
            local v199 = p198:GetAttribute("InitialTransparency")
            p198.Transparency = v199 == nil and 0 or v199
        elseif p198:IsA("Trail") then
            p198.Enabled = true
        end
    end
    for v201, v202 in v197 do
        v200(v202, v201 - 1, v197)
    end
end
function u33.getEntityDestPos(p203, p204) --[[ Line: 725 ]]
    local v205 = p203:getCharacterCenter(p204.targetEntityInstance) or Vector3.new(0, 0, 0)
    local v206 = p204.circlingRadius
    local v207 = v206 == nil and 300 or v206
    local v208 = (p204.elapsedTime + p204.id * 8) / 1
    local v209 = math.sin(v208) * v207
    local v210 = (p204.elapsedTime + p204.id * 8) / 1
    local v211 = math.cos(v210) * v207
    local v212 = v205 + Vector3.new(v209, 0, v211)
    return CFrame.lookAt(v212, v205)
end
function u33.getSpiritScale(_, p213) --[[ Line: 737 ]]
    return 0.5 + 0.1 * p213
end
u6.CreateController(u33.new())
return nil