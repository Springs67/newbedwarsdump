local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u5 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u6 = v1.import(script, script.Parent, "ui", "raven-timer-app").RavenTimerApp
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "RavenKitController"
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
        [2] = u4
    --]]
    u5.constructor(p10, u4.RAVEN)
    p10.Name = "RavenKitController"
    p10.isPreloaded = false
end
function u7.onKitLocalActivated(p11, p12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
        [3] = u6
    --]]
    if not p11.isPreloaded then
        u2.Controllers.PreloadController:runPreload({
            ["imageIds"] = { "rbxassetid://7343272003" }
        })
        p11.isPreloaded = true
    end
    local u13 = u2.Controllers.StatusInfoListController:waitForSetupAddElement(u3.createElement(u6))
    p12:GiveTask(function() --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u13
        --]]
        u3.unmount(u13)
    end)
end
function u7.onAbilityUsed(_, _, _) --[[ Line: 39 ]] end
function u7.onKitLocalDeactivated(_) --[[ Line: 41 ]] end
function u7.onKitReplicationActivated(_, _) --[[ Line: 43 ]] end
function u7.onKitReplicationDeactivated(_) --[[ Line: 45 ]] end
function u7.onInnateAbilityEnabled(_, _, _) --[[ Line: 47 ]] end
u2.CreateController(u7.new())
return nil