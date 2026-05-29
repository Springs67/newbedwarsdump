local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local v3 = v2.ConstantManager
local u4 = v2.DeviceUtil
local u5 = v2.GameCoreSharedSyncEvents
local u6 = v2.GameQueryUtil
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u8 = v7.KnitClient
local u9 = v7.Signal
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.CollectionService
local u15 = v13.ContextActionService
local u16 = v13.HttpService
local u17 = v13.Players
local u18 = v13.ReplicatedStorage
local u19 = v13.RunService
local u20 = v13.Workspace
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u22 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local v24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util")
local u25 = v24.GameAnimationUtil
local u26 = v24.getAnimationFromAssetId
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "logger-provider").LoggerProvider
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u31 = v1.import(script, script.Parent, "viewmodel-mode").ViewmodelMode
local u32 = v3.registerConstants(script, {
    ["DEPTH_OFFSET"] = 0,
    ["VERTICAL_OFFSET"] = 0,
    ["HORIZONTAL_OFFSET"] = 0
})
local u33 = {
    Enum.HumanoidStateType.Jumping,
    Enum.HumanoidStateType.FallingDown,
    Enum.HumanoidStateType.Freefall,
    Enum.HumanoidStateType.Flying
}
local u34 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 44 ]]
        return "ViewmodelController"
    end,
    ["__index"] = u22
})
u34.__index = u34
function u34.new(...) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u34
    --]]
    local v35 = u34
    local v36 = setmetatable({}, v35)
    return v36:constructor(...) or v36
end
function u34.constructor(p37) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u9
        [3] = u10
        [4] = u31
        [5] = u28
    --]]
    u22.constructor(p37)
    p37.Name = "ViewmodelController"
    p37.heldItemChangedSignal = u9.new()
    p37.heldItemMaid = u10.new()
    p37.crosshair = false
    p37.crosshairMaid = u10.new()
    p37.unlockCamera = false
    p37.viewmodelMode = u31.DEFAULT
    p37.viewmodelMaid = u10.new()
    p37.disableKeys = {}
    p37.handItemVisibility = true
    p37.firstPersonActive = false
    p37.shiftlockActive = false
    p37.logger = u28.getLogger("ViewmodelController")
end
function u34.KnitStart(u38) --[[ Line: 70 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u21
        [3] = u19
        [4] = u15
    --]]
    u38:setupViewmodel()
    if u38.shiftlockActive then
        u38.crosshairMaid:DoCleaning()
        u38:setMouseIcon("rbxasset://textures/MouseLockedCursor.png")
    elseif u38.firstPersonActive then
        u38:showCrosshair()
    else
        u38:hideCrosshair()
    end
    u8.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(p39) --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u38
        --]]
        u38.firstPersonActive = p39 == 0
        if u38.shiftlockActive then
            u38.crosshairMaid:DoCleaning()
            u38:setMouseIcon("rbxasset://textures/MouseLockedCursor.png")
            return
        elseif u38.firstPersonActive then
            u38:showCrosshair()
        else
            u38:hideCrosshair()
        end
    end)
    u21.ShiftLockToggle:connect(function(p40) --[[ Line: 89 ]]
        --[[
        Upvalues:
            [1] = u38
        --]]
        u38.shiftlockActive = p40.enabled
        if u38.shiftlockActive then
            u38.crosshairMaid:DoCleaning()
            u38:setMouseIcon("rbxasset://textures/MouseLockedCursor.png")
            return
        elseif u38.firstPersonActive then
            u38:showCrosshair()
        else
            u38:hideCrosshair()
        end
    end)
    if u19:IsStudio() then
        u15:BindAction("camera-unlock", function(_, p41, _) --[[ Line: 95 ]]
            --[[
            Upvalues:
                [1] = u38
            --]]
            if not u38.viewmodel then
                return nil
            end
            if p41 == Enum.UserInputState.Begin then
                u38.unlockCamera = not u38.unlockCamera
                if u38.unlockCamera then
                    for _, v42 in u38.viewmodel:GetDescendants() do
                        if v42:IsA("BasePart") then
                            v42:SetAttribute("unlockcamera_transparency", v42.Transparency)
                            v42.Transparency = 0
                        end
                    end
                    return
                end
                for _, v43 in u38.viewmodel:GetDescendants() do
                    if v43:IsA("BasePart") and v43:GetAttribute("unlockcamera_transparency") ~= nil then
                        v43.Transparency = v43:GetAttribute("unlockcamera_transparency")
                    end
                end
            end
        end, false, Enum.KeyCode.LeftBracket)
    end
