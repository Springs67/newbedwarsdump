local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.RandomUtil
local u6 = v3.SoundManager
local u7 = v3.UILayers
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "catrom", "src")
local v10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u11 = v10.InOutSine
local u12 = v10.Linear
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v15 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u16 = v15.ContextActionService
local u17 = v15.Players
local u18 = v15.ReplicatedStorage
local u19 = v15.RunService
local u20 = v15.TweenService
local u21 = v15.Workspace
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u23 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u24 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u28 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u29 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u30 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u31 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v32 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "card", "card-util")
local u33 = v32.CardConstants
local u34 = v32.CardUpgradeType
local u35 = v32.CardUtil
local u36 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "raycast", "raycast-util").RaycastUtil
local u37 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u38 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u39 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u40 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil
local u41 = u1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u42 = u1.import(script, script.Parent, "ui", "card-selection").CardSelectionApp
local u43 = u1.import(script, script.Parent, "ui", "card-target").CardTarget
local u44 = u1.import(script, script.Parent, "ui", "card-tracker").CardKit
local u45 = u1.import(script, script.Parent, "ui", "card-upgrades").CardUpgradesApp
local u46 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 52 ]]
        return "FortunaController"
    end,
    ["__index"] = u41
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
        [1] = u41
        [2] = u31
    --]]
    u41.constructor(p49, u31.CARD)
    p49.Name = "FortunaController"
    p49.cards = {}
    p49.cardAnims = {}
    p49.upgradeAvailable = false
    p49.seeUpgradesAbilityMounted = false
    p49.currentTier = 0
    p49.isPreloaded = false
end
function u46.KnitStart(p50) --[[ Line: 72 ]]
    --[[
    Upvalues:
        [1] = u41
    --]]
    u41.KnitStart(p50)
end
function u46.onKitLocalActivated(u51, p52) --[[ Line: 75 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u25
        [3] = u37
        [4] = u24
    --]]
    p52:GiveTask(u23.CanUseLocalAbility:connect(function(p53) --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u51
        --]]
        if p53:isCancelled() then
            return nil
        end
        if p53.ability ~= u25.CARD_THROW then
            return nil
        end
        if not u51.target then
            p53:setCancelled(true)
        end
    end))
    local u55 = u37.Client:Get("CardUpgradeUpdate"):Connect(function(p54) --[[ Line: 88 ]]
        --[[
        Upvalues:
            [1] = u51
            [2] = u24
        --]]
        u51.upgradeAvailable = p54.upgradeAvailable
        if p54.upgradeAvailable and p54.currentTier > u51.currentTier then
            u51.currentTier = p54.currentTier
            u51:playUpgradeEffect()
        end
        u24:dispatch({
            ["type"] = "KitCardSetAvailableUpgrades",
            ["availableUpgrades"] = p54.availableUpgrades
        })
        u24:dispatch({
            ["type"] = "KitCardSetUpgrades",
            ["upgrades"] = p54.upgrades
        })
        if not u51.seeUpgradesAbilityMounted and #p54.upgrades > 0 then
            u51:mountSeeUpgradesAbility()
            u51.seeUpgradesAbilityMounted = true
        end
    end)
    p52:GiveTask(function() --[[ Line: 109 ]]
        --[[
        Upvalues:
            [1] = u55
        --]]
        u55:Disconnect()
    end)
    p52:GiveTask(u51:initializeAll())
end
function u46.onKitLocalDeactivated(_) --[[ Line: 115 ]] end
function u46.onKitReplicationActivated(u56, p57) --[[ Line: 117 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u1
        [3] = u29
        [4] = u37
        [5] = u17
        [6] = u8
        [7] = u31
        [8] = u38
        [9] = u27
    --]]
    p57:GiveTask(u23.SharedStatefulEntityDeath:connect(function(p58) --[[ Line: 119 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u29
            [3] = u56
        --]]
        if p58:isCancelled() then
            return nil
        end
        if u1.instanceof(p58.entity, u29) then
            u56:destroyCards((p58.entity:getPlayer()))
        end
    end))
    local u60 = u37.Client:Get("CardThrow"):Connect(function(p59) --[[ Line: 129 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u56
        --]]
        if p59.throwerPlayer == u17.LocalPlayer then
            u56:removeTarget()
        end
        u56:useAbility(p59.throwerPlayer, p59.targetEntityInstance, p59.deck)
    end)
    p57:GiveTask(function() --[[ Line: 135 ]]
        --[[
        Upvalues:
            [1] = u60
        --]]
        u60:Disconnect()
    end)
    p57:GiveTask(u8.Controllers.KitController:watchKit(function(_, p61) --[[ Line: 139 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u56
            [3] = u8
            [4] = u38
            [5] = u27
        --]]
        if p61 == u31.CARD and not u56.isPreloaded then
            u8.Controllers.PreloadController:runPreload({
                ["sounds"] = {
                    u38.CARD_UPGRADE_AVAILABLE,
                    u38.CARD_UPGRADE_SELECT,
                    u38.CARD_TURN,
                    u38.CARD_THROW_1,
                    u38.CARD_THROW_2,
                    u38.CARD_THROW_3,
                    u38.CARD_THROW_4,
                    u38.CARD_THROW_5
                },
                ["animations"] = { u27.CARD_THROW }
            })
            u56.isPreloaded = true
        end
    end))
