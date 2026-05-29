local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u5 = v1.import(script, script.Parent.Parent, "kit", "base-kit-controller").BaseKitController
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "FishermanKitController"
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
        [2] = u4
        [3] = u3
    --]]
    u5.constructor(p9, u4.FISHERMAN, {
        ["animations"] = {
            u3.FISHING_ROD_CAST,
            u3.FISHING_ROD_CATCH_FAIL,
            u3.FISHING_ROD_CATCH_SUCCESS,
            u3.FISHING_ROD_IDLE,
            u3.FISHING_ROD_PULLING
        }
    })
    p9.Name = "FishermanKitController"
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