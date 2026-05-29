local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "select", "block-selector").BlockSelectorMode
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u6 = v5.AbilityState
local u7 = v5.AnnouncementVariant
local u8 = v5.DeviceUtil
local u9 = v5.RandomUtil
local u10 = v5.SoundManager
local u11 = v5.WatchCharacter
local u12 = v5.WatchComponent
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v18 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u19 = v18.Players
local u20 = v18.ReplicatedStorage
local u21 = v18.UserInputService
local u22 = v18.Workspace
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u24 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u25 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u26 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "block-engine", "client-block-engine").ClientBlockEngine
local u27 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local v30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "shop-component")
local u31 = v30.default
local u32 = v30.BedwarsShopType
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType
local u36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u37 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "block-hunt", "block-hunt-config").BlockHuntConfig
local u38 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "block-hunt", "block-hunt-team-id").BlockHuntTeamId
local u39 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u40 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u41 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u42 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u43 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u44 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u45 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u46 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "components", "circle-countdown-announcement").CircleCountdownAnnouncement
local u47 = v1.import(script, script.Parent.Parent, "bedwars", "kit", "kits", "mimic", "ui", "mimic-block-face").MimicBlockFace
local u48 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 53 ]]
        return "BlockHuntHiderController"
    end,
    ["__index"] = u25
})
u48.__index = u48
function u48.new(...) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u48
    --]]
    local v49 = u48
    local v50 = setmetatable({}, v49)
    return v50:constructor(...) or v50
end
function u48.constructor(p51) --[[ Line: 63 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u36
    --]]
    u25.constructor(p51, { u36.BLOCK_HUNT })
    p51.Name = "BlockHuntHiderController"
    p51.disguisedPlayerMap = {}
    p51.invisiblePlayers = {}
    p51.hiderList = {}
    p51.isPreloaded = false
