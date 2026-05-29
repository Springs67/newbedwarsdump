local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scalePart
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.ReplicatedStorage
local u10 = v7.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-handler").ProjectileHandler
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "charge-state").ChargeState
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "HotPotatoController"
    end,
    ["__index"] = u13
})
u21.__index = u21
function u21.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24, ...) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u5
    --]]
    u13.constructor(p24, ...)
    p24.Name = "HotPotatoController"
    p24.animationMaid = u5.new()
end
function u21.KnitStart(u25) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u19
        [3] = u9
        [4] = u6
        [5] = u10
        [6] = u20
        [7] = u11
        [8] = u17
        [9] = u18
        [10] = u4
        [11] = u16
        [12] = u8
        [13] = u15
        [14] = u14
        [15] = u3
    --]]
    u13.KnitStart(u25)
    u19.Client:OnEvent("HotPotatoExplode", function(p26) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u6
            [3] = u10
            [4] = u20
        --]]
        local u27 = u9.Assets.Effects.Explosion:Clone()
        u6(u27, 3.5)
        u27.Parent = u10
        u20:playEffects({ u27 }, nil)
        u27.CFrame = CFrame.new(p26.position)
        task.delay(2, function() --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u27
            --]]
            u27:Destroy()
        end)
    end)
    u11.SwordChargedSwing:connect(function(p28) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u18
            [3] = u4
            [4] = u25
        --]]
        local v29 = u17(u18.HOT_POTATO)
        if not v29 then
            return nil
        end
        if p28.weapon.Name ~= u18.HOT_POTATO then
            return nil
        end
        local v30 = p28.chargedAttack
        if v30 ~= nil then
            v30 = v30.chargeTime
        end
        if v30 == 0 or (v30 ~= v30 or not v30) then
            return nil
        end
        if p28.chargedAttack.chargeTime < v29.sword.chargedAttack.minChargeTimeSec then
            u4.Controllers.DefaultProjectileSourceController:clearProjectileHandler()
            return nil
        end
        if p28.chargedAttack.chargeTime >= v29.sword.chargedAttack.maxChargeTimeSec then
            u25:fire(p28.fromPlayer, p28.weapon, p28.chargedAttack.chargeTime)
        end
    end)
    local u31 = nil
    local u32 = nil
    u11.SwordCharge:connect(function(u33) --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u16
            [3] = u8
            [4] = u17
            [5] = u31
            [6] = u15
            [7] = u14
            [8] = u32
            [9] = u3
            [10] = u25
        --]]
        if u33.itemType ~= u18.HOT_POTATO then
            return nil
        end
        task.spawn(function() --[[ Line: 83 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u16
                [3] = u8
                [4] = u17
                [5] = u31
                [6] = u15
                [7] = u14
                [8] = u32
                [9] = u3
                [10] = u25
            --]]
            if u33.chargeState == u16.Charging then
                u8.LocalPlayer:SetAttribute("IsCharging", true)
                local v34 = u8.LocalPlayer.Character
                if v34 ~= nil then
                    v34 = v34:FindFirstChild("Humanoid")
                    if v34 ~= nil then
                        v34 = v34:FindFirstChild("Animator")
                    end
                end
                if not v34 then
                    return nil
                end
                local v35 = u17(u33.itemType)
                local v36 = v35.sword
                if v36 ~= nil then
                    v36 = v36.chargedAttack
                end
                if not v36 then
                    return nil
                end
                local v37 = v35.sword
                if v37 ~= nil then
                    v37 = v37.chargedAttack.walkSpeedModifier
                    if v37 ~= nil then
                        v37 = v37.delay
                    end
                end
                local v38 = v37 == nil and 0 or v37
                task.wait(v38)
                local v39 = u8.LocalPlayer:GetAttribute("IsCharging")
                if v39 == 0 or (v39 ~= v39 or (v39 == "" or not v39)) then
                    return nil
                end
                u31 = v34:LoadAnimation(u15:getAnimation(u14.HEAVENLY_SWORD_CHARGE))
                u31:Play()
                u31:AdjustSpeed(0.683)
                u31:GetMarkerReachedSignal("end"):Connect(function() --[[ Line: 127 ]]
                    --[[
                    Upvalues:
                        [1] = u31
                    --]]
                    local v40 = u31
                    if v40 ~= nil then
                        v40:AdjustSpeed(0)
                    end
                end)
                u32 = u3.Controllers.ViewmodelController:playAnimation(u14.FP_HEAVENLY_SWORD_CHARGE)
                if u32 then
                    u32:GetMarkerReachedSignal("end"):Connect(function() --[[ Line: 136 ]]
                        --[[
                        Upvalues:
                            [1] = u32
                        --]]
                        local v41 = u32
                        if v41 ~= nil then
                            v41:AdjustSpeed(0)
                        end
                    end)
                end
                u25.animationMaid:GiveTask(function() --[[ Line: 143 ]]
                    --[[
                    Upvalues:
                        [1] = u31
                        [2] = u32
                    --]]
                    local v42 = u31
                    if v42 ~= nil then
                        v42:Stop()
                    end
                    local v43 = u31
                    if v43 ~= nil then
                        v43:Destroy()
                    end
                    local v44 = u32
                    if v44 ~= nil then
                        v44:Stop()
                    end
                    local v45 = u32
                    if v45 ~= nil then
                        v45:Destroy()
                    end
                end)
            else
                local _ = u33.chargeState == u16.Charged
            end
            if u33.chargeState == u16.Idle then
                u8.LocalPlayer:SetAttribute("IsCharging", false)
                local v46 = u31
                if v46 ~= nil then
                    v46:Stop()
                end
                local v47 = u31
                if v47 ~= nil then
                    v47:Destroy()
                end
                local v48 = u32
                if v48 ~= nil then
                    v48:Stop()
                end
                local v49 = u32
                if v49 ~= nil then
                    v49:Destroy()
                end
                u25.animationMaid:DoCleaning()
            end
        end)
    end)
end
function u21.fire(_, _, p50, p51) --[[ Line: 186 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u18
        [3] = u4
        [4] = u12
    --]]
    local v52 = u17(u18.HOT_POTATO)
    if not v52 then
        return nil
    end
    local v53 = u4.Controllers.DefaultProjectileSourceController:getProjectileHandler() or u12.new(1, 1, "hot_potato", nil, nil, Vector3.new(0, 2, 0), 0, nil)
    u4.Controllers.DefaultProjectileSourceController:clearProjectileHandler()
    local v54
    if v52.sword.chargedAttack.maxChargeTimeSec - (v52.sword.chargedAttack.maxChargeTimeSec - v52.sword.chargedAttack.minChargeTimeSec) / 2.5 <= p51 then
        v54 = u18.HOT_POTATO
    else
        v54 = nil
    end
    u4.Controllers.ProjectileController:launchProjectile(u18.HOT_POTATO, v54, v53, p50, v52.projectileSource)
end
u3.CreateController(u21.new())
return nil