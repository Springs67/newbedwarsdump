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
        return "MeteorBreakBedEffect"
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
    u14.constructor(p18, u11.METEOR)
    p18.Name = "MeteorBreakBedEffect"
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
    local v26 = math.random(-20, 20)
    local v27 = math.random
    local v28 = v25 + Vector3.new(v26, 45, v27(-20, 20))
    local u29 = u7.Assets.Effects.Meteor:Clone()
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
    local v34 = u33:FindFirstChild("SurfaceGui")
    if v34 ~= nil then
        v34 = v34:FindFirstChild("ImageLabel")
    end
    v34.ImageTransparency = 1
    if v34 then
        u9:Create(v34, TweenInfo.new(1, Enum.EasingStyle.Linear), {
            ["ImageTransparency"] = 0.6
        }):Play()
    end
    local u35 = u3.Controllers.BreakBedEffectUtilController:createBedClone(p22)
    local u36
    if u35 == nil then
        u36 = u35
    else
        u36 = u35:WaitForChild("Root", 1)
    end
    u35:PivotTo(u21)
    u20.maid:GiveTask(u35)
    if u35 and u36 then
        u35.Parent = u10
        local v37 = u35:FindFirstChild("Root")
        if v37 ~= nil then
            for v38, v39 in v37:GetChildren() do
                local _ = v38 - 1
                if v39:IsA("BasePart") then
                    v39.Transparency = 0.55
                end
            end
        end
        u20.maid:GiveTask(task.delay(1, function() --[[ Line: 98 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u36
                [3] = u35
            --]]
            u20:createBedDebris(u36, true)
            u35:Destroy()
            u35.Parent = nil
        end))
    end
    local u40 = u5("Part", {
        ["Anchored"] = true,
        ["Name"] = "Meteor",
        ["Size"] = Vector3.new(2, 2, 2),
        ["CanCollide"] = false,
        ["CastShadow"] = false,
        ["CFrame"] = u30,
        ["Color"] = Color3.fromRGB(42, 42, 42),
        ["Material"] = Enum.Material.Rock,
        ["Parent"] = u29
    })
    local v41 = u5("PointLight", {
        ["Brightness"] = 10,
        ["Range"] = 8,
        ["Shadows"] = false,
        ["Enabled"] = true,
        ["Color"] = Color3.fromRGB(255, 99, 37),
        ["Parent"] = u40
    })
    u20.maid:GiveTask(u40)
    u20.maid:GiveTask(v41)
    u9:Create(u40, TweenInfo.new(1, Enum.EasingStyle.Quad), {
        ["Size"] = Vector3.new(5, 5, 5)
    }):Play()
    local v42 = u2:playSound(u12.METEOR_COSMIC_LOOP, {
        ["looped"] = true,
        ["position"] = u21.Position
    })
    if v42 then
        u2:tweenSoundVolume(v42, 5, 1)
        u24:GiveTask(v42)
    end
    local u43 = v23:NextNumber(0.2, 0.5)
    local u44 = v23:NextNumber(0.2, 0.5)
    local u45 = v23:NextNumber(0.2, 0.5)
    local u46 = 0
    u29:PivotTo(u30)
    u24:GiveTask(u8.Heartbeat:Connect(function(p47) --[[ Line: 142 ]]
        --[[
        Upvalues:
            [1] = u46
            [2] = u30
            [3] = u21
            [4] = u10
            [5] = u31
            [6] = u32
            [7] = u29
            [8] = u43
            [9] = u44
            [10] = u45
            [11] = u40
            [12] = u24
        --]]
        u46 = u46 + p47
        local v48 = u30:Lerp(u21, (u10:GetServerTimeNow() - u31) / (u32 - u31))
        u29:PivotTo(CFrame.new(v48.Position, u21.Position) * CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966))
        u40.CFrame = v48 * CFrame.Angles(u46 * 3.141592653589793 * 2 * u43, u46 * 3.141592653589793 * 2 * u44, u46 * 3.141592653589793 * 2 * u45)
        if u32 <= u10:GetServerTimeNow() then
            u24:DoCleaning()
        end
    end))
    u24:GiveTask(function() --[[ Line: 157 ]]
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
        task.spawn(function() --[[ Line: 158 ]]
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
            local v49 = not u10.CurrentCamera and 0 or (u21.Position - u10.CurrentCamera.CFrame.Position).Magnitude
            local v50 = u7.Assets.Effects.MeteorHitEffect:Clone()
            v50.CFrame = u21
            v50.Parent = u10
            u13:playEffects({ v50 }, nil, {
                ["destroyAfterSec"] = 3,
                ["particleMultiplier"] = v49 > 200 and 0.2 or 1
            })
            u20.maid:GiveTask(v50)
            u20.maid:GiveTask(u2:playSound(u12.TNT_EXPLODE_1, {
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