end
function u48.onGameInit(u52) --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u7
        [3] = u46
        [4] = u12
        [5] = u31
        [6] = u32
        [7] = u16
        [8] = u22
        [9] = u19
        [10] = u43
        [11] = u13
        [12] = u11
        [13] = u38
        [14] = u44
        [15] = u39
        [16] = u15
        [17] = u28
        [18] = u6
        [19] = u24
        [20] = u10
        [21] = u9
        [22] = u20
        [23] = u23
        [24] = u14
        [25] = u35
        [26] = u45
        [27] = u33
        [28] = u37
        [29] = u34
        [30] = u27
        [31] = u42
        [32] = u3
        [33] = u40
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/announcement/announcement-controller@AnnouncementController"):setDefaultUI(u7.countdown.type, u46)
    u12(u31, function(p53) --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u16
        --]]
        if p53.attributes.ShopType == u32.ITEM_SHOP and p53:waitForShopModel() then
            u16("Highlight", {
                ["Name"] = "ShopHighlight",
                ["OutlineTransparency"] = 0,
                ["FillTransparency"] = 0.75,
                ["Parent"] = p53:waitForShopModel(),
                ["FillColor"] = Color3.fromRGB(251, 255, 0),
                ["DepthMode"] = Enum.HighlightDepthMode.AlwaysOnTop
            })
        end
    end)
    task.spawn(function() --[[ Line: 89 ]]
        --[[
        Upvalues:
            [1] = u52
            [2] = u22
            [3] = u19
            [4] = u43
            [5] = u13
        --]]
        while true do
            local v54 = task.wait(0.25)
            if v54 == 0 or (v54 ~= v54 or not v54) then
                break
            end
            for v55, v56 in u52.disguisedPlayerMap do
                local v57 = v55.Character
                if v57 ~= nil then
                    v57 = v57:FindFirstChildWhichIsA("Humanoid")
                end
                if v57 and u52.invisiblePlayers[v55.UserId] == nil then
                    if u22:GetServerTimeNow() - v56.lastMoveTime >= 1 and (v57.MoveDirection.Magnitude == 0 and (v57:GetState() ~= Enum.HumanoidStateType.Freefall and v57:GetState() ~= Enum.HumanoidStateType.Jumping)) then
                        if v56.inMovement then
                            v56.inMovement = false
                            if u19.LocalPlayer == v55 then
                                if u52.lastSnapRequestThread then
                                    task.cancel(u52.lastSnapRequestThread)
                                    u52.lastSnapRequestThread = nil
                                end
                                u52.lastSnapRequestThread = task.spawn(function() --[[ Line: 120 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u43
                                    --]]
                                    u43.Client:Get("BHHiderSnapToGrid"):SendToServer()
                                end)
                            end
                        end
                    elseif not v56.inMovement then
                        v56.inMovement = true
                        if u19.LocalPlayer == v55 then
                            local v58 = u52.tauntMaid
                            if v58 ~= nil then
                                v58:Destroy()
                            end
                        end
                        u13.Controllers.BlockDisguiseController:disguisePlayerAsBlock(v55, v56.selectedBlock)
                    end
                end
            end
        end
    end)
    u11(function(u59, p60) --[[ Line: 141 ]]
        --[[
        Upvalues:
            [1] = u52
            [2] = u38
            [3] = u22
        --]]
        if u52:waitForPlayerTeam(u59).id ~= u38.HIDERS then
            return nil
        end
        p60:WaitForChild("Humanoid"):GetPropertyChangedSignal("MoveDirection"):Connect(function() --[[ Line: 145 ]]
            --[[
            Upvalues:
                [1] = u52
                [2] = u59
                [3] = u22
            --]]
            local v61 = u52.disguisedPlayerMap[u59]
            if v61 then
                v61.lastMoveTime = u22:GetServerTimeNow()
            end
        end)
    end)
    u11(function(u62, _) --[[ Line: 154 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u52
            [3] = u38
            [4] = u13
            [5] = u44
            [6] = u39
            [7] = u15
            [8] = u2
            [9] = u28
            [10] = u6
        --]]
        if u62 ~= u19.LocalPlayer then
            return nil
        end
        if u52:waitForPlayerTeam(u62).id ~= u38.HIDERS then
            return nil
        end
        if u52.hiderList[u62.UserId] ~= nil then
            return nil
        end
        u52.hiderList[u62.UserId] = true
        if not u52.isPreloaded then
            u13.Controllers.PreloadController:runPreload({
                ["sounds"] = { u44.GENERIC_BLOCK_PLACE, u44.MIMIC_HIDE, u44.ERROR_NOTIFICATION },
                ["animations"] = {},
                ["imageIds"] = { u39.MIMIC_BLOCK }
            })
            u52.isPreloaded = true
        end
        local v63 = u52.hiderMaid
        if v63 ~= nil then
            v63:Destroy()
        end
        local u64 = u15.new()
        u62.CameraMaxZoomDistance = 50
        local v65 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v66 = u28.BH_HIDER_DISGUISE_BLOCK
        local v67 = {
            ["abilityType"] = "KitPrimary"
        }
        local v68 = {
            ["icon"] = u39.BH_DISGUISE,
            ["stateColors"] = {
                [u6.PROGRESSING] = Color3.fromRGB(120, 133, 140)
            }
        }
        v67.abilityButton = v68
        v65:enableAbility(v66, v67):andThen(function(p69) --[[ Line: 193 ]]
            --[[
            Upvalues:
                [1] = u64
            --]]
            u64:GiveTask(p69)
        end)
        local v70 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v71 = u28.BH_HIDER_INVISIBLITY
        local v72 = {
            ["abilityType"] = "KitSecondary"
        }
        local v73 = {
            ["icon"] = u39.SMOKE,
            ["stateColors"] = {
                [u6.PROGRESSING] = Color3.fromRGB(120, 133, 140)
            }
        }
        v72.abilityButton = v73
        v70:enableAbility(v71, v72):andThen(function(p74) --[[ Line: 207 ]]
            --[[
            Upvalues:
                [1] = u64
            --]]
            u64:GiveTask(p74)
        end)
        u64:GiveTask(function() --[[ Line: 211 ]]
            --[[
            Upvalues:
                [1] = u62
            --]]
            u62.CameraMaxZoomDistance = 14
        end)
        u52.hiderMaid = u64
    end)
    u24.AbilityUsed:connect(function(p75) --[[ Line: 217 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u19
            [3] = u44
            [4] = u10
            [5] = u9
        --]]
        if p75:isCancelled() then
            return nil
        end
        if p75.ability ~= u28.BH_HIDER_TAUNT_SOUND then
            return nil
        end
        if not u19:GetPlayerFromCharacter(p75.userCharacter) then
            return nil
        end
        local v76 = { u44.VOICE_HONK, u44.TOAD_CROAK, u44.YETI_ROAR }
        u10:playSound(u9.fromList(unpack(v76)), {
            ["rollOffMaxDistance"] = 100,
            ["rollOffMinDistance"] = 40,
            ["position"] = p75.userCharacter:GetPivot().Position
        })
    end)
    u24.AbilityUsed:connect(function(p77) --[[ Line: 236 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u19
            [3] = u20
            [4] = u22
            [5] = u23
            [6] = u14
            [7] = u10
            [8] = u44
            [9] = u35
            [10] = u13
            [11] = u9
        --]]
        if p77:isCancelled() then
            return nil
        end
        if p77.ability ~= u28.BH_HIDER_TAUNT_FIREWORK then
            return nil
        end
        local v78 = u19:GetPlayerFromCharacter(p77.userCharacter)
        if not v78 then
            return nil
        end
        local v79 = v78 == u19.LocalPlayer
        local u80 = p77.userCharacter:GetPivot().Position
        local u81 = u80 + Vector3.new(0, 48, 0)
        local u82 = u20.Assets.Effects.NewYearsFireworkRocket:Clone()
        u82.Parent = u22
        u82:PivotTo(CFrame.new(u80))
        u23(1, u14, function(p83) --[[ Line: 255 ]]
            --[[
            Upvalues:
                [1] = u80
                [2] = u81
                [3] = u82
            --]]
            local v84 = u80:Lerp(u81, p83)
            u82:PivotTo(CFrame.new(v84))
            u82.Transparency = p83 / 1
        end):Play()
        local v85 = u10
        local v86 = u44.FIREWORK_LAUNCH
        local v87 = {}
        if v79 then
            u80 = nil
        end
        v87.position = u80
        v85:playSound(v86, v87)
        local v88 = u10
        local v89 = u44.FIREWORK_TRAIL
        local v90 = {
            ["looped"] = true
        }
        local v91
        if v79 then
            v91 = nil
        else
            v91 = u82.CFrame.Position
        end
        v90.position = v91
        local u92 = v88:playSound(v89, v90)
        task.delay(1, function() --[[ Line: 268 ]]
            --[[
            Upvalues:
                [1] = u92
                [2] = u82
                [3] = u35
                [4] = u13
                [5] = u81
                [6] = u9
            --]]
            local v93 = u92
            if v93 ~= nil then
                v93:Destroy()
            end
            u82:Destroy()
            local v94 = {
                u35.HEART,
                u35.NEW_YEARS,
                u35.SPARKS,
                u35.NORMAL
            }
            u13.Controllers.FireworkController:playFireworkEffect(u81, u9.fromList(unpack(v94)), {
                ["sizeMultiplier"] = 0.9,
                ["volumeMultiplier"] = 0.6,
                ["popSoundPlaybackSpeedMultiplier"] = 1
            })
        end)
    end)
    u24.AbilityUsed:connect(function(p95) --[[ Line: 283 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u19
            [3] = u52
            [4] = u43
        --]]
        if p95:isCancelled() then
            return nil
        end
        if p95.ability ~= u28.BH_HIDER_DISGUISE_BLOCK then
            return nil
        end
        local v96 = u19:GetPlayerFromCharacter(p95.userCharacter)
        if not v96 then
            return nil
        end
        if v96 ~= u19.LocalPlayer then
            return nil
        end
        if not u52.currentSelectedBlock then
            return nil
        end
        local v97 = u43.Client:Get("BHHiderDisguiseBlock")
        local v98 = {
            ["data"] = {
                ["blockType"] = u52.currentSelectedBlock
            }
        }
        v97:SendToServer(v98)
    end)
    u24.AbilityUsed:connect(function(p99) --[[ Line: 307 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u19
            [3] = u43
        --]]
        if p99:isCancelled() then
            return nil
        end
        if p99.ability ~= u28.BH_HIDER_INVISIBLITY then
            return nil
        end
        local v100 = u19:GetPlayerFromCharacter(p99.userCharacter)
        if not v100 then
            return nil
        end
        if v100 ~= u19.LocalPlayer then
            return nil
        end
        u43.Client:Get("BHHiderInvisibility"):SendToServer()
    end)
    u43.Client:Get("ValidatedBHHiderInvisibility"):Connect(function(p101) --[[ Line: 323 ]]
        --[[
        Upvalues:
            [1] = u52
            [2] = u13
            [3] = u20
            [4] = u22
            [5] = u45
            [6] = u10
            [7] = u44
            [8] = u19
            [9] = u2
            [10] = u33
            [11] = u37
        --]]
        if p101.invisible then
            u52.invisiblePlayers[p101.player.UserId] = true
            local v102 = u13.Controllers.BlockDisguiseController:getPlayerBlockModel(p101.player)
            if v102 then
                v102:Destroy()
            end
            if p101.player.Character then
                local v103 = p101.player.Character:GetPivot().Position
                local v104 = u20.Assets.Effects.MimicBlockEffect:Clone()
                v104.Parent = u22
                v104.Position = v103
                u45:playEffects({ v104 }, nil, {
                    ["destroyAfterSec"] = 1
                })
                u10:playSound(u44.SMOKE_GRENADE_POP, {
                    ["position"] = v103
                })
            end
            if u19.LocalPlayer == p101.player then
                local v105 = u52.invisiblityBarMaid
                if v105 ~= nil then
                    v105:Destroy()
                end
                u52.invisiblityBarMaid = u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(u33.BH_HIDER_INVISIBLITY_BAR)
                local v106 = u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController")
                local v107 = u33.BH_HIDER_INVISIBLITY_BAR
                local v108 = u37.HIDER_INVISIBLITY_DURATION
                local v109 = {
                    ["cooldownBar"] = {
                        ["color"] = Color3.fromRGB(255, 247, 105)
                    }
                }
                v106:setOnCooldown(v107, v108, v109)
                return
            end
        else
            u52.invisiblePlayers[p101.player.UserId] = nil
            if u19.LocalPlayer == p101.player then
                local v110 = u52.invisiblityBarMaid
                if v110 ~= nil then
                    v110:Destroy()
                end
            end
        end
    end)
    u24.CanUseLocalAbility:connect(function(p111) --[[ Line: 369 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u34
            [3] = u19
            [4] = u52
            [5] = u10
            [6] = u44
        --]]
        if p111.ability ~= u28.BH_HIDER_DISGUISE_BLOCK then
            return nil
        end
        local v112 = u34:getEntity(p111.userCharacter)
        if v112 ~= nil then
            v112 = v112:isAlive()
        end
        if not v112 then
            p111:setCancelled(true)
        end
        local v113 = u19:GetPlayerFromCharacter(p111.userCharacter)
        if v113 then
            local v114 = u52.disguisedPlayerMap[v113]
            u52.currentSelectedBlock = u52:getSelectedBlockFromPlayer(v113)
            local v115 = u52.currentSelectedBlock == nil
            if not v115 then
                if v114 ~= nil then
                    v114 = v114.selectedBlock
                end
                v115 = v114 == u52.currentSelectedBlock
            end
            if v115 then
                p111:setCancelled(true)
            end
            if u52.invisiblePlayers[v113.UserId] ~= nil then
                p111:setCancelled(true)
            end
        end
        if p111:isCancelled() then
            u10:playSound(u44.ERROR_NOTIFICATION, {
                ["volumeMultiplier"] = 0.25
            })
        end
    end)
    u24.CanUseLocalAbility:connect(function(p116) --[[ Line: 409 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u34
            [3] = u19
            [4] = u52
            [5] = u10
            [6] = u44
        --]]
        if p116.ability ~= u28.BH_HIDER_TAUNT_FIREWORK then
            return nil
        end
        local v117 = u34:getEntity(p116.userCharacter)
        if v117 ~= nil then
            v117 = v117:isAlive()
        end
        if not v117 then
            p116:setCancelled(true)
        end
        local v118 = u19:GetPlayerFromCharacter(p116.userCharacter)
        if v118 and u52.invisiblePlayers[v118.UserId] ~= nil then
            p116:setCancelled(true)
        end
        if p116:isCancelled() then
            u10:playSound(u44.ERROR_NOTIFICATION, {
                ["volumeMultiplier"] = 0.25
            })
        end
    end)
    u24.CanUseLocalAbility:connect(function(p119) --[[ Line: 436 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u34
            [3] = u19
            [4] = u52
            [5] = u10
            [6] = u44
        --]]
        if p119.ability ~= u28.BH_HIDER_TAUNT_SOUND then
            return nil
        end
        local v120 = u34:getEntity(p119.userCharacter)
        if v120 ~= nil then
            v120 = v120:isAlive()
        end
        if not v120 then
            p119:setCancelled(true)
        end
        local v121 = u19:GetPlayerFromCharacter(p119.userCharacter)
        if v121 and u52.invisiblePlayers[v121.UserId] ~= nil then
            p119:setCancelled(true)
        end
        if p119:isCancelled() then
            u10:playSound(u44.ERROR_NOTIFICATION, {
                ["volumeMultiplier"] = 0.25
            })
        end
    end)
    u24.CanUseLocalAbility:connect(function(p122) --[[ Line: 463 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u34
            [3] = u22
            [4] = u27
            [5] = u37
            [6] = u10
            [7] = u44
        --]]
        if p122.ability ~= u28.BH_HIDER_INVISIBLITY then
            return nil
        end
        local v123 = u34:getEntity(p122.userCharacter)
        if v123 ~= nil then
            v123 = v123:isAlive()
        end
        if not v123 then
            p122:setCancelled(true)
        end
        if u22:GetServerTimeNow() < u27:getState().Game.startTime + u37.RELEASE_HUNTERS_DELAY then
            p122:setCancelled(true)
        end
        if p122:isCancelled() then
            u10:playSound(u44.ERROR_NOTIFICATION, {
                ["volumeMultiplier"] = 0.25
            })
        end
    end)
    u43.Client:Get("BHSetHunter"):Connect(function(p124) --[[ Line: 484 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u52
        --]]
        if p124.player ~= u19.LocalPlayer then
            return nil
        end
        local v125 = u52.hiderMaid
        if v125 ~= nil then
            v125:Destroy()
        end
        local v126 = u52.tauntMaid
        if v126 ~= nil then
            v126:Destroy()
        end
    end)
    u24.MatchStateChange:connect(function(p127) --[[ Line: 497 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u52
        --]]
        if p127.matchState ~= u42.POST then
            return nil
        end
        local v128 = u52.tauntMaid
        if v128 ~= nil then
            v128:Destroy()
        end
    end)
    u43.Client:Get("ValidatedBHHiderSnapToGrid"):Connect(function(p129) --[[ Line: 507 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u19
            [3] = u10
            [4] = u44
        --]]
        if not u13.Controllers.BlockDisguiseController:anchorBlockModel(p129.player) then
            return nil
        end
        if u19.LocalPlayer == p129.player then
            local v130 = p129.player.Character
            if v130 ~= nil then
                v130 = v130.PrimaryPart
                if v130 ~= nil then
                    v130 = v130.Position
                end
            end
            if v130 then
                u10:playSound(u44.GENERIC_BLOCK_PLACE, {
                    ["playbackSpeedMultiplier"] = 1.27,
                    ["position"] = v130
                })
            end
        end
    end)
    u43.Client:Get("BHHiderRegisterTauntAbilities"):Connect(function() --[[ Line: 529 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u42
            [3] = u52
            [4] = u19
        --]]
        if u27:getState().Game.matchState ~= u42.RUNNING then
            return nil
        end
        local v131 = u52.disguisedPlayerMap[u19.LocalPlayer]
        if not v131 then
            return nil
        end
        if v131.inMovement then
            return nil
        end
        u52:registerTauntAbilities(u19.LocalPlayer)
    end)
    u43.Client:OnEvent("ValidatedBHHiderDisguiseBlock", function(p132) --[[ Line: 545 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u52
            [3] = u22
        --]]
        local v133 = p132.player
        local v134 = p132.blockType ~= nil
        if v134 then
            u13.Controllers.BlockDisguiseController:hidePlayer(v133, true)
            u13.Controllers.BlockDisguiseController:disguisePlayerAsBlock(v133, p132.blockType)
            u52.disguisedPlayerMap[v133] = {
                ["inMovement"] = false,
                ["selectedBlock"] = p132.blockType,
                ["lastMoveTime"] = u22:GetServerTimeNow()
            }
        else
            u52.disguisedPlayerMap[v133] = nil
            u13.Controllers.BlockDisguiseController:undisguisePlayer(v133)
        end
        u52:playEffect(v133, v134)
    end)
    u24.MatchStateChange:connect(function(p135) --[[ Line: 565 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u3
            [3] = u40
            [4] = u9
            [5] = u19
            [6] = u43
        --]]
        if p135.matchState == u42.RUNNING then
            task.spawn(function() --[[ Line: 567 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u40
                    [3] = u9
                    [4] = u19
                    [5] = u43
                --]]
                local v136 = u3:getStore():getAllBlocks()
                local v137 = table.create(#v136)
                local v138 = {}
                for v139, v140 in v136 do
                    local _ = v139 - 1
                    v137[v139] = v140.Name
                end
                for _, v141 in v137 do
                    v138[v141] = true
                end
                local v142 = {}
                local v143 = #v142
                for v144 in v138 do
                    v143 = v143 + 1
                    v142[v143] = v144
                end
                local v145 = 0
                local v146 = {}
                for v147, v148 in v142 do
                    local _ = v147 - 1
                    local v149
                    if v148 then
                        v149 = u40(v148)
                    else
                        v149 = nil
                    end
                    if (v149 and (v149.block and v149.block.greedyMesh) and true or false) == true then
                        v145 = v145 + 1
                        v146[v145] = v148
                    end
                end
                local u150 = u9.fromList(unpack(v146))
                u19.LocalPlayer.CharacterAdded:Once(function() --[[ Line: 606 ]]
                    --[[
                    Upvalues:
                        [1] = u43
                        [2] = u150
                    --]]
                    local v151 = {
                        ["data"] = {
                            ["blockType"] = u150
                        }
                    }
                    u43.Client:Get("BHHiderDisguiseBlock"):SendToServer(v151)
                end)
            end)
        end
    end)
end
function u48.registerTauntAbilities(p152, p153) --[[ Line: 617 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u15
        [3] = u2
        [4] = u28
        [5] = u39
        [6] = u6
    --]]
    if p153 ~= u19.LocalPlayer then
        return nil
    end
    local u154 = u15.new()
    local v155 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v156 = u28.BH_HIDER_TAUNT_SOUND
    local v157 = {
        ["abilityType"] = "KitTertiary"
    }
    local v158 = {
        ["icon"] = u39.BH_TAUNT_SOUND,
        ["stateColors"] = {
            [u6.PROGRESSING] = Color3.fromRGB(120, 133, 140)
        }
    }
    v157.abilityButton = v158
    v155:enableAbility(v156, v157):andThen(function(p159) --[[ Line: 632 ]]
        --[[
        Upvalues:
            [1] = u154
        --]]
        u154:GiveTask(p159)
    end)
    local v160 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v161 = u28.BH_HIDER_TAUNT_FIREWORK
    local v162 = {
        ["abilityType"] = "ItemPrimary"
    }
    local v163 = {
        ["icon"] = u39.BH_TAUNT_FIREWORK,
        ["stateColors"] = {
            [u6.PROGRESSING] = Color3.fromRGB(120, 133, 140)
        }
    }
    v162.abilityButton = v163
    v160:enableAbility(v161, v162):andThen(function(p164) --[[ Line: 646 ]]
        --[[
        Upvalues:
            [1] = u154
        --]]
        u154:GiveTask(p164)
    end)
    p152.tauntMaid = u154
end
function u48.playEffect(_, p165, p166) --[[ Line: 652 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u22
        [3] = u45
        [4] = u13
        [5] = u17
        [6] = u47
        [7] = u10
        [8] = u44
    --]]
    local v167 = p165.Character
    if v167 ~= nil then
        v167 = v167.PrimaryPart
        if v167 ~= nil then
            v167 = v167.Position
        end
    end
    if v167 then
        local v168 = u20.Assets.Effects.DisguiseEffect:Clone()
        v168.Parent = u22
        v168.Position = v167
        u45:playEffects({ v168 }, nil, {
            ["destroyAfterSec"] = 1
        })
        if p166 then
            local v169 = u13.Controllers.BlockDisguiseController:getPlayerBlockModel(p165)
            if v169 then
                local u170 = {}
                for _, v171 in Enum.NormalId:GetEnumItems() do
                    local v172 = u17.mount(u17.createElement(u47, {
                        ["face"] = v171
                    }), v169:FindFirstChild("Handle"))
                    table.insert(u170, v172)
                end
                task.delay(2, function() --[[ Line: 678 ]]
                    --[[
                    Upvalues:
                        [1] = u17
                        [2] = u170
                    --]]
                    for v173, v174 in u170 do
                        local _ = v173 - 1
                        u17.unmount(v174)
                    end
                end)
            end
        end
        u10:playSound(u44.BLOCK_DISGUISE, {
            ["volumeMultiplier"] = 0.5,
            ["position"] = v167
        })
    end
end
function u48.getSelectedBlockFromPlayer(_, p175) --[[ Line: 694 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u3
        [3] = u41
        [4] = u8
        [5] = u21
        [6] = u26
        [7] = u4
    --]]
    local v176 = p175.Character
    if not v176 then
        return nil
    end
    local v177 = v176:FindFirstChildWhichIsA("Humanoid")
    if not v177 then
        return nil
    end
    local v178 = v176.PrimaryPart
    if not v178 then
        return nil
    end
    local v179 = v178.Size.Y / 2 + v177.HipHeight + 0.25 * u29
    local v180 = v178.Position - Vector3.new(0, v179, 0)
    local v181 = u3:getStore():getBlockAt(u3:getBlockPosition(v180))
    local v182
    if v181 and u41[v181.Name] ~= nil then
        v182 = v181.Name
    else
        v182 = nil
    end
    if not u8.isMobileControls() and (not u8.isGamepadControls() and #u21:GetConnectedGamepads() == 0) then
        local v183 = u26:getBlockSelector():getMouseInfo(u4.SELECT)
        if v183 ~= nil then
            v183 = v183.target
        end
        if v183 ~= nil then
            v183 = v183.blockInstance.Name
        end
        if v183 ~= nil then
            v182 = v183
        end
    end
    return v182
end
function u48.waitForPlayerTeam(_, p184) --[[ Line: 735 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v185 = u13.Controllers.TeamController:getPlayerTeam(p184)
    while true do
        local v186 = task.wait(0.1)
        if v186 ~= 0 and (v186 == v186 and v186) then
            v186 = not v185
        end
        if v186 == 0 or (v186 ~= v186 or not v186) then
            return v185
        end
        v185 = u13.Controllers.TeamController:getPlayerTeam(p184)
    end
end
u13.CreateController(u48.new())
return nil