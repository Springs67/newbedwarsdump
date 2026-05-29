local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local v5 = v3.ConstantManager
local u6 = v3.MobileTouchType
local u7 = v3.SoundManager
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Lighting
local u13 = v11.Players
local u14 = v11.RunService
local u15 = v11.TweenService
local u16 = v11.Workspace
local u17 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u18 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u28 = v5.registerConstants(script, {
    ["FlightSpeed"] = 55
})
local u29 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 36 ]]
        return "RavenController"
    end,
    ["__index"] = u18
})
u29.__index = u29
function u29.new(...) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u29
    --]]
    local v30 = u29
    local v31 = setmetatable({}, v30)
    return v31:constructor(...) or v31
end
function u29.constructor(p32, ...) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u9
        [3] = u10
    --]]
    u18.constructor(p32, ...)
    p32.Name = "RavenController"
    p32.maid = u9.new()
    p32.detonateMaid = u9.new()
    p32.spawnMaid = u9.new()
    p32.watchingExplosion = false
    p32.activeRaven = u10("BoolValue", {
        ["Value"] = false
    })
end
function u29.KnitStart(u33) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u17
        [3] = u13
        [4] = u19
        [5] = u4
        [6] = u22
        [7] = u21
        [8] = u26
    --]]
    u18.KnitStart(u33)
    u17.AbilityUsed:connect(function(p34) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u19
            [3] = u33
            [4] = u4
            [5] = u22
            [6] = u21
            [7] = u26
        --]]
        if p34.userCharacter ~= u13.LocalPlayer.Character then
            return nil
        end
        if p34.ability == u19.RAVEN_SPAWN then
            if u33.activeRaven.Value and not u33.watchingExplosion then
                return nil
            end
            u4:playAnimation(u13.LocalPlayer, u22:getAssetId(u21.RAVEN_THROW))
            u33.activeRaven.Value = true
            u26.Client:Get("SpawnRaven"):CallServerAsync():andThen(function(p35) --[[ Line: 70 ]]
                --[[
                Upvalues:
                    [1] = u33
                --]]
                if not p35 then
                    u33.activeRaven.Value = false
                    return nil
                end
                if not p35.PrimaryPart then
                    p35:GetPropertyChangedSignal("PrimaryPart"):Wait()
                end
                u33:handleRaven(p35)
            end):catch(function() --[[ Line: 80 ]]
                --[[
                Upvalues:
                    [1] = u33
                --]]
                u33.activeRaven.Value = true
            end)
        end
    end)
