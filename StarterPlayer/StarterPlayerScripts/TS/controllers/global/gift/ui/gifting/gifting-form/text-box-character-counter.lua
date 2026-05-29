local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["TextBoxCharacterCounter"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u4)(function(u5, p6) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u4
            [3] = u2
        --]]
        local v7 = p6.useState
        local v8 = p6.useEffect
        local v9, u10 = v7(0)
        v8(function() --[[ Line: 11 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u5
                [3] = u10
            --]]
            local u11 = u3.new()
            local u12 = u5.TextBox:getValue()
            if not u12 then
                warn("[TextBoxCharacterCounter]: TextBox Ref not found")
                return nil
            end
            u10(#u12.Text)
            u11:GiveTask(u12:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 27 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u5
                    [3] = u10
                --]]
                if u12 then
                    if #u12.Text <= u5.MaxCharCount then
                        u10(#u12.Text)
                    end
                end
            end))
            return function() --[[ Line: 30 ]]
                --[[
                Upvalues:
                    [1] = u11
                --]]
                u11:DoCleaning()
            end
        end, {})
        local v13 = {}
        for v14, v15 in u5 do
            v13[v14] = v15
        end
        v13[u4.Children] = nil
        v13.TextBox = nil
        v13.MaxCharCount = nil
        local v16 = {
            ["AutomaticSize"] = "Y",
            ["SizeConstraint"] = "RelativeXX",
            ["TextTransparency"] = 0.3,
            ["TextSize"] = 14,
            ["BackgroundTransparency"] = 1
        }
        local v17 = tostring(v9)
        local v18 = u5.MaxCharCount
        v16.Text = v17 .. "/" .. tostring(v18)
        v16.Size = UDim2.new(1, 0, 0, 0)
        v16.TextColor3 = u2.WHITE
        v16.TextXAlignment = Enum.TextXAlignment.Right
        v16.Font = Enum.Font.Roboto
        v16.LayoutOrder = u5.LayoutOrder
        for v19, v20 in v13 do
            v16[v19] = v20
        end
        local v21 = {}
        local v22 = #v21
        local v23 = u5[u4.Children]
        if v23 then
            for v24, v25 in v23 do
                if type(v24) == "number" then
                    v21[v22 + v24] = v25
                else
                    v21[v24] = v25
                end
            end
        end
        return u4.createElement("TextLabel", v16, v21)
    end)
}