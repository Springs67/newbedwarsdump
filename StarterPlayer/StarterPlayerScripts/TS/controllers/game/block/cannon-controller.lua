local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.CollectionTagAdded
local u6 = v4.SoundManager
local v7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.CollectionService
local u13 = v11.ContextActionService
local u14 = v11.Players
local u15 = v11.TweenService
local u16 = v11.Workspace
local u17 = u1.import(script, script.Parent.Parent.Parent, "global", "controls", "gamepad-util").GamepadUtil
local u18 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").getItemSkinMeta
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-types").ItemSkinType
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u23 = {
    u20.GOLD_VICTORIOUS_CANNON,
    u20.PLATINUM_VICTORIOUS_CANNON,
    u20.DIAMOND_VICTORIOUS_CANNON,
    u20.EMERALD_VICTORIOUS_CANNON,
    u20.NIGHTMARE_VICTORIOUS_CANNON
}
local u24 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 30 ]]
        return "CannonController"
    end,
    ["__index"] = u18
})
u24.__index = u24
function u24.new(...) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    local v25 = u24
    local v26 = setmetatable({}, v25)
    return v26:constructor(...) or v26
end
function u24.constructor(p27) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u10
        [3] = u2
    --]]
    u18.constructor(p27)
    p27.Name = "CannonController"
    p27.aimingMaid = u10.new()
    p27.aiming = false
    p27.actionBinderController = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController")
