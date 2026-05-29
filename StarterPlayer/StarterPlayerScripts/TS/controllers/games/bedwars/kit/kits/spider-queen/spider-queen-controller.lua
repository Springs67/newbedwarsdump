local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.DeviceUtil
local u6 = v3.GameQueryUtil
local u7 = v3.SoundManager
local u8 = v3.WatchCollectionTag
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.CollectionService
local u14 = v12.Players
local u15 = v12.ReplicatedStorage
local u16 = v12.RunService
local u17 = v12.TweenService
local u18 = v12.Workspace
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "spider-queen-balance").SpiderQueenBalance
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-util").findSurfacePosition
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spider-queen", "spider-queen-util").SpiderQueenUtil
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u34 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u35 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 40 ]]
        return "SpiderQueenController"
    end,
    ["__index"] = u34
})
u35.__index = u35
function u35.new(...) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u35
    --]]
    local v36 = u35
    local v37 = setmetatable({}, v36)
    return v37:constructor(...) or v37
end
function u35.constructor(p38) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u34
        [2] = u27
        [3] = u10
    --]]
    u34.constructor(p38, u27.SPIDER_QUEEN)
    p38.Name = "SpiderQueenController"
    p38.aimMaid = u10.new()
    p38.initialized = false
    p38.hasValidAim = false
end
function u35.onKitLocalActivated(u39, u40) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u32
        [3] = u22
        [4] = u2
        [5] = u20
        [6] = u21
        [7] = u19
        [8] = u28
        [9] = u26
        [10] = u14
        [11] = u27
        [12] = u30
        [13] = u7
        [14] = u31
    --]]
    if u39.initialized then
        return nil
    end
    u39.initialized = true
    u9.Controllers.PreloadController:runPreload({
        ["sounds"] = { u32.CRYPT_SUMMON_SKELETON },
        ["animations"] = { u22.NECROMANCER_SUMMON }
    })
    local v41 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v42 = u20.SPIDER_QUEEN_SUMMON_SPIDERS
    local v43 = {}
    for v44, v45 in u21[u20.SPIDER_QUEEN_SUMMON_SPIDERS].triggerConfig do
        v43[v44] = v45
    end
    v41:enableAbility(v42, v43):andThen(function(p46) --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u40
        --]]
        u40:GiveTask(p46)
    end)
    local v47 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v48 = u20.SPIDER_QUEEN_WEB_BRIDGE_AIM
    local v49 = {}
    for v50, v51 in u21[u20.SPIDER_QUEEN_WEB_BRIDGE_AIM].triggerConfig do
        v49[v50] = v51
    end
    v47:enableAbility(v48, v49):andThen(function(p52) --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u39
        --]]
        u40:GiveTask(p52)
        u39.abilityRef = p52
    end)
    u40:GiveTask(u19.CanUseLocalAbility:connect(function(p53) --[[ Line: 89 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u26
            [3] = u9
            [4] = u14
            [5] = u27
            [6] = u30
        --]]
        local v54 = u28.Abilities
        local v55 = p53.ability
        if table.find(v54, v55) == nil then
            return nil
        end
        local v56 = u26:getEntity(p53.userCharacter)
        if not v56 then
            return nil
        end
        if not u9.Controllers.KitController:isUsingKit(u14.LocalPlayer, u27.SPIDER_QUEEN) then
            p53:setCancelled(true)
            return nil
        end
        if v56:isDead() then
            p53:setCancelled(true)
            return nil
        end
        if u9.Controllers.MatchController:getMatchState() ~= u30.RUNNING then
            p53:setCancelled(true)
            return nil
        end
    end))
    u40:GiveTask(u19.CanUseLocalAbility:connect(function(p57) --[[ Line: 113 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u9
            [3] = u14
            [4] = u27
            [5] = u39
            [6] = u7
            [7] = u32
        --]]
        if p57.ability ~= u20.SPIDER_QUEEN_WEB_BRIDGE_FIRE then
            return nil
        end
        if not u9.Controllers.KitController:isUsingKit(u14.LocalPlayer, u27.SPIDER_QUEEN) then
            return nil
        end
        if not u39.hasValidAim then
            p57:setCancelled(true)
            u7:playSound(u32.UI_CLOSE_2, {
                ["volumeMultiplier"] = 0.8
            })
        end
    end))
    u40:GiveTask((u31.Client:Get("EntityDeathEvent"):Connect(function(p58) --[[ Line: 127 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u9
            [3] = u27
            [4] = u39
        --]]
        local v59 = u14:GetPlayerFromCharacter(p58.entityInstance)
        if not v59 then
            return nil
        end
        if v59 ~= u14.LocalPlayer then
            return nil
        end
        if not u9.Controllers.KitController:isUsingKit(v59, u27.SPIDER_QUEEN) then
            return nil
        end
        u39.aimMaid:DoCleaning()
    end)))
