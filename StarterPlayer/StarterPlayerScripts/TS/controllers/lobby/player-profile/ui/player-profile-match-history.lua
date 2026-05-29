local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "match-history", "ui", "match-history-core").MatchHistoryCore
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u6 = v1.import(script, script.Parent, "player-profile-empty").PlayerProfileEmpty
return {
    ["PlayerProfileMatchHistory"] = v3.new(u2)(function(p7, p8) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u2
            [3] = u6
            [4] = u4
        --]]
        local _ = p8.useState
        local v9 = {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.95, 0.98),
            ["BackgroundColor3"] = u5.backgroundPrimary,
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Position"] = UDim2.fromScale(0.5, 0.02)
        }
        local v10 = p7.FrameProps
        if v10 then
            for v11, v12 in v10 do
                v9[v11] = v12
            end
        end
        local v13 = u2.createElement
        local v14 = "Frame"
        local v15 = {}
        local v16
        if #p7.ProfileData.matchHistory == 0 then
            v16 = u2.createElement(u6, {
                ["Text"] = "No match history available.",
                ["Size"] = UDim2.fromScale(1, 1)
            })
        else
            v16 = u2.createElement(u4, {
                ["userId"] = p7.ProfileData.userId,
                ["matchHistory"] = p7.ProfileData.matchHistory
            })
        end
        __set_list(v15, 1, {v16})
        return v13(v14, v9, v15)
    end)
}