local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ActionButton
local u5 = v3.AnimationUtil
local u6 = v3.AnnouncementVariant
local u7 = v3.ComponentUtil
local u8 = v3.ConstraintType
local u9 = v3.GamepadAction
local u10 = v3.IndicatorTransparencyFunctions
local u11 = v3.IndicatorUIType
local u12 = v3.RandomUtil
local u13 = v3.SoundManager
local u14 = v3.WatchCharacter
local u15 = v3.WatchPlayer
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u17 = v16.KnitClient
local u18 = v16.KnitClient
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "inspect", "inspect")
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v22 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u23 = v22.Players
local u24 = v22.RunService
local u25 = v22.StarterPlayer
local u26 = v22.Workspace
local u27 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u28 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u29 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "components", "circle-countdown-announcement").CircleCountdownAnnouncement
local u30 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "shop-component").default
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u37 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u38 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "infected", "infected-constants").InfectedConstants
local u39 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "infected", "infected-team-id").InfectedTeamId
local u40 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "infected", "infected-variant-type").InfectedVariantType
local u41 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u42 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u43 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u44 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "logger-provider").LoggerProvider
local u45 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u46 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u47 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u48 = v1.import(script, script.Parent.Parent, "halloween-event", "ambient", "halloween-event-environment").HalloweenEventEnvironment
local u49 = v1.import(script, script.Parent, "ui", "infected-class-selection").InfectedClassSelection
local u50 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 56 ]]
        return "InfectionController"
    end,
    ["__index"] = u28
})
u50.__index = u50
function u50.new(...) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u50
    --]]
    local v51 = u50
    local v52 = setmetatable({}, v51)
    return v52:constructor(...) or v52
end
function u50.constructor(p53) --[[ Line: 66 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u36
        [3] = u20
        [4] = u44
    --]]
    u28.constructor(p53, { u36.INFECTED })
    p53.Name = "InfectionController"
    p53.boostMaid = u20.new()
    p53.abilityMaid = u20.new()
    p53.isInfectedClassSelectSetup = false
    p53.infectedSpawns = {}
    p53.logger = u44.getLogger("InfectedController")
