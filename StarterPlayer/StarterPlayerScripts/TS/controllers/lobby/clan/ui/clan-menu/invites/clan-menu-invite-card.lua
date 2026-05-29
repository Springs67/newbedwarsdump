local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DeviceUtil
local u6 = v3.Empty
local u7 = v3.IconButton
local u8 = v3.SoundManager
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").LobbyClientConfig
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["ClanMenuInviteCard"] = v13.new(u12)(function(u18, p19) --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u2
            [3] = u15
            [4] = u9
            [5] = u12
            [6] = u5
            [7] = u17
            [8] = u8
            [9] = u10
            [10] = u14
            [11] = u6
            [12] = u4
            [13] = u7
            [14] = u16
        --]]
        local _ = p19.useState
        local u20 = u11.new()
        local v21 = u12.createElement
        local v26 = {
            ["Size"] = UDim2.new(1, 0, 0, u5.isSmallScreen() and 100 or 80),
            ["BackgroundColor3"] = u17.backgroundPrimary,
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["ImageTransparency"] = 1,
            ["AutoButtonColor"] = false,
            [u12.Event.Activated] = function() --[[ Line: 37 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u10
                    [3] = u2
                    [4] = u15
                    [5] = u18
                --]]
                u8:playSound(u10.sounds.UI_CLICK)
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u15.CLAN_PROFILE, {
                    ["ClanId"] = u18.ClanInvite.clanId
                })
            end,
            [u12.Event.MouseEnter] = function(p22) --[[ Line: 41 ]]
                --[[
                Upvalues:
                    [1] = u20
                    [2] = u14
                --]]
                u20:DoCleaning()
                local u23 = u14:Create(p22, TweenInfo.new(0.12), {
                    ["BackgroundTransparency"] = 0.3
                })
                u23:Play()
                u20:GiveTask(function() --[[ Line: 47 ]]
                    --[[
                    Upvalues:
                        [1] = u23
                    --]]
                    u23:Cancel()
                end)
            end,
            [u12.Event.MouseLeave] = function(p24) --[[ Line: 51 ]]
                --[[
                Upvalues:
                    [1] = u20
                    [2] = u14
                --]]
                u20:DoCleaning()
                local u25 = u14:Create(p24, TweenInfo.new(0.12), {
                    ["BackgroundTransparency"] = 0
                })
                u25:Play()
                u20:GiveTask(function() --[[ Line: 57 ]]
                    --[[
                    Upvalues:
                        [1] = u25
                    --]]
                    u25:Cancel()
                end)
            end
        }
        local v27 = {}
        local v28 = u12.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.1, 0)
        })
        local v29 = u12.createElement("UIPadding", {
            ["PaddingLeft"] = UDim.new(0.05, 0),
            ["PaddingRight"] = UDim.new(0.05, 0),
            ["PaddingTop"] = UDim.new(0.05, 0),
            ["PaddingBottom"] = UDim.new(0.05, 0)
        })
        local v30 = u12.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 10)
        })
        local v31 = u12.createElement
        local v32 = u6
        local v33 = {
            ["Size"] = UDim2.fromScale(0.7, 1)
        }
        local v34 = {
            u12.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.1, 0)
            }),
            u12.createElement(u6, {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.55)
            }, {
                u12.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["VerticalAlignment"] = "Center",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0.05, 0)
                }),
                ["ClanName"] = u12.createElement("TextLabel", {
                    ["AutomaticSize"] = "Y",
                    ["TextXAlignment"] = "Left",
                    ["BackgroundTransparency"] = 1,
                    ["TextTransparency"] = 0,
                    ["BorderSizePixel"] = 0,
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Font"] = "Roboto",
                    ["LayoutOrder"] = 1,
                    ["AutoLocalize"] = false,
                    ["Size"] = UDim2.fromScale(1, 0),
                    ["Text"] = "<b>" .. u18.ClanInvite.clanName .. " <font color=\"" .. u4.richTextColor(u17.textPrimary) .. "\">[" .. u18.ClanInvite.clanTag .. "]</font></b>",
                    ["TextColor3"] = u4.WHITE
                }, { u12.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 20
                    }) }),
                ["ClanInviteTime"] = u12.createElement("TextLabel", {
                    ["AutomaticSize"] = "Y",
                    ["TextTransparency"] = 0.3,
                    ["TextXAlignment"] = "Left",
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Font"] = "Roboto",
                    ["LayoutOrder"] = 2,
                    ["AutoLocalize"] = false,
                    ["Size"] = UDim2.fromScale(1, 0),
                    ["Text"] = DateTime.fromUnixTimestamp(u18.ClanInvite.time):FormatLocalTime("L LT", "en-us"),
                    ["TextColor3"] = u4.WHITE
                }, { u12.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = u5.isSmallScreen() and 11 or 15
                    }) })
            }),
            ["CardActionText"] = u12.createElement("TextLabel", {
                ["AutomaticSize"] = "Y",
                ["Text"] = "CLICK TO VIEW CLAN",
                ["TextTransparency"] = 0,
                ["TextXAlignment"] = "Left",
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "ArialBold",
                ["LayoutOrder"] = 2,
                ["AutoLocalize"] = false,
                ["Size"] = UDim2.fromScale(1, 0),
                ["TextColor3"] = u17.mcYellow
            }, { u12.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = u5.isSmallScreen() and 12 or 18
                }) })
        }
        __set_list(v27, 1, {v28, v29, v30, v31(v32, v33, v34), u12.createElement(u6, {
    ["Size"] = UDim2.fromScale(0.3, 1)
}, {
    u12.createElement("UIListLayout", {
        ["FillDirection"] = "Horizontal",
        ["HorizontalAlignment"] = "Right",
        ["VerticalAlignment"] = "Center",
        ["SortOrder"] = "LayoutOrder",
        ["Padding"] = UDim.new(0.1, 0)
    }),
    ["Accept"] = u12.createElement(u7, {
        ["SizeConstraint"] = "RelativeYY",
        ["Size"] = UDim2.fromScale(0.5, 0.5),
        ["Image"] = u16.CHECK_SOLID,
        ["IconProps"] = {
            ["ScaleType"] = "Fit",
            ["ImageColor3"] = u17.backgroundSuccess
        },
        ["OnClick"] = function() --[[ Name: OnClick, Line 172 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u18
            --]]
            u9.Controllers.ClanController:clanInviteDecision(u18.ClanInvite.clanId, true)
        end
    }),
    ["Decline"] = u12.createElement(u7, {
        ["SizeConstraint"] = "RelativeYY",
        ["Size"] = UDim2.fromScale(0.5, 0.5),
        ["Image"] = u16.X,
        ["IconProps"] = {
            ["ScaleType"] = "Fit",
            ["ImageColor3"] = u17.backgroundError
        },
        ["OnClick"] = function() --[[ Name: OnClick, Line 184 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u18
            --]]
            u9.Controllers.ClanController:clanInviteDecision(u18.ClanInvite.clanId, false)
        end
    })
})})
        return v21("ImageButton", v26, v27)
    end)
}