end
function u35.onKitLocalDeactivated(_) --[[ Line: 142 ]] end
function u35.onKitReplicationActivated(u60, u61) --[[ Line: 144 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u8
        [3] = u10
        [4] = u17
        [5] = u24
        [6] = u9
        [7] = u14
        [8] = u28
        [9] = u19
        [10] = u33
        [11] = u7
        [12] = u32
        [13] = u27
        [14] = u20
        [15] = u2
        [16] = u21
        [17] = u29
    --]]
    for v62, v63 in u13:GetTagged("spider-queen-web-block") do
        local _ = v62 - 1
        u60:setUpWebBlock(v63)
    end
    u61:GiveTask(u8("spider-queen-web-block", function(p64) --[[ Line: 153 ]]
        --[[
        Upvalues:
            [1] = u60
        --]]
        u60:setUpWebBlock(p64)
    end))
    u61:GiveTask(u8("spider-queen-spider", function(u65) --[[ Line: 157 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u17
            [3] = u24
            [4] = u9
            [5] = u14
            [6] = u28
        --]]
        local u66 = u10.new()
        u65.AncestryChanged:Connect(function() --[[ Line: 159 ]]
            --[[
            Upvalues:
                [1] = u65
                [2] = u66
            --]]
            if not u65.Parent then
                u66:DoCleaning()
            end
        end)
        u65:WaitForChild("Torso")
        u65:WaitForChild("Eyes")
        u65:WaitForChild("Legs")
        local v67 = u65:GetDescendants()
        local function v69(p68) --[[ Line: 169 ]]
            --[[
            Upvalues:
                [1] = u17
            --]]
            if p68:IsA("MeshPart") then
                p68.Transparency = 1
                u17:Create(p68, TweenInfo.new(1), {
                    ["Transparency"] = 0
                }):Play()
            end
        end
        for v70, v71 in v67 do
            v69(v71, v70 - 1, v67)
        end
        u66:GiveTask(task.delay(u24.SPIDERLING_LIFETIME - 1, function() --[[ Line: 181 ]]
            --[[
            Upvalues:
                [1] = u65
                [2] = u17
            --]]
            local v72 = u65:GetDescendants()
            local function v74(p73) --[[ Line: 183 ]]
                --[[
                Upvalues:
                    [1] = u17
                --]]
                if p73:IsA("MeshPart") then
                    p73.Transparency = 0
                    u17:Create(p73, TweenInfo.new(1), {
                        ["Transparency"] = 1
                    }):Play()
                end
            end
            for v75, v76 in v72 do
                v74(v76, v75 - 1, v72)
            end
        end))
        local function u80(p77) --[[ Line: 196 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u14
                [3] = u28
            --]]
            local v78 = p77:GetAttribute("Team")
            local v79 = u9.Controllers.TeamController:getPlayerTeam(u14.LocalPlayer)
            if v79 and (v78 ~= "" and v78) then
                p77:WaitForChild("Eyes")
                p77:WaitForChild("Torso")
                if v78 == v79.id then
                    p77.Eyes.Color = u28.AlliedSpiderlingColor
                    p77.Torso.EvilAura.Enabled = false
                    p77.Torso.Attachment.Specs.Enabled = false
                else
                    p77.Eyes.Color = u28.EnemySpiderlingColor
                    p77.Torso.EvilAura.Enabled = true
                    p77.Torso.Attachment.Specs.Enabled = true
                end
            else
                return nil
            end
        end
        u80(u65)
        u66:GiveTask(u65:GetAttributeChangedSignal("Team"):Connect(function() --[[ Line: 215 ]]
            --[[
            Upvalues:
                [1] = u80
                [2] = u65
            --]]
            u80(u65)
        end))
        u66:GiveTask(u14.LocalPlayer:GetAttributeChangedSignal("Team"):Connect(function() --[[ Line: 218 ]]
            --[[
            Upvalues:
                [1] = u80
                [2] = u65
            --]]
            u80(u65)
        end))
        local v81 = u65:GetAttribute("PlacedByUserId")
        local v82 = v81 ~= 0 and (v81 == v81 and (v81 and u14:GetPlayerByUserId(v81)))
        if v82 then
            u66:GiveTask(v82:GetAttributeChangedSignal("Team"):Connect(function() --[[ Line: 225 ]]
                --[[
                Upvalues:
                    [1] = u80
                    [2] = u65
                --]]
                u80(u65)
            end))
        end
    end))
    u61:GiveTask(u19.StatusEffectAdded:connect(function(p83) --[[ Line: 231 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u14
            [3] = u7
            [4] = u32
        --]]
        if p83.statusEffect ~= u33.SPIDER_WEB_SLOW then
            return nil
        end
        local v84 = p83.entityInstance == u14.LocalPlayer.Character
        local v85 = u7
        local v86 = u32.SPIDER_WEB
        local v87 = {}
        local v88
        if v84 then
            v88 = nil
        else
            v88 = p83.entityInstance.PrimaryPart
            if v88 ~= nil then
                v88 = v88.Position
            end
        end
        v87.position = v88
        v87.volumeMultiplier = v84 and 0.7 or 1
        v85:playSound(v86, v87)
    end))
    u61:GiveTask(u19.AbilityUsed:connect(function(u89) --[[ Line: 254 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u9
            [3] = u27
            [4] = u20
            [5] = u60
            [6] = u2
            [7] = u21
            [8] = u61
            [9] = u29
        --]]
        local v90 = u14:GetPlayerFromCharacter(u89.userCharacter)
        if v90 then
            if u9.Controllers.KitController:isUsingKit(v90, u27.SPIDER_QUEEN) then
                local v91 = u89.ability
                local v92 = false
                if v91 == u20.SPIDER_QUEEN_SUMMON_SPIDERS then
                    u60:playSummonSpidersEffect(v90)
                    return
                elseif v91 == u20.SPIDER_QUEEN_WEB_BRIDGE_AIM then
                    if u89.userCharacter ~= u14.LocalPlayer.Character then
                        return nil
                    end
                    u60:createAimLine()
                    if u60.abilityRef ~= nil then
                        u60.abilityRef.Destroy()
                    end
                    local v93 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
                    local v94 = u20.SPIDER_QUEEN_WEB_BRIDGE_FIRE
                    local v95 = {}
                    for v96, v97 in u21[u20.SPIDER_QUEEN_WEB_BRIDGE_FIRE].triggerConfig do
                        v95[v96] = v97
                    end
                    function v95.getExtraData() --[[ Line: 283 ]]
                        --[[
                        Upvalues:
                            [1] = u60
                        --]]
                        return {
                            ["direction"] = u60:getWebBridgeProjectileDirection()
                        }
                    end
                    v93:enableAbility(v94, v95):andThen(function(p98) --[[ Line: 289 ]]
                        --[[
                        Upvalues:
                            [1] = u60
                            [2] = u61
                        --]]
                        u60.abilityRef = p98
                        u61:GiveTask(p98)
                    end)
                    u60.aimMaid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u20.SPIDER_QUEEN_WEB_BRIDGE_CANCEL, {
                        ["abilityType"] = "KitTertiary",
                        ["abilityButton"] = {
                            ["icon"] = "rbxassetid://16812686987"
                        },
                        ["getExtraData"] = function() --[[ Name: getExtraData, Line 299 ]] end
                    }):expect())
                    u60.aimMaid:GiveTask(function() --[[ Line: 301 ]]
                        --[[
                        Upvalues:
                            [1] = u60
                            [2] = u2
                            [3] = u89
                            [4] = u29
                            [5] = u61
                        --]]
                        if u60.abilityRef ~= nil then
                            u60.abilityRef.Destroy()
                        end
                        local v99 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
                        local v100 = u89.ability
                        local v101 = {
                            ["abilityType"] = "KitPrimary",
                            ["abilityButton"] = {
                                ["icon"] = u29.SPIDER_QUEEN_WEB_BRIDGE_ICON
                            },
                            ["getExtraData"] = function() --[[ Name: getExtraData, Line 310 ]]
                                --[[
                                Upvalues:
                                    [1] = u60
                                --]]
                                return {
                                    ["direction"] = u60:getWebBridgeProjectileDirection()
                                }
                            end
                        }
                        v99:enableAbility(v100, v101):andThen(function(p102) --[[ Line: 316 ]]
                            --[[
                            Upvalues:
                                [1] = u60
                                [2] = u61
                            --]]
                            u60.abilityRef = p102
                            u61:GiveTask(p102)
                        end)
                    end)
                    return
                elseif (v91 == u20.SPIDER_QUEEN_WEB_BRIDGE_FIRE and true or v92 or v91 == u20.SPIDER_QUEEN_WEB_BRIDGE_CANCEL) and u89.userCharacter == u14.LocalPlayer.Character then
                    u60.aimMaid:DoCleaning()
                end
            else
                return nil
            end
        else
            return nil
        end
    end))
