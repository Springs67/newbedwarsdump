local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["WinstreakBoard"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u3)(function(p4, p5) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
        --]]
        local _ = p5.useState
        local v6 = u3.createFragment
        local v7 = {}
        local v8 = u3.createFragment
        local v9 = {}
        local v10 = u3.createElement
        local v11 = {
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1
        }
        local v12 = p4.streak
        v11.Text = "\240\159\148\165 " .. tostring(v12)
        v11.Size = UDim2.fromScale(0.7, 0.7)
        v11.Position = UDim2.fromScale(0.5, 0.1)
        v11.AnchorPoint = Vector2.new(0.5, 0)
        v11.TextColor3 = u2.WHITE
        v11.Font = Enum.Font.Arial
        v9.WinstreakBoard = v10("TextLabel", v11)
        v7.WinstreakBoard = v8(v9)
        return v6(v7)
    end)
}