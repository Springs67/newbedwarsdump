local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "base-kit-controller").BaseKitController
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u5 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "AxolotlKitController"
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
        [2] = u4
    --]]
    u3.constructor(p8, u4.AXOLOTL)
    p8.Name = "AxolotlKitController"
end
function u5.KnitStart(p9) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.KnitStart(p9)
end
function u5.onKitLocalActivated(_, _) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    u2.Controllers.PreloadController:runPreload({
        ["imageIds"] = {
            "rbxassetid://7863780357",
            "rbxassetid://7863780231",
            "rbxassetid://7863779927",
            "rbxassetid://7863780097"
        }
    })
end
function u5.onKitLocalDeactivated(_) --[[ Line: 32 ]] end
function u5.onKitReplicationActivated(_, _) --[[ Line: 34 ]] end
function u5.onKitReplicationDeactivated(_) --[[ Line: 36 ]] end
function u5.onInnateAbilityEnabled(_, _, _) --[[ Line: 38 ]] end
function u5.onAbilityUsed(_, _, _) --[[ Line: 40 ]] end
u2.CreateController(u5.new())
return nil