local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AutoCanvasScrollingFrame
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u6 = v1.import(script, script.Parent, "tournament-app-incoming-invite-row").TournamentAppIncomingInviteRow
return {
    ["TournamentAppIncomingInvitesPage"] = v4.new(u3)(function(p7, p8) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u6
            [4] = u2
        --]]
        local _ = p8.useState
        local v9 = {
            ["LayoutOrder"] = 2,
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.9),
            ["BackgroundColor3"] = Color3.fromHex("403E74")
        }
        local v10 = {
            ["Gradient"] = u3.createElement("UIGradient", {
                ["Rotation"] = 60,
                ["Transparency"] = NumberSequence.new(0.6, 1),
                ["Color"] = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromHex("585497"))
            }),
            ["DecorativeBackgroundImage"] = u3.createElement("ImageLabel", {
                ["ImageTransparency"] = 0.8,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 2,
                ["Image"] = u5.TALIYAH_INVITE,
                ["Size"] = UDim2.fromScale(0.4, 0.7),
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["Position"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(1, 1)
            })
        }
        local _ = #v10
        local v11 = {
            ["LayoutOrder"] = 1,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.95, 0.95),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v12 = {}
        local _ = #v12
        local v13 = p7.Invites
        local v14 = table.create(#v13)
        for v15, v16 in v13 do
            local v17 = {
                ["Invite"] = v16,
                ["Index"] = v15 - 1
            }
            v14[v15] = u3.createElement(u6, v17)
        end
        local v18 = {
            ["ScrollingFrameProps"] = {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.7, 0.9),
                ["CanvasSize"] = UDim2.fromScale(1, 0),
                ["AutomaticCanvasSize"] = Enum.AutomaticSize.Y
            }
        }
        local v19 = { u3.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["Padding"] = UDim.new(0.03, 0)
            }) }
        local v20 = #v19
        for v21, v22 in v14 do
            v19[v20 + v21] = v22
        end
        v12.InvitesList = u3.createElement(u2, v18, v19)
        v10.Background = u3.createElement("Frame", v11, v12)
        return u3.createFragment({
            ["App Content - Invites"] = u3.createElement("Frame", v9, v10)
        })
    end)
}