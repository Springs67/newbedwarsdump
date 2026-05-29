local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local v4 = v3.ConstantManager
local u5 = v3.GamepadAction
local u6 = v3.RandomUtil
local u7 = v3.SoundManager
local u8 = v3.WatchCollectionTag
local v9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v10 = v9.KnitClient
local u11 = v9.KnitClient
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v15 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u16 = v15.CollectionService
local u17 = v15.Players
local u18 = v15.RunService
local u19 = v15.TweenService
local u20 = v15.UserInputService
local u21 = v15.Workspace
local u22 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u23 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u28 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u29 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u30 = u1.import(script, script.Parent, "ballista-crosshair").BallistaCrosshairWrapper
local u31 = u1.import(script, script.Parent, "ballista-ui").BallistaUI
local u32 = v4.registerConstants(script, {
    ["Sensitivity"] = 0.004,
    ["ControllerDeltaMultiplier"] = 5,
    ["AngleLowerLimitY"] = 0.8,
    ["AngleUpperLimitY"] = 0.8,
    ["DampingRatio"] = 0.75,
    ["Frequency"] = 4,
    ["AimSendRate"] = 0.2
})
local u33 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 47 ]]
        return "BallistaController"
    end,
    ["__index"] = u22
})
u33.__index = u33
function u33.new(...) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u33
    --]]
    local v34 = u33
    local v35 = setmetatable({}, v34)
    return v35:constructor(...) or v35
end
function u33.constructor(p36) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u13
        [3] = u12
        [4] = u28
    --]]
    u22.constructor(p36)
    p36.Name = "BallistaController"
    p36.aimingMaid = u13.new()
    p36.ballistaPromptMap = {}
    p36.ballistaDriverMap = {}
    p36.angleX = 0
    p36.angleY = 0
    p36.ballistaMaidMap = {}
    p36.angleMotor = u12.GroupMotor.new({
        ["x"] = 0,
        ["y"] = 0
    })
    p36.mouseDown = false
    p36.fireBallista = u28.Client:Get("FireBallista")
    p36.nextAllowedShot = -1
    p36.lastBallistaHeadUpdate = 0
