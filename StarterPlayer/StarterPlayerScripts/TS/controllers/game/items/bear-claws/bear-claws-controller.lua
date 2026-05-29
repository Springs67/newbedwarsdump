local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "charge-state").ChargeState
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v9.BEAR_CLAWS_FLURRY
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "BearClawsController"
    end,
    ["__index"] = u8
})
u15.__index = u15
function u15.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u12
        [3] = u11
    --]]
    u8.constructor(p18)
    p18.Name = "BearClawsController"
    p18.bearClawsType = u12.BEAR_CLAWS
    p18.chargeState = u11.Idle
end
function u15.KnitStart(u19) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
    --]]
    u8.KnitStart(u19)
    u7.SwordCharge:connect(function(p20) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        if p20.itemType == u19.bearClawsType then
            if u19:isCharging(p20.chargeState) then
                u19:handleCharging()
            elseif u19:isCharged(p20.chargeState) then
                u19:handleChargedSwipe()
            end
        end
        u19.chargeState = p20.chargeState
    end)
end
function u15.isCharging(_, p21) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    return p21 == u11.Charging
end
function u15.isCharged(p22, p23) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v24
    if p22.chargeState == u11.Charged then
        v24 = p23 == u11.Idle
    else
        v24 = false
    end
    return v24
end
function u15.handleCharging(_) --[[ Line: 59 ]] end
function u15.handleChargedSwipe(p25) --[[ Line: 61 ]]
    p25:playFlurryAnimation()
    p25:playFlurrySound()
end
function u15.playFlurryAnimation(_) --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
        [3] = u10
        [4] = u14
        [5] = u5
    --]]
    u3:playAnimation(u6.LocalPlayer, u10:getAssetId(u14))
    u5.Controllers.ViewmodelController:playAnimation(u14)
end
function u15.playFlurrySound(_) --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u13
    --]]
    task.delay(0.33, function() --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u13
        --]]
        u4:playSound(u13.BEAR_CLAWS_FLURRY)
    end)
end
u5.CreateController(u15.new())
return nil