end
function u34.setupViewmodel(u44, p45) --[[ Line: 119 ]]
    --[[
    Upvalues:
        [1] = u31
        [2] = u17
        [3] = u18
        [4] = u14
        [5] = u20
        [6] = u6
        [7] = u19
        [8] = u32
    --]]
    u44.viewmodelMaid:DoCleaning()
    if u44.viewmodelMode == u31.SHOW_ARMS then
        u44.viewmodelMaid:GiveTask(u17.LocalPlayer.CharacterAdded:Connect(function(_) --[[ Line: 122 ]]
            --[[
            Upvalues:
                [1] = u44
            --]]
            u44:setupViewmodel()
        end))
    end
    local v46 = u18:WaitForChild("Assets"):WaitForChild("Viewmodel"):Clone()
    if not p45 then
        if u44.viewmodelMode == u31.SHOW_ARMS then
            local v47 = u17.LocalPlayer.Character
            if not v47 then
                return false
            end
            v47.Archivable = true
            v47:WaitForChild("Humanoid"):WaitForChild("Animator")
            p45 = v47:Clone()
            u14:RemoveTag(p45, "entity")
        else
            p45 = v46
        end
    end
    u44.viewmodel = p45
    u44.viewmodelMaid:GiveTask(u44.viewmodel)
    for _, v48 in u44.viewmodel:GetDescendants() do
        local v49 = v48:GetAttribute("VisibleInViewmodel")
        if v48:IsA("BasePart") then
            v48.CollisionGroup = "Players"
            v48.CastShadow = false
            v48:SetAttribute("ViewmodelPart", true)
            local v50 = true
            if u44.viewmodelMode == u31.SHOW_ARMS then
                for _, v51 in { "Left", "Right" } do
                    local v52 = { v51 .. "UpperArm", v51 .. "LowerArm", v51 .. "Hand" }
                    local v53 = v48.Name
                    if table.find(v52, v53) ~= nil then
                        v50 = false
                        break
                    end
                end
            end
            if v50 and v49 ~= true then
                v48.Transparency = 1
            end
        end
    end
    task.spawn(function() --[[ Line: 169 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u44
            [3] = u6
        --]]
        u20:WaitForChild("ClientFlameReady")
        local v54 = u44.viewmodel
        if v54 ~= nil then
            v54 = v54:GetDescendants()
        end
        for _, v55 in v54 == nil and {} or v54 do
            if v55:IsA("BasePart") then
                u6:setQueryIgnored(v55, true)
            end
        end
    end)
    u44.animator = u44.viewmodel:WaitForChild("Humanoid"):WaitForChild("Animator")
    u44.viewmodelMaid:GiveTask(u44.animator)
    if u44.viewmodelMode == u31.SHOW_ARMS then
        u44.viewmodelMaid:GiveTask(u44:setupFirstPersonHandAnimations())
    end
    local v56 = v46:FindFirstChild("Head")
    local u57 = v46.PrimaryPart.CFrame - v56.CFrame.Position
    u44.viewmodelMaid:GiveTask(u19.RenderStepped:Connect(function(_) --[[ Line: 196 ]]
        --[[
        Upvalues:
            [1] = u44
            [2] = u20
            [3] = u57
            [4] = u32
            [5] = u31
        --]]
        if u44.unlockCamera then
            return nil
        elseif u44.viewmodel then
            if u44.viewmodel.Parent ~= u20.CurrentCamera then
                u44.logger:Debug("View Model\'s Parent is Incorrect!")
            end
            local v58 = u20.CurrentCamera
            if u44.firstPersonActive and not u44:isDisabled() then
                local v59 = v58.CFrame * u57
                local v60 = CFrame.new
                local v61 = u32.HORIZONTAL_OFFSET
                local v62 = u32.VERTICAL_OFFSET
                local v63 = u32.DEPTH_OFFSET
                local v64 = v59 * v60((Vector3.new(v61, v62, v63)))
                local v65 = 0
                local v66 = u44.viewmodelMode == u31.SHOW_ARMS and -0.8 or 0
                local v67 = u44.itemMeta
                if v67 ~= nil then
                    v67 = v67.block
                end
                if v67 then
                    v66 = -0.5
                else
                    local v68 = u44.itemMeta
                    if v68 ~= nil then
                        v68 = v68.firstPerson
                        if v68 ~= nil then
                            v68 = v68.verticalOffset
                        end
                    end
                    if v68 ~= nil then
                        v66 = u44.itemMeta.firstPerson.verticalOffset
                    end
                end
                local v69 = u44.itemMeta
                if v69 ~= nil then
                    v69 = v69.firstPerson
                    if v69 ~= nil then
                        v69 = v69.horizontalOffset
                    end
                end
                if v69 ~= nil then
                    v65 = u44.itemMeta.firstPerson.horizontalOffset
                end
                if v66 ~= 0 or v65 ~= 0 then
                    v64 = v64 * CFrame.new((Vector3.new(v65, v66, 0)))
                end
                u44.viewmodel:PivotTo(v64)
            else
                u44.viewmodel:PivotTo(CFrame.new(Vector3.new(-9999, 0, -9999)))
            end
        else
            u44.logger:Debug("View Model Not Found!")
            return nil
        end
    end))
    u44.viewmodel.Parent = u20.CurrentCamera
    if u44.viewmodel.PrimaryPart then
        u44.viewmodel.PrimaryPart.Anchored = true
    end
    return true
