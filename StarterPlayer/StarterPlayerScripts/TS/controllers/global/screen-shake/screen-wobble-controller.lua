local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchPlayerCharacter
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.Players
local u7 = v5.RunService
local u8 = v5.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "ScreenWobbleController"
    end,
    ["__index"] = u9
})
u10.__index = u10
function u10.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u4
    --]]
    u9.constructor(p13)
    p13.Name = "ScreenWobbleController"
    p13.maid = u4.new()
    p13.wobbleRunning = false
    p13.wobbleAlive = false
end
function u10.KnitStart(p14) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.KnitStart(p14)
end
function u10.enableScreenWobble(u15) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u2
        [3] = u3
    --]]
    u15.maid:GiveTask(u6.LocalPlayer.CharacterRemoving:Connect(function() --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u15
        --]]
        u15.wobbleAlive = false
    end))
    u15.maid:GiveTask(u2(u6.LocalPlayer, function(p16, u17) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u3
        --]]
        local u18 = p16:WaitForChild("Humanoid")
        u15.maid:GiveTask(u18.Died:Connect(function() --[[ Line: 41 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u17
            --]]
            u15.wobbleAlive = false
            u17:DoCleaning()
        end))
        if not p16.PrimaryPart then
            p16:GetPropertyChangedSignal("PrimaryPart"):Wait()
        end
        local u19 = p16.PrimaryPart
        local u20 = u18.MoveDirection.Magnitude ~= 0
        local v21 = {}
        local v23 = u18:GetPropertyChangedSignal("MoveDirection"):Connect(function() --[[ Line: 63 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u19
                [3] = u20
                [4] = u3
                [5] = u15
            --]]
            local v22
            if u18.MoveDirection.Magnitude == 0 then
                v22 = false
            else
                v22 = not u19.Anchored
            end
            if v22 ~= u20 then
                u20 = v22
                if u20 and u3.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
                    u15:startWobble(u18)
                    return
                end
                u15.wobbleAlive = false
            end
        end)
        table.insert(v21, v23)
        local v25 = u19:GetPropertyChangedSignal("Anchored"):Connect(function() --[[ Line: 67 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u19
                [3] = u20
                [4] = u3
                [5] = u15
            --]]
            local v24
            if u18.MoveDirection.Magnitude == 0 then
                v24 = false
            else
                v24 = not u19.Anchored
            end
            if v24 ~= u20 then
                u20 = v24
                if u20 and u3.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
                    u15:startWobble(u18)
                    return
                end
                u15.wobbleAlive = false
            end
        end)
        table.insert(v21, v25)
        local v27 = u3.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(_) --[[ Line: 71 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u19
                [3] = u20
                [4] = u3
                [5] = u15
            --]]
            local v26
            if u18.MoveDirection.Magnitude == 0 then
                v26 = false
            else
                v26 = not u19.Anchored
            end
            if v26 ~= u20 then
                u20 = v26
                if u20 and u3.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
                    u15:startWobble(u18)
                    return
                end
                u15.wobbleAlive = false
            end
        end)
        table.insert(v21, v27)
        local v28 = u20
        for _, v29 in v21 do
            u17:GiveTask(v29)
            u15.maid:GiveTask(v29)
        end
        if v28 then
            u15:startWobble(u18)
        end
    end))
end
function u10.startWobble(u30, u31) --[[ Line: 84 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
        [3] = u8
    --]]
    if u30.wobbleRunning then
        u30.wobbleAlive = true
        return nil
    end
    u30.wobbleRunning = true
    u30.wobbleAlive = true
    local u32 = 0
    local u33 = u4.new()
    u33:GiveTask(function() --[[ Line: 93 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        u30.wobbleRunning = false
    end)
    local u34 = 0
    u7:BindToRenderStep("wobble-pre-camera", Enum.RenderPriority.Character.Value + 2, function(p35) --[[ Line: 101 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u34
            [3] = u31
            [4] = u30
            [5] = u32
            [6] = u33
        --]]
        local v36 = u8.CurrentCamera
        if not v36 then
            return nil
        end
        u34 = u34 + p35
        local v37 = (v36.CFrame - v36.CFrame.Position):Inverse() * u31.MoveDirection
        local v38 = v37.X
        local v39 = v37.Z
        local v40 = math.atan2(v38, v39)
        local v41 = math.cos(v40)
        local v42 = math.abs(v41)
        local v43 = {
            Enum.HumanoidStateType.Jumping,
            Enum.HumanoidStateType.FallingDown,
            Enum.HumanoidStateType.Freefall,
            Enum.HumanoidStateType.Flying
        }
        local v44 = u31:GetState()
        if table.find(v43, v44) ~= nil then
            v42 = v42 * 0.2
        end
        if not u30.wobbleAlive then
            v42 = v42 * 2
        end
        local v45 = math.cos(v40) > 0 and -1 or 1
        local v46 = not u30.wobbleAlive and (u32 % 3.141592653589793 < 1.5707963267948966 and -1 or 1) or v45
        local v47 = p35 * (u31.WalkSpeed / 24) * 1.6216216216216215 * 3.141592653589793 * 2 * v42 * v46
        if not u30.wobbleAlive and u32 % 3.141592653589793 > (u32 + v47) % 3.141592653589793 then
            u33:DoCleaning()
            return nil
        end
        u32 = (u32 + v47) % 6.283185307179586
        local v48 = v36.CFrame - v36.CFrame.Position
        local v49 = u34 / 1
        local v50 = math.min(v49, 1) * 0.35
        local v51 = u32 - 1.5707963267948966
        local v52 = math.cos(v51) * v50
        local v53 = u32 * 2
        local v54 = math.sin(v53) * v50 * 0.65
        local v55 = Vector3.new(v52, v54, 0)
        v36.CFrame = v48 + v36.CFrame * v55
    end)
    u33:GiveTask(function() --[[ Line: 147 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        return u7:UnbindFromRenderStep("wobble-pre-camera")
    end)
    local u56 = nil
    u7:BindToRenderStep("wobble-post-camera", Enum.RenderPriority.Camera.Value + 1, function(_) --[[ Line: 152 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u56
        --]]
        local v57 = u8.CurrentCamera
        if v57 ~= nil then
            v57 = v57.CFrame
        end
        u56 = v57
    end)
    u33:GiveTask(function() --[[ Line: 160 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        return u7:UnbindFromRenderStep("wobble-post-camera")
    end)
    u33:GiveTask(u7.Stepped:Connect(function() --[[ Line: 163 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u56
        --]]
        local v58 = u8.CurrentCamera
        if v58 and u56 then
            v58.CFrame = u56
        end
    end))
    return nil
end
function u10.disableScreenWobble(p59) --[[ Line: 172 ]]
    p59.maid:DoCleaning()
end
u3.CreateController(u10.new())
return nil