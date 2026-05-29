local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, script.Parent.Parent.Parent, "stateful-entity", "ui", "stateful-entity-hp-bar-billboard").StatefulEntityHpBarBillboard
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "ScarabController"
    end,
    ["__index"] = u5
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
        [1] = u5
    --]]
    u5.constructor(p10)
    p10.Name = "ScarabController"
    p10.count = 0
end
function u7.KnitStart(u11) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
    --]]
    u5.KnitStart(u11)
    u3("Scarab", function(p12) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        u11:createEntityHealthbar(p12)
    end)
end
function u7.createEntityHealthbar(p13, p14, p15) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u6
    --]]
    local v16 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
    local v17 = {
        ["app"] = u6
    }
    local v18 = p13.count
    p13.count = p13.count + 1
    v17.appId = "StatefulEntityHpBarBillboard_Scarab" .. tostring(v18)
    v16:openApp(v17, {
        ["hpBarOffset"] = Vector3.new(0, 2, 0),
        ["gameEntity"] = p14,
        ["serverInstance"] = p14,
        ["barColor"] = p15
    }, nil, p14)
end
v4.CreateController(u7.new())
return nil