end
function u33.KnitStart(u37) --[[ Line: 75 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u8
        [3] = u11
        [4] = u17
        [5] = u23
        [6] = u28
        [7] = u13
        [8] = u16
        [9] = u18
        [10] = u20
        [11] = u32
        [12] = u12
        [13] = u21
        [14] = u26
        [15] = u27
        [16] = u7
        [17] = u6
        [18] = u2
        [19] = u24
        [20] = u19
        [21] = u29
        [22] = u1
    --]]
    u22.KnitStart(u37)
    u8("Ballista", function(u38) --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u37
            [3] = u17
            [4] = u23
            [5] = u28
            [6] = u13
        --]]
        local u39 = u11.Controllers.ProximityPromptController:createProximityPrompt({
            ["Name"] = "AimPrompt",
            ["HoldDuration"] = 0.2,
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 8,
            ["ActionText"] = "Aim Ballista",
            ["ClickablePrompt"] = false,
            ["Parent"] = u38
        })
        u37.ballistaPromptMap[u38] = u39
        u39.Triggered:Connect(function(p40) --[[ Line: 90 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u38
                [3] = u39
                [4] = u17
                [5] = u23
                [6] = u28
            --]]
            if u37.ballistaDriverMap[p40] then
                return false
            end
            u37.ballistaDriverMap[p40] = u38
            u39.Enabled = false
            if p40 == u17.LocalPlayer then
                u23:dispatch({
                    ["type"] = "UnequipItemInHand",
                    ["equip"] = false
                })
                local v41 = {
                    ["ballista"] = u38
                }
                u28.Client:Get("AimBallista"):SendToServer(v41)
                u37:watchPlayerDistance(p40, u38)
                u37:startAiming(u38)
            end
        end)
        local v42 = u37.ballistaMaidMap[u38] or u13.new()
        u37.ballistaMaidMap[u38] = v42
        v42:GiveTask(u39)
        u37:updateAngleOfTurret(u38)
        v42:GiveTask(u38:GetAttributeChangedSignal("AngleX"):Connect(function() --[[ Line: 126 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u38
            --]]
            u37:updateAngleOfTurret(u38)
        end))
        v42:GiveTask(u38:GetAttributeChangedSignal("AngleY"):Connect(function() --[[ Line: 129 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u38
            --]]
            u37:updateAngleOfTurret(u38)
        end))
    end)
    u16:GetInstanceRemovedSignal("Ballista"):Connect(function(p43) --[[ Line: 133 ]]
        --[[
        Upvalues:
            [1] = u37
            [2] = u17
        --]]
        local v44 = u37.ballistaMaidMap[p43]
        if v44 ~= nil then
            v44:DoCleaning()
        end
        if p43 == u37.ballista then
            u37.ballista = nil
            u37:exitBallista(u17.LocalPlayer, p43)
            u37.aimingMaid:DoCleaning()
        end
        local v45 = u37.ballistaPromptMap[p43]
        if v45 ~= nil then
            v45:Destroy()
        end
    end)
    local u46 = nil
    u18.RenderStepped:Connect(function() --[[ Line: 156 ]]
        --[[
        Upvalues:
            [1] = u37
            [2] = u46
            [3] = u20
            [4] = u32
            [5] = u12
            [6] = u21
        --]]
        if u37.ballista == nil then
            if u46 then
                u20.MouseBehavior = u46
                u46 = nil
            end
            return nil
        end
        if not u20.TouchEnabled then
            if u20.MouseBehavior ~= Enum.MouseBehavior.LockCenter then
                u46 = u20.MouseBehavior
            end
            u20.MouseBehavior = Enum.MouseBehavior.LockCenter
        end
        local v47
        if u37.thumbstickPosition then
            v47 = Vector2.new(u37.thumbstickPosition.X, -u37.thumbstickPosition.Y) * u32.ControllerDeltaMultiplier
        else
            v47 = u20:GetMouseDelta()
        end
        u37.angleX = u37.angleX - v47.X * u32.Sensitivity
        local v48 = u37
        local v49 = u37.angleY - v47.Y * u32.Sensitivity
        local v50 = -u32.AngleLowerLimitY
        local v51 = u32.AngleUpperLimitY
        v48.angleY = math.clamp(v49, v50, v51)
        local v52 = u37.angleMotor
        local v53 = {
            ["x"] = u12.Spring.new(u37.angleX, {
                ["dampingRatio"] = u32.DampingRatio,
                ["frequency"] = u32.Frequency
            }),
            ["y"] = u12.Spring.new(u37.angleY, {
                ["dampingRatio"] = u32.DampingRatio,
                ["frequency"] = u32.Frequency
            })
        }
        v52:setGoal(v53)
        u21.CurrentCamera.CFrame = u37.ballista.Head.CameraOrigin.WorldCFrame
    end)
    u18.Heartbeat:Connect(function() --[[ Line: 194 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u37
            [3] = u17
        --]]
        if u21:GetServerTimeNow() - u37.lastBallistaHeadUpdate > 0.2 then
            u37.lastBallistaHeadUpdate = u21:GetServerTimeNow()
            for v54, v55 in u37.ballistaDriverMap do
                if v54 ~= u17.LocalPlayer then
                    u37:updateAngleOfTurret(v55)
                end
            end
        end
        if u37.ballista == nil then
            return nil
        end
        if u37.mouseDown == true then
            u37:fire()
        end
    end)
    u37.angleMotor:onStep(function(p56) --[[ Line: 216 ]]
        --[[
        Upvalues:
            [1] = u37
        --]]
        if not u37.ballista then
            return nil
        end
        local v57 = CFrame.new(u37.ballista.Rotate.Position)
        local v58 = CFrame.Angles(0, p56.x, 0)
        local v59 = CFrame.Angles(p56.y, 0, 0)
        u37.ballista.Rotate.CFrame = v57 * v58 * v59
    end)
    u28.Client:Get("BallistaFired"):Connect(function(u60) --[[ Line: 225 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u27
            [3] = u7
            [4] = u6
            [5] = u17
            [6] = u2
            [7] = u24
            [8] = u37
            [9] = u19
            [10] = u29
        --]]
        local v61 = u26(u27.BALLISTA).block
        if v61 ~= nil then
            v61 = v61.projectileSource
        end
        if not v61 then
            return nil
        end
        if v61.launchSound then
            local v62 = u7
            local v63 = u6.fromList
            local v64 = v61.launchSound
            v62:playSound(v63(unpack(v64)), {
                ["position"] = u60.ballista.Position
            })
        end
        if u60.player == u17.LocalPlayer then
            local v65 = u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController")
            local v66 = u24.BALLISTA
            local v67 = v61.fireDelaySec - 0.05
            local v68 = {
                ["cooldownBar"] = {
                    ["color"] = Color3.new(0.92, 0.22, 0.18)
                }
            }
            v65:setOnCooldown(v66, v67, v68)
        end
        local u69 = u60.ballista
        u37:hideArrow(u69)
        local u70 = u69.Rope.Size
        local u71 = u69.Rope.Position
        local v72 = u19
        local v73 = u69.Rope
        local v74 = TweenInfo.new(0.2, Enum.EasingStyle.Exponential)
        local v75 = {
            ["Size"] = u69.Rope.Size * Vector3.new(1, 1, 0)
        }
        local v76 = u69.Rope.Position
        local v77 = -(u70.Z / 2)
        v75.Position = v76 + Vector3.new(0, 0, v77)
        v72:Create(v73, v74, v75):Play()
        local u80 = task.delay(1, function() --[[ Line: 265 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u29
                [3] = u69
                [4] = u19
                [5] = u70
                [6] = u71
                [7] = u60
                [8] = u37
            --]]
            u7:playSound(u29.BALLISTA_RELOAD, {
                ["position"] = u69.Position
            })
            local v78 = {
                ["Size"] = u70,
                ["Position"] = u71
            }
            u19:Create(u69.Rope, TweenInfo.new(0.5), v78):Play()
            local u79 = task.delay(0.5, function() --[[ Line: 274 ]]
                --[[
                Upvalues:
                    [1] = u69
                    [2] = u60
                    [3] = u37
                --]]
                if not u69 then
                    return nil
                end
                if not u60.player then
                    return nil
                end
                if u37:hasAmmo(u60.player) then
                    u37:showArrow(u69)
                end
            end)
            u69.Destroying:Once(function() --[[ Line: 286 ]]
                --[[
                Upvalues:
                    [1] = u79
                --]]
                task.cancel(u79)
            end)
        end)
        u69.Destroying:Once(function() --[[ Line: 290 ]]
            --[[
            Upvalues:
                [1] = u80
            --]]
            task.cancel(u80)
        end)
    end)
    u28.Client:Get("EntityDeathEvent"):Connect(function(p81) --[[ Line: 294 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u37
        --]]
        local v82 = u17:GetPlayerFromCharacter(p81.entityInstance)
        if not v82 then
            return nil
        end
        local v83 = u37.ballistaDriverMap[v82]
        local v84
        if v83 then
            v84 = u37.ballistaPromptMap[v83]
        else
            v84 = nil
        end
        u37.ballistaDriverMap[v82] = nil
        if v84 then
            v84.Enabled = true
        end
        if v82 == u17.LocalPlayer then
            u37.aimingMaid:DoCleaning()
        end
    end)
    u28.Client:Get("BallistaEntered"):Connect(function(p85) --[[ Line: 309 ]]
        --[[
        Upvalues:
            [1] = u37
        --]]
        local v86 = u37.ballistaPromptMap[p85.ballista]
        if v86 then
            v86.Enabled = false
        end
        u37.ballistaDriverMap[p85.player] = p85.ballista
        if u37:hasAmmo(p85.player) then
            u37:showArrow(p85.ballista)
        end
    end)
    u28.Client:Get("BallistaExited"):Connect(function(u87) --[[ Line: 324 ]]
        --[[
        Upvalues:
            [1] = u37
            [2] = u17
            [3] = u1
        --]]
        local v88 = u37.ballistaPromptMap[u87.ballista]
        if v88 then
            v88.Enabled = true
        end
        u37.ballistaDriverMap[u87.player] = nil
        if u87.player == u17.LocalPlayer then
            u37.aimingMaid:DoCleaning()
        end
        u1.try(function() --[[ Line: 337 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u87
            --]]
            u37:hideArrow(u87.ballista)
        end, function(_) --[[ Line: 339 ]] end)
    end)
