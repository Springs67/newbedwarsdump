local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DeviceUtil
local u6 = v3.SoundManager
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Players
local u13 = v11.TweenService
local u14 = v11.Workspace
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "team", "team-controller").TeamController
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u23 = v1.import(script, script.Parent, "bridge-duel-countdown-ui").BridgeDuelRoundCountdownGui
local u24 = v1.import(script, script.Parent, "bridge-duel-scores-ui").BridgeDuelScoresGui
local u25 = v1.import(script, script.Parent, "bridge-duel-touchdown-billboard-ui").BridgeDuelTouchdownBillboardUI
local u26 = v1.import(script, script.Parent, "bridge-duel-touchdown-popup-ui").BridgeDuelTouchdownPopupGui
local u27 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 32 ]]
        return "BridgeDuelUiController"
    end,
    ["__index"] = u17
})
u27.__index = u27
function u27.new(...) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    local v28 = u27
    local v29 = setmetatable({}, v28)
    return v29:constructor(...) or v29
end
function u27.constructor(p30) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17.constructor(p30)
    p30.Name = "BridgeDuelUiController"
end
function u27.KnitStart(u31) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u21
        [3] = u14
        [4] = u6
        [5] = u22
        [6] = u16
        [7] = u10
        [8] = u25
        [9] = u12
        [10] = u15
        [11] = u9
        [12] = u20
        [13] = u18
    --]]
    u17.KnitStart(u31)
    u21.Client:Get("BridgeDuelStartNewRoundCountdown"):Connect(function(p32) --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u31
            [3] = u6
            [4] = u22
        --]]
        local v33 = p32.endTime - u14:GetServerTimeNow()
        local v34 = os.time() + v33
        if v34 < os.time() then
            return nil
        end
        local v35 = p32.roundNumber
        if v35 == 1 then
            u31:showCountdownUI(v34, "MATCH WILL START IN")
        elseif v35 == 9 then
            u31:showCountdownUI(v34, "FINAL ROUND")
        elseif p32.matchPoint then
            u31:showCountdownUI(v34, "MATCH POINT")
        else
            u31:showCountdownUI(v34)
        end
        while os.time() < v34 do
            task.wait(0.1)
        end
        u31:hideCountdownUI()
        u6:playSound(u22.BRIDGE_DUEL_WHISTLE)
    end)
    u21.Client:Get("BridgeDuelOnTouchdownSpawn"):Connect(function(p36) --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u10
            [3] = u25
            [4] = u12
        --]]
        local v37 = p36.touchdownZone:GetAttribute("TouchdownZoneTeamID")
        if v37 == "" or not v37 then
            return nil
        end
        local v38 = u16:getTeamById(v37)
        if not v38 then
            return nil
        end
        u10.mount(u10.createElement("BillboardGui", {
            ["StudsOffsetWorldSpace"] = Vector3.new(0, 24, 0),
            ["ResetOnSpawn"] = false,
            ["MaxDistance"] = 200,
            ["Adornee"] = p36.touchdownZone,
            ["Size"] = UDim2.fromScale(7, 3.5)
        }, { u10.createElement(u25, {
                ["team"] = v38
            }) }), u12.LocalPlayer:WaitForChild("PlayerGui"), "BridgeDuelTouchdownBillboard")
    end)
    u21.Client:Get("BridgeDuelTouchdownEffects"):Connect(function(p39) --[[ Line: 106 ]]
        --[[
        Upvalues:
            [1] = u31
        --]]
        u31:showTouchdownPopup(p39.player, p39.color, p39.scores)
        task.delay(5, function() --[[ Line: 108 ]]
            --[[
            Upvalues:
                [1] = u31
            --]]
            u31:hideTouchdownPopup()
        end)
    end)
    u15.MatchStateChange:connect(function(p40) --[[ Line: 113 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u20
            [3] = u18
            [4] = u31
        --]]
        local v41 = u9.Controllers.MatchController:getQueueType()
        if p40.matchState == u20.RUNNING and v41 == u18.BRIDGE_DUEL then
            u31:showScoreHud()
        else
            u31:hideTouchdownPopup()
            u31:hideScoreHud()
        end
    end)
end
function u27.showScoreHud(_) --[[ Line: 123 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u24
    --]]
    if u5.isMobileControls() then
        local v42 = {
            ["appId"] = "BridgeDuelScoresGui",
            ["app"] = u24
        }
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v42, {})
    end
