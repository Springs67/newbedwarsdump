local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local v4 = v3.ConstantManager
local u5 = v3.SoundManager
local u6 = v3.WatchCollectionTag
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.CollectionService
local u14 = v12.RunService
local u15 = v12.TweenService
local u16 = v12.UserInputService
local u17 = v12.Workspace
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local v20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "turret", "turret-types")
local u21 = v20.isLitTurretBlock
local u22 = v20.isTurretBlock
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-types").ItemSkinType
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u28 = v4.registerConstants(script, {
    ["Sensitivity"] = 0.004,
    ["ControllerDeltaMultiplier"] = 5,
    ["AngleLowerLimitY"] = 0.8,
    ["AngleUpperLimitY"] = 0.8,
    ["DampingRatio"] = 0.75,
    ["Frequency"] = 4,
    ["AimSendRate"] = 0.2
})
local u29 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 43 ]]
        return "TurretCameraController"
    end,
    ["__index"] = u18
})
u29.__index = u29
function u29.new(...) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u29
    --]]
    local v30 = u29
    local v31 = setmetatable({}, v30)
    return v31:constructor(...) or v31
end
function u29.constructor(p32) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u26
        [3] = u10
        [4] = u11
    --]]
    u18.constructor(p32)
    p32.Name = "TurretCameraController"
    p32.turretToMaid = {}
    p32.aimTurret = u26.Client:Get("AimTurret")
    p32.nextSendAim = -1
    p32.switchTurret = u26.Client:Get("SwitchTurret")
    p32.angleX = 0
    p32.angleY = 0
    p32.angleMotor = u10.GroupMotor.new({
        ["x"] = 0,
        ["y"] = 0
    })
    p32.maid = u11.new()
