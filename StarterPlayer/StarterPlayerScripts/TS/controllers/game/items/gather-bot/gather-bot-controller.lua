local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.SoundManager
local u5 = v3.WatchCollectionTag
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "electric-arc", "lib")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.CollectionService
local u15 = v13.Players
local u16 = v13.ReplicatedStorage
local u17 = v13.RunService
local u18 = v13.Workspace
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "steam-engineer", "gather-bot-constants").GatherBotBalance
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u28 = v1.import(script, script.Parent.Parent.Parent, "stateful-entity", "ui", "stateful-entity-hp-bar-billboard").StatefulEntityHpBarBillboard
local u29 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 34 ]]
        return "GatherBotBasicController"
    end,
    ["__index"] = u19
})
u29.__index = u29
function u29.new(...) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u29
    --]]
    local v30 = u29
    local v31 = setmetatable({}, v30)
    return v31:constructor(...) or v31
end
function u29.constructor(p32) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    u19.constructor(p32)
    p32.Name = "GatherBotBasicController"
    p32.gatherBotMap = {}
    p32.gatherBotOverclockTargets = {}
    p32.lastEffectReconcileTime = {}
    p32.colorChangeConnections = {}
    p32.HP_BAR_OFFSET = Vector3.new(0, 2, 0)
end
function u29.KnitStart(u33) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u24
        [3] = u23
        [4] = u4
        [5] = u25
        [6] = u5
        [7] = u8
        [8] = u20
        [9] = u15
        [10] = u12
        [11] = u16
        [12] = u18
        [13] = u27
        [14] = u26
        [15] = u22
        [16] = u14
        [17] = u2
    --]]
    u19.KnitStart(u33)
    u24.Client:OnEvent("EntityDeathEvent", function(p34) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u4
            [3] = u25
        --]]
        if p34.entityInstance:GetAttribute("MonsterType") ~= u23.GATHER_BOT then
            return nil
        end
        u4:playSound(u25.GATHER_BOT_DEATH, {
            ["position"] = p34.entityInstance:GetPivot().Position
        })
    end)
    u5("Monster", function(u35) --[[ Line: 64 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u8
            [3] = u25
        --]]
        if u35:GetAttribute("MonsterType") == u23.GATHER_BOT then
            task.spawn(function() --[[ Line: 66 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u35
                    [3] = u25
                --]]
                u8.Controllers.FootstepsController:hookCharacter(nil, u35, {
                    ["walk"] = { u25.GATHER_BOT_MOVING },
                    ["run"] = { u25.GATHER_BOT_MOVING }
                })
            end)
        end
    end)
    u20.On(function(p36, _, _, _, _, _, _, _, _, _, _, _, _, _) --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u15
            [3] = u12
        --]]
        if p36:GetAttribute("MonsterType") ~= u23.GATHER_BOT then
            return nil
        end
        if u15:GetPlayerByUserId(p36:GetAttribute("PlacedByUserId")) == u15.LocalPlayer then
            local v37 = p36:FindFirstChild("GatherBotHighlight")
            if v37 then
                v37:Destroy()
            end
            u12("Highlight", {
                ["Name"] = "GatherBotHighlight",
                ["FillTransparency"] = 0.7,
                ["OutlineTransparency"] = 0.2,
                ["FillColor"] = Color3.fromRGB(255, 61, 0),
                ["OutlineColor"] = Color3.fromRGB(255, 0, 0),
                ["Parent"] = p36,
                ["DepthMode"] = Enum.HighlightDepthMode.AlwaysOnTop
            }).Enabled = true
        end
    end)
    u24.Client:OnEvent("GatherBotOverclockTargetsChanged", function(p38) --[[ Line: 96 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        local v39 = u33
        local v40 = p38.gatherBot
        local v41 = {}
        for _, v42 in p38.targets do
            v41[v42] = true
        end
        v39:reconcileEffects(v40, v41)
    end)
    u24.Client:OnEvent("GatherBotAddProximityPrompt", function(u43) --[[ Line: 105 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u24
            [3] = u15
        --]]
        local v44 = u43.gatherBot:GetAttribute("GatherBotIsPro")
        local u45 = u8.Controllers.ProximityPromptController:createProximityPrompt({
            ["Name"] = "CollectPrompt",
            ["HoldDuration"] = 0,
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 10,
            ["ActionText"] = "Collect",
            ["ObjectText"] = (v44 == 0 or (v44 ~= v44 or (v44 == "" or not v44))) and "Diamond" or "Emerald",
            ["Parent"] = u43.gatherBot
        })
        u45.Triggered:Connect(function(_) --[[ Line: 116 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u15
                [3] = u43
                [4] = u45
            --]]
            u24.Client:Get("GatherBotCollectItems"):SendToServer({
                ["player"] = u15.LocalPlayer,
                ["gatherBot"] = u43.gatherBot
            })
            u45:Destroy()
        end)
    end)
    u24.Client:OnEvent("GatherBotRemoveProximityPrompt", function(p46) --[[ Line: 124 ]]
        local v47 = p46.gatherBot:FindFirstChild("CollectPrompt")
        if v47 ~= nil then
            v47:Destroy()
        end
    end)
    u24.Client:OnEvent("GatherBotDangerDetected", function(p48) --[[ Line: 130 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        local v49 = p48.gatherBot:GetAttribute("HasHighlight")
        if v49 == nil or v49 == false then
            u12("Highlight", {
                ["Name"] = "GatherBotHighlight",
                ["FillTransparency"] = 0.7,
                ["OutlineTransparency"] = 0.2,
                ["FillColor"] = Color3.fromRGB(255, 61, 0),
                ["OutlineColor"] = Color3.fromRGB(255, 0, 0),
                ["Parent"] = p48.gatherBot,
                ["DepthMode"] = Enum.HighlightDepthMode.AlwaysOnTop
            }).Enabled = true
            p48.gatherBot:SetAttribute("HasHighlight", true)
        end
    end)
    u24.Client:OnEvent("GatherBotDangerAverted", function(p50) --[[ Line: 146 ]]
        local v51 = p50.gatherBot:FindFirstChild("GatherBotHighlight")
        if v51 then
            p50.gatherBot:SetAttribute("HasHighlight", false)
            v51:Destroy()
        end
    end)
    u24.Client:OnEvent("SteamEngineerPlayOverclockEffect", function(u52) --[[ Line: 153 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u18
            [3] = u27
            [4] = u26
            [5] = u22
            [6] = u4
            [7] = u25
            [8] = u33
        --]]
        task.spawn(function() --[[ Line: 154 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u18
                [3] = u52
                [4] = u27
                [5] = u26
                [6] = u22
                [7] = u4
                [8] = u25
                [9] = u33
            --]]
            local u53 = u16.Assets.Effects.GatherBotOverclockEffect:Clone()
            u53.Parent = u18
            u53.Massless = true
            u53.CFrame = u52.gatherBot:GetPivot()
            u27:weldParts(u52.gatherBot.HumanoidRootPart, u53)
            local v54 = u26
            local v55 = {}
            local v56 = #v55
            local v57 = u53:GetDescendants()
            table.move(v57, 1, #v57, v56 + 1, v55)
            v54:playEffects(v55, u52.gatherBot, {
                ["destroyAfterSec"] = u22.GATHER_BOT_OVERCLOCK_DURATION
            })
            u4:playSound(u25.GATHER_BOT_OVERCLOCK, {
                ["position"] = u52.gatherBot:GetPivot().Position
            })
            u33:changeGatherBotEyeColor(u52.gatherBot, Color3.fromRGB(255, 0, 0))
            task.delay(u22.GATHER_BOT_OVERCLOCK_DURATION, function() --[[ Line: 172 ]]
                --[[
                Upvalues:
                    [1] = u33
                    [2] = u52
                    [3] = u53
                --]]
                u33:changeGatherBotEyeColor(u52.gatherBot, Color3.fromRGB(246, 255, 122))
                u53:Destroy()
            end)
        end)
    end)
    u14:GetInstanceAddedSignal("Monster"):Connect(function(p58) --[[ Line: 178 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u33
        --]]
        if p58:GetAttribute("MonsterType") == u23.GATHER_BOT then
            if p58:GetAttribute("GatherBotIsPro") == true then
                u33:createGatherBotHealthbar(p58, true)
            else
                u33:createGatherBotHealthbar(p58, false)
            end
            u33.gatherBotMap[p58] = true
        end
    end)
    u14:GetInstanceRemovedSignal("Monster"):Connect(function(p59) --[[ Line: 190 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u33
            [3] = u2
        --]]
        if p59:GetAttribute("MonsterType") == u23.GATHER_BOT then
            local v60 = u33.gatherBotOverclockTargets[p59]
            if v60 == nil then
                return nil
            end
            for _, v61 in v60 do
                v61:DoCleaning()
            end
            u33.gatherBotMap[p59] = nil
            u33.gatherBotOverclockTargets[p59] = nil
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("StatefulEntityHpBarBillboard_" .. tostring(p59:GetAttribute("UUID")))
        end
    end)
end
function u29.reconcileEffects(u62, u63, p64) --[[ Line: 206 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local u65 = os.clock()
    u62.lastEffectReconcileTime[u63] = u65
    local v66 = u62.gatherBotOverclockTargets[u63]
    local v67 = v66 == nil and {} or v66
    for v68, v69 in v67 do
        if p64[v68] == nil then
            v69:DoCleaning()
            v67[v68] = nil
        end
    end
    local v70 = u9.copy(v67)
    for v71 in p64 do
        if v67[v71] == nil then
            local v72 = v71.PrimaryPart
            if v72 ~= nil then
                v72 = (v72.Position - u63:GetPivot().Position).Magnitude
            end
            if (v72 == nil and 100 or v72) <= 18 and u62.gatherBotMap[u63] ~= nil then
                v70[v71] = u62:createOverclockEffect(u63, v71)
            end
        end
    end
    u62.gatherBotOverclockTargets[u63] = v70
    task.delay(1, function() --[[ Line: 252 ]]
        --[[
        Upvalues:
            [1] = u62
            [2] = u63
            [3] = u65
        --]]
        if u62.lastEffectReconcileTime[u63] == u65 then
            u62:reconcileEffects(u63, {})
        end
    end)
end
function u29.createOverclockEffect(_, p73, p74) --[[ Line: 260 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u21
        [3] = u10
        [4] = u11
        [5] = u4
        [6] = u25
    --]]
    local v75 = p74:FindFirstChild("UpperTorso"):FindFirstChild("BodyFrontAttachment")
    if not v75 then
        error("Could not find targetAttachment")
    end
    local v76 = p73:FindFirstChild("UpperTorso"):FindFirstChild("BodyFrontAttachment")
    if not v76 then
        error("Could not find gatherBotAttachment")
    end
    local v77 = u15:GetPlayerByUserId((p73:GetAttribute("PlacedByUserId")))
    if v77 == nil then
        error("No owner")
    end
    local v78 = nil
    for v79, v80 in u21:getState().Game.teams do
        local _ = v79 - 1
        local v81 = v80.name
        local v82 = v77.Team
        if v82 ~= nil then
            v82 = v82.Name
        end
        if v81 == v82 == true then
            v78 = v80
            break
        end
    end
    local v83 = u10.link
    local v84
    if v78 then
        v84 = v78.color
    else
        v84 = Color3.fromRGB(0, 0, 0)
    end
    local u85 = v83(v75, v76, v84)
    local v86 = u11.new()
    v86:GiveTask(function() --[[ Line: 295 ]]
        --[[
        Upvalues:
            [1] = u85
        --]]
        u85:Destroy()
    end)
    local v87 = p74 == u15.LocalPlayer.Character
    local v88 = u4
    local v89 = u25.TESLA_ZAP
    local v90 = {
        ["looped"] = true
    }
    local v91
    if v87 then
        v91 = nil
    else
        v91 = p73:GetPivot().Position
    end
    v90.position = v91
    local u92 = v88:playSound(v89, v90)
    if u92 then
        v86:GiveTask(function() --[[ Line: 304 ]]
            --[[
            Upvalues:
                [1] = u92
            --]]
            local v93 = u92
            if v93 ~= nil then
                v93:Stop()
            end
        end)
    end
    return v86
end
function u29.createGatherBotHealthbar(p94, p95, p96) --[[ Line: 313 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u28
    --]]
    local v97
    if p96 then
        v97 = UDim2.fromScale(3.5, 0.35)
    else
        v97 = UDim2.fromScale(3, 0.35)
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        ["app"] = u28,
        ["appId"] = "StatefulEntityHpBarBillboard_" .. tostring(p95:GetAttribute("UUID"))
    }, {
        ["gameEntity"] = p95,
        ["serverInstance"] = p95,
        ["hpBarOffset"] = p94.HP_BAR_OFFSET,
        ["size"] = v97
    }, nil, p95)
end
function u29.changeGatherBotEyeColor(u98, u99, u100) --[[ Line: 330 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local u101 = u99:FindFirstChild("Eye")
    if u101 then
        local v102 = u98.colorChangeConnections[u99]
        if v102 then
            v102:Disconnect()
            u98.colorChangeConnections[u99] = nil
        end
        local u103 = u101.Color
        local u104 = 0
        local u105 = nil
        u105 = u17.Heartbeat:Connect(function(p106) --[[ Line: 348 ]]
            --[[
            Upvalues:
                [1] = u104
                [2] = u101
                [3] = u103
                [4] = u100
                [5] = u105
                [6] = u98
                [7] = u99
            --]]
            u104 = u104 + p106
            u101.Color = u103:Lerp(u100, u104 / 0.5)
            if u104 >= 0.5 then
                u105:Disconnect()
                u101.Color = u100
                u98.colorChangeConnections[u99] = nil
            end
        end)
        u98.colorChangeConnections[u99] = u105
    end
end
v7.CreateController(u29.new())
return nil