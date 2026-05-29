local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tutorial", "tutorial-type").TutorialType
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tutorial", "tutorials", "beginner-tutorial").BeginnerTutorialSections
local u6 = {
    [v4.BEGINNER] = {
        ["startingSection"] = "introduction",
        ["queueType"] = v3.BEGINNER_TUTORIAL,
        ["sections"] = v5
    }
}
return {
    ["getTutorialMeta"] = function(p7) --[[ Name: getTutorialMeta, Line 20 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        return u6[p7]
    end,
    ["getTutorialQueueTypes"] = function() --[[ Name: getTutorialQueueTypes, Line 23 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u6
        --]]
        local v8 = {}
        for v9, v10 in u2.values(u6) do
            local _ = v9 - 1
            local v11 = v10.queueType
            table.insert(v8, v11)
            local _ = #v8
        end
        return v8
    end
}