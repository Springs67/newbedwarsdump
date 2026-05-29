local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u4 = u1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "LeaderboardController"
    end,
    ["__index"] = u3
})
u6.__index = u6
function u6.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9, ...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.constructor(p9, ...)
    p9.Name = "LeaderboardController"
end
u6.KnitStart = u1.async(function(p10) --[[ Line: 26 ]]
    p10:setupLeaderboardBoards()
end)
u6.setupLeaderboardBoards = u1.async(function(u11) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u1
    --]]
    local v12 = u5.Client:GetNamespace("Leaderboard")
    u1.await(v12:WaitFor("OnLeaderboardsUpdate")):Connect(function(p13) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        return u11:updateLeaderboards(p13)
    end)
    local v14 = u1.await(v12:WaitFor("RequestLeaderboardData"))
    u11:updateLeaderboards((u1.await(v14:CallServerAsync())))
end)
function u6.updateLeaderboards(_, p15) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4:dispatch({
        ["type"] = "UpdateAllLeaderboards",
        ["leaderboards"] = p15
    })
end
return {
    ["LeaderboardController"] = v2.CreateController(u6.new())
}