end
function u24.KnitStart(u28) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u9
        [3] = u17
        [4] = u14
        [5] = u8
        [6] = u20
        [7] = u23
        [8] = u15
        [9] = u21
        [10] = u22
        [11] = u3
        [12] = u19
        [13] = u6
    --]]
    u5("cannon", function(u29) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u17
            [3] = u14
            [4] = u28
            [5] = u8
            [6] = u20
            [7] = u23
            [8] = u15
        --]]
        local v30 = u29:GetAttribute("ItemSkin")
        u9.Controllers.ProximityPromptController:createProximityPrompt({
            ["Name"] = "AimPrompt",
            ["HoldDuration"] = 0.2,
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 10,
            ["ActionText"] = "Aim Cannon",
            ["ClickablePrompt"] = false,
            ["Parent"] = u29,
            ["GamepadKeyCode"] = u17.getGamepadKeybind("Ping")
        }).Triggered:Connect(function(p31) --[[ Line: 60 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u28
                [3] = u29
            --]]
            if p31 == u14.LocalPlayer then
                u28:startAiming(u29)
            end
        end)
        u9.Controllers.ProximityPromptController:createProximityPrompt({
            ["Name"] = "StopAimingPrompt",
            ["HoldDuration"] = 0,
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 10,
            ["ActionText"] = "Stop Aiming",
            ["Enabled"] = false,
            ["Parent"] = u29,
            ["GamepadKeyCode"] = u17.getGamepadKeybind("Ping")
        }).Triggered:Connect(function(p32) --[[ Line: 75 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u28
            --]]
            if p32 == u14.LocalPlayer then
                u28:stopAiming()
            end
        end)
        u9.Controllers.ProximityPromptController:createProximityPrompt({
            ["Name"] = "FirePrompt",
            ["HoldDuration"] = 0.4,
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 10,
            ["ActionText"] = "Shoot TNT",
            ["Enabled"] = false,
            ["ClickablePrompt"] = false,
            ["Parent"] = u29,
            ["GamepadKeyCode"] = Enum.KeyCode.ButtonA
        }).Triggered:Connect(function(p33) --[[ Line: 91 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u8
                [3] = u29
            --]]
            if p33 == u14.LocalPlayer then
                u8.Controllers.CannonHandController:fireCannon(u29)
            end
        end)
        u9.Controllers.ProximityPromptController:createProximityPrompt({
            ["Name"] = "LaunchSelfPrompt",
            ["HoldDuration"] = 0.4,
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 10,
            ["ActionText"] = "Launch Self",
            ["Enabled"] = true,
            ["ClickablePrompt"] = false,
            ["KeyboardKeyCode"] = Enum.KeyCode.X,
            ["GamepadKeyCode"] = u17.getGamepadKeybind("Interact"),
            ["UIOffset"] = Vector2.new(0, -80),
            ["Parent"] = u29
        }).Triggered:Connect(function(p34) --[[ Line: 109 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u8
                [3] = u29
            --]]
            if p34 == u14.LocalPlayer then
                u8.Controllers.CannonHandController:launchSelf(u29)
            end
        end)
        local u35 = v30 == u20.CANNON_GHOST and 90 or (v30 and table.find(u23, v30) ~= nil and 0 or (v30 == u20.CANNON_DEEPSEA and 0 or -90))
        local function u47() --[[ Line: 120 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u35
                [3] = u15
            --]]
            local v36 = u29:GetAttribute("LookVector") or Vector3.new()
            if u29:FindFirstChild("Base") then
                local v37 = u29.Base.Position
                local v38 = u29.Base.Position
                local v39 = v36 * Vector3.new(5, 0, 5)
                local v40 = u35
                local v41 = {
                    ["CFrame"] = CFrame.new(v37, v38 + v39) * CFrame.Angles(0, math.rad(v40), 0)
                }
                u15:Create(u29.Base, TweenInfo.new(0.2, Enum.EasingStyle.Linear), v41):Play()
            end
            if u29:FindFirstChild("Barrel") then
                local v42 = u29.Barrel.Position
                local v43 = u29.Barrel.Position
                local v44 = v36 * 5
                local v45 = u35
                local v46 = {
                    ["CFrame"] = CFrame.new(v42, v43 + v44) * CFrame.Angles(0, math.rad(v45), 0)
                }
                u15:Create(u29.Barrel, TweenInfo.new(0.2, Enum.EasingStyle.Linear), v46):Play()
            end
        end
        u29:GetAttributeChangedSignal("LookVector"):Connect(function() --[[ Line: 148 ]]
            --[[
            Upvalues:
                [1] = u47
            --]]
            u47()
        end)
        u47()
    end)
    u21.Client:WaitFor("CannonFired"):andThen(function(p48) --[[ Line: 156 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u22
            [3] = u3
            [4] = u19
            [5] = u6
        --]]
        p48:Connect(function(p49) --[[ Line: 157 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u22
                [3] = u3
                [4] = u19
                [5] = u6
            --]]
            local v50 = p49.player == u14.LocalPlayer
            local v51 = u22.CANNON_FIRE
            local v52 = u3:getStore():getBlockAt(p49.cannonBlockPos)
            local v53
            if v52 == nil then
                v53 = v52
            else
                v53 = v52:GetAttribute("ItemSkin")
            end
            if v53 then
                local v54 = u19(v53).davey
                if v54 ~= nil then
                    v54 = v54.cannonFireSound
                end
                if v54 ~= "" then
                    v51 = v54 or v51
                end
            end
            local v55 = u6
            local v56 = {
                ["rollOffMaxDistance"] = 220
            }
            local v57
            if v50 then
                v57 = nil
            else
                v57 = u3:getWorldPosition(p49.cannonBlockPos)
            end
            v56.position = v57
            v55:playSound(v51, v56)
            if v52 ~= nil then
                v52 = v52:FindFirstChild("Barrel")
                if v52 ~= nil then
                    v52 = v52:FindFirstChild("Attachment")
                end
            end
            if v52 then
                for v58, v59 in v52:GetDescendants() do
                    local _ = v58 - 1
                    if v59:IsA("ParticleEmitter") then
                        v59:Emit(10)
                    end
                end
            end
        end)
    end)
