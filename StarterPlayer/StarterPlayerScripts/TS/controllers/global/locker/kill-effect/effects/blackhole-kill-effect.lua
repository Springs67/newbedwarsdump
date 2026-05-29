local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutExpo
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.ReplicatedStorage
local u7 = v5.RunService
local u8 = v5.Workspace
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil
local u10 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "BlackholeKillEffect"
    end,
    ["__index"] = u10
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14, p15) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p14, p15)
    u10.setPlayDefaultKillEffect(p14, false)
end
function u11.onKill(u16, _, p17, u18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u8
        [3] = u10
        [4] = u6
        [5] = u4
        [6] = u9
        [7] = u2
        [8] = u7
    --]]
    local u19 = u3.new()
    task.delay(8, function() --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        u19:DoCleaning()
    end)
    p17.Archivable = true
    local u20 = p17:Clone()
    u20.HumanoidRootPart.Anchored = true
    u20.Parent = u8
    u10.hideCharacter(u16, p17)
    u19:GiveTask(u20)
    local u21 = u6.Assets.Effects.BlackHole:Clone()
    u21:PivotTo(u18)
    u21.Parent = u8
    for _, v22 in u21:GetDescendants() do
        if v22:IsA("BasePart") then
            v22.Anchored = true
            v22.CanQuery = false
            v22.CanTouch = false
        end
    end
    u21["ring.001"].Color = Color3.fromRGB(170, 0, 170)
    u21["ring.002"].Color = Color3.fromRGB(177, 167, 255)
    u21["ring.003"].Color = Color3.fromRGB(255, 89, 89)
    u19:GiveTask(u21)
    u4(u21, 0.5)
    u4(u21, 0.01)
    u9.tweenModelSize(u21, 0.5, u2, 100)
    local u23 = {}
    for _, v24 in u20:GetChildren() do
        if v24:IsA("BasePart") then
            for _, v25 in v24:GetChildren() do
                if v25:IsA("Motor6D") then
                    v25:Destroy()
                end
            end
            v24.Anchored = true
            v24.CanCollide = false
            v24.CanQuery = false
            v24.CanTouch = false
            local v26 = {
                ["goalY"] = 8,
                ["part"] = v24,
                ["offset"] = math.random() * 1000,
                ["startY"] = math.random(),
                ["seed"] = math.random() * 1000
            }
            table.insert(u23, v26)
        end
    end
    local u27 = 0
    u19:GiveTask(u7.Heartbeat:Connect(function(p28) --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u21
            [3] = u18
            [4] = u23
            [5] = u2
        --]]
        u27 = u27 + p28
        local v29 = u21
        local v30 = u18
        local v31 = CFrame.Angles
        local v32 = u27 * 360
        v29:PivotTo(v30 * v31(0, math.rad(v32), 0))
        for _, v33 in u23 do
            local v34
            if u27 < 0.5 then
                v34 = u2(u27, 0, 7, 0.5)
            elseif u27 > 5.9 then
                local v35 = u2
                local v36 = u27 - 5.9
                v34 = v35(math.min(v36, 1), 7, -7, 0.1)
            else
                v34 = 7
            end
            local v37 = u18
            local v38 = u27 * 2 + v33.offset
            local v39 = math.sin(v38) * v34
            local v40 = u27 * 2 + v33.offset
            local v41 = math.cos(v40) * v34
            local v42 = Vector3.new(v39, 0, v41)
            local v43 = math.noise(u27 * 0.5, 0, v33.seed) * 9
            local v44 = math.noise(u27 * 0.5, 0, -v33.seed) * 15
            local v45 = math.noise(u27 * 0.5, 0, v33.seed + v33.seed) * 9
            local v46 = Vector3.new(v43, v44, v45)
            v33.part.CFrame = v37 + (v42 + v46)
        end
    end))
    task.delay(6, function() --[[ Line: 102 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u20
            [3] = u23
            [4] = u9
            [5] = u21
            [6] = u2
        --]]
        u16:hideCharacter(u20)
        table.clear(u23)
        u9.tweenModelSize(u21, 0.3, u2, 0)
    end)
    return u19
end
return u11