local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u5 = v4.KnitClient
local u6 = v4.KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.CollectionService
local u12 = v10.Players
local u13 = v10.ReplicatedStorage
local u14 = v10.RunService
local u15 = v10.TweenService
local u16 = v10.Workspace
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "watcher", "ui", "engineer-film-effect").EngineerFilmEffect
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "player-control-module")
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u33 = v1.import(script, script.Parent, "ui", "drone-health-ui").DroneHealth
local u34 = v1.import(script, script.Parent, "ui", "drone-item-ui").DroneItemUi
local u35 = v1.import(script, script.Parent, "ui", "drone-tnt-ui").DroneTntUi
local u36 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 41 ]]
        return "DroneController"
    end,
    ["__index"] = u19
})
u36.__index = u36
function u36.new(...) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u36
    --]]
    local v37 = u36
    local v38 = setmetatable({}, v37)
    return v38:constructor(...) or v38
end
function u36.constructor(p39) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u7
    --]]
    u19.constructor(p39)
    p39.Name = "DroneController"
    p39.speedMotor = u7.SingleMotor.new(0)
    p39.velocityMotor = u7.GroupMotor.new({
        ["x"] = 0,
        ["y"] = 0,
        ["z"] = 0
    })
    p39.preloaded = false
end
function u36.KnitStart(u40) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u8
        [3] = u17
        [4] = u3
        [5] = u31
        [6] = u9
        [7] = u18
        [8] = u12
        [9] = u2
        [10] = u35
        [11] = u24
        [12] = u23
        [13] = u21
        [14] = u22
        [15] = u25
        [16] = u13
        [17] = u26
        [18] = u5
        [19] = u16
        [20] = u15
        [21] = u11
        [22] = u6
        [23] = u27
        [24] = u28
        [25] = u30
        [26] = u14
        [27] = u20
        [28] = u7
    --]]
    u19.KnitStart(u40)
    local u41 = u8.new()
    u17.GuidedProjectileRemoved:connect(function(p42) --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u41
        --]]
        if p42.guidedProjectileType == "drone" then
            u41:DoCleaning()
        end
    end)
    u17.GuidedProjectileEnabling:connect(function(u43) --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u31
            [3] = u40
            [4] = u41
            [5] = u9
            [6] = u18
            [7] = u12
            [8] = u2
            [9] = u35
            [10] = u24
            [11] = u23
            [12] = u21
            [13] = u22
        --]]
        if u43.guidedProjectileType ~= "drone" then
            return nil
        end
        u3:playSound(u31.DRONE_DEPLOY)
        u40:updateReleaseUi(u43.model:GetAttribute("HeldItem"), u43.model:GetAttribute("HeldItemAmount"), u43.model)
        u40:updateHealthUi(u43.model)
        u41:GiveTask(function() --[[ Line: 77 ]]
            --[[
            Upvalues:
                [1] = u40
                [2] = u43
            --]]
            u40:updateReleaseUi(nil, nil, u43.model)
            u40:updateHealthUi(nil)
        end)
        u40.filmTree = u9.mount(u9.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false,
            ["IgnoreGuiInset"] = true
        }, { u9.createElement(u18, {
                ["transparency"] = 0.95,
                ["color"] = Color3.fromRGB(84, 138, 99)
            }) }), u12.LocalPlayer:FindFirstChildOfClass("PlayerGui"))
        u41:GiveTask(function() --[[ Line: 90 ]]
            --[[
            Upvalues:
                [1] = u40
                [2] = u9
            --]]
            if u40.filmTree then
                u9.unmount(u40.filmTree)
                u40.filmTree = nil
            end
        end)
        local v44 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u9.createElement(u35, {
            ["Drone"] = u43.model
        }))
        if v44 then
            u41:GiveTask(v44)
        end
        u41:GiveTask(u43.model:GetAttributeChangedSignal("HeldItemAmount"):Connect(function() --[[ Line: 102 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u31
            --]]
            u3:playSound(u31.BEEHIVE_PRODUCE)
        end))
        local u45 = u24:playAnimation(u12.LocalPlayer, u23.USE_TABLET, {
            ["looped"] = true
        })
        u41:GiveTask(function() --[[ Line: 108 ]]
            --[[
            Upvalues:
                [1] = u45
            --]]
            local v46 = u45
            if v46 ~= nil then
                v46:Stop()
            end
        end)
        local v47 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v48 = u21.DRONE_SPEED_BOOST
        local v49 = {}
        for v50, v51 in u22[u21.DRONE_SPEED_BOOST].triggerConfig do
            v49[v50] = v51
        end
        function v49.getExtraData() --[[ Line: 121 ]]
            --[[
            Upvalues:
                [1] = u43
            --]]
            return {
                ["drone"] = u43.model
            }
        end
        local u52 = v47:enableAbility(v48, v49):expect()
        u41:GiveTask(function() --[[ Line: 127 ]]
            --[[
            Upvalues:
                [1] = u52
            --]]
            u52.Destroy()
        end)
    end)
    u17.GuidedProjectileDisabling:connect(function(p53) --[[ Line: 131 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u31
        --]]
        if p53.guidedProjectileType ~= "drone" then
            return nil
        end
        u3:playSound(u31.DRONE_DEPLOY)
        for _, v54 in p53.model:GetDescendants() do
            if v54:IsA("Sound") then
                v54.Volume = 0
            end
        end
    end)
    u17.AbilityUsed:connect(function(p55) --[[ Line: 142 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u8
            [3] = u25
            [4] = u3
            [5] = u31
            [6] = u13
            [7] = u26
            [8] = u12
            [9] = u5
            [10] = u16
            [11] = u15
        --]]
        if p55.ability ~= u21.DRONE_SPEED_BOOST then
            return nil
        end
        local u56 = p55.extra.drone
        local u57 = u8.new()
        task.delay(u25.CyberDrone.SPEED_BOOST_DURATION, function() --[[ Line: 149 ]]
            --[[
            Upvalues:
                [1] = u57
            --]]
            u57:DoCleaning()
        end)
        u3:playSound(u31.SEAHORSE_SPEEDUP, {
            ["parent"] = u56.PrimaryPart
        })
        local v58 = u13.Assets.Effects.WindTunnelParticles:Clone()
        v58.EmissionDirection = Enum.NormalId.Back
        v58.Parent = u56.PrimaryPart
        v58.Size = NumberSequence.new(0.5)
        v58.Lifetime = NumberRange.new(1)
        u57:GiveTask(v58)
        local u59 = nil
        u59 = u56:GetAttributeChangedSignal("SpeedBoost"):Once(function() --[[ Line: 164 ]]
            --[[
            Upvalues:
                [1] = u57
                [2] = u59
                [3] = u56
            --]]
            u57:GiveTask(u59)
            if not u56:GetAttribute("SpeedBoost") then
                u57:DoCleaning()
            end
        end)
        local u60 = nil
        u60 = u56.Destroying:Once(function() --[[ Line: 172 ]]
            --[[
            Upvalues:
                [1] = u57
                [2] = u60
            --]]
            u57:GiveTask(u60)
            u57:DoCleaning()
        end)
        local v61 = u26:getEntity(p55.userCharacter)
        if v61 ~= nil then
            v61 = v61:getPlayer()
        end
        if v61 == u12.LocalPlayer then
            u57:GiveTask((u5.Controllers.ScreenParticlesController:emitParticlesOnScreen({
                ["keepEnabled"] = true,
                ["particleEmitter"] = { u13.Assets.Effects.WindTunnelParticles }
            })))
            if u16.CurrentCamera then
                local u62 = u16.CurrentCamera
                if u62 ~= nil then
                    u62 = u62.FieldOfView
                end
                local v63 = u15
                local v64 = u16.CurrentCamera
                local v65 = TweenInfo.new(0.1, Enum.EasingStyle.Linear)
                local v66 = {}
                local v67 = u16.CurrentCamera
                if v67 ~= nil then
                    v67 = v67.FieldOfView
                end
                v66.FieldOfView = v67 + 20
                v63:Create(v64, v65, v66):Play()
                u57:GiveTask(function() --[[ Line: 206 ]]
                    --[[
                    Upvalues:
                        [1] = u16
                        [2] = u15
                        [3] = u62
                    --]]
                    if u16.CurrentCamera then
                        local v68 = {
                            ["FieldOfView"] = u62
                        }
                        u15:Create(u16.CurrentCamera, TweenInfo.new(0.25, Enum.EasingStyle.Linear), v68):Play()
                    end
                end)
            end
        end
    end)
    u11:GetInstanceAddedSignal("Drone"):Connect(function(u69) --[[ Line: 216 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u12
            [3] = u6
            [4] = u27
            [5] = u28
            [6] = u25
            [7] = u2
            [8] = u30
        --]]
        u40:preloadDroneAssets()
        if u69:GetAttribute("PlayerUserId") ~= u12.LocalPlayer.UserId then
            return nil
        end
        u69:GetAttributeChangedSignal("HeldItem"):Connect(function() --[[ Line: 223 ]]
            --[[
            Upvalues:
                [1] = u40
                [2] = u69
            --]]
            u40:updateReleaseUi(u69:GetAttribute("HeldItem"), u69:GetAttribute("HeldItemAmount"), u69)
        end)
        u69:GetAttributeChangedSignal("HeldItemAmount"):Connect(function() --[[ Line: 226 ]]
            --[[
            Upvalues:
                [1] = u40
                [2] = u69
            --]]
            u40:updateReleaseUi(u69:GetAttribute("HeldItem"), u69:GetAttribute("HeldItemAmount"), u69)
        end)
        u69:GetAttributeChangedSignal("Health"):Connect(function() --[[ Line: 229 ]]
            --[[
            Upvalues:
                [1] = u40
                [2] = u69
            --]]
            u40:updateHealthUi(u69)
        end)
        u69:GetAttributeChangedSignal("MaxHealth"):Connect(function() --[[ Line: 232 ]]
            --[[
            Upvalues:
                [1] = u40
                [2] = u69
            --]]
            u40:updateHealthUi(u69)
        end)
        u6.Controllers.ProximityPromptController:createProximityPrompt({
            ["Name"] = "StoreTNTPrompt",
            ["RequiresLineOfSight"] = true,
            ["MaxActivationDistance"] = 6,
            ["HoldDuration"] = 0,
            ["ActionText"] = "Store TNT",
            ["ObjectText"] = "Drone",
            ["Parent"] = u69
        }).Triggered:Connect(function(p70) --[[ Line: 244 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u27
                [3] = u28
                [4] = u40
                [5] = u69
                [6] = u25
                [7] = u2
                [8] = u30
            --]]
            if p70 ~= u12.LocalPlayer then
                return nil
            end
            if not u27.getToolFromInventory(u12.LocalPlayer, u28.TNT) then
                return nil
            end
            if u40:getDroneNumStoredTnt(u69) >= u25.CyberDrone.TNT_CAPACITY then
                local v71 = u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController")
                local v72 = {}
                local v73 = u25.CyberDrone.TNT_CAPACITY
                v72.message = "This drone has reached the max capacity of " .. tostring(v73) .. " TNT"
                v71:sendErrorNotification(v72)
            end
            u30.Client:Get("DroneAddTNT"):SendToServer()
        end)
    end)
    u14.Heartbeat:Connect(function() --[[ Line: 261 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u20
            [3] = u25
            [4] = u40
            [5] = u7
            [6] = u16
        --]]
        local v74 = u6.Controllers.GuidedProjectileController:getCurrentGuidedProjectile()
        if v74 and (v74.type == "drone" and v74.enabled == true) then
            if v74.disabling then
                return nil
            end
            local v75 = u20:GetMoveVector()
            local v76 = v74.model:GetAttribute("SpeedBoost")
            local v77
            if v76 == 0 or (v76 ~= v76 or (v76 == "" or not v76)) then
                v77 = u25.CyberDrone.BASE_SPEED
            else
                v77 = u25.CyberDrone.BOOSTED_SPEED
            end
            if v75.Magnitude > 0.5 then
                u40.speedMotor:setGoal(u7.Spring.new(20 * v77, {
                    ["frequency"] = 1,
                    ["dampingRatio"] = 0.5
                }))
                local v78 = u16.CurrentCamera.CFrame:Inverse():VectorToObjectSpace(v75.Unit) * u40.speedMotor:getValue()
                u40.velocityMotor:setGoal({
                    ["x"] = u7.Spring.new(v78.X, {
                        ["frequency"] = 4,
                        ["dampingRatio"] = 0.7
                    }),
                    ["y"] = u7.Spring.new(v78.Y, {
                        ["frequency"] = 4,
                        ["dampingRatio"] = 0.7
                    }),
                    ["z"] = u7.Spring.new(v78.Z, {
                        ["frequency"] = 4,
                        ["dampingRatio"] = 0.7
                    })
                })
            else
                u40.speedMotor:setGoal(u7.Spring.new(0, {
                    ["frequency"] = 1,
                    ["dampingRatio"] = 0.5
                }))
                u40.velocityMotor:setGoal({
                    ["x"] = u7.Spring.new(0, {
                        ["frequency"] = 1,
                        ["dampingRatio"] = 0.75
                    }),
                    ["y"] = u7.Spring.new(0, {
                        ["frequency"] = 1,
                        ["dampingRatio"] = 0.75
                    }),
                    ["z"] = u7.Spring.new(0, {
                        ["frequency"] = 1,
                        ["dampingRatio"] = 0.75
                    })
                })
            end
            for _, v79 in v74.sounds do
                v79.Volume = u40.speedMotor:getValue() / 60 / 2 + 0.5
            end
            local v80 = u40.velocityMotor:getValue()
            local v81 = v74.model.PrimaryPart
            local v82 = v80.x
            local v83 = v80.y
            local v84 = v80.z
            v81.AssemblyLinearVelocity = Vector3.new(v82, v83, v84)
            v74.model.PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        end
    end)
