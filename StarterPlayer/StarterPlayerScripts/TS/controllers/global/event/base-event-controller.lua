local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta
local v4 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 9 ]]
        return "BaseEventController"
    end,
    ["__index"] = u2
})
v4.__index = v4
function v4.constructor(p5, p6) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    u2.constructor(p5)
    p5.eventTypes = p6
    p5.Name = "BaseEventController"
end
function v4.KnitStart(p7) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    u2.KnitStart(p7)
    local v8 = false
    for v9, v10 in p7.eventTypes do
        local _ = v9 - 1
        local v11 = u3[v10]
        local v12 = v11.active
        if v12 then
            v12 = os.time() < v11.endDate
        end
        if v12 then
            v8 = true
            break
        end
    end
    if v8 then
        p7:onEventInit()
    end
end
return {
    ["BaseEventController"] = v4
}