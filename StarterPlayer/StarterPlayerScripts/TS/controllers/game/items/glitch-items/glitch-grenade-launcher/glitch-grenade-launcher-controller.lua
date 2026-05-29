local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "GlitchGrenadeLauncherController"
    end,
    ["__index"] = u6
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p15)
    p15.Name = "GlitchGrenadeLauncherController"
end
function u12.isRelevantItem(_, p16) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    return p16.itemType == u10.GLITCH_GRENADE_LAUNCHER
end
function u12.onEnable(p17, _, _) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u8
    --]]
    p17:setupYield(function() --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u2
            [3] = u8
        --]]
        local u18 = u4.new()
        u18:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(u8.GLITCH_GRENADE_LAUNCHER))
        return function() --[[ Line: 38 ]]
            --[[
            Upvalues:
                [1] = u18
            --]]
            u18:DoCleaning()
        end
    end)
end
function u12.onDisable(_) --[[ Line: 43 ]] end
function u12.KnitStart(p19) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
        [3] = u10
        [4] = u7
        [5] = u11
        [6] = u5
        [7] = u2
        [8] = u8
        [9] = u9
    --]]
    u6.KnitStart(p19)
    u3.Controllers.PreloadController:preloadForItemType(u10.GLITCH_GRENADE_LAUNCHER, {
        ["animations"] = { u7.ROCKET_LAUNCHER_IDLE, u7.ROCKET_LAUNCHER_SHOT },
        ["sounds"] = { u11.CARROT_LAUNCHER_FIRE }
    })
    u5.ProjectileLaunched:connect(function(p20) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u8
            [3] = u9
            [4] = u10
        --]]
        if p20:isLocalShooter() and p20.projectileType == "glitch_stun_grenade" then
            u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(u8.GLITCH_GRENADE_LAUNCHER, u9(u10.GLITCH_GRENADE_LAUNCHER).projectileSource.fireDelaySec)
        end
    end)
end
u3.CreateController(u12.new())
return nil