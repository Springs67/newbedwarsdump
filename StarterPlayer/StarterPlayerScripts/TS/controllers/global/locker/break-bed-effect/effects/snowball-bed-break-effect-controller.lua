local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.RunService
local u9 = v6.TweenService
local u10 = v6.Workspace
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u14 = v1.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "SnowballBreakBedEffect"
    end,
    ["__index"] = u14
})
u15.__index = u15
function u15.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u11
    --]]
    u14.constructor(p18, u11.SNOWBALL)
    p18.Name = "SnowballBreakBedEffect"
end
function u15.KnitStart(p19) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.KnitStart(p19)
end
function u15.onBedBreak(u20, _, u21, p22) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
        [3] = u10
        [4] = u9
        [5] = u3
        [6] = u5
        [7] = u2
        [8] = u12
        [9] = u8
        [10] = u13
    --]]
    local v23 = Random.new(math.random())
    local u24 = u4.new()
    u20.maid:GiveTask(u24)
    local v25 = u21.Position
    local v26 = math.random(-35, 15) + 10
    local v27 = math.random(-35, 15) + 10
    local v28 = v25 + Vector3.new(v26, 45, v27)
    local u29 = u7.Assets.Effects.SnowballEffect:Clone()
    local u30 = CFrame.new(v28, u21.Position)
    local u31 = u10:GetServerTimeNow()
    local u32 = u31 + 1
    u29:PivotTo(u30)
    u29.Parent = u10
    u20.maid:GiveTask(u29)
    local u33 = u7.Assets.Effects.CosmicMeteorIndicator:Clone()
    u33.Position = u21.Position + Vector3.new(0, -1.5, 0) + Vector3.new(0, 0, 0)
    u33.Parent = u10
    u33.Size = Vector3.new(0, 0, 0)
    u9:Create(u33, TweenInfo.new(1, Enum.EasingStyle.Linear), {
        ["Size"] = Vector3.new(6, 0, 6)
    }):Play()
    u20.maid:GiveTask(u33)
    local u34 = u3.Controllers.BreakBedEffectUtilController:createBedClone(p22)
    local u35
    if u34 == nil then
        u35 = u34
    else
        u35 = u34:WaitForChild("Root", 1)
    end
    u34:PivotTo(u21)
    u20.maid:GiveTask(u34)
    if u34 and u35 then
        u34.Parent = u10
        local v36 = u34:FindFirstChild("Root")
        if v36 ~= nil then
            for v37, v38 in v36:GetChildren() do
                local _ = v37 - 1
                if v38:IsA("BasePart") then
                    v38.Transparency = 0.55
                end
            end
        end
        u20.maid:GiveTask(task.delay(1, function() --[[ Line: 87 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u35
                [3] = u34
            --]]
            u20:createBedDebris(u35, false)
            u34:Destroy()
            u34.Parent = nil
        end))
    end
    local v39 = u5("PointLight", {
        ["Brightness"] = 10,
        ["Range"] = 8,
        ["Shadows"] = false,
        ["Enabled"] = true,
        ["Color"] = Color3.fromRGB(255, 99, 37),
        ["Parent"] = u29.PrimaryPart
    })
    u20.maid:GiveTask(v39)
    u9:Create(u29.PrimaryPart, TweenInfo.new(1, Enum.EasingStyle.Quad), {
        ["Size"] = Vector3.new(10, 10, 10)
    }):Play()
    local v40 = u2:playSound(u12.SNOWBALL_FALL, {
        ["looped"] = false,
        ["position"] = u21.Position
    })
    if v40 then
        u2:tweenSoundVolume(v40, 5, 1)
        u24:GiveTask(v40)
    end
    v23:NextNumber(0.2, 0.5)
    v23:NextNumber(0.2, 0.5)
    v23:NextNumber(0.2, 0.5)
    local u41 = 0
    u29:PivotTo(u30)
    u24:GiveTask(u8.Heartbeat:Connect(function(p42) --[[ Line: 119 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u30
            [3] = u21
            [4] = u10
            [5] = u31
            [6] = u32
            [7] = u29
            [8] = u24
        --]]
        u41 = u41 + p42
        local v43 = u30:Lerp(u21, (u10:GetServerTimeNow() - u31) / (u32 - u31))
        u29:PivotTo(CFrame.new(v43.Position, u21.Position) * CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966))
        if u32 <= u10:GetServerTimeNow() then
            u24:DoCleaning()
        end
    end))
    u24:GiveTask(function() --[[ Line: 130 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u33
            [3] = u10
            [4] = u21
            [5] = u7
            [6] = u21
            [7] = u13
            [8] = u20
            [9] = u2
            [10] = u12
        --]]
        task.spawn(function() --[[ Line: 131 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u33
                [3] = u10
                [4] = u21
                [5] = u7
                [6] = u21
                [7] = u13
                [8] = u20
                [9] = u2
                [10] = u12
            --]]
            u29:Destroy()
            u33:Destroy()
            local v44 = not u10.CurrentCamera and 0 or (u21.Position - u10.CurrentCamera.CFrame.Position).Magnitude
            local v45 = u7.Assets.Effects.SnowExplosion:Clone()
            v45.CFrame = u21
            v45.Parent = u10
            u13:playEffects({ v45 }, nil, {
                ["destroyAfterSec"] = 3,
                ["particleMultiplier"] = v44 > 200 and 0.2 or 1
            })
            u20.maid:GiveTask(v45)
            u20.maid:GiveTask(u2:playSound(u12.SNOWBALL_CRUSH, {
                ["rollOffMaxDistance"] = 300,
                ["position"] = u21.Position
            }))
            u20.maid:GiveTask(u2:playSound(u12.CARROT_LAUNCHER_IMPACT, {
                ["rollOffMaxDistance"] = 300,
                ["position"] = u21.Position
            }))
        end)
    end)
end
u3.CreateController(u15.new())
return nil