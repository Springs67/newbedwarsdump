local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-meta")
local u11 = v10.getTeamUpgradeDefinition
local u12 = v10.isAtMaxTeamUpgradeTier
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-util").TeamUpgradeUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u17 = v1.import(script, script.Parent, "team-upgrade-button").TeamUpgradeButton
local v74 = v8.new(u7)(function(u18, p19) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u11
        [3] = u6
        [4] = u12
        [5] = u16
        [6] = u14
        [7] = u3
        [8] = u4
        [9] = u15
        [10] = u13
        [11] = u5
        [12] = u17
    --]]
    local _ = p19.useState
    local _ = p19.useEffect
    local v20 = u7.createRef()
    local v21 = u11(u18.TeamUpgrade)
    if not v21 then
        return u7.createFragment()
    end
    local u22 = {}
    local v23 = #u22
    local v24 = u6.values(v21.tiers)
    table.move(v24, 1, #v24, v23 + 1, u22)
    local v25 = u18.CurrentTier + 1
    local v26 = u12(u18.CurrentTier, u18.TeamUpgrade) and 0 or v21.tiers[v25].cost
    local v27 = {
        [u7.Ref] = v20,
        ["BorderSizePixel"] = 0,
        ["BackgroundColor3"] = u16.backgroundPrimary
    }
    local v28 = u18.FrameProps
    if v28 then
        for v29, v30 in v28 do
            v27[v29] = v30
        end
    end
    local v31 = {
        u7.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.03, 0)
        }),
        ["Header"] = u7.createElement("Frame", {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.1),
            ["BackgroundColor3"] = u16.backgroundTertiary
        }, { u7.createElement("TextLabel", {
                ["LayoutOrder"] = 1,
                ["BackgroundTransparency"] = 1,
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["Text"] = "<b>" .. v21.name .. "</b>",
                ["Size"] = UDim2.fromScale(1, 0.75),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["BackgroundColor3"] = u16.backgroundTertiary,
                ["Font"] = Enum.Font.Roboto,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextXAlignment"] = Enum.TextXAlignment.Center
            }, { u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.15, 0)
                }) }) })
    }
    local _ = #v31
    local v32 = {
        ["Size"] = UDim2.fromScale(1, 0.825),
        ["Position"] = UDim2.fromScale(0, 0.15000000000000002)
    }
    local v33 = {
        u7.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0.015, 0),
            ["PaddingBottom"] = UDim.new(0.025, 0),
            ["PaddingLeft"] = UDim.new(0.05, 0),
            ["PaddingRight"] = UDim.new(0.05, 0)
        }),
        ["UpgradeIcon"] = u7.createElement("ImageLabel", {
            ["LayoutOrder"] = 2,
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Selectable"] = false,
            ["Size"] = UDim2.fromScale(1, 0.25),
            ["Position"] = UDim2.fromScale(0.5, 0),
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Image"] = v21.icon,
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
        }, { u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
    }
    local _ = #v33
    local function v56(p34, p35) --[[ Line: 110 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u7
            [3] = u22
            [4] = u16
            [5] = u14
            [6] = u3
            [7] = u4
        --]]
        local v36 = p35 + 1
        local v37 = v36 <= u18.CurrentTier
        local v38 = u18.CurrentTier == v36
        local v39 = { "545791", "6367ac", "6f73b9" }
        local v40 = u7.createFragment
        local v41 = {}
        local v42 = "DescriptionTier_" .. tostring(v36)
        local v43 = u7.createElement
        local v44 = "Frame"
        local v45 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0
        }
        local v46 = UDim2.fromScale
        local v47 = 1 / (#u22 + 1)
        v45.Size = v46(1, (math.min(v47, 0.175)))
        local v48 = {}
        local v49
        if v37 then
            v49 = u7.createFragment({
                ["UnlockedIndicator"] = u7.createElement("Frame", {
                    ["BorderSizePixel"] = 0,
                    ["ZIndex"] = 2,
                    ["Size"] = UDim2.fromScale(0.025, 1),
                    ["BackgroundColor3"] = u16.backgroundSuccess
                })
            })
        else
            v49 = u7.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["SizeConstraint"] = "RelativeYY",
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 2,
                ["Size"] = UDim2.fromScale(1, 0.45),
                ["Position"] = UDim2.fromScale(0, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Image"] = u14.LOCK_ART
            }, { u7.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
        end
        local v50 = u7.createElement
        local v51 = "TextLabel"
        local v52 = {
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Text"] = "T" .. tostring(v36) .. ": " .. p34.description,
            ["BackgroundColor3"] = Color3.fromHex(v39[p35 % #v39 + 1]),
            ["BorderColor3"] = u16.backgroundTertiary
        }
        local v53 = Font.fromName
        local v54 = "Roboto"
        local v55
        if v38 then
            v55 = Enum.FontWeight.Bold
        else
            v55 = Enum.FontWeight.Regular
        end
        v52.FontFace = v53(v54, v55)
        v52.TextColor3 = u3.WHITE
        v52.TextTransparency = v37 and 0 or (v38 and 0.2 or 0.4)
        v52.TextXAlignment = Enum.TextXAlignment.Center
        __set_list(v48, 1, {v49, v50(v51, v52, { u7.createElement("UITextSizeConstraint", {
        ["MaxTextSize"] = u4.isSmallScreen() and 14 or 28
    }), u7.createElement("UIPadding", {
        ["PaddingLeft"] = UDim.new(0.1, 0),
        ["PaddingRight"] = UDim.new(0.1, 0),
        ["PaddingTop"] = UDim.new(0.05, 0),
        ["PaddingBottom"] = UDim.new(0.05, 0)
    }) })})
        v41[v42] = v43(v44, v45, v48)
        return v40(v41)
    end
    local v57 = table.create(#u22)
    for v58, v59 in u22 do
        v57[v58] = v56(v59, v58 - 1, u22)
    end
    local v60 = {
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(1, 0.65),
        ["Position"] = UDim2.fromScale(0.5, 0.3),
        ["AnchorPoint"] = Vector2.new(0.5, 0)
    }
    local v61 = { u7.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Top",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 0)
        }) }
    local v62 = #v61
    for v63, v64 in v57 do
        v61[v62 + v63] = v64
    end
    v33["Tier Descriptions"] = u7.createElement("Frame", v60, v61)
    local v65
    if v26 == nil then
        v65 = false
    else
        v65 = v26 ~= 0
    end
    if v65 then
        local v66 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(1, 0.35),
            ["Position"] = UDim2.fromScale(0, 0),
            ["AnchorPoint"] = Vector2.new(0, 0)
        }
        local v67 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 0)
            }), u7.createElement("TextLabel", {
                ["AutomaticSize"] = "X",
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextWrapped"] = true,
                ["TextTransparency"] = 0.3,
                ["LayoutOrder"] = 0,
                ["Text"] = tostring(v26),
                ["Size"] = UDim2.fromScale(0, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["Position"] = UDim2.fromScale(0.5, 0),
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = u3.WHITE,
                ["TextXAlignment"] = Enum.TextXAlignment.Right,
                ["TextSize"] = u4.isSmallScreen() and 12 or 20
            }) }
        local v68 = #v67
        local v69 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
        }
        local v70 = u15(u13.TEAM_UPGRADE_RESOURCE).image
        v69.Image = v70 == nil and "" or v70
        v69.BackgroundTransparency = 1
        v69.ScaleType = "Fit"
        v69.LayoutOrder = 1
        v67[v68 + 1] = u7.createElement("ImageLabel", v69)
        v65 = u7.createFragment({
            ["Cost Info"] = u7.createElement(u5, v66, v67)
        })
    end
    local v71 = {
        ["Size"] = UDim2.fromScale(1, u4.isSmallScreen() and 0.275 or 0.245),
        ["Position"] = UDim2.fromScale(0, 1),
        ["AnchorPoint"] = Vector2.new(0, 1)
    }
    local v72 = {}
    local v73 = #v72
    if v65 then
        v72[v73 + 1] = v65
    end
    local _ = #v72
    v72["Purchase Button"] = u7.createElement(u17, {
        ["FrameProps"] = {
            ["LayoutOrder"] = 4,
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.55),
            ["Position"] = UDim2.fromScale(0, 1),
            ["AnchorPoint"] = Vector2.new(0, 1)
        },
        ["Purchased"] = function() --[[ Name: Purchased, Line 269 ]]
            --[[
            Upvalues:
                [1] = u18
            --]]
            u18.Selected(u18.TeamUpgrade)
        end,
        ["TeamUpgrade"] = u18.TeamUpgrade,
        ["CurrentTier"] = u18.CurrentTier,
        ["ObservedInventory"] = u18.ObservedInventory,
        ["IsHomeBase"] = u18.IsHomeBase
    })
    v33.PurchaseSection = u7.createElement(u5, v71, v72)
    v31.Content = u7.createElement(u5, v32, v33)
    return u7.createFragment({
        [u18.TeamUpgrade .. "_Card"] = u7.createElement("Frame", v27, v31)
    })
end)
return {
    ["TeamUpgradeCard"] = v9.connect(function(_, p75) --[[ Line: 284 ]]
        local v76 = {}
        for v77, v78 in p75 do
            v76[v77] = v78
        end
        return v76
    end)(v74)
}