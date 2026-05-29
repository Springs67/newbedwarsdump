local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.GameQueryUtil
local u5 = v3.SoundManager
local u6 = v3.TimedProgressBar
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InElastic
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.Players
local u16 = v14.ReplicatedStorage
local u17 = v14.Workspace
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "wormhole", "wormhole-util").WormholeUtil
local u33 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 38 ]]
        return "WormholeController"
    end,
    ["__index"] = u20
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
        [1] = u20
        [2] = u12
    --]]
    u20.constructor(p36)
    p36.Name = "WormholeController"
    p36.wormholeChannelMaid = {}
    p36.buttonMaid = u12.new()
    p36.assetsPreloaded = false
    p36.recallingDisabled = false
    p36.wormholeItemEnabled = false
end
function u33.KnitStart(u37) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u9
        [3] = u26
        [4] = u19
        [5] = u10
        [6] = u29
    --]]
    u20.KnitStart(u37)
    local v38, v39 = u9.Controllers.MatchController:getQueueTypeAsync():await()
    local v40
    if v38 then
        v40 = u26(v39)
    else
        v40 = nil
    end
    if v38 then
        local v41
        if v40 == nil then
            v41 = v40
        else
            v41 = v40.disableRecalling
        end
        u37.recallingDisabled = v41 and true or false
        if v40 ~= nil then
            v40 = v40.enableWormholeItem
        end
        u37.wormholeItemEnabled = v40 and true or false
    end
    local v42 = u9.Controllers.MatchController:getCustomMatchConfig() == nil
    if u37.recallingDisabled and (v42 and not u37.wormholeItemEnabled) then
        return nil
    end
    u37:setupRemotes()
    u37:setupWormholeAbility()
    u19.OwlNewTarget:setPriority(u10.HIGHEST):connect(function(p43) --[[ Line: 80 ]]
        --[[
        Upvalues:
            [1] = u37
        --]]
        if p43.target then
            u37:disableWormHoleAbility()
        else
            u37:enableWormholeAbility()
        end
    end)
    u29.Client:OnEvent("MatchEndEvent", function(_) --[[ Line: 87 ]]
        --[[
        Upvalues:
            [1] = u37
        --]]
        u37:disableWormHoleAbility()
    end)
end
function u33.playWormholeEffect(_, p44, p45) --[[ Line: 91 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u17
        [3] = u31
    --]]
    local v46 = u16.Assets.Effects.WormholeTeleport:Clone()
    v46.CFrame = p44
    v46.Parent = u17
    u31:playEffects({ v46 }, p45, {
        ["destroyAfterSec"] = 1
    })
end
function u33.enableWormholeAbility(p47) --[[ Line: 99 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u22
        [3] = u27
    --]]
    if not p47.wormholeItemEnabled then
        p47.buttonMaid:DoCleaning()
        local v48 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v49 = u22.RECALL
        local v50 = {
            ["abilityType"] = "Recall",
            ["abilityButton"] = {
                ["layoutOrder"] = -10000,
                ["icon"] = u27.HOME
            }
        }
        local u51 = v48:enableAbility(v49, v50):expect()
        p47.buttonMaid:GiveTask(function() --[[ Line: 109 ]]
            --[[
            Upvalues:
                [1] = u51
            --]]
            u51.Destroy()
        end)
    end
    p47.recallingDisabled = false
end
function u33.disableWormHoleAbility(p52) --[[ Line: 115 ]]
    p52.buttonMaid:DoCleaning()
    p52.recallingDisabled = true