end
function u34.setViewModelMode(u70, u71) --[[ Line: 262 ]]
    --[[
    Upvalues:
        [1] = u31
        [2] = u8
        [3] = u23
    --]]
    if u71 == u70.viewmodelMode then
        return nil
    end
    u70.viewmodelMode = u71
    task.spawn(function() --[[ Line: 267 ]]
        --[[
        Upvalues:
            [1] = u71
            [2] = u31
            [3] = u8
            [4] = u23
            [5] = u70
        --]]
        if u71 == u31.SHOW_ARMS then
            u8.Controllers.PreloadController:runPreload({
                ["animations"] = { u23.FP_HANDS_RUNNING_HEAD, u23.FP_HANDS_RUNNING_LEFT_ARM, u23.FP_HANDS_RUNNING_RIGHT_ARM }
            })
        end
        u70:setupViewmodel()
    end)
end
function u34.setupFirstPersonHandAnimations(u72) --[[ Line: 276 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u17
        [3] = u8
        [4] = u23
        [5] = u27
    --]]
    local u73 = u10.new()
    local u74 = false
    local u75 = u10.new()
    u73:GiveTask(u75)
    local u76 = true
    u73:GiveTask(function() --[[ Line: 286 ]]
        --[[
        Upvalues:
            [1] = u76
        --]]
        u76 = false
    end)
    task.spawn(function() --[[ Line: 289 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u76
            [3] = u73
            [4] = u74
            [5] = u75
            [6] = u8
            [7] = u23
            [8] = u72
            [9] = u27
        --]]
        local u77 = u17.LocalPlayer.Character
        if u77 ~= nil then
            u77 = u77:WaitForChild("Humanoid", 15)
        end
        if not (u77 and u76) then
            return nil
        end
        u73:GiveTask(u77.Died:Connect(function() --[[ Line: 298 ]]
            --[[
            Upvalues:
                [1] = u73
            --]]
            u73:DoCleaning()
        end))
        u73:GiveTask(u77:GetPropertyChangedSignal("MoveDirection"):Connect(function() --[[ Line: 301 ]]
            --[[
            Upvalues:
                [1] = u77
                [2] = u74
                [3] = u75
                [4] = u8
                [5] = u23
                [6] = u72
                [7] = u27
            --]]
            if u77.MoveDirection.Magnitude == 0 ~= u74 then
                return nil
            end
            u74 = u77.MoveDirection.Magnitude > 0
            if not u74 then
                u75:DoCleaning()
                return nil
            end
            local u78 = u8.Controllers.ViewmodelController:playAnimation(u23.FP_HANDS_RUNNING_LEFT_ARM, {
                ["looped"] = true,
                ["fadeTime"] = 0.2,
                ["keepEnabledOnUnequipItem"] = true,
                ["priority"] = Enum.AnimationPriority.Movement
            })
            local u79 = u8.Controllers.ViewmodelController:playAnimation(u23.FP_HANDS_RUNNING_RIGHT_ARM, {
                ["looped"] = true,
                ["fadeTime"] = 0.2,
                ["keepEnabledOnUnequipItem"] = true,
                ["priority"] = Enum.AnimationPriority.Movement
            })
            if not (u78 and u79) then
                return nil
            end
            local u80 = { u78, u79 }
            u75:GiveTask(function() --[[ Line: 326 ]]
                --[[
                Upvalues:
                    [1] = u80
                --]]
                for v81, v82 in u80 do
                    local _ = v81 - 1
                    if v82 ~= nil then
                        v82:Stop(0.4)
                    end
                end
                return nil
            end)
            local u88 = u72.heldItemChangedSignal:Connect(function(p83) --[[ Line: 339 ]]
                --[[
                Upvalues:
                    [1] = u72
                    [2] = u79
                    [3] = u27
                    [4] = u8
                    [5] = u23
                    [6] = u80
                    [7] = u78
                --]]
                if u72.heldItem then
                    local v84 = u79
                    if v84 ~= nil then
                        v84:Stop(0.4)
                        return
                    end
                else
                    local v85
                    if p83 then
                        v85 = u27(p83.Name)
                    else
                        v85 = nil
                    end
                    if v85 ~= nil then
                        v85 = v85.disableFirstPersonHoldAnimation
                    end
                    if v85 == true then
                        return nil
                    end
                    u79 = u8.Controllers.ViewmodelController:playAnimation(u23.FP_HANDS_RUNNING_RIGHT_ARM, {
                        ["looped"] = true,
                        ["fadeTime"] = 0.2,
                        ["keepEnabledOnUnequipItem"] = true,
                        ["priority"] = Enum.AnimationPriority.Movement
                    })
                    if u79 then
                        local v86 = u79
                        local v87 = u80
                        table.insert(v87, v86)
                        u79.TimePosition = u78.TimePosition
                        u79:AdjustSpeed(u78.Speed)
                    end
                end
            end)
            if u72.heldItem then
                u79:Stop(0.4)
            end
            u75:GiveTask(function() --[[ Line: 371 ]]
                --[[
                Upvalues:
                    [1] = u88
                --]]
                return u88:Disconnect()
            end)
            local function u92(p89) --[[ Line: 374 ]]
                --[[
                Upvalues:
                    [1] = u80
                --]]
                for v90, v91 in u80 do
                    local _ = v90 - 1
                    if v91 ~= nil then
                        v91:AdjustSpeed(p89 / 24)
                    end
                end
            end
            u92(u77.WalkSpeed)
            u75:GiveTask(u77:GetPropertyChangedSignal("WalkSpeed"):Connect(function() --[[ Line: 387 ]]
                --[[
                Upvalues:
                    [1] = u92
                    [2] = u77
                --]]
                u92(u77.WalkSpeed)
            end))
        end))
    end)
    return u73
