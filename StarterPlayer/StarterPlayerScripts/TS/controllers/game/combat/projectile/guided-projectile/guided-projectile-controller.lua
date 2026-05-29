local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.RunService
local u13 = v10.UserInputService
local u14 = v10.Workspace
local u15 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "guided-projectile", "guided-projectile-meta").GuidedProjectileMeta
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "GuidedProjectileController"
    end,
    ["__index"] = u16
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
        [1] = u16
        [2] = u20
        [3] = u6
    --]]
    u16.constructor(p24)
    p24.Name = "GuidedProjectileController"
    p24.fireGuidedProjectile = u20.Client:Get("FireGuidedProjectile")
    p24.angleX = 0
    p24.angleY = 0
    p24.directionMotor = u6.GroupMotor.new({
        ["cameraX"] = 0,
        ["cameraY"] = 0,
        ["modelX"] = 0,
        ["modelY"] = 0
    })
end
function u21.KnitStart(u25) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u14
        [3] = u12
        [4] = u11
        [5] = u19
        [6] = u13
        [7] = u6
        [8] = u20
        [9] = u15
    --]]
    u16.KnitStart(u25)
    local u26 = u14.CurrentCamera
    u12.RenderStepped:Connect(function() --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u11
            [3] = u19
            [4] = u14
            [5] = u26
            [6] = u13
            [7] = u6
        --]]
        if u25.currentlyGuidingProjectile then
            if u25.currentlyGuidingProjectile.enabled == false then
                return nil
            end
            local v27 = u11.LocalPlayer.Character
            if v27 ~= nil then
                for v28, v29 in v27:GetDescendants() do
                    local _ = v28 - 1
                    if v29:IsA("BasePart") then
                        v29.LocalTransparencyModifier = 0
                    end
                end
            end
            local v30 = u25.currentlyGuidingProjectile.model
            local v31 = v30:GetPrimaryPartCFrame()
            local v32 = u19[u25.currentlyGuidingProjectile.type]
            if u25.currentlyGuidingProjectile.disabling ~= true then
                local v33 = u25.currentlyGuidingProjectile.forces.antiGravity
                local v34 = v30.PrimaryPart.AssemblyMass * u14.Gravity
                v33.Force = Vector3.new(0, v34, 0)
                v30.PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                if v32.doNotSetVelocity ~= true then
                    local v35 = v31.LookVector
                    local v36 = v32.speed
                    local v37 = v36 == nil and 45 or v36
                    v30.PrimaryPart.AssemblyLinearVelocity = v35 * v37
                end
            end
            local v38 = u25.directionMotor:getValue()
            local v39 = v32.flightRotation or Vector3.new()
            local v40 = CFrame.Angles(v39.X, v39.Y, v39.Z)
            local v41 = CFrame.new(v31.Position) * v40
            local v42 = CFrame.Angles(0, v38.modelX, 0)
            local v43 = CFrame.Angles(v38.modelY, 0, 0)
            v30:PivotTo(v41 * v42 * v43)
            local v44 = CFrame.new(v31.Position) * v40
            local v45 = CFrame.Angles(0, v38.cameraX, 0)
            local v46 = CFrame.Angles(v38.cameraY, 0, 0)
            local v47 = CFrame.new(v32.cameraOffset or Vector3.new(0, 2, 5))
            u26.CFrame = v44 * v45 * v46 * v47
            local v48
            if u25.thumbstickPosition then
                v48 = Vector2.new(u25.thumbstickPosition.X, -u25.thumbstickPosition.Y) * 8
            else
                v48 = u13:GetMouseDelta()
            end
            u25.angleX = u25.angleX - v48.X * 0.004
            local v49 = math
            local v50 = u25.angleY - v48.Y * 0.004
            local v51 = v32.yAngleLimit
            if v51 ~= nil then
                v51 = v51.lower
            end
            local v52 = v51 == nil and -0.8 or v51
            local v53 = v32.yAngleLimit
            if v53 ~= nil then
                v53 = v53.upper
            end
            local v54 = v53 == nil and 0.8 or v53
            u25.angleY = v49.clamp(v50, v52, v54)
            local v55 = {
                ["frequency"] = 4,
                ["dampingRatio"] = 0.85
            }
            local v56 = u6.Spring.new(v38.cameraX, v55)
            local v57 = u6.Spring.new(v38.cameraY, v55)
            if v32.modelSpringSettings then
                if v32.modelSpringSettings == "Instant" then
                    v56 = u6.Instant.new(v38.cameraX)
                    v57 = u6.Instant.new(v38.cameraY)
                else
                    v56 = u6.Spring.new(v38.cameraX, v32.modelSpringSettings)
                    v57 = u6.Spring.new(v38.cameraY, v32.modelSpringSettings)
                end
            end
            u25.directionMotor:setGoal({
                ["cameraX"] = u6.Spring.new(u25.angleX, v55),
                ["cameraY"] = u6.Spring.new(u25.angleY, v55),
                ["modelX"] = v56,
                ["modelY"] = v57
            })
        end
    end)
    u20.Client:OnEvent("GuidedProjectileDetonated", function(p58) --[[ Line: 148 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u19
            [3] = u26
            [4] = u15
        --]]
        local v59 = p58.position
        if u25.currentlyGuidingProjectile ~= nil and u25.currentlyGuidingProjectile.model == p58.model then
            v59 = u25.currentlyGuidingProjectile.model:GetPrimaryPartCFrame().Position
            local v60 = u19[u25.currentlyGuidingProjectile.type]
            u25:destroyGuidedProjectile()
            u26.CameraType = Enum.CameraType.Scriptable
            local v61 = task
            local v62 = v60.observeExplosionTime
            local v63 = v62 == nil and 2 or v62
            v61.delay(v63, function() --[[ Line: 161 ]]
                --[[
                Upvalues:
                    [1] = u26
                --]]
                u26.CameraType = Enum.CameraType.Custom
            end)
        end
        u15.GuidedProjectileDetonated:fire(p58.type, v59)
    end)
    u13.InputChanged:Connect(function(p64) --[[ Line: 167 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        if p64.UserInputType == Enum.UserInputType.Gamepad1 and p64.KeyCode == Enum.KeyCode.Thumbstick2 then
            u25:handleConsoleInput(p64)
        end
    end)
    u13.InputEnded:Connect(function(p65) --[[ Line: 174 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        if p65.UserInputType == Enum.UserInputType.Gamepad1 and p65.KeyCode == Enum.KeyCode.Thumbstick2 then
            u25.thumbstickPosition = nil
        end
    end)
end
function u21.setupGuidedProjectileMaid(u66, p67, u68, p69) --[[ Line: 182 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u8
        [3] = u2
        [4] = u17
        [5] = u14
        [6] = u5
        [7] = u13
        [8] = u12
        [9] = u4
        [10] = u15
        [11] = u20
    --]]
    local v70 = u19[p67]
    local v71 = u8.new()
    if not v70.dontShowCooldown then
        v71:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(u17.GUIDED_PROJECTILE))
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(u17.GUIDED_PROJECTILE, p69 - u14:GetServerTimeNow(), {
        ["cooldownBar"] = {
            ["color"] = v70.barColor or Color3.fromRGB(255, 176, 31)
        }
    })
    v71:GiveTask(function() --[[ Line: 193 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u17
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):removeCooldown(u17.GUIDED_PROJECTILE)
    end)
    v71:GiveTask(u5.Controllers.SprintController:getMovementStatusModifier():addModifier({
        ["constantSpeedMultiplier"] = 0,
        ["blockSprint"] = true
    }))
    u13.MouseBehavior = Enum.MouseBehavior.LockCenter
    u13.MouseIconEnabled = false
    u12:BindToRenderStep("KeepMouseLocked", Enum.RenderPriority.Camera.Value - 1, function() --[[ Line: 202 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        u13.MouseBehavior = Enum.MouseBehavior.LockCenter
    end)
    v71:GiveTask(function() --[[ Line: 205 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        return u12:UnbindFromRenderStep("KeepMouseLocked")
    end)
    v71:GiveTask(function() --[[ Line: 208 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        u13.MouseBehavior = Enum.MouseBehavior.Default
        u13.MouseIconEnabled = true
        task.delay(0.1, function() --[[ Line: 211 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            u13.MouseBehavior = Enum.MouseBehavior.Default
        end)
    end)
    local v72 = u4.Controllers.FovController
    local v73 = {}
    local v74 = v70.fov
    v73.fovMultiplier = (v74 == nil and 85 or v74) / u4.Controllers.FovController:getBaseFOV()
    v71:GiveTask(v72:addModifier(v73))
    u14.CurrentCamera.CameraType = Enum.CameraType.Scriptable
    v71:GiveTask(function() --[[ Line: 226 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        u14.CurrentCamera.CameraType = Enum.CameraType.Custom
    end)
    v71:GiveTask(function() --[[ Line: 229 ]]
        --[[
        Upvalues:
            [1] = u66
            [2] = u15
        --]]
        if u66.currentlyGuidingProjectile then
            u15.GuidedProjectileRemoved:fire(u66.currentlyGuidingProjectile.type, u66.currentlyGuidingProjectile.model)
        end
    end)
    local u75 = u4.Controllers.ViewmodelController:addDisabler()
    v71:GiveTask(function() --[[ Line: 235 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u75
        --]]
        u4.Controllers.ViewmodelController:removeDisabler(u75)
    end)
    u15.GuidedProjectileEnabling:fire(p67, u68)
    task.spawn(function() --[[ Line: 239 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u68
        --]]
        local v76 = {
            ["newState"] = true,
            ["model"] = u68
        }
        u20.Client:Get("GuidedProjectileClientControlStateChanged"):SendToServer(v76)
    end)
    return v71
end
u21.launch = u1.async(function(u77, p78) --[[ Line: 247 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u18
        [3] = u14
        [4] = u9
        [5] = u7
    --]]
    local v79 = u1.await(u77.fireGuidedProjectile:CallServerAsync(p78))
    if v79 then
        local v80 = u18(p78).guidedProjectileSource.guidedProjectile
        local v81 = v79.model
        local v82 = v79.explodeTime
        v81.AncestryChanged:Connect(function(_, p83) --[[ Line: 254 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u77
            --]]
            if p83 ~= nil then
                p83 = p83:IsDescendantOf(u14)
            end
            if not p83 then
                u77:destroyGuidedProjectile()
            end
        end)
        if not v81.PrimaryPart then
            v81:GetPropertyChangedSignal("PrimaryPart"):Wait()
        end
        local v84 = v81.PrimaryPart
        local v85 = u77:setupGuidedProjectileMaid(v80, v81, v82)
        local v86 = u9
        local v87 = {
            ["Name"] = "AntiGravity"
        }
        local v88 = v84.AssemblyMass * u14.Gravity
        v87.Force = Vector3.new(0, v88, 0)
        v87.Parent = v84
        local v89 = v86("BodyForce", v87)
        local v90 = u14.CurrentCamera
        if v90 ~= nil then
            v90 = v90.CFrame.LookVector
        end
        local v91 = v90 == nil and Vector3.new(0, 1, 0) or v90
        local v92 = v91.Z
        local v93 = -v91.X
        u77.angleX = math.atan2(v92, v93) + 1.5707963267948966
        u77.angleY = 0
        local v94 = 0
        local v95 = {}
        local v96 = {
            ["enabled"] = true,
            ["disabling"] = false,
            ["maid"] = v85,
            ["type"] = v80,
            ["model"] = v81,
            ["explodeTime"] = v82,
            ["forces"] = {
                ["antiGravity"] = v89
            }
        }
        for v97, v98 in v81:GetDescendants() do
            local _ = v97 - 1
            if v98:IsA("Sound") == true then
                v94 = v94 + 1
                v95[v94] = v98
            end
        end
        v96.sounds = v95
        u77.currentlyGuidingProjectile = v96
    else
        u7.Warn("Server rejected request to launch guided projectile")
    end
end)
function u21.handleConsoleInput(p99, p100) --[[ Line: 316 ]]
    if p100.Position.Magnitude > 0.1 then
        p99.thumbstickPosition = p100.Position
    else
        p99.thumbstickPosition = nil
    end
end
function u21.getCurrentGuidedProjectile(p101) --[[ Line: 323 ]]
    return p101.currentlyGuidingProjectile and {
        ["model"] = p101.currentlyGuidingProjectile.model,
        ["type"] = p101.currentlyGuidingProjectile.type,
        ["forces"] = p101.currentlyGuidingProjectile.forces,
        ["sounds"] = p101.currentlyGuidingProjectile.sounds,
        ["enabled"] = p101.currentlyGuidingProjectile.enabled,
        ["disabling"] = p101.currentlyGuidingProjectile.disabling
    } or nil
end
function u21.enableGuidedProjectile(p102) --[[ Line: 337 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    if p102.currentlyGuidingProjectile and not p102.currentlyGuidingProjectile.disabling then
        p102.currentlyGuidingProjectile.maid = p102:setupGuidedProjectileMaid(p102.currentlyGuidingProjectile.type, p102.currentlyGuidingProjectile.model, p102.currentlyGuidingProjectile.explodeTime)
        p102.currentlyGuidingProjectile.enabled = true
        local v103 = p102.currentlyGuidingProjectile.forces.antiGravity
        local v104 = u14.Gravity * p102.currentlyGuidingProjectile.model.PrimaryPart.AssemblyMass
        v103.Force = Vector3.new(0, v104, 0)
    end
end
function u21.disableGuidedProjectile(u105, p106) --[[ Line: 344 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u20
    --]]
    if u105.currentlyGuidingProjectile and not u105.currentlyGuidingProjectile.disabling then
        u105.currentlyGuidingProjectile.disabling = true
        u15.GuidedProjectileDisabling:fire(u105.currentlyGuidingProjectile.type, u105.currentlyGuidingProjectile.model)
        task.spawn(function() --[[ Line: 348 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u105
            --]]
            u20.Client:Get("GuidedProjectileClientControlStateChanged"):SendToServer({
                ["newState"] = false,
                ["model"] = u105.currentlyGuidingProjectile.model
            })
        end)
        local v107 = task
        local v108 = p106 == nil and 0.1 or p106
        v107.delay(v108, function() --[[ Line: 359 ]]
            --[[
            Upvalues:
                [1] = u105
            --]]
            if u105.currentlyGuidingProjectile then
                u105.currentlyGuidingProjectile.disabling = false
                u105.currentlyGuidingProjectile.maid:DoCleaning()
                u105.currentlyGuidingProjectile.enabled = false
                u105.currentlyGuidingProjectile.forces.antiGravity.Force = Vector3.new(0, 0, 0)
            end
        end)
    end
end
function u21.destroyGuidedProjectile(p109) --[[ Line: 369 ]]
    if p109.currentlyGuidingProjectile then
        p109.currentlyGuidingProjectile.maid:DoCleaning()
        if p109.currentlyGuidingProjectile.model then
            p109.currentlyGuidingProjectile.model:Destroy()
        end
        p109.currentlyGuidingProjectile = nil
    end
end
u4.CreateController(u21.new())
return nil