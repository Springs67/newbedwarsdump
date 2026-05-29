local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.ColorUtil
local u5 = v2.Countdown
local u6 = v2.DeviceUtil
local u7 = v2.Empty
local u8 = v2.SoundManager
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-plating", "bed-plating-util").BedPlatingUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-team-upgrade", "bed-team-upgrade-type").BedTeamUpgrade
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-team-upgrade", "bed-team-upgrade-util").getBedTeamUpgradeDefinition
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-theme").TeamUpgradeTheme
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-util").TeamUpgradeUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v52 = v11.new(u10)(function(u21, p22) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u15
        [3] = u13
        [4] = u17
        [5] = u16
        [6] = u6
        [7] = u14
        [8] = u9
        [9] = u20
        [10] = u7
        [11] = u8
        [12] = u19
        [13] = u18
        [14] = u4
        [15] = u5
        [16] = u3
    --]]
    local v23 = p22.useState
    local v24 = p22.useEffect
    local v25 = u10.createRef()
    local v26 = u15(u21.BedTeamUpgrade)
    if not v26 then
        return u10.createFragment()
    end
    local v27, u28 = v23(nil)
    local v29 = v26.cost
    local u30 = u21.Purchased
    local v31 = u21.BedStatus == u13.BedStatus.BED_BROKEN
    local v32 = not u17.hasEnoughForBedTeamUpgrade(u21.ObservedInventory, u21.BedTeamUpgrade, u21.IsHomeBase)
    local u33 = true
    local v34 = ""
    local v35 = u16.success
    if u30 then
        v35 = u16.disabled
    elseif v31 then
        v35 = u16.disabled
        v34 = "Cannot Purchase"
        u33 = false
    elseif v32 then
        v34 = "Not Enough - " .. tostring(v29)
        v35 = u16.error
        u33 = false
    end
    v24(function() --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u21
            [3] = u14
            [4] = u9
            [5] = u28
        --]]
        if u6.isHoarceKat() then
            return nil
        end
        if u21.BedTeamUpgrade == u14.BED_SHIELD then
            u28((u9.Controllers.BedShieldUpgradeController:getLocalBedShieldTimer()))
        end
    end, { u21.Purchased })
    v24(function() --[[ Line: 60 ]] end, { v27 })
    local v36 = {
        [u10.Ref] = v25,
        ["BorderSizePixel"] = 0,
        ["BackgroundColor3"] = u20.backgroundPrimary
    }
    local v37 = u21.FrameProps
    if v37 then
        for v38, v39 in v37 do
            v36[v38] = v39
        end
    end
    local v40 = {
        u10.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.08, 0)
        }),
        u10.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Top",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 0)
        }),
        ["Upgrade Info"] = u10.createElement(u7, {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.65),
            ["Position"] = UDim2.fromScale(0, 0.05)
        }, {
            u10.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.015, 0),
                ["PaddingBottom"] = UDim.new(0.025, 0),
                ["PaddingLeft"] = UDim.new(0.05, 0),
                ["PaddingRight"] = UDim.new(0.05, 0)
            }),
            u10.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Left",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.08, 0)
            }),
            ["UpgradeIcon"] = u10.createElement("ImageLabel", {
                ["LayoutOrder"] = 1,
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["Selectable"] = true,
                ["Size"] = UDim2.fromScale(0.8, 1),
                ["Position"] = UDim2.fromScale(0.5, 0),
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["Image"] = v26.icon,
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                ["ScaleType"] = Enum.ScaleType.Fit
            }, { u10.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) }),
            ["Text Content"] = u10.createElement(u7, {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0.75, 0.9)
            }, {
                u10.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["HorizontalAlignment"] = "Left",
                    ["VerticalAlignment"] = "Center",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0, 0)
                }),
                u10.createElement("TextLabel", {
                    ["LayoutOrder"] = 1,
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["Text"] = "<b>" .. v26.name .. "</b>",
                    ["Size"] = UDim2.fromScale(1, 0.4),
                    ["BackgroundColor3"] = u20.backgroundTertiary,
                    ["Font"] = Enum.Font.Roboto,
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["TextXAlignment"] = Enum.TextXAlignment.Left
                }),
                ["Description"] = u10.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["TextWrapped"] = true,
                    ["TextTransparency"] = 0.22,
                    ["LayoutOrder"] = 2,
                    ["Text"] = v26.description,
                    ["Size"] = UDim2.fromScale(1, 0.6),
                    ["Font"] = Enum.Font.Roboto,
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["TextXAlignment"] = Enum.TextXAlignment.Left
                })
            })
        })
    }
    local _ = #v40
    local v41 = {
        ["LayoutOrder"] = 2,
        ["Selectable"] = true,
        ["Size"] = UDim2.fromScale(1, 0.35),
        ["Position"] = UDim2.fromScale(0, 0),
        ["AnchorPoint"] = Vector2.new(0, 0),
        ["BackgroundColor3"] = v35,
        ["BackgroundTransparency"] = u30 and 0.1 or 0,
        ["CornerRadius"] = UDim.new(0.15),
        ["OnClick"] = function() --[[ Name: OnClick, Line 168 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u19
                [3] = u33
                [4] = u30
                [5] = u21
            --]]
            u8:playSound(u19.UI_CLICK)
            if u33 and not u30 then
                u21.AttemptPurchase(u21.BedTeamUpgrade)
            end
        end
    }
    local v42 = { u10.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.2, 0)
        }) }
    local v43 = #v42
    local v44 = not u30
    if v44 then
        v44 = v32 or u33
    end
    if v44 then
        local v45 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
        }
        local v46 = u18(u17.TEAM_UPGRADE_RESOURCE).image
        v45.Image = v46 == nil and "" or v46
        v45.BackgroundTransparency = 1
        v45.LayoutOrder = 2
        v44 = u10.createElement("ImageLabel", v45, { u10.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
    end
    local v47 = {
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v48 = {}
    local v49 = u10.createElement("UIListLayout", {
        ["FillDirection"] = "Horizontal",
        ["HorizontalAlignment"] = "Center",
        ["VerticalAlignment"] = "Center",
        ["SortOrder"] = "LayoutOrder",
        ["Padding"] = UDim.new(0, 0)
    })
    local v50
    if u33 then
        if u30 then
            if v27 == 0 or (v27 ~= v27 or not v27) then
                v50 = u10.createElement("TextLabel", {
                    ["Text"] = "Bed Alarm Active",
                    ["AutomaticSize"] = "X",
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["TextWrapped"] = true,
                    ["TextTransparency"] = 0.3,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0.8, 0.7),
                    ["AnchorPoint"] = Vector2.new(0, 0),
                    ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Regular),
                    ["TextColor3"] = u4.WHITE,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextSize"] = u6.isSmallScreen() and 12 or 20
                })
            else
                v50 = u10.createElement(u5, {
                    ["UseOsClock"] = true,
                    ["OnCompleteText"] = "Bed Shield Expiring...",
                    ["DisableHideOnComplete"] = true,
                    ["EndTime"] = v27,
                    ["CountdownConfig"] = {
                        ["days"] = false,
                        ["hours"] = false,
                        ["minutes"] = true,
                        ["seconds"] = true,
                        ["disablePadding"] = false,
                        ["seperator"] = ":"
                    },
                    ["PreText"] = v27 - os.clock() > 0 and "Remaining Time: " or "",
                    ["TextLabel"] = {
                        ["TextTransparency"] = 0.22,
                        ["Size"] = UDim2.fromScale(0.8, 0.7),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["TextXAlignment"] = Enum.TextXAlignment.Center,
                        ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Regular),
                        ["TextColor3"] = u4.WHITE
                    }
                })
            end
        else
            v50 = u10.createElement("TextLabel", {
                ["AutomaticSize"] = "X",
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextWrapped"] = true,
                ["LayoutOrder"] = 1,
                ["Text"] = tostring(v29),
                ["Size"] = UDim2.fromScale(0.2, 1),
                ["AnchorPoint"] = Vector2.new(0, 0),
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = u4.WHITE,
                ["TextXAlignment"] = Enum.TextXAlignment.Right,
                ["TextSize"] = u6.isSmallScreen() and 12 or 20
            })
        end
    else
        v50 = u10.createElement("TextLabel", {
            ["AutomaticSize"] = "X",
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextWrapped"] = true,
            ["TextTransparency"] = 0.15,
            ["LayoutOrder"] = 1,
            ["Text"] = string.upper(v34),
            ["Size"] = UDim2.fromScale(0.5, 0.7),
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
            ["TextColor3"] = u4.WHITE,
            ["TextXAlignment"] = Enum.TextXAlignment.Right,
            ["TextSize"] = u6.isSmallScreen() and 12 or 20
        })
    end
    __set_list(v48, 1, {v49, v50})
    local v51 = #v48
    if v44 then
        v48[v51 + 1] = v44
    end
    v42[v43 + 1] = u10.createElement(u7, v47, v48)
    v40["Cost Bar"] = u10.createElement(u3, v41, v42)
    return u10.createFragment({
        [u21.BedTeamUpgrade .. "_Card"] = u10.createElement("Frame", v36, v40)
    })
end)
return {
    ["BedTeamUpgradeCard"] = v12.connect(function(_, p53) --[[ Line: 293 ]]
        local v54 = {}
        for v55, v56 in p53 do
            v54[v55] = v56
        end
        return v54
    end)(v52)
}