end
function u35.onKitReplicationDeactivated(_) --[[ Line: 336 ]] end
function u35.onInnateAbilityEnabled(_, _, _) --[[ Line: 338 ]] end
function u35.onAbilityUsed(_, _, _) --[[ Line: 340 ]] end
function u35.KnitStart(p103) --[[ Line: 342 ]]
    --[[
    Upvalues:
        [1] = u34
    --]]
    u34.KnitStart(p103)
end
function u35.setUpWebBlock(_, u104) --[[ Line: 345 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u28
        [3] = u24
        [4] = u17
    --]]
    local v105 = u104:GetAttribute("PlacedByUserId")
    if v105 == 0 or (v105 ~= v105 or not v105) then
        return nil
    end
    local v106
    if v105 == u14.LocalPlayer.UserId then
        v106 = u28.AlliedWebColor
    else
        v106 = u28.EnemyWebColor
    end
    u104:WaitForChild("WebColor")
    u104:WaitForChild("WebPlastic")
    u104.WebColor.Color = v106
    u104.WebPlastic.Color = v106
    task.delay(u24.WEB_BLOCK_LIFETIME - u24.WEB_BLOCK_FADE_DURATION, function() --[[ Line: 355 ]]
        --[[
        Upvalues:
            [1] = u104
            [2] = u17
            [3] = u24
        --]]
        if not (u104.WebColor and u104.WebPlastic) then
            return nil
        end
        u17:Create(u104.WebColor, TweenInfo.new(u24.WEB_BLOCK_FADE_DURATION, Enum.EasingStyle.Exponential), {
            ["Transparency"] = 1
        }):Play()
        u17:Create(u104.WebPlastic, TweenInfo.new(u24.WEB_BLOCK_FADE_DURATION, Enum.EasingStyle.Linear), {
            ["Transparency"] = 1
        }):Play()
    end)
