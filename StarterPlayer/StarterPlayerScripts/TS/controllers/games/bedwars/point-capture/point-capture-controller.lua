local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.ReplicatedStorage
local u13 = v10.TweenService
local u14 = v10.Workspace
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "team", "team-controller").TeamController
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ping", "ping-type").PingType
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u25 = v1.import(script, script.Parent, "ui", "circle-progress-bar").CircleProgressBar
local u26 = v1.import(script, script.Parent, "ui", "point-capture-score-ui").ScoreBoardWrapper
local u27 = v1.import(script, script.Parent, "ui", "point-status-ui").PointStatusUI
local u28 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 33 ]]
        return "PointCaptureController"
    end,
    ["__index"] = u16
})
u28.__index = u28
function u28.new(...) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    local v29 = u28
    local v30 = setmetatable({}, v29)
    return v30:constructor(...) or v30
end
function u28.constructor(p31) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u19
        [3] = u24
    --]]
    u16.constructor(p31, { u19.CAPTURE_THE_POINTS })
    p31.Name = "PointCaptureController"
    p31.pointMap = {}
    p31.neutralColor = Color3.fromRGB(166, 163, 163)
    p31.capturePointAudioMaidMap = {}
    p31.captureProgressIncreaseSounds = {
        u24.DOMINATION_CAPTURING_1,
        u24.DOMINATION_CAPTURING_2,
        u24.DOMINATION_CAPTURING_3,
        u24.DOMINATION_CAPTURING_4,
        u24.DOMINATION_CAPTURING_5,
        u24.DOMINATION_CAPTURING_6,
        u24.DOMINATION_CAPTURING_7,
        u24.DOMINATION_CAPTURING_8,
        u24.DOMINATION_CAPTURING_9,
        u24.DOMINATION_CAPTURING_10,
        u24.DOMINATION_CAPTURING_10
    }
    p31.captureProgressIncreaseLoops = {
        u24.CAPTURE_POINT_PROGRESS_INCREASE_STAGE_1_LOOP,
        u24.CAPTURE_POINT_PROGRESS_INCREASE_STAGE_2_LOOP,
        u24.CAPTURE_POINT_PROGRESS_INCREASE_STAGE_3_LOOP,
        u24.CAPTURE_POINT_PROGRESS_INCREASE_STAGE_4_LOOP
    }
    p31.captureProgressDecreaseSounds = {
        u24.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_1,
        u24.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_2,
        u24.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_3,
        u24.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_4
    }
    p31.captureProgressDecreaseLoops = {
        u24.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_1_LOOP,
        u24.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_2_LOOP,
        u24.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_3_LOOP,
        u24.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_4_LOOP
    }
end
function u28.KnitStart(u32) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u7
        [3] = u23
        [4] = u18
        [5] = u21
        [6] = u20
        [7] = u9
        [8] = u26
        [9] = u11
        [10] = u27
    --]]
    u16.KnitStart(u32)
    local u33 = u7.new()
    u23.Client:Get("CreateCapturePoint"):Connect(function(p34) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        u32:setupPoints(p34.position, p34.id)
    end)
    u23.Client:Get("ResourcePointProgressUpdate"):Connect(function(p35) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        u32:updateProgress(p35.resourcePoint)
    end)
    u23.Client:WaitFor("MatchStateEvent"):expect():Connect(function(p36, _, _) --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u21
            [3] = u20
            [4] = u9
            [5] = u26
            [6] = u11
            [7] = u33
        --]]
        local v37 = u18:getState().Game.queueType
        if p36 == u21.RUNNING and v37 == u20.CAPTURE_POINTS then
            local u38 = u9.mount(u26(), u11.LocalPlayer:WaitForChild("PlayerGui"))
            u33:GiveTask(function() --[[ Line: 67 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u38
                --]]
                u9.unmount(u38)
            end)
        end
        if p36 == u21.POST then
            u33:DoCleaning()
        end
    end)
    u23.Client:Get("CapturePointSetUpComplete"):Connect(function(p39) --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u27
            [3] = u11
            [4] = u33
        --]]
        local u40 = u9.mount(u9.createElement(u27, {
            ["points"] = p39.points
        }), u11.LocalPlayer:WaitForChild("PlayerGui"))
        u33:GiveTask(function() --[[ Line: 79 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u40
            --]]
            u9.unmount(u40)
        end)
    end)