end
function u33.setupRemotes(u53) --[[ Line: 119 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u12
        [3] = u15
        [4] = u2
        [5] = u13
        [6] = u6
        [7] = u25
        [8] = u32
        [9] = u30
        [10] = u5
        [11] = u24
        [12] = u23
        [13] = u4
        [14] = u17
        [15] = u31
        [16] = u18
        [17] = u11
    --]]
    u29.Client:OnEvent("WormholeChannel", function(p54, p55) --[[ Line: 120 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u15
            [3] = u2
            [4] = u13
            [5] = u6
            [6] = u25
            [7] = u32
            [8] = u30
            [9] = u5
            [10] = u24
            [11] = u23
            [12] = u4
            [13] = u17
            [14] = u31
            [15] = u18
            [16] = u11
            [17] = u53
        --]]
        local v56 = p54.Character
        if not v56 then
            return nil
        end
        local v57 = u12.new()
        if v56 == u15.LocalPlayer.Character then
            v57:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u13.createElement(u6, {
                ["HideOnComplete"] = true,
                ["Size"] = UDim2.fromScale(1, 0.05),
                ["EndTime"] = p55,
                ["ProgressBarConfig"] = {
                    ["Flip"] = true,
                    ["GradientRotation"] = 0,
                    ["Title"] = {
                        ["text"] = "Teleporting back to base..."
                    },
                    ["BarGradient"] = ColorSequence.new(Color3.fromRGB(255, 184, 28), Color3.fromRGB(255, 209, 112))
                }
            })))
        end
        local v58 = u25:getEntity(p54)
        if v58 ~= nil then
            v58 = v58:getInstance()
        end
        if not v58 then
            return nil
        end
        local v59 = u32.getWormholeLoopSound(v58)
        local v60 = v59 == u30.VOID_TITAN_RECALL_LOOP and true or v59 == u30.SPIRIT_TITAN_RECALL_LOOP
        local u61 = u5:playSound(v59, {
            ["looped"] = true,
            ["rollOffMaxDistance"] = 90,
            ["position"] = v56:GetPivot().Position,
            ["playbackSpeedMultiplier"] = v60 and 0.8 or 1
        })
        local u62 = u24:playAnimation(p54, u23.RIFT_REVIVE, {
            ["looped"] = true
        })
        local u63 = u32.getWormholeRecallEffect(v58):Clone()
        u63:PivotTo(v56:GetPivot() + Vector3.new(0, -2.8, 0))
        for v64, v65 in u63:GetDescendants() do
            local _ = v64 - 1
            if v65:IsA("BasePart") then
                u4:setQueryIgnored(v65, true)
                v65.CanCollide = false
                v65.Anchored = true
            end
        end
        u63.Parent = u17
        local v66 = u32
        local v67 = u25:getEntity(p54)
        if v67 ~= nil then
            v67 = v67:getInstance()
        end
        local v68 = v66.getWormholeChannelTime(v67)
        local v69 = u31
        local v70 = { u63 }
        local v71 = u25:getEntity(p54)
        if v71 ~= nil then
            v71 = v71:getInstance()
        end
        v69:playEffects(v70, v71, {
            ["destroyAfterSec"] = v68
        })
        local u72 = 0
        local u77 = u18(v68, u11, function(p73) --[[ Line: 198 ]]
            --[[
            Upvalues:
                [1] = u72
                [2] = u61
                [3] = u63
            --]]
            u72 = u72 + p73
            if u72 >= 0.1 then
                u72 = 0
                if u61 then
                    local v74 = u61
                    local v75 = u61:getInstance()
                    if v75 ~= nil then
                        v75 = v75.PlaybackSpeed
                    end
                    v74:setProperty("PlaybackSpeed", (v75 == nil and 1 or v75) + 0.04)
                end
                local v76 = u63.Pulse.Particle.PulseUp
                v76.Rate = v76.Rate + 0.05
            end
        end)
        task.delay(v68 - 1, function() --[[ Line: 217 ]] end)
        v57:GiveTask(function() --[[ Line: 221 ]]
            --[[
            Upvalues:
                [1] = u61
                [2] = u62
                [3] = u63
                [4] = u77
            --]]
            local v78 = u61
            if v78 ~= nil then
                v78:Stop()
            end
            local v79 = u61
            if v79 ~= nil then
                v79:Destroy()
            end
            local v80 = u62
            if v80 ~= nil then
                v80:Stop()
            end
            local v81 = u62
            if v81 ~= nil then
                v81:Destroy()
            end
            u63:Destroy()
            u77:Cancel()
        end)
        task.delay(v68, function() --[[ Line: 241 ]]
            --[[
            Upvalues:
                [1] = u61
                [2] = u62
                [3] = u63
                [4] = u77
            --]]
            local v82 = u61
            if v82 ~= nil then
                v82:Stop()
            end
            local v83 = u61
            if v83 ~= nil then
                v83:Destroy()
            end
            local v84 = u62
            if v84 ~= nil then
                v84:Stop()
            end
            local v85 = u62
            if v85 ~= nil then
                v85:Destroy()
            end
            u63:Destroy()
            u77:Cancel()
        end)
        u53.wormholeChannelMaid[p54.UserId] = v57
    end)
    u29.Client:OnEvent("WormholeChannelCancel", function(p86) --[[ Line: 265 ]]
        --[[
        Upvalues:
            [1] = u53
        --]]
        local v87 = u53.wormholeChannelMaid[p86.UserId]
        if v87 ~= nil then
            v87:DoCleaning()
        end
    end)
    u29.Client:OnEvent("WormholeUse", function(p88, p89, p90) --[[ Line: 274 ]]
        --[[
        Upvalues:
            [1] = u53
            [2] = u25
            [3] = u15
            [4] = u32
            [5] = u5
        --]]
        local v91 = p88.Character
        if not v91 then
            return nil
        end
        local v92 = u53.wormholeChannelMaid[p88.UserId]
        if v92 ~= nil then
            v92:DoCleaning()
        end
        local v93 = u25:getEntity(p88)
        if v93 ~= nil then
            v93 = v93:getInstance()
        end
        if not v93 then
            return nil
        end
        if v91 == u15.LocalPlayer.Character then
            u5:playSound((u32.getWormholeSound(v93)))
        else
            local v94 = u32.getWormholeSound(v93)
            u5:playSound(v94, {
                ["position"] = p89
            })
            u5:playSound(v94, {
                ["position"] = p90
            })
        end
        u53:playWormholeEffect(CFrame.new(p89), nil)
        local v95 = u53
        local v96 = CFrame.new(p90)
        local v97 = u25:getEntity(p88)
        if v97 ~= nil then
            v97 = v97:getInstance()
        end
        v95:playWormholeEffect(v96, v97)
    end)
