local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "RocketLauncherController"
    end,
    ["__index"] = u4
})
u8.__index = u8
function u8.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11, ...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p11, ...)
    p11.Name = "RocketLauncherController"
end
function u8.KnitStart(p12) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.KnitStart(p12)
end
function u8.onEnable(p13, p14, p15) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u3
        [4] = u5
    --]]
    u4.onEnable(p13, p14, p15)
    p13:setupYield(function() --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u3
            [3] = u5
        --]]
        local u16 = u6:playAnimation(u3.LocalPlayer, u5.ROCKET_LAUNCHER_IDLE, {
            ["looped"] = true
        })
        return function() --[[ Line: 37 ]]
            --[[
            Upvalues:
                [1] = u16
            --]]
            local v17 = u16
            if v17 ~= nil then
                v17:Stop()
            end
        end
    end)
end
function u8.onStartCharging(_) --[[ Line: 45 ]] end
function u8.onStopCharging(_) --[[ Line: 47 ]] end
function u8.onLaunch(u18) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
        [3] = u5
    --]]
    task.spawn(function() --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u6
            [3] = u3
            [4] = u5
        --]]
        u18.shootAnimation = u6:playAnimation(u3.LocalPlayer, u5.ROCKET_LAUNCHER_SHOT, {
            ["looped"] = false
        })
    end)
    return true
end
function u8.onStartReload(p19, p20) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
        [3] = u5
    --]]
    if p19.shootAnimation and p19.shootAnimation.IsPlaying then
        p19.shootAnimation.Stopped:Wait()
    end
    if not p20() then
        return nil
    end
    local u21 = u6:playAnimation(u3.LocalPlayer, u5.ROCKET_LAUNCHER_RELOAD, {
        ["looped"] = false
    })
    p19.maid:GiveTask(function() --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        local v22 = u21
        if v22 ~= nil then
            v22:Stop()
        end
    end)
end
function u8.isRelevantItem(_, p23) --[[ Line: 74 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    return p23.itemType == u7.ROCKET_LAUNCHER
end
v2.CreateController(u8.new())
return nil