local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.ColorUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u8 = v1.import(script, script.Parent, "tournament-invite-player-search").TournamentInvitePlayerSearch
local u9 = v1.import(script, script.Parent, "tournament-outbound-invites").TournamentOutgoingInvites
local u10 = v1.import(script, script.Parent, "tournament-outbound-recommendations").TournamentOutboundRecommendations
return {
    ["TournamentAppOutboundInvitePage"] = v6.new(u5)(function(p11, _) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u7
            [3] = u8
            [4] = u3
            [5] = u9
            [6] = u4
            [7] = u10
        --]]
        local v12 = u5.createFragment
        local v13 = {}
        local v14 = u5.createElement
        local v15 = {
            ["LayoutOrder"] = 2,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.9)
        }
        local v16 = {
            ["DecorativeBackgroundImage"] = u5.createElement("ImageLabel", {
                ["ImageTransparency"] = 0.8,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 2,
                ["Image"] = u7.YAMINI_MAIL,
                ["Size"] = UDim2.fromScale(0.4, 0.7),
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["Position"] = UDim2.fromScale(0, 1),
                ["AnchorPoint"] = Vector2.new(0, 1)
            })
        }
        local v17 = u5.createElement
        local v18 = {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.9),
            ["BackgroundColor3"] = Color3.fromHex("403E74"),
            ["Position"] = UDim2.fromOffset(0, 0)
        }
        local v19 = {
            ["Gradient"] = u5.createElement("UIGradient", {
                ["Rotation"] = 60,
                ["Transparency"] = NumberSequence.new(0.6, 1),
                ["Color"] = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromHex("585497"))
            }),
            u5.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["Padding"] = UDim.new(0, 0),
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }),
            (u5.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0, 20),
                ["PaddingTop"] = UDim.new(0, 20)
            }))
        }
        local v20 = u5.createElement
        local v21 = {
            ["LayoutOrder"] = 1,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.6, 0.95),
            ["AnchorPoint"] = Vector2.new(0, 0)
        }
        local v22 = {
            u5.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["Padding"] = UDim.new(0.03, 0)
            }),
            ["PlayerInviteSearch"] = u5.createElement(u8, {
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.new(0.9, 0, 0.15, 0)
            })
        }
        local v23 = u5.createElement
        local v24 = u3
        local v25 = {
            ["ScrollingFrameProps"] = {
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0.9, 0.8),
                ["CanvasSize"] = UDim2.fromScale(1, 0.75),
                ["AutomaticCanvasSize"] = Enum.AutomaticSize.Y
            }
        }
        v22.OutboundInvitesList = v23(v24, v25, { u5.createElement(u9, {
                ["LayoutOrder"] = 1,
                ["OutboundInvites"] = p11.OutboundInvites
            }) })
        v19.LeftContainer = v20("Frame", v21, v22)
        local v26 = u5.createElement
        local v27 = {
            ["LayoutOrder"] = 2,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 3,
            ["Size"] = UDim2.fromScale(0.3, 0.95),
            ["AnchorPoint"] = Vector2.new(0, 0)
        }
        local v28 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["Padding"] = UDim.new(0, 0)
            }), (u5.createElement("TextLabel", {
                ["Text"] = "<b>Recommended Invites</b>",
                ["TextTransparency"] = 0.3,
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(1, 0, 0, 40),
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Top,
                ["TextColor3"] = u4.WHITE,
                ["Font"] = Enum.Font.Roboto
            }, { u5.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 36
                }) })) }
        local v29 = u5.createElement
        local v30 = u3
        local v31 = {
            ["ScrollingFrameProps"] = {
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0.9, 0.8),
                ["CanvasSize"] = UDim2.fromScale(1, 0.75),
                ["AutomaticCanvasSize"] = Enum.AutomaticSize.Y
            }
        }
        v28.RecommendedInvites = v29(v30, v31, { u5.createElement(u10, {
                ["LayoutOrder"] = 1
            }) })
        v19.RightContainer = v26("Frame", v27, v28)
        v16.OutboundInvitesContent = v17("Frame", v18, v19)
        v13.AppPageContainer = v14("Frame", v15, v16)
        return v12(v13)
    end)
}