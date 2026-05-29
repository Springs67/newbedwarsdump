local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent, "combat", "projectile", "projectile-source-controller").ProjectileSourceController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "SpearSourceController"
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
function u11.constructor(p14, ...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
    --]]
    u6.constructor(p14, ...)
    p14.Name = "SpearSourceController"
    p14.chargingMaid = u4.new()
end
function u11.KnitStart(p15) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.KnitStart(p15)
end
function u11.isRelevantItem(_, p16) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    return (p16.itemType == u9.SPEAR or p16.itemType == u9.SAND_SPEAR) and true or p16.itemType == u9.HARPOON
end
function u11.onStartCharging(u17) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u5
        [3] = u7
    --]]
    local v18 = u8:playAnimation(u5.LocalPlayer, u7.SPEAR_STARTUP)
    if v18 then
        u17.chargingMaid:GiveTask(v18)
        u17.chargingMaid:GiveTask(v18.Stopped:Connect(function() --[[ Line: 41 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u5
                [3] = u7
                [4] = u17
            --]]
            local u19 = u8:playAnimation(u5.LocalPlayer, u7.SPEAR_IDLE, {
                ["looped"] = true
            })
            if u19 then
                u17.chargingMaid:GiveTask(function() --[[ Line: 46 ]]
                    --[[
                    Upvalues:
                        [1] = u19
                    --]]
                    u19:Stop()
                end)
            end
        end))
    end
end
function u11.onStopCharging(p20) --[[ Line: 53 ]]
    p20.chargingMaid:DoCleaning()
end
function u11.onLaunch(_) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u10
        [3] = u5
        [4] = u8
        [5] = u7
    --]]
    local v21 = u2
    local v22 = u10.SPEAR_THROW
    local v23 = {}
    local v24 = u5.LocalPlayer.Character
    if v24 ~= nil then
        v24 = v24:GetPrimaryPartCFrame().Position
    end
    v23.position = v24
    v23.parent = u5.LocalPlayer.Character
    v21:playSound(v22, v23)
    u8:playAnimation(u5.LocalPlayer, u7.SPEAR_THROW)
end
function u11.onStartReload(_) --[[ Line: 70 ]] end
function u11.onMaxCharge(_) --[[ Line: 72 ]] end
v3.CreateController(u11.new())
return nil