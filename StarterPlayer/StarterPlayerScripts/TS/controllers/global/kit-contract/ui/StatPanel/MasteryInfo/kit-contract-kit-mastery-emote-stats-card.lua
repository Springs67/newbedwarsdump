local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-utils").KitContractUtils
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-tier").RankTier
local u13 = v1.import(script, script.Parent.Parent, "KitStats", "kit-contract-kit-stats-card-row").KitContractKitStatsCardRow
return {
    ["KitContractKitMasteryEmoteStatsCard"] = v7.new(u6)(function(p14, p15) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u6
            [3] = u8
            [4] = u3
            [5] = u9
            [6] = u5
            [7] = u11
            [8] = u12
            [9] = u13
            [10] = u4
        --]]
        local _ = p15.useState
        local v16 = u10.getKitMasteryTierData(p14.SelectedKit, p14.UserKitStatProfile)
        local v17 = {}
        for v18, v19 in p14 do
            v17[v18] = v19
        end
        v17.SelectedKit = nil
        v17.UserKitStatProfile = nil
        local v20 = {}
        for v21, v22 in v17 do
            v20[v21] = v22
        end
        local v23 = { u6.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.05, 0)
            }), u6.createElement("UIPadding", {
                ["PaddingRight"] = UDim.new(0.1, 0),
                ["PaddingLeft"] = UDim.new(0.1, 0),
                ["PaddingTop"] = UDim.new(0.05, 0),
                ["PaddingBottom"] = UDim.new(0.1, 0)
            }) }
        local v24 = #v23
        local v25 = {
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.24)
        }
        local v26 = { u6.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.1, 0)
            }), u6.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(1, 0.445),
                ["Text"] = u8[p14.SelectedKit].name .. " Mastery",
                ["TextColor3"] = u3.WHITE,
                ["Font"] = Enum.Font.SourceSansBold,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            }) }
        local v27 = #v26
        local v28 = {
            ["Size"] = UDim2.new(1, -8, 0.545, 0),
            ["BackgroundColor3"] = p14.BackgroundColor3 or u3.WHITE
        }
        local v29 = p14.BackgroundTransparency
        v28.BackgroundTransparency = v29 == nil and 0.65 or v29
        v28.LayoutOrder = 1
        local v30 = {
            u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 4)
            }),
            u6.createElement("UIPadding", {
                ["PaddingRight"] = UDim.new(0.025, 0),
                ["PaddingLeft"] = UDim.new(0.025, 0),
                ["PaddingTop"] = UDim.new(0.1, 0),
                ["PaddingBottom"] = UDim.new(0.1, 0)
            }),
            u6.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.075, 1),
                ["Position"] = UDim2.fromScale(0, 0.5),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Image"] = u9.STAR_SOLID
            }, { u6.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) }),
            u6.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["Text"] = "  Unlocked Mastery Rank",
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(0.6625, 1),
                ["Position"] = UDim2.fromScale(0.075, 0.5),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["TextColor3"] = u3.darken(u3.WHITE, 0.8),
                ["Font"] = Enum.Font.SourceSans,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            })
        }
        local v31 = #v30
        local v32 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.2625, 1),
            ["Position"] = UDim2.fromScale(1, 0.5),
            ["AnchorPoint"] = Vector2.new(1, 0.5)
        }
        local v33 = nil
        for v34, v35 in u5.values(u11) do
            local _ = v34 - 1
            local v36 = v35.tier
            local v37
            if v16 == nil then
                v37 = v16
            else
                v37 = v16.currentTierRank
            end
            if v37 == nil then
                v37 = u12.BRONZE
            end
            if v36 == v37 == true then
                v33 = v35
                break
            end
        end
        if v33 ~= nil then
            v33 = v33.image
        end
        if v33 == nil then
            v33 = nil
        end
        v32.Image = v33
        v30[v31 + 1] = u6.createElement("ImageLabel", v32, { u6.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        v26[v27 + 1] = u6.createElement("Frame", v28, v30)
        local v38
        if v16 == nil then
            v38 = v16
        else
            v38 = v16.nextTierNumber
        end
        local v39 = v38 ~= nil
        if v39 then
            local v40 = u6.createElement
            local v41 = u13
            local v42 = {
                ["StatTitle"] = "Next Tier Unlock",
                ["LayoutOrder"] = 1
            }
            local v43 = v16.nextTierNumber
            v42.StatValue = tostring(v43)
            v42.Size = UDim2.new(1, -8, 0.545, 0)
            v39 = v40(v41, v42)
        end
        if v39 then
            v26[v27 + 2] = v39
        end
        v23[v24 + 1] = u6.createElement(u4, v25, v26)
        return u6.createFragment({
            ["KitContractStatsCard"] = u6.createElement(u4, v20, v23)
        })
    end)
}