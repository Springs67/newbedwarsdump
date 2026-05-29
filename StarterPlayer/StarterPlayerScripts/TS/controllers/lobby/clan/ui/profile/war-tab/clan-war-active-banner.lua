local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Countdown
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war").ClanWarUtils
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["ClanWarActiveBanner"] = v7.new(u6)(function(p10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u8
            [3] = u5
            [4] = u9
            [5] = u3
            [6] = u4
        --]]
        local _ = p11.useState
        local v12 = {
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.22),
            ["BackgroundColor3"] = Color3.fromRGB(51, 53, 94)
        }
        local v13 = p10.FrameProps
        if v13 then
            for v14, v15 in v13 do
                v12[v14] = v15
            end
        end
        local v16 = u6.createFragment
        local v17 = {}
        local v18 = u6.createElement
        local v19 = {}
        local v20 = u6.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 6)
        })
        local v21 = u6.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0.175, 0),
            ["PaddingBottom"] = UDim.new(0.175, 0),
            ["PaddingLeft"] = UDim.new(0.04, 0),
            ["PaddingRight"] = UDim.new(0.04, 0)
        })
        local v22 = u6.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.05, 0)
        })
        local v23 = u6.createElement("ImageLabel", {
            ["SizeConstraint"] = "RelativeYY",
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Image"] = u8.CLAN_WAR_LOGO,
            ["ScaleType"] = Enum.ScaleType.Fit
        })
        local v24 = u6.createElement
        local v25 = u5
        local v26 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.7, 1)
        }
        local v27 = {
            u6.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.03, 0)
            }),
            ["Title"] = u6.createElement("TextLabel", {
                ["Text"] = "<b>CLAN WAR</b>",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.45),
                ["TextColor3"] = u9.textPrimary
            }, { u6.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 24
                }) }),
            ["WarDates"] = u6.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["TextTransparency"] = 0.3,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(1, 0.25),
                ["Text"] = os.date("%x %I:%M %p", u8.clanWarResetTime:getNextWeeklyResetTime() - 604800) .. " - " .. os.date("%x %I:%M %p", u8.clanWarResetTime:getNextWeeklyResetTime()),
                ["TextColor3"] = u3.WHITE
            }, { u6.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 18
                }) })
        }
        local v28 = u6.createElement
        local v29 = u4
        local v30 = {
            ["PreText"] = "<font transparency=\".3\">Ends In:</font> ",
            ["EndTime"] = u8.clanWarResetTime:getNextWeeklyResetTime(),
            ["TextLabel"] = {
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(1, 0.3),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = u3.WHITE
            }
        }
        v27.WarCountdown = v28(v29, v30)
        __set_list(v19, 1, {v20, v21, v22, v23, v24(v25, v26, v27)})
        v17.Header = v18("Frame", v12, v19)
        return v16(v17)
    end)
}