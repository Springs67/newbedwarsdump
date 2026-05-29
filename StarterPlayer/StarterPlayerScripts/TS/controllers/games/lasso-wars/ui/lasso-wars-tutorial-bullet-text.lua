local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["LassoWarsTutorialBulletText"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u3)(function(p4, p5) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
        --]]
        local _ = p5.useState
        local _ = p5.useEffect
        return u3.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["TextStrokeTransparency"] = 0.5,
            ["LayoutOrder"] = 1,
            ["TextSize"] = 28,
            ["TextWrap"] = true,
            ["Size"] = UDim2.fromScale(1, 0.15),
            ["Text"] = "\226\128\162 " .. p4.text,
            ["AutomaticSize"] = Enum.AutomaticSize.Y,
            ["TextColor3"] = u2.WHITE,
            ["Font"] = Enum.Font.SourceSans,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextYAlignment"] = Enum.TextYAlignment.Center,
            ["TextStrokeColor3"] = Color3.fromRGB(122, 122, 122)
        })
    end)
}