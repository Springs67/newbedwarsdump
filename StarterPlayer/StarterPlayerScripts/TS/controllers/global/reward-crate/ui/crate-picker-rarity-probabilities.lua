local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.StringUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-type")
local u12 = v11.ClanUpgradeTier
local u13 = v11.ClanUpgradeType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity").CrateItemRarity
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity-meta").getCrateItemRarityMeta
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-tier-types").CrateStarTierColors
local v18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-meta")
local u19 = v18.AltarUpgradeTier
local u20 = v18.CrateMeta
local u21 = Color3.fromHex("16ADED")
return {
    ["CratePickerRarityProbabilities"] = v9.new(u8)(function(u22, p23) --[[ Line: 23 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u19
            [3] = u7
            [4] = u15
            [5] = u6
            [6] = u10
            [7] = u13
            [8] = u12
            [9] = u20
            [10] = u16
            [11] = u17
            [12] = u14
            [13] = u4
            [14] = u5
            [15] = u3
            [16] = u21
        --]]
        local v24 = p23.useState
        local v25 = p23.useEffect
        if not u22.selectedCrate then
            return u8.createFragment()
        end
        local u26, u27 = v24(u19.TIER_0)
        local u28 = u7.values(u15)
        v25(function() --[[ Line: 31 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u10
                [3] = u13
                [4] = u12
                [5] = u19
                [6] = u27
            --]]
            if not u6.Controllers.ClanHqLobby:isClanHq() then
                return nil
            end
            local v29 = u10:getState().Clans.myClan
            if v29 ~= nil then
                v29 = v29.upgrades[u13.CRATE_ALTAR]
            end
            local v30
            if v29 == u12.CRATE_ALTAR_3 then
                v30 = u19.TIER_3
            elseif v29 == u12.CRATE_ALTAR_2 then
                v30 = u19.TIER_2
            elseif v29 == u12.CRATE_ALTAR_1 then
                v30 = u19.TIER_1
            else
                v30 = u19.TIER_0
            end
            u27(v30)
        end, {})
        table.sort(u28)
        local function v47(p31) --[[ Line: 47 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u22
                [3] = u19
                [4] = u26
                [5] = u16
                [6] = u17
                [7] = u8
                [8] = u14
                [9] = u28
                [10] = u4
                [11] = u5
                [12] = u3
                [13] = u21
            --]]
            local v32 = u20[u22.selectedCrate].raritySettings[u19.TIER_0][p31]
            local v33 = u20[u22.selectedCrate].raritySettings[u26][p31]
            local v34 = u16(p31)
            local v35 = u17[v34.tier]
            local v36 = false
            local v37 = 0
            local v38 = {}
            while true do
                if v36 then
                    v37 = v37 + 1
                else
                    v36 = true
                end
                if v37 >= v34.stars then
                    local v39 = {
                        ["Size"] = UDim2.fromScale(1, 1 / #u28)
                    }
                    local v40 = {}
                    local _ = #v40
                    local v41 = {
                        ["Size"] = UDim2.fromScale(0.8, 1)
                    }
                    local v42 = { u8.createElement("UIListLayout", {
                            ["FillDirection"] = "Horizontal",
                            ["HorizontalAlignment"] = "Left",
                            ["Padding"] = UDim.new(0, 2)
                        }) }
                    local v43 = #v42
                    for v44, v45 in v38 do
                        v42[v43 + v44] = v45
                    end
                    v40.StarsList = u8.createElement(u4, v41, v42)
                    v40.ProbabilityValue = u8.createElement("TextLabel", {
                        ["Font"] = "Roboto",
                        ["TextXAlignment"] = "Right",
                        ["TextScaled"] = true,
                        ["RichText"] = true,
                        ["BackgroundTransparency"] = 1,
                        ["Position"] = UDim2.fromScale(1, 0.5),
                        ["AnchorPoint"] = Vector2.new(1, 0.5),
                        ["Size"] = UDim2.fromScale(0.2, 1),
                        ["Text"] = "<b>" .. u5.roundNumber(v32 * 100, 2) .. "%</b>" .. (u26 == u19.TIER_0 and "" or " -> <font color=\"" .. u3.richTextColor(u21) .. "\"><b>" .. u5.roundNumber(v33 * 100, 2) .. "%</b></font>"),
                        ["TextColor3"] = Color3.fromRGB(134, 255, 104)
                    }, { u8.createElement("UITextSizeConstraint", {
                            ["MaxTextSize"] = 14
                        }) })
                    return u8.createFragment({
                        ["ProbabilityWrapper"] = u8.createElement(u4, v39, v40)
                    })
                end
                local v46 = u8.createElement("ImageLabel", {
                    ["SizeConstraint"] = "RelativeYY",
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Image"] = u14.STAR_SOLID,
                    ["ImageColor3"] = v35
                }, { u8.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) })
                table.insert(v38, v46)
            end
        end
        local v48 = table.create(#u28)
        for v49, v50 in u28 do
            v48[v49] = v47(v50, v49 - 1, u28)
        end
        local v51 = {
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(1, 0.2)
        }
        local v52 = { u8.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 0.04)
            }) }
        local v53 = #v52
        for v54, v55 in v48 do
            v52[v53 + v54] = v55
        end
        return u8.createFragment({
            ["CrateProbabilities"] = u8.createElement(u4, v51, v52)
        })
    end)
}