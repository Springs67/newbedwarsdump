local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.Workspace
local u9 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "inventory-entity").InventoryEntity
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local v13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "grappling-hook", "grappling-hook-util")
local u14 = v13.GrapplingHookConst
local u15 = v13.GrapplingHookFunctions
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = u1.import(script, script.Parent, "grappling-hook-gun-handler").GrapplingHookGunHandler
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "GrapplingHookGunController"
    end,
    ["__index"] = u20
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
function u21.constructor(p24) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    u20.constructor(p24)
    p24.Name = "GrapplingHookGunController"
    p24.hook = "grappling_hook_projectile"
end
function u21.KnitStart(u25) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u17
        [3] = u15
        [4] = u2
        [5] = u10
        [6] = u14
        [7] = u18
        [8] = u7
        [9] = u9
        [10] = u16
        [11] = u12
        [12] = u1
        [13] = u11
        [14] = u5
        [15] = u4
        [16] = u3
        [17] = u19
        [18] = u8
    --]]
    u20.KnitStart(u25)
    u17.Client:Get("GrapplingHookFunctions"):Connect(function(p26) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u15
            [3] = u2
            [4] = u10
            [5] = u14
            [6] = u18
            [7] = u7
        --]]
        if p26.shotId == u25.shotId then
            local v27 = u25:getHookState() == u15.HOOK_FORWARD_TRANSIT
            local v28 = u25:getHookState() == u15.HOOK_BACKWARD_TRANSIT
            local v29 = u25:getHookState() == u15.PLAYER_IN_TRANSIT
            if p26.hitEntity then
                u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(u10.GRAPPLING_HOOK, u14.GRAPPLING_HOOK_HIT_COOLDOWN)
                u18.HookFunctionSwapEvent:fire(u7.LocalPlayer, p26.hookFunction)
                u25:transit(u7.LocalPlayer, p26.endGoal, p26.hitBasePart)
                return nil
            elseif v27 or v28 then
                u18.HookFunctionSwapEvent:fire(u7.LocalPlayer, p26.hookFunction)
                u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(u10.GRAPPLING_HOOK, u14.GRAPPLING_HOOK_HIT_COOLDOWN)
                u25:transit(u7.LocalPlayer, p26.endGoal, p26.hitBasePart)
            elseif v29 and p26.hookFunction == u15.HOOK_CHAMBERED then
                u18.HookFunctionSwapEvent:fire(u7.LocalPlayer, p26.hookFunction)
            end
        else
            return nil
        end
    end)
    u9.BeginProjectileTargeting:connect(function(p30) --[[ Line: 64 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u25
            [3] = u15
        --]]
        if p30.handItem.itemType ~= u16.GRAPPLING_HOOK then
            return nil
        end
        if not u25:canUseGrapplingHook() then
            p30:setCancelled(true)
            return nil
        end
        if u25:getHookState() ~= u15.HOOK_CHAMBERED then
            p30:setCancelled(true)
            return nil
        end
    end)
    u9.StartLaunchProjectile:connect(function(p31) --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u15
            [3] = u18
            [4] = u7
        --]]
        if p31:isCancelled() then
            return nil
        end
        if p31.projectileType ~= u25.hook then
            return nil
        end
        if not u25:canUseGrapplingHook() then
            p31:setCancelled(true)
            return nil
        end
        if u25:getHookState() ~= u15.HOOK_CHAMBERED then
            p31:setCancelled(true)
            return nil
        end
        u25:setHookState(u15.HOOK_FORWARD_TRANSIT)
        u18.HookFunctionSwapEvent:fire(u7.LocalPlayer, u15.HOOK_FORWARD_TRANSIT)
    end)
    u9.ProjectileLaunched:connect(function(p32) --[[ Line: 95 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u1
            [3] = u11
            [4] = u16
            [5] = u5
            [6] = u4
            [7] = u3
            [8] = u19
        --]]
        if p32:isCancelled() then
            return nil
        end
        if p32.projectileType ~= "grappling_hook_projectile" then
            return nil
        end
        if not p32.shooter then
            return nil
        end
        local v33 = u12:getEntity(p32.shooter)
        if not v33 then
            return nil
        end
        if u1.instanceof(v33, u11) then
            local v34 = v33:getItemInstanceFromCharacter(u16.GRAPPLING_HOOK)
            if not v34 then
                return nil
            end
            local v35 = p32.projectile:FindFirstChild("Handle")
            if not v35 then
                return nil
            end
            local u36 = p32.projectile:FindFirstChild("Handle")
            if u36 ~= nil then
                u36 = u36:FindFirstChild("RopeBeam")
            end
            if not u36 then
                return nil
            end
            local u37 = u5.new()
            u36.Destroying:Connect(function() --[[ Line: 127 ]]
                --[[
                Upvalues:
                    [1] = u37
                --]]
                u37:DoCleaning()
            end)
            local v38 = v34:FindFirstChild("Handle")
            if v38 ~= nil then
                v38 = v38:FindFirstChild("RopeAttachment")
            end
            if not v38 then
                return nil
            end
            local v39 = p32.projectile:FindFirstChild("Handle")
            if v39 ~= nil then
                v39 = v39:FindFirstChild("RopeAttachment")
            end
            if not v39 then
                return nil
            end
            if p32:isLocalShooter() and u4.Controllers.ViewmodelController:isVisible() then
                local v40 = u4.Controllers.ViewmodelController:getViewModel()
                if v40 ~= nil then
                    v40 = v40:FindFirstChild(u16.GRAPPLING_HOOK)
                    if v40 ~= nil then
                        v40 = v40:FindFirstChild("Handle")
                        if v40 ~= nil then
                            v40 = v40:FindFirstChild("RopeAttachment")
                        end
                    end
                end
                if v40 then
                    u36.Attachment0 = v40
                else
                    u36.Attachment0 = v38
                end
            else
                u36.Attachment0 = v38
            end
            local u41 = v33:getInstance():FindFirstChild("UpperTorso")
            if u41 ~= nil then
                u41 = u41:FindFirstChild("BodyFrontAttachment")
            end
            v38.Destroying:Connect(function() --[[ Line: 172 ]]
                --[[
                Upvalues:
                    [1] = u41
                    [2] = u36
                --]]
                if u41 and u36.Parent then
                    u36.Attachment0 = u41
                end
            end)
            local u42 = u3:playSound(u19.GRAPPLING_HOOK_EXTEND_LOOP, {
                ["rollOffMaxDistance"] = 150,
                ["looped"] = true,
                ["position"] = v35.Position,
                ["parent"] = v35
            })
            u37:GiveTask(function() --[[ Line: 183 ]]
                --[[
                Upvalues:
                    [1] = u42
                --]]
                local v43 = u42
                if v43 ~= nil then
                    v43:Stop()
                end
                local v44 = u42
                if v44 ~= nil then
                    v44:Destroy()
                end
            end)
        end
    end)
    u9.LocalProjectileImpact:connect(function(p45) --[[ Line: 195 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u8
        --]]
        if p45.projectile.Name ~= "grappling_hook_projectile" then
            return nil
        end
        local u46 = u5.new()
        local u47 = p45.projectile:Clone()
        u47.Parent = u8
        u46:GiveTask(function() --[[ Line: 202 ]]
            --[[
            Upvalues:
                [1] = u47
            --]]
            u47:Destroy()
        end)
        task.delay(1, function() --[[ Line: 205 ]]
            --[[
            Upvalues:
                [1] = u46
            --]]
            u46:DoCleaning()
        end)
        for _, v48 in u47:GetDescendants() do
            if v48:IsA("BasePart") then
                v48.Anchored = true
            end
        end
        local u49 = u47:FindFirstChild("Handle")
        if u49 ~= nil then
            u49 = u49:FindFirstChild("RopeBeam")
        end
        if not u49 then
            return nil
        end
        if u49.Attachment0 then
            local v50 = u49.Attachment0.Parent
            if v50 ~= nil then
                v50 = v50.Parent
                if v50 ~= nil then
                    v50 = v50:IsA("Accessory")
                end
            end
            local u51 = v50 and u49.Attachment0.Parent.Parent.Parent
            if u51 then
                u49.Attachment0.Destroying:Connect(function() --[[ Line: 232 ]]
                    --[[
                    Upvalues:
                        [1] = u51
                        [2] = u49
                    --]]
                    local v52 = u51:FindFirstChild("UpperTorso")
                    if v52 ~= nil then
                        v52 = v52:FindFirstChild("BodyFrontAttachment")
                    end
                    u49.Attachment0 = v52
                end)
            end
        end
    end)
end
function u21.canUseGrapplingHook(_) --[[ Line: 244 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u10
    --]]
    return not u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(u10.GRAPPLING_HOOK)
end
u4.CreateController(u21.new())
return nil