end
function u28.setupPoints(p41, p42, p43) --[[ Line: 84 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u14
        [3] = u15
    --]]
    local v44 = u12.Assets.Effects.DominationPoint:Clone()
    v44:PivotTo(CFrame.new(p42 - Vector3.new(0, 1, 0)))
    v44.Parent = u14
    local v45 = v44:WaitForChild("top", 3)
    v45.Transparency = 1
    v45.Anchored = true
    v45.CanCollide = false
    v45.CanQuery = false
    v45.CanTouch = false
    v45.Position = p42 - Vector3.new(0, 5, 0)
    v45.Color = p41.neutralColor
    local v46 = p41:createSign(p42 + Vector3.new(0, 9, 0), p43)
    p41.pointMap[p42] = {
        ["worldPosition"] = p42,
        ["startPosition"] = p42 - Vector3.new(0, 5, 0),
        ["part"] = v45,
        ["progress"] = 0,
        ["id"] = p43,
        ["billboard"] = v46
    }
    u15.PointSetup:fire(p43)
end
function u28.createSign(_, p47, p48) --[[ Line: 122 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u14
        [3] = u9
        [4] = u25
        [5] = u4
    --]]
    local v49 = u8("Part", {
        ["Name"] = "POINT",
        ["Size"] = Vector3.new(1, 1, 1),
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["Transparency"] = 1,
        ["CFrame"] = CFrame.new(p47),
        ["Parent"] = u14
    })
    return u9.mount(u9.createElement("BillboardGui", {
        ["StudsOffsetWorldSpace"] = Vector3.new(0, 4.5, 1.5),
        ["ResetOnSpawn"] = false,
        ["MaxDistance"] = 300,
        ["AlwaysOnTop"] = true,
        ["Adornee"] = v49,
        ["Size"] = UDim2.fromScale(6, 6)
    }, { u9.createElement(u25, {
            ["progress"] = 0,
            ["color"] = u4.WHITE,
            ["id"] = p48
        }) }), v49)
end
function u28.updateProgress(p50, p51) --[[ Line: 148 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u24
        [3] = u22
        [4] = u13
        [5] = u15
    --]]
    local v52 = p50.pointMap[p51.worldPosition]
    if not v52 then
        return nil
    end
    local v53 = v52.startPosition
    if v53 ~= nil then
        local v54 = p51.progress
        v53 = v53 + Vector3.new(0, v54, 0)
    end
    if not (v52.part and v53) then
        return nil
    end
    p50:handleProgressAudio(p51, v52.part.Position.Y > v53.Y)
    local v55 = v52.capturedByTeam
    if v55 == "" then
        v55 = false
    end
    local v56 = not v55
    if v56 then
        v56 = p51.capturedByTeam
        if v56 ~= "" and v56 then
            v56 = p51.progress >= 100
        end
    end
    if v56 ~= "" and v56 then
        if p50:isFriendlyTeam(p51.capturedByTeam) then
            u5:playSound(u24.DOMINATION_CAPTURED_BY_TEAM, {
                ["volumeMultiplier"] = 0.3
            })
        else
            u5:playSound(u24.DOMINATION_CAPTURED_BY_ENEMY, {
                ["volumeMultiplier"] = 0.3
            })
        end
        local v57
        if p50:isFriendlyTeam(p51.capturedByTeam) then
            v57 = u22.POINT_CAPTURED_BY_TEAM
        else
            v57 = u22.POINT_CAPTURED_BY_ENEMY
        end
        p50:createPing(v57, v52.worldPosition)
    end
    local v58 = p51.capturingTeam
    if v58 ~= "" and v58 then
        if p51.capturedByTeam == nil and v52.capturingTeam ~= p51.capturingTeam then
            p50:changeColor(p51.capturingTeam, v52.part.Parent)
        end
        local v59 = v52.capturingTeam
        if v59 == "" then
            v59 = false
        end
        local v60 = not v59
        if v60 then
            v60 = not p50:isFriendlyTeam(p51.capturingTeam)
        end
        if v60 then
            local v61 = v52.capturedByTeam
            if v61 == "" then
                v61 = false
            end
            if not v61 or v52.capturedByTeam ~= p51.capturingTeam then
                p50:createPing(u22.POINT_CAPTURING_BY_ENEMY, v52.worldPosition)
            end
        end
    end
    u13:Create(v52.part, TweenInfo.new(0.9), {
        ["Position"] = v53
    }):Play()
    local v62 = v52.capturedByTeam
    if v62 == "" then
        v62 = false
    end
    local v63 = not v62
    if v63 then
        v63 = p51.capturedByTeam
    end
    if v63 == "" or not v63 then
        local v64 = v52.capturedByTeam
        if v64 ~= "" and v64 then
            local v65 = p51.capturedByTeam
            if v65 == "" then
                v65 = false
            end
            v64 = not v65
        end
        if v64 ~= "" and v64 then
            u15.PointCaptured:fire(v52.id, nil)
            p50:handleCapturedEffect(v52.part.Parent, false)
        end
    else
        u15.PointCaptured:fire(v52.id, p51.capturedByTeam)
        p50:handleCapturedEffect(v52.part.Parent, true)
    end
    v52.capturedByTeam = p51.capturedByTeam
    v52.capturingTeam = p51.capturingTeam
    v52.progress = p51.progress