end
function u35.playSummonSpidersEffect(_, u107) --[[ Line: 367 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u23
        [3] = u22
        [4] = u14
        [5] = u7
        [6] = u32
        [7] = u26
        [8] = u25
        [9] = u15
        [10] = u18
    --]]
    u4:playAnimation(u107, u23:getAssetId(u22.NECROMANCER_SUMMON))
    local v108 = u14.LocalPlayer == u107
    local v109 = u7
    local v110 = u32.CRYPT_SUMMON_SKELETON
    local v111 = {}
    local v112
    if v108 then
        v112 = nil
    else
        v112 = u107.Character
        if v112 ~= nil then
            v112 = v112.PrimaryPart
            if v112 ~= nil then
                v112 = v112.Position
            end
        end
    end
    v111.position = v112
    v111.playbackSpeedMultiplier = 1
    v111.volumeMultiplier = 1
    v109:playSound(v110, v111)
    task.spawn(function() --[[ Line: 391 ]]
        --[[
        Upvalues:
            [1] = u107
            [2] = u26
            [3] = u25
            [4] = u15
            [5] = u18
        --]]
        if not u107.Character then
            return nil
        end
        if not u26:getEntity(u107.Character) then
            return nil
        end
        local v113 = u107.Character:GetPivot().Position
        if not v113 then
            return nil
        end
        local v114 = u25(v113)
        if not v114 then
            return nil
        end
        local u115 = u15.Assets.Effects.SummonSpiders:Clone()
        u115.Parent = u18
        u115:PivotTo(CFrame.new(v114 + Vector3.new(0, 0.75, 0)))
        task.spawn(function() --[[ Line: 412 ]]
            --[[
            Upvalues:
                [1] = u115
            --]]
            u115.FlatGround.Ground.Center:Emit(2)
            u115.FlatGround.Ground.Dust:Emit(2)
            u115.FlatGround.Ground.Shockwave:Emit(3)
            u115.FlatGround.Ground.Wind:Emit(3)
            u115.FlatGround.Ground.Wind2:Emit(3)
            u115.FlatGround.Ground.Pulse:Emit(1)
            u115.FlatGround.Smoke:Emit(10)
            u115.FlatGround.Smoke2:Emit(10)
            u115.FlatGround.Sparks:Emit(10)
            u115.FlatGround.Summon.SummonCircle:Emit(1)
        end)
    end)
