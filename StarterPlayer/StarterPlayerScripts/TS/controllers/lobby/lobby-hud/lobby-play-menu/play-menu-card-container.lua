local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, script.Parent, "play-menu-card").PlayMenuCard
return {
    ["PlayMenuCardContainer"] = v4.new(u3)(function(u6) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u2
        --]]
        local v7 = u6.Cards
        local function v13(p8, _) --[[ Line: 9 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u3
                [3] = u5
            --]]
            local v9 = #u6.Cards
            local v10 = {}
            for v11, v12 in p8.props do
                v10[v11] = v12
            end
            v10.Page = u6.Page
            v10.Index = p8.Index
            v10.QueueVariant = p8.QueueVariant
            v10.Size = UDim2.fromScale(1, (1 - (v9 - 1) * 0.05) / v9)
            v10.GamepadShouldAutoSelect = p8.Index == 0
            return u3.createElement(u5, v10)
        end
        local v14 = table.create(#v7)
        for v15, v16 in v7 do
            v14[v15] = v13(v16, v15 - 1, v7)
        end
        local v17 = {
            ["Size"] = UDim2.fromScale(1, 0.7)
        }
        local v18 = { u3.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalFlex"] = Enum.UIFlexAlignment.SpaceBetween
            }) }
        local v19 = #v18
        for v20, v21 in v14 do
            v18[v19 + v20] = v21
        end
        return u3.createFragment({
            ["CardContainer"] = u3.createElement(u2, v17, v18)
        })
    end)
}