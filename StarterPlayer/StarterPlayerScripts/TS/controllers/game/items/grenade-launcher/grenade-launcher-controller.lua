local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "GrenadeLauncherController"
    end,
    ["__index"] = u6
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p14)
    p14.Name = "GrenadeLauncherController"
end
function u11.isRelevantItem(_, p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    return p15.itemType == u9.GRENADE_LAUNCHER
end
function u11.onEnable(p16, _, _) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u8
    --]]
    p16:setupYield(function() --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u2
            [3] = u8
        --]]
        local u17 = u4.new()
        u17:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(u8.GRENADE_LAUNCHER))
        return function() --[[ Line: 37 ]]
            --[[
            Upvalues:
                [1] = u17
            --]]
            u17:DoCleaning()
        end
    end)
end
function u11.onDisable(_) --[[ Line: 42 ]] end
function u11.KnitStart(p18) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
        [3] = u9
        [4] = u7
        [5] = u10
        [6] = u5
    --]]
    u6.KnitStart(p18)
    u3.Controllers.PreloadController:preloadForItemType(u9.GRENADE_LAUNCHER, {
        ["animations"] = { u7.ROCKET_LAUNCHER_IDLE, u7.ROCKET_LAUNCHER_SHOT },
        ["sounds"] = { u10.CARROT_LAUNCHER_FIRE }
    })
    u5.ProjectileLaunched:connect(function(p19) --[[ Line: 50 ]]
        if p19:isLocalShooter() then
            local _ = p19.projectileType == "stun_grenade"
        end
    end)
end
u3.CreateController(u11.new())
return nil