end
function u36.updateReleaseUi(p85, p86, p87, p88) --[[ Line: 321 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u32
        [3] = u2
        [4] = u9
        [5] = u34
    --]]
    local v89 = p87 == nil and 1 or p87
    if p86 == nil then
        if p85.heldItemUIMaid then
            p85.heldItemUIMaid:DoCleaning()
            p85.heldItemUIMaid = nil
        end
        for _, v90 in p88:GetChildren() do
            if v90:IsA("Accessory") and v90:GetAttribute("DroneAccessory") == true then
                v90:Destroy()
            end
        end
    else
        local v91 = p88:FindFirstChildOfClass("Humanoid")
        if v91 then
            local v92 = u29.createItemInstance(p86, 1)
            v92:SetAttribute("DroneAccessory", true)
            v91:AddAccessory(v92)
            u32:weldCharacterAccessories(p88)
        end
        if p85.heldItemUIMaid then
            p85.heldItemUIMaid:DoCleaning()
        end
        p85.heldItemUIMaid = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u9.createElement(u34, {
            ["drone"] = p88,
            ["amount"] = v89
        }))
    end
end
function u36.updateHealthUi(p93, p94) --[[ Line: 352 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u9
        [3] = u33
    --]]
    if p94 then
        local v95 = p94:GetAttribute("Health")
        local v96 = p94:GetAttribute("MaxHealth")
        if p93.healthUIMaid then
            p93.healthUIMaid:DoCleaning()
        end
        p93.healthUIMaid = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u9.createElement(u33, {
            ["health"] = v95,
            ["maxHealth"] = v96
        }))
    elseif p93.healthUIMaid then
        p93.healthUIMaid:DoCleaning()
        p93.healthUIMaid = nil
    end
end
function u36.getDroneNumStoredTnt(_, p97) --[[ Line: 368 ]]
    local v98 = p97:GetAttribute("AmountStoredTNT")
    return v98 == nil and 0 or v98
end
function u36.preloadDroneAssets(p99) --[[ Line: 375 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u31
    --]]
    if p99.preloaded then
        return nil
    end
    p99.preloaded = true
    u5.Controllers.PreloadController:runPreload({
        ["sounds"] = { u31.SEAHORSE_SPEEDUP, u31.DRONE_DEPLOY, u31.BEEHIVE_PRODUCE }
    })
end
u5.CreateController(u36.new())
return nil