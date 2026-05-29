local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "OilProjectileController"
    end,
    ["__index"] = u7
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
function u12.constructor(p15, ...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
    --]]
    u7.constructor(p15, ...)
    p15.Name = "OilProjectileController"
    p15.Client = {}
    p15.eatingMaid = u4.new()
end
function u12.KnitStart(p16) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
        [3] = u2
        [4] = u11
    --]]
    u7.KnitStart(p16)
    u6.ProjectileLaunched:connect(function(p17) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u11
        --]]
        if p17.projectileType == "oil_projectile" then
            u2:playSound(u11.GOO_SPIT, {
                ["rollOffMaxDistance"] = 150,
                ["position"] = p17.origin
            })
        end
    end)
end
function u12.isRelevantItem(_, p18) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    return p18.itemType == u10.OIL_CONSUMABLE
end
function u12.onStartCharging(p19) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u11
        [3] = u5
        [4] = u9
        [5] = u8
    --]]
    local v20 = u2
    local v21 = u11.GOO_EAT
    local v22 = {}
    local v23 = u5.LocalPlayer.Character
    if v23 ~= nil then
        v23 = v23:GetPrimaryPartCFrame().Position
    end
    v22.position = v23
    v22.parent = u5.LocalPlayer.Character
    v22.rollOffMaxDistance = 100
    v22.looped = true
    local u24 = v20:playSound(v21, v22)
    if u24 then
        p19.eatingMaid:GiveTask(function() --[[ Line: 62 ]]
            --[[
            Upvalues:
                [1] = u24
            --]]
            u24:Stop()
            u24:Destroy()
        end)
    end
    local u25 = u9:playAnimation(u5.LocalPlayer, u8.OIL_EAT, {
        ["looped"] = true
    })
    if u25 then
        p19.eatingMaid:GiveTask(function() --[[ Line: 71 ]]
            --[[
            Upvalues:
                [1] = u25
            --]]
            u25:Stop()
        end)
    end
end
function u12.onStopCharging(p26) --[[ Line: 76 ]]
    p26.eatingMaid:DoCleaning()
end
function u12.onLaunch(_) --[[ Line: 79 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u5
        [3] = u8
    --]]
    u9:playAnimation(u5.LocalPlayer, u8.OIL_SPIT, {
        ["looped"] = false
    })
end
function u12.onStartReload(_) --[[ Line: 84 ]] end
function u12.onMaxCharge(_) --[[ Line: 86 ]] end
v3.CreateController(u12.new())
return nil