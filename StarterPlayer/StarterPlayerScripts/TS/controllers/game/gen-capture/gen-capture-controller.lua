local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.ReplicatedStorage
local u9 = v6.RunService
local u10 = v6.TweenService
local u11 = v6.Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "capture-point-balance").CapturePointBalance
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = v1.import(script, script.Parent.Parent.Parent, "global", "team", "team-controller").TeamController
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "GenCaptureController"
    end,
    ["__index"] = u12
})
u20.__index = u20
function u20.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u13
        [3] = u18
    --]]
    u12.constructor(p23)
    p23.Name = "GenCaptureController"
    p23.capturePoints = {}
    local v24 = u13.CAPTURE_POINT_RANGE
    local v25 = u13.CAPTURE_POINT_RANGE
    p23.capturePointRange = Vector3.new(v24, 0, v25)
    p23.capturePointsDisabled = true
    p23.neutralColor = Color3.fromRGB(166, 163, 163)
    p23.diamondGenBlockOffset = Vector3.new(0, -9, 0)
    p23.capturePointAudioMaidMap = {}
    p23.globalDiamondGenBlocks = {}
    p23.captureProgressIncreaseSounds = {
        u18.CAPTURE_POINT_PROGRESS_INCREASE_STAGE_1,
        u18.CAPTURE_POINT_PROGRESS_INCREASE_STAGE_2,
        u18.CAPTURE_POINT_PROGRESS_INCREASE_STAGE_3,
        u18.CAPTURE_POINT_PROGRESS_INCREASE_STAGE_4
    }
    p23.captureProgressIncreaseLoops = {
        u18.CAPTURE_POINT_PROGRESS_INCREASE_STAGE_1_LOOP,
        u18.CAPTURE_POINT_PROGRESS_INCREASE_STAGE_2_LOOP,
        u18.CAPTURE_POINT_PROGRESS_INCREASE_STAGE_3_LOOP,
        u18.CAPTURE_POINT_PROGRESS_INCREASE_STAGE_4_LOOP
    }
    p23.captureProgressDecreaseSounds = {
        u18.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_1,
        u18.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_2,
        u18.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_3,
        u18.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_4
    }
    p23.captureProgressDecreaseLoops = {
        u18.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_1_LOOP,
        u18.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_2_LOOP,
        u18.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_3_LOOP,
        u18.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_4_LOOP
    }
