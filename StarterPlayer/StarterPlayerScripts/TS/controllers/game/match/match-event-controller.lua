local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "network").AddMatchEventCountdownZap
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "MatchEventController"
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
    --]]
    u4.constructor(p10)
    p10.Name = "MatchEventController"
    p10.activeCountdowns = {}
end
function u7.KnitStart(u11) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
    --]]
    u4.KnitStart(u11)
    u5.On(function(p12, p13, p14, p15, p16, p17, p18, p19) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        u11:addMatchEventCountdown({
            ["id"] = p12,
            ["image"] = p13,
            ["name"] = p14,
            ["time"] = p15,
            ["isOnTopHud"] = p16,
            ["themeColor"] = p17,
            ["textColor"] = p18,
            ["textTransparency"] = p19
        })
    end)
end
function u7.addMatchEventCountdown(u20, u21) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
    --]]
    u6:dispatch({
        ["type"] = "GameAddMatchEvent",
        ["matchEvent"] = u21
    })
    local v22 = u20.activeCountdowns
    local v23 = u21.id
    table.insert(v22, v23)
    local v24 = u21.time - u3:GetServerTimeNow()
    task.delay(v24, function() --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u21
            [3] = u20
        --]]
        local v25 = u6:getState().Game.matchEvents[u21.id]
        if v25 ~= nil then
            v25 = v25.time
        end
        if v25 == u21.time then
            u20:removeMatchEventCountdown(u21.id)
        end
    end)
    return nil
end
function u7.removeMatchEventCountdown(p26, p27) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6:dispatch({
        ["type"] = "GameRemoveMatchEvent",
        ["matchEventId"] = p27
    })
    local v28 = -1
    for v29, v30 in p26.activeCountdowns do
        local _ = v29 - 1
        if v30 == p27 == true then
            v28 = v29 - 1
            break
        end
    end
    table.remove(p26.activeCountdowns, v28 + 1)
end
function u7.removeAllMatchEventCountdowns(p31) --[[ Line: 88 ]]
    for v32, v33 in p31.activeCountdowns do
        local _ = v32 - 1
        p31:removeMatchEventCountdown(v33)
    end
end
v2.CreateController(u7.new())
return nil