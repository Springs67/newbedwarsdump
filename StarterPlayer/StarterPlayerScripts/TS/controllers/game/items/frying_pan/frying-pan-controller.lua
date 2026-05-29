local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "charge-state").ChargeState
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "FryingPanController"
    end,
    ["__index"] = u7
})
u15.__index = u15
function u15.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
    --]]
    u7.constructor(p18)
    p18.Name = "FryingPanController"
    p18.animationMaid = u4.new()
end
function u15.KnitStart(u19) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u3
        [3] = u13
        [4] = u8
        [5] = u14
        [6] = u6
        [7] = u11
        [8] = u5
        [9] = u10
        [10] = u12
        [11] = u9
        [12] = u2
    --]]
    u7.KnitStart(u19)
    u3.Controllers.PreloadController:preloadForItemType(u13.FRYING_PAN, {
        ["animations"] = { u8.PAN_CHARGE },
        ["sounds"] = { u14.FRYING_PAN_CHARGE, u14.FRYING_PAN_HIT }
    })
    local u20 = nil
    u6.SwordCharge:connect(function(p21) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u5
            [3] = u13
            [4] = u10
            [5] = u12
            [6] = u20
            [7] = u9
            [8] = u8
            [9] = u19
            [10] = u2
            [11] = u14
        --]]
        u11:getEntity(u5.LocalPlayer)
        if p21.itemType ~= u13.FRYING_PAN then
            return nil
        end
        if p21.chargeState == u10.Charging then
            local v22 = u5.LocalPlayer.Character
            if v22 ~= nil then
                v22 = v22:FindFirstChild("Humanoid")
                if v22 ~= nil then
                    v22 = v22:FindFirstChild("Animator")
                end
            end
            if not v22 then
                return nil
            end
            local v23 = u12(p21.itemType)
            local v24 = v23.sword
            if v24 ~= nil then
                v24 = v24.chargedAttack
            end
            if not v24 then
                return nil
            end
            u20 = v22:LoadAnimation(u9:getAnimation(u8.PAN_CHARGE))
            local v25 = u20.Length / v23.sword.chargedAttack.maxChargeTimeSec
            u20:Play()
            u20:AdjustSpeed(v25)
            u20:GetMarkerReachedSignal("end"):Connect(function() --[[ Line: 71 ]]
                --[[
                Upvalues:
                    [1] = u20
                --]]
                local v26 = u20
                if v26 ~= nil then
                    v26:AdjustSpeed(0)
                end
            end)
            u19.animationMaid:GiveTask(function() --[[ Line: 77 ]]
                --[[
                Upvalues:
                    [1] = u20
                --]]
                local v27 = u20
                if v27 ~= nil then
                    v27:Stop()
                end
                local v28 = u20
                if v28 ~= nil then
                    v28:Destroy()
                end
            end)
            local u29 = u2:playSound(u14.FRYING_PAN_CHARGE)
            if u29 then
                u19.animationMaid:GiveTask(function() --[[ Line: 89 ]]
                    --[[
                    Upvalues:
                        [1] = u29
                    --]]
                    u29:Stop()
                end)
            end
        else
            local _ = p21.chargeState == u10.Charged
        end
        if p21.chargeState == u10.Idle then
            u19.animationMaid:DoCleaning()
        end
    end)
end
u3.CreateController(u15.new())
return nil