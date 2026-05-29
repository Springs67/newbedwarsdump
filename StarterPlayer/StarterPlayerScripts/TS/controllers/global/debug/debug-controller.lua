local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ContextActionService
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "DebugController"
    end,
    ["__index"] = u4
})
u7.__index = u7
function u7.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p10)
    p10.Name = "DebugController"
    p10.debugTimers = {}
    p10.debugTimerArrays = {}
end
function u7.KnitStart(u11) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u3
        [4] = u5
    --]]
    u4.KnitStart(u11)
    if u6.isProduction() then
        return nil
    end
    u3:BindAction("debug-action", function(_, p12, _) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        if p12 ~= Enum.UserInputState.Begin then
            return nil
        end
        task.spawn(function() --[[ Line: 38 ]]
            --[[
            Upvalues:
                [1] = u11
            --]]
            u11:debugFunction()
        end)
    end, false, Enum.KeyCode.RightShift)
    u5.Client:Get("DebugResponse"):Connect(function(_) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        task.spawn(function() --[[ Line: 43 ]]
            --[[
            Upvalues:
                [1] = u11
            --]]
            u11:responseFunction()
        end)
    end)
end
function u7.debugFunction(_) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    print("[DEBUG CLIENT]: Local debug function called.")
    u5.Client:Get("DebugRequest"):SendToServer({})
end
function u7.responseFunction(_) --[[ Line: 54 ]]
    print("[DEBUG CLIENT]: Server response received.")
end
v2.CreateController(u7.new())
return nil