local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.DeviceUtil
local u5 = v2.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.Players
local u15 = v13.ReplicatedStorage
local u16 = v13.RunService
local u17 = v13.Workspace
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local v19 = v1.import(script, script.Parent.Parent.Parent.Parent, "movement", "event", "move-mount-event")
local u20 = v19.InputActionType
local u21 = v19.MoveMountDirection
local u22 = v1.import(script, script.Parent.Parent.Parent.Parent, "movement", "move-mount-ui").MoveMountUI
local u23 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "mount", "mount-flight-controls").MountFlightControls
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u30 = v1.import(script, script.Parent.Parent, "win-effect").WinEffect
local u31 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 37 ]]
        return "DustDevilWinEffectController"
    end,
    ["__index"] = u30
})
u31.__index = u31
function u31.new(...) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u31
    --]]
    local v32 = u31
    local v33 = setmetatable({}, v32)
    return v33:constructor(...) or v33
end
function u31.constructor(p34) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u27
        [3] = u10
    --]]
    u30.constructor(p34, u27.DUST_DEVIL)
    p34.Name = "DustDevilWinEffectController"
    p34.upHeld = false
    p34.downHeld = false
    p34.maid = u10.new()
end
function u31.KnitStart(u35) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u18
        [3] = u21
        [4] = u20
        [5] = u28
        [6] = u8
        [7] = u29
        [8] = u24
        [9] = u9
        [10] = u26
        [11] = u15
        [12] = u14
        [13] = u17
        [14] = u3
        [15] = u25
        [16] = u11
        [17] = u16
    --]]
    u30.KnitStart(u35)
    u35.maid:GiveTask(u18.MoveMountButtonChange:connect(function(p36) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u35
            [3] = u20
        --]]
        local v37 = p36.direction
        if v37 == u21.UP then
            u35.upHeld = p36.inputActionType == u20.PRESS
        elseif v37 == u21.DOWN then
            u35.downHeld = p36.inputActionType == u20.PRESS
        end
    end))
    u28.Client:OnEvent("DustDevilWinEffectSetupComplete", function(p38) --[[ Line: 69 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u29
            [3] = u24
            [4] = u9
            [5] = u26
            [6] = u15
            [7] = u35
            [8] = u14
            [9] = u17
            [10] = u3
            [11] = u25
            [12] = u11
            [13] = u16
        --]]
        u8.Controllers.PreloadController:runPreload({
            ["sounds"] = { u29.DUST_DEVIL_LOOP, u29.DUST_DEVIL_PICKUP_LOOP },
            ["animations"] = { u24.DUST_DEVIL_PLAYER, u24.DUST_DEVIL_SPIN }
        })
        local u39 = p38.winningPlayer
        local u40 = u9.SingleMotor.new(0)
        local u41 = u39.Character
        local v42
        if u41 == nil then
            v42 = u41
        else
            v42 = u41.PrimaryPart
        end
        if not v42 then
            return nil
        end
        local u43 = u41:FindFirstChild("Humanoid")
        if not u43 then
            return nil
        end
        local v44 = u26:getEntity(u39)
        if not v44 then
            return nil
        end
        local u45 = u15.Assets.Misc.DustDevil:Clone()
        if not u45.PrimaryPart then
            return nil
        end
        u35:setUpDustDevil(u45, u41.HumanoidRootPart.CFrame, u39)
        if u14.LocalPlayer == u39 then
            u35:mountUi(u39)
            u35:bindControls()
            u35:orientCamera(u45.PrimaryPart)
        end
        u41.Archivable = true
        local u46 = u41:Clone()
        if u46 then
            u46.Parent = u17
            u46.Name = "DustDevilEye"
            local v47 = u46:FindFirstChild("Head")
            if v47 ~= nil then
                v47 = v47:FindFirstChild("Nametag")
            end
            if v47 then
                v47:Destroy()
            end
            local v48 = u46:FindFirstChild("Head")
            if v48 ~= nil then
                v48 = v48:FindFirstChild("StatusEffectTagGui")
            end
            if v48 then
                v48:Destroy()
            end
            u3:playAnimation(u46, u25:getAssetId(u24.DUST_DEVIL_PLAYER), {
                ["looped"] = true
            })
        end
        v44:getInstance():SetAttribute("Transparency", 1)
        v44:hideNametag()
        local v49 = u41.PrimaryPart
        local v50 = v49.AssemblyMass
        local v51 = u11
        local v52 = {
            ["Name"] = "AntiGrav"
        }
        local v53 = u17.Gravity * v50
        v52.Force = Vector3.new(0, v53, 0)
        v52.Parent = v49
        v51("BodyForce", v52)
        local v54 = u11("Attachment", {
            ["Parent"] = u41.PrimaryPart
        })
        u11("AngularVelocity", {
            ["MaxTorque"] = 5000,
            ["RelativeTo"] = Enum.ActuatorRelativeTo.Attachment0,
            ["Attachment0"] = v54,
            ["Parent"] = u41.PrimaryPart
        })
        local u55 = u17:GetServerTimeNow()
        local u56 = u41.PrimaryPart.CFrame
        local u57 = u45.PrimaryPart.CFrame
        u16.Heartbeat:Connect(function(p58) --[[ Line: 156 ]]
            --[[
            Upvalues:
                [1] = u41
                [2] = u17
                [3] = u45
                [4] = u55
                [5] = u56
                [6] = u57
                [7] = u46
                [8] = u14
                [9] = u39
                [10] = u35
                [11] = u40
                [12] = u9
                [13] = u43
            --]]
            local v59 = u41
            if v59 ~= nil then
                v59 = v59.PrimaryPart
            end
            if not v59 then
                return nil
            end
            local v60 = u17:GetServerTimeNow()
            u45:PivotTo(u41.PrimaryPart.CFrame)
            if u55 + 0.6 <= v60 then
                u55 = v60
                u56 = u41.PrimaryPart.CFrame
                if not u45.PrimaryPart then
                    return nil
                end
                u57 = u45.PrimaryPart.CFrame
            end
            local v61 = u46
            if v61 ~= nil then
                v61 = v61.PrimaryPart
            end
            if v61 then
                u46:PivotTo(u45:GetPivot() + Vector3.new(0, 10, 0))
                local v62 = u46.PrimaryPart.Orientation
                u46.PrimaryPart.Orientation = v62 + Vector3.new(0, 15, 0)
            end
            if u14.LocalPlayer == u39 then
                local v63 = u41.PrimaryPart.CFrame
                local v64 = CFrame.new(0, 0, -35 * p58)
                u41.PrimaryPart.CFrame = v63 * v64
                if u35.upHeld and not u35.downHeld then
                    u40:setGoal(u9.Spring.new(10))
                elseif u35.downHeld and not u35.upHeld then
                    u40:setGoal(u9.Spring.new(-10))
                else
                    u40:setGoal(u9.Spring.new(0, {
                        ["frequency"] = 1
                    }))
                end
                local v65 = u41.PrimaryPart
                local v66 = u40:getValue()
                v65.AssemblyLinearVelocity = Vector3.new(0, v66, 0)
                u43:Move(Vector3.new(0, 0, 0))
            end
        end)
    end)