end
function u34.showCrosshair(u93) --[[ Line: 394 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u11
        [3] = u17
    --]]
    u93.crosshair = true
    if u4.isMobileControls() then
        local v94 = u11.createElement("ScreenGui", {
            ["IgnoreGuiInset"] = true
        }, { u11.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["BackgroundTransparency"] = 1,
                ["Image"] = "rbxassetid://8099581307",
                ["Size"] = UDim2.fromScale(0.04, 0.04),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["ResampleMode"] = Enum.ResamplerMode.Pixelated
            }) })
        local u95 = u11.mount(v94, u17.LocalPlayer:WaitForChild("PlayerGui"))
        u93.crosshairMaid:GiveTask(function() --[[ Line: 411 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u95
            --]]
            u11.unmount(u95)
        end)
    else
        u93:setMouseIcon("rbxassetid://8099700275")
        u93.crosshairMaid:GiveTask(function() --[[ Line: 416 ]]
            --[[
            Upvalues:
                [1] = u93
            --]]
            u93:clearMouseIcon()
        end)
    end
end
function u34.hideCrosshair(p96) --[[ Line: 421 ]]
    p96.crosshair = false
    p96.crosshairMaid:DoCleaning()
    p96:clearMouseIcon()
end
function u34.isDisabled(p97) --[[ Line: 426 ]]
    local v98 = 0
    for _ in p97.disableKeys do
        v98 = v98 + 1
    end
    return v98 > 0
