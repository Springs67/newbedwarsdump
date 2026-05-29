local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u10 = v1.import(script, script.Parent, "gum-block-controller").FRIENDLY_BLOCK_COLOR
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "GumballLauncherEquippedController"
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
    p14.Name = "GumballLauncherEquippedController"
end
function u11.KnitStart(p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u2
        [4] = u7
        [5] = u8
        [6] = u9
        [7] = u10
    --]]
    u6.KnitStart(p15)
    u5.ProjectileLaunched:connect(function(p16) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u7
            [3] = u8
            [4] = u9
            [5] = u10
        --]]
        if p16:isLocalShooter() and p16.projectileType == "gumball" then
            local v17 = {
                ["cooldownBar"] = {
                    ["color"] = u10
                }
            }
            u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(u7.GUMBALL_LAUNCHER, u8(u9.GUMBALL_LAUNCHER).projectileSource.fireDelaySec, v17)
        end
    end)
end
function u11.isRelevantItem(_, p18) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    return p18.itemType == u9.GUMBALL_LAUNCHER
end
function u11.onEnable(p19, _, _) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u7
    --]]
    p19:setupYield(function() --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u2
            [3] = u7
        --]]
        local u20 = u4.new()
        u20:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(u7.GUMBALL_LAUNCHER))
        return function() --[[ Line: 49 ]]
            --[[
            Upvalues:
                [1] = u20
            --]]
            u20:DoCleaning()
        end
    end)
end
function u11.onDisable(_) --[[ Line: 54 ]] end
v3.CreateController(u11.new())
return nil