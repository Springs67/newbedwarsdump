local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "StatsController"
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
function u6.constructor(p9) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.constructor(p9)
    p9.Name = "StatsController"
end
function u6.KnitStart(_) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
    --]]
    u5.Client:WaitFor("FetchStats"):andThen(function(p10) --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        local v11 = p10:CallServer()
        u4:dispatch({
            ["type"] = "SetStats",
            ["globalStats"] = v11.globalStats,
            ["queues"] = v11.queues,
            ["rankStats"] = v11.rankStats
        })
    end)
end
v2.CreateController(u6.new())
return nil