end
function u46.onKitReplicationDeactivated(_) --[[ Line: 149 ]] end
function u46.onInnateAbilityEnabled(_, _, _) --[[ Line: 151 ]] end
function u46.onAbilityUsed(p62, p63, p64) --[[ Line: 153 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u25
        [3] = u37
        [4] = u2
        [5] = u45
        [6] = u7
    --]]
    if p64:isCancelled() then
        return nil
    elseif p63 == u17.LocalPlayer.Character then
        local v65 = p64.ability
        if v65 == u25.CARD_THROW then
            u37.Client:Get("AttemptCardThrow"):SendToServer({
                ["targetEntityInstance"] = p62.target
            })
            return
        elseif v65 == u25.CARD_UPGRADES then
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
                ["appId"] = "CardUpgrades",
                ["app"] = u45,
                ["layer"] = u7.MAIN
            }, {
                ["AppId"] = "CardUpgrades"
            })
        end
    else
        return nil
    end
end
function u46.playUpgradeEffect(_) --[[ Line: 182 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u17
        [3] = u39
        [4] = u6
        [5] = u38
    --]]
    local v66 = u18.Assets.Effects.CardUpgrade:Clone()
    local v67 = u17.LocalPlayer.Character
    if v67 ~= nil then
        v67 = v67.PrimaryPart
    end
    v66.Parent = v67
    if v67 then
        v66:PivotTo(v67:GetPivot())
        u39:playEffects({ v66 }, nil, {
            ["sizeMultiplier"] = 1,
            ["destroyAfterSec"] = 1
        })
    end
    u6:playSound(u38.CARD_UPGRADE_AVAILABLE, {
        ["position"] = nil
    })
