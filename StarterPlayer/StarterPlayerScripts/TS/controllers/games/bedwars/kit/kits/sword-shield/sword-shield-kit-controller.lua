local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u5 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "SwordShieldKitController"
    end,
    ["__index"] = u5
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
        [1] = u5
        [2] = u3
        [3] = u4
    --]]
    u5.constructor(p9, u3.SWORD_SHIELD, {
        ["sounds"] = {
            u4.WOOD_SHIELD_BREAK,
            u4.WOOD_SHIELD_REACTIVE,
            u4.STONE_SHIELD_BREAK,
            u4.STONE_SHIELD_REACTIVE,
            u4.IRON_SHIELD_BREAK,
            u4.IRON_SHIELD_REACTIVE,
            u4.DIAMOND_SHIELD_BREAK,
            u4.DIAMOND_SHIELD_REACTIVE,
            u4.EMERALD_SHIELD_BREAK,
            u4.EMERALD_SHIELD_REACTIVE
        }
    })
    p9.Name = "SwordShieldKitController"
end
function u6.KnitStart(p10) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.KnitStart(p10)
end
function u6.onKitLocalActivated(_, _) --[[ Line: 30 ]] end
function u6.onKitLocalDeactivated(_) --[[ Line: 32 ]] end
function u6.onKitReplicationActivated(_, _) --[[ Line: 34 ]] end
function u6.onKitReplicationDeactivated(_) --[[ Line: 36 ]] end
function u6.onInnateAbilityEnabled(_, _, _) --[[ Line: 38 ]] end
function u6.onAbilityUsed(_, _, _) --[[ Line: 40 ]] end
v2.CreateController(u6.new())
return nil