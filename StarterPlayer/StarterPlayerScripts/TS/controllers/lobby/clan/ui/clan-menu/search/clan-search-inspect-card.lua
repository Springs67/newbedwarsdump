local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ButtonComponent
local u5 = v3.CornerFiller
local u6 = v3.Empty
local u7 = v3.Padding
local u8 = v3.SoundManager
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-privacy-setting").ClanPrivacySetting
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["ClanSearchInspectCard"] = v11.new(u10)(function(u18, p19) --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u15
            [3] = u12
            [4] = u9
            [5] = u2
            [6] = u13
            [7] = u8
            [8] = u16
            [9] = u10
            [10] = u17
            [11] = u5
            [12] = u6
            [13] = u7
            [14] = u4
        --]]
        local _ = p19.useState
        local v20 = u18.Clan.extraData.privacySetting == u14.ANYONE_CAN_JOIN and "JOIN" or "CLOSED"
        local v21
        if u18.Clan.extraData.emblem == "" or u18.Clan.extraData.emblem == nil then
            v21 = u15.FALLBACK_CLAN_ICON
        else
            v21 = u18.Clan.extraData.emblem
        end
        local v22 = u12:getState().Clans.myClanId ~= nil and true or u18.Clan.extraData.privacySetting ~= u14.ANYONE_CAN_JOIN
        local function v24() --[[ Line: 24 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u18
                [3] = u2
                [4] = u13
                [5] = u8
                [6] = u16
            --]]
            u9.Controllers.ClanController:requestToJoinClan(u18.Clan.clanId):andThen(function(p23) --[[ Line: 26 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u13
                    [3] = u18
                    [4] = u8
                    [5] = u16
                --]]
                if p23.success and p23.joinedClan then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u13.CLAN_PROFILE, {
                        ["ClanId"] = u18.Clan.clanId
                    })
                    u8:playSound(u16.BEDWARS_UPGRADE_SUCCESS)
                end
            end)
        end
        local function v25() --[[ Line: 36 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u13
                [3] = u18
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u13.CLAN_PROFILE, {
                ["ClanId"] = u18.Clan.clanId
            })
        end
        local v26 = u10.createFragment
        local v27 = {}
        local v28 = u10.createElement
        local v29 = "Frame"
        local v30 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(0.37, 0, 1, 0),
            ["BackgroundColor3"] = u17.backgroundPrimary
        }
        local v31 = { (u10.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 9)
            })) }
        local v32 = u10.createElement
        local v33 = {
            ["ClipsDescendants"] = true,
            ["Size"] = UDim2.fromScale(1, 0.2),
            ["BackgroundColor3"] = Color3.fromRGB(112, 115, 185)
        }
        local v34 = {
            u10.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 9)
            }),
            ["BackgroundImage"] = u10.createElement("ImageLabel", {
                ["ImageTransparency"] = 0.91,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(2.25, 2.25),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Image"] = v21,
                ["ScaleType"] = Enum.ScaleType.Fit
            }),
            (u10.createElement(u5, {
                ["BottomLeft"] = true,
                ["BottomRight"] = true
            }))
        }
        local v35 = u10.createElement
        local v36 = u6
        local v37 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v38 = {
            u10.createElement(u7, {
                ["Padding"] = UDim.new(0.08, 0)
            }),
            u10.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.03, 0)
            }),
            ["ClanIcon"] = u10.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = v21
            }, { u10.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
        }
        local v39 = u10.createElement
        local v40 = u6
        local v41 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.35, 1)
        }
        local v42 = {
            u10.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Left",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.1, 0)
            }),
            ["ClanName"] = u10.createElement("TextLabel", {
                ["AutomaticSize"] = "Y",
                ["TextXAlignment"] = "Left",
                ["TextSize"] = 20,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0),
                ["Text"] = u18.Clan.name,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
            })
        }
        local v43 = u10.createElement
        local v44 = u6
        local v45 = {
            ["AutomaticSize"] = "Y",
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0)
        }
        local v46 = {
            u10.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Left",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.1, 0)
            }),
            ["ClanTag"] = u10.createElement("TextLabel", {
                ["AutomaticSize"] = "XY",
                ["TextXAlignment"] = "Left",
                ["TextTransparency"] = 0.3,
                ["TextSize"] = 16,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0, 0),
                ["Text"] = "[" .. u18.Clan.tag .. "]",
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular)
            })
        }
        local v47 = u10.createElement
        local v48 = {
            ["AutomaticSize"] = "XY",
            ["TextXAlignment"] = "Left",
            ["TextTransparency"] = 0.3,
            ["TextSize"] = 16,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(0, 0)
        }
        local v49 = u18.Clan.extraData.clanLevel
        v48.Text = "Lv. " .. tostring(v49)
        v48.TextColor3 = u17.mcYellow
        v48.FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular)
        v46.ClanLevel = v47("TextLabel", v48)
        __set_list(v42, 2, {v43(v44, v45, v46)})
        v38.ClanIdentity = v39(v40, v41, v42)
        v34.ContentContainer = v35(v36, v37, v38)
        v31.Header = v32("Frame", v33, v34)
        local v50 = u10.createElement
        local v51 = u6
        local v52 = {
            ["Size"] = UDim2.fromScale(1, 0.8),
            ["Position"] = UDim2.fromScale(0, 0.2)
        }
        local v53 = {
            u10.createElement(u7, {
                ["Padding"] = {
                    ["Horizontal"] = 20,
                    ["Top"] = 20,
                    ["Bottom"] = 16
                }
            }),
            ["IntroductionContainer"] = u10.createElement(u6, {
                ["Size"] = UDim2.fromScale(1, 0.4)
            }, {
                u10.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0, 6)
                }),
                ["IntroductionTitle"] = u10.createElement("TextLabel", {
                    ["Text"] = "Introduction",
                    ["TextXAlignment"] = "Left",
                    ["TextSize"] = 14,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.new(1, 0, 0, 14),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
                }),
                ["ClanIntroduction"] = u10.createElement("TextLabel", {
                    ["TextXAlignment"] = "Left",
                    ["TextYAlignment"] = "Top",
                    ["TextSize"] = 14,
                    ["TextWrap"] = true,
                    ["TextTransparency"] = 0.2,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.new(1, 0, 1, -18),
                    ["Text"] = u18.Clan.desc,
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular)
                })
            })
        }
        local v54 = u10.createElement
        local v55 = u6
        local v56 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.15),
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Position"] = UDim2.fromScale(0.5, 1)
        }
        local v57 = {}
        local v58 = u10.createElement(u4, {
            ["Text"] = "VIEW",
            ["Size"] = UDim2.fromScale(0.3, 0.8),
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.fromScale(0, 0.5),
            ["BackgroundColor3"] = u17.backgroundSecondary,
            ["OnClick"] = v25
        })
        local v59 = u10.createElement
        local v60 = u4
        local v61 = {
            ["Size"] = UDim2.fromScale(0.4, 0.8),
            ["AnchorPoint"] = Vector2.new(1, 0.5),
            ["Position"] = UDim2.fromScale(1, 0.5),
            ["Text"] = v20,
            ["OnClick"] = v24
        }
        local v62
        if v22 then
            v62 = u17.Gray
        else
            v62 = nil
        end
        v61.BackgroundColor3 = v62
        v61.Disabled = v22
        __set_list(v57, 1, {v58, v59(v60, v61)})
        v53.Actions = v54(v55, v56, v57)
        v31.Body = v50(v51, v52, v53)
        v27.ClanInfoCard = v28(v29, v30, v31)
        return v26(v27)
    end)
}