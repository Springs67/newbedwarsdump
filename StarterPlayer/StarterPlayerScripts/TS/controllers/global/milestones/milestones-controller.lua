local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "MilestonesController"
    end,
    ["__index"] = u4
})
u7.__index = u7
function u7.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
    --]]
    u4.constructor(p10)
    p10.Name = "MilestonesController"
    p10.milestoneRewardsUpdateSignal = u3.new()
    p10.milestoneRewardsClaimed = nil
    p10.freeKitLevel = nil
end
function u7.KnitStart(u11) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u5
    --]]
    u4.KnitStart(u11)
    u6.Client:Get("MilestoneRewardUpdate"):Connect(function(p12, p13) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u11
        --]]
        local v14 = {
            ["type"] = "BedwarsSetSome",
            ["data"] = {
                ["milestoneRewardsClaimed"] = p12,
                ["freeKitLevel"] = p13
            }
        }
        u5:dispatch(v14)
        u11.milestoneRewardsUpdateSignal:Fire(p12, p13)
        u11.milestoneRewardsClaimed = p12
        u11.freeKitLevel = p13
    end)
end
function u7.getMilestoneRewardsClaimed(p15) --[[ Line: 44 ]]
    return p15.milestoneRewardsClaimed
end
function u7.getFreeKitLevel(p16) --[[ Line: 47 ]]
    return p16.freeKitLevel
end
function u7.waitForMilestoneRewardsClaimed(p17) --[[ Line: 50 ]]
    if p17.milestoneRewardsClaimed then
        return p17.milestoneRewardsClaimed
    else
        return p17.milestoneRewardsUpdateSignal:Wait()
    end
end
function u7.waitForFreeKitLevel(p18) --[[ Line: 57 ]]
    local v19 = p18.freeKitLevel
    if v19 == 0 or (v19 ~= v19 or not v19) then
        return select(2, p18.milestoneRewardsUpdateSignal:Wait())
    else
        return p18.freeKitLevel
    end
end
v2.CreateController(u7.new())
return nil