end
function u27.hideScoreHud(_) --[[ Line: 132 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("BridgeDuelScoresGui") then
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("BridgeDuelScoresGui")
    end
end
function u27.showCountdownUI(_, p43, p44) --[[ Line: 137 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u23
    --]]
    local v45 = {
        ["appId"] = "BridgeDuelRoundCountdownGui",
        ["app"] = u23
    }
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v45, {
        ["DisableSounds"] = false,
        ["EndTime"] = p43,
        ["FrameProps"] = {},
        ["AnnouncementText"] = p44
    })
end
function u27.hideCountdownUI(_) --[[ Line: 148 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("BridgeDuelRoundCountdownGui") then
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("BridgeDuelRoundCountdownGui")
    end
end
function u27.showTouchdownPopup(_, p46, p47, u48) --[[ Line: 153 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u2
        [3] = u26
        [4] = u12
        [5] = u13
        [6] = u19
        [7] = u4
    --]]
    local v49 = u8.Controllers.TeamController:getPlayerTeam(p46)
    local v50 = {
        ["appId"] = "BridgeDuelTouchdownPopupGui",
        ["app"] = u26
    }
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v50, {
        ["scoringPlayer"] = p46,
        ["teamColor"] = p47,
        ["scores"] = u48,
        ["scoringTeam"] = v49
    })
    local u51 = u12.LocalPlayer:FindFirstChild("PlayerGui")
    local u52
    if u51 == nil then
        u52 = u51
    else
        u52 = u51:FindFirstChild("BridgeDuelTouchdownPopupGui")
        if u52 ~= nil then
            u52 = u52:FindFirstChild("BridgeDuelTouchdownPopup")
            if u52 ~= nil then
                u52 = u52:FindFirstChild("TouchdownPlayerText")
            end
        end
    end
    local u53
    if u51 == nil then
        u53 = u51
    else
        u53 = u51:FindFirstChild("BridgeDuelTouchdownPopupGui")
        if u53 ~= nil then
            u53 = u53:FindFirstChild("BridgeDuelTouchdownScoresPopup")
            if u53 ~= nil then
                u53 = u53:FindFirstChild("TouchdownScoresTextOne")
            end
        end
    end
    local v54
    if u51 == nil then
        v54 = u51
    else
        v54 = u51:FindFirstChild("BridgeDuelTouchdownPopupGui")
        if v54 ~= nil then
            v54 = v54:FindFirstChild("BridgeDuelTouchdownScoresPopup")
            if v54 ~= nil then
                v54 = v54:FindFirstChild("TouchdownScoresTextDash")
            end
        end
    end
    if u51 ~= nil then
        u51 = u51:FindFirstChild("BridgeDuelTouchdownPopupGui")
        if u51 ~= nil then
            u51 = u51:FindFirstChild("BridgeDuelTouchdownScoresPopup")
            if u51 ~= nil then
                u51 = u51:FindFirstChild("TouchdownScoresTextTwo")
            end
        end
    end
    local u55 = { u53, v54, u51 }
    u13:Create(u52, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
        ["TextStrokeTransparency"] = 0,
        ["TextTransparency"] = 0
    }):Play()
    local function v57(p56) --[[ Line: 215 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        u13:Create(p56, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
            ["TextStrokeTransparency"] = 0,
            ["TextTransparency"] = 0
        }):Play()
    end
    for v58, v59 in u55 do
        v57(v59, v58 - 1, u55)
    end
    local u60 = u19.lightBlue
    local u61 = u19.orange
    if v49.id == "1" then
        task.delay(1.5, function() --[[ Line: 228 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u53
                [3] = u4
                [4] = u60
                [5] = u48
            --]]
            local v62 = u13:Create(u53, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["TextStrokeTransparency"] = 1,
                ["TextTransparency"] = 1
            })
            v62.Completed:Connect(function() --[[ Line: 233 ]]
                --[[
                Upvalues:
                    [1] = u53
                    [2] = u4
                    [3] = u60
                    [4] = u48
                --]]
                local v63 = u53
                local v64 = u4.richTextColor(u4.hexColor(u60))
                local v65 = u48[1]
                v63.Text = "<font color=\"" .. v64 .. "\">" .. tostring(v65) .. "</font>"
            end)
            v62:Play()
        end)
        task.delay(2, function() --[[ Line: 238 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u53
            --]]
            u13:Create(u53, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["TextStrokeTransparency"] = 0,
                ["TextTransparency"] = 0
            }):Play()
        end)
    else
        task.delay(1.5, function() --[[ Line: 246 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u51
                [3] = u4
                [4] = u61
                [5] = u48
            --]]
            local v66 = u13:Create(u51, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["TextStrokeTransparency"] = 1,
                ["TextTransparency"] = 1
            })
            v66.Completed:Connect(function() --[[ Line: 251 ]]
                --[[
                Upvalues:
                    [1] = u51
                    [2] = u4
                    [3] = u61
                    [4] = u48
                --]]
                local v67 = u51
                local v68 = u4.richTextColor(u4.hexColor(u61))
                local v69 = u48[2]
                v67.Text = "<font color=\"" .. v68 .. "\">" .. tostring(v69) .. "</font>"
            end)
            v66:Play()
        end)
        task.delay(2, function() --[[ Line: 256 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u51
            --]]
            u13:Create(u51, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["TextStrokeTransparency"] = 0,
                ["TextTransparency"] = 0
            }):Play()
        end)
    end
    task.delay(4, function() --[[ Line: 264 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u52
            [3] = u55
        --]]
        local v70 = u13:Create(u52, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
            ["TextStrokeTransparency"] = 1,
            ["TextTransparency"] = 1
        })
        local function v72(p71) --[[ Line: 269 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            u13:Create(p71, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["TextStrokeTransparency"] = 1,
                ["TextTransparency"] = 1
            }):Play()
        end
        for v73, v74 in u55 do
            v72(v74, v73 - 1, u55)
        end
        v70:Play()
    end)
end
function u27.hideTouchdownPopup(_) --[[ Line: 282 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("BridgeDuelTouchdownPopupGui") then
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("BridgeDuelTouchdownPopupGui")
    end
end
u8.CreateController(u27.new())
return nil