end
function u34.addDisabler(p99) --[[ Line: 435 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v100 = u16:GenerateGUID(false)
    p99.disableKeys[v100] = true
    return v100
end
function u34.removeDisabler(p101, p102) --[[ Line: 440 ]]
    p101.disableKeys[p102] = nil
end
function u34.setHeldItem(p103, p104) --[[ Line: 445 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u12
        [3] = u29
        [4] = u6
        [5] = u30
        [6] = u10
        [7] = u21
        [8] = u23
        [9] = u17
        [10] = u33
    --]]
    p103.logger:Debug("View Model Set Held Item: " .. tostring(p104))
    if p103.heldItem then
        p103.heldItemMaid:DoCleaning()
        p103.heldItem:Destroy()
        p103.heldItem = nil
        p103.itemMeta = nil
        p103.heldItemChangedSignal:Fire(nil)
    end
    if not p103.viewmodel then
        return nil
    end
    if p104 then
        local v105 = u27(p104.Name)
        local v106 = Instance.new("Model")
        p104.Parent = v106
        local v107 = p104:FindFirstChild("Handle")
        if not v107 then
            return nil
        end
        v106.PrimaryPart = v107
        local v108 = v105.firstPerson
        if v108 ~= nil then
            v108 = v108.scale
        end
        local v109 = v108 == nil and 1 or v108
        u12(v106, v109)
        u29:scaleEffect({ v106 }, v109)
        for v110, v111 in p104:GetDescendants() do
            local _ = v110 - 1
            if v111:IsA("BasePart") then
                v111.CanCollide = false
                u6:setQueryIgnored(v111, true)
            end
        end
        p103.heldItem = p104
        p103.itemMeta = v105
        p103.heldItemChangedSignal:Fire(p104)
        p103.viewmodel:FindFirstChild("Humanoid"):AddAccessory(p104)
        u30:weldCharacterAccessories(p103.viewmodel)
        local v112 = u10.new()
        p103.heldItemMaid:GiveTask(v112)
        u21.ViewModelItemAdded:fire(p104, v112)
        local v113 = v105.firstPerson
        if v113 ~= nil then
            v113 = v113.holdAnimation
        end
        if v113 == 0 or (v113 ~= v113 or not v113) then
            v113 = u23.FP_HOLD
        end
        local u114 = p103:playAnimation(v113, {
            ["looped"] = true,
            ["priority"] = Enum.AnimationPriority.Idle
        })
        p103.heldItemMaid:GiveTask(function() --[[ Line: 516 ]]
            --[[
            Upvalues:
                [1] = u114
            --]]
            local v115 = u114
            if v115 ~= nil then
                v115:Stop()
            end
            local v116 = u114
            if v116 ~= nil then
                v116:Destroy()
            end
        end)
        local u117
        if v105.disableFirstPersonWalkAnimation then
            u117 = nil
        else
            u117 = p103:playAnimation(u23.FP_WALK, {
                ["looped"] = true,
                ["priority"] = Enum.AnimationPriority.Movement
            })
        end
        local u118 = true
        p103.heldItemMaid:GiveTask(function() --[[ Line: 536 ]]
            --[[
            Upvalues:
                [1] = u118
                [2] = u117
            --]]
            u118 = false
            local v119 = u117
            if v119 ~= nil then
                v119:Stop()
            end
            local v120 = u117
            if v120 ~= nil then
                v120:Destroy()
            end
        end)
        task.spawn(function() --[[ Line: 547 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u118
                [3] = u33
                [4] = u117
            --]]
            local v121 = u17.LocalPlayer.Character
            if v121 ~= nil then
                v121 = v121.PrimaryPart
            end
            local v122 = u17.LocalPlayer.Character
            if v122 ~= nil then
                v122 = v122:FindFirstChild("Humanoid")
            end
            local v123 = 0
            while true do
                local v124 = task.wait(0.1)
                if v124 ~= 0 and (v124 == v124 and v124) then
                    v124 = u118
                end
                if v124 == 0 or (v124 ~= v124 or not v124) then
                    return
                end
                if not v121 then
                    return nil
                end
                local v125 = v121.Velocity.Magnitude / 14
                local v126 = math.clamp(v125, 0, 2) * 1.2
                if v122 then
                    local v127 = v122:GetState()
                    v126 = table.find(u33, v127) ~= nil and 0 or v126
                end
                if v126 <= 0.01 then
                    local v128 = u117
                    if v128 ~= nil then
                        v128 = v128.IsPlaying
                    end
                    if v128 then
                        v123 = u117.TimePosition
                        local v129 = u117
                        if v129 ~= nil then
                            v129:Stop(0.3)
                        end
                    end
                else
                    local v130 = u117
                    if v130 ~= nil then
                        v130 = v130.IsPlaying
                    end
                    if not v130 then
                        local v131 = u117
                        if v131 ~= nil then
                            v131:AdjustSpeed(v123)
                        end
                        local v132 = u117
                        if v132 ~= nil then
                            v132:Play(0.3)
                        end
                    end
                end
                if v126 ~= nil then
                    local v133 = u117
                    if v133 ~= nil then
                        v133:AdjustSpeed(v126)
                    end
                end
            end
        end)
    end
end
function u34.startWalkingAnimation(p134) --[[ Line: 620 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    local u135 = p134:playAnimation(u23.FP_WALK, {
        ["looped"] = true,
        ["priority"] = Enum.AnimationPriority.Movement
    })
    p134.heldItemMaid:GiveTask(function() --[[ Line: 625 ]]
        --[[
        Upvalues:
            [1] = u135
        --]]
        local v136 = u135
        if v136 ~= nil then
            v136:Stop()
        end
        local v137 = u135
        if v137 ~= nil then
            v137:Destroy()
        end
    end)
end
function u34.playAnimation(p138, p139, u140) --[[ Line: 636 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u17
        [3] = u25
        [4] = u26
    --]]
    if not p138.animator then
        return nil
    end
    local v141 = u5.BeforeAnimationPlayEvent:fire(u17.LocalPlayer, u25:getAssetId(p139))
    if v141:isCancelled() then
        return nil
    end
    local v142 = u25:getAssetId(p139)
    local v143 = v141.animationAssetIdOverride
    if v143 ~= "" and v143 then
        v142 = v141.animationAssetIdOverride
    end
    local v144 = u26(v142)
    local u145 = p138.animator:LoadAnimation(v144)
    local v146
    if u140 == nil then
        v146 = u140
    else
        v146 = u140.looped
    end
    if v146 == nil then
        v146 = false
    end
    u145.Looped = v146
    local v147
    if u140 == nil then
        v147 = u140
    else
        v147 = u140.priority
    end
    if v147 == nil then
        v147 = Enum.AnimationPriority.Action
    end
    u145.Priority = v147
    u145:Play()
    local v148
    if u140 == nil then
        v148 = u140
    else
        v148 = u140.keepEnabledOnUnequipItem
    end
    if not v148 then
        p138.heldItemMaid:GiveTask(function() --[[ Line: 675 ]]
            --[[
            Upvalues:
                [1] = u145
                [2] = u140
            --]]
            local v149 = u145
            local v150 = u140
            if v150 ~= nil then
                v150 = v150.fadeTime
            end
            if v150 == nil then
                v150 = nil
            end
            v149:Stop(v150)
        end)
    end
    return u145
end
function u34.addAccessory(p151, p152) --[[ Line: 690 ]]
    --[[
    Upvalues:
        [1] = u30
    --]]
    if not p151.viewmodel then
        warn("No viewmodel found.")
        return nil
    end
    local v153 = p151.viewmodel:FindFirstChild("Humanoid")
    if not v153 then
        warn("No humanoid found for viewmodel.")
        return nil
    end
    v153:AddAccessory(p152)
    u30:weldCharacterAccessories(p151.viewmodel)
    if p151.handItemVisibility == false then
        p151:setHandItemVisibility(p151.handItemVisibility)
    end
end
function u34.isVisible(p154) --[[ Line: 706 ]]
    return p154.firstPersonActive
end
function u34.getViewModel(p155) --[[ Line: 709 ]]
    return p155.viewmodel
end
function u34.setHandItemVisibilityMode(p156, p157) --[[ Line: 712 ]]
    p156.handItemVisibility = p157
    p156:setHandItemVisibility(p157)
end
function u34.setHandItemVisibility(p158, p159) --[[ Line: 716 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    if p158.heldItem then
        if p159 then
            u14:RemoveTag(p158.heldItem, "FirstPersonHidden")
            for v160, v161 in p158.heldItem:GetDescendants() do
                local _ = v160 - 1
                u14:RemoveTag(v161, "FirstPersonHidden")
            end
        else
            u14:AddTag(p158.heldItem, "FirstPersonHidden")
            for v162, v163 in p158.heldItem:GetDescendants() do
                local _ = v162 - 1
                u14:AddTag(v163, "FirstPersonHidden")
            end
        end
    else
        return nil
    end
end
function u34.setMouseIcon(_, p164) --[[ Line: 740 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17.LocalPlayer:GetMouse().Icon = p164
end
function u34.clearMouseIcon(p165) --[[ Line: 743 ]]
    p165:setMouseIcon("")
end
function u34.getFirstPersonHandItem(p166) --[[ Line: 746 ]]
    return p166.heldItem
end
return {
    ["ViewmodelController"] = u8.CreateController(u34.new())
}