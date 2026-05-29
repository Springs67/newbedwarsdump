local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u5 = v4.KnitClient
local u6 = v4.KnitClient
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.CollectionService
local u10 = v8.HapticService
local u11 = v8.Players
local u12 = v8.RunService
local u13 = v8.UserInputService
local u14 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u15 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-handler").ProjectileHandler
local u16 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u17 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap
local u18 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "turret", "turret-id").TurretId
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "encoding", "projectile-type-encoding").getProjectileTypeByEncoding
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u25 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 31 ]]
        return "CameraTurretFireController"
    end,
    ["__index"] = u16
})
u25.__index = u25
function u25.new(...) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    local v26 = u25
    local v27 = setmetatable({}, v26)
    return v27:constructor(...) or v27
end
function u25.constructor(p28) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u7
    --]]
    u16.constructor(p28)
    p28.Name = "CameraTurretFireController"
    p28.mouseDown = false
    p28.nextAllowedShot = -1
    p28.maid = u7.new()
end
function u25.KnitStart(u29) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u9
        [3] = u19
        [4] = u23
        [5] = u11
        [6] = u5
        [7] = u24
        [8] = u2
        [9] = u3
        [10] = u14
        [11] = u21
        [12] = u18
        [13] = u13
        [14] = u12
        [15] = u17
        [16] = u20
        [17] = u7
    --]]
    u16.KnitStart(u29)
    u9:GetInstanceAddedSignal(u19.VULCAN_TURRET):Connect(function(u30) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u11
            [3] = u5
            [4] = u24
            [5] = u2
        --]]
        if u30.Name ~= u23.CAMERA_TURRET then
            return nil
        end
        if u30:GetAttribute("PlacedByUserId") ~= u11.LocalPlayer.UserId then
            return nil
        end
        u5.Controllers.ProximityPromptController:createProximityPrompt({
            ["Name"] = "TakeBackPrompt",
            ["HoldDuration"] = 0.25,
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 10,
            ["ActionText"] = "Take Back",
            ["ObjectText"] = "Camera Turret",
            ["Parent"] = u30
        }).Triggered:Connect(function(p31) --[[ Line: 67 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u30
                [3] = u24
                [4] = u2
            --]]
            if p31 ~= u11.LocalPlayer then
                return nil
            end
            if not u30:IsDescendantOf(game) then
                return nil
            end
            u24.Client:Get("TakeBackCameraTurret"):SendToServer({
                ["turretBlockPos"] = u2:getBlockPosition(u30.Position)
            })
        end)
    end)
    u9:GetInstanceAddedSignal(u19.VULCAN_TURRET):Connect(function(p32) --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u3
        --]]
        p32:SetAttribute("ProjectilesIgnore", true)
        for _, v33 in p32:GetDescendants() do
            u3:setQueryIgnored(v33, true)
        end
    end)
    u14.ProjectileLaunched:connect(function(p34) --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u21
        --]]
        if p34.projectileType ~= "turretBullet" and p34.projectileType ~= "turretArtilleryBullet" then
            return nil
        end
        if not p34.shooter then
            return nil
        end
        local v35 = u21[u5.Controllers.KitSkinController:getKitSkin(p34.shooter)].vulcan
        if v35 ~= nil then
            v35 = v35.projectileColor
        end
        if not v35 then
            return nil
        end
        local v36 = p34.projectile:FindFirstChild("Handle")
        if v36 then
            v36.Color = v35
        end
    end)
    u18.changed:connect(function(p37, p38) --[[ Line: 107 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u9
            [3] = u19
            [4] = u13
            [5] = u12
        --]]
        local u39 = p37.Game.selectedTurret
        if u39 == p38.Game.selectedTurret then
            return nil
        end
        u29.maid:DoCleaning()
        local v40 = u39 == nil
        if not v40 then
            local v41 = u9:GetTags(u39)
            local v42 = u19.VULCAN_TURRET
            local v43 = table.find(v41, v42) ~= nil
            v40 = not v43
        end
        if v40 then
            u29.mouseDown = false
            return nil
        end
        u29.maid:GiveTask(u13.InputBegan:Connect(function(p44, p45) --[[ Line: 124 ]]
            --[[
            Upvalues:
                [1] = u29
            --]]
            if not p45 and (u29:isAcceptableInput(p44) and p44.UserInputState == Enum.UserInputState.Begin) then
                u29.mouseDown = true
            end
        end))
        u29.maid:GiveTask(u13.InputEnded:Connect(function(p46, p47) --[[ Line: 129 ]]
            --[[
            Upvalues:
                [1] = u29
            --]]
            if not p47 and (u29:isAcceptableInput(p46) and p46.UserInputState == Enum.UserInputState.End) then
                u29.mouseDown = false
            end
        end))
        u29.maid:GiveTask(u12.Heartbeat:Connect(function() --[[ Line: 134 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u39
            --]]
            if u29.mouseDown == true then
                u29:fire(u39)
            end
        end))
        u29.maid:GiveTask(u13.TouchTapInWorld:Connect(function(_, p48) --[[ Line: 139 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u39
            --]]
            if not p48 then
                u29:fire(u39)
            end
        end))
    end)
    u17.On(function(p49, _, _, _, _, _, _, p50, _, _, _, _, _, _) --[[ Line: 145 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u11
            [3] = u7
            [4] = u5
        --]]
        local v51
        if p50 == nil then
            v51 = p50
        else
            v51 = p50.projectileData
        end
        if v51 then
            local v52 = u20(p50.projectileData.projectileType)
            if (v52 == "turretBullet" or v52 == "turretArtilleryBullet") and p49 == u11.LocalPlayer.Character then
                local u53 = u7.new()
                u53:GiveTask(u5.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    ["moveSpeedMultiplier"] = 0.5
                }))
                task.delay(0.1, function() --[[ Line: 158 ]]
                    --[[
                    Upvalues:
                        [1] = u53
                    --]]
                    u53:DoCleaning()
                end)
            end
        end
    end)
