local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Countdown
local u5 = v2.DeviceUtil
local u6 = v2.Padding
local u7 = v2.SoundManager
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v37 = v10.new(u9)(function(u14, p15) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u5
        [3] = u8
        [4] = u12
        [5] = u7
        [6] = u13
        [7] = u3
        [8] = u6
        [9] = u4
    --]]
    local _ = p15.useState
    local v16 = p15.useEffect
    local u17 = u9.createRef()
    local v18 = u14.FrameProps
    if v18 ~= nil then
        v18 = v18.ZIndex
    end
    local v19 = u5.isMobileControls()
    local v20 = u14.AnnouncementText
    local v21 = (v20 == "" or not v20) and "" or v20
    v16(function() --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u8
            [3] = u12
            [4] = u14
            [5] = u7
            [6] = u13
        --]]
        local u22 = true
        local u23 = u17:getValue()
        local u24 = u8.new()
        if not u23 then
            return nil
        end
        u24:GiveTask(u12.Heartbeat:Connect(function(p25) --[[ Line: 37 ]]
            --[[
            Upvalues:
                [1] = u23
            --]]
            u23.Rotation = (u23.Rotation + 360 * p25) % 360
        end))
        if not u14.DisableSounds then
            task.spawn(function() --[[ Line: 43 ]]
                --[[
                Upvalues:
                    [1] = u22
                    [2] = u7
                    [3] = u13
                --]]
                while u22 do
                    u7:playSound(u13.COUNTDOWN_TICK)
                    task.wait(1)
                end
            end)
        end
        return function() --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u22
            --]]
            u24:DoCleaning()
            u22 = false
        end
    end, {})
    local v26 = {
        ["DisplayOrder"] = 20,
        ["IgnoreGuiInset"] = true,
        ["ResetOnSpawn"] = false
    }
    local v27 = {}
    local v28 = u9.createElement
    local v29 = "Frame"
    local v30 = {
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(0.2, 0.08),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v31
    if v19 then
        v31 = UDim2.fromScale(0.5, 0.22)
    else
        v31 = UDim2.fromScale(0.5, 0.125)
    end
    v30.Position = v31
    v30.BackgroundColor3 = u3.BLACK
    v30.ZIndex = v18
    v27.SnowboardingMinigameAnnouncementFrame = v28(v29, v30, {
        ["TouchdownScoredText"] = u9.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextScaled"] = true,
            ["TextStrokeTransparency"] = 0,
            ["TextWrapped"] = true,
            ["Text"] = v21,
            ["Size"] = UDim2.fromScale(1, 0.8),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Font"] = Enum.Font.GothamBold,
            ["TextColor3"] = Color3.fromRGB(245, 245, 220),
            ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0),
            ["TextXAlignment"] = Enum.TextXAlignment.Center,
            ["TextYAlignment"] = Enum.TextYAlignment.Center
        })
    })
    local _ = #v27
    local v32 = {
        ["BackgroundTransparency"] = 0.3,
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(0.08, 0.06),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v33
    if v19 then
        v33 = UDim2.fromScale(0.5, 0.5)
    else
        v33 = UDim2.fromScale(0.5, 0.5)
    end
    v32.Position = v33
    v32.BackgroundColor3 = u3.BLACK
    local v34 = u14.FrameProps
    if v34 then
        for v35, v36 in v34 do
            v32[v35] = v36
        end
    end
    v32.ZIndex = v18
    v27.SnowboardingMinigameCountdownGuiFrame = u9.createElement("Frame", v32, {
        u9.createElement("UIStroke", {
            ["Thickness"] = 2,
            ["Color"] = u3.WHITE
        }, { u9.createElement("UIGradient", {
                ["Rotation"] = 90,
                ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.3, 1), NumberSequenceKeypoint.new(1, 1) }),
                [u9.Ref] = u17
            }) }),
        u9.createElement(u6, {
            ["Padding"] = UDim.new(0.1, 0)
        }),
        u9.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(1, 0)
        }),
        u9.createElement(u4, {
            ["DisableHideOnComplete"] = true,
            ["OnCompleteText"] = "GO!",
            ["EndTime"] = u14.EndTime,
            ["CountdownConfig"] = {
                ["days"] = false,
                ["hours"] = false,
                ["minutes"] = false
            },
            ["TextLabel"] = {
                ["ZIndex"] = v18
            }
        })
    })
    return u9.createFragment({
        ["SnowboardingMinigameCountdownGui"] = u9.createElement("ScreenGui", v26, v27)
    })
end)
return {
    ["SnowboardingMinigameCountdownGUI"] = v11.connect(function(_, p38) --[[ Line: 140 ]]
        local v39 = {}
        for v40, v41 in p38 do
            v39[v40] = v41
        end
        return v39
    end)(v37)
}