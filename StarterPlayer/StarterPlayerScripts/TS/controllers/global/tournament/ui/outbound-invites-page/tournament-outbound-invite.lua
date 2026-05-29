local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.IconButton
local u6 = v2.PlayerRender
local u7 = v2.SoundManager
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["TournamentOutgoingInvite"] = v9.new(u8)(function(u16, p17) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u14
            [3] = u10
            [4] = u13
            [5] = u12
            [6] = u8
            [7] = u4
            [8] = u6
            [9] = u3
            [10] = u5
            [11] = u11
            [12] = u15
        --]]
        local v18 = p17.useState
        local v19 = p17.useEffect
        local v20, u21 = v18(nil)
        local function v24() --[[ Line: 21 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u14
                [3] = u10
                [4] = u16
                [5] = u13
            --]]
            u7:playSound(u14.UI_CLICK_2)
            local v22 = u10:getState().Tournament.myTeamId
            if v22 == "" or not v22 then
                return nil
            end
            local v23 = u16.InvitedPlayer
            u13.Client:GetNamespace("Tournament"):Get("RequestRevokeTournamentTeamInvitation"):CallServerAsync(v22, v23)
        end
        v19(function() --[[ Line: 30 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u16
                [3] = u21
            --]]
            task.spawn(function() --[[ Line: 31 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u16
                    [3] = u21
                --]]
                u12.getOfflinePlayersByUserIds({ u16.InvitedPlayer }):andThen(function(p25) --[[ Line: 33 ]]
                    --[[
                    Upvalues:
                        [1] = u21
                    --]]
                    if p25[1] then
                        u21(p25[1])
                    end
                end)
            end)
        end, {})
        local v26 = u8.createFragment
        local v27 = {}
        local v28 = u16.InvitedPlayer
        local v29 = "Player-" .. tostring(v28)
        local v30 = u8.createElement
        local v31 = {
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(0.6, 0, 0, 60),
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeXY,
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
        }
        local v32 = {
            u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["Padding"] = UDim.new(0, 0)
            }),
            u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.2, 0)
            }),
            u8.createElement("UIGradient", {
                ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("6467A7")), ColorSequenceKeypoint.new(0.38, Color3.fromHex("6467A7")), ColorSequenceKeypoint.new(1, Color3.fromHex("CFB15A")) })
            }),
            ["PlayerRender"] = u8.createElement(u4, {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0.2, 1)
            }, { u8.createElement(u6, {
                    ["FallbackTransparency"] = 1,
                    ["SizeConstraint"] = "RelativeYY",
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["LayoutOrder"] = 1,
                    ["PlayerUserId"] = u16.InvitedPlayer,
                    ["Size"] = UDim2.fromScale(1, 1)
                }, { u8.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }), u8.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(1, 0)
                    }) }) }),
            ["UserInfo"] = u8.createElement(u4, {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0.5, 1)
            }, { u8.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["VerticalAlignment"] = "Center",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0, 0)
                }), u8.createElement("TextLabel", {
                    ["AutomaticSize"] = "X",
                    ["TextXAlignment"] = "Left",
                    ["BackgroundTransparency"] = 1,
                    ["TextTransparency"] = 0,
                    ["BorderSizePixel"] = 0,
                    ["TextScaled"] = true,
                    ["LayoutOrder"] = 1,
                    ["AutoLocalize"] = false,
                    ["Size"] = UDim2.fromScale(0, 0.55),
                    ["Text"] = not v20 and "loading" or v20.displayName,
                    ["TextColor3"] = u3.hexColor(16777215),
                    ["Font"] = Enum.Font.ArialBold
                }, { u8.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 18
                    }) }), u8.createElement("TextLabel", {
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
                    ["Text"] = not v20 and "loading" or "@" .. v20.name,
                    ["TextColor3"] = u3.hexColor(16777215)
                }, { u8.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 16
                    }) }) }),
            ["CancelInviteIcon"] = u8.createElement(u4, {
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.fromScale(0.3, 1),
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeXY
            }, { u8.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["SortOrder"] = "LayoutOrder",
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
                    ["Padding"] = UDim.new(0, 0)
                }), u8.createElement(u5, {
                    ["SizeConstraint"] = "RelativeYY",
                    ["Tooltip"] = "Cancel Invite",
                    ["LayoutOrder"] = 3,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Image"] = u11.TRASH_SOLID,
                    ["IconProps"] = {
                        ["ScaleType"] = "Fit",
                        ["Size"] = UDim2.fromScale(0.8, 0.8),
                        ["ImageColor3"] = u15.mcRed
                    },
                    ["OnClick"] = v24
                }) })
        }
        v27[v29] = v30("Frame", v31, v32)
        return v26(v27)
    end)
}