end
function u28.handleProgressAudio(p66, p67, p68) --[[ Line: 238 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u5
    --]]
    if p67.progress == 100 then
        return nil
    end
    local v69 = p67.progress
    local v70 = p66.capturePointAudioMaidMap[p67.worldPosition]
    if v70 == nil then
        v70 = u7.new()
    else
        v70:DoCleaning()
    end
    p66.capturePointAudioMaidMap[p67.worldPosition] = v70
    local v71 = v69 >= 10 and v69 < 30 and 0 or (v69 >= 30 and v69 < 60 and 1 or (v69 >= 60 and v69 < 90 and 2 or (v69 >= 90 and v69 <= 100 and 3 or 0)))
    local v72 = v69 >= 10 and v69 < 30 and 0 or (v69 >= 30 and v69 < 60 and 1 or (v69 >= 60 and v69 < 90 and 2 or (v69 >= 90 and v69 <= 100 and 3 or 0)))
    local u73 = u5:playSound(p66.captureProgressIncreaseLoops[v72 + 1], {
        ["rollOffMaxDistance"] = 120,
        ["volumeMultiplier"] = 0.5,
        ["position"] = p67.worldPosition
    })
    if p68 then
        u5:playSound(p66.captureProgressDecreaseSounds[v71 + 1], {
            ["rollOffMaxDistance"] = 120,
            ["volumeMultiplier"] = 0.5,
            ["position"] = p67.worldPosition
        })
        u73 = u5:playSound(p66.captureProgressDecreaseLoops[v72 + 1], {
            ["rollOffMaxDistance"] = 120,
            ["volumeMultiplier"] = 0.5,
            ["position"] = p67.worldPosition
        })
    else
        local v74 = u5
        local v75 = p66.captureProgressIncreaseSounds
        local v76 = v69 / 10
        v74:playSound(v75[math.floor(v76) + 1], {
            ["rollOffMaxDistance"] = 120,
            ["volumeMultiplier"] = 0.5,
            ["position"] = p67.worldPosition
        })
    end
    v70:GiveTask(function() --[[ Line: 282 ]]
        --[[
        Upvalues:
            [1] = u73
        --]]
        local v77 = u73
        if v77 ~= nil then
            v77:Stop()
        end
    end)
end
function u28.getPoints(p78) --[[ Line: 289 ]]
    local v79 = {}
    for _, v80 in p78.pointMap do
        local v81 = v80.id
        table.insert(v79, v81)
    end
    return v79
end
function u28.isFriendlyTeam(_, p82) --[[ Line: 301 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u11
    --]]
    local v83 = u17:getPlayerTeam(u11.LocalPlayer)
    if v83 ~= nil then
        v83 = v83.id
    end
    return p82 == v83
end
function u28.createPing(_, p84, p85) --[[ Line: 309 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    u2.resolveDependency("client/controllers/game/ping/ping-controller@PingController"):notificationPing(p85, p84)
end
function u28.changeColor(p86, p87, p88) --[[ Line: 313 ]]
    local v89
    if p86:isFriendlyTeam(p87) then
        v89 = Color3.fromRGB(0, 255, 0)
    else
        v89 = Color3.fromRGB(255, 0, 0)
    end
    for v90, v91 in p88:GetDescendants() do
        local _ = v90 - 1
        if v91:IsA("Beam") or v91:IsA("ParticleEmitter") then
            v91.Color = ColorSequence.new(v89, v89)
        end
        if v91:IsA("ImageLabel") then
            v91.ImageColor3 = v89
        end
    end
end
function u28.handleCapturedEffect(_, p92, p93) --[[ Line: 328 ]]
    for v94, v95 in p92:GetDescendants() do
        local _ = v94 - 1
        if v95:IsA("ParticleEmitter") then
            v95.Enabled = p93
        end
    end
end
v6.CreateController(u28.new())
return nil