end
function u31.onWin(_, _) --[[ Line: 207 ]] end
function u31.setUpDustDevil(_, p67, p68, u69) --[[ Line: 209 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u11
        [3] = u5
        [4] = u29
        [5] = u16
        [6] = u28
        [7] = u3
        [8] = u25
        [9] = u24
    --]]
    if not p67.PrimaryPart then
        return nil
    end
    p67.Parent = u17
    p67:PivotTo(p68)
    for v70, v71 in p67:GetDescendants() do
        local _ = v70 - 1
        if v71:IsA("BasePart") then
            v71.CanCollide = false
            v71.CanTouch = false
        end
    end
    local v72 = u11
    local v73 = {
        ["Name"] = "DevilAntiGrav"
    }
    local v74 = 10 * p67.PrimaryPart.AssemblyMass
    v73.Force = Vector3.new(0, v74, 0)
    v73.Parent = p67
    v72("VectorForce", v73)
    u5:playSound(u29.DUST_DEVIL_LOOP, {
        ["volumeMultiplier"] = 0.5,
        ["rollOffMaxDistance"] = 240,
        ["rollOffMinDistance"] = 50,
        ["looped"] = true,
        ["parent"] = p67.PrimaryPart
    })
    local u75 = u5:playModifiableSound(u29.DUST_DEVIL_PICKUP_LOOP, {
        ["volumeMultiplier"] = 0.8,
        ["rollOffMaxDistance"] = 240,
        ["rollOffMinDistance"] = 50,
        ["looped"] = true,
        ["parent"] = p67.PrimaryPart
    })
    u75.Volume = 0
    u16.Heartbeat:Connect(function(p76) --[[ Line: 248 ]]
        --[[
        Upvalues:
            [1] = u75
        --]]
        local v77 = u75
        local v78 = u75.Volume - p76 * 2
        v77.Volume = math.max(0, v78)
    end)
    u28.Client:OnEvent("WhirlwindEffect", function(p79) --[[ Line: 251 ]]
        --[[
        Upvalues:
            [1] = u69
            [2] = u75
        --]]
        local v80 = p79.id
        local v81 = u69.UserId
        if v80 ~= "DustDevilWinEffect_" .. tostring(v81) then
            return nil
        end
        u75.Volume = 2
    end)
    local v82 = p67:FindFirstChild("AnimationController")
    if v82 ~= nil then
        v82 = v82:FindFirstChild("Animator")
    end
    if v82 then
        u3:playAnimation(v82, u25:getAssetId(u24.DUST_DEVIL_SPIN), {
            ["looped"] = true
        })
    end
