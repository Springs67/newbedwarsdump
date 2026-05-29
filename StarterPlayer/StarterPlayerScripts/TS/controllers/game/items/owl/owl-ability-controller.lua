local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AbilityState
local u5 = v3.AnimationUtil
local u6 = v3.RandomUtil
local u7 = v3.SoundManager
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v9 = v8.KnitClient
local u10 = v8.KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.Players
local u16 = v14.ReplicatedStorage
local u17 = v14.RunService
local u18 = v14.TweenService
local u19 = v14.Workspace
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "owl-balance-file").OwlBalance
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "cloud", "cloud-enchant-util").CloudEnchantUtil
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "owl", "owl-status").OwlStatus
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u33 = v1.import(script, script.Parent, "owl-util").OwlUtil
local u34 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 39 ]]
        return "OwlAbilityController"
    end,
    ["__index"] = u21
})
u34.__index = u34
function u34.new(...) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u34
    --]]
    local v35 = u34
    local v36 = setmetatable({}, v35)
    return v36:constructor(...) or v36
end
function u34.constructor(p37) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u12
    --]]
    u21.constructor(p37)
    p37.Name = "OwlAbilityController"
    p37.nextLiftReadyTime = -1
    p37.maid = u12.new()
    p37.owlLiftAbilityEnabled = false
end
function u34.KnitStart(u38) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u20
        [3] = u11
        [4] = u2
        [5] = u22
        [6] = u23
        [7] = u27
        [8] = u4
        [9] = u17
        [10] = u29
        [11] = u19
        [12] = u28
        [13] = u32
        [14] = u33
        [15] = u30
        [16] = u15
    --]]
    u21.KnitStart(u38)
    u20.OwlNewTarget:setPriority(u11.LOWEST):connect(function(p39) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u2
            [3] = u22
            [4] = u23
            [5] = u27
            [6] = u4
        --]]
        if p39.target then
            u38.target = p39.target
            task.wait(0.5)
            u38.maid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u22.OWL_LIFT, u23[u22.OWL_LIFT].triggerConfig):expect())
            u38.maid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u22.OWL_HEAL, u23[u22.OWL_HEAL].triggerConfig):expect())
            u38.owlLiftAbility = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u22.OWL_LIFT)
            if u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(u27.OWL_LIFT) > 0.1 then
                u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u38.owlLiftAbility, u4.ON_COOLDOWN)
            end
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u38.owlLiftAbility, u4.DISABLED)
        else
            u38.target = nil
            u38.maid:DoCleaning()
        end
    end)
    u17.Heartbeat:Connect(function() --[[ Line: 78 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u29
            [3] = u19
            [4] = u28
            [5] = u2
            [6] = u27
            [7] = u4
        --]]
        if not (u38.target and u38.owlLiftAbility) then
            return nil
        end
        local v40 = u38.target.Character
        if v40 ~= nil then
            v40 = v40.PrimaryPart
        end
        local v41 = u29:getEntity(u38.target)
        if v41 ~= nil then
            v41 = v41:getInstance()
        end
        if not (v40 and v41) then
            return nil
        end
        if v40.AssemblyLinearVelocity.Y < -20 and (u19:GetServerTimeNow() > u38.nextLiftReadyTime and (u28:isAboveVoid(v41) and not u38.owlLiftAbilityEnabled)) then
            u38.owlLiftAbilityEnabled = true
            if u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(u27.OWL_LIFT) < 0.1 then
                u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u38.owlLiftAbility, u4.READY)
            else
                u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u38.owlLiftAbility, u4.ON_COOLDOWN)
            end
        end
        if u38.owlLiftAbilityEnabled and not u28:isAboveVoid(v41) then
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u38.owlLiftAbility, u4.DISABLED)
            u38.owlLiftAbilityEnabled = false
        end
    end)
    u32.Client:Get("ToggleOwlLiftForce"):Connect(function(p42, p43, p44) --[[ Line: 108 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u30
            [3] = u38
            [4] = u15
        --]]
        if p44 then
            local v45 = u33:getOwlClientModelByUser(p42)
            if not v45 then
                return nil
            end
            v45:SetAttribute("Status", u30.LIFTING)
            u38:playHootSound(v45, p42)
            if p43 == u15.LocalPlayer then
                u38:applyLiftForce()
                return
            end
        else
            local v46 = u33:getOwlClientModelByUser(p42)
            if p43 == u15.LocalPlayer then
                u38:removeLiftForce()
            end
            if not v46 then
                return nil
            end
            v46:SetAttribute("Status", u30.DEFAULT)
        end
    end)
    u32.Client:Get("OwlHealEvent"):Connect(function(p47, p48) --[[ Line: 130 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u38
            [3] = u15
        --]]
        local v49 = u33:getOwlClientModelByUser(p47)
        if not v49 then
            return nil
        end
        u38:playHootSound(v49, p47)
        u38:healAnimation(p48, v49)
        if p48 == u15.LocalPlayer then
            u38:applySpeedBuff()
        end
    end)
    u20.AbilityUsed:connect(function(p50) --[[ Line: 141 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u38
            [3] = u22
            [4] = u32
        --]]
        if p50.userCharacter ~= u15.LocalPlayer.Character or not u38.target then
            return nil
        end
        if p50.ability == u22.OWL_LIFT or p50.ability == u22.OWL_HEAL then
            u32.Client:Get("OwlActionAbilities"):SendToServer({
                ["target"] = u38.target,
                ["ability"] = p50.ability
            })
        end
    end)
