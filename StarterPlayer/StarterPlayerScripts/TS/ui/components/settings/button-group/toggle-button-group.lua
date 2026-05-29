local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["ToggleButtonGroup"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u3)(function(u4, p5) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
        --]]
        local v6 = p5.useState
        local v7 = p5.useEffect
        local u8, u9 = v6(u4.Value)
        local v10, u11 = v6({})
        v7(function() --[[ Line: 11 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u3
                [3] = u9
                [4] = u8
                [5] = u11
            --]]
            local u12 = {}
            local v13 = u4[u3.Children]
            if v13 ~= nil then
                local function v26(p14) --[[ Line: 15 ]]
                    --[[
                    Upvalues:
                        [1] = u4
                        [2] = u3
                        [3] = u9
                        [4] = u8
                        [5] = u12
                    --]]
                    local v15 = p14.props
                    local v16 = {}
                    local v17 = v15.FrameProps
                    if type(v17) == "table" then
                        for v18, v19 in v17 do
                            v16[v18] = v19
                        end
                    end
                    local v20 = UDim2
                    local v21 = u4[u3.Children]
                    if v21 ~= nil then
                        v21 = 0
                        for _ in v21 do
                            v21 = v21 + 1
                        end
                    end
                    local v22 = v21 == nil and 2 or v21
                    v16.Size = v20.fromScale(1 / v22, 1)
                    v15.FrameProps = v16
                    function v15.SetValue(p23) --[[ Line: 43 ]]
                        --[[
                        Upvalues:
                            [1] = u9
                            [2] = u4
                        --]]
                        u9(p23)
                        u4.OnChange(p23)
                    end
                    v15.Active = u8 == v15.Value
                    local v24 = u12
                    local v25 = u3.createElement(p14.component, v15)
                    table.insert(v24, v25)
                end
                for v27, v28 in v13 do
                    v26(v28, v27, v13)
                end
            end
            u11(u12)
        end, { u4[u3.Children], u8 })
        v7(function() --[[ Line: 58 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u4
            --]]
            u9(u4.Value)
        end, { u4.Value })
        local v29 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v30 = u4.FrameProps
        if v30 then
            for v31, v32 in v30 do
                v29[v31] = v32
            end
        end
        local v33 = { u3.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder"
            }) }
        local v34 = #v33
        for v35, v36 in v10 do
            v33[v34 + v35] = v36
        end
        return u3.createElement(u2, v29, v33)
    end)
}