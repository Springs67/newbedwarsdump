local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
return {
    ["HotbarResourceDisplay"] = v4.new(u3)(function(u7, p8) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u3
            [3] = u5
            [4] = u2
        --]]
        local v9 = p8.useState
        local v10 = p8.useEffect
        local v11, u12 = v9(0)
        local v13, u14 = v9(0)
        local v15, u16 = v9(0)
        local v17, u18 = v9(0)
        local function u23(p19) --[[ Line: 15 ]]
            --[[
            Upvalues:
                [1] = u7
            --]]
            local v20 = nil
            for v21, v22 in u7.ObservedInventory.inventory.items do
                local _ = v21 - 1
                if p19 == v22.itemType == true then
                    v20 = v22
                    break
                end
            end
            if v20 ~= nil then
                v20 = v20.amount
            end
            return v20 == nil and 0 or v20
        end
        v10(function() --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u23
                [3] = u6
                [4] = u14
                [5] = u16
                [6] = u18
            --]]
            u12((u23(u6.IRON)))
            u14((u23(u6.GOLD)))
            u16((u23(u6.DIAMOND)))
            u18((u23(u6.EMERALD)))
        end, { u7.ObservedInventory.inventory.items })
        local function v30(p24, p25) --[[ Line: 45 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u5
                [3] = u2
            --]]
            local v26 = {
                ["Size"] = UDim2.fromScale(1, 0.25)
            }
            local v27 = { u3.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["HorizontalAlignment"] = "Left",
                    ["VerticalAlignment"] = "Top",
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder
                }) }
            local _ = #v27
            local v28 = {
                ["Size"] = UDim2.fromScale(1.5, 1.5),
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
            }
            local v29 = u5(p24).image
            v28.Image = v29 == nil and "" or v29
            v28.BackgroundTransparency = 1
            v28.BorderSizePixel = 0
            v28.LayoutOrder = 0
            v27[p24 .. "Image"] = u3.createElement("ImageLabel", v28)
            v27[p24 .. " Count"] = u3.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0.75, 1),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["Text"] = tostring(p25),
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                ["TextXAlignment"] = Enum.TextXAlignment.Left
            })
            return u3.createFragment({
                [p24 .. "Frame"] = u3.createElement(u2, v26, v27)
            })
        end
        local v31 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["Position"] = UDim2.fromScale(1.06, 0),
            ["Size"] = UDim2.fromScale(0.2, 1)
        }
        local v32 = { u3.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Left",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }) }
        local v33 = #v32
        local v34
        if v11 > 0 then
            v34 = v30(u6.IRON, v11)
        else
            v34 = false
        end
        if v34 then
            v32[v33 + 1] = v34
        end
        local v35 = #v32
        local v36
        if v13 > 0 then
            v36 = v30(u6.GOLD, v13)
        else
            v36 = false
        end
        if v36 then
            v32[v35 + 1] = v36
        end
        local v37 = #v32
        local v38
        if v15 > 0 then
            v38 = v30(u6.DIAMOND, v15)
        else
            v38 = false
        end
        if v38 then
            v32[v37 + 1] = v38
        end
        local v39 = #v32
        local v40
        if v17 > 0 then
            v40 = v30(u6.EMERALD, v17)
        else
            v40 = false
        end
        if v40 then
            v32[v39 + 1] = v40
        end
        return u3.createFragment({
            ["HotbarResourceDisplay"] = u3.createElement("Frame", v31, v32)
        })
    end)
}