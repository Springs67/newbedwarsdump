local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local v4 = v3.ConstantManager
local u5 = v3.GameQueryUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.RunService
local u12 = v9.Workspace
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "grappling-hook", "grappling-hook-util")
local u17 = v16.GrapplingHookConst
local u18 = v16.GrapplingHookFunctions
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents
local u22 = v4.registerConstants(script, {
    ["FORCE_SCALAR"] = 400,
    ["RUNTIME_MULT"] = 0.12
})
local u23 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 31 ]]
        return "GrapplingHookGunHandler"
    end,
    ["__index"] = u14
})
u23.__index = u23
function u23.new(...) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    local v24 = u23
    local v25 = setmetatable({}, v24)
    return v25:constructor(...) or v25
end
function u23.constructor(p26) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u18
        [3] = u7
    --]]
    u14.constructor(p26)
    p26.Name = "GrapplingHookGunHandler"
    p26.grapplingHook = {
        ["state"] = u18.UNEQUIPPED
    }
    p26.maid = u7.new()
    p26.transitMaid = u7.new()
    p26.shotId = ""
end
function u23.KnitStart(u27) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u20
        [3] = u21
        [4] = u10
        [5] = u13
    --]]
    u14.KnitStart(u27)
    u20.Client:Get("CutGrappleLine"):Connect(function(_) --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27.transitMaid:DoCleaning()
    end)
    u21.HookFunctionSwapEvent:connect(function(p28) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u27
        --]]
        if p28.player ~= u10.LocalPlayer then
            return nil
        end
        u27.grapplingHook.state = p28.hookFunction
    end)
    u13.ProjectileLaunched:connect(function(p29) --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u27
        --]]
        if p29.shooter ~= u10.LocalPlayer.Character then
            return nil
        end
        local v30 = p29.launchData
        if v30 ~= nil then
            v30 = v30.shotId
        end
        u27.shotId = v30 == nil and "" or v30
    end)
end
function u23.getHookState(p31) --[[ Line: 77 ]]
    return p31.grapplingHook.state
end
function u23.setHookState(p32, p33) --[[ Line: 80 ]]
    p32.grapplingHook.state = p33
