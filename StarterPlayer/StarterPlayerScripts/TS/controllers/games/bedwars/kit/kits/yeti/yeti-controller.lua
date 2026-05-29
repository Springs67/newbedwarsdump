local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u8 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "YetiController"
    end,
    ["__index"] = u8
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u6
        [3] = u7
        [4] = u4
    --]]
    u8.constructor(p12, u6.YETI, {
        ["sounds"] = { u7.BREAK_FROZEN_BLOCK, u7.YETI_ROAR },
        ["animations"] = { u4.YETI_ROAR }
    })
    p12.Name = "YetiController"
end
function u9.onKitLocalActivated(_, _) --[[ Line: 31 ]] end
function u9.onKitLocalDeactivated(_) --[[ Line: 33 ]] end
function u9.onKitReplicationActivated(_, _) --[[ Line: 35 ]] end
function u9.onKitReplicationDeactivated(_) --[[ Line: 37 ]] end
function u9.onInnateAbilityEnabled(_, _, _) --[[ Line: 39 ]] end
function u9.onAbilityUsed(_, p13, p14) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u4
    --]]
    if p14.ability ~= u3.YETI_GLACIAL_ROAR then
        return nil
    end
    u5:playAnimation(p13, u4.YETI_ROAR)
end
v2.CreateController(u9.new())
return nil