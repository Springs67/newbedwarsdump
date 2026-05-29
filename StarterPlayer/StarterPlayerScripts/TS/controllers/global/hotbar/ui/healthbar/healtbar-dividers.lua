local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["HealthbarDividers"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u5)(function(p6, p7) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u4
        --]]
        local _ = p7.useState
        local v8 = {}
        for v9, v10 in p6 do
            v8[v9] = v10
        end
        local v11 = v8.Spacing
        local u12 = v11 == nil and 0.1 or v11
        local v13 = v8.Thickness
        local u14 = v13 == nil and 1 or v13
        local u15 = v8.Color
        if u15 == nil then
            u15 = u3.hexColor(2700097)
        end
        local function v16() --[[ Line: 27 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u4
                [3] = u12
                [4] = u14
                [5] = u15
            --]]
            return u5.createElement(u4, {
                ["ZIndex"] = 10,
                ["Size"] = UDim2.new(u12, 0, 1, 0)
            }, { u5.createElement("Frame", {
                    ["BorderSizePixel"] = 0,
                    ["ZIndex"] = 10,
                    ["AnchorPoint"] = Vector2.new(1, 0),
                    ["Position"] = UDim2.new(1, -u14, 0, 0),
                    ["Size"] = UDim2.new(0, u14, 0.6, 0),
                    ["BackgroundColor3"] = u15
                }) })
        end
        local v17 = false
        local v18 = 0
        local v19 = {}
        while true do
            if v17 then
                v18 = v18 + 1
            else
                v17 = true
            end
            if v18 >= 9 then
                local v20 = {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["ZIndex"] = 10,
                    ["Size"] = UDim2.fromScale(1, 1)
                }
                local v21 = { u5.createElement("UIListLayout", {
                        ["FillDirection"] = "Horizontal"
                    }) }
                local v22 = #v21
                for v23, v24 in v19 do
                    v21[v22 + v23] = v24
                end
                return u5.createFragment({
                    ["Dividers"] = u5.createElement("Frame", v20, v21)
                })
            end
            local v25 = u5.createElement(v16)
            table.insert(v19, v25)
        end
    end)
}