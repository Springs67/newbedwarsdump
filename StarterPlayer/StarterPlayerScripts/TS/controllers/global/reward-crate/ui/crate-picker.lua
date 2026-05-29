local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoSizedText
local u5 = v3.ButtonComponent
local u6 = v3.ColorUtil
local u7 = v3.DarkBackground
local u8 = v3.DeviceUtil
local u9 = v3.Empty
local u10 = v3.IconButton
local u11 = v3.Padding
local u12 = v3.ScaleComponent
local u13 = v3.SlideIn
local u14 = v3.SoundManager
local u15 = v3.UILayers
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v19 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v20 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u22 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local v23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-type")
local u24 = v23.ClanUpgradeTier
local u25 = v23.ClanUpgradeType
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-type-meta").getConsumableMeta
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableCategory
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-constants").CrateConstants
local v30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-meta")
local u31 = v30.AltarUpgradeTier
local u32 = v30.CrateMeta
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u35 = v1.import(script, script.Parent, "crate-picker-crate-list").CratePickerCrateList
local u36 = v1.import(script, script.Parent, "crate-picker-rarity-probabilities").CratePickerRarityProbabilities
local u37 = v1.import(script, script.Parent, "crate-picker-reward-tile").CratePickerRewardTile
local u38 = Color3.fromHex("16ADED")
local v111 = v19.new(u18)(function(u39, p40) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u31
        [2] = u14
        [3] = u33
        [4] = u16
        [5] = u21
        [6] = u25
        [7] = u24
        [8] = u2
        [9] = u29
        [10] = u22
        [11] = u34
        [12] = u15
        [13] = u8
        [14] = u18
        [15] = u7
        [16] = u12
        [17] = u11
        [18] = u4
        [19] = u6
        [20] = u10
        [21] = u28
        [22] = u32
        [23] = u36
        [24] = u37
        [25] = u5
        [26] = u38
        [27] = u9
        [28] = u17
        [29] = u35
        [30] = u13
    --]]
    local v41 = p40.useState
    local v42 = p40.useEffect
    local u43, v44 = v41(nil)
    local v45, u46 = v41(u31.TIER_0)
    local v47 = UDim2.fromOffset(1050, 540)
    v42(function() --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u33
            [3] = u16
            [4] = u21
            [5] = u25
            [6] = u24
            [7] = u46
            [8] = u31
        --]]
        u14:playSound(u33.UI_OPEN_2)
        u16.Controllers.ClanController:getMyClanProfileData():andThen(function() --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u25
                [3] = u16
                [4] = u24
                [5] = u46
                [6] = u31
            --]]
            local v48 = u21:getState().Clans.myClan
            if v48 ~= nil then
                v48 = v48.upgrades[u25.CRATE_ALTAR]
            end
            if u16.Controllers.ClanHqLobby:isClanHq() then
                if v48 == u24.CRATE_ALTAR_1 then
                    u46(u31.TIER_1)
                    return
                elseif v48 == u24.CRATE_ALTAR_2 then
                    u46(u31.TIER_2)
                    return
                elseif v48 == u24.CRATE_ALTAR_3 then
                    u46(u31.TIER_3)
                end
            else
                return nil
            end
        end)
        if u21:getState().Clans.myClan then
            u16.Controllers.ClanShopController:requestClanShopData()
        end
    end, {})
    local function v49() --[[ Line: 82 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u14
            [3] = u33
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("CratePicker")
        u14:playSound(u33.UI_CLOSE_2)
    end
    local function u53(p50) --[[ Line: 86 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u29
            [3] = u2
            [4] = u43
            [5] = u16
            [6] = u39
            [7] = u14
            [8] = u33
        --]]
        if p50 == nil then
            p50 = false
        end
        local v51
        if p50 then
            local v52 = u21:getState().Clans.clanContributionShop
            if v52 ~= nil then
                v52 = v52.clanContributionCoins
            end
            v51 = (v52 == nil and 0 or v52) < u29.CRATE_UPGRADE_USAGE_COST
        else
            v51 = p50
        end
        if v51 then
            u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                ["message"] = "Not enough clan contribution points available"
            })
            return nil
        end
        if u43 then
            u16.Controllers.CrateAltarController:pickCrate(u43, u39.CrateAltarId, p50)
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("CratePicker")
            u14:playSound(u33.UI_CLOSE_2)
        end
    end
    local function v62() --[[ Line: 113 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u29
            [3] = u14
            [4] = u33
            [5] = u2
            [6] = u22
            [7] = u34
            [8] = u53
            [9] = u15
        --]]
        local v54 = u21:getState().Clans.clanContributionShop
        if v54 ~= nil then
            v54 = v54.clanContributionCoins
        end
        local v55 = (v54 == nil and 0 or v54) > u29.CRATE_UPGRADE_USAGE_COST
        u14:playSound(u33.UI_OPEN)
        local v56 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
        local v57 = u22.CONFIRMATION_MODAL
        local v58 = {
            ["Title"] = "Purchase crate upgrade?"
        }
        local v59 = u29.CRATE_UPGRADE_USAGE_COST
        v58.Body = "Are you sure you want to purchase the crate upgrade for <b>" .. tostring(v59) .. "</b> clan contribution points?"
        local v60 = {
            ["Text"] = v55 and "Purchase" or "Can\'t Afford"
        }
        local v61
        if v55 then
            v61 = u34.backgroundSuccess
        else
            v61 = u34.backgroundError
        end
        v60.BackgroundColor3 = v61
        v58.PrimaryBtnProps = v60
        v58.SecondaryBtnProps = {
            ["Text"] = "Cancel"
        }
        function v58.OnPrimaryBtnClick() --[[ Line: 134 ]]
            --[[
            Upvalues:
                [1] = u53
            --]]
            u53(true)
        end
        function v58.OnSecondaryBtnClick() --[[ Line: 137 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u15
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u15.OVERLAY)
        end
        v56:openApp(v57, v58)
    end
    local v63 = {
        ["DisplayOrder"] = 20,
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = u8.isSmallScreen()
    }
    local v64 = {}
    local v65 = {
        ["AppId"] = "CratePicker",
        ["ImageButtonProps"] = {
            ["ZIndex"] = 0
        },
        ["OnClick"] = function() --[[ Name: OnClick, Line 153 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u33
            --]]
            u14:playSound(u33.UI_CLOSE_2)
            return true
        end
    }
    __set_list(v64, 1, {u18.createElement(u7, v65)})
    local v66 = #v64
    local v67 = {}
    local _ = #v67
    local v68 = {
        ["BorderSizePixel"] = 0,
        ["AutoButtonColor"] = false,
        ["Modal"] = true,
        ["Size"] = v47,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["BackgroundColor3"] = Color3.fromHex("#333333")
    }
    local v69 = {
        u18.createElement(u12, {
            ["PowerRelationshipPastMaximum"] = 0.6,
            ["MaximumSize"] = Vector2.new(v47.X.Offset * 1.2, v47.Y.Offset * 1.2),
            ["ScreenPadding"] = Vector2.new(30, 30)
        }),
        u18.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 10)
        }),
        u18.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["VerticalAlignment"] = "Top",
            ["HorizontalAlignment"] = "Left",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 0)
        }),
        ["Header"] = u18.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, 44),
            ["BackgroundColor3"] = Color3.fromRGB(29, 29, 29)
        }, { u18.createElement(u11, {
                ["Padding"] = {
                    ["Horizontal"] = 24,
                    ["Vertical"] = 8
                }
            }), u18.createElement(u4, {
                ["Text"] = "CHOOSE CRATE ",
                ["TextSize"] = 28,
                ["TextColor3"] = u6.WHITE,
                ["Position"] = UDim2.fromScale(0, 0.5),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["Font"] = Enum.Font.SourceSansBold
            }), u18.createElement(u10, {
                ["Size"] = UDim2.new(0, 28, 0, 28),
                ["Image"] = u28.X,
                ["Position"] = UDim2.fromScale(1, 0.5),
                ["AnchorPoint"] = Vector2.new(1, 0.5),
                ["OnClick"] = v49
            }) })
    }
    local _ = #v69
    local v70 = {
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.new(1, 0, 1, -44)
    }
    local v71 = { u18.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center",
            ["HorizontalAlignment"] = "Left",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 0)
        }) }
    local _ = #v71
    local v72 = {
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.new(0.3, 0, 1, 0)
    }
    local v73 = { u18.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 0)
        }) }
    local _ = #v73
    local v74 = {
        ["BorderSizePixel"] = 0,
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.new(1, 0, 0.25, 0),
        ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
    }
    local v75 = { u18.createElement("UIGradient", {
            ["Rotation"] = 70,
            ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 217, 17)), ColorSequenceKeypoint.new(1, Color3.fromRGB(199, 96, 0)) })
        }) }
    local v76 = #v75
    local v77
    if u43 then
        v77 = u18.createElement("ImageLabel", {
            ["ScaleType"] = "Fit",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.9),
            ["Image"] = u32[u43].image,
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        })
    else
        v77 = u43
    end
    if v77 then
        v75[v76 + 1] = v77
    end
    v73.ShowcaseContainer = u18.createElement("Frame", v74, v75)
    local v78 = {
        ["BorderSizePixel"] = 0,
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.new(1, 0, 0.75, 0),
        ["BackgroundColor3"] = Color3.fromRGB(39, 39, 39)
    }
    local v79 = {
        u18.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 8)
        }),
        u18.createElement(u11, {
            ["Padding"] = {
                ["Horizontal"] = 12,
                ["Vertical"] = 8
            }
        }),
        ["Title"] = u18.createElement("TextLabel", {
            ["Font"] = "Roboto",
            ["TextXAlignment"] = "Left",
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.07),
            ["Text"] = "<b>" .. (not u43 and "SELECT A CRATE" or string.upper(u32[u43].displayName)) .. "</b>",
            ["TextColor3"] = u6.WHITE
        }),
        ["Subtitle"] = u18.createElement("TextLabel", {
            ["Text"] = "<b>PROBABILITIES</b>",
            ["Font"] = "Roboto",
            ["TextXAlignment"] = "Left",
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["TextTransparency"] = 0.3,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.04),
            ["TextColor3"] = u6.WHITE
        })
    }
    local v80 = #v79
    local v81
    if u43 then
        v81 = u18.createElement(u36, {
            ["selectedCrate"] = u43
        })
    else
        v81 = u43
    end
    if v81 then
        v79[v80 + 1] = v81
    end
    local v82 = #v79
    v79.Subtitle2 = u18.createElement("TextLabel", {
        ["Text"] = "<b>REWARDS</b>",
        ["Font"] = "Roboto",
        ["TextXAlignment"] = "Left",
        ["RichText"] = true,
        ["TextScaled"] = true,
        ["TextTransparency"] = 0.3,
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 4,
        ["Size"] = UDim2.fromScale(1, 0.04),
        ["TextColor3"] = u6.WHITE
    })
    local v83
    if u43 then
        local v84 = u32[u43].items
        table.sort(v84, function(p85, p86) --[[ Line: 334 ]]
            return string.lower(p85.itemType) < string.lower(p86.itemType)
        end)
        table.sort(v84, function(p87, p88) --[[ Line: 338 ]]
            return p87.rarity < p88.rarity
        end)
        local v89 = table.create(#v84)
        for v90, v91 in v84 do
            local _ = v90 - 1
            v89[v90] = u18.createElement(u37, {
                ["CrateEntry"] = v91
            })
        end
        local v92 = {
            ["BackgroundTransparency"] = 1,
            ["ScrollBarThickness"] = 4,
            ["LayoutOrder"] = 5,
            ["Size"] = UDim2.fromScale(1, 0.4),
            ["ScrollingDirection"] = Enum.ScrollingDirection.Y
        }
        local v93 = UDim2.new
        local v94 = #u32[u43].items / 4
        v92.CanvasSize = v93(1, 0, 0, math.ceil(v94) * 72)
        local v95 = { u18.createElement("UIGridLayout", {
                ["FillDirectionMaxCells"] = 4,
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Top",
                ["HorizontalAlignment"] = "Left",
                ["CellSize"] = UDim2.fromOffset(67, 67),
                ["CellPadding"] = UDim2.fromOffset(5, 5)
            }) }
        local v96 = #v95
        for v97, v98 in v89 do
            v95[v96 + v97] = v98
        end
        v83 = u18.createFragment({
            ["CrateRewardsList"] = u18.createElement("ScrollingFrame", v92, v95)
        })
    else
        v83 = u43
    end
    if v83 then
        v79[v82 + 1] = v83
    end
    local v99 = #v79
    local v100
    if u43 then
        local v101 = {
            ["LayoutOrder"] = 5,
            ["Size"] = UDim2.fromScale(1, 0.12)
        }
        local v102 = { u18.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0),
                ["HorizontalFlex"] = Enum.UIFlexAlignment.SpaceBetween
            }), u18.createElement(u5, {
                ["Text"] = "OPEN",
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(v45 == u31.TIER_0 and 1 or 0.45, 0.95),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["BackgroundColor3"] = u34.backgroundSuccess,
                ["OnClick"] = function() --[[ Name: OnClick, Line 401 ]]
                    --[[
                    Upvalues:
                        [1] = u53
                    --]]
                    return u53()
                end
            }) }
        local v103 = #v102
        local v104
        if v45 == u31.TIER_0 then
            v104 = false
        else
            v104 = u18.createElement(u5, {
                ["Text"] = "UPGRADED OPEN",
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0.45, 0.95),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["BackgroundColor3"] = u38,
                ["OnClick"] = v62
            })
        end
        if v104 then
            v102[v103 + 1] = v104
        end
        v100 = u18.createFragment({
            ["ActionButtons"] = u18.createElement(u9, v101, v102)
        })
    else
        v100 = u43
    end
    if v100 then
        v79[v99 + 1] = v100
    end
    v73.ItemDetailsContainer = u18.createElement("Frame", v78, v79)
    v71.SidePanel = u18.createElement(u9, v72, v73)
    local v105 = u18.createElement
    local v106 = u9
    local v107 = {
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.new(0.7, 0, 1, 0)
    }
    local v108 = {}
    local v109 = u18.createElement(u11, {
        ["Padding"] = {
            ["Horizontal"] = 28,
            ["Vertical"] = 28
        }
    })
    local v110
    if #u17.entries(u39.crates) == 0 then
        v110 = u18.createFragment({
            ["DefaultMessage"] = u18.createElement("TextLabel", {
                ["Text"] = "<b>YOU DON\'T OWN ANY CRATES</b>",
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Center",
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["TextTransparency"] = 0.3,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 4,
                ["Size"] = UDim2.fromScale(0.6, 0.15),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["TextColor3"] = u6.WHITE
            })
        })
    else
        v110 = u18.createElement(u35, {
            ["crates"] = u39.crates,
            ["selectedCrate"] = u43,
            ["setSelectedCrate"] = v44
        })
    end
    __set_list(v108, 1, {v109, v110})
    v71.List = v105(v106, v107, v108)
    v69.Content = u18.createElement(u9, v70, v71)
    v67.Container = u18.createElement("ImageButton", v68, v69)
    v64[v66 + 1] = u18.createElement(u13, {}, v67)
    return u18.createElement("ScreenGui", v63, v64)
end)
return {
    ["CratePickerApp"] = v20.connect(function(p112, p113) --[[ Line: 465 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u26
            [3] = u27
        --]]
        local v114 = u17.entries(p112.Consumable.inventory)
        local function v119(p115, p116) --[[ Line: 467 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u27
            --]]
            local _ = p116[1]
            local v117 = p116[2]
            if u26(v117.consumable).category ~= u27.REWARD_CRATE then
                return p115
            end
            if not p115[v117.consumable] then
                p115[v117.consumable] = { v117 }
                return p115
            end
            local v118 = p115[v117.consumable]
            table.insert(v118, v117)
            return p115
        end
        local v120 = {}
        for v121 = 1, #v114 do
            v120 = v119(v120, v114[v121], v121 - 1, v114)
        end
        local v122 = {}
        for v123, v124 in p113 do
            v122[v123] = v124
        end
        v122.crates = v120
        return v122
    end)(v111)
}