end
function u29.KnitStart(u33) --[[ Line: 68 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u17
        [3] = u19
        [4] = u2
        [5] = u14
        [6] = u16
        [7] = u28
        [8] = u10
        [9] = u6
        [10] = u22
        [11] = u11
        [12] = u21
        [13] = u13
        [14] = u9
    --]]
    u18.KnitStart(u33)
    local u34 = u17.CurrentCamera
    u19.changed:connect(function(p35, p36) --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u2
        --]]
        if p35.Game.selectedTurret == p36.Game.selectedTurret then
            return nil
        end
        u33.maid:DoCleaning()
        local v37 = p35.Game.selectedTurret
        local v38 = u33.switchTurret
        local v39 = {}
        local v40
        if v37 then
            v40 = u2:getBlockPosition(v37.Position)
        else
            v40 = nil
        end
        v39.turretBlockPos = v40
        v38:SendToServer(v39)
        if v37 == nil then
            return nil
        end
        local v41 = v37:GetAttribute("AngleX")
        local v42 = v37:GetAttribute("AngleY")
        u33.angleX = v41 == nil and 0 or math.rad(v41)
        u33.angleY = v42 == nil and 0 or math.rad(v42)
    end)
    local u43 = nil
    u14.RenderStepped:Connect(function() --[[ Line: 89 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u43
            [3] = u16
            [4] = u33
            [5] = u28
            [6] = u10
            [7] = u34
        --]]
        local v44 = u19:getState().Game.selectedTurret
        if v44 == nil then
            if u43 then
                u16.MouseBehavior = u43
                u43 = nil
            end
            return nil
        end
        if not u16.TouchEnabled then
            if u16.MouseBehavior ~= Enum.MouseBehavior.LockCenter then
                u43 = u16.MouseBehavior
            end
            u16.MouseBehavior = Enum.MouseBehavior.LockCenter
        end
        local v45
        if u33.thumbstickPosition then
            v45 = Vector2.new(u33.thumbstickPosition.X, -u33.thumbstickPosition.Y) * u28.ControllerDeltaMultiplier
        else
            v45 = u16:GetMouseDelta()
        end
        u33.angleX = u33.angleX - v45.X * u28.Sensitivity
        local v46 = u33
        local v47 = u33.angleY - v45.Y * u28.Sensitivity
        local v48 = -u28.AngleLowerLimitY
        local v49 = u28.AngleUpperLimitY
        v46.angleY = math.clamp(v47, v48, v49)
        u33.angleMotor:setGoal({
            ["x"] = u10.Spring.new(u33.angleX, {
                ["dampingRatio"] = u28.DampingRatio,
                ["frequency"] = u28.Frequency
            }),
            ["y"] = u10.Spring.new(u33.angleY, {
                ["dampingRatio"] = u28.DampingRatio,
                ["frequency"] = u28.Frequency
            })
        })
        u34.CFrame = v44.Head.CameraOrigin.WorldCFrame
    end)
    u14.Heartbeat:Connect(function() --[[ Line: 128 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u33
            [3] = u28
            [4] = u2
        --]]
        local v50 = u19:getState().Game.selectedTurret
        if v50 == nil then
            return nil
        end
        if time() > u33.nextSendAim then
            u33.nextSendAim = time() + u28.AimSendRate
            local v51 = u33.aimTurret
            local v52 = {
                ["turretBlockPos"] = u2:getBlockPosition(v50.Position)
            }
            local v53 = u33.angleX % 6.283185307179586
            v52.angleX = math.deg(v53)
            local v54 = u33.angleY
            v52.angleY = math.deg(v54)
            v51:SendToServer(v52)
        end
    end)
    u6("Turret", function(u55) --[[ Line: 142 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u11
            [3] = u33
            [4] = u21
            [5] = u19
            [6] = u16
        --]]
        if not u22(u55) then
            return nil
        end
        local u56 = u11.new()
        u33:updateAngleOfTurret(u55)
        if u21(u55) then
            u33:toggleLightsOnTurret(u55, false)
        end
        local function v57() --[[ Line: 151 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u55
                [3] = u33
            --]]
            if u19:getState().Game.selectedTurret ~= u55 then
                u33:updateAngleOfTurret(u55)
            end
        end
        u56:GiveTask(u55:GetAttributeChangedSignal("AngleX"):Connect(v57))
        u56:GiveTask(u55:GetAttributeChangedSignal("AngleY"):Connect(v57))
        u56:GiveTask(u55:GetAttributeChangedSignal("IsActive"):Connect(function() --[[ Line: 158 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u55
                [3] = u33
            --]]
            if u21(u55) then
                u33:toggleLightsOnTurret(u55)
            end
        end))
        u56:GiveTask(u55.AncestryChanged:Connect(function() --[[ Line: 163 ]]
            --[[
            Upvalues:
                [1] = u55
                [2] = u56
            --]]
            if not u55.Parent then
                u56:DoCleaning()
            end
        end))
        u56:GiveTask(u16.InputChanged:Connect(function(p58) --[[ Line: 169 ]]
            --[[
            Upvalues:
                [1] = u33
            --]]
            if p58.UserInputType == Enum.UserInputType.Gamepad1 and p58.KeyCode == Enum.KeyCode.Thumbstick1 then
                u33:handleConsoleInput(p58)
            end
        end))
        u56:GiveTask(u16.InputEnded:Connect(function(p59) --[[ Line: 176 ]]
            --[[
            Upvalues:
                [1] = u33
            --]]
            if p59.UserInputType == Enum.UserInputType.Gamepad1 and p59.KeyCode == Enum.KeyCode.Thumbstick1 then
                u33.thumbstickPosition = nil
            end
        end))
    end)
    u13:GetInstanceRemovedSignal("Turret"):Connect(function(p60) --[[ Line: 184 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u33
            [3] = u19
            [4] = u9
        --]]
        if u22(p60) then
            local v61 = u33.turretToMaid[p60]
            if v61 ~= nil then
                v61:DoCleaning()
            end
            u33.turretToMaid[p60] = nil
            local v62 = u19:getState().Game.selectedTurret
            if v62 and p60 == v62 then
                u19:dispatch({
                    ["type"] = "SetSpectatedTurret",
                    ["selectedTurret"] = u9.Controllers.TurretController:getNextTurret(v62:GetAttribute("TurretId"))
                })
            end
        end
    end)
    u33.angleMotor:onStep(function(p63) --[[ Line: 205 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        local v64 = u19:getState().Game.selectedTurret
        if v64 == nil then
            return nil
        end
        local v65 = CFrame.new(v64.Rotate.Position)
        local v66 = CFrame.Angles(0, p63.x, 0)
        local v67 = CFrame.Angles(p63.y, 0, 0)
        v64.Rotate.CFrame = v65 * v66 * v67
    end)
end
function u29.handleConsoleInput(p68, p69) --[[ Line: 216 ]]
    if p69.Position.Magnitude > 0.1 then
        p68.thumbstickPosition = p69.Position
    else
        p68.thumbstickPosition = nil
    end
end
function u29.updateAngleOfTurret(_, p70) --[[ Line: 223 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u27
        [3] = u23
        [4] = u25
        [5] = u24
        [6] = u15
    --]]
    local v71 = p70:GetAttribute("AngleX")
    local v72 = p70:GetAttribute("AngleY")
    if v71 == nil or v72 == nil then
        return nil
    end
    local u73 = nil
    local v74 = p70:GetAttribute("ItemSkin")
    if v74 ~= nil then
        v74 = string.lower(v74)
    end
    local v75
    if v74 == "" or not v74 then
        v75 = v74
    else
        v75 = v74 == "camera_turret_vampire"
    end
    if v75 == "" or not v75 then
        local v76
        if v74 == "" or not v74 then
            v76 = v74
        else
            v76 = v74 == "camera_turret_cream_soda"
        end
        if v76 == "" or not v76 then
            if v74 ~= "" and v74 then
                v74 = v74 == u23.CAMERA_TURRET_STARRYSOLDIER
            end
            if v74 == "" or not v74 then
                u73 = u5:playSound(u27.TURRET_ROTATE, {
                    ["position"] = p70.Position
                })
            else
                u5:playSound(u25[u24.STARRYSOLDIER_VULCAN].vulcan.rotateSound, {
                    ["position"] = p70.Position
                })
            end
        else
            u73 = u5:playSound(u27.TURRET_CREAM_SODA_ROTATE, {
                ["position"] = p70.Position
            })
        end
    else
        u73 = u5:playSound(u27.TURRET_VAMPIRE_ROTATE, {
            ["position"] = p70.Position
        })
    end
    local v77 = u15
    local v78 = p70.Rotate
    local v79 = TweenInfo.new(0.2, Enum.EasingStyle.Linear)
    local v80 = {}
    local v81 = CFrame.new(p70.Rotate.Position)
    local v82 = CFrame.Angles(0, math.rad(v71), 0)
    local v83 = CFrame.Angles(math.rad(v72), 0, 0)
    v80.CFrame = v81 * v82 * v83
    local v84 = v77:Create(v78, v79, v80)
    v84:Play()
    local u85 = nil
    u85 = v84.Completed:Connect(function() --[[ Line: 280 ]]
        --[[
        Upvalues:
            [1] = u73
            [2] = u85
        --]]
        local v86 = u73
        if v86 ~= nil then
            v86:Stop()
        end
        local v87 = u73
        if v87 ~= nil then
            v87:Destroy()
        end
        u85:Disconnect()
    end)
end
function u29.toggleLightsOnTurret(_, p88, p89) --[[ Line: 292 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u27
        [3] = u23
        [4] = u25
        [5] = u24
    --]]
    local v90 = p89 == nil and true or p89
    local v91 = p88:GetAttribute("IsActive")
    local v92 = p88:GetAttribute("ItemSkin")
    if v91 == nil then
        if v90 then
            local v93
            if v92 == "" or not v92 then
                v93 = v92
            else
                v93 = string.lower(v92) == "camera_turret_vampire"
            end
            if v93 == "" or not v93 then
                local v94
                if v92 == "" or not v92 then
                    v94 = v92
                else
                    v94 = string.lower(v92) == "camera_turret_cream_soda"
                end
                if v94 == "" or not v94 then
                    if v92 ~= "" and v92 then
                        v92 = string.lower(v92) == u23.CAMERA_TURRET_STARRYSOLDIER
                    end
                    if v92 == "" or not v92 then
                        u5:playSound(u27.TURRET_OFF, {
                            ["position"] = p88.Position
                        })
                    else
                        u5:playSound(u25[u24.STARRYSOLDIER_VULCAN].vulcan.offSound, {
                            ["position"] = p88.Position
                        })
                    end
                else
                    u5:playSound(u27.TURRET_CREAM_SODA_OFF, {
                        ["position"] = p88.Position
                    })
                end
            else
                u5:playSound(u27.TURRET_VAMPIRE_OFF, {
                    ["position"] = p88.Position
                })
            end
        end
        return nil
    end
    if v90 then
        local v95
        if v92 == "" or not v92 then
            v95 = v92
        else
            v95 = string.lower(v92) == "camera_turret_vampire"
        end
        if v95 ~= "" and v95 then
            u5:playSound(u27.TURRET_VAMPIRE_ON, {
                ["position"] = p88.Position
            })
            return
        end
        local v96
        if v92 == "" or not v92 then
            v96 = v92
        else
            v96 = string.lower(v92) == "camera_turret_cream_soda"
        end
        if v96 ~= "" and v96 then
            u5:playSound(u27.TURRET_CREAM_SODA_ON, {
                ["position"] = p88.Position
            })
            return
        end
        if v92 ~= "" and v92 then
            v92 = string.lower(v92) == u23.CAMERA_TURRET_STARRYSOLDIER
        end
        if v92 ~= "" and v92 then
            u5:playSound(u25[u24.STARRYSOLDIER_VULCAN].vulcan.onSound, {
                ["position"] = p88.Position
            })
            return
        end
        u5:playSound(u27.TURRET_ON, {
            ["position"] = p88.Position
        })
    end
end
v8.CreateController(u29.new())
return nil