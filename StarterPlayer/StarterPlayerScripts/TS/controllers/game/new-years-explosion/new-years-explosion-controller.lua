local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-type").ExplosionType
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "NewYearsExplosionController"
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
    p10.Name = "NewYearsExplosionController"
end
function u7.KnitStart(p11) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u5
        [4] = u2
        [5] = u6
    --]]
    u4.KnitStart(p11)
    u3.ExplosionEffect:connect(function(p12) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u2
            [3] = u6
        --]]
        if p12.explosionType == u5.NEW_YEARS_PARTY_CANNON then
            u2.Controllers.FireworkController:playFireworkEffect(p12.position, u6.NEW_YEARS, {
                ["sizeMultiplier"] = 0.75,
                ["volumeMultiplier"] = 0.075
            })
        end
    end)
end
u2.CreateController(u7.new())
return nil