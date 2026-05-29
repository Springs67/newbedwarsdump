local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "match", "ui", "match-event", "match-event-list").MatchEventList
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-config")
local u7 = v6.calcCardsDimensions
local u8 = v6.tabListLayout
local u9 = v1.import(script, script.Parent, "tab-list-team-cards").TabListTeamCards
local v16 = v3.new(u2)(function(_, p10) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u2
        [3] = u8
        [4] = u5
        [5] = u9
    --]]
    local _ = p10.useState
    local v11 = u7()
    local v12 = u2.createFragment
    local v13 = {}
    local v14 = u2.createElement
    local v15 = {
        ["TabListFrame"] = u2.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(u8.heightScale, u8.widthScale),
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Position"] = UDim2.new(u8.openedPositionX, 0, u8.openedPositionY, 0)
        }, {
            u2.createElement("UISizeConstraint", {
                ["MaxSize"] = Vector2.new(960, 540),
                ["MinSize"] = Vector2.new(16, 9)
            }),
            u2.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["Padding"] = UDim.new(0, 6)
            }),
            u2.createElement(u5, {
                ["AppId"] = "MatchEventList",
                ["Size"] = UDim2.new(1, 0, 0, 40)
            }),
            u2.createElement(u9, {
                ["CardDimensions"] = v11
            })
        })
    }
    v13.TabListScreenGui = v14("ScreenGui", {
        ["DisplayOrder"] = 1002,
        ["IgnoreGuiInset"] = true,
        ["ResetOnSpawn"] = false
    }, v15)
    return v12(v13)
end)
return {
    ["TabList"] = v4.connect(function(_, p17) --[[ Line: 47 ]]
        local v18 = {}
        for v19, v20 in p17 do
            v18[v19] = v20
        end
        return v18
    end)(v16)
}