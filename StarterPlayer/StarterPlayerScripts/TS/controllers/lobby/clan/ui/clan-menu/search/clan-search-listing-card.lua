local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.Padding
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil
return {
    ["ClanSearchListingCard"] = v7.new(u6)(function(p9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u6
            [3] = u3
            [4] = u5
            [5] = u4
        --]]
        local _ = p10.useState
        local v11
        if p9.Clan.extraData.emblem == "" or p9.Clan.extraData.emblem == nil then
            v11 = u8.FALLBACK_CLAN_ICON
        else
            v11 = p9.Clan.extraData.emblem
        end
        local v12 = {
            ["Size"] = UDim2.new(0.96, 0, 0, 60)
        }
        local v13
        if p9.Selected then
            v13 = Color3.fromRGB(64, 69, 112)
        else
            v13 = Color3.fromRGB(47, 49, 80)
        end
        v12.BackgroundColor3 = v13
        local v14 = p9.FrameProps
        if v14 then
            for v15, v16 in v14 do
                v12[v15] = v16
            end
        end
        v12[u6.Event.Activated] = p9.OnClick
        local v17 = {}
        local v18 = #v17
        local v19 = p9.Selected
        if v19 then
            v19 = u6.createElement("UIStroke", {
                ["Thickness"] = 2,
                ["Color"] = u3.WHITE
            })
        end
        if v19 then
            v17[v18 + 1] = v19
        end
        local v20 = #v17
        v17[v20 + 1] = u6.createElement(u5, {
            ["Padding"] = {
                ["Vertical"] = 4,
                ["Horizontal"] = 8
            }
        })
        v17[v20 + 2] = u6.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.1, 0)
        })
        v17[v20 + 3] = u6.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.03, 0)
        })
        v17.ClanIcon = u6.createElement("ImageLabel", {
            ["SizeConstraint"] = "RelativeYY",
            ["ScaleType"] = "Fit",
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromOffset(54, 54),
            ["Image"] = v11
        })
        v17.ClanIdentity = u6.createElement(u4, {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.35, 1)
        }, {
            u6.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Left",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.1, 0)
            }),
            ["ClanName"] = u6.createElement("TextLabel", {
                ["TextXAlignment"] = "Left",
                ["TextSize"] = 18,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(1, 0, 0, 18),
                ["Text"] = p9.Clan.name,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
            }),
            ["ClanTag"] = u6.createElement("TextLabel", {
                ["TextXAlignment"] = "Left",
                ["TextSize"] = 14,
                ["TextTransparency"] = 0.3,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(1, 0, 0, 14),
                ["Text"] = "[" .. p9.Clan.tag .. "]",
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular)
            })
        })
        local v21 = u6.createElement
        local v22 = u4
        local v23 = {
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(0.5, 1)
        }
        local v24 = { (u6.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Right",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.03, 0)
            })) }
        local v25 = u6.createElement
        local v26 = {
            ["TextXAlignment"] = "Left",
            ["TextSize"] = 14,
            ["TextTransparency"] = 0.3,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(0.33, 1)
        }
        local v27 = p9.Clan.extraData.clanLevel
        v26.Text = "Lv. " .. tostring(v27)
        v26.TextColor3 = Color3.fromRGB(255, 255, 255)
        v26.FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular)
        v24.ClanLevel = v25("TextLabel", v26)
        local v28 = u6.createElement
        local v29 = {
            ["TextXAlignment"] = "Left",
            ["TextSize"] = 14,
            ["TextTransparency"] = 0.3,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 4,
            ["Size"] = UDim2.fromScale(0.33, 1)
        }
        local v30 = #p9.Clan.members
        local v31 = tostring(v30)
        local v32 = p9.Clan.maxMembers
        v29.Text = v31 .. "/" .. tostring(v32)
        v29.TextColor3 = Color3.fromRGB(255, 255, 255)
        v29.FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular)
        v24.ClanMembersCount = v28("TextLabel", v29)
        v17.ClanStats = v21(v22, v23, v24)
        return u6.createFragment({
            ["ClanSearchListingCard"] = u6.createElement("ImageButton", v12, v17)
        })
    end)
}