end
function u50.KnitStart(p54) --[[ Line: 75 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    u28.KnitStart(p54)
end
function u50.onGameInit(u55) --[[ Line: 78 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u6
        [3] = u29
        [4] = u46
        [5] = u13
        [6] = u5
        [7] = u33
        [8] = u32
        [9] = u23
        [10] = u19
        [11] = u27
        [12] = u31
        [13] = u17
        [14] = u37
        [15] = u39
        [16] = u38
    --]]
    u55:setupEnvironment()
    u55:setupBaseIndicators()
    u55:setupNameTags()
    u55:setupDeathMarkers()
    u55:setupHumanRevealInterval()
    u2.resolveDependency("@easy-games/game-core:client/controllers/announcement/announcement-controller@AnnouncementController"):setDefaultUI(u6.countdown.type, u29)
    u46.Client:OnEvent("DisruptorPlayEffects", function(p56) --[[ Line: 86 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u5
            [3] = u33
            [4] = u32
        --]]
        u13:playSound(p56.playSound, {
            ["volumeMultiplier"] = 0.5,
            ["position"] = p56.targetPosition
        })
        if p56.player then
            u5:playAnimation(p56.player, u33:getAssetId(u32.KICKER_STOMP))
        end
    end)
    u46.Client:WaitFor("GetInfectedSpawns"):andThen(function(p57) --[[ Line: 95 ]]
        return p57:CallServerAsync()
    end):andThen(function(p58) --[[ Line: 97 ]]
        --[[
        Upvalues:
            [1] = u55
        --]]
        u55.infectedSpawns = p58
    end):catch(function(p59) --[[ Line: 99 ]]
        --[[
        Upvalues:
            [1] = u55
            [2] = u23
            [3] = u19
        --]]
        u55.logger:Error("Local player {userId} failed to retrieve infected spawn locations with error reason: {err}", u23.LocalPlayer.UserId, u19(p59))
    end)
    u27.AbilityUsed:connect(function(p60) --[[ Line: 102 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u31
            [3] = u17
            [4] = u37
            [5] = u55
            [6] = u39
            [7] = u38
        --]]
        if p60.userCharacter ~= u23.LocalPlayer.Character then
            return nil
        end
        if p60:isCancelled() then
            return nil
        end
        if p60.ability == u31.CAT_POUNCE then
            if u17.Controllers.KitController:isUsingKit(u23.LocalPlayer, u37.INFECTED_RUSH) then
                u55:pounce()
                return nil
            end
        elseif p60.ability == u31.PROWLER_MARK and u17.Controllers.KitController:isUsingKit(u23.LocalPlayer, u37.INFECTED_PROWLER) then
            u17.Controllers.HuntersEchoController:playHawkeyeEffect(p60.userCharacter:GetPivot().Position, {
                ["expansionDurationSec"] = 0.5,
                ["myTeamId"] = u39.INFECTED,
                ["maxSize"] = u38.MARKED_PLAYER_RANGE,
                ["revealDuration"] = u38.MARKED_PLAYER_DURATION
            })
        end
    end)
end
function u50.setupHumanRevealInterval(_) --[[ Line: 125 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u24
        [3] = u30
        [4] = u26
        [5] = u17
        [6] = u42
        [7] = u43
        [8] = u39
        [9] = u45
        [10] = u27
    --]]
    local u61 = u18.Controllers.MapController:getCFrame("center"):expect()
    if not u61 then
        return nil
    end
    local u62 = false
    local function u75() --[[ Line: 132 ]]
        --[[
        Upvalues:
            [1] = u62
            [2] = u24
            [3] = u30
            [4] = u26
            [5] = u17
            [6] = u42
            [7] = u43
            [8] = u18
            [9] = u61
            [10] = u39
        --]]
        u62 = true
        local u63 = u24:IsStudio() and 15 or 45
        local v64 = u24:IsStudio() and 30 or 300
        local u65 = u30:getState().Game.startTime
        local v66 = u26:GetServerTimeNow() - u65
        local v67
        if v66 < v64 then
            v67 = v64 - v66
        else
            v67 = u63 - (v66 - v64) % u63
        end
        local v68 = u17.Controllers.MatchEventController
        local v69 = {
            ["id"] = "InfectedHumanReveal"
        }
        local v70 = u42(u43.HUNTERS_ECHO).image
        v69.image = v70 == nil and "rbxassetid://14978481226" or v70
        v69.name = "Reveal Humans"
        v69.time = u26:GetServerTimeNow() + v67
        v69.isOnTopHud = {
            ["shouldDisplay"] = true
        }
        v68:addMatchEventCountdown(v69)
        task.delay(v64, function() --[[ Line: 156 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u65
                [3] = u63
                [4] = u18
                [5] = u61
                [6] = u39
                [7] = u17
                [8] = u42
                [9] = u43
                [10] = u62
            --]]
            while true do
                if u26:GetServerTimeNow() - u65 >= 540 then
                    u63 = 20
                end
                u18.Controllers.HuntersEchoController:playHawkeyeEffect(u61.Position, {
                    ["maxSize"] = 700,
                    ["myTeamId"] = u39.INFECTED
                })
                local v71 = u17.Controllers.MatchEventController
                local v72 = {
                    ["id"] = "InfectedHumanReveal"
                }
                local v73 = u42(u43.HUNTERS_ECHO).image
                v72.image = v73 == nil and "rbxassetid://14978481226" or v73
                v72.name = "Reveal Humans"
                v72.time = u26:GetServerTimeNow() + u63
                v72.isOnTopHud = {
                    ["shouldDisplay"] = true
                }
                v71:addMatchEventCountdown(v72)
                local v74 = u62
                if v74 then
                    v74 = task.wait(u63)
                end
                if v74 == 0 or (v74 ~= v74 or not v74) then
                    return
                end
            end
        end)
    end
    if u30:getState().Game.matchState == u45.RUNNING then
        u75()
    end
    u27.MatchStateChange:connect(function(p76) --[[ Line: 194 ]]
        --[[
        Upvalues:
            [1] = u62
            [2] = u45
            [3] = u75
        --]]
        if u62 or p76.matchState ~= u45.RUNNING then
            if p76.matchState == u45.POST then
                u62 = false
            end
        else
            u75()
        end
    end)
end
function u50.setupEnvironment(_) --[[ Line: 202 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u48
        [3] = u13
        [4] = u47
    --]]
    u17.Controllers.EnvironmentController:setupEnvironment(u48)
    u13:playSound(u47.GRAVEYARD_AMBIENCE_LOOP, {
        ["looped"] = true
    })
    u17.Controllers.BackgroundMusicController:startMusic(u47.INFECTED_HALLOWEEN_MUSIC)
end
function u50.setupBaseIndicators(_) --[[ Line: 209 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u7
        [3] = u34
        [4] = u2
        [5] = u11
        [6] = u41
        [7] = u10
        [8] = u8
        [9] = u30
        [10] = u45
        [11] = u26
        [12] = u27
    --]]
    local function u86(u77) --[[ Line: 210 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u7
            [3] = u34
            [4] = u2
            [5] = u11
            [6] = u41
            [7] = u10
            [8] = u8
        --]]
        local u78 = u20.new()
        local v79 = u7:getAllComponents(u34)
        local function v83(p80) --[[ Line: 213 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u11
                [3] = u41
                [4] = u10
                [5] = u77
                [6] = u8
                [7] = u78
            --]]
            local v81 = u2.resolveDependency("@easy-games/game-core:client/controllers/indicators/world-indicator-controller@WorldIndicatorController")
            local v82 = {
                ["uiType"] = u11.Icon,
                ["uiConfig"] = {
                    ["distanceRelativeToPlayer"] = true,
                    ["scaleWithAlpha"] = true,
                    ["scaleOnFade"] = false,
                    ["icon"] = u41.BED_RED_RENDER,
                    ["transparency"] = u10:combine(u10:fadeOutDistance(75, 125, 0, 0.5), u10:fadeOverTime(u77 - 2, 2))
                },
                ["attachTo"] = p80.instance.Position,
                ["constraintType"] = u8.Constrained
            }
            u78:GiveTask((v81:addIndicator(v82)))
        end
        for v84, v85 in v79 do
            v83(v85, v84 - 1, v79)
        end
        task.delay(u77, function() --[[ Line: 231 ]]
            --[[
            Upvalues:
                [1] = u78
            --]]
            u78:DoCleaning()
        end)
        return u78
    end
    if u30:getState().Game.matchState == u45.RUNNING then
        u86(u30:getState().Game.startTime + 45 - u26:GetServerTimeNow())
    else
        u27.MatchStateChange:connect(function(p87) --[[ Line: 244 ]]
            --[[
            Upvalues:
                [1] = u45
                [2] = u86
            --]]
            if p87.matchState == u45.RUNNING then
                u86(45)
            end
        end)
    end
end
function u50.setupNameTags(u88) --[[ Line: 251 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u23
        [3] = u39
        [4] = u15
    --]]
    u14(function(p89, _) --[[ Line: 253 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u39
            [3] = u88
        --]]
        if p89 == u23.LocalPlayer then
            local v90 = p89:GetAttribute("Team")
            local u91 = p89:GetAttribute("InfectedVariantType")
            if v90 == u39.INFECTED then
                task.delay(0.5, function() --[[ Line: 258 ]]
                    --[[
                    Upvalues:
                        [1] = u88
                        [2] = u91
                    --]]
                    u88:applyInfectedBoosts(u91)
                end)
                u88:applyAbilities(u91)
                if not u88.isInfectedClassSelectSetup then
                    u88:setupInfectedClassSelect()
                    return
                end
            end
        else
            u88:checkHideNameTag(p89)
        end
    end)
    u15(function(u92, p93) --[[ Line: 271 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u88
        --]]
        p93:GiveTask(u92:GetAttributeChangedSignal("Team"):Connect(function(_) --[[ Line: 272 ]]
            --[[
            Upvalues:
                [1] = u92
                [2] = u23
                [3] = u88
            --]]
            if u92 == u23.LocalPlayer then
                for v94, v95 in u23:GetPlayers() do
                    local _ = v94 - 1
                    u88:checkHideNameTag(v95)
                end
            else
                u88:checkHideNameTag(u92)
            end
        end))
    end)
end
function u50.setupDeathMarkers(_) --[[ Line: 289 ]]
    --[[
    Upvalues:
        [1] = u46
        [2] = u35
        [3] = u18
        [4] = u23
        [5] = u2
        [6] = u11
        [7] = u41
        [8] = u10
        [9] = u8
    --]]
    u46.Client:Get("EntityDeathEvent"):Connect(function(p96) --[[ Line: 291 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u18
            [3] = u23
            [4] = u2
            [5] = u11
            [6] = u41
            [7] = u10
            [8] = u8
        --]]
        local v97 = u35:getEntity(p96.entityInstance)
        if v97 ~= nil then
            v97 = v97:getPlayer()
        end
        if not v97 then
            return nil
        end
        local v98 = p96.teamIdBefore
        local v99
        if v98 == "" or not v98 then
            v99 = u18.Controllers.TeamController:getPlayerTeam(v97)
        else
            v99 = u18.Controllers.TeamController:getTeamById(p96.teamIdBefore)
        end
        local v100 = u18.Controllers.TeamController:getPlayerTeam(u23.LocalPlayer)
        if v99 ~= v100 then
            return nil
        end
        local v101 = u2.resolveDependency("@easy-games/game-core:client/controllers/indicators/world-indicator-controller@WorldIndicatorController")
        local v102 = {
            ["uiType"] = u11.Icon
        }
        local v103 = {
            ["icon"] = u41.SKULL_VECTOR_ICON
        }
        if v100 ~= nil then
            v100 = v100.color
        end
        v103.color3 = v100
        v103.transparency = u10:combine(u10:fadeOutDistance(75, 125, 0, 0.5), u10:fadeOverTime(4, 1))
        v103.distanceRelativeToPlayer = true
        v103.scaleWithAlpha = true
        v103.scaleOnFade = false
        v102.uiConfig = v103
        v102.attachTo = p96.cframe.Position
        v102.constraintType = u8.Constrained
        local u104 = v101:addIndicator(v102)
        task.delay(6, function() --[[ Line: 329 ]]
            --[[
            Upvalues:
                [1] = u104
            --]]
            u104:destroy()
        end)
    end)
end
function u50.checkHideNameTag(_, p105) --[[ Line: 334 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u35
    --]]
    local v106 = p105.Team ~= u23.LocalPlayer.Team and u35:getEntity(p105)
    if v106 then
        v106:hideNametag()
    end
end
function u50.leap(_, p107, p108) --[[ Line: 342 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u25
        [3] = u13
        [4] = u12
        [5] = u47
        [6] = u17
        [7] = u32
    --]]
    local v109 = CFrame
    local v110 = p107.HumanoidRootPart.Position
    local v111 = p107.HumanoidRootPart.Position
    p107.HumanoidRootPart.CFrame = v109.lookAt(v110, v111 + p108 * Vector3.new(1, 0, 1))
    p107.Humanoid.JumpHeight = 0.5
    p107.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    local v112 = p107.HumanoidRootPart
    local v113 = p108.Unit
    local v114 = p107.PrimaryPart
    if v114 ~= nil then
        v114 = v114.AssemblyMass
    end
    local v115 = v114 == nil and 1 or v114
    v112:ApplyImpulse(v113 * Vector3.new(1, 0, 1) * v115 * 70)
    u18.Controllers.JumpHeightController:setJumpHeight(u25.CharacterJumpHeight)
    local v116 = u13
    local v117 = u12.fromList
    local v118 = { u47.CAT_POUNCE_1, u47.CAT_POUNCE_2, u47.CAT_POUNCE_3 }
    v116:playSound(v117(unpack(v118)), {
        ["position"] = p107.HumanoidRootPart.Position
    })
    u17.Controllers.ViewmodelController:playAnimation(u32.DAGGER_CHARGE)
end
function u50.pounce(p119) --[[ Line: 369 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u26
        [3] = u17
        [4] = u32
    --]]
    local v120 = u23.LocalPlayer.Character
    local v121 = u26.CurrentCamera.CFrame.LookVector
    if not v120 then
        return nil
    end
    p119:leap(v120, v121)
    u17.Controllers.ViewmodelController:playAnimation(u32.FP_USE_ITEM)
end
function u50.applyAbilities(p122, p123) --[[ Line: 378 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u40
        [3] = u17
        [4] = u31
        [5] = u41
        [6] = u26
    --]]
    for _, v124 in u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbilities() do
        v124.maid:DoCleaning()
    end
    p122.abilityMaid:DoCleaning()
    if p123 == u40.TANK then
        p122.abilityMaid:GiveTask(u17.Controllers.FootstepsController.footstepModifier:addModifier({
            ["localVolumeMultiplier"] = 3
        }))
    end
    if p123 == u40.RUSH then
        local v125 = p122.abilityMaid
        local v126 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v127 = u31.CAT_POUNCE
        local v128 = {
            ["abilityType"] = "KitPrimary",
            ["abilityButton"] = {
                ["icon"] = u41.CAT_POUNCE
            },
            ["getExtraData"] = function() --[[ Name: getExtraData, Line 401 ]]
                --[[
                Upvalues:
                    [1] = u26
                --]]
                return {
                    ["direction"] = u26.CurrentCamera.CFrame.LookVector
                }
            end
        }
        v125:GiveTask(v126:enableAbility(v127, v128):expect())
        p122.abilityMaid:GiveTask(u17.Controllers.FootstepsController.footstepModifier:addModifier({
            ["localVolumeMultiplier"] = 0.25
        }))
    end
    if p123 == u40.DISRUPTOR then
        local v129 = p122.abilityMaid
        local v130 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v131 = u31.DISRUPTOR_EXPLOSION_EMP
        local v132 = {
            ["abilityType"] = "KitPrimary",
            ["abilityButton"] = {
                ["icon"] = u41.DISRUPTOR_EMP
            }
        }
        v129:GiveTask(v130:enableAbility(v131, v132):expect())
    end
    if p123 == u40.PROWLER then
        local v133 = p122.abilityMaid
        local v134 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v135 = u31.PROWLER_MARK
        local v136 = {
            ["abilityType"] = "KitPrimary",
            ["abilityButton"] = {
                ["icon"] = u41.BOUNTY_HUNTER_MARKER
            }
        }
        v133:GiveTask(v134:enableAbility(v135, v136):expect())
    end
end
function u50.applyInfectedBoosts(p137, p138) --[[ Line: 430 ]]
    --[[
    Upvalues:
        [1] = u40
        [2] = u18
    --]]
    p137.boostMaid:DoCleaning()
    local v139 = p138 == u40.TANK and 0.95 or (p138 == u40.RUSH and 1.25 or ((p138 == u40.DISRUPTOR or false or p138 == u40.PROWLER) and 1 or 0))
    p137.boostMaid:GiveTask(u18.Controllers.JumpHeightController:getJumpModifier():addModifier({
        ["airJumps"] = 1,
        ["jumpHeightMultiplier"] = 1.4
    }))
    p137.boostMaid:GiveTask(u18.Controllers.SprintController:getMovementStatusModifier():addModifier({
        ["moveSpeedMultiplier"] = v139
    }))
end
function u50.setupInfectedClassSelect(u140) --[[ Line: 459 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u23
        [3] = u38
        [4] = u2
    --]]
    u140.isInfectedClassSelectSetup = true
    u24.Heartbeat:Connect(function() --[[ Line: 462 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u140
            [3] = u38
            [4] = u2
        --]]
        local v141 = u23.LocalPlayer.Character
        if not v141 then
            return nil
        end
        local v142 = v141:GetPivot().Position
        local v143 = false
        for v144, v145 in u140.infectedSpawns do
            local _ = v144 - 1
            if (v142 - v145.Position).Magnitude <= u38.CLASS_SELECT_SPAWN_RADIUS then
                v143 = true
                break
            end
        end
        if v143 then
            if not u140.actionButton then
                u140:enableClassSelectButton()
            end
        else
            local v146 = u140.actionButton
            if v146 ~= nil then
                v146:DoCleaning()
            end
            u140.actionButton = nil
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("InfectedClassSelection")
        end
    end)
end
function u50.enableClassSelectButton(p147) --[[ Line: 497 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u21
        [3] = u4
        [4] = u9
        [5] = u49
    --]]
    p147.actionButton = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u21.createElement(u4, {
        ["actionName"] = "ClassSelectToggle",
        ["text"] = "Change Class",
        ["interactionKey"] = Enum.KeyCode.B,
        ["gamepadInteractionKey"] = u9.CloseMenu,
        ["onActivated"] = function() --[[ Name: onActivated, Line 502 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u49
            --]]
            local v148 = {
                ["appId"] = "InfectedClassSelection",
                ["app"] = u49
            }
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v148, {})
        end
    }))
end
u17.CreateController(u50.new())
return nil