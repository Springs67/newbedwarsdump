local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ActionButton
local u5 = v3.ColorUtil
local v6 = v3.ConstantManager
local u7 = v3.DeviceUtil
local u8 = v3.GamepadAction
local u9 = v3.MobileButton
local u10 = v3.SoundManager
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u12 = v11.KnitClient
local u13 = v11.KnitClient
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u18 = v17.CollectionService
local u19 = v17.Players
local u20 = v17.RunService
local u21 = v17.TweenService
local u22 = v17.Workspace
local u23 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u24 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI
local u25 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local v26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "knockback-util").KnockbackUtil
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u36 = { v26.HANG_GLIDER_ARM, v26.HANG_GLIDER_BODY }
local u37 = v6.registerConstants(script, {
    ["DragConstant"] = 6
})
local u38 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 46 ]]
        return "HangGliderController"
    end,
    ["__index"] = u23
})
u38.__index = u38
function u38.new(...) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u38
    --]]
    local v39 = u38
    local v40 = setmetatable({}, v39)
    return v40:constructor(...) or v40
end
function u38.constructor(p41, ...) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u14
    --]]
    u23.constructor(p41, ...)
    p41.Name = "HangGliderController"
    p41.maid = u14.new()
    p41.activeGliderMaid = u14.new()
    p41.acceptedGlidingStates = {
        [Enum.HumanoidStateType.FallingDown] = true,
        [Enum.HumanoidStateType.Flying] = true,
        [Enum.HumanoidStateType.Jumping] = true,
        [Enum.HumanoidStateType.Freefall] = true
    }
    p41.hangGliderActive = false
    p41.hangGliderActivateTime = 0
    p41.activeForces = {}
