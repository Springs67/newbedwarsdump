local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.Padding
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["TagPillList"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u6)(function(p7, p8) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u3
            [3] = u5
            [4] = u4
        --]]
        local _ = p8.useState
        local v9 = {
            ["LayoutOrder"] = 3,
            ["BackgroundTransparency"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.275)
        }
        local v10 = p7.FrameProps
        if v10 then
            for v11, v12 in v10 do
                v9[v11] = v12
            end
        end
        local v13 = p7.Tags
        local function v20(p14) --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u3
                [3] = u5
            --]]
            local v15 = u6.createFragment
            local v16 = {}
            local v17 = u6.createElement
            local v18 = {
                ["AutomaticSize"] = "X",
                ["BackgroundTransparency"] = 0.3,
                ["Size"] = UDim2.fromScale(0, 1),
                ["BackgroundColor3"] = u3.BLACK
            }
            local v19 = {
                u6.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.5, 0)
                }),
                u6.createElement(u5, {
                    ["Padding"] = {
                        ["Vertical"] = 3,
                        ["Horizontal"] = 6
                    }
                }),
                ["Tag"] = u6.createElement("TextLabel", {
                    ["AutomaticSize"] = "X",
                    ["TextSize"] = 7,
                    ["RichText"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0, 1),
                    ["Text"] = string.upper(p14),
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    ["TextColor3"] = u3.WHITE
                })
            }
            v16.TagPill = v17("Frame", v18, v19)
            return v15(v16)
        end
        local v21 = table.create(#v13)
        for v22, v23 in v13 do
            v21[v22] = v20(v23, v22 - 1, v13)
        end
        local v24 = { u6.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Left",
                ["VerticalAlignment"] = "Center",
                ["Padding"] = UDim.new(0.005, 0)
            }) }
        local v25 = #v24
        for v26, v27 in v21 do
            v24[v25 + v26] = v27
        end
        return u6.createFragment({
            ["Tags"] = u6.createElement(u4, v9, v24)
        })
    end)
}