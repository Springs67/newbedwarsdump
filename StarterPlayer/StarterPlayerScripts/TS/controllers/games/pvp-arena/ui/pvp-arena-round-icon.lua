local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["PvPArenaRoundIcon"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u3)(function(p4, p5) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u3
        --]]
        local _ = p5.useState
        local v6 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = p4.Position,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Image"] = p4.iconImage
        }
        local v7
        if p4.ImageColor3 then
            v7 = p4.ImageColor3
        else
            v7 = u2.WHITE
        end
        v6.ImageColor3 = v7
        local v8 = p4.ImageTransparency
        v6.ImageTransparency = (v8 == 0 or (v8 ~= v8 or not v8)) and 0 or p4.ImageTransparency
        v6.ZIndex = p4.ZIndex
        return u3.createElement("ImageLabel", v6)
    end)
}