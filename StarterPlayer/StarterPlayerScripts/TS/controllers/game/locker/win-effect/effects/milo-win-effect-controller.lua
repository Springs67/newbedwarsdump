local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.MathExtras
local u5 = v2.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.CollectionService
local u16 = v14.Players
local u17 = v14.ReplicatedStorage
local u18 = v14.RunService
local u19 = v14.Workspace
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local v21 = v1.import(script, script.Parent.Parent.Parent.Parent, "movement", "event", "move-mount-event")
local u22 = v21.InputActionType
local u23 = v21.MoveMountDirection
local u24 = v1.import(script, script.Parent.Parent.Parent.Parent, "movement", "move-mount-ui").MoveMountUI
local u25 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "mount", "mount-flight-controls").MountFlightControls
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-util").getClosestBlockToWorldPosition
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cframe", "cframe-util").CFrameUtil
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "milo-win-effect-util").MiloWinEffectUtil
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u37 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u38 = v1.import(script, script.Parent.Parent, "win-effect").WinEffect
local u39 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 44 ]]
        return "MiloWinEffectController"
    end,
    ["__index"] = u38
})
u39.__index = u39
function u39.new(...) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u39
    --]]
    local v40 = u39
    local v41 = setmetatable({}, v40)
    return v41:constructor(...) or v41
end
function u39.constructor(p42) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u38
        [2] = u34
        [3] = u10
    --]]
    u38.constructor(p42, u34.DUST_DEVIL)
    p42.Name = "MiloWinEffectController"
    p42.upHeld = false
    p42.downHeld = false
    p42.maid = u10.new()
