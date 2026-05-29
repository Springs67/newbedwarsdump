local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "reward", "ui", "reward-showcase").RewardShowcase
return {
    ["BattlePassRewardShowcase"] = v3.new(u2)(function(p5, _) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u4
        --]]
        if p5.Reward.comingSoon then
            local v6 = u2.createFragment
            local v7 = {
                ["RewardShowcase"] = u2.createElement("Frame", {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = p5.Size,
                    ["LayoutOrder"] = p5.LayoutOrder
                })
            }
            return v6(v7)
        end
        local v8 = {}
        for v9, v10 in p5 do
            v8[v9] = v10
        end
        v8.Reward = nil
        local v11 = {
            ["Reward"] = p5.Reward
        }
        for v12, v13 in v8 do
            v11[v12] = v13
        end
        return u2.createElement(u4, v11)
    end)
}