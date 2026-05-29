local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnnouncementUtil
local u5 = v3.ColorUtil
local u6 = v3.Countdown
local u7 = v3.Empty
local u8 = v3.Padding
local u9 = v3.SoundManager
local u10 = v3.UIUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local function v34(u16, p17) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u11
        [3] = u14
        [4] = u9
        [5] = u15
        [6] = u4
        [7] = u10
        [8] = u2
        [9] = u5
        [10] = u8
        [11] = u6
        [12] = u7
    --]]
    local _ = p17.useState
    local v18 = p17.useEffect
    local u19 = u12.createRef()
    local u20 = u12.createRef()
    v18(function() --[[ Line: 22 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u20
            [3] = u11
            [4] = u14
            [5] = u9
            [6] = u15
            [7] = u16
            [8] = u4
            [9] = u10
            [10] = u2
        --]]
        local u21 = true
        local u22 = u19:getValue()
        local u23 = u20:getValue()
        local u24 = u11.new()
        if not (u22 and u23) then
            return nil
        end
        u24:GiveTask(u14.Heartbeat:Connect(function(p25) --[[ Line: 31 ]]
            --[[
            Upvalues:
                [1] = u23
            --]]
            u23.Rotation = (u23.Rotation + 360 * p25) % 360
        end))
        task.spawn(function() --[[ Line: 36 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u9
                [3] = u15
            --]]
            while u21 do
                u9:playSound(u15.COUNTDOWN_TICK)
                task.wait(1)
            end
        end)
        local v26 = u16.Announcement.duration
        if v26 == nil then
            v26 = u4.DEFAULT_DURATION
        end
        task.delay(v26 - 0.3, function() --[[ Line: 47 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u22
            --]]
            u10:setContainerTransparency(u22, 1, {
                ["onSetTweenInfo"] = TweenInfo.new(0.3, Enum.EasingStyle.Exponential)
            })
        end)
        task.delay(v26, function() --[[ Line: 52 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u2
                [3] = u16
                [4] = u9
                [5] = u15
            --]]
            u21 = false
            u2.resolveDependency("@easy-games/game-core:client/controllers/announcement/announcement-controller@AnnouncementController"):endAnnouncement(u16.Announcement.important)
            u9:playSound(u15.COUNTDOWN_GAMESTART)
        end)
        return function() --[[ Line: 57 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u21
            --]]
            u24:DoCleaning()
            u21 = false
        end
    end, {})
    local v27 = {
        ["ResetOnSpawn"] = false
    }
    local v28 = {}
    local v29 = #v28
    local v30 = {
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Size"] = UDim2.fromScale(0.3, 0.175),
        ["Position"] = u16.Announcement.position or UDim2.fromScale(0.5, 0.5),
        [u12.Ref] = u19
    }
    local v31 = { u12.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.025, 0)
        }) }
    local v32 = #v31
    local v33
    if u16.Announcement.message == "" then
        v33 = false
    else
        v33 = u12.createFragment({
            ["Message"] = u12.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Text"] = string.upper(u16.Announcement.message),
                ["Size"] = UDim2.fromScale(1, 0.4),
                ["TextColor3"] = u5.WHITE,
                ["Font"] = Enum.Font.GothamBlack
            }, { u12.createElement("UIStroke", {
                    ["Thickness"] = 1
                }) })
        })
    end
    if v33 then
        v31[v32 + 1] = v33
    end
    local _ = #v31
    v31.FirstDropTimeCountdown = u12.createElement("Frame", {
        ["BackgroundTransparency"] = 0.3,
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(0.3, 0.6),
        ["BackgroundColor3"] = u5.BLACK
    }, {
        u12.createElement("UIStroke", {
            ["Thickness"] = 2,
            ["Color"] = u5.WHITE
        }, { u12.createElement("UIGradient", {
                ["Rotation"] = 90,
                ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.3, 1), NumberSequenceKeypoint.new(1, 1) }),
                [u12.Ref] = u20
            }) }),
        u12.createElement(u8, {
            ["Padding"] = UDim.new(0.1, 0)
        }),
        u12.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(1, 0)
        }),
        u12.createElement(u6, {
            ["EndTime"] = u16.Announcement.endTime,
            ["CountdownConfig"] = {
                ["days"] = false,
                ["hours"] = false,
                ["minutes"] = false
            }
        })
    })
    v28[v29 + 1] = u12.createElement(u7, v30, v31)
    return u12.createElement("ScreenGui", v27, v28)
end
return {
    ["CircleCountdownAnnouncementComponent"] = v34,
    ["CircleCountdownAnnouncement"] = v13.new(u12)(v34)
}