local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u5 = v1.import(script, script.Parent, "victory-section").VictorySection
local u6 = nil
local function v8(p7) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u6
    --]]
    return u2.createElement("ScreenGui", {
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = true,
        ["DisplayOrder"] = 1000
    }, { u2.createElement(u6, {
            ["store"] = p7.store,
            ["WinningTeamId"] = p7.WinningTeamId,
            ["NewLeaderboardPos"] = p7.NewLeaderboardPos,
            ["PreviousLeaderboardPos"] = p7.PreviousLeaderboardPos,
            ["CustomTitleMessage"] = p7.CustomTitleMessage
        }) })
end
u6 = v3.new(u2)(function(p9, p10) --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u5
    --]]
    local _ = p10.useState
    local _ = p10.useEffect
    local v11 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(1, 0.9),
        ["Position"] = UDim2.new(0.5, 0, 0, u4.topBarGuiInset),
        ["AnchorPoint"] = Vector2.new(0.5, 0)
    }
    local v12 = {}
    local v13 = #v12
    local v14 = {
        ["FrameProps"] = {
            ["Size"] = UDim2.fromScale(0.8, 0.8),
            ["Position"] = UDim2.fromScale(0.5, 0.18),
            ["AnchorPoint"] = Vector2.new(0.5, 0)
        },
        ["store"] = p9.store,
        ["WinningTeamId"] = p9.WinningTeamId,
        ["CustomTitleMessage"] = p9.CustomTitleMessage
    }
    local v15 = p9.DisplayPlayers
    v14.DisplayPlayers = v15 == nil and true or v15
    v12[v13 + 1] = u2.createElement(u5, v14)
    return u2.createElement("Frame", v11, v12)
end)
return {
    ["WinningTeamWrapper"] = v8,
    ["WinningTeam"] = u6
}