end
function u39.KnitStart(u43) --[[ Line: 61 ]]
    --[[
    Upvalues:
        [1] = u38
        [2] = u20
        [3] = u23
        [4] = u22
        [5] = u35
        [6] = u8
        [7] = u36
        [8] = u26
        [9] = u9
        [10] = u30
        [11] = u28
        [12] = u31
        [13] = u16
        [14] = u11
        [15] = u19
        [16] = u5
        [17] = u33
        [18] = u4
        [19] = u18
        [20] = u29
    --]]
    u38.KnitStart(u43)
    u43.maid:GiveTask(u20.MoveMountButtonChange:connect(function(p44) --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u43
            [3] = u22
        --]]
        local v45 = p44.direction
        if v45 == u23.UP then
            u43.upHeld = p44.inputActionType == u22.PRESS
        elseif v45 == u23.DOWN then
            u43.downHeld = p44.inputActionType == u22.PRESS
        end
    end))
    u35.Client:OnEvent("MiloWinEffectSetupComplete", function(p46) --[[ Line: 76 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u36
            [3] = u26
            [4] = u9
            [5] = u30
            [6] = u28
            [7] = u31
            [8] = u43
            [9] = u16
            [10] = u11
            [11] = u19
            [12] = u5
            [13] = u33
            [14] = u4
            [15] = u18
            [16] = u29
        --]]
        u8.Controllers.PreloadController:runPreload({
            ["sounds"] = { u36.DUST_DEVIL_LOOP, u36.DUST_DEVIL_PICKUP_LOOP },
            ["animations"] = { u26.DUST_DEVIL_PLAYER, u26.DUST_DEVIL_SPIN }
        })
        local u47 = p46.winningPlayer
        local u48 = u9.SingleMotor.new(0)
        local u49 = u47.Character
        local v50
        if u49 == nil then
            v50 = u49
        else
            v50 = u49.PrimaryPart
        end
        if not v50 then
            return nil
        end
        local u51 = u49:FindFirstChild("Humanoid")
        if not u51 then
            return nil
        end
        local v52 = u30:getEntity(u47)
        if not v52 then
            return nil
        end
        if not u49.PrimaryPart then
            return nil
        end
        local v53 = u28(u49.PrimaryPart.Position)
        local v54
        if v53 == nil then
            v54 = u31.GRASS
        else
            v54 = v53.Name
        end
        local u55 = u43:createBlock(u47, v54)
        if not u55 then
            return nil
        end
        if u16.LocalPlayer == u47 then
            u43:mountUi(u47)
            u43:bindControls()
            u43:orientCamera(u49.PrimaryPart)
        end
        v52:getInstance():SetAttribute("Transparency", 1)
        v52:hideNametag()
        u43:playEffect(u47)
        local v56 = u49.PrimaryPart
        local v57 = v56.AssemblyMass
        local v58 = u11
        local v59 = {
            ["Name"] = "AntiGrav"
        }
        local v60 = u19.Gravity * v57
        v59.Force = Vector3.new(0, v60, 0)
        v59.Parent = v56
        v58("BodyForce", v59)
        local v61 = u11("Attachment", {
            ["Parent"] = u49.PrimaryPart
        })
        u11("AngularVelocity", {
            ["MaxTorque"] = 5000,
            ["RelativeTo"] = Enum.ActuatorRelativeTo.Attachment0,
            ["Attachment0"] = v61,
            ["Parent"] = u49.PrimaryPart
        })
        u43.maid:GiveTask(u5:playSound(u36.UFO_ENGINE_LOOP, {
            ["looped"] = true,
            ["playbackSpeedMultiplier"] = 0.4,
            ["volumeMultiplier"] = 1.5,
            ["parent"] = u55
        }))
        local u62 = u55:GetScale()
        local u63 = nil
        u63 = u47.AttributeChanged:Connect(function(p64) --[[ Line: 156 ]]
            --[[
            Upvalues:
                [1] = u47
                [2] = u33
                [3] = u4
                [4] = u62
                [5] = u55
                [6] = u63
            --]]
            if p64 ~= "MiloWinEffect_BlockCount" then
                return nil
            end
            local v65 = u47:GetAttribute("MiloWinEffect_BlockCount") / u33.BLOCKS_TO_REACH_MAX_SCALE
            local v66 = math.clamp(v65, 0, 1)
            u55:ScaleTo((u4:lerp(u62, u33.MAX_SCALE, v66)))
            if v66 >= 1 then
                u63:Disconnect()
            end
        end)
        u18.Heartbeat:Connect(function(p67) --[[ Line: 169 ]]
            --[[
            Upvalues:
                [1] = u49
                [2] = u16
                [3] = u47
                [4] = u33
                [5] = u43
                [6] = u48
                [7] = u9
                [8] = u51
                [9] = u29
                [10] = u55
            --]]
            local v68 = u49
            if v68 ~= nil then
                v68 = v68.PrimaryPart
            end
            if not v68 then
                return nil
            end
            if u16.LocalPlayer == u47 then
                local v69 = u49.PrimaryPart.CFrame
                local v70 = CFrame.new(0, 0, -u33.SPEED * p67)
                u49.PrimaryPart.CFrame = v69 * v70
                if u43.upHeld and not u43.downHeld then
                    u48:setGoal(u9.Spring.new(10))
                elseif u43.downHeld and not u43.upHeld then
                    u48:setGoal(u9.Spring.new(-10))
                else
                    u48:setGoal(u9.Spring.new(0, {
                        ["frequency"] = 1
                    }))
                end
                local v71 = u49.PrimaryPart
                local v72 = u48:getValue()
                v71.AssemblyLinearVelocity = Vector3.new(0, v72, 0)
                u51:Move(Vector3.new(0, 0, 0))
            end
            u29.setPosition(u55, u49.PrimaryPart.Position)
            local v73 = u29.rotateLocalDegrees
            local v74 = u55
            local v75 = 60 * p67
            local v76 = 40 * p67
            local v77 = 10 * p67
            v73(v74, (Vector3.new(v75, v76, v77)))
        end)
    end)
