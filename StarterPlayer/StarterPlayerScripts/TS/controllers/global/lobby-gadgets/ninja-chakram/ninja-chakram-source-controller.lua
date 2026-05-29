local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent, "combat", "projectile", "projectile-source-controller").ProjectileSourceController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "ninja", "ninja-kit-util").NinjaKitUtil
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "NinjaChakramSourceController"
    end,
    ["__index"] = u5
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12, ...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
    --]]
    u5.constructor(p12, ...)
    p12.Name = "NinjaChakramSourceController"
    p12.chargingMaid = u3.new()
end
function u9.KnitStart(p13) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.KnitStart(p13)
end
function u9.isRelevantItem(_, p14) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    return u8:isItemTypeChakram(p14.itemType)
end
function u9.onStartCharging(u15) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
        [3] = u6
    --]]
    local v16 = u7:playAnimation(u4.LocalPlayer, u6.SPEAR_STARTUP)
    if v16 then
        u15.chargingMaid:GiveTask(v16)
        u15.chargingMaid:GiveTask(v16.Stopped:Connect(function() --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u4
                [3] = u6
                [4] = u15
            --]]
            local u17 = u7:playAnimation(u4.LocalPlayer, u6.SPEAR_IDLE, {
                ["looped"] = true
            })
            if u17 then
                u15.chargingMaid:GiveTask(function() --[[ Line: 44 ]]
                    --[[
                    Upvalues:
                        [1] = u17
                    --]]
                    u17:Stop()
                end)
            end
        end))
    end
end
function u9.onStopCharging(p18) --[[ Line: 51 ]]
    p18.chargingMaid:DoCleaning()
end
function u9.onLaunch(_) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
        [3] = u6
    --]]
    u7:playAnimation(u4.LocalPlayer, u6.NINJA_THROW_CHAKRAM_SHORTENED)
end
function u9.onStartReload(_) --[[ Line: 66 ]] end
function u9.onMaxCharge(_) --[[ Line: 68 ]] end
v2.CreateController(u9.new())
return nil