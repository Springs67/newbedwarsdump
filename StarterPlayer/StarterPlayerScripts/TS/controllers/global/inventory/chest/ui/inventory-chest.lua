local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Empty
local u4 = v2.EmptyButton
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u9 = u1.import(script, script.Parent.Parent.Parent, "ui", "inventory-header").InventoryHeader
local u10 = u1.import(script, script.Parent.Parent.Parent, "ui", "inventory-tile").InventoryTile
return {
    ["InventoryChest"] = v6.new(u5)(function(p11, p12) --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u5
            [3] = u3
            [4] = u10
            [5] = u1
            [6] = u8
            [7] = u9
            [8] = u4
        --]]
        local _ = p12.useState
        local v13 = {}
        local v14 = u7.LocalPlayer.Character
        if v14 ~= nil then
            v14 = v14:FindFirstChild("ObservedChestFolder")
        end
        local v15 = nil
        local v16
        if v14 == nil then
            v16 = v14
        else
            v16 = v14.Value
        end
        if v16 then
            v15 = v14.Value
        end
        if v15 ~= nil then
            v15 = v15:GetAttribute("Smelter")
        end
        local v17 = v15 ~= nil
        local v18 = false
        local v19 = 0
        local v20 = v17 and "Smelter" or "Chest"
        while true do
            if v18 then
                v19 = v19 + 1
            else
                v18 = true
            end
            if v19 >= 24 then
                local v21 = {
                    ["Size"] = UDim2.fromScale(1, 1)
                }
                local v22 = {}
                local v23 = u5.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical"
                })
                local v24 = u5.createElement
                local v25 = u9
                local v26 = {}
                local v27 = p11.Title or v20
                v26.Title = tostring(v27)
                __set_list(v22, 1, {v23, v24(v25, v26), u5.createElement(u3, {
    ["Size"] = UDim2.fromScale(0, 0.01)
})})
                local v28 = #v22
                local v29 = {
                    ["Size"] = UDim2.fromScale(1, 1)
                }
                local v30 = {}
                local v31 = #v30
                local v32 = {
                    ["BackgroundTransparency"] = 0,
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.fromScale(1, 1)
                }
                local v33
                if v17 then
                    v33 = Color3.fromRGB(176, 97, 15)
                else
                    v33 = Color3.fromRGB(81, 50, 22)
                end
                v32.BackgroundColor3 = v33
                local v34 = { u5.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 6)
                    }), u5.createElement("UIPadding", {
                        ["PaddingLeft"] = UDim.new(0.02, 0),
                        ["PaddingRight"] = UDim.new(0.02, 0),
                        ["PaddingTop"] = UDim.new(0.03, 0),
                        ["PaddingBottom"] = UDim.new(0.03, 0)
                    }), u5.createElement("UIGridLayout", {
                        ["FillDirection"] = "Horizontal",
                        ["HorizontalAlignment"] = "Center",
                        ["VerticalAlignment"] = "Center",
                        ["SortOrder"] = "LayoutOrder",
                        ["CellSize"] = UDim2.fromScale(0.14666666666666667, 0.23),
                        ["CellPadding"] = UDim2.fromScale(0.02, 0.02)
                    }) }
                local v35 = #v34
                for v36, v37 in v13 do
                    v34[v35 + v36] = v37
                end
                v30[v31 + 1] = u5.createElement("Frame", v32, v34)
                v22[v28 + 1] = u5.createElement(u4, v29, v30)
                return u5.createElement(u3, v21, v22)
            end
            local v38 = nil
            local u39
            if v19 < #p11.ObservedChest.items then
                u39 = p11.ObservedChest.items[v19 + 1]
                if u39 == "empty" then
                    u39 = v38
                end
            else
                u39 = v38
            end
            local v40 = u5.createElement
            local v41 = u3
            local v42 = {
                ["Size"] = UDim2.fromScale(1, 1)
            }
            local v43 = {}
            local v44 = u5.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.025),
                ["PaddingBottom"] = UDim.new(0.025),
                ["PaddingLeft"] = UDim.new(0.025),
                ["PaddingRight"] = UDim.new(0.025)
            })
            local v45 = u5.createElement
            local v46 = u10
            local v50 = {
                ["ItemClickLoadingProgress"] = true,
                ["InvItem"] = u39,
                ["LayoutOrder"] = v19,
                ["AutoSelect"] = v19 == 0,
                ["OnClick"] = u1.async(function() --[[ Line: 74 ]]
                    --[[
                    Upvalues:
                        [1] = u39
                        [2] = u7
                        [3] = u1
                        [4] = u8
                    --]]
                    if u39 then
                        local v47 = u7.LocalPlayer.Character
                        if v47 ~= nil then
                            v47 = v47:FindFirstChild("ObservedChestFolder")
                        end
                        local v48 = u1.await(v47)
                        local v49
                        if v48 == nil then
                            v49 = v48
                        else
                            v49 = v48.Value
                        end
                        if v49 then
                            return u1.await(u8.Client:GetNamespace("Inventory"):Get("ChestGetItem"):CallServer(v48.Value, u39.tool))
                        end
                    end
                end),
                ["SendToHotbarSlot"] = function(_) --[[ Name: SendToHotbarSlot, Line 91 ]] end
            }
            local v51
            if v17 then
                v51 = Color3.fromRGB(214, 191, 20)
            else
                v51 = Color3.fromRGB(110, 69, 28)
            end
            v50.TileColor = v51
            __set_list(v43, 1, {v44, v45(v46, v50)})
            local v52 = v40(v41, v42, v43)
            table.insert(v13, v52)
        end
    end)
}