end
function u39.onWin(_, _) --[[ Line: 206 ]] end
function u39.mountUi(p78, p79) --[[ Line: 208 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u8
        [3] = u12
        [4] = u24
    --]]
    if u3.isMobileControls() then
        u8.Controllers.MobileUiController:toggleMountMovementControls(true)
        p78.maid:GiveTask(function() --[[ Line: 211 ]]
            --[[
            Upvalues:
                [1] = u8
            --]]
            u8.Controllers.MobileUiController:toggleMountMovementControls(false)
        end)
    else
        local u80 = u12.mount(u12.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, { u12.createElement(u24) }), p79:WaitForChild("PlayerGui"))
        p78.maid:GiveTask(function() --[[ Line: 220 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u80
            --]]
            u12.unmount(u80)
        end)
    end
end
function u39.orientCamera(_, p81) --[[ Line: 225 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u16
    --]]
    if u19.CurrentCamera then
        u19.CurrentCamera.CameraSubject = p81
        u16.LocalPlayer.CameraMaxZoomDistance = 100
        u16.LocalPlayer.CameraMinZoomDistance = 60
    end
end
function u39.bindControls(u82) --[[ Line: 232 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    local v83 = u25.bindUpDownControls()
    u82.maid:GiveTask(v83.bindActionMaid)
    u82.maid:GiveTask(v83.shouldFlyUpRef.Changed:Connect(function(p84) --[[ Line: 235 ]]
        --[[
        Upvalues:
            [1] = u82
        --]]
        u82.upHeld = p84
        return u82.upHeld
    end))
    u82.maid:GiveTask(v83.shouldFlyDownRef.Changed:Connect(function(p85) --[[ Line: 239 ]]
        --[[
        Upvalues:
            [1] = u82
        --]]
        u82.downHeld = p85
        return u82.downHeld
    end))
end
function u39.createBlock(_, p86, p87) --[[ Line: 244 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u32
        [3] = u19
        [4] = u15
        [5] = u13
        [6] = u27
    --]]
    local v88 = u17:WaitForChild("Items"):WaitForChild(p87)
    local v89 = u32.cloneItemIntoModel(v88)
    local v90 = v89:FindFirstChildWhichIsA("BasePart")
    local v91 = p86.Character
    local v92
    if v91 == nil then
        v92 = v91
    else
        v92 = v91:FindFirstChildWhichIsA("Humanoid")
    end
    local v93
    if v91 == nil then
        v93 = v91
    else
        v93 = v91.PrimaryPart
    end
    if not (v90 and (v91 and (v92 and v93))) then
        v89:Destroy()
        return nil
    end
    v89.Parent = u19
    local v94 = p86.UserId
    v89.Name = "DisguisedPlayerBlock_" .. tostring(v94)
    for v95, v96 in v89:GetDescendants() do
        local _ = v95 - 1
        if v96:IsA("BasePart") then
            v96.CanCollide = false
            v96.CanQuery = false
            v96.CanQuery = false
            v96.Anchored = true
        end
    end
    u15:AddTag(v89, "DontBlockSwordRaycast")
    u13(v89, u27 / 2.8 * 2)
    local v97 = v93.Size.Y / 2 + v92.HipHeight - u27 / 2
    v89:PivotTo(v93.CFrame - Vector3.new(0, v97, 0))
    return v89
end
function u39.playEffect(_, p98) --[[ Line: 291 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u36
        [3] = u17
        [4] = u19
        [5] = u37
        [6] = u5
    --]]
    local v99 = p98.Character
    if v99 ~= nil then
        v99 = v99.PrimaryPart
        if v99 ~= nil then
            v99 = v99.Position
        end
    end
    if not v99 then
        return nil
    end
    local v100 = u30:getEntity(p98)
    local v101 = u36.MIMIC_HIDE
    if v100 then
        local v102 = u17.Assets.Effects.MimicBlockEffect:Clone()
        v102.Parent = u19
        v102.Position = v99
        u37:playEffects({ v102 }, nil, {
            ["destroyAfterSec"] = 1
        })
    end
    u5:playSound(v101, {
        ["volumeMultiplier"] = 0.25,
        ["position"] = v99
    })
end
v7.CreateController(u39.new())
return nil