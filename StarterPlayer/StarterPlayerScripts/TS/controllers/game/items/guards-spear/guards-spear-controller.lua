local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.Players
local u7 = v5.Workspace
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "charge-state").ChargeState
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "GuardsSpearController"
    end,
    ["__index"] = u9
})
u16.__index = u16
function u16.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u4
    --]]
    u9.constructor(p19)
    p19.Name = "GuardsSpearController"
    p19.animationMaid = u4.new()
    p19.nextAttack = -1
end
function u16.KnitStart(u20) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
        [3] = u14
        [4] = u7
        [5] = u11
        [6] = u6
        [7] = u10
        [8] = u3
        [9] = u2
        [10] = u15
        [11] = u12
        [12] = u13
    --]]
    u9.KnitStart(u20)
    u8.SwordChargedSwing:connect(function(p21) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u20
            [3] = u7
            [4] = u11
            [5] = u6
            [6] = u10
            [7] = u3
            [8] = u2
            [9] = u15
        --]]
        if p21.weapon.Name ~= u14.GUARDS_SPEAR then
            return nil
        end
        local v22 = p21.chargedAttack
        if v22 ~= nil then
            v22 = v22.chargeTime
        end
        if v22 == 0 or (v22 ~= v22 or not v22) then
            if u20.nextAttack > u7:GetServerTimeNow() then
                return nil
            end
            u11:playAnimation(u6.LocalPlayer, u10.TWIRLBLADE_ATTACK_2)
            u3.Controllers.ViewmodelController:playAnimation(u10.FP_TWIRLBLADE_ATTACK_2)
            u2:playSound(u15.SPEAR_STAB_1)
            u20.nextAttack = u7:GetServerTimeNow() + 0.45
            return nil
        end
        if p21.chargedAttack.chargeTime < 0.2 then
            if u20.nextAttack > u7:GetServerTimeNow() then
                return nil
            end
            u11:playAnimation(u6.LocalPlayer, u10.TWIRLBLADE_ATTACK_2)
            u3.Controllers.ViewmodelController:playAnimation(u10.FP_TWIRLBLADE_ATTACK_2)
            u20.nextAttack = u7:GetServerTimeNow() + 0.45
            u2:playSound(u15.SPEAR_STAB_2)
            return nil
        end
        u11:playAnimation(u6.LocalPlayer, u10.SPEAR_STAB_1)
        u3.Controllers.ViewmodelController:playAnimation(u10.FP_SPEAR_STAB)
        u20.nextAttack = u7:GetServerTimeNow() + 0.2
        u2:playSound(u15.SPEAR_STAB_3)
    end)
    local u23 = nil
    local u24 = nil
    u8.SwordCharge:connect(function(u25) --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u7
            [3] = u20
            [4] = u12
            [5] = u6
            [6] = u13
            [7] = u23
            [8] = u11
            [9] = u10
            [10] = u24
            [11] = u3
        --]]
        if u25.itemType ~= u14.GUARDS_SPEAR then
            return nil
        end
        if u7:GetServerTimeNow() < u20.nextAttack then
            return nil
        end
        task.spawn(function() --[[ Line: 82 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u12
                [3] = u6
                [4] = u13
                [5] = u20
                [6] = u23
                [7] = u11
                [8] = u10
                [9] = u24
                [10] = u3
            --]]
            if u25.chargeState == u12.Charging then
                u6.LocalPlayer:SetAttribute("IsCharging", true)
                local v26 = u6.LocalPlayer.Character
                if v26 ~= nil then
                    v26 = v26:FindFirstChild("Humanoid")
                    if v26 ~= nil then
                        v26 = v26:FindFirstChild("Animator")
                    end
                end
                if not v26 then
                    return nil
                end
                local v27 = u13(u25.itemType).sword
                if v27 ~= nil then
                    v27 = v27.chargedAttack
                end
                if not v27 then
                    return nil
                end
                u20:playSound()
                task.wait(0.1)
                local v28 = u6.LocalPlayer:GetAttribute("IsCharging")
                if v28 == 0 or (v28 ~= v28 or (v28 == "" or not v28)) then
                    return nil
                end
                u23 = v26:LoadAnimation(u11:getAnimation(u10.SPEAR_CHARGE_1))
                u23:Play()
                u23:GetMarkerReachedSignal("end"):Connect(function() --[[ Line: 114 ]]
                    --[[
                    Upvalues:
                        [1] = u23
                    --]]
                    local v29 = u23
                    if v29 ~= nil then
                        v29:AdjustSpeed(0)
                    end
                end)
                u24 = u3.Controllers.ViewmodelController:playAnimation(u10.FP_SPEAR_CHARGE)
                if u24 then
                    u24:GetMarkerReachedSignal("end"):Connect(function() --[[ Line: 124 ]]
                        --[[
                        Upvalues:
                            [1] = u24
                        --]]
                        local v30 = u24
                        if v30 ~= nil then
                            v30:AdjustSpeed(0)
                        end
                    end)
                end
                u20.animationMaid:GiveTask(function() --[[ Line: 131 ]]
                    --[[
                    Upvalues:
                        [1] = u23
                        [2] = u24
                    --]]
                    local v31 = u23
                    if v31 ~= nil then
                        v31:Stop()
                    end
                    local v32 = u23
                    if v32 ~= nil then
                        v32:Destroy()
                    end
                    local v33 = u24
                    if v33 ~= nil then
                        v33:Stop()
                    end
                    local v34 = u24
                    if v34 ~= nil then
                        v34:Destroy()
                    end
                end)
            else
                local _ = u25.chargeState == u12.Charged
            end
            if u25.chargeState == u12.Idle then
                u6.LocalPlayer:SetAttribute("IsCharging", false)
                local v35 = u23
                if v35 ~= nil then
                    v35:Stop()
                end
                local v36 = u23
                if v36 ~= nil then
                    v36:Destroy()
                end
                local v37 = u24
                if v37 ~= nil then
                    v37:Stop()
                end
                local v38 = u24
                if v38 ~= nil then
                    v38:Destroy()
                end
                u20.animationMaid:DoCleaning()
            end
        end)
    end)
end
function u16.playSound(p39) --[[ Line: 174 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u15
    --]]
    local u40 = u2:playSound(u15.SPEAR_CHARGE)
    if u40 then
        p39.animationMaid:GiveTask(function() --[[ Line: 177 ]]
            --[[
            Upvalues:
                [1] = u40
            --]]
            u40:Stop()
        end)
    end
end
u3.CreateController(u16.new())
return nil