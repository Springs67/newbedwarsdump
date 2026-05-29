local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["CustomMatchTabButton"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u3)(function(u4, p5) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u3
        --]]
        local _ = p5.useState
        local v6 = u2.isSmallScreen()
        local v7 = {}
        for v8, v9 in u4 do
            v7[v8] = v9
        end
        v7.Selected = nil
        v7.OnClick = nil
        local v10 = {}
        for v11, v12 in v7 do
            v10[v11] = v12
        end
        v10.TextXAlignment = Enum.TextXAlignment.Center
        v10.TextYAlignment = Enum.TextYAlignment.Center
        v10.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        v10.BackgroundTransparency = u4.Selected and 0.5 or 0.7
        local v13
        if v6 then
            v13 = Enum.FontSize.Size14
        else
            v13 = Enum.FontSize.Size18
        end
        v10.FontSize = v13
        v10.TextTransparency = 0
        v10[u3.Event.MouseButton1Click] = function() --[[ Line: 26 ]]
            --[[
            Upvalues:
                [1] = u4
            --]]
            if u4.OnClick then
                u4.OnClick()
            end
        end
        return u3.createElement("TextButton", v10, { u3.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 2)
            }) })
    end)
}