end
function u29.handleRaven(u36, u37) --[[ Line: 86 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u13
        [3] = u23
        [4] = u8
        [5] = u26
        [6] = u16
        [7] = u10
        [8] = u14
        [9] = u1
        [10] = u7
        [11] = u27
        [12] = u12
        [13] = u15
        [14] = u28
    --]]
    local u38 = u9.new()
    u38:GiveTask(function() --[[ Line: 88 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        u36.activeRaven.Value = false
    end)
    local u39 = u13.LocalPlayer
    local v40 = not u37.Parent
    if not v40 then
        local v41 = u23:getEntity(u39)
        if v41 ~= nil then
            v41 = v41:isAlive()
        end
        v40 = not v41
    end
    if v40 then
        u38:DoCleaning()
        return nil
    end
    u38:GiveTask(u8.Controllers.SprintController:getMovementStatusModifier():addModifier({
        ["moveSpeedMultiplier"] = 0,
        ["blockSprint"] = true
    }))
    u38:GiveTask(u26.Client:Get("EntityDeathEvent"):Connect(function(p42) --[[ Line: 108 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u39
            [3] = u36
            [4] = u38
        --]]
        local v43 = p42.entityInstance
        local v44 = u23:getEntity(u39)
        if v44 ~= nil then
            v44 = v44:getInstance()
        end
        if v43 == v44 then
            u36:detonateRaven()
            u38:DoCleaning()
        end
    end))
    u37.AncestryChanged:Connect(function() --[[ Line: 119 ]]
        --[[
        Upvalues:
            [1] = u38
        --]]
        u38:DoCleaning()
    end)
    local u45 = u16.CurrentCamera
    if not u45 then
        u38:DoCleaning()
        return nil
    end
    local u46 = u45.CFrame
    local function u51() --[[ Line: 128 ]]
        --[[
        Upvalues:
            [1] = u37
        --]]
        local v47 = u37:GetDescendants()
        local v48 = 0
        for v49 = 1, #v47 do
            local v50 = v47[v49]
            local _ = v49 - 1
            if v50:IsA("BasePart") then
                v48 = v48 + v50:GetMass()
            end
        end
        return v48
    end
    local v52 = u10
    local v53 = {
        ["Name"] = "AntiGravity"
    }
    local v54 = u51() * u16.Gravity
    v53.Force = Vector3.new(0, v54, 0)
    v53.Parent = u37.PrimaryPart
    local u55 = v52("BodyForce", v53)
    u45.CameraSubject = u37:WaitForChild("Handle")
    u39.CameraMaxZoomDistance = 6.5
    u39.CameraMinZoomDistance = 6.5
    u38:GiveTask(function() --[[ Line: 153 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u36
            [3] = u14
            [4] = u46
            [5] = u45
            [6] = u1
            [7] = u39
            [8] = u13
        --]]
        local u56 = u9.new()
        u36.watchingExplosion = true
        u56:GiveTask(u14.RenderStepped:Connect(function() --[[ Line: 156 ]]
            --[[
            Upvalues:
                [1] = u46
                [2] = u45
            --]]
            u45.CFrame = u46 * CFrame.new(Vector3.new(0, 0, 8))
        end))
        u1.Promise.delay(0.5):andThen(function() --[[ Line: 162 ]]
            --[[
            Upvalues:
                [1] = u56
                [2] = u36
                [3] = u39
                [4] = u13
                [5] = u45
            --]]
            u56:DoCleaning()
            u36.watchingExplosion = false
            u39.CameraMaxZoomDistance = 14
            u39.CameraMinZoomDistance = 0
            local v57 = u13.LocalPlayer.Character
            if v57 ~= nil then
                v57 = v57:FindFirstChildWhichIsA("Humanoid")
            end
            u45.CameraSubject = v57
        end)
    end)
    local u58 = u7:playSound(u27.RAVEN_SPACE_AMBIENT)
    local v59 = u58:getInstance()
    if v59 ~= nil then
        v59 = v59.Volume
    end
    local u60 = v59 == nil and 0.5 or v59
    u58:setProperty("Volume", 0)
    u38:GiveTask(function() --[[ Line: 186 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u58
        --]]
        u7:tweenSoundVolume(u58, 0, 0.5)
        task.delay(0.5, function() --[[ Line: 188 ]]
            --[[
            Upvalues:
                [1] = u58
            --]]
            u58:Destroy()
        end)
    end)
    local v61 = u10("Folder", {
        ["Name"] = "Disabled",
        ["Parent"] = u12
    })
    local u62 = u12:FindFirstChildWhichIsA("Atmosphere")
    local u63 = u12:FindFirstChildWhichIsA("SunRaysEffect")
    if u63 then
        u63.Parent = v61
        u38:GiveTask(function() --[[ Line: 201 ]]
            --[[
            Upvalues:
                [1] = u63
                [2] = u12
            --]]
            u63.Parent = u12
        end)
    end
    local u64
    if u62 then
        u64 = false
    else
        u62 = u10("Atmosphere", {
            ["Parent"] = u12
        })
        u38:GiveTask(u62)
        u64 = true
    end
    local u65 = u62:Clone()
    local u66 = u10("ColorCorrectionEffect", {
        ["Parent"] = u12
    })
    local u67 = u10("DepthOfFieldEffect", {
        ["Name"] = "RavenDepthOfField",
        ["FocusDistance"] = 19.76,
        ["InFocusRadius"] = 28.2,
        ["FarIntensity"] = 0,
        ["NearIntensity"] = 0,
        ["Parent"] = u12
    })
    u38:GiveTask(u66)
    u38:GiveTask(u67)
    u38:GiveTask(function() --[[ Line: 227 ]]
        --[[
        Upvalues:
            [1] = u64
            [2] = u65
            [3] = u12
            [4] = u62
        --]]
        if u64 then
            u65:Destroy()
        else
            u65.Parent = u12
        end
        u62:Destroy()
    end)
    local v68 = u10("NumberValue", {
        ["Value"] = 0
    })
    u38:GiveTask(v68)
    v68.Changed:Connect(function(p69) --[[ Line: 239 ]]
        --[[
        Upvalues:
            [1] = u66
            [2] = u67
            [3] = u62
            [4] = u65
            [5] = u58
            [6] = u60
        --]]
        u66.Brightness = -0.05 * p69
        u66.Contrast = 0.05 * p69
        u66.TintColor = Color3.fromRGB(248 * p69 + 255 * (1 - p69), 250 * p69 + 255 * (1 - p69), 250 * p69 + 255 * (1 - p69))
        u67.FarIntensity = p69
        u62.Density = 0.65 * p69 + u65.Density * (1 - p69)
        u62.Color = Color3.fromRGB(45 * p69 + u65.Color.R * 255 * (1 - p69), 56 * p69 + u65.Color.R * 255 * (1 - p69), 46 * p69 + u65.Color.R * 255 * (1 - p69))
        u62.Decay = Color3.fromRGB(30 * p69 + u65.Color.R * 255 * (1 - p69), 32 * p69 + u65.Color.R * 255 * (1 - p69), 35 * p69 + u65.Color.R * 255 * (1 - p69))
        u62.Haze = 10 * p69 + u65.Haze * (1 - p69)
        u58:setProperty("Volume", p69 * u60)
    end)
    u15:Create(v68, TweenInfo.new(1.25, Enum.EasingStyle.Linear), {
        ["Value"] = 1
    }):Play()
    if u37.Parent then
        u1.Promise.any({ u1.Promise.try(function() --[[ Line: 254 ]]
                --[[
                Upvalues:
                    [1] = u37
                --]]
                return u37:WaitForChild("Flying")
            end), u1.Promise.try(function() --[[ Line: 256 ]]
                --[[
                Upvalues:
                    [1] = u37
                --]]
                return u37.AncestryChanged:Wait()
            end) }):await()
        if not u37.Parent then
            return nil
        end
    end
    u38:GiveTask(u36.detonateMaid)
    u36:mountDetonate()
    u1.Promise.delay(0):andThen(function() --[[ Line: 266 ]]
        --[[
        Upvalues:
            [1] = u45
            [2] = u37
        --]]
        u45.CameraSubject = u37.PrimaryPart
    end)
    local u70 = u10("Vector3Value", {
        ["Value"] = u37:GetPivot().LookVector.Unit
    })
    u38:GiveTask(u70)
    u38:GiveTask(u14.RenderStepped:Connect(function() --[[ Line: 275 ]]
        --[[
        Upvalues:
            [1] = u45
            [2] = u46
            [3] = u70
            [4] = u28
            [5] = u37
            [6] = u55
            [7] = u51
            [8] = u16
            [9] = u15
        --]]
        if u45.CameraSubject then
            u46 = u45.CFrame
        end
        local v71 = u70.Value * u28.FlightSpeed
        u37.PrimaryPart.AssemblyLinearVelocity = v71
        local v72 = u55
        local v73 = u51() * u16.Gravity
        v72.Force = Vector3.new(0, v73, 0)
        u37:PivotTo(CFrame.new(u37.PrimaryPart.Position, u37.PrimaryPart.Position + v71))
        u15:Create(u70, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
            ["Value"] = (u37:GetPivot() - u45.CFrame.Position).Position.Unit
        }):Play()
    end))
end
function u29.spawnRaven(_) --[[ Line: 295 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u19
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u19.RAVEN_SPAWN)
end
function u29.isRelevantItem(_, p74) --[[ Line: 298 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    return p74.itemType == u25.RAVEN
end
function u29.onEnable(u75, _) --[[ Line: 301 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u13
        [3] = u21
        [4] = u2
        [5] = u6
        [6] = u19
        [7] = u20
    --]]
    if u75.activeEnabledThread then
        task.cancel(u75.activeEnabledThread)
        u75.activeEnabledThread = nil
    end
    u75.activeEnabledThread = task.spawn(function() --[[ Line: 306 ]]
        --[[
        Upvalues:
            [1] = u75
            [2] = u22
            [3] = u13
            [4] = u21
            [5] = u2
            [6] = u6
            [7] = u19
            [8] = u20
        --]]
        if u75.activeRaven.Value then
            u75.activeRaven.Changed:Wait()
        end
        u75:setupYield(function() --[[ Line: 310 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u13
                [3] = u21
            --]]
            local u76 = u22:playAnimation(u13.LocalPlayer, u21.RAVEN_HOLD, {
                ["looped"] = true
            })
            return function() --[[ Line: 314 ]]
                --[[
                Upvalues:
                    [1] = u76
                --]]
                local v77 = u76
                if v77 ~= nil then
                    v77:Stop()
                end
            end
        end)
        u75.spawnMaid:DoCleaning()
        u75.maid:GiveTask(u75.spawnMaid)
        local v78 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController")
        local v80 = {
            ["action"] = "Attack",
            ["actionId"] = "raven-spawn",
            ["boundFunction"] = function(_, p79, _) --[[ Name: boundFunction, Line 327 ]]
                --[[
                Upvalues:
                    [1] = u75
                --]]
                if p79 == Enum.UserInputState.Begin then
                    u75:spawnRaven()
                end
            end,
            ["mobile"] = {
                ["touchType"] = u6.TouchTap,
                ["mobileBoundFunction"] = function() --[[ Name: mobileBoundFunction, Line 334 ]]
                    --[[
                    Upvalues:
                        [1] = u75
                    --]]
                    u75:spawnRaven()
                end
            }
        }
        local v81 = v78:bindAction(v80)
        u75.spawnMaid:GiveTask(v81)
        u75.spawnMaid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u19.RAVEN_SPAWN, u20[u19.RAVEN_SPAWN].triggerConfig):expect())
    end)
end
function u29.onDisable(u82) --[[ Line: 343 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u13
        [3] = u25
    --]]
    if u82.activeDisabledThread then
        task.cancel(u82.activeDisabledThread)
        u82.activeDisabledThread = nil
    end
    u82.activeDisabledThread = task.spawn(function() --[[ Line: 348 ]]
        --[[
        Upvalues:
            [1] = u82
            [2] = u24
            [3] = u13
            [4] = u25
        --]]
        if u82.activeRaven.Value then
            u82.activeRaven.Changed:Wait()
        end
        local v83 = u24.getInventory(u13.LocalPlayer).hand
        if v83 ~= nil then
            v83 = v83.itemType
        end
        if v83 == u25.RAVEN then
            return nil
        end
        u82.maid:DoCleaning()
    end)
end
function u29.mountDetonate(u84) --[[ Line: 362 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u6
        [3] = u19
        [4] = u20
    --]]
    u84.spawnMaid:DoCleaning()
    u84.detonateMaid:DoCleaning()
    u84.maid:GiveTask(u84.detonateMaid)
    local v85 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController")
    local v87 = {
        ["action"] = "Attack",
        ["actionId"] = "raven-detonate",
        ["boundFunction"] = function(_, p86, _) --[[ Name: boundFunction, Line 370 ]]
            --[[
            Upvalues:
                [1] = u84
            --]]
            if p86 == Enum.UserInputState.Begin then
                u84:detonateRaven()
            end
        end,
        ["mobile"] = {
            ["touchType"] = u6.TouchTap,
            ["mobileBoundFunction"] = function() --[[ Name: mobileBoundFunction, Line 377 ]]
                --[[
                Upvalues:
                    [1] = u84
                --]]
                u84:detonateRaven()
            end
        }
    }
    local v88 = v85:bindAction(v87)
    u84.detonateMaid:GiveTask(v88)
    u84.detonateMaid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u19.RAVEN_DETONATE, u20[u19.RAVEN_DETONATE].triggerConfig):expect())
end
function u29.detonateRaven(p89) --[[ Line: 385 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u19
        [3] = u24
        [4] = u13
        [5] = u25
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u19.RAVEN_DETONATE)
    local v90 = u24.getInventory(u13.LocalPlayer).hand
    local v91
    if v90 == nil then
        v91 = v90
    else
        v91 = v90.itemType
    end
    if v91 == u25.RAVEN then
        p89:onEnable(v90)
    end
end
u8.CreateController(u29.new())
return nil