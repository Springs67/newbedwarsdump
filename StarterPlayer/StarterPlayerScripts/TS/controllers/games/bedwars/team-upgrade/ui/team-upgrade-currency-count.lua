local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.DeviceUtil
local u5 = v2.TooltipContainer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.RunService
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "labelled-text", "labelled-text").LabelledText
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "studio-config-override").StudioQueueType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-util").TeamUpgradeUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["TeamUpgradeCurrencyCount"] = v8.new(u7)(function(p19, p20) --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u11
            [3] = u13
            [4] = u6
            [5] = u14
            [6] = u7
            [7] = u18
            [8] = u4
            [9] = u16
            [10] = u10
            [11] = u5
            [12] = u3
            [13] = u12
            [14] = u17
        --]]
        local _ = p20.useState
        local v21 = u15.getPlayerResourceAmount(p19.ObservedInventory)
        local v22 = u15.getTeamResourceAmount(p19.ObservedInventory)
        local v23
        if u11:IsStudio() then
            v23 = u13
        else
            v23 = u6.Controllers.MatchController:getQueueType()
        end
        local v24 = p19.IsHomeBase
        if v24 then
            v24 = v23 ~= u14.BEDWARS_OG_TO4
        end
        local v25 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["Position"] = UDim2.fromScale(0, 0),
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v26 = p19.FrameProps
        if v26 then
            for v27, v28 in v26 do
                v25[v27] = v28
            end
        end
        local v29 = { u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }) }
        local v30 = #v29
        local v31 = {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Left",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.05, 0)
        }
        local v32 = p19.ListProps
        if v32 then
            for v33, v34 in v32 do
                v31[v33] = v34
            end
        end
        v29[v30 + 1] = u7.createElement("UIListLayout", v31)
        local v35 = u7.createElement
        local v36 = "Frame"
        local v37 = {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.45, 1),
            ["BackgroundColor3"] = u18.backgroundTertiary
        }
        local v38 = {}
        local v39 = u7.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 4
        })
        local v40 = u7.createElement
        local v41 = "ImageLabel"
        local v42 = {
            ["ScaleType"] = "Fit",
            ["SizeConstraint"] = "RelativeYY",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1.3, 1.3),
            ["Position"] = UDim2.fromScale(-0.1, 0.45),
            ["AnchorPoint"] = Vector2.new(0, 0.5)
        }
        local v43
        if u4.isHoarceKat() then
            v43 = u16.CLOSED_CHEST_RENDER
        else
            local v44 = u10.LocalPlayer.UserId
            v43 = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(v44) .. "&w=150&h=150"
        end
        v42.Image = v43
        __set_list(v38, 1, {v39, v40(v41, v42, { u7.createElement(u5, {}, { u7.createElement(u3, {
            ["Text"] = "Inventory",
            ["TextSize"] = 16,
            ["Font"] = Enum.Font.SourceSansBold,
            ["Limits"] = Vector2.new(300, 60)
        }) }) }), u7.createElement(u12, {
    ["TextScale"] = 0.7,
    ["Text"] = "<b>" .. tostring(v21) .. "</b>",
    ["Image"] = u17(p19.Currency).image,
    ["FrameProps"] = {
        ["LayoutOrder"] = 31,
        ["Size"] = UDim2.fromScale(0.75, 1),
        ["Position"] = UDim2.fromScale(1, 0),
        ["AnchorPoint"] = Vector2.new(1, 0)
    },
    ["ImageProps"] = {
        ["Size"] = UDim2.fromScale(1, 1),
        ["SizeConstraint"] = Enum.SizeConstraint.RelativeXY
    },
    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right
}), u7.createElement("UICorner", {
    ["CornerRadius"] = UDim.new(1, 0)
})})
        v29.InventoryCount = v35(v36, v37, v38)
        if v24 then
            local v45 = u7.createFragment
            local v46 = {}
            local v47 = u7.createElement
            local v48 = "Frame"
            local v49 = {
                ["BackgroundTransparency"] = 0,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(0.45, 1),
                ["BackgroundColor3"] = u18.backgroundTertiary
            }
            local v50 = {}
            local v51 = u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 4
            })
            local v52 = u7.createElement("ImageLabel", {
                ["ScaleType"] = "Fit",
                ["SizeConstraint"] = "RelativeYY",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1.7, 1.7),
                ["Position"] = UDim2.fromScale(-0.1, 0.5),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Image"] = u16.TEAM_CRATE_RENDER
            }, { u7.createElement(u5, {}, { u7.createElement(u3, {
                        ["Text"] = "Team Crate",
                        ["TextSize"] = 16,
                        ["Font"] = Enum.Font.SourceSansBold,
                        ["Limits"] = Vector2.new(300, 60)
                    }) }) })
            local v53
            if p19.IsHomeBase then
                v53 = u7.createElement(u12, {
                    ["TextScale"] = 0.7,
                    ["Text"] = "<b>" .. tostring(v22) .. "</b>",
                    ["Image"] = u17(p19.Currency).image,
                    ["FrameProps"] = {
                        ["LayoutOrder"] = 31,
                        ["Size"] = UDim2.fromScale(0.75, 1),
                        ["Position"] = UDim2.fromScale(1, 0),
                        ["AnchorPoint"] = Vector2.new(1, 0)
                    },
                    ["TextProps"] = {
                        ["TextXAlignment"] = Enum.TextXAlignment.Right
                    },
                    ["ImageProps"] = {
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["SizeConstraint"] = Enum.SizeConstraint.RelativeXY
                    },
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right
                })
            else
                v53 = u7.createElement("Frame", {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["LayoutOrder"] = 31,
                    ["Size"] = UDim2.fromScale(0.75, 1),
                    ["AnchorPoint"] = Vector2.new(1, 0),
                    ["Position"] = UDim2.fromScale(1, 0)
                }, { u7.createElement(u5, {}, { u7.createElement(u3, {
                            ["Text"] = "Enemy Base",
                            ["TextSize"] = 16,
                            ["Font"] = Enum.Font.SourceSansBold,
                            ["Limits"] = Vector2.new(300, 60),
                            ["TextColor3"] = Color3.fromRGB(252, 97, 97)
                        }), u7.createElement(u3, {
                            ["Text"] = "Can\'t use team crate here",
                            ["TextSize"] = 14,
                            ["Font"] = Enum.Font.SourceSans,
                            ["TextXAlignment"] = Enum.TextXAlignment.Left,
                            ["Limits"] = Vector2.new(300, 60),
                            ["TextColor3"] = Color3.fromRGB(191, 191, 191)
                        }) }), u7.createElement("ImageLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["BorderSizePixel"] = 0,
                        ["Size"] = UDim2.fromScale(0.7, 0.7),
                        ["Position"] = UDim2.fromScale(0.4, 0.5),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Image"] = u16.NOT_HOME_ICON
                    }), u7.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) })
            end
            __set_list(v50, 1, {v51, v52, v53, u7.createElement("UICorner", {
    ["CornerRadius"] = UDim.new(1, 0)
})})
            v46.TeamCrateCount = v47(v48, v49, v50)
            v24 = v45(v46)
        end
        if v24 then
            v29[v30 + 2] = v24
        end
        return u7.createFragment({
            ["TeamUpgradeCurrencyCount"] = u7.createElement("Frame", v25, v29)
        })
    end)
}