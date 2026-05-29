local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.ImageId
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["SocialConnectionsRewardSection"] = v8.new(u7)(function(p11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u6
            [3] = u7
            [4] = u5
            [5] = u10
            [6] = u3
            [7] = u9
        --]]
        local _ = p12.useState
        local v13 = u4.isHoarceKat() and 2 or (u6.Controllers.SocialConnectionsController.policyDiscordAllowed and 2 or 1)
        local v14 = p11.CompletedCount == v13
        local v15 = u7.createElement
        local v16 = "Frame"
        local v17 = {
            ["AutomaticSize"] = "Y",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, 0),
            ["LayoutOrder"] = p11.LayoutOrder
        }
        local v18 = {}
        local v19 = u7.createElement
        local v20 = "ImageLabel"
        local v21 = {
            ["ScaleType"] = "Fit",
            ["SizeConstraint"] = "RelativeYY",
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.1, 0.5),
            ["Size"] = UDim2.fromOffset(36, 36)
        }
        local v22
        if v14 then
            v22 = u5.UNLOCK_SOLID
        else
            v22 = u5.LOCK_SOLID
        end
        v21.Image = v22
        local v23 = v19(v20, v21)
        local v24 = u7.createElement
        local v25 = {
            ["AutomaticSize"] = "Y",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, 0)
        }
        local v26 = {}
        local v27 = u7.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 8)
        })
        local v28 = u7.createElement
        local v29 = {
            ["RichText"] = true,
            ["TextSize"] = 16,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, 0),
            ["AutomaticSize"] = Enum.AutomaticSize.Y
        }
        local v30 = p11.CompletedCount
        v29.Text = (v14 and "<b><font color=\"#30C35C\">Unlocked</font></b>" or "Complete all tasks to unlock") .. " (<font color=\"#FFFFFF\">" .. tostring(v30) .. "</font>/" .. tostring(v13) .. ")"
        v29.TextColor3 = u10.textSecondary
        v29.TextXAlignment = Enum.TextXAlignment.Center
        v29.Font = Enum.Font.Roboto
        __set_list(v26, 1, {v27, v28("TextLabel", v29), u7.createElement("Frame", {
    ["AutomaticSize"] = "XY",
    ["BackgroundTransparency"] = 0.7,
    ["LayoutOrder"] = 2,
    ["Size"] = UDim2.new(u4.isSmallScreen() and 0.5 or 0, 0, 0, 0),
    ["BackgroundColor3"] = u3.BLACK
}, { u7.createElement("UIPadding", {
        ["PaddingTop"] = UDim.new(0, 8),
        ["PaddingBottom"] = UDim.new(0, 8),
        ["PaddingLeft"] = UDim.new(0, 10),
        ["PaddingRight"] = UDim.new(0, 10)
    }), u7.createElement("ImageLabel", {
        ["ScaleType"] = "Fit",
        ["SizeConstraint"] = "RelativeYY",
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 1,
        ["AnchorPoint"] = Vector2.new(0, 0.5),
        ["Position"] = UDim2.fromScale(0, 0.5),
        ["Size"] = UDim2.fromOffset(16, 16),
        ["Image"] = u9.BATTLE_PASS_SEASON_ICON
    }), u7.createElement("TextLabel", {
        ["Text"] = "<b>+20%</b> Battle Pass XP",
        ["RichText"] = true,
        ["TextSize"] = 16,
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 1,
        ["AnchorPoint"] = Vector2.new(0, 0.5),
        ["Position"] = UDim2.new(0, 28, 0.5, 0),
        ["Size"] = UDim2.new(0, 0, 0, 0),
        ["AutomaticSize"] = Enum.AutomaticSize.XY,
        ["TextColor3"] = u3.WHITE,
        ["TextXAlignment"] = Enum.TextXAlignment.Left,
        ["Font"] = Enum.Font.Roboto
    }) })})
        __set_list(v18, 1, {v23, v24("Frame", v25, v26)})
        return v15(v16, v17, v18)
    end)
}