local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
return {
    ["HotbarItemNameDisplay"] = v3.new(u2)(function(p5) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u4
            [3] = u1
        --]]
        local v6 = nil
        local u7 = u2.createRef()
        local v8 = p5.store.Inventory.observedInventory.hotbarSlot
        local v9 = p5.store.Inventory.observedInventory.hotbar[v8 + 1].item
        if v9 ~= nil then
            v9 = v9.itemType
        end
        if v6 == v9 then
            return u2.createFragment()
        end
        local v10 = u4(v9).displayName
        if v9 == nil then
            return u2.createFragment()
        end
        task.delay(1.5, function() --[[ Line: 21 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u7
            --]]
            u1.try(function() --[[ Line: 22 ]]
                --[[
                Upvalues:
                    [1] = u7
                --]]
                u7:getValue().Text = ""
            end, function() --[[ Line: 24 ]] end)
        end)
        return u2.createFragment({ u2.createElement("TextLabel", {
                [u2.Ref] = u7,
                ["Text"] = v10,
                ["Size"] = UDim2.fromScale(0.37, 0.37),
                ["Position"] = UDim2.fromScale(0.5, -0.7),
                ["BackgroundTransparency"] = 100,
                ["BorderSizePixel"] = 0,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                ["TextScaled"] = true,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            }, { u2.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.1, 0)
                }), u2.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0.15, 0),
                    ["PaddingBottom"] = UDim.new(0.15, 0)
                }) }) })
    end)
}