end
function u35.createAimLine(u116) --[[ Line: 426 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u18
        [3] = u11
        [4] = u15
        [5] = u6
        [6] = u5
        [7] = u28
        [8] = u13
        [9] = u24
        [10] = u16
    --]]
    local v117 = u14.LocalPlayer.Character
    if v117 ~= nil then
        v117 = v117.PrimaryPart
    end
    if not v117 then
        return nil
    end
    u116.aimLineOrigin = u11("Part", {
        ["Transparency"] = 1,
        ["CanCollide"] = false,
        ["Anchored"] = false,
        ["Parent"] = u18
    })
    local u118 = u15.Assets.Effects.SorcererHitIndicator:Clone()
    u118.Parent = u18
    u116.aimLineEnd = u118
    u116.aimLineOrigin:PivotTo(u14.LocalPlayer.Character:GetPivot())
    local v119 = u11("WeldConstraint", {
        ["Part0"] = u116.aimLineOrigin,
        ["Part1"] = u14.LocalPlayer.Character.PrimaryPart,
        ["Parent"] = u14.LocalPlayer.Character
    })
    u116.aimMaid:GiveTask(v119)
    u116.aimMaid:GiveTask(u118)
    u6:setQueryIgnored(u116.aimLineOrigin, true)
    u6:setQueryIgnored(u116.aimLineEnd, true)
    local v120 = u11("Attachment", {
        ["Parent"] = u116.aimLineOrigin
    })
    local v121 = u11("Attachment", {
        ["Parent"] = u116.aimLineEnd
    })
    local u122 = u5.isMobileControls() and 3 or 1
    local u123 = u11("Beam", {
        ["Name"] = "AimLine",
        ["FaceCamera"] = true,
        ["Segments"] = 300,
        ["Brightness"] = 1,
        ["Attachment0"] = v120,
        ["Attachment1"] = v121,
        ["Color"] = ColorSequence.new(u28.AimLineIndicatorColor),
        ["Transparency"] = NumberSequence.new(0),
        ["Width0"] = u122 * 0.1,
        ["Width1"] = u122 * 0.1,
        ["Parent"] = u18
    })
    u13:AddTag(u123, "projectile-preview-beam")
    u116.aimMaid:GiveTask(u123)
    local u124 = u24.WEB_BRIDGE_MAX_RANGE
    local v137 = u16.Heartbeat:Connect(function() --[[ Line: 477 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u116
            [3] = u14
            [4] = u13
            [5] = u124
            [6] = u123
            [7] = u28
            [8] = u122
            [9] = u118
        --]]
        local v125 = u18.CurrentCamera
        if v125 ~= nil then
            v125 = v125.CFrame
        end
        if v125 then
            local v126 = u116.aimLineOrigin
            if v126 ~= nil then
                v126 = v126.Position
            end
            if v126 then
                if u116.aimLineEnd then
                    local v127 = u14.LocalPlayer.Character
                    if v127 ~= nil then
                        v127 = v127:GetPivot().Position
                    end
                    if v127 then
                        local v128 = u116:getWebBridgeProjectileDirection()
                        local v129 = RaycastParams.new()
                        local v130 = {}
                        local v131 = #v130
                        local v132 = u13:GetTagged("DontBlockAbilityRaycast")
                        table.move(v132, 1, #v132, v131 + 1, v130)
                        v129.FilterDescendantsInstances = v130
                        v129.FilterType = Enum.RaycastFilterType.Exclude
                        local v133 = u18:Raycast(v127 + v128 * 5, v128 * u124, v129)
                        if v133 then
                            local v134 = u116.aimLineEnd
                            if v134 ~= nil then
                                v134:PivotTo(CFrame.new(v133.Position))
                            end
                            u116.hasValidAim = true
                            u123.Color = ColorSequence.new(u28.AimLineIndicatorColor)
                            u123.Width0 = u122 * 0.1
                            u123.Width1 = u122 * 0.1
                            u123.Transparency = NumberSequence.new(0)
                            u123.Brightness = 1.5
                            u116.aimLineEnd.Color = u28.AimLineIndicatorColor
                            u116.aimLineEnd.Transparency = 0
                            u118.Attachment.ParticleEmitter.Enabled = true
                        else
                            local v135 = u116.aimLineOrigin.Position + v128 * u124
                            local v136 = u116.aimLineEnd
                            if v136 ~= nil then
                                v136:PivotTo(CFrame.new(v135))
                            end
                            u116.hasValidAim = false
                            u123.Color = ColorSequence.new(Color3.fromRGB(255, 240, 255))
                            u123.Transparency = NumberSequence.new(0.25)
                            u123.Width0 = u122 * 0.08
                            u123.Width1 = u122 * 0.08
                            u123.Brightness = 1
                            u116.aimLineEnd.Color = Color3.new(1, 0.95, 1)
                            u116.aimLineEnd.Transparency = 0.75
                            u118.Attachment.ParticleEmitter:Clear()
                            u118.Attachment.ParticleEmitter.Enabled = false
                        end
                    else
                        return nil
                    end
                else
                    return nil
                end
            else
                return nil
            end
        else
            return nil
        end
    end)
    u116.aimMaid:GiveTask(v137)
    u116.aimMaid:GiveTask(function() --[[ Line: 551 ]]
        --[[
        Upvalues:
            [1] = u116
        --]]
        u116.hasValidAim = false
    end)
end
function u35.getWebBridgeProjectileDirection(_) --[[ Line: 555 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u9
    --]]
    local v138 = u18.CurrentCamera.CFrame.LookVector
    if u9.Controllers.CameraPerspectiveController:getCameraPerspective() == 1 then
        local v139 = v138.X
        local v140 = v138.Y + 0.3
        local v141 = v138.Z
        v138 = Vector3.new(v139, v140, v141)
    end
    return v138
end
u9.CreateController(u35.new())
return nil