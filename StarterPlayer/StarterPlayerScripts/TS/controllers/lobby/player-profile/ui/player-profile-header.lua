local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DeviceUtil
local u6 = v3.Empty
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "achievements", "ui", "achievement-icon").AchievementIcon
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "badge", "badge-type").BadgeType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player-level", "player-level-util").PlayerLevelUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "user-input", "user-input-type").UserInputType
local u18 = v1.import(script, script.Parent.Parent.Parent, "title", "ui", "lobby-title").LobbyTitle
return {
    ["PlayerProfileHeader"] = v8.new(u7)(function(u19, p20) --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u13
            [3] = u17
            [4] = u12
            [5] = u16
            [6] = u7
            [7] = u5
            [8] = u4
            [9] = u15
            [10] = u10
            [11] = u18
            [12] = u2
            [13] = u11
            [14] = u9
            [15] = u6
        --]]
        local _ = p20.useState
        local v21 = u19.ProfileData
        if v21 ~= nil then
            v21 = v21.userId
        end
        local v22 = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(v21) .. "&w=150&h=150"
        local v23 = u19.ProfileData
        if v23 ~= nil then
            v23 = v23.level
        end
        local v24 = u19.ProfileData
        if v24 ~= nil then
            v24 = v24.equipped.selectedTitle
        end
        if v24 == nil then
            v24 = u14.NONE
        end
        local v25 = u19.ProfileData
        if v25 ~= nil then
            v25 = v25.name
        end
        local v26 = v25 == nil and "" or v25
        local v27 = u19.ProfileData
        if v27 ~= nil then
            v27 = v27.region
        end
        local v28 = u19.ProfileData
        if v28 ~= nil then
            v28 = v28.platform
        end
        local v29 = u19.ProfileData
        if v29 ~= nil then
            v29 = v29.equipped.featuredBadges[1]
        end
        local v30
        if v29 == u13.NONE then
            v30 = nil
        else
            v30 = u19.ProfileData
            if v30 ~= nil then
                v30 = v30.equipped.featuredBadges[1]
            end
        end
        local v31 = {
            [u17.PC] = u12.PC_ICON,
            [u17.GAMEPAD] = u12.GAMEPAD_ICON,
            [u17.MOBILE] = u12.MOBILE_ICON
        }
        local v32 = {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u16.backgroundSecondary
        }
        local v33 = u19.FrameProps
        if v33 then
            for v34, v35 in v33 do
                v32[v34] = v35
            end
        end
        local v36 = { u7.createElement("ImageLabel", {
                ["Image"] = "rbxassetid://71356717298935",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["ScaleType"] = Enum.ScaleType.Crop
            }) }
        local v37 = #v36
        local v38 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v39 = {
            u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Bottom,
                ["Padding"] = UDim.new(0.02, 0)
            }),
            ["AvatarImage"] = u7.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(0.2, 0.95),
                ["Image"] = v22,
                ["ScaleType"] = Enum.ScaleType.Fit
            }, { u7.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
        }
        local _ = #v39
        local v40 = {
            ["LayoutOrder"] = 1,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(u5.isSmallScreen() and 0.45 or 0.41, 1)
        }
        local v41 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local v42 = #v41
        local v43 = {
            ["LayoutOrder"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0, 0.25),
            ["AutomaticSize"] = Enum.AutomaticSize.X
        }
        local v44 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local v45 = #v44
        local v46
        if v23 == nil then
            v46 = false
        else
            v46 = u7.createFragment({
                ["Level"] = u7.createElement("Frame", {
                    ["LayoutOrder"] = 0,
                    ["BackgroundTransparency"] = 0.7,
                    ["Size"] = UDim2.fromScale(0, 1),
                    ["AutomaticSize"] = Enum.AutomaticSize.X,
                    ["BackgroundColor3"] = u4.BLACK
                }, { u7.createElement("UIPadding", {
                        ["PaddingLeft"] = UDim.new(0, 8),
                        ["PaddingRight"] = UDim.new(0, 8),
                        ["PaddingTop"] = UDim.new(0, 1)
                    }), u7.createElement("TextLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["TextScaled"] = true,
                        ["Text"] = "Lv. " .. tostring(v23),
                        ["TextColor3"] = u15.getLevelColor(v23),
                        ["AnchorPoint"] = Vector2.new(0, 0.5),
                        ["Position"] = UDim2.fromScale(0, 0.5),
                        ["Size"] = UDim2.fromScale(0, 0.7),
                        ["AutomaticSize"] = Enum.AutomaticSize.X,
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
                    }), u7.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0.4, 0)
                    }) })
            })
        end
        if v46 then
            v44[v45 + 1] = v46
        end
        local v47 = #v44
        local v48
        if v30 == nil then
            v48 = false
        else
            v48 = u7.createElement(u10, {
                ["Darkened"] = false,
                ["Simple"] = true,
                ["ShowTooltip"] = true,
                ["Id"] = v30
            })
        end
        if v48 then
            v44[v47 + 1] = v48
        end
        v41[v42 + 1] = u7.createElement("Frame", v43, v44)
        v41.Title = u7.createElement("Frame", {
            ["LayoutOrder"] = 1,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, u5.isSmallScreen() and 0.25 or 0.17),
            ["Visible"] = v24 ~= u14.NONE
        }, { u7.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 5)
            }), u7.createElement(u18, {
                ["TitleType"] = v24,
                ["TextLabelProps"] = {
                    ["Size"] = UDim2.fromScale(0, 1),
                    ["AutomaticSize"] = Enum.AutomaticSize.X
                }
            }) })
        local v49 = {
            ["LayoutOrder"] = 2,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, u5.isSmallScreen() and 0.25 or 0.2)
        }
        local v50 = {
            u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 8)
            }),
            ["Name"] = u7.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["LayoutOrder"] = 0,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0, 1),
                ["AutomaticSize"] = Enum.AutomaticSize.X,
                ["Text"] = v26,
                ["TextColor3"] = u4.WHITE,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
            })
        }
        local _ = #v50
        local v51 = {}
        local v52
        if v28 then
            v52 = v31[v28]
        else
            v52 = nil
        end
        v51.Image = v52
        v51.Size = UDim2.fromScale(1, 1)
        v51.BackgroundTransparency = 1
        v51.ImageTransparency = 0.4
        v51.LayoutOrder = 1
        v51.ScaleType = Enum.ScaleType.Fit
        v51.Visible = v28 ~= nil
        v50.Platform = u7.createElement("ImageLabel", v51, { u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        v50.RegionIcon = u7.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["ImageTransparency"] = 0.4,
            ["LayoutOrder"] = 2,
            ["Image"] = u12.SERVER_ICON,
            ["Size"] = UDim2.fromScale(1, 1),
            ["ScaleType"] = Enum.ScaleType.Fit,
            ["Visible"] = v27 ~= nil
        }, { u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        v50.Region = u7.createElement("TextLabel", {
            ["TextScaled"] = true,
            ["TextTransparency"] = 0.4,
            ["LayoutOrder"] = 3,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0, 1),
            ["AutomaticSize"] = Enum.AutomaticSize.X,
            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
            ["Text"] = v27,
            ["TextColor3"] = u4.WHITE,
            ["Visible"] = v27 ~= nil
        })
        v41[v42 + 2] = u7.createElement("Frame", v49, v50)
        v39.PlayerInfo = u7.createElement("Frame", v40, v41)
        local v53 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.32, 0.9)
        }
        local v54 = {}
        local v55 = #v54
        local v56 = {
            ["BackgroundTransparency"] = 0.4,
            ["Size"] = UDim2.fromScale(0.9, u5.isSmallScreen() and 0.66 or 0.6),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["BackgroundColor3"] = u4.BLACK
        }
        local v57 = u19.ProfileData
        if v57 ~= nil then
            v57 = v57.clan
        end
        v56.Visible = v57 ~= nil
        local v58 = {}
        local v59 = #v58
        local v60 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v61 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local _ = #v61
        local v62 = {}
        local v63 = u19.ProfileData
        if v63 ~= nil then
            v63 = v63.clan
            if v63 ~= nil then
                v63 = v63.image
            end
        end
        v62.Image = v63
        v62.Size = UDim2.fromScale(0.5, 0.9)
        v62.ScaleType = Enum.ScaleType.Fit
        v62.BackgroundTransparency = 1
        v62.LayoutOrder = 0
        v61.ClanIcon = u7.createElement("ImageLabel", v62, { u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        local v64 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.49, 0.45)
        }
        local v65 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.1, 0)
            }) }
        local _ = #v65
        local v66 = {
            ["Size"] = UDim2.fromScale(1, 0.5)
        }
        local v67 = u19.ProfileData
        if v67 ~= nil then
            v67 = v67.clan
            if v67 ~= nil then
                v67 = v67.name
            end
        end
        v66.Text = v67
        v66.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        v66.TextColor3 = u16.textPrimary
        v66.TextScaled = true
        v66.TextXAlignment = Enum.TextXAlignment.Left
        v66.BackgroundTransparency = 1
        v66.LayoutOrder = 0
        v65.ClanName = u7.createElement("TextLabel", v66)
        local v68 = {
            ["Size"] = UDim2.fromScale(1, 0.5)
        }
        local v69 = u19.ProfileData
        if v69 ~= nil then
            v69 = v69.clan
            if v69 ~= nil then
                v69 = v69.tag
            end
        end
        v68.Text = "[" .. tostring(v69) .. "]"
        v68.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        v68.TextColor3 = u16.textSecondary
        v68.TextScaled = true
        v68.TextXAlignment = Enum.TextXAlignment.Left
        v68.BackgroundTransparency = 1
        v68.LayoutOrder = 1
        v65.ClanTag = u7.createElement("TextLabel", v68)
        v61.ClanInfo = u7.createElement("Frame", v64, v65)
        v58[v59 + 1] = u7.createElement("Frame", v60, v61)
        local v73 = {
            ["Size"] = UDim2.fromScale(0.28, 0.28),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 5),
            ["Image"] = u12.EYE_SOLID,
            ["BackgroundTransparency"] = 1,
            ["ScaleType"] = Enum.ScaleType.Fit,
            ["ImageTransparency"] = 0.4,
            [u7.Event.Activated] = function() --[[ Line: 400 ]]
                --[[
                Upvalues:
                    [1] = u19
                    [2] = u2
                    [3] = u11
                --]]
                local v70 = u19.ProfileData
                if v70 ~= nil then
                    v70 = v70.clan
                end
                if v70 then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u11.CLAN_PROFILE, {
                        ["ClanId"] = u19.ProfileData.clan.id
                    })
                end
            end,
            [u7.Event.MouseEnter] = function(p71) --[[ Line: 411 ]]
                --[[
                Upvalues:
                    [1] = u9
                --]]
                u9:Create(p71, TweenInfo.new(0.15), {
                    ["ImageTransparency"] = 0.2
                }):Play()
            end,
            [u7.Event.MouseLeave] = function(p72) --[[ Line: 416 ]]
                --[[
                Upvalues:
                    [1] = u9
                --]]
                u9:Create(p72, TweenInfo.new(0.15), {
                    ["ImageTransparency"] = 0.4
                }):Play()
            end
        }
        v58.ClanViewButton = u7.createElement("ImageButton", v73)
        v58[v59 + 2] = u7.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.2, 0)
        })
        v54[v55 + 1] = u7.createElement("Frame", v56, v58)
        v39.Clan = u7.createElement("Frame", v53, v54)
        v36[v37 + 1] = u7.createElement(u6, v38, v39)
        return u7.createElement("Frame", v32, v36)
    end)
}