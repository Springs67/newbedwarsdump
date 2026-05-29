local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bed-coin", "bed-coin-constants").BedCoinConstants
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["MatchEndCurrencyEarned"] = v4.new(u3)(function(p7, p8) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u5
            [3] = u3
            [4] = u2
        --]]
        local _ = p8.useState
        local _ = p8.useEffect
        local v9 = {}
        local v10 = p7.BedCoinsEarned
        if v10 then
            local v11 = {
                ["hasCap"] = true,
                ["icon"] = u6.BED_COIN_ICON,
                ["earned"] = v10.matchAmountEarned,
                ["capProgress"] = v10.dailyAmountEarned,
                ["capMax"] = u5.DAILY_CURRENCY_CAP,
                ["reachedTotalCap"] = v10.reachedTotalCap
            }
            table.insert(v9, v11)
        end
        local v12 = p7.ClanContributionEarned
        if v12 ~= 0 and (v12 == v12 and v12) then
            local v13 = {
                ["icon"] = u6.CLAN_CP_COIN,
                ["earned"] = v12
            }
            table.insert(v9, v13)
        end
        local v14 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1
        }
        local v15 = p7.FrameProps
        if v15 then
            for v16, v17 in v15 do
                v14[v16] = v17
            end
        end
        local function v37(p18) --[[ Line: 44 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u2
            --]]
            local v19 = {
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(1, 1)
            }
            local v20 = { u3.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 3.5
                }), u3.createElement("UISizeConstraint", {
                    ["MaxSize"] = Vector2.new((1 / 0), 50)
                }), u3.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.3, 0.9),
                    ["AnchorPoint"] = Vector2.new(0, 0.5),
                    ["Position"] = UDim2.fromScale(0, 0.5),
                    ["ScaleType"] = Enum.ScaleType.Fit,
                    ["Image"] = p18.icon
                }) }
            local v21 = #v20
            local v22 = {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.68, 1),
                ["AnchorPoint"] = Vector2.new(1, 0),
                ["Position"] = UDim2.fromScale(1, 0)
            }
            local v23 = {}
            local v24 = u3.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            })
            local v25 = u3.createElement
            local v26 = {
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(1, 0.6)
            }
            local v27 = p18.earned
            v26.Text = "+" .. tostring(v27)
            v26.TextXAlignment = Enum.TextXAlignment.Left
            v26.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
            v26.TextColor3 = u2.WHITE
            __set_list(v23, 1, {v24, v25("TextLabel", v26)})
            local v28 = #v23
            local v29 = p18.hasCap
            if v29 then
                local v30 = u3.createElement
                local v31 = "TextLabel"
                local v32 = {
                    ["TextTransparency"] = 0.5,
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0.4)
                }
                local v33
                if p18.reachedTotalCap then
                    v33 = "MAX"
                else
                    local v34 = p18.capProgress
                    local v35 = tostring(v34)
                    local v36 = p18.capMax
                    v33 = "(" .. v35 .. "/" .. tostring(v36) .. ")"
                end
                v32.Text = v33
                v32.TextXAlignment = Enum.TextXAlignment.Left
                v32.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                v32.TextColor3 = u2.WHITE
                v29 = v30(v31, v32)
            end
            if v29 then
                v23[v28 + 1] = v29
            end
            v20[v21 + 1] = u3.createElement("Frame", v22, v23)
            return u3.createElement("Frame", v19, v20)
        end
        local v38 = table.create(#v9)
        for v39, v40 in v9 do
            v38[v39] = v37(v40, v39 - 1, v9)
        end
        local v41 = { u3.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["Padding"] = UDim.new(0.02, 0),
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }) }
        local v42 = #v41
        for v43, v44 in v38 do
            v41[v42 + v43] = v44
        end
        return u3.createElement("Frame", v14, v41)
    end)
}