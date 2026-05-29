local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["SquareCheckBoxButton"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u5)(function(u6, p7) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
            [3] = u4
        --]]
        local v8 = p7.useState
        local v9 = p7.useEffect
        local u10, u11 = v8(false)
        v9(function() --[[ Line: 12 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u11
            --]]
            if u6.Checked ~= nil then
                u11(u6.Checked)
            end
        end, { u6.Checked })
        local v12 = {}
        for v13, v14 in u6 do
            v12[v13] = v14
        end
        v12.OnChecked = nil
        v12.Checked = nil
        v12.CornerRadius = nil
        v12[u5.Children] = nil
        local v15 = {}
        for v16, v17 in v12 do
            v15[v16] = v17
        end
        local v18 = {}
        local v19 = #v18
        local v21 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["ImageTransparency"] = 1,
            ["BackgroundColor3"] = u3.BLACK,
            ["BackgroundTransparency"] = 0.5,
            ["BorderSizePixel"] = 0,
            [u5.Event.MouseButton1Click] = function() --[[ Line: 40 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u10
                    [3] = u11
                --]]
                local v20 = u6.OnChecked
                if v20 ~= nil then
                    v20(u10)
                end
                u11(not u10)
            end
        }
        local v22 = { u5.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }), u5.createElement("UICorner", {
                ["CornerRadius"] = u6.CornerRadius or UDim.new(0.1, 0)
            }) }
        local v23 = #v22
        local v24 = u6[u5.Children]
        if v24 then
            for v25, v26 in v24 do
                if type(v25) == "number" then
                    v22[v23 + v25] = v26
                else
                    v22[v25] = v26
                end
            end
        end
        local v27 = #v22
        if u10 then
            u10 = u5.createElement("Frame", {
                ["BackgroundTransparency"] = 0.25,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(0.9, 0.9),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["BackgroundColor3"] = u3.WHITE
            }, { u5.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.1, 0)
                }) })
        end
        if u10 then
            v22[v27 + 1] = u10
        end
        v18[v19 + 1] = u5.createElement("ImageButton", v21, v22)
        return u5.createElement(u4, v15, v18)
    end)
}