end
function u20.KnitStart(u26) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u17
        [3] = u2
        [4] = u15
        [5] = u5
        [6] = u4
        [7] = u14
        [8] = u3
        [9] = u18
        [10] = u16
        [11] = u7
        [12] = u19
        [13] = u13
        [14] = u10
    --]]
    u12.KnitStart(u26)
    u17.Client:OnEvent("CapturePointProgressUpdate", function(p27) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        local v28 = p27.capturePoint
        local v29 = u26.capturePoints[v28.worldPosition]
        if v29 ~= nil then
            local v30 = v28.progress
            local v31
            if v29 == nil then
                v31 = v29
            else
                v31 = v29.progress
            end
            if v31 < v30 then
                u26:handleProgressAudio(v28, false)
            else
                local v32 = v28.progress
                local v33
                if v29 == nil then
                    v33 = v29
                else
                    v33 = v29.progress
                end
                if v32 < v33 then
                    u26:handleProgressAudio(v28, true)
                end
            end
            v29.progress = v28.progress
        end
        u26:updateCapturePointIndicatorPosition(v28)
    end)
    u17.Client:OnEvent("InitializeCapturePoint", function(p34) --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u2
            [3] = u15
        --]]
        u26.capturePointsDisabled = false
        local v35 = p34.capturePoint
        local v36 = v35.worldPosition
        local v37 = u2:getBlockPosition(v36 + u26.diamondGenBlockOffset)
        local v38 = u2:getStore():getBlockAt(v37)
        if v38 ~= nil and v38.Name == u15.DIAMOND_BLOCK then
            if u26.globalDiamondGenBlocks[v37] ~= nil then
                return nil
            end
            u26.globalDiamondGenBlocks[v37] = v38
        end
        if u26.capturePoints[v36] ~= nil then
            return nil
        end
        u26:setupCapturePoint(v35)
        u26.capturePoints[v36] = v35
    end)
    u17.Client:OnEvent("RemoveCapturePoints", function() --[[ Line: 100 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u5
        --]]
        u26.capturePointsDisabled = true
        local v39 = u26.capturePoints
        local function v44(p40) --[[ Line: 103 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u5
            --]]
            local v41 = p40.capturePointLock
            if v41 ~= nil then
                v41:Destroy()
            end
            local v42 = p40.capturePointProgressIndicator
            if v42 ~= nil then
                v42:Destroy()
            end
            u26.capturePoints[p40.worldPosition] = nil
            local v43 = u26.capturePointAudioMaidMap[p40.worldPosition]
            if v43 == nil then
                u5.new()
            else
                v43:DoCleaning()
            end
        end
        for v45, v46 in v39 do
            v44(v46, v45, v39)
        end
    end)
    u17.Client:OnEvent("CapturePointCaptured", function(p47) --[[ Line: 129 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u14
            [3] = u3
            [4] = u18
            [5] = u26
            [6] = u16
            [7] = u7
            [8] = u19
            [9] = u13
            [10] = u10
        --]]
        if p47.capturePoint.capturedByTeam ~= nil then
            u4.Controllers.FireworkController:playFireworkEffect(p47.capturePoint.worldPosition + Vector3.new(0, -7, 0), u14.NEW_YEARS, {
                ["sizeMultiplier"] = 0.4,
                ["volumeMultiplier"] = 0
            })
            u3:playSound(u18.CAPTURE_POINT_GOAL_REACHED, {
                ["volumeMultiplier"] = 0.3,
                ["rollOffMaxDistance"] = 240,
                ["position"] = p47.capturePoint.worldPosition
            })
        end
        local u48 = u26.capturePoints[p47.capturePoint.worldPosition]
        if u48 ~= nil then
            u48 = u48.capturePointProgressIndicator
        end
        local u49 = u26.capturePoints[p47.capturePoint.worldPosition]
        if u49 ~= nil then
            u49 = u49.capturePointLock
        end
        if u48 == nil then
            return nil
        end
        if u49 == nil then
            return nil
        end
        local v50 = u16.getGamePlayer(u7.LocalPlayer):getTeamId()
        local v51 = p47.capturePoint.capturedByTeam
        if v51 == nil then
            return nil
        end
        local v52 = u19:getTeamById(v51)
        if v52 ~= nil then
            v52 = v52.color
        end
        if v52 == nil then
            return nil
        end
        if v51 == nil then
            v52 = u26.neutralColor
        end
        u48.Color = v52
        if v50 ~= v51 then
            u49.Transparency = 0
            u48.Transparency = 0.5
            task.delay(u13.CAPTURE_POINT_COOLDOWN_DURATION - 1.5, function() --[[ Line: 184 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u48
                    [3] = u49
                --]]
                local v53 = u10:Create(u48, TweenInfo.new(1.5), {
                    ["Transparency"] = 0
                })
                local v54 = u10:Create(u49, TweenInfo.new(1.5), {
                    ["Transparency"] = 1
                })
                v53:Play()
                v54:Play()
            end)
        end
    end)
end
function u20.setupCapturePoint(p55, p56) --[[ Line: 198 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u11
        [3] = u2
    --]]
    local v57 = p56.worldPosition
    local v58 = p56.capturePointProgressStart
    local v59 = u8.Assets.Effects.CapturePointProgressIndicator:Clone()
    v59.Anchored = true
    v59.CanCollide = false
    v59.CanQuery = false
    v59.CanTouch = false
    v59.Position = v58
    v59.Parent = u11
    v59.Color = p55.neutralColor
    local v60 = v59:FindFirstChild("CapturePointLock")
    p56.capturePointProgressIndicator = v59
    if v60 ~= nil then
        v60.Transparency = 1
        p56.capturePointLock = v60
    end
    local v61 = u2:getBlockPosition(v57 + p55.diamondGenBlockOffset)
    local v62 = p55.globalDiamondGenBlocks[v61]
    if v62 ~= nil then
        if not p55.capturePointsDisabled then
            v62.Transparency = 1
            return
        end
        v62.Transparency = 0
    end
end
function u20.updateCapturePointIndicatorPosition(u63, u64) --[[ Line: 228 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u7
        [3] = u13
        [4] = u5
        [5] = u9
    --]]
    local u65 = u64.progress
    local v66 = u64.capturePointProgressStart
    if v66 == nil then
        return nil
    end
    local u67 = u63.capturePoints[u64.worldPosition]
    if u67 ~= nil then
        u67 = u67.capturePointProgressIndicator
    end
    if u67 == nil then
        return nil
    end
    if u16.getGamePlayer(u7.LocalPlayer):getTeamId() == u64.capturedByTeam then
        u65 = u13.CAPTURE_POINT_GOAL - u65
    end
    local v68 = u65
    local v69 = v66 - Vector3.new(0, v68, 0)
    local u70 = u5.new()
    local u71 = 0
    local u72 = 1
    local u73 = CFrame.new(u67.Position)
    local u74 = CFrame.new(v69)
    u70:GiveTask(u9.Heartbeat:Connect(function(p75) --[[ Line: 255 ]]
        --[[
        Upvalues:
            [1] = u67
            [2] = u70
            [3] = u71
            [4] = u65
            [5] = u13
            [6] = u72
            [7] = u73
            [8] = u74
            [9] = u63
            [10] = u64
        --]]
        if u67.Parent == nil then
            u70:DoCleaning()
            return nil
        end
        u71 = u71 + p75
        if u65 == u13.CAPTURE_POINT_GOAL - 1 then
            u72 = 0.45
        elseif u65 == u13.CAPTURE_POINT_GOAL then
            u72 = 0.1
        else
            u72 = 1
        end
        local v76 = u71 / u72
        if v76 >= 1 then
            u70:DoCleaning()
            return nil
        end
        local v77 = u73:Lerp(u74, v76)
        local _ = v77 * CFrame.Angles(0, 0, 0)
        u67:PivotTo(v77)
        u63:updateCapturePointColors(u64)
    end))
