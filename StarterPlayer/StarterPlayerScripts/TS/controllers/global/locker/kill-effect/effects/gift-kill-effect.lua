local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.Players
local u7 = v5.ReplicatedStorage
local u8 = v5.TweenService
local u9 = v5.Workspace
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u12 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "GiftKillEffect"
    end,
    ["__index"] = u12
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16, ...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p16, ...)
end
function u13.onKill(p17, _, p18, p19) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u9
        [3] = u2
        [4] = u10
    --]]
    local v20 = u3.new()
    local v21 = p17:buildBox(p19, p18)
    v21.Parent = u9
    v20:GiveTask(v21)
    v20:GiveTask(u2:playSound(u10.GIFT_KILL_EFFECT, {
        ["rollOffMaxDistance"] = 80,
        ["position"] = p19.Position
    }))
    v20:GiveTask(p17:animateBox(v21, p18))
    return v20
end
function u13.animateBox(u22, u23, u24) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
        [3] = u1
        [4] = u8
        [5] = u4
    --]]
    local v25 = u3.new()
    local u26 = u23:FindFirstChild("Particle"):FindFirstChildOfClass("ParticleEmitter")
    if u24 == u6.LocalPlayer.Character then
        u24:BreakJoints()
        for _, v27 in u24:GetDescendants() do
            if v27:IsA("BasePart") then
                v27.CanCollide = false
            end
        end
    end
    local v28 = 0
    local u29 = {}
    for v30, v31 in u23:GetChildren() do
        local _ = v30 - 1
        local v32
        if v31.Name == "Lid" or v31.Name == "Bow" then
            v32 = false
        else
            v32 = v31 ~= u26
        end
        if v32 == true then
            v28 = v28 + 1
            u29[v28] = v31
        end
    end
    table.sort(u29, function(p33, p34) --[[ Line: 72 ]]
        return p33.Name < p34.Name
    end)
    local u35 = { u23:FindFirstChild("Lid"), u23:FindFirstChild("Bow") }
    for _, v36 in u35 do
        v36.Transparency = 1
    end
    for _, v37 in u29 do
        v37.Transparency = 1
    end
    local u52 = u1.Promise.new(function() --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u8
            [3] = u35
            [4] = u22
            [5] = u24
            [6] = u23
            [7] = u4
            [8] = u26
        --]]
        for _, v38 in u29 do
            local v39 = v38.CFrame
            v38.CFrame = v38.CFrame * CFrame.new(0, -4, 0)
            local v40 = u8:Create(v38, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                ["Transparency"] = 0,
                ["CFrame"] = v39
            })
            v40:Play()
            v40.Completed:Wait()
        end
        for _, v41 in u35 do
            local v42 = v41.CFrame
            v41.CFrame = v41.CFrame * CFrame.new(0, 4, 0)
            local v43 = u8:Create(v41, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                ["Transparency"] = 0,
                ["CFrame"] = v42
            })
            v43:Play()
            v43.Completed:Wait()
        end
        u22:hideCharacter(u24)
        local v44 = u23:FindFirstChild("Bottom")
        for _, v45 in u23:GetChildren() do
            if v45:IsA("BasePart") and v45 ~= v44 then
                u4("WeldConstraint", {
                    ["Part0"] = v44,
                    ["Part1"] = v45,
                    ["Parent"] = v44
                })
                v45.Anchored = false
            end
        end
        local v46 = v44.CFrame
        local v47 = u8:Create(v44, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            ["CFrame"] = v46 * CFrame.Angles(0, 3.141592653589793, 0)
        })
        v47:Play()
        v47.Completed:Wait()
        local v48 = v44.CFrame
        local v49 = u8:Create(v44, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            ["CFrame"] = v48 * CFrame.new(0, 2, 0) * CFrame.Angles(0, 3.141592653589793, 0)
        })
        v49:Play()
        v49.Completed:Wait()
        local v50 = v44.CFrame
        u8:Create(v44, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
            ["CFrame"] = v50 * CFrame.new(0, -2, 0)
        }):Play()
        for _, v51 in u23:GetChildren() do
            if v51:IsA("BasePart") then
                v51.Anchored = true
            end
        end
        v44:ClearAllChildren()
        u22:scaleModel(u23, 0, (TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.In)))
        u26:Emit(100)
        task.wait(5)
        u23:Destroy()
    end)
    v25:GiveTask(function() --[[ Line: 188 ]]
        --[[
        Upvalues:
            [1] = u52
        --]]
        return u52:cancel()
    end)
    return v25
end
function u13.buildBox(_, p53, p54) --[[ Line: 193 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u11
        [3] = u9
    --]]
    local v55 = u7.Assets.Misc.GiftBox:Clone()
    local v56 = Random.new()
    local v57 = RaycastParams.new()
    v57.FilterDescendantsInstances = u11.isLobbyServer() and { p54 } or { u9.Map }
    local v58
    if u11.isLobbyServer() then
        v58 = Enum.RaycastFilterType.Exclude
    else
        v58 = Enum.RaycastFilterType.Include
    end
    v57.FilterType = v58
    local v59 = u9:Raycast(p53.Position, Vector3.new(0, -10, 0), v57)
    if v59 ~= nil then
        v59 = v59.Position
    end
    local v60 = v59 or p53.Position
    local v61 = v56:NextNumber(-360, 360)
    local v62 = math.rad(v61)
    v55:PivotTo(CFrame.new(v60) * CFrame.Angles(0, v62, 0))
    return v55
end
return u13