end
function u46.initializeAll(u68) --[[ Line: 202 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u13
        [3] = u14
        [4] = u44
        [5] = u19
        [6] = u21
        [7] = u30
        [8] = u40
        [9] = u33
        [10] = u36
        [11] = u43
        [12] = u16
        [13] = u2
        [14] = u42
        [15] = u7
    --]]
    local u69 = u17.LocalPlayer
    local v70 = u13.new()
    local u71 = u14.mount(u14.createElement(u44), u69:WaitForChild("PlayerGui"))
    v70:GiveTask(function() --[[ Line: 207 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u71
        --]]
        u14.unmount(u71)
    end)
    local u72 = 0
    v70:GiveTask(u19.Heartbeat:Connect(function(p73) --[[ Line: 212 ]]
        --[[
        Upvalues:
            [1] = u72
            [2] = u21
            [3] = u68
            [4] = u69
            [5] = u30
            [6] = u40
            [7] = u33
            [8] = u17
            [9] = u36
            [10] = u14
            [11] = u43
        --]]
        u72 = u72 + p73
        if u72 < 0.05 then
            return nil
        end
        u72 = u72 - 0.05
        local v74 = u21.CurrentCamera
        if v74 ~= nil then
            v74 = v74.CFrame
        end
        if not v74 then
            u68:removeTarget()
            return nil
        end
        local v75 = u69.Character
        local v76
        if v75 == nil then
            v76 = v75
        else
            v76 = v75.PrimaryPart
            if v76 ~= nil then
                v76 = v76.Position
            end
        end
        if not v76 then
            u68:removeTarget()
            return nil
        end
        local v77 = u30:getLocalPlayerEntity()
        if not v77 then
            u68:removeTarget()
            return nil
        end
        local v78 = u40.getEntitiesWithinRadius(v74.Position, u33.BASE_RANGE)
        local v79 = Ray.new(v74.Position, v74.LookVector).Unit
        local v80 = v74.LookVector
        local v81 = (1 / 0)
        local v82 = nil
        for _, v83 in v78 do
            local v84 = u17:GetPlayerFromCharacter(v83:getInstance())
            if v84 ~= nil then
                v84 = v84:HasTag("PlayerHidden")
            end
            if not v84 and v77:canAttack(v83) then
                local v85 = v83:getInstance():GetPivot().Position
                if (v85 - v74.Position):Dot(v80) >= 0 then
                    local v86 = v79:ClosestPoint(v85)
                    local v87 = (v85 - v86).Magnitude
                    if u33.BASE_RANGE >= v87 then
                        local v88 = v87 + (v79.Origin - v86).Magnitude / 3
                        if v81 > v88 and u36.isUnblocked(v75, v83) then
                            v82 = v83:getInstance()
                            v81 = v88
                        end
                    end
                end
            end
        end
        if u68.target ~= v82 then
            u68:removeTarget()
            if v82 then
                u68.targetIcon = u14.mount(u14.createElement(u43), v82.PrimaryPart)
            end
        end
        u68.target = v82
    end))
    local v89 = u16
    local function v91(_, p90, _) --[[ Line: 296 ]]
        --[[
        Upvalues:
            [1] = u68
            [2] = u2
            [3] = u42
            [4] = u7
        --]]
        if p90 == Enum.UserInputState.Begin and u68.upgradeAvailable then
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
                ["appId"] = "CardSelection",
                ["app"] = u42,
                ["layer"] = u7.MAIN
            }, {
                ["AppId"] = "CardSelection"
            })
        end
    end
    local v92 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("KitSecondary") or {}
    v89:BindAction("card-upgrade-open", v91, false, unpack(v92))
    v70:GiveTask(function() --[[ Line: 309 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16:UnbindAction("card-upgrade-open")
    end)
    return v70
end
function u46.mountSeeUpgradesAbility(_) --[[ Line: 314 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u25
        [3] = u26
    --]]
    local v93 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v94 = u25.CARD_UPGRADES
    local v95 = {}
    for v96, v97 in u26[u25.CARD_UPGRADES].triggerConfig do
        v95[v96] = v97
    end
    v93:enableAbility(v94, v95):expect()
end
function u46.removeTarget(p98) --[[ Line: 323 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    p98.target = nil
    if p98.targetIcon then
        u14.unmount(p98.targetIcon)
    end
end
function u46.useAbility(u99, u100, u101, u102) --[[ Line: 329 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u28
        [3] = u27
        [4] = u35
        [5] = u34
    --]]
    local v103 = u100.Character
    if v103 ~= nil then
        v103 = v103.PrimaryPart
    end
    if not v103 then
        return nil
    end
    u99:destroyCards(u100)
    local v104 = u4:playAnimation(u100, u28:getAssetId(u27.CARD_THROW), {
        ["looped"] = false
    })
    if v104 ~= nil then
        v104:AdjustSpeed(1.3 * u102.throw.speedMultiplier)
    end
    local v105 = u35.getThrowValues(u102)
    local u106 = v105.delay * 0.5
    local u107 = v105.delay - u106
    local v108 = false
    local v109 = 0
    while true do
        if v108 then
            v109 = v109 + 1
        else
            v108 = true
        end
        if v109 >= u102.throw.cardCount then
            return
        end
        local u110 = v105.interval * v109
        local v111 = 7.5
        local v112 = u102.upgrades
        local v113 = u34.OVERSIZED
        if table.find(v112, v113) ~= nil then
            v111 = v111 * 2.5
        end
        local v114 = u102.upgrades
        local v115 = u34.MINISIZED
        if table.find(v114, v115) ~= nil then
            v111 = v111 / 2
        end
        local v116 = -(0.05 * (u102.throw.cardCount - 1) / 2)
        local v117 = v103.CFrame.Position
        local v118 = (v109 * 0.05 + v116) * v111
        local v119 = math.sin(v118) * 3.5
        local v120 = (v109 * 0.05 + v116) * v111
        local v121 = math.cos(v120) * 3.5
        local v122 = v117 + Vector3.new(v119, 0, v121)
        local v123 = v122.Z - v103.CFrame.Position.Z
        local v124 = v122.X - v103.CFrame.Position.X
        local v125 = select(2, CFrame.new(v122, v103.Position):ToOrientation())
        local u126 = u99:createCard(u100, v103, v123, v124, -math.deg(v125), u110, u106, u102)
        task.spawn(function() --[[ Line: 385 ]]
            --[[
            Upvalues:
                [1] = u110
                [2] = u106
                [3] = u107
                [4] = u99
                [5] = u126
                [6] = u100
                [7] = u101
                [8] = u102
            --]]
            task.wait(u110 + u106 + u107)
            u99:throwCard(u126, u100, u101, u102)
        end)
    end
end
function u46.throwCard(p127, u128, p129, p130, p131) --[[ Line: 392 ]]
    --[[
    Upvalues:
        [1] = u35
        [2] = u30
        [3] = u20
        [4] = u9
        [5] = u6
        [6] = u5
        [7] = u38
        [8] = u22
        [9] = u11
    --]]
    local v132 = u35.getThrowValues(p131)
    local v133 = math.random() * 0.1 + 0.05
    if math.random() < 0.5 then
        v133 = v133 * -1
    end
    if not u128 then
        return nil
    end
    local v134 = u30:getEntity(p130)
    local v135 = u30:getEntity(p129)
    if v134 ~= nil then
        v134 = v134:isAlive()
    end
    local v136 = not v134
    if not v136 then
        if v135 ~= nil then
            v135 = v135:isAlive()
        end
        v136 = not v135
    end
    if v136 then
        p127:destroyCards(p129)
        return nil
    end
    local v137 = p130:GetPivot().Position
    local v138 = (u128.Position - v137).Magnitude / 100
    local v139 = v133 * v138
    local v140 = (u128.Position.X + v137.X) / 2
    local v141 = (u128.Position.Y + v137.Y) / 2
    local v142 = (u128.Position.Z + v137.Z) / 2
    local v143 = Vector3.new(v140, v141, v142)
    local v144 = math.random(0, 8) * v138
    local v145 = v143 + Vector3.new(v139, v144, v139)
    local v146 = (u128.Position.X + v137.X) / (2 + v139)
    local v147 = (u128.Position.Y + v137.Y) / 2
    local v148 = (u128.Position.Z + v137.Z) / (2 + v139)
    local v149 = Vector3.new(v146, v147, v148)
    local v150 = p127.cardAnims[u128]
    if v150 then
        v150:Disconnect()
        local v151 = u20:Create(u128, TweenInfo.new(v132.raiseDuration, Enum.EasingStyle.Bounce, Enum.EasingDirection.In), {
            ["Position"] = u128.Position + Vector3.new(0, 1, 0)
        })
        v151:Play()
        v151.Completed:Wait()
        local u152 = u9.new({
            u128.Position,
            v149,
            v145,
            p130:GetPivot().Position
        }, nil)
        local v153 = u128:WaitForChild("Tail")
        local v154 = u128:WaitForChild("OuterTail")
        local v155 = u128:WaitForChild("EffectTail")
        v153.Enabled = true
        v154.Enabled = true
        v155.Enabled = true
        local v156 = u6
        local v157 = u5.fromList
        local v158 = {
            u38.CARD_THROW_1,
            u38.CARD_THROW_2,
            u38.CARD_THROW_3,
            u38.CARD_THROW_4,
            u38.CARD_THROW_5
        }
        v156:playSound(v157(unpack(v158)), {
            ["position"] = u128.Position
        })
        u22(v132.throwDuration, u11, function(p159) --[[ Line: 456 ]]
            --[[
            Upvalues:
                [1] = u128
                [2] = u152
            --]]
            u128.Transparency = p159
            local v160 = u152:SolvePosition(p159)
            local v161 = v160 + u152:SolveVelocity(p159) * Vector3.new(1, 1, 0)
            u128.CFrame = CFrame.lookAt(v160, v161)
        end, 0, 1):Wait()
        u128:Destroy()
    end
end
function u46.createCard(u162, p163, u164, u165, u166, u167, p168, u169, u170) --[[ Line: 469 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u34
        [3] = u21
        [4] = u6
        [5] = u38
        [6] = u20
        [7] = u22
        [8] = u12
        [9] = u19
    --]]
    local v171 = u162.cards[p163]
    local u172 = v171 == nil and {} or v171
    u162.cards[p163] = u172
    local u173 = u18.Assets.Misc.Card:Clone()
    local v174 = u170.upgrades
    local function v176(p175) --[[ Line: 484 ]]
        --[[
        Upvalues:
            [1] = u34
            [2] = u173
            [3] = u172
            [4] = u170
        --]]
        if p175 == u34.OVERSIZED then
            u173.Size = u173.Size * Vector3.new(3, 3, 3)
            return
        elseif p175 == u34.MINISIZED then
            u173.Size = u173.Size * Vector3.new(0.5, 0.5, 0.5)
            return
        elseif p175 == u34.LIFE_STEAL then
            u173.Color = Color3.fromHex("6ad400")
            return
        elseif p175 == u34.FIRE then
            u173.Upgrades.Fire.Enabled = true
            return
        elseif p175 == u34.EXPLOSION and #u172 == u170.throw.cardCount - 1 then
            u173.Upgrades.Smoke.Enabled = true
        end
    end
    for v177, v178 in v174 do
        v176(v178, v177 - 1, v174)
    end
    u173.Transparency = 1
    u173.Tail.Enabled = false
    u173.OuterTail.Enabled = false
    u173.EffectTail.Enabled = false
    local v179 = u173.PointLight
    local v180 = 4 / (u170.throw.cardCount / 5)
    v179.Brightness = math.min(4, v180)
    u173.Parent = u21
    table.insert(u172, u173)
    local u181 = false
    local u182 = 0
    local u183 = math.random() * 0.15000000000000002 + 0.05
    local u184 = CFrame.Angles(0, math.rad(u167), 0)
    local v185 = u164.CFrame
    local v186 = CFrame.new
    local v187 = u182 + 1.15
    local v188 = -u165
    u173:PivotTo(v185 * v186((Vector3.new(u166, v187, v188))))
    task.delay(p168, function() --[[ Line: 536 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u38
            [3] = u164
            [4] = u20
            [5] = u173
            [6] = u169
        --]]
        u6:playSound(u38.CARD_TURN, {
            ["position"] = u164.Position
        })
        u20:Create(u173, TweenInfo.new(u169, Enum.EasingStyle.Sine), {
            ["Transparency"] = 0
        }):Play()
    end)
    task.delay(p168, function() --[[ Line: 546 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u169
            [3] = u12
            [4] = u164
            [5] = u166
            [6] = u182
            [7] = u165
            [8] = u173
            [9] = u167
        --]]
        u22(u169, u12, function(p189) --[[ Line: 547 ]]
            --[[
            Upvalues:
                [1] = u164
                [2] = u166
                [3] = u182
                [4] = u165
                [5] = u173
            --]]
            local v190 = u164.CFrame
            local v191 = CFrame.new
            local v192 = u166
            local v193 = u182 + 1.15
            local v194 = -u165
            local v195 = v191((Vector3.new(v192, v193, v194)))
            local v196 = CFrame.Angles(0, math.rad(p189), 0)
            u173.CFrame = v190 * v195 * v196
        end, 90, u167)
    end)
    task.delay(u169, function() --[[ Line: 555 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u182
            [3] = u183
            [4] = u181
            [5] = u164
            [6] = u166
            [7] = u165
            [8] = u173
            [9] = u184
            [10] = u162
        --]]
        local v203 = u19.Heartbeat:Connect(function(p197) --[[ Line: 556 ]]
            --[[
            Upvalues:
                [1] = u182
                [2] = u183
                [3] = u181
                [4] = u164
                [5] = u166
                [6] = u165
                [7] = u173
                [8] = u184
            --]]
            if u183 <= u182 and not u181 then
                u181 = true
            end
            if u182 <= -u183 and u181 then
                u181 = false
            end
            if u181 then
                u182 = u182 - p197 / 3
            end
            if not u181 then
                u182 = u182 + p197 / 3
            end
            local v198 = u164.CFrame
            local v199 = CFrame.new
            local v200 = u166
            local v201 = u182 + 1.15
            local v202 = -u165
            u173.CFrame = v198 * v199((Vector3.new(v200, v201, v202))) * u184
        end)
        u162.cardAnims[u173] = v203
    end)
    return u173
end
function u46.destroyCards(p204, p205) --[[ Line: 577 ]]
    local v206 = p204.cards[p205]
    if not v206 then
        return nil
    end
    for v207, v208 in v206 do
        local _ = v207 - 1
        v208:Destroy()
    end
    table.clear(v206)
end
function u46.lerp(_, p209, p210, p211) --[[ Line: 592 ]]
    return Vector2.new(p209, 0):Lerp(Vector2.new(p210, 0), p211).X
end
u8.CreateController(u46.new())
return nil