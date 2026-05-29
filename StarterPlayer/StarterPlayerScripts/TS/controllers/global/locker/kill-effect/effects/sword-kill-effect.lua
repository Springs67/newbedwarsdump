local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.ReplicatedStorage
local u9 = v7.RunService
local u10 = v7.TweenService
local u11 = v7.Workspace
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local _ = {
    ["blade"] = Color3.fromRGB(0, 170, 255),
    ["hilt"] = Color3.fromRGB(54, 123, 190),
    ["neon"] = Color3.fromRGB(104, 128, 250)
}
local u16 = {
    ["blade"] = Color3.fromRGB(255, 135, 0),
    ["hilt"] = Color3.fromRGB(231, 125, 23),
    ["neon"] = Color3.fromRGB(250, 132, 112)
}
local u17 = {
    ["blade"] = Color3.fromRGB(255, 176, 0),
    ["hilt"] = Color3.fromRGB(182, 146, 53),
    ["neon"] = Color3.fromRGB(248, 217, 109)
}
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 51 ]]
        return "SwordKillEffect"
    end,
    ["__index"] = u15
})
u18.__index = u18
function u18.new(...) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21, p22) --[[ Line: 61 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.constructor(p21, p22)
    u15.setPlayDefaultKillEffect(p21, false)
end
function u18.onKill(p23, _, p24, p25) --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u10
        [3] = u8
        [4] = u11
        [5] = u15
        [6] = u6
        [7] = u4
        [8] = u14
        [9] = u3
        [10] = u13
        [11] = u12
        [12] = u16
        [13] = u17
        [14] = u9
        [15] = u1
    --]]
    local u26 = u5.new()
    p24.Archivable = true
    local u27 = p24:Clone()
    u27:PivotTo(p25)
    local u28 = {}
    for _, v29 in u27:GetDescendants() do
        if v29:IsA("BasePart") then
            v29.Material = Enum.Material.SmoothPlastic
            u10:Create(v29, TweenInfo.new(0.4), {
                ["Color"] = Color3.fromRGB(248, 217, 109)
            }):Play()
            if v29:IsA("MeshPart") then
                v29.TextureID = ""
            end
            if v29.Name == "Head" then
                v29.Material = Enum.Material.Neon
            end
            table.insert(u28, v29)
        elseif v29:IsA("Texture") then
            v29:Destroy()
        elseif v29:IsA("Shirt") then
            v29:Destroy()
        end
    end
    local u30 = u8.Assets.Effects.SwordKillEffect.SwordModel:Clone()
    u30.Parent = u11
    local v31 = u27:GetPivot().Position
    u30:PivotTo(CFrame.new(v31 + Vector3.new(0, 9, 0)))
    u26:GiveTask(u30)
    u27.Parent = u11
    u26:GiveTask(u27)
    u15.hideCharacter(p23, p24)
    u26:GiveTask((u6("PointLight", {
        ["Brightness"] = 0.3,
        ["Range"] = 5,
        ["Shadows"] = false,
        ["Enabled"] = true,
        ["Color"] = Color3.fromRGB(254, 168, 78),
        ["Parent"] = u27
    })))
    local u32 = u4:playSound(u14.HANNAH_UNSHEATH_SWORD, {
        ["position"] = u27:GetPivot().Position
    })
    local u33 = u3:playAnimation(u27:FindFirstChild("Humanoid"):FindFirstChild("Animator"), u13:getAssetId(u12.ASCEND), {
        ["looped"] = false
    })
    task.delay(0.5, function() --[[ Line: 117 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        local v34 = u33
        if v34 ~= nil then
            v34:AdjustSpeed(0)
        end
    end)
    u26:GiveTask(function() --[[ Line: 123 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        if u32 then
            u32:Destroy()
        end
    end)
    u26:GiveTask(function() --[[ Line: 128 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        if u33 then
            u33:Destroy()
        end
    end)
    task.delay(0.25, function() --[[ Line: 133 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u10
            [3] = u16
            [4] = u17
        --]]
        local v35 = u30:WaitForChild("PrimaryPart")
        u30.PrimaryPart = v35
        local u36 = v35:WaitForChild("Blade")
        local u37 = v35:WaitForChild("Hilt")
        local u38 = v35:WaitForChild("Neon")
        local v39 = {
            ["Color"] = u16.blade
        }
        local v40 = u10:Create(u36, TweenInfo.new(0.4), v39)
        v40:Play()
        v40.Completed:Connect(function() --[[ Line: 146 ]]
            --[[
            Upvalues:
                [1] = u36
                [2] = u17
                [3] = u10
            --]]
            local v41 = u36
            local v42 = {
                ["Color"] = u17.blade
            }
            u10:Create(v41, TweenInfo.new(0.6), v42):Play()
        end)
        local v43 = {
            ["Color"] = u16.hilt
        }
        local v44 = u10:Create(u37, TweenInfo.new(0.4), v43)
        v44:Play()
        v44.Completed:Connect(function() --[[ Line: 149 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u17
                [3] = u10
            --]]
            local v45 = u37
            local v46 = {
                ["Color"] = u17.hilt
            }
            u10:Create(v45, TweenInfo.new(0.6), v46):Play()
        end)
        local v47 = {
            ["Color"] = u16.neon
        }
        local v48 = u10:Create(u38, TweenInfo.new(0.4), v47)
        v48:Play()
        v48.Completed:Connect(function() --[[ Line: 152 ]]
            --[[
            Upvalues:
                [1] = u38
                [2] = u17
                [3] = u10
            --]]
            local v49 = u38
            local v50 = {
                ["Color"] = u17.neon
            }
            u10:Create(v49, TweenInfo.new(0.6), v50):Play()
        end)
    end)
    local u51 = u4:playSound(u14.SWORD_SPARKLE, {
        ["position"] = u27:GetPivot().Position
    })
    u26:GiveTask(function() --[[ Line: 159 ]]
        --[[
        Upvalues:
            [1] = u51
        --]]
        if u51 then
            u51:Destroy()
        end
    end)
    local u52 = 0
    local v53 = u30:GetPivot().Position
    local u54 = CFrame.new(v53 - Vector3.new(0, 9, 0))
    u26:GiveTask(u9.Heartbeat:Connect(function(p55) --[[ Line: 169 ]]
        --[[
        Upvalues:
            [1] = u52
            [2] = u30
            [3] = u54
            [4] = u26
        --]]
        u52 = u52 + p55
        local v56 = u52 / 2
        local v57 = u30:GetPivot() * CFrame.Angles(0, 0.5235987755982988 * math.sqrt(v56), 0)
        if u52 > 0.75 then
            local v58 = (u52 - 0.75) / 1.25
            v57 = v57:Lerp(u54, (math.sqrt(v58)))
        end
        u30:PivotTo(v57)
        if u52 > 2 then
            task.delay(1, function() --[[ Line: 181 ]]
                --[[
                Upvalues:
                    [1] = u26
                --]]
                u26:DoCleaning()
            end)
        end
    end))
    local u61 = u1.Promise.delay(0.75):andThen(function() --[[ Line: 187 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u11
            [3] = u27
            [4] = u26
            [5] = u4
            [6] = u14
        --]]
        local v59 = u8.Assets.Effects.SwordKillEffect.ExplosionParticles:Clone()
        v59.Parent = u11
        v59:PivotTo(u27:GetPivot())
        u26:GiveTask(v59)
        for _, v60 in v59:GetDescendants() do
            if v60:IsA("ParticleEmitter") then
                v60:Emit()
                u26:GiveTask(v60)
            end
        end
        u26:GiveTask(u4:playSound(u14.FRYING_PAN_HIT, {
            ["position"] = u27:GetPivot().Position
        }))
    end)
    u26:GiveTask(function() --[[ Line: 203 ]]
        --[[
        Upvalues:
            [1] = u61
        --]]
        return u61:cancel()
    end)
    local u64 = u1.Promise.delay(0.69):andThen(function() --[[ Line: 207 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u28
        --]]
        for v62, v63 in u28 do
            local _ = v62 - 1
            u10:Create(v63, TweenInfo.new(0.33), {
                ["Transparency"] = 1
            }):Play()
        end
    end)
    u26:GiveTask(function() --[[ Line: 218 ]]
        --[[
        Upvalues:
            [1] = u64
        --]]
        return u64:cancel()
    end)
    return u26
end
return u18