end
function u33.setupWormholeAbility(u98) --[[ Line: 317 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u30
        [3] = u21
        [4] = u28
        [5] = u19
    --]]
    local v99 = game.Workspace:GetAttribute("RecallingDisabled")
    if v99 == 0 or (v99 ~= v99 or (v99 == "" or not v99)) then
        if not u98.assetsPreloaded then
            u8.Controllers.PreloadController:runPreload({
                ["sounds"] = {
                    u30.WORMHOLE_TELEPORT,
                    u30.SPIRIT_TITAN_RECALL,
                    u30.VOID_TITAN_RECALL,
                    u30.WORMHOLE_USE
                }
            })
            u98.assetsPreloaded = true
        end
        if u21:getState().Game.matchState == u28.RUNNING then
            u98:enableWormholeAbility()
        else
            local u100 = nil
            u100 = u19.MatchStateChange:connect(function(p101) --[[ Line: 333 ]]
                --[[
                Upvalues:
                    [1] = u28
                    [2] = u98
                    [3] = u100
                --]]
                if p101.matchState ~= u28.RUNNING then
                    return nil
                end
                u98:enableWormholeAbility()
                u100:Destroy()
            end)
        end
    else
        u98:disableWormHoleAbility()
    end
    game.Workspace:GetAttributeChangedSignal("RecallingDisabled"):Connect(function() --[[ Line: 343 ]]
        --[[
        Upvalues:
            [1] = u98
        --]]
        local v102 = game.Workspace:GetAttribute("RecallingDisabled")
        if v102 == 0 or (v102 ~= v102 or (v102 == "" or not v102)) then
            u98:enableWormholeAbility()
        else
            u98:disableWormHoleAbility()
        end
    end)
end
u8.CreateController(u33.new())
return nil