end
function u23.isRelevantItem(_, p34) --[[ Line: 83 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    return p34.itemType == u19.GRAPPLING_HOOK
end
function u23.onEnable(u35, _, _) --[[ Line: 86 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u21
        [3] = u10
        [4] = u7
        [5] = u2
        [6] = u15
    --]]
    u35.grapplingHook.state = u18.HOOK_CHAMBERED
    u21.HookFunctionSwapEvent:fire(u10.LocalPlayer, u18.HOOK_CHAMBERED)
    u35.maid:GiveTask(function() --[[ Line: 89 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u18
            [3] = u21
            [4] = u10
        --]]
        u35.grapplingHook.state = u18.UNEQUIPPED
        u21.HookFunctionSwapEvent:fire(u10.LocalPlayer, u18.UNEQUIPPED)
    end)
    u35:setupYield(function() --[[ Line: 93 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u2
            [3] = u15
        --]]
        local u36 = u7.new()
        u36:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(u15.GRAPPLING_HOOK))
        return function() --[[ Line: 96 ]]
            --[[
            Upvalues:
                [1] = u36
            --]]
            u36:DoCleaning()
        end
    end)
    return nil
end
function u23.onDisable(p37) --[[ Line: 102 ]]
    p37.maid:DoCleaning()
    return nil
end
function u23.transit(p38, u39, p40, _) --[[ Line: 106 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u5
        [3] = u12
        [4] = u8
        [5] = u6
        [6] = u17
        [7] = u11
        [8] = u22
    --]]
    local u41 = p40 + Vector3.new(0, 6, 0)
    if u39 ~= u10.LocalPlayer then
        return nil
    end
    local u42 = u39.Character
    local u43 = u39.Character
    if u43 ~= nil then
        u43 = u43:FindFirstChild("Humanoid")
    end
    if not (u42 and u43) then
        return nil
    end
    local v44 = u42.PrimaryPart
    if v44 == nil then
        return nil
    end
    local u45 = v44.AssemblyMass
    u42.PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 20, 0)
    if not u5:raycast(v44.Position + Vector3.new(0, -5, 0), Vector3.new(0, -100, 0)) and u43:GetState() == Enum.HumanoidStateType.Freefall then
        local v46 = u42.PrimaryPart
        local v47 = u12.Gravity / 3
        v46.AssemblyLinearVelocity = Vector3.new(0, v47, 0)
    end
    local _ = (u41 - u42.PrimaryPart.Position).Magnitude
    local v48 = {
        ["Name"] = "LiftForce",
        ["Force"] = Vector3.new(0, 0, 0),
        ["ApplyAtCenterOfMass"] = true,
        ["Parent"] = u43.RootPart,
        ["RelativeTo"] = Enum.ActuatorRelativeTo.World
    }
    local v49 = u43.RootPart
    if v49 ~= nil then
        v49 = v49:WaitForChild("RootRigAttachment")
    end
    v48.Attachment0 = v49
    local u50 = u8("VectorForce", v48)
    local v51 = {
        ["Name"] = "SwivelForce",
        ["Force"] = Vector3.new(0, 0, 0),
        ["ApplyAtCenterOfMass"] = true,
        ["Parent"] = u43.RootPart,
        ["RelativeTo"] = Enum.ActuatorRelativeTo.World
    }
    local v52 = u43.RootPart
    if v52 ~= nil then
        v52 = v52:WaitForChild("RootRigAttachment")
    end
    v51.Attachment0 = v52
    local u53 = u8("VectorForce", v51)
    local u54 = u8("BodyForce", {
        ["Name"] = "AntiGravity",
        ["Force"] = Vector3.new(0, 0, 0),
        ["Parent"] = v44
    })
    local u55 = u6.Controllers.SprintController:getMovementStatusModifier():addModifier({
        ["constantSpeedMultiplier"] = u17.SPEED
    })
    u43:ChangeState(Enum.HumanoidStateType.Freefall)
    u43.PlatformStand = true
    task.delay(0.1, function() --[[ Line: 178 ]]
        --[[
        Upvalues:
            [1] = u43
        --]]
        u43.PlatformStand = false
    end)
    local u56 = 0.5
    local u57 = 0
    u11:BindToRenderStep("GrappleHook", Enum.RenderPriority.Last.Value, function(p58) --[[ Line: 183 ]]
        --[[
        Upvalues:
            [1] = u57
            [2] = u56
            [3] = u39
            [4] = u41
            [5] = u45
            [6] = u22
            [7] = u50
            [8] = u43
            [9] = u53
            [10] = u17
            [11] = u54
            [12] = u42
        --]]
        u57 = u57 + p58
        local v59 = u56 - p58 / 0.5
        u56 = math.clamp(v59, 0, 0.5)
        local v60 = u39.Character
        if v60 ~= nil then
            v60 = v60.PrimaryPart
            if v60 ~= nil then
                v60 = v60.Position
            end
        end
        if v60 == nil then
            return nil
        end
        local v61 = (u41 - v60).Unit
        local v62 = u39.Character
        if v62 ~= nil then
            v62 = v62.PrimaryPart
            if v62 ~= nil then
                v62 = v62.AssemblyMass
            end
        end
        if v62 == nil then
            v62 = u45
        end
        u45 = v62
        u50.Force = v61 * u22.FORCE_SCALAR * u45
        local v63 = u43.MoveDirection
        local v64 = u45
        u53.Force = (v63 - v61 * v63:Dot(v61)) * u22.FORCE_SCALAR * u56 * v64 * 1.2
        u54.Force = u17.FORCE_ADDITIVE * u45
        local v65 = u42.PrimaryPart
        local v66 = u42.PrimaryPart.AssemblyLinearVelocity
        local v67 = v61 * 20
        local v68 = u57 * u22.RUNTIME_MULT
        v65.AssemblyLinearVelocity = v66:Lerp(v67, (math.clamp(v68, 0, 1)))
    end)
    p38.transitMaid:GiveTask(function() --[[ Line: 234 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u50
            [3] = u53
            [4] = u54
            [5] = u55
            [6] = u43
        --]]
        u11:UnbindFromRenderStep("GrappleHook")
        u50:Destroy()
        u53:Destroy()
        u54:Destroy()
        u55.Destroy()
        u43:ChangeState(Enum.HumanoidStateType.Landed)
    end)
end
u6.CreateController(u23.new())
return {
    ["GrapplingHookGunHandler"] = u23
}