end
function u25.isAcceptableInput(_, p54) --[[ Line: 166 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v55 = false
    local v56 = u6.Controllers.KeybindLoadController:getKeybinds()
    local v57
    if v56 == nil then
        v57 = v56
    else
        v57 = v56.keyboard
        if v57 ~= nil then
            v57 = v57.controlActions.Attack
        end
    end
    local v58 = v57 or Enum.UserInputType.MouseButton1
    if v56 ~= nil then
        v56 = v56.gamepad
        if v56 ~= nil then
            v56 = v56.controlActions.Attack
        end
    end
    local v59 = v56 or Enum.KeyCode.ButtonR2
    return v55 or (p54.UserInputType == v58 and true or p54.KeyCode == v58) or p54.UserInputType == Enum.UserInputType.Touch or p54.KeyCode == v59
end
function u25.fire(p60, p61) --[[ Line: 210 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u14
        [3] = u15
        [4] = u6
        [5] = u23
        [6] = u10
        [7] = u1
    --]]
    local v62 = u22(p61.Name).block
    if v62 ~= nil then
        v62 = v62.projectileSource
    end
    if not v62 then
        return nil
    end
    if time() < p60.nextAllowedShot then
        return nil
    end
    local v63 = v62.fireDelaySec
    local v64 = u14.ProjectileCooldownModifierCheck:fire(v63).cooldown
    p60.nextAllowedShot = time() + v64
    local v65 = p61.Head.BulletOrigin
    local v66 = v65.WorldCFrame.LookVector * 5 + v65.WorldPosition
    local v67 = u15.new(1, 1, "turretBullet", nil, v66, Vector3.new(0, 0, 0))
    u6.Controllers.ProjectileController:launchProjectile(u23.CAMERA_TURRET, nil, v67, p61, v62)
    local v68 = v65.ShootParticles1
    local v69 = v65.ShootParticles2
    if v68 then
        v68:Emit(1)
    end
    if v69 then
        v69:Emit(2)
    end
    if u10:IsVibrationSupported(Enum.UserInputType.Gamepad1) then
        local v70 = p60.hapticCancelPromise
        if v70 ~= nil then
            v70:cancel()
        end
        local u71
        if u10:IsMotorSupported(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.RightTrigger) then
            u71 = Enum.VibrationMotor.RightTrigger
        else
            u71 = Enum.VibrationMotor.Small
        end
        u10:SetMotor(Enum.UserInputType.Gamepad1, u71, 1)
        p60.hapticCancelPromise = u1.Promise.defer(function(_, _, p72) --[[ Line: 249 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u71
            --]]
            local u73 = false
            p72(function() --[[ Line: 251 ]]
                --[[
                Upvalues:
                    [1] = u73
                --]]
                u73 = true
            end)
            task.wait(0.1)
            if u73 then
                return nil
            end
            u10:SetMotor(Enum.UserInputType.Gamepad1, u71, 0)
        end)
    end
end
u5.CreateController(u25.new())
return nil