local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "billboard", "ui", "billboard-ui").BillboardUI
return function(p5) --[[ Line: 6 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
        [3] = u4
    --]]
    local v6 = u3.mount
    local v7 = u3.createElement
    local v8 = {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromOffset(250, 50),
        ["BackgroundColor3"] = u2.hexColor(32633329)
    }
    local v9 = {}
    local v10 = u3.createElement
    local v11 = u4
    local v12 = {
        ["ItemPadding"] = UDim.new(0, 5),
        ["Texts"] = {
            {
                ["Text"] = "Bedwars (Squads)",
                ["TextColor"] = u2.hexColor(16382311),
                ["LabelSize"] = UDim2.fromScale(1, 0.6)
            },
            {
                ["Text"] = "Teams of 4",
                ["TextColor"] = u2.hexColor(10088686),
                ["LabelSize"] = UDim2.fromScale(0.5, 0.35)
            }
        }
    }
    __set_list(v9, 1, {v10(v11, v12)})
    local u13 = v6(v7("Frame", v8, v9), p5)
    return function() --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u13
        --]]
        return u3.unmount(u13)
    end
end