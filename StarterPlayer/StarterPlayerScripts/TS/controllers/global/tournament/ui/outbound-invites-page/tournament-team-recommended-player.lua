local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.Empty
local v6 = v3.ExpireList
local u7 = v3.IconButton
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u15 = v6.new(5)
return {
    ["TorunamentTeamRecommendedPlayer"] = v10.new(u9)(function(u16, _) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u11
            [3] = u12
            [4] = u8
            [5] = u2
            [6] = u9
            [7] = u5
            [8] = u4
            [9] = u7
            [10] = u13
            [11] = u14
        --]]
        local function v19() --[[ Line: 18 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u11
                [3] = u12
                [4] = u8
                [5] = u16
                [6] = u2
            --]]
            if u15:has(u11.LocalPlayer.UserId) then
                return nil
            end
            u15:add(u11.LocalPlayer.UserId)
            local v17 = u12:getState().Tournament.myTeamId
            if v17 == "" or not v17 then
                return nil
            end
            u8.Controllers.TournamentTeamController:requestSendTournamentTeamInvitation(v17, u16.DisplayPlayer.userId):andThen(function(p18) --[[ Line: 28 ]]
                --[[
                Upvalues:
                    [1] = u2
                --]]
                if p18 then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                        ["message"] = "Invite sent!"
                    })
                else
                    u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                        ["message"] = "Invite could not be sent. Try again soon."
                    })
                end
            end)
        end
        local v20 = u9.createFragment
        local v21 = {}
        local v22 = u16.DisplayPlayer.userId
        local v23 = "Player-" .. tostring(v22)
        local v24 = u9.createElement
        local v25 = {
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(0.9, 0, 0, 60),
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeXY,
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
        }
        local v26 = {
            u9.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["Padding"] = UDim.new(0, 0)
            }),
            u9.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.2, 0)
            }),
            u9.createElement("UIGradient", {
                ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("6467A7")), ColorSequenceKeypoint.new(0.38, Color3.fromHex("6467A7")), ColorSequenceKeypoint.new(1, Color3.fromHex("CFB15A")) })
            }),
            u9.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0, 10)
            }),
            ["UserInfo"] = u9.createElement(u5, {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0.7, 1)
            }, { u9.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["VerticalAlignment"] = "Center",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0, 0)
                }), u9.createElement("TextLabel", {
                    ["AutomaticSize"] = "X",
                    ["TextXAlignment"] = "Left",
                    ["BackgroundTransparency"] = 1,
                    ["TextTransparency"] = 0,
                    ["BorderSizePixel"] = 0,
                    ["TextScaled"] = true,
                    ["LayoutOrder"] = 1,
                    ["AutoLocalize"] = false,
                    ["Size"] = UDim2.fromScale(0, 0.55),
                    ["Text"] = u16.DisplayPlayer.displayName,
                    ["TextColor3"] = u4.hexColor(16777215),
                    ["Font"] = Enum.Font.ArialBold
                }, { u9.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 18
                    }) }), u9.createElement("TextLabel", {
                    ["AutomaticSize"] = "X",
                    ["TextXAlignment"] = "Left",
                    ["BackgroundTransparency"] = 1,
                    ["TextTransparency"] = 0.3,
                    ["BorderSizePixel"] = 0,
                    ["TextScaled"] = true,
                    ["Font"] = "Roboto",
                    ["LayoutOrder"] = 2,
                    ["AutoLocalize"] = false,
                    ["Size"] = UDim2.fromScale(0, 0.45),
                    ["Text"] = u16.DisplayPlayer.name,
                    ["TextColor3"] = u4.hexColor(16777215)
                }, { u9.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 16
                    }) }) })
        }
        local v27 = u9.createElement
        local v28 = u5
        local v29 = {
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(0.3, 1),
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeXY
        }
        local v30 = {}
        local v31 = u9.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["SortOrder"] = "LayoutOrder",
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
            ["Padding"] = UDim.new(0, 0)
        })
        local v32 = u9.createElement
        local v33 = u7
        local v34 = {
            ["SizeConstraint"] = "RelativeYY",
            ["Tooltip"] = "Send Invite",
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Image"] = u13.ACCEPT_TOURNAMENT_INVITE_ICON,
            ["IconProps"] = {
                ["ScaleType"] = "Fit",
                ["Size"] = UDim2.fromScale(0.8, 0.8),
                ["ImageColor3"] = u14.mcRed
            },
            ["OnClick"] = v19
        }
        __set_list(v30, 1, {v31, v32(v33, v34)})
        v26.SendInviteIcon = v27(v28, v29, v30)
        v21[v23] = v24("Frame", v25, v26)
        return v20(v21)
    end)
}