end
function u20.updateCapturePointColors(p78, p79) --[[ Line: 283 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u7
        [3] = u19
        [4] = u13
    --]]
    u16.getGamePlayer(u7.LocalPlayer):getTeamId()
    local v80 = p78.capturePoints[p79.worldPosition]
    if v80 ~= nil then
        v80 = v80.capturePointProgressIndicator
    end
    if v80 == nil then
        return nil
    end
    local v81 = p79.capturedByTeam
    if v81 == nil then
        return nil
    end
    local v82 = u19:getTeamById(v81)
    if v82 ~= nil then
        v82 = v82.color
    end
    if v82 == nil then
        return nil
    end
    if v81 == nil then
        v82 = p78.neutralColor
    end
    local v83 = p79.progress / u13.CAPTURE_POINT_GOAL
    v80.Color = Color3.new(p78:colorLerp(v82.R, p78.neutralColor.R, v83), p78:colorLerp(v82.G, p78.neutralColor.G, v83), p78:colorLerp(v82.B, p78.neutralColor.B, v83))
end
function u20.colorLerp(_, p84, p85, p86) --[[ Line: 312 ]]
    return p84 * (1 - p86) + p85 * p86
end
function u20.handleProgressAudio(p87, p88, p89) --[[ Line: 315 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u13
        [3] = u3
    --]]
    local v90 = p88.progress
    local v91 = p87.capturePointAudioMaidMap[p88.worldPosition]
    if v91 == nil then
        v91 = u5.new()
    else
        v91:DoCleaning()
    end
    p87.capturePointAudioMaidMap[p88.worldPosition] = v91
    local v92 = v90 >= 1 and v90 < 3 and 0 or (v90 >= 3 and v90 < 6 and 1 or (v90 >= 6 and v90 < 9 and 2 or (v90 >= 9 and v90 <= u13.CAPTURE_POINT_GOAL and 3 or 0)))
    local v93 = v90 >= 1 and v90 < 3 and 0 or (v90 >= 3 and v90 < 6 and 1 or (v90 >= 6 and v90 < 9 and 2 or (v90 >= 9 and v90 <= u13.CAPTURE_POINT_GOAL and 3 or 0)))
    local u94 = u3:playSound(p87.captureProgressIncreaseLoops[v93 + 1], {
        ["rollOffMaxDistance"] = 120,
        ["volumeMultiplier"] = 0.5,
        ["position"] = p88.worldPosition
    })
    if p89 then
        u3:playSound(p87.captureProgressDecreaseSounds[v92 + 1], {
            ["rollOffMaxDistance"] = 120,
            ["volumeMultiplier"] = 0.5,
            ["position"] = p88.worldPosition
        })
        u94 = u3:playSound(p87.captureProgressDecreaseLoops[v93 + 1], {
            ["rollOffMaxDistance"] = 120,
            ["volumeMultiplier"] = 0.5,
            ["position"] = p88.worldPosition
        })
    else
        u3:playSound(p87.captureProgressIncreaseSounds[v92 + 1], {
            ["rollOffMaxDistance"] = 120,
            ["volumeMultiplier"] = 0.5,
            ["position"] = p88.worldPosition
        })
    end
    v91:GiveTask(function() --[[ Line: 356 ]]
        --[[
        Upvalues:
            [1] = u94
        --]]
        local v95 = u94
        if v95 ~= nil then
            v95:Stop()
        end
    end)
end
function u20.updateCapturePointBaseBlocks(p96, p97) --[[ Line: 363 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v98 = p97 - p96.capturePointRange * 0.5
    local v99 = p97 + p96.capturePointRange * 0.5
    p96:getBlocksInRegion3((Region3.new(u2:getBlockPosition(v98), u2:getBlockPosition(v99))))
    local v100 = u2:getStore():getBlockAt(u2:getBlockPosition(p97 + Vector3.new(2, -8, 2)))
    if v100 == nil then
        return nil
    end
    v100.Color = Color3.fromRGB(0, 0, 0)
end
function u20.getBlocksInRegion3(_, p101) --[[ Line: 382 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    return u2:getStore():getBlocksInRegion3(p101)
end
u4.CreateController(u20.new())
return nil