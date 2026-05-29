local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u4 = v3.InExpo
local u5 = v3.OutExpo
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.ReplicatedStorage
local u10 = v8.TweenService
local u11 = v8.Workspace
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil
local u15 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local function u22(p16, p17) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v18 = false
    local v19 = 0
    while true do
        if v18 then
            v19 = v19 + 1
        else
            v18 = true
        end
        if v19 >= #p17 then
            return
        end
        local v20 = p17[v19 + 1].color
        local v21 = p17[v19 + 1].time
        u10:Create(p16, TweenInfo.new(v21), {
            ["Color"] = v20
        }):Play()
        task.wait(p17[v19 + 1].time)
    end
end
local u23 = {
    {
        ["time"] = 0.3,
        ["color"] = Color3.fromRGB(194, 212, 250)
    },
    {
        ["time"] = 0.3,
        ["color"] = Color3.fromRGB(13, 105, 172)
    },
    {
        ["time"] = 0.5,
        ["color"] = Color3.fromRGB(51, 92, 168)
    }
}
local u24 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 56 ]]
        return "AtomicKillEffect"
    end,
    ["__index"] = u15
})
u24.__index = u24
function u24.new(...) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    local v25 = u24
    local v26 = setmetatable({}, v25)
    return v26:constructor(...) or v26
end
function u24.constructor(p27, p28) --[[ Line: 66 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.constructor(p27, p28)
    u15.setPlayDefaultKillEffect(p27, false)
end
function u24.onKill(p29, _, p30, p31) --[[ Line: 70 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u9
        [3] = u11
        [4] = u15
        [5] = u7
        [6] = u2
        [7] = u13
        [8] = u22
        [9] = u23
        [10] = u12
        [11] = u5
        [12] = u14
        [13] = u10
        [14] = u4
    --]]
    local u32 = u6.new()
    p30.Archivable = true
    local u33 = p30:Clone()
    u33:PivotTo(p31)
    local u34 = u9.Assets.Effects.AtomicBall:Clone()
    u34.Parent = u11
    u32:GiveTask(u34)
    u34:PivotTo(u33:GetPivot())
    u33.Parent = u11
    u32:GiveTask(u33)
    local u35 = {}
    for _, v36 in u33:GetDescendants() do
        if v36:IsA("BasePart") then
            table.insert(u35, v36)
        end
    end
    u15.hideCharacter(p29, p30)
    u7("PointLight", {
        ["Brightness"] = 0.3,
        ["Range"] = 5,
        ["Shadows"] = false,
        ["Enabled"] = true,
        ["Color"] = Color3.fromRGB(191, 222, 255),
        ["Parent"] = u33
    })
    local u37 = u2:playSound(u13.ATOMIC_SHRINK, {
        ["position"] = u33:GetPivot().Position
    })
    u32:GiveTask(function() --[[ Line: 100 ]]
        --[[
        Upvalues:
            [1] = u37
        --]]
        if u37 then
            u37:Destroy()
        end
    end)
    local u38 = u34:WaitForChild("Frame")
    u34.PrimaryPart = u38
    local v39 = 0
    local u40 = {}
    for v41, v42 in u34:WaitForChild("Container"):GetChildren() do
        local _ = v41 - 1
        if v42:IsA("BasePart") == true then
            v39 = v39 + 1
            u40[v39] = v42
        end
    end
    for _, u43 in u40 do
        task.delay(0.7000000000000001, function() --[[ Line: 127 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u43
                [3] = u23
            --]]
            u22(u43, u23)
        end)
    end
    local v44 = u34:GetPivot()
    local v45 = u33:GetPivot()
    u12(0.8, u5, function(p46) --[[ Line: 134 ]]
        --[[
        Upvalues:
            [1] = u34
        --]]
        u34:PivotTo(p46)
    end, v44, v44 * CFrame.Angles(0, 5.235987755982989, 0)):Play()
    u12(0.8, u5, function(p47) --[[ Line: 139 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        u33:PivotTo(p47)
    end, v45, v45 + Vector3.new(0, 0.3, 0)):Play()
    u14.tweenModelSize(u34, 0.8, u5, 3.3)
    for _, v48 in u40 do
        u10:Create(v48, TweenInfo.new(0.8), {
            ["Transparency"] = 0
        }):Play()
    end
    task.delay(0.8, function() --[[ Line: 152 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u34
            [3] = u4
            [4] = u33
            [5] = u10
            [6] = u12
            [7] = u35
            [8] = u38
            [9] = u40
        --]]
        u14.tweenModelSize(u34, 0.75, u4, 0)
        u14.tweenModelSize(u33, 0.75, u4, 0.1)
        for _, v49 in u33:GetDescendants() do
            if v49:IsA("BasePart") then
                u10:Create(v49, TweenInfo.new(0.5), {
                    ["Color"] = Color3.fromRGB(120, 173, 252)
                }):Play()
                v49.Material = Enum.Material.Neon
            end
            if v49:IsA("MeshPart") then
                v49.TextureID = ""
            elseif v49:IsA("Texture") then
                v49:Destroy()
            elseif v49:IsA("Shirt") then
                v49:Destroy()
            end
        end
        u12(0.75, u4, function(p50) --[[ Line: 170 ]]
            --[[
            Upvalues:
                [1] = u34
            --]]
            u34:PivotTo(p50)
        end, u34:GetPivot(), u34:GetPivot() * CFrame.Angles(0, -5.235987755982989, 0)):Play()
        for v51, v52 in u35 do
            local _ = v51 - 1
            u10:Create(v52, TweenInfo.new(0.75), {
                ["Transparency"] = 1
            }):Play()
        end
        u10:Create(u38, TweenInfo.new(0.75), {
            ["Transparency"] = 0.25
        }):Play()
        for _, v53 in u40 do
            u10:Create(v53, TweenInfo.new(0.75), {
                ["Transparency"] = 0.5
            }):Play()
        end
    end)
    task.delay(1.55, function() --[[ Line: 195 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u40
        --]]
        for v54, v55 in u40 do
            local _ = v54 - 1
            u10:Create(v55, TweenInfo.new(0.3), {
                ["Transparency"] = 1
            }):Play()
        end
    end)
    task.delay(2, function() --[[ Line: 205 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        u32:DoCleaning()
    end)
    return u32
end
return u24