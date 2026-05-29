local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "StatefulEntityDispatcherController"
    end,
    ["__index"] = u3
})
u6.__index = u6
function u6.new(...) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.constructor(p9)
    p9.Name = "StatefulEntityDispatcherController"
end
function u6.KnitStart(p10) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
        [3] = u5
    --]]
    u3.KnitStart(p10)
    u4.Client:WaitFor("StatefulEntityDamage"):expect():Connect(function(p11, p12, p13) --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u5
        --]]
        u5.SharedStatefulEntityDamage:fire(p11, p12, p13)
    end)
    u4.Client:WaitFor("StatefulEntityDeath"):expect():Connect(function(p14, p15, p16) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u5
        --]]
        u5.SharedStatefulEntityDeath:fire(p14, p15, p16)
    end)
end
v2.CreateController(u6.new())
return nil