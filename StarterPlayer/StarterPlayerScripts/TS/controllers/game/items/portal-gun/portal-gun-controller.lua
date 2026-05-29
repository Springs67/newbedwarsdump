local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "PortalGunController"
    end,
    ["__index"] = u7
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p16)
    p16.Name = "PortalGunController"
end
function u13.KnitStart(p17) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
        [3] = u2
        [4] = u9
        [5] = u10
        [6] = u11
        [7] = u3
        [8] = u12
        [9] = u4
        [10] = u8
    --]]
    u7.KnitStart(p17)
    u6.ProjectileLaunched:connect(function(p18) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u9
            [3] = u10
            [4] = u11
        --]]
        if p18:isLocalShooter() and p18.projectileType == "portal_projectile" then
            u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(u9.PORTAL_GUN, u10(u11.PORTAL_GUN).projectileSource.fireDelaySec)
        end
    end)
    u6.ProjectileRender:connect(function(p19) --[[ Line: 39 ]]
        if p19.projectile.Name == "portal_projectile" then
            p19.cframe = p19.cframe * CFrame.Angles(0, p19.totalTime * 2 * 3.141592653589793, 0)
        end
    end)
    u6.ProjectileLaunched:connect(function(p20) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u12
        --]]
        if p20.projectileType == "portal_projectile" then
            local v21 = u3:createSound(u12.TORNADO_LOOP)
            if not v21 then
                return nil
            end
            v21.Looped = true
            v21.Parent = p20.projectile.PrimaryPart
            v21:Play()
        end
    end)
    u4.Controllers.PreloadController:preloadForItemType(u11.PORTAL_GUN, {
        ["animations"] = { u8.TORNADO_LAUNCHER_SHOOT, u8.TORNADO_LAUNCHER_HOLD },
        ["sounds"] = { u12.TORNADO_LAUNCHER_SHOOT, u12.TORNADO_LOOP }
    })
end
function u13.isRelevantItem(_, p22) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    return p22.itemType == u11.PORTAL_GUN
end
function u13.onEnable(p23, _, _) --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u9
    --]]
    p23:setupYield(function() --[[ Line: 66 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u2
            [3] = u9
        --]]
        local u24 = u5.new()
        u24:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(u9.PORTAL_GUN))
        return function() --[[ Line: 69 ]]
            --[[
            Upvalues:
                [1] = u24
            --]]
            u24:DoCleaning()
        end
    end)
end
function u13.onDisable(_) --[[ Line: 74 ]] end
u4.CreateController(u13.new())
return nil