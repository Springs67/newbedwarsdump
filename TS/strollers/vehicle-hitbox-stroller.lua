local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out")
local v4 = v3.Controller
local v5 = v3.Service
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "VehicleHitboxStroller"
    end
})
u6.__index = u6
function u6.new(...) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(_) --[[ Line: 19 ]] end
function u6.onStart(_) --[[ Line: 21 ]] end
v2.defineMetadata(u6, "identifier", "shared/strollers/vehicle-hitbox-stroller@VehicleHitboxStroller")
v2.defineMetadata(u6, "flamework:implements", { "$:flamework@OnStart" })
v2.decorate(u6, "$:flamework@Service", v5, {
    {}
})
v2.decorate(u6, "$:flamework@Controller", v4, {
    {}
})
return {
    ["VehicleHitboxStroller"] = u6
}