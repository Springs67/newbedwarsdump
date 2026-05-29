local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "inspect", "inspect")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "logger-provider").LoggerProvider
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "EventTimeoutTestController"
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
        [2] = u5
    --]]
    u4.constructor(p10)
    p10.Name = "EventTimeoutTestController"
    p10.logger = u5.getLogger("EventTimeoutTest")
end
function u7.KnitStart(u11) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u3
    --]]
    u4.KnitStart(u11)
    u6.Client:OnEvent("EntityDeathEvent", function(_) --[[ Line: 29 ]] end):timeout(10):catch(function(p12) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u3
        --]]
        u11.logger:Error("Promise rejection {reason}", u3(p12))
    end)
end
v2.CreateController(u7.new())
return nil