end
function u24.startAiming(u60, u61) --[[ Line: 204 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u16
        [3] = u14
        [4] = u1
        [5] = u21
        [6] = u3
        [7] = u13
    --]]
    u60:stopAiming()
    u60.aiming = true
    u60.aimingMaid:GiveTask(function() --[[ Line: 207 ]]
        --[[
        Upvalues:
            [1] = u60
        --]]
        u60.aiming = false
    end)
    u8.Controllers.CannonHandController:updateAllCannonPrompts()
    u60.aimingMaid:GiveTask(function() --[[ Line: 211 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        u8.Controllers.CannonHandController:updateAllCannonPrompts()
    end)
    u60.aimingMaid:GiveTask(u61.AncestryChanged:Connect(function(_, p62) --[[ Line: 214 ]]
        --[[
        Upvalues:
            [1] = u60
        --]]
        if p62 == nil then
            u60:stopAiming()
        end
    end))
    u16.CurrentCamera.CameraSubject = u61.Camera
    u14.LocalPlayer.CameraMinZoomDistance = 6.5
    u14.LocalPlayer.CameraMaxZoomDistance = 6.5
    u60.aimingMaid:GiveTask(function() --[[ Line: 222 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u16
        --]]
        local v63 = u14.LocalPlayer.Character
        if v63 ~= nil then
            v63 = v63:FindFirstChild("Humanoid")
        end
        u16.CurrentCamera.CameraSubject = v63
        u14.LocalPlayer.CameraMinZoomDistance = 0
        u14.LocalPlayer.CameraMaxZoomDistance = 14
    end)
    u1.Promise.defer(function() --[[ Line: 231 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u21
            [3] = u3
            [4] = u61
            [5] = u60
        --]]
        while true do
            local v64 = u16.CurrentCamera
            if v64 then
                local v65 = v64.CFrame.LookVector
                u21.Client:Get("AimCannon"):SendToServer({
                    ["cannonBlockPos"] = u3:getBlockPosition(u61.Position),
                    ["lookVector"] = v65
                })
            end
            local v66 = task.wait(0.2)
            if v66 ~= 0 and (v66 == v66 and v66) then
                v66 = u60.aiming
            end
            if v66 == 0 or (v66 ~= v66 or not v66) then
                return
            end
        end
    end)
    u13:BindAction("cannon-stop-aiming", function(_, _, _) --[[ Line: 253 ]]
        --[[
        Upvalues:
            [1] = u60
        --]]
        u60:stopAiming()
    end, false, Enum.UserInputType.MouseButton1, Enum.KeyCode.ButtonR2)
    u60.aimingMaid:GiveTask(function() --[[ Line: 256 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        u13:UnbindAction("cannon-stop-aiming")
    end)
    if u14.LocalPlayer.Character then
        local u67 = u14.LocalPlayer.Character:GetPrimaryPartCFrame().Position
        u1.Promise.defer(function() --[[ Line: 262 ]]
            --[[
            Upvalues:
                [1] = u60
                [2] = u14
                [3] = u67
            --]]
            while true do
                local v68 = task.wait(0.2)
                if v68 ~= 0 and (v68 == v68 and v68) then
                    v68 = u60.aiming
                end
                if v68 == 0 or (v68 ~= v68 or not v68) then
                    return
                end
                local v69 = u14.LocalPlayer.Character
                if v69 ~= nil then
                    v69 = v69:GetPrimaryPartCFrame().Position
                end
                if v69 == nil then
                    v69 = Vector3.new()
                end
                if (v69 - u67).Magnitude > 6 then
                    u60:stopAiming()
                end
            end
        end)
    end
end
function u24.stopAiming(p70) --[[ Line: 287 ]]
    p70.aimingMaid:DoCleaning()
end
function u24.isAiming(p71) --[[ Line: 290 ]]
    return p71.aiming
end
function u24.getCannons(_) --[[ Line: 293 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    return u12:GetTagged("cannon")
end
u8.CreateController(u24.new())
return nil