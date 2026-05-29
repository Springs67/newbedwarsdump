local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "blood-assassin", "blood-upgrade").BloodUpgrade
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "blood-assassin", "blood-upgrade-meta").BloodUpgradeMeta
return {
    ["BloodAssassinLearningList"] = v5.new(u4)(function(p8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u6
            [3] = u7
            [4] = u2
            [5] = u4
        --]]
        local _ = p9.useState
        local v10 = false
        local v11 = 1
        local v12 = {}
        while true do
            if v10 then
                v11 = v11 + 1
            else
                v10 = true
            end
            if v11 > #u3.values(u6) then
                local v13 = {}
                local v14 = #v13
                local function v22(p15, p16) --[[ Line: 44 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u4
                    --]]
                    local v17 = {
                        ["BackgroundTransparency"] = 1,
                        ["TextScaled"] = true,
                        ["Text"] = string.upper(p15.title),
                        ["LayoutOrder"] = p16,
                        ["Size"] = UDim2.fromScale(1, 0.08816705336426914),
                        ["TextXAlignment"] = Enum.TextXAlignment.Left,
                        ["Font"] = Enum.Font.ArialBold
                    }
                    local v18
                    if p15.color then
                        v18 = u2.WHITE
                    else
                        v18 = u2.hexColor(13158600)
                    end
                    v17.TextColor3 = v18
                    local v19 = {}
                    local v20 = #v19
                    local v21
                    if p15.color == nil then
                        v21 = false
                    else
                        v21 = u4.createElement("UIGradient", {
                            ["Rotation"] = -88,
                            ["Color"] = p15.color
                        })
                    end
                    if v21 then
                        v19[v20 + 1] = v21
                    end
                    return u4.createElement("TextLabel", v17, v19)
                end
                local v23 = table.create(#v12)
                for v24, v25 in v12 do
                    v23[v24] = v22(v25, v24 - 1, v12)
                end
                local v26 = {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.6666666666666666, 0.9526881720430107),
                    ["Position"] = UDim2.fromScale(0.02631578947368421, 0.03225806451612903)
                }
                local v27 = { u4.createElement("UIListLayout", {
                        ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                        ["FillDirection"] = Enum.FillDirection.Vertical,
                        ["Padding"] = UDim.new(0.02320185614849188, 0)
                    }) }
                local v28 = #v27
                for v29, v30 in v23 do
                    v27[v28 + v29] = v30
                end
                v13[v14 + 1] = u4.createElement("Frame", v26, v27)
                local function v33(p31, p32) --[[ Line: 89 ]]
                    --[[
                    Upvalues:
                        [1] = u4
                        [2] = u2
                    --]]
                    return u4.createElement("TextLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["TextScaled"] = true,
                        ["Text"] = p31.valueString,
                        ["LayoutOrder"] = p32,
                        ["Size"] = UDim2.fromScale(1, 0.08816705336426914),
                        ["TextXAlignment"] = Enum.TextXAlignment.Right,
                        ["Font"] = Enum.Font.ArialBold,
                        ["TextColor3"] = u2.hexColor(16731983)
                    })
                end
                local v34 = table.create(#v12)
                for v35, v36 in v12 do
                    v34[v35] = v33(v36, v35 - 1, v12)
                end
                local v37 = {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.26842105263157895, 0.9526881720430107),
                    ["Position"] = UDim2.fromScale(0.9736842105263158, 0.03225806451612903),
                    ["AnchorPoint"] = Vector2.new(1, 0)
                }
                local v38 = { u4.createElement("UIListLayout", {
                        ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                        ["FillDirection"] = Enum.FillDirection.Vertical,
                        ["Padding"] = UDim.new(0.02320185614849188, 0)
                    }) }
                local v39 = #v38
                for v40, v41 in v34 do
                    v38[v39 + v40] = v41
                end
                v13[v14 + 2] = u4.createElement("Frame", v37, v38)
                return u4.createFragment(v13)
            end
            local v42 = p8.bloodUpgrades[v11]
            local v43 = v42 == nil and 0 or v42
            if v43 ~= 0 then
                local v44 = u7[v11]
                local v45 = {
                    ["title"] = v44.display
                }
                local v46
                if v44.summarize then
                    local v47 = v44.summarize
                    if v43 > 10 then
                        v43 = math.round(v43)
                    end
                    v46 = v47(v43)
                elseif v44.perk then
                    v46 = "KNOWN"
                else
                    if v43 > 10 then
                        v43 = math.round(v43)
                    end
                    v46 = tostring(v43)
                end
                v45.valueString = v46
                local v48
                if v44.perk then
                    v48 = ColorSequence.new(u2.hexColor(15360512), u2.hexColor(16766464))
                else
                    v48 = nil
                end
                v45.color = v48
                table.insert(v12, v45)
            end
        end
    end)
}