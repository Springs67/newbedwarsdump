local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-division").RankDivision
local u5 = v1.import(script, script.Parent, "ranked-progress-bar-core").RankedProgressBarCore
return function(p6) --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u5
        [4] = u2
    --]]
    local v7 = {
        ["rpDelta"] = 0,
        ["rankVisible"] = true,
        ["matchesPlayed"] = 10,
        ["demotionShieldActive"] = true,
        ["oldDivision"] = {
            ["rankPoints"] = 0,
            ["division"] = u4.DIAMOND_3
        },
        ["newDivision"] = {
            ["rankPoints"] = 0,
            ["division"] = u4.DIAMOND_3
        }
    }
    local u8 = u3("RankedProgressBarApp", u5, {
        ["RankChangeData"] = v7
    }, {}, {
        ["Parent"] = p6
    })
    return function() --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u8
        --]]
        u2.unmount(u8)
    end
end