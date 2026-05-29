local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.ReplicatedStorage
local u6 = v4.RunService
local u7 = v4.Workspace
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "BeeParticle"
    end
})
u11.__index = u11
function u11.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(u14, u15) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u7
        [4] = u10
        [5] = u9
        [6] = u6
        [7] = u8
        [8] = u2
    --]]
    u14.maid = u3.new()
    u14.beeInstance = u5.Assets.Effects.Bee:Clone()
    u14.beeInstance.Parent = u7
    for v16, v17 in u14.beeInstance:GetDescendants() do
        local _ = v16 - 1
        if v17:IsA("BasePart") then
            v17.CanCollide = false
            v17.CanQuery = false
            v17.Anchored = true
        end
    end
    local v18 = u14.beeInstance.PrimaryPart
    if v18 ~= nil then
        v18 = v18:FindFirstChild("Trail")
    end
    if v18 then
        v18.Enabled = true
    end
    local v19 = u14.beeInstance:FindFirstChildOfClass("AnimationController")
    if v19 ~= nil then
        local v20 = v19:LoadAnimation(u10:getAnimation(u9.BEE_FLAP))
        v20.Looped = true
        v20:Play()
    end
    u14.maid:GiveTask(u15.AncestryChanged:Connect(function() --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        u14.maid:DoCleaning()
    end))
    local u21 = math.random() * 3
    local u22 = 3.5 + math.random() * 1.5
    local u23 = math.random() * 10
    local u24 = false
    local u37 = u6.Heartbeat:Connect(function(p25) --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u15
            [3] = u14
            [4] = u22
            [5] = u21
        --]]
        u23 = u23 + p25
        local v26 = u15.PrimaryPart
        if v26 ~= nil then
            v26 = v26.CFrame
        end
        if not v26 then
            u14.maid:DoCleaning()
            return nil
        end
        local v27 = u23 * 1.5
        local v28 = math.sin(v27) * u22
        local v29 = u21
        local v30 = u23 * 2.5
        local v31 = v29 + math.sin(v30) * 3
        local v32 = u23 * 1.5
        local v33 = math.cos(v32) * u22
        local v34 = v26 * Vector3.new(v28, v31, v33)
        local v35 = v26.LookVector
        local v36 = CFrame.new(v34, v34 + v35)
        if (u14.beeInstance.PrimaryPart.Position - v36.Position).Magnitude > 20 then
            u14.beeInstance:PivotTo(v36)
            return nil
        end
        u14.beeInstance:PivotTo(u14.beeInstance.PrimaryPart.CFrame:Lerp(v36, 4.5 * p25))
    end)
    u14.maid:GiveTask(function() --[[ Line: 101 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u14
            [3] = u8
            [4] = u2
            [5] = u37
        --]]
        u24 = true
        for v38, u39 in u14.beeInstance:GetDescendants() do
            local _ = v38 - 1
            if u39:IsA("BasePart") then
                local u40 = u39.Transparency
                u8(0.9, u2, function(p41) --[[ Line: 107 ]]
                    --[[
                    Upvalues:
                        [1] = u39
                        [2] = u40
                    --]]
                    u39.Transparency = (1 - p41) * u40 + p41 * 1
                end)
            end
        end
        task.delay(1, function() --[[ Line: 115 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u14
            --]]
            u37:Disconnect()
            u14.beeInstance:Destroy()
        end)
    end)
end
function u11.Destroy(p42) --[[ Line: 121 ]]
    p42.maid:DoCleaning()
end
return {
    ["BeeParticle"] = u11
}