end
function u38.KnitStart(u42) --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u12
        [3] = u31
        [4] = u36
        [5] = u32
        [6] = u10
        [7] = u33
        [8] = u18
        [9] = u21
        [10] = u19
    --]]
    u23.KnitStart(u42)
    local v43 = {
        ["animations"] = u36
    }
    u12.Controllers.PreloadController:preloadForItemType(u31.HANG_GLIDER, v43)
    u32.Client:OnEvent("HangGliderStateChanged", function(p44) --[[ Line: 76 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u33
            [3] = u18
            [4] = u21
        --]]
        local v45 = p44.player
        local v46 = v45.Character
        if p44.active and v46 then
            local v47 = u10:playModifiableSound(u33.GLIDER_GLIDE, {
                ["rollOffMaxDistance"] = 150,
                ["volumeMultiplier"] = 0,
                ["parent"] = v46.PrimaryPart,
                ["position"] = v46:GetPrimaryPartCFrame().Position
            })
            if v47 then
                v47.Looped = true
                u18:AddTag(v47, v45.Name .. ":glider_loop_sound")
                u21:Create(v47, TweenInfo.new(0.6), {
                    ["Volume"] = 2
                }):Play()
                return
            end
        else
            for _, v48 in u18:GetTagged(v45.Name .. ":glider_loop_sound") do
                v48:Stop()
                v48:Destroy()
            end
        end
    end)
    local v49 = u19.LocalPlayer.Character
    if v49 then
        u42:registerCharacter(v49)
    end
    u19.LocalPlayer.CharacterAdded:Connect(function(p50) --[[ Line: 105 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        u42:registerCharacter(p50)
    end)
    u32.Client:OnEvent("HangGliderStateChanged", function(p51) --[[ Line: 108 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u42
        --]]
        if p51.active == false and p51.player.UserId == u19.LocalPlayer.UserId then
            u42:closeHangGlider()
        end
    end)
end
function u38.registerCharacter(u52, p53) --[[ Line: 114 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    p53:WaitForChild("Humanoid").StateChanged:Connect(function(_, p54) --[[ Line: 117 ]]
        --[[
        Upvalues:
            [1] = u52
            [2] = u22
        --]]
        local v55 = u52.acceptedGlidingStates[p54] == nil
        if v55 then
            v55 = u52.hangGliderActive
            if v55 then
                v55 = u22:GetServerTimeNow() - u52.hangGliderActivateTime > 0.18
            end
        end
        if v55 then
            u52:sendCloseHangGliderEvent()
        end
    end)
end
function u38.openHangGlider(u56) --[[ Line: 129 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u32
        [3] = u22
        [4] = u28
        [5] = u13
        [6] = u36
        [7] = u27
        [8] = u15
        [9] = u20
        [10] = u37
        [11] = u7
        [12] = u16
        [13] = u30
        [14] = u24
        [15] = u9
        [16] = u2
        [17] = u4
        [18] = u8
    --]]
    local u57 = u19.LocalPlayer.Character
    local v58
    if u57 == nil then
        v58 = u57
    else
        v58 = u57.PrimaryPart
    end
    if not v58 then
        return nil
    end
    u32.Client:Get("HangGliderUse"):SendToServer({})
    local v59 = u22.CurrentCamera.CFrame.LookVector
    local v60 = v59.X
    local v61 = v59.Z
    local v62 = Vector3.new(v60, 0, v61)
    local v63 = v62.Magnitude == 0 and Vector3.new(1, 0, 0) or v62
    local v64 = u28
    local v65 = u57.PrimaryPart
    local v66 = u57.PrimaryPart.AssemblyMass
    local v67 = v63.Unit * 200
    v64.applyKnockbackDirection(v65, v66, v67 + Vector3.new(0, 200, 0), {
        ["vertical"] = 8,
        ["horizontal"] = 2
    })
    u56.hangGliderActivateTime = u22:GetServerTimeNow()
    u56.hangGliderActive = true
    task.delay(0.2, function() --[[ Line: 156 ]]
        --[[
        Upvalues:
            [1] = u56
        --]]
        if not u56:canOpenHangGlider() and u56.hangGliderActive then
            u56:sendCloseHangGliderEvent()
        end
    end)
    local v68 = u13.Controllers.SprintController:getMovementStatusModifier():addModifier({
        ["blockSprint"] = true,
        ["constantSpeedMultiplier"] = 2.5
    })
    u56.activeGliderMaid:GiveTask(v68)
    u13.Controllers.MobileShiftLockController:enable(false)
    for _, v69 in u36 do
        local u70 = u27:playAnimation(u19.LocalPlayer, v69, {
            ["looped"] = true
        })
        u56.activeGliderMaid:GiveTask(function() --[[ Line: 174 ]]
            --[[
            Upvalues:
                [1] = u70
            --]]
            local v71 = u70
            if v71 ~= nil then
                v71:Stop()
            end
        end)
    end
    local u72 = u57:WaitForChild("Humanoid")
    local v73 = {
        ["Name"] = "LiftForce",
        ["Force"] = Vector3.new(0, 0, 0),
        ["ApplyAtCenterOfMass"] = true,
        ["Parent"] = u72.RootPart,
        ["RelativeTo"] = Enum.ActuatorRelativeTo.World
    }
    local v74 = u72.RootPart
    if v74 ~= nil then
        v74 = v74:WaitForChild("RootRigAttachment")
    end
    v73.Attachment0 = v74
    local u75 = u15("VectorForce", v73)
    local v76 = {
        ["Name"] = "AlignmentForce",
        ["Parent"] = u72.RootPart
    }
    local v77 = u72.RootPart
    if v77 ~= nil then
        v77 = v77:WaitForChild("RootRigAttachment")
    end
    v76.Attachment0 = v77
    v76.RigidityEnabled = true
    v76.Mode = Enum.OrientationAlignmentMode.OneAttachment
    local u78 = u15("AlignOrientation", v76)
    local v79 = u56.activeForces
    table.insert(v79, u75)
    local v80 = u56.activeForces
    table.insert(v80, u78)
    local u81 = 0
    local v82 = u57.PrimaryPart.AssemblyLinearVelocity
    u57.PrimaryPart.AssemblyLinearVelocity = v82 * Vector3.new(1, 0.5, 1)
    u20:BindToRenderStep("HangGliderThrust", Enum.RenderPriority.Last.Value, function() --[[ Line: 227 ]]
        --[[
        Upvalues:
            [1] = u72
        --]]
        u72:Move(Vector3.new(0, 0, -1), true)
    end)
    local u128 = u20.Stepped:Connect(function(p83) --[[ Line: 230 ]]
        --[[
        Upvalues:
            [1] = u57
            [2] = u22
            [3] = u78
            [4] = u81
            [5] = u37
            [6] = u75
        --]]
        local v84 = u57.PrimaryPart
        local v85 = u22.CurrentCamera
        local v86 = u57:WaitForChild("Humanoid")
        local v87 = v84.AssemblyLinearVelocity
        local v88 = v86.RootPart
        if v88 ~= nil then
            v88 = v88.AssemblyMass
        end
        local v89 = (v88 == 0 or (v88 ~= v88 or not v88)) and 0 or v88
        local v90 = v85.CFrame.LookVector.Y
        local v91 = math.sign(v90) * v85.CFrame:ToOrientation()
        local v92 = math.clamp(v91, 0.01, 1.5707963267948966)
        local v93 = 1 - math.min(v92, 0.2617993877991494) / 1.5707963267948966
        local v94 = math.clamp(v93, 0.01, 1)
        if v92 < 0.2617993877991494 then
            local v95 = v84.Position
            local v96 = v84.Position
            local v97 = v85.CFrame.LookVector
            v84.CFrame = CFrame.new(v95, v96 + v97)
        else
            local v98 = v85.CFrame.LookVector
            local v99 = v98.X
            local v100 = v98.Z
            local v101 = Vector3.new(v99, 0, v100)
            if v101.Magnitude ~= 0 then
                local v102 = v84.Position
                local v103 = v84.Position
                local v104 = CFrame.new(v102, v103 + v101)
                local v105 = CFrame.Angles
                local v106 = v85.CFrame.LookVector.Y
                v84.CFrame = v104 * v105(math.sign(v106) * 0.2617993877991494, 0, 0)
            end
        end
        u78.CFrame = v85.CFrame
        if u81 > 0.5 then
            local v107 = v94 / 0.2617993877991494 * 0.5
            local v108 = v85.CFrame.LookVector.Y
            if math.sign(v108) == 1 and v86.WalkSpeed > 0 then
                v86.WalkSpeed = v86.WalkSpeed - v107
            elseif v86.WalkSpeed < 37 then
                v86.WalkSpeed = v86.WalkSpeed + v107
            end
            u81 = u81 - 0.5
        end
        u81 = u81 + p83
        local v109 = 1 - v94
        local v110 = v85.CFrame.LookVector.Y
        local v111 = v109 * math.sign(v110)
        local v112 = { -1, 1 }
        local v113 = { 0.7, 1.25 }
        local v114 = (v111 - v112[1]) * (v113[2] - v113[1]) / (v112[2] - v112[1]) + v113[1]
        local v115 = { 0, 35 }
        local v116 = { -0.3, 0 }
        local v117 = ((v87 * Vector3.new(1, 0, 1)).Magnitude - v115[1]) * (v116[2] - v116[1]) / (v115[2] - v115[1]) + v116[1]
        local v118 = u37.DragConstant
        local v119 = v87.Y
        local v120 = math.clamp(v119, -100, 100)
        local v121 = v118 * (math.pow(v120, 2) / 2)
        local v122 = u57.PrimaryPart.AssemblyLinearVelocity.Y
        local v123 = v121 * math.sign(v122) / 13
        local v124 = u75
        local v125 = u22.Gravity
        local v126 = v114 + v117
        local v127 = (v125 * math.max(0.7, v126) - v123) * v89
        v124.Force = Vector3.new(0, v127, 0)
    end)
    u56.activeGliderMaid:GiveTask(function() --[[ Line: 306 ]]
        --[[
        Upvalues:
            [1] = u128
        --]]
        u128:Disconnect()
    end)
    if u7.isMobileControls() then
        local v129 = u16
        local v130 = {}
        local v131 = #v130
        local v132 = {
            ["Image"] = u30.DOWN_MOBILE,
            ["Position"] = u24:getActionMobileButtonPosition() - UDim2.fromScale(0.08, 0),
            ["OnClick"] = function() --[[ Line: 324 ]]
                --[[
                Upvalues:
                    [1] = u56
                --]]
                u56:sendCloseHangGliderEvent()
            end
        }
        v130[v131 + 1] = u16.createElement(u9, v132)
        local u133 = v129.mount(u16.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, v130), u19.LocalPlayer:WaitForChild("PlayerGui"))
        u56.activeGliderMaid:GiveTask(function() --[[ Line: 329 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u133
            --]]
            u16.unmount(u133)
        end)
    else
        local v134 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u16.createElement(u4, {
            ["actionName"] = "HangGliderDismount",
            ["text"] = "Dismount Glider",
            ["interactionKey"] = Enum.KeyCode.X,
            ["gamepadInteractionKey"] = u8.CloseMenu,
            ["onActivated"] = function() --[[ Name: onActivated, Line 338 ]]
                --[[
                Upvalues:
                    [1] = u56
                --]]
                if u56.hangGliderActive then
                    u56:sendCloseHangGliderEvent()
                end
            end
        }))
        u56.activeGliderMaid:GiveTask(v134)
    end
end
function u38.closeHangGlider(p135) --[[ Line: 348 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u19
        [3] = u7
        [4] = u13
        [5] = u25
    --]]
    p135.hangGliderActive = false
    for _, v136 in p135.activeForces do
        v136:Destroy()
    end
    table.clear(p135.activeForces)
    u20:UnbindFromRenderStep("HangGliderThrust")
    local v137 = u19.LocalPlayer.Character:WaitForChild("Humanoid")
    if v137 then
        v137.WalkSpeed = 14
    end
    if u7.isMobileControls() then
        if not u25:getState().Settings.mobileShiftLock then
            u13.Controllers.MobileShiftLockController:disable()
        end
    else
        u13.Controllers.MobileShiftLockController:disable()
    end
    p135.activeGliderMaid:DoCleaning()
end
function u38.sendCloseHangGliderEvent(_) --[[ Line: 366 ]]
    --[[
    Upvalues:
        [1] = u32
    --]]
    u32.Client:Get("HangGliderClose"):SendToServer({})
end
function u38.canOpenHangGlider(p138) --[[ Line: 370 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u35
        [3] = u34
        [4] = u19
    --]]
    local v139 = u29:getLocalPlayerEntity()
    if not v139 then
        return false
    end
    if u35:hasAnyActive(v139:getInstance(), { u34.GROUNDED, u34.FROSTED }) then
        return false
    end
    local v140 = u19.LocalPlayer.Character:FindFirstChild("Humanoid")
    return p138.acceptedGlidingStates[v140:GetState()] ~= nil
end
function u38.isRelevantItem(_, p141) --[[ Line: 389 ]]
    --[[
    Upvalues:
        [1] = u31
    --]]
    return p141.itemType == u31.HANG_GLIDER
end
function u38.onEnable(u142, p143) --[[ Line: 392 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u5
        [3] = u2
        [4] = u7
        [5] = u16
        [6] = u9
        [7] = u30
        [8] = u24
        [9] = u19
    --]]
    local v144 = p143.tool
    local v145 = u25:getState().Game.myTeam
    if v145 ~= nil then
        v145 = v145.color
    end
    if v145 == nil then
        v145 = Color3.fromRGB(255, 255, 255)
    end
    v144.Handle.LightStripe.Color = v145
    v144.Handle.DarkStripe.Color = u5.darken(v145, 0.5)
    local v147 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        ["action"] = "Attack",
        ["actionId"] = "open-glider",
        ["boundFunction"] = function(_, p146, _) --[[ Name: boundFunction, Line 411 ]]
            --[[
            Upvalues:
                [1] = u142
            --]]
            if p146 == Enum.UserInputState.Begin then
                if u142.hangGliderActive then
                    return nil
                end
                if not u142:canOpenHangGlider() then
                    return nil
                end
                u142:openHangGlider()
            end
        end
    })
    u142.maid:GiveTask(v147)
    if u7.isMobileControls() then
        u142:setupYield(function() --[[ Line: 425 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u9
                [3] = u30
                [4] = u24
                [5] = u142
                [6] = u19
            --]]
            local u148 = u16.mount(u16.createElement("ScreenGui", {
                ["ResetOnSpawn"] = false
            }, { u16.createElement(u9, {
                    ["Image"] = u30.UP_MOBILE,
                    ["Position"] = u24:getActionMobileButtonPosition(),
                    ["OnClick"] = function() --[[ Name: OnClick, Line 432 ]]
                        --[[
                        Upvalues:
                            [1] = u142
                        --]]
                        if u142.hangGliderActive then
                            u142:sendCloseHangGliderEvent()
                            return nil
                        end
                        if not u142:canOpenHangGlider() then
                            return nil
                        end
                        u142:openHangGlider()
                    end
                }) }), u19.LocalPlayer:WaitForChild("PlayerGui"))
            return function() --[[ Line: 444 ]]
                --[[
                Upvalues:
                    [1] = u16
                    [2] = u148
                --]]
                u16.unmount(u148)
            end
        end)
    end
end
function u38.onDisable(p149) --[[ Line: 450 ]]
    p149.maid:DoCleaning()
end
u12.CreateController(u38.new())
return nil