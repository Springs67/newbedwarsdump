local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tnt-wars", "cannon-constants").MANUAL_CANNON_CONFIG
local u4 = v1.import(script, script.Parent.Parent, "base-cannon-controller").BaseCannonController
local u5 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "ManualCannonController"
    end,
    ["__index"] = u4
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
        [1] = u4
        [2] = u3
    --]]
    u4.constructor(p8, u3)
    p8.Name = "ManualCannonController"
end
function u5.onFire(_) --[[ Line: 24 ]] end
v2.CreateController(u5.new())
return {
    ["ManualCannonController"] = u5
}