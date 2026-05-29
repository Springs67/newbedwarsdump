local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ButtonComponent
local u4 = v2.Empty
local u5 = v2.Padding
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u9 = v1.import(script, script.Parent, "menu-item").MenuItem
return {
    ["MenuComponent"] = v7.new(u6)(function(u10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u9
            [3] = u8
            [4] = u5
            [5] = u3
            [6] = u4
        --]]
        local v12 = p11.useState
        local _ = p11.useEffect
        local u13, u14 = v12(false)
        local v15 = {}
        for v16, v17 in u10 do
            v15[v16] = v17
        end
        v15.ButtonText = nil
        v15.Items = nil
        v15.OnMenuClick = nil
        local v18 = {}
        local function v19() --[[ Line: 30 ]]
            --[[
            Upvalues:
                [1] = u14
            --]]
            u14(false)
        end
        local function v21() --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u13
                [3] = u10
            --]]
            u14(not u13)
            local v20 = u10.OnMenuClick
            if v20 ~= nil then
                v20()
            end
        end
        for v22, v23 in v15 do
            v18[v22] = v23
        end
        if u13 then
            local v24 = u10.Items
            local v25 = table.create(#v24)
            for v26, v27 in v24 do
                local v28 = {
                    ["id"] = v26 - 1,
                    ["item"] = v27,
                    ["closeMenu"] = v19
                }
                v25[v26] = u6.createElement(u9, v28)
            end
            local v29 = {
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 100,
                ["Size"] = UDim2.new(2, 0, 0, 0),
                ["AutomaticSize"] = Enum.AutomaticSize.Y,
                ["Position"] = UDim2.fromScale(0, 1.1),
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["BackgroundColor3"] = u8.backgroundTertiary
            }
            local v30 = { u6.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 3)
                }), u6.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["HorizontalAlignment"] = "Center",
                    ["VerticalAlignment"] = "Center"
                }), u6.createElement(u5, {
                    ["Padding"] = {
                        ["Horizontal"] = 5,
                        ["Vertical"] = 5
                    }
                }) }
            local v31 = #v30
            for v32, v33 in v25 do
                v30[v31 + v32] = v33
            end
            u13 = u6.createFragment({
                ["Menu"] = u6.createElement("Frame", v29, v30)
            })
        end
        local v34 = { u6.createElement(u3, {
                ["Text"] = u10.ButtonText,
                ["Size"] = UDim2.new(1, 0, 1, 0),
                ["OnClick"] = v21
            }) }
        local v35 = #v34
        if u13 then
            v34[v35 + 1] = u13
        end
        return u6.createElement(u4, v18, v34)
    end)
}