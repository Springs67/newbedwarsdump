local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, script.Parent, "tournament-app-match-history").TournamentAppMatchHistory
local u6 = v1.import(script, script.Parent, "tournament-app-reward-tracker").TournamentAppRewardTracker
return {
    ["TournamentAppBracketPage"] = v4.new(u3)(function(p7, p8) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
            [3] = u5
            [4] = u6
        --]]
        local _ = p8.useState
        local v9 = u3.createFragment
        local v10 = {
            ["App Content - Bracket"] = u3.createElement(u2, {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(1, 0.9)
            }, { u3.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder
                }), u3.createElement(u5, {
                    ["inATeam"] = p7.inATeam
                }), u3.createElement(u6) })
        }
        return v9(v10)
    end)
}