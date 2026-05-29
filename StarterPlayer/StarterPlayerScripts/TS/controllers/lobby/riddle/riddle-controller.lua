local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u5 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "RiddleController"
    end,
    ["__index"] = u3
})
u5.__index = u5
function u5.new(...) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v6 = u5
    local v7 = setmetatable({}, v6)
    return v7:constructor(...) or v7
end
function u5.constructor(p8) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.constructor(p8)
    p8.Name = "RiddleController"
    p8.riddleCache = {}
end
function u5.KnitStart(u9) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
    --]]
    u3.KnitStart(u9)
    u4.Client:Get("SendRiddleDataToPlayer"):Connect(function(p10, p11) --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        u9.riddleCache[p10] = p11
    end)
end
function u5.getRiddle(u12, u13) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u4
    --]]
    local u14 = u12.riddleCache[u13]
    if u14 then
        return u1.Promise.new(function(p15) --[[ Line: 40 ]]
            --[[
            Upvalues:
                [1] = u14
            --]]
            return p15(u14)
        end)
    end
    local v16 = u4.Client:Get("RequestRiddleData"):CallServerAsync(u13)
    v16:andThen(function(p17) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u13
        --]]
        u12.riddleCache[u13] = p17
    end)
    return v16
end
v2.CreateController(u5.new())
return nil