end
function u33.exitBallista(_, _, p89) --[[ Line: 342 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    u28.Client:Get("RequestExitBallista"):CallServer({
        ["ballista"] = p89
    })
end
function u33.mountBallistaUI(p90, p91) --[[ Line: 347 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u30
        [3] = u17
        [4] = u2
        [5] = u31
        [6] = u5
    --]]
    local u92 = u14.mount(u14.createElement(u30), u17.LocalPlayer:WaitForChild("PlayerGui"))
    p90.aimingMaid:GiveTask(function() --[[ Line: 349 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u92
        --]]
        u14.unmount(u92)
    end)
    local v93 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u14.createElement(u31, {
        ["Ballista"] = p91,
        ["inputTypes"] = { Enum.KeyCode.X, u5.Interact }
    }))
    p90.aimingMaid:GiveTask(v93)
end
function u33.watchPlayerDistance(u94, u95, u96) --[[ Line: 358 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    u94.aimingMaid:GiveTask(u18.Heartbeat:Connect(function() --[[ Line: 359 ]]
        --[[
        Upvalues:
            [1] = u95
            [2] = u96
            [3] = u94
        --]]
        local v97 = u95.Character
        if v97 ~= nil then
            v97 = v97.PrimaryPart
        end
        local v98 = u96:GetPivot().Position
        local v99
        if v97 == nil then
            v99 = v97
        else
            v99 = v97.Parent
        end
        if not v99 then
            u94:exitBallista(u95, u96)
            return nil
        end
        if not v98 or (v97.Position - v98).Magnitude > 10 then
            u94:exitBallista(u95, u96)
        end
    end))
end
function u33.startAiming(u100, p101) --[[ Line: 379 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    u100.aimingMaid:DoCleaning()
    u100:mountBallistaUI(p101)
    local u102 = u20.MouseIconEnabled
    u20.MouseIconEnabled = false
    u100.ballista = p101
    u100.aimingMaid:GiveTask(function() --[[ Line: 385 ]]
        --[[
        Upvalues:
            [1] = u100
            [2] = u20
            [3] = u102
        --]]
        u100.ballista = nil
        u20.MouseIconEnabled = u102
    end)
    local v103 = p101:GetAttribute("AngleX")
    local v104 = p101:GetAttribute("AngleY")
    u100.angleX = v103 == nil and 0 or math.rad(v103)
    u100.angleY = v104 == nil and 0 or math.rad(v104)
    u100.aimingMaid:GiveTask(u20.InputBegan:Connect(function(p105, p106) --[[ Line: 393 ]]
        --[[
        Upvalues:
            [1] = u100
        --]]
        if not p106 and (u100:isAcceptableInput(p105) and p105.UserInputState == Enum.UserInputState.Begin) then
            u100.mouseDown = true
        end
    end))
    u100.aimingMaid:GiveTask(u20.InputEnded:Connect(function(p107, p108) --[[ Line: 398 ]]
        --[[
        Upvalues:
            [1] = u100
        --]]
        if not p108 and (u100:isAcceptableInput(p107) and p107.UserInputState == Enum.UserInputState.End) then
            u100.mouseDown = false
        end
    end))
end
function u33.isAcceptableInput(_, p109) --[[ Line: 404 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v110 = false
    local v111 = u11.Controllers.KeybindLoadController:getKeybinds()
    local v112
    if v111 == nil then
        v112 = v111
    else
        v112 = v111.keyboard
        if v112 ~= nil then
            v112 = v112.controlActions.Attack
        end
    end
    local v113 = v112 or Enum.UserInputType.MouseButton1
    if v111 ~= nil then
        v111 = v111.gamepad
        if v111 ~= nil then
            v111 = v111.controlActions.Attack
        end
    end
    local v114 = v111 or Enum.KeyCode.ButtonR2
    return v110 or (p109.UserInputType == v113 and true or p109.KeyCode == v113) or p109.KeyCode == v114
end
function u33.fire(p115) --[[ Line: 443 ]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u27
    --]]
    if not p115.ballista then
        return nil
    end
    local v116 = u26(u27.BALLISTA).block
    if v116 ~= nil then
        v116 = v116.projectileSource
    end
    if not v116 then
        return nil
    end
    if time() < p115.nextAllowedShot then
        return nil
    end
    p115.nextAllowedShot = time() + v116.fireDelaySec
    local v117 = p115.ballista.Head.BulletOrigin.WorldCFrame.LookVector
    local v118 = p115.fireBallista
    local v119 = {
        ["ballistaBlock"] = p115.ballista,
        ["lookVector"] = v117
    }
    local v120 = p115.angleX % 6.283185307179586
    v119.angleX = math.deg(v120)
    local v121 = p115.angleY
    v119.angleY = math.deg(v121)
    v118:SendToServer(v119)
end
function u33.updateAngleOfTurret(_, p122) --[[ Line: 468 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v123 = p122:GetAttribute("AngleX")
    local v124 = p122:GetAttribute("AngleY")
    if v123 == nil or v124 == nil then
        return nil
    end
    local v125 = u19
    local v126 = p122.Rotate
    local v127 = TweenInfo.new(0.2, Enum.EasingStyle.Linear)
    local v128 = {}
    local v129 = CFrame.new(p122.Rotate.Position)
    local v130 = CFrame.Angles(0, math.rad(v123), 0)
    local v131 = CFrame.Angles(math.rad(v124), 0, 0)
    v128.CFrame = v129 * v130 * v131
    local v132 = v125:Create(v126, v127, v128)
    v132:Play()
    local u133 = nil
    u133 = v132.Completed:Connect(function() --[[ Line: 486 ]]
        --[[
        Upvalues:
            [1] = u133
        --]]
        u133:Disconnect()
    end)
end
function u33.hasAmmo(_, p134) --[[ Line: 490 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u27
    --]]
    local v135 = false
    for v136, v137 in u25.getInventory(p134).items do
        local _ = v136 - 1
        if v137.itemType == u27.BALLISTA_AMMO then
            return true
        end
    end
    return v135
end
function u33.showArrow(_, p138) --[[ Line: 506 ]]
    p138.ExplosiveArrow.Transparency = 0
    p138.ExplosiveArrow.Attachment.BigFire.Enabled = true
    p138.ExplosiveArrow.Attachment.SmallFire.Enabled = true
    p138.ExplosiveArrow.Attachment.Specs.Enabled = true
end
function u33.hideArrow(_, p139) --[[ Line: 512 ]]
    p139.ExplosiveArrow.Transparency = 1
    p139.ExplosiveArrow.Attachment.BigFire.Enabled = false
    p139.ExplosiveArrow.Attachment.SmallFire.Enabled = false
    p139.ExplosiveArrow.Attachment.Specs.Enabled = false
end
v10.CreateController(u33.new())
return nil