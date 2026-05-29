local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.IconButton
local u7 = v2.PlayerRender
local u8 = v2.SoundManager
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["ClanProfileInviteOutgoingInvite"] = v10.new(u9)(function(u16, p17) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u8
            [3] = u14
            [4] = u13
            [5] = u12
            [6] = u9
            [7] = u15
            [8] = u5
            [9] = u7
            [10] = u3
            [11] = u6
            [12] = u11
        --]]
        local v18 = p17.useState
        local v19 = p17.useEffect
        local v20, u21 = v18(nil)
        local function v22() --[[ Line: 21 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u8
                [3] = u14
                [4] = u13
                [5] = u16
            --]]
            if not u4.isHoarceKat() then
                u8:playSound(u14.UI_CLICK_2)
                u13.Client:GetNamespace("Clans"):Get("CancelOutgoingInvite"):CallServerAsync(u16.ClanInvite)
            end
        end
        v19(function() --[[ Line: 27 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u16
                [3] = u21
            --]]
            task.spawn(function() --[[ Line: 28 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u16
                    [3] = u21
                --]]
                u12.getOfflinePlayersByUserIds({ u16.ClanInvite.targetUserId }):andThen(function(p23) --[[ Line: 30 ]]
                    --[[
                    Upvalues:
                        [1] = u21
                    --]]
                    if p23[1] then
                        u21(p23[1])
                    end
                end)
            end)
        end, {})
        local v24 = u9.createElement
        local v25 = {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.new(0.98, 0, 0, 40),
            ["BackgroundColor3"] = u15.backgroundPrimary,
            ["LayoutOrder"] = u16.LayoutOrder
        }
        local v26 = {}
        local v27 = u9.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.1, 0)
        })
        local v28 = u9.createElement("UIPadding", {
            ["PaddingLeft"] = UDim.new(0, 10),
            ["PaddingRight"] = UDim.new(0, 10),
            ["PaddingTop"] = UDim.new(0, 6),
            ["PaddingBottom"] = UDim.new(0, 6)
        })
        local v29 = u9.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 0)
        })
        local v30 = u9.createElement
        local v31 = u5
        local v32 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.7, 1)
        }
        local v33 = {
            u9.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Left",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 8)
            }),
            u9.createElement(u7, {
                ["FallbackTransparency"] = 1,
                ["SizeConstraint"] = "RelativeYY",
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 1,
                ["PlayerUserId"] = u16.ClanInvite.targetUserId,
                ["Size"] = UDim2.fromScale(1, 1)
            }, { u9.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }), u9.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(1, 0)
                }) }),
            ["UserInfo"] = u9.createElement(u5, {
                ["AutomaticSize"] = "X",
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0, 1)
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
                    ["Text"] = not v20 and "loading" or v20.displayName,
                    ["TextColor3"] = u3.hexColor(16777215),
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
                    ["Text"] = not v20 and "loading" or "@" .. v20.name,
                    ["TextColor3"] = u3.hexColor(16777215)
                }, { u9.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 16
                    }) }) }),
            u9.createElement("TextLabel", {
                ["AutomaticSize"] = "X",
                ["TextXAlignment"] = "Left",
                ["BackgroundTransparency"] = 1,
                ["TextTransparency"] = 0.3,
                ["BorderSizePixel"] = 0,
                ["TextScaled"] = true,
                ["Font"] = "Roboto",
                ["LayoutOrder"] = 3,
                ["AutoLocalize"] = false,
                ["Size"] = UDim2.fromScale(0, 0.6),
                ["Text"] = "Invited on " .. DateTime.fromUnixTimestamp(u16.ClanInvite.time):FormatLocalTime("L LT", "en-us"),
                ["TextColor3"] = u3.hexColor(16777215)
            }, { u9.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 14
                }) })
        }
        __set_list(v26, 1, {v27, v28, v29, v30(v31, v32, v33), u9.createElement(u5, {
    ["LayoutOrder"] = 2,
    ["Size"] = UDim2.fromScale(0.3, 1)
}, { u9.createElement("UIListLayout", {
        ["FillDirection"] = "Horizontal",
        ["HorizontalAlignment"] = "Right",
        ["SortOrder"] = "LayoutOrder",
        ["Padding"] = UDim.new(0, 0)
    }), u9.createElement(u6, {
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
        ["OnClick"] = v22
    }) })})
        return v24("Frame", v25, v26)
    end)
}