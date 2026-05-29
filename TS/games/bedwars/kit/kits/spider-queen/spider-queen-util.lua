local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u2 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 7 ]]
        return "SpiderQueenUtil"
    end
})
u2.__index = u2
function u2.new(...) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v3 = u2
    local v4 = setmetatable({}, v3)
    return v4:constructor(...) or v4
end
function u2.constructor(_) --[[ Line: 16 ]] end
u2.Abilities = {
    v1.SPIDER_QUEEN_SUMMON_SPIDERS,
    v1.SPIDER_QUEEN_WEB_BRIDGE_FIRE,
    v1.SPIDER_QUEEN_WEB_BRIDGE_CANCEL,
    v1.SPIDER_QUEEN_WEB_BRIDGE_AIM
}
u2.AlliedWebColor = Color3.fromRGB(255, 220, 255)
u2.EnemyWebColor = Color3.fromRGB(255, 150, 150)
u2.AimLineIndicatorColor = Color3.fromRGB(255, 118, 255)
u2.AlliedSpiderlingColor = Color3.fromRGB(180, 128, 255)
u2.EnemySpiderlingColor = Color3.fromRGB(196, 40, 28)
return {
    ["SpiderQueenUtil"] = u2
}