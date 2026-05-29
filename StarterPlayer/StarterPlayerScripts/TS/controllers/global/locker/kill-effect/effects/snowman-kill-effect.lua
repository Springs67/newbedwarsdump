local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.Players
local u6 = v4.ReplicatedStorage
local u7 = v4.TweenService
local u8 = v4.Workspace
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u10 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u11 = u8.CurrentCamera
local u12 = {
    { "SnowmanBottom" },
    { "SnowmanTorso" },
    { "SnowmanLeftArm", "SnowmanRightArm", "SnowmanMitten" },
    { "SnowmanScarf" },
    {
        "SnowmanHead",
        "SnowmanLeftEye",
        "SnowmanRightEye",
        "SnowmanNose"
    },
    { "SnowmanHat" }
}
local u13 = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "SnowmanKillEffect"
    end,
    ["__index"] = u10
})
u14.__index = u14
function u14.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17, ...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p17, ...)
end
function u14.onKill(p18, _, p19, p20) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u8
    --]]
    local v21 = u2.new()
    local v22 = p18:buildSnowman(p20, p19)
    v22.Parent = u8
    v21:GiveTask(v22)
    v21:GiveTask(p18:animateSnowman(v22, p19))
    return v21
end
function u14.animateSnowman(u23, u24, u25) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
        [3] = u1
        [4] = u12
        [5] = u7
        [6] = u13
        [7] = u3
    --]]
    local v26 = u2.new()
    local v27 = u25 == u5.LocalPlayer.Character
    local u28 = u24.SnowmanBottom
    if v27 then
        u25:BreakJoints()
        for _, v29 in u25:GetDescendants() do
            if v29:IsA("BasePart") then
                v29.CanCollide = false
            end
        end
    end
    local u30 = u24:GetChildren()
    local u31 = {}
    for _, v32 in u30 do
        local v33 = v32.CFrame
        u31[v32] = v33
        v32.CFrame = v33 * CFrame.new(0, 5, 0)
        v32.Transparency = 1
    end
    local u49 = u1.Promise.new(function() --[[ Line: 64 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u30
            [3] = u31
            [4] = u7
            [5] = u13
            [6] = u24
            [7] = u28
            [8] = u3
            [9] = u23
            [10] = u25
        --]]
        for _, v34 in u12 do
            for _, v35 in v34 do
                local v36 = nil
                for v37, v38 in u30 do
                    local _ = v37 - 1
                    if v38.Name == v35 == true then
                        v36 = v38
                        break
                    end
                end
                if v36 then
                    local v39 = u31[v36]
                    if v39 then
                        u7:Create(v36, u13, {
                            ["Transparency"] = 0,
                            ["CFrame"] = v39
                        }):Play()
                    end
                end
            end
            task.wait(0.2)
        end
        for _, v40 in u24:GetChildren() do
            if v40:IsA("BasePart") and v40 ~= u28 then
                u3("WeldConstraint", {
                    ["Part0"] = u28,
                    ["Part1"] = v40,
                    ["Parent"] = u28
                })
                v40.Anchored = false
            end
        end
        u23:hideCharacter(u25)
        local v41 = u28.CFrame
        local v42 = u7:Create(u28, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            ["CFrame"] = v41 * CFrame.Angles(0, 3.141592653589793, 0)
        })
        v42:Play()
        v42.Completed:Wait()
        local v43 = u28.CFrame
        local v44 = u7:Create(u28, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            ["CFrame"] = v43 * CFrame.new(0, 2, 0) * CFrame.Angles(0, 3.141592653589793, 0)
        })
        v44:Play()
        v44.Completed:Wait()
        local v45 = u28.CFrame
        u7:Create(u28, TweenInfo.new(0.4, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
            ["CFrame"] = v45 * CFrame.new(0, -2, 0)
        }):Play()
        task.delay(0.1, function() --[[ Line: 155 ]]
            --[[
            Upvalues:
                [1] = u24
            --]]
            u24.SnowmanBottom.Attachment.ParticleEmitter:Emit(300)
        end)
        task.wait(1)
        local v46 = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
        local v47 = nil
        for _, v48 in u24:GetChildren() do
            if v48:IsA("BasePart") then
                v47 = u7:Create(v48, v46, {
                    ["Transparency"] = 1
                })
                v47:Play()
            end
        end
        v47.Completed:Wait()
        u24:Destroy()
    end)
    v26:GiveTask(function() --[[ Line: 176 ]]
        --[[
        Upvalues:
            [1] = u49
        --]]
        return u49:cancel()
    end)
    return v26
end
function u14.buildSnowman(_, p50, p51) --[[ Line: 181 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u9
        [3] = u8
        [4] = u11
    --]]
    local v52 = u6.Assets.Misc.Snowman:Clone()
    local v53 = RaycastParams.new()
    v53.FilterDescendantsInstances = u9.isLobbyServer() and { p51 } or { u8.Map }
    local v54
    if u9.isLobbyServer() then
        v54 = Enum.RaycastFilterType.Exclude
    else
        v54 = Enum.RaycastFilterType.Include
    end
    v53.FilterType = v54
    local v55 = u8:Raycast(p50.Position, Vector3.new(0, -10, 0), v53)
    if v55 ~= nil then
        v55 = v55.Position
    end
    local v56 = v55 or p50.Position
    local v57 = (v56 - u11.CFrame.Position).Unit * Vector3.new(1, 0, 1)
    v52:PivotTo(CFrame.new(v56, v56 + v57) * CFrame.Angles(0, 3.141592653589793, 0))
    return v52
end
return u14