end
function u34.applyLiftForce(_) --[[ Line: 153 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u12
        [3] = u13
        [4] = u19
        [5] = u17
        [6] = u26
    --]]
    local u51 = u15.LocalPlayer.Character
    if u51 ~= nil then
        u51 = u51.PrimaryPart
    end
    if not u51 then
        return nil
    end
    local u52 = u12.new()
    local u53 = u51.AssemblyMass
    local v54 = u53 * u51.AssemblyLinearVelocity.Y * -1
    u51:ApplyImpulse((Vector3.new(0, v54, 0)))
    local v55 = u13
    local v56 = {
        ["Name"] = "OwlLiftForce"
    }
    local v57 = u19.Gravity * u53 * 1.05
    v56.Force = Vector3.new(0, v57, 0)
    v56.Parent = u51
    local u58 = v55("BodyForce", v56)
    u52:GiveTask(u58)
    u52:GiveTask(u17.Heartbeat:Connect(function() --[[ Line: 171 ]]
        --[[
        Upvalues:
            [1] = u51
            [2] = u58
            [3] = u19
            [4] = u53
        --]]
        if u51.AssemblyLinearVelocity.Y > 50 then
            u58:Destroy()
            return nil
        end
        if u51.AssemblyLinearVelocity.Y > 30 then
            local v59 = u58
            local v60 = u19.Gravity * u53 * 0.9
            v59.Force = Vector3.new(0, v60, 0)
            return nil
        end
        if u51.AssemblyLinearVelocity.Y > 25 then
            local v61 = u58
            local v62 = u19.Gravity * u53
            v61.Force = Vector3.new(0, v62, 0)
        end
    end))
    task.delay(u26.MAX_OWL_LIFT_DURATION, function() --[[ Line: 184 ]]
        --[[
        Upvalues:
            [1] = u52
        --]]
        u52:Destroy()
    end)
end
function u34.removeLiftForce(_) --[[ Line: 188 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v63 = u15.LocalPlayer.Character
    if v63 ~= nil then
        v63 = v63.PrimaryPart
    end
    if v63 ~= nil then
        v63 = v63:FindFirstChild("OwlLiftForce")
    end
    if v63 ~= nil then
        v63:Destroy()
    end
end
function u34.applySpeedBuff(_) --[[ Line: 204 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u26
    --]]
    local u64 = u10.Controllers.SprintController:getMovementStatusModifier():addModifier({
        ["moveSpeedMultiplier"] = u26.OWL_SPEED_BUFF_MULTIPLIER
    })
    task.delay(u26.OWL_SPEED_BUFF_DURATION, function() --[[ Line: 208 ]]
        --[[
        Upvalues:
            [1] = u64
        --]]
        u64.Destroy()
    end)
end
function u34.healAnimation(_, p65, u66) --[[ Line: 212 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u25
        [3] = u24
        [4] = u12
        [5] = u13
        [6] = u31
        [7] = u18
        [8] = u16
    --]]
    if not u66.PrimaryPart then
        return nil
    end
    if not p65.Character then
        return nil
    end
    local v67 = u66.PrimaryPart:FindFirstChild("bulletOrigin")
    local v68 = p65.Character:WaitForChild("UpperTorso")
    if v68 ~= nil then
        v68 = v68:WaitForChild("BodyFrontAttachment")
    end
    if not (v67 and v68) then
        return nil
    end
    local v69 = u5:playAnimation(u66, u25:getAssetId(u24.OWL_HEAL))
    if not v69 then
        return nil
    end
    local u70 = u12.new()
    v69:AdjustSpeed(0.75)
    u70:GiveTask(v69)
    local v71 = u13("Beam", {
        ["TextureSpeed"] = 2,
        ["Width0"] = 1,
        ["Width1"] = 0.5,
        ["FaceCamera"] = true,
        ["Attachment0"] = v67,
        ["Attachment1"] = v68,
        ["Texture"] = u31.WHITE_BEAM_ARROW,
        ["Color"] = ColorSequence.new(Color3.fromRGB(3, 176, 201)),
        ["Parent"] = v67
    })
    u70:GiveTask(v71)
    local v72 = u18:Create(v71, TweenInfo.new(2), {
        ["Width0"] = 3,
        ["Width1"] = 1.5
    })
    u70:GiveTask(v72)
    v72:Play()
    local v73 = u16.Assets.Effects.OwlHealEffect:Clone()
    v73.Position = v68.WorldPosition
    v73.Parent = p65.Character
    u70:GiveTask(v73)
    local v74 = {
        ["Part0"] = v73
    }
    local v75 = p65.Character
    if v75 ~= nil then
        v75 = v75.PrimaryPart
    end
    v74.Part1 = v75
    v74.Parent = v73
    u70:GiveTask(u13("WeldConstraint", v74))
    u70:GiveTask(v69.Stopped:Connect(function() --[[ Line: 269 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u66
            [3] = u25
            [4] = u24
            [5] = u70
        --]]
        u5:playAnimation(u66, u25:getAssetId(u24.OWL_FLY))
        u70:Destroy()
    end))
end
function u34.playHootSound(_, p76, p77) --[[ Line: 274 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u33
        [3] = u7
    --]]
    local v78 = u33
    local v79 = u6.fromList(unpack(v78:getOwlHootSound(p77)))
    local v80 = u7
    local v81 = {}
    local v82 = p76.PrimaryPart
    if v82 ~= nil then
        v82 = v82.Position
    end
    v81.position = v82
    v81.rollOffMaxDistance = 220
    v81.volumeMultiplier = 1.2
    v80:playSound(v79, v81)
end
v9.CreateController(u34.new())
return nil