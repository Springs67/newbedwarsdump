local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.ReplicatedStorage
local u9 = v7.RunService
local u10 = v7.TweenService
local u11 = v7.Workspace
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "RageBladeKillEffect"
    end,
    ["__index"] = u15
})
u16.__index = u16
function u16.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19, p20) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.constructor(p19, p20)
    p19.startDistanceAbove = 50
    p19.swordFallTime = 0.5
    u15.setPlayDefaultKillEffect(p19, false)
end
function u16.onKill(u21, _, p22, p23) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u8
        [3] = u11
        [4] = u15
        [5] = u6
        [6] = u4
        [7] = u14
        [8] = u3
        [9] = u13
        [10] = u12
        [11] = u9
        [12] = u10
    --]]
    p22.Archivable = true
    local u24 = u5.new()
    local v25 = u21:createStatue(p22, p23)
    local u26 = v25[1]
    local u27 = v25[2]
    local u28 = u21:getBodyParts(u26)
    local u29 = u8.Assets.Effects.RageBladeKillEffect.RageBlade:Clone()
    u29.Parent = u11
    local v30 = u26:GetPivot().Position
    local v31 = u21.startDistanceAbove
    local v32 = Vector3.new(0, v31, 0)
    u29:PivotTo(CFrame.new(v30 + v32))
    u24:GiveTask(u29)
    u26.Parent = u11
    u24:GiveTask(u26)
    u15.hideCharacter(u21, p22)
    u6("PointLight", {
        ["Brightness"] = 0.3,
        ["Range"] = 5,
        ["Shadows"] = false,
        ["Enabled"] = true,
        ["Color"] = Color3.fromRGB(254, 168, 78),
        ["Parent"] = u26
    })
    local u33 = u4:playSound(u14.RAGEBLADE_KILL_EFFECT, {
        ["position"] = u26:GetPivot().Position
    })
    local u34 = u3:playAnimation(u26:FindFirstChild("Humanoid"):FindFirstChild("Animator"), u13:getAssetId(u12.ASCEND), {
        ["looped"] = false
    })
    task.delay(0.5, function() --[[ Line: 69 ]]
        --[[
        Upvalues:
            [1] = u34
        --]]
        local v35 = u34
        if v35 ~= nil then
            v35:AdjustSpeed(0)
        end
    end)
    u24:GiveTask(function() --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        if u33 then
            u33:Destroy()
        end
    end)
    u24:GiveTask(function() --[[ Line: 80 ]]
        --[[
        Upvalues:
            [1] = u34
        --]]
        if u34 then
            u34:Destroy()
        end
    end)
    local u36 = 0
    local u37 = false
    local u38 = false
    local v39 = u29:GetPivot().Position
    local v40 = u21.startDistanceAbove
    local v41 = Vector3.new(0, v40, 0)
    local u42 = CFrame.new(v39 - v41)
    u24:GiveTask(u9.Heartbeat:Connect(function(p43) --[[ Line: 93 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u21
            [3] = u29
            [4] = u42
            [5] = u38
            [6] = u28
            [7] = u37
            [8] = u8
            [9] = u11
            [10] = u26
            [11] = u24
        --]]
        u36 = u36 + p43
        if u36 > u21.swordFallTime then
            local v44 = u29:GetPivot()
            local v45 = (u36 - u21.swordFallTime) / (2 - u21.swordFallTime)
            local v46 = (v44 * CFrame.Angles(0, 0.5235987755982988 * math.sqrt(v45), 0)):Lerp(u42, (math.sqrt(v45)))
            u29:PivotTo(v46)
            if u38 or (v44.Position - v46.Position).Magnitude < 3 then
                u38 = true
                for _, v47 in u28 do
                    local v48 = v47.part:GetPivot().Position + v47.velocity * (p43 * 4.5)
                    v47.part:PivotTo(CFrame.new(v48))
                end
                if not u37 then
                    u37 = true
                    local v49 = u8.Assets.Effects.RageBladeKillEffect.ExplosionParticles:Clone()
                    v49.Parent = u11
                    v49:PivotTo(u26:GetPivot())
                    u24:GiveTask(v49)
                end
            end
        end
        if u36 > 3 then
            u24:DoCleaning()
        end
    end))
    task.delay(2, function() --[[ Line: 130 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u27
        --]]
        for v50, v51 in u27 do
            local _ = v50 - 1
            u10:Create(v51, TweenInfo.new(0.33), {
                ["Transparency"] = 1
            }):Play()
        end
    end)
    return u24
end
function u16.createStatue(_, p52, p53) --[[ Line: 142 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v54 = p52:Clone()
    v54:PivotTo(p53)
    local v55 = {}
    for _, v56 in v54:GetDescendants() do
        if v56:IsA("BasePart") then
            v56.Material = Enum.Material.SmoothPlastic
            u10:Create(v56, TweenInfo.new(0.4), {
                ["Color"] = Color3.fromRGB(248, 217, 109)
            }):Play()
            if v56:IsA("MeshPart") then
                v56.TextureID = ""
            end
            if v56.Name == "Head" then
                v56.Material = Enum.Material.Neon
            end
            table.insert(v55, v56)
        elseif v56:IsA("Texture") then
            v56:Destroy()
        elseif v56:IsA("Shirt") then
            v56:Destroy()
        end
    end
    return { v54, v55 }
end
function u16.getBodyParts(_, p57) --[[ Line: 168 ]]
    local v58 = math.random(-6.283185307179586, 6.283185307179586)
    local v59 = math.random() * 5 + 5
    local v60 = {}
    for _, v61 in p57:GetChildren() do
        if v61:IsA("BasePart") then
            for _, v62 in v61:GetChildren() do
                if v62:IsA("Motor6D") then
                    v62:Destroy()
                end
            end
            v61.Anchored = true
            local v63 = {
                ["part"] = v61
            }
            local v64 = (Vector3.new(3, 10, 0)).Unit
            local v65 = 5 + math.random() * 5
            local v66 = v59 * math.cos(v58)
            local v67 = 5 + 5 * math.random()
            local v68 = v59 * math.sin(v58)
            local v69 = Vector3.new(v66, v67, v68)
            local v70 = v61.Mass
            v63.velocity = v64 * v65 + v69 * v70
            table.insert(v60, v63)
        end
    end
    return v60
end
return u16