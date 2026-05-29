local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
v1.import(script, script.Parent, "alchemist-flask-controller")
local u4 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u5 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "AlchemistKitController"
    end,
    ["__index"] = u4
})
u5.__index = u5
function u5.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v6 = u5
    local v7 = setmetatable({}, v6)
    return v7:constructor(...) or v7
end
function u5.constructor(p8) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
    --]]
    u4.constructor(p8, u3.ALCHEMIST)
    p8.Name = "AlchemistKitController"
end
function u5.KnitStart(p9) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.KnitStart(p9)
end
function u5.onKitLocalActivated(_, _) --[[ Line: 29 ]] end
function u5.onKitLocalDeactivated(_) --[[ Line: 31 ]] end
function u5.onKitReplicationActivated(_, _) --[[ Line: 33 ]] end
function u5.onKitReplicationDeactivated(_) --[[ Line: 35 ]] end
function u5.onInnateAbilityEnabled(_, _, _) --[[ Line: 37 ]] end
function u5.onAbilityUsed(_, _, _) --[[ Line: 39 ]] end
v2.CreateController(u5.new())
return nil