local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player-level", "player-level-util").PlayerLevelUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "PlayerLevelController"
    end,
    ["__index"] = u5
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
    --]]
    u5.constructor(p12)
    p12.Name = "PlayerLevelController"
    p12.playerLevel = nil
    p12.playerLevelTotalExperience = nil
    p12.playerLevelUpdateSignal = u4.new()
    p12.matchXpGained = nil
    p12.xpFinalizedSignal = u4.new()
end
function u9.KnitStart(u13) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u8
        [3] = u6
        [4] = u2
    --]]
    u5.KnitStart(u13)
    u8.Client:Get("PlayerLevelUpdate"):Connect(function(p14, p15) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u13
        --]]
        local v16 = {
            ["type"] = "BedwarsSetSome",
            ["data"] = {
                ["playerLevel"] = p14,
                ["playerLevelTotalExperience"] = p15
            }
        }
        u6:dispatch(v16)
        u13.playerLevelUpdateSignal:Fire(p14, p15)
        u13.playerLevel = p14
        u13.playerLevelTotalExperience = p15
    end)
    u8.Client:WaitFor("PlayerLevelMatchXpFinalize"):andThen(function(p17) --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u2
            [3] = u6
        --]]
        p17:Connect(function(p18) --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u2
                [3] = u6
            --]]
            u13.matchXpGained = p18.matchXpGained
            u13.xpFinalizedSignal:Fire(p18.matchXpGained)
            local v19 = u2.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(u6:getState().Game.queueType)
            local v20 = {}
            local v21 = {}
            local v22 = u13.playerLevelTotalExperience
            v21.startingExperience = (v22 == nil and 0 or v22) - p18.matchXpGained
            v21.totalExperienceEarned = p18.matchXpGained
            v21.reasons = p18.reasons
            v20.matchExperienceEarned = v21
            v20.reachedDailyCap = p18.reachedDailyCap
            local _ = v19.rankCategory
        end)
    end)
end
function u9.getPlayerLevel(p23) --[[ Line: 74 ]]
    return p23.playerLevel
end
function u9.getPlayerLevelTotalExperience(p24) --[[ Line: 77 ]]
    return p24.playerLevelTotalExperience
end
function u9.waitForPlayerLevel(p25) --[[ Line: 80 ]]
    local v26 = p25.playerLevel
    if v26 == 0 or (v26 ~= v26 or not v26) then
        return p25.playerLevelUpdateSignal:Wait()
    else
        return p25.playerLevel
    end
end
function u9.waitForPlayerLevelTotalExperience(p27) --[[ Line: 88 ]]
    local v28 = p27.playerLevelTotalExperience
    if v28 == 0 or (v28 ~= v28 or not v28) then
        return select(2, p27.playerLevelUpdateSignal:Wait())
    else
        return p27.playerLevelTotalExperience
    end
end
function u9.waitForTotalMatchXpGained(p29) --[[ Line: 96 ]]
    local v30 = p29.matchXpGained
    if v30 == 0 or (v30 ~= v30 or not v30) then
        return p29.xpFinalizedSignal:Wait()
    else
        return p29.matchXpGained
    end
end
function u9.isBeginner(p31) --[[ Line: 104 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    return p31:waitForPlayerLevel() < u7.BEGINNER_LEVEL
end
v3.CreateController(u9.new())
return nil