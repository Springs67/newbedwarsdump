local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.Button
local u5 = v3.ColorUtil
local u6 = v3.Countdown
local u7 = v3.DarkBackground
local u8 = v3.DeviceUtil
local u9 = v3.Padding
local u10 = v3.ScaleComponent
local u11 = v3.SlideIn
local u12 = v3.SoundManager
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u18 = v1.import(script, script.Parent.Parent.Parent, "reward", "ui", "reward-list").RewardList
local v35 = v14.new(u13)(function(u19, p20) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u16
        [3] = u8
        [4] = u13
        [5] = u7
        [6] = u10
        [7] = u9
        [8] = u5
        [9] = u18
        [10] = u6
        [11] = u2
        [12] = u17
        [13] = u4
        [14] = u11
    --]]
    local _ = p20.useState
    local v21 = p20.useEffect
    local v22 = UDim2.fromOffset(620, 300)
    v21(function() --[[ Line: 24 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u16
        --]]
        u12:playSound(u16.UI_OPEN_2)
        return function() --[[ Line: 26 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u16
            --]]
            u12:playSound(u16.UI_CLOSE_2)
        end
    end, {})
    local v23 = {
        ["DisplayOrder"] = 20,
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = u8.isSmallScreen()
    }
    local v24 = { u13.createElement(u7, {
            ["AppId"] = u19.AppId,
            ["ImageButtonProps"] = {
                ["ZIndex"] = 0
            }
        }) }
    local v25 = #v24
    local v26 = {}
    local _ = #v26
    local v27 = {
        ["AutomaticSize"] = "Y",
        ["BorderSizePixel"] = 0,
        ["AutoButtonColor"] = false,
        ["Modal"] = true,
        ["Size"] = UDim2.new(0, v22.X.Offset, 0, 0),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["BackgroundColor3"] = Color3.fromHex("#333333")
    }
    local v28 = {
        u13.createElement(u10, {
            ["PowerRelationshipPastMaximum"] = 0.6,
            ["MaximumSize"] = Vector2.new(v22.X.Offset * 1.2, v22.Y.Offset * 1.2),
            ["ScreenPadding"] = Vector2.new(30, 30)
        }),
        u13.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 10)
        }),
        u13.createElement(u9, {
            ["Padding"] = UDim.new(0, 28)
        }),
        u13.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["VerticalAlignment"] = "Center",
            ["HorizontalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 16)
        }),
        ["Title"] = u13.createElement("TextLabel", {
            ["TextSize"] = 22,
            ["Font"] = "Roboto",
            ["RichText"] = true,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.2),
            ["Text"] = "<b>" .. string.upper(u19.title) .. "</b>",
            ["TextColor3"] = u5.WHITE
        }),
        ["Message"] = u13.createElement("TextLabel", {
            ["AutomaticSize"] = "Y",
            ["TextSize"] = 18,
            ["Font"] = "Roboto",
            ["TextWrap"] = true,
            ["RichText"] = true,
            ["TextTransparency"] = 0.2,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0),
            ["Text"] = u19.message,
            ["TextColor3"] = u5.WHITE
        })
    }
    local v29 = #v28
    local v30 = u19.reward
    if v30 then
        v30 = u13.createElement(u18, {
            ["Rewards"] = u19.reward,
            ["FrameProps"] = {
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.fromScale(1, 0),
                ["AutomaticSize"] = Enum.AutomaticSize.Y
            }
        })
    end
    if v30 then
        v28[v29 + 1] = v30
    end
    local v31 = #v28
    local v32 = u19.countdown
    if v32 then
        v32 = u13.createElement(u6, {
            ["EndTime"] = u19.countdown.endTime,
            ["PreText"] = u19.countdown.preText,
            ["PostText"] = u19.countdown.postText,
            ["CountdownConfig"] = {
                ["days"] = true,
                ["hours"] = true,
                ["minutes"] = true,
                ["seconds"] = true
            },
            ["TextLabel"] = {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.new(1, 0, 0, 22),
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["Font"] = Enum.Font.RobotoMono,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            }
        })
    end
    if v32 then
        v28[v31 + 1] = v32
    end
    local _ = #v28
    local v33 = {
        ["Size"] = UDim2.new(0.8, 0, 0, 45)
    }
    local v34 = u19.buttonText
    if v34 ~= nil then
        v34 = string.upper(v34)
    end
    v33.Text = "<b>" .. (v34 == nil and "OK" or v34) .. "</b>"
    function v33.OnClick() --[[ Line: 150 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u19
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u19.AppId)
    end
    v33.BackgroundColor3 = u17.mcGreen
    v33.AutoButtonColor = true
    v33.LayoutOrder = 3
    v28.Confirmation = u13.createElement(u4, v33)
    v26.Popup = u13.createElement("ImageButton", v27, v28)
    v24[v25 + 1] = u13.createElement(u11, {}, v26)
    return u13.createFragment({
        ["PopupGui"] = u13.createElement("ScreenGui", v23, v24)
    })
end)
return {
    ["Popup"] = v15.connect(function(_, p36) --[[ Line: 164 ]]
        local v37 = {}
        for v38, v39 in p36 do
            v37[v38] = v39
        end
        return v37
    end)(v35)
}