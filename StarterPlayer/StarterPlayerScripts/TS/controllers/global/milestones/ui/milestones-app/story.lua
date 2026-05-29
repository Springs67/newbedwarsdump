local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "milestones", "milestones").MilestoneRewards
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player-level", "player-level-util").PlayerLevelUtil
local u7 = v1.import(script, script.Parent, "milestones-app").MilestonesApp
return function(p8) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u5
        [4] = u3
        [5] = u7
        [6] = u2
    --]]
    local v9 = u4
    local v10 = {
        ["type"] = "BedwarsSetSome",
        ["data"] = {
            ["playerLevel"] = 17,
            ["playerLevelTotalExperience"] = u6.levelSystem:getTotalExperienceForLevel(17),
            ["milestoneRewardsClaimed"] = { u5[2].id }
        }
    }
    v9:dispatch(v10)
    local u11 = u3("MilestonesApp", u7, {}, {}, {
        ["Parent"] = p8
    })
    return function() --[[ Line: 21 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u11
        --]]
        u2.unmount(u11)
    end
end