local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["KitDetailsItemCard"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(u3, p4) --[[ Line: 5 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        local _ = p4.useState
        local v5 = {}
        for v6, v7 in u3 do
            v5[v6] = v7
        end
        v5.Image = nil
        v5.Id = nil
        v5.OnClick = nil
        v5.OnHover = nil
        v5[u2.Children] = nil
        local v8 = {}
        for v9, v10 in v5 do
            v8[v9] = v10
        end
        v8.Text = ""
        v8[u2.Event.Activated] = function() --[[ Line: 22 ]]
            --[[
            Upvalues:
                [1] = u3
            --]]
            local v11 = u3.OnClick
            if v11 then
                v11 = u3.OnClick(u3.Id)
            end
            return v11
        end
        v8[u2.Event.MouseEnter] = function() --[[ Line: 25 ]]
            --[[
            Upvalues:
                [1] = u3
            --]]
            local v12 = u3.OnHover
            if v12 then
                v12 = u3.OnHover(u3.Id)
            end
            return v12
        end
        local v13 = { u2.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 3)
            }), u2.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.05, 0),
                ["PaddingBottom"] = UDim.new(0.05, 0),
                ["PaddingLeft"] = UDim.new(0.05, 0),
                ["PaddingRight"] = UDim.new(0.05, 0)
            }), u2.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = u3.Image,
                ["ScaleType"] = Enum.ScaleType.Fit
            }) }
        local v14 = #v13
        local v15 = u3[u2.Children]
        if v15 then
            for v16, v17 in v15 do
                if type(v16) == "number" then
                    v13[v14 + v16] = v17
                else
                    v13[v16] = v17
                end
            end
        end
        return u2.createElement("TextButton", v8, v13)
    end)
}