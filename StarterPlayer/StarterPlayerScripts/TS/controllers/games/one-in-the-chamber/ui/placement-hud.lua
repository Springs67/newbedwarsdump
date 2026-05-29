local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u8 = v1.import(script, script.Parent, "placement-scores").PlacementScores
local v15 = v6.new(u5)(function(p9, p10) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u3
        [4] = u8
    --]]
    local _ = p10.useState
    local v11 = u5.createFragment
    local v12 = {}
    local v13 = u5.createElement
    local v14 = {
        ["PlacementScoreHud"] = u5.createElement(u4, {
            ["Size"] = UDim2.fromScale(0.19, u3.isSmallScreen() and 0.17 or 0.14),
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Position"] = UDim2.fromScale(0.5, 0.02)
        }, { u5.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }), u5.createElement(u8, {
                ["AppId"] = "PlacementScores",
                ["Size"] = UDim2.fromScale(1, 0),
                ["showMaxScore"] = p9.showMaxScore
            }) })
    }
    v12.PlacementScoreHud = v13("ScreenGui", {
        ["ResetOnSpawn"] = false
    }, v14)
    return v11(v12)
end)
return {
    ["PlacementHud"] = v7.connect(function(_, p16) --[[ Line: 38 ]]
        local v17 = {}
        for v18, v19 in p16 do
            v17[v18] = v19
        end
        return v17
    end)(v15)
}