end
function u31.mountUi(p83, p84) --[[ Line: 268 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u8
        [3] = u12
        [4] = u22
    --]]
    if u4.isMobileControls() then
        u8.Controllers.MobileUiController:toggleMountMovementControls(true)
        p83.maid:GiveTask(function() --[[ Line: 271 ]]
            --[[
            Upvalues:
                [1] = u8
            --]]
            u8.Controllers.MobileUiController:toggleMountMovementControls(false)
        end)
    else
        local u85 = u12.mount(u12.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, { u12.createElement(u22) }), p84:WaitForChild("PlayerGui"))
        p83.maid:GiveTask(function() --[[ Line: 280 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u85
            --]]
            u12.unmount(u85)
        end)
    end
end
function u31.orientCamera(_, p86) --[[ Line: 285 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u14
    --]]
    if u17.CurrentCamera then
        u17.CurrentCamera.CameraSubject = p86
        u14.LocalPlayer.CameraMaxZoomDistance = 100
        u14.LocalPlayer.CameraMinZoomDistance = 60
    end
end
function u31.bindControls(u87) --[[ Line: 292 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    local v88 = u23.bindUpDownControls()
    u87.maid:GiveTask(v88.bindActionMaid)
    u87.maid:GiveTask(v88.shouldFlyUpRef.Changed:Connect(function(p89) --[[ Line: 295 ]]
        --[[
        Upvalues:
            [1] = u87
        --]]
        u87.upHeld = p89
        return u87.upHeld
    end))
    u87.maid:GiveTask(v88.shouldFlyDownRef.Changed:Connect(function(p90) --[[ Line: 299 ]]
        --[[
        Upvalues:
            [1] = u87
        --]]
        u87.downHeld = p90
        return u87.downHeld
    end))
end
v7.CreateController(u31.new())
return nil