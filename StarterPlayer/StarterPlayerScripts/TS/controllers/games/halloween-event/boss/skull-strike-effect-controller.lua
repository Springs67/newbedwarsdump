local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.Workspace
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "SkullStrikeEffectController"
    end,
    ["__index"] = u10
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
        [1] = u10
    --]]
    u10.constructor(p18)
    p18.Name = "SkullStrikeEffectController"
end
function u15.KnitStart(p19) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u11
        [3] = u2
        [4] = u12
        [5] = u8
        [6] = u5
        [7] = u7
        [8] = u14
        [9] = u9
        [10] = u4
        [11] = u13
    --]]
    u10.KnitStart(p19)
    u11.Client:Get("SkullStrike"):Connect(function(u20, u21, u22, p23) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u12
            [3] = u8
            [4] = u5
            [5] = u7
            [6] = u14
            [7] = u9
            [8] = u4
            [9] = u13
        --]]
        u2:playSound(u12.HALLOWEEN_BOSS_CAST, {
            ["rollOffMaxDistance"] = 200,
            ["rollOffMinDistance"] = 10,
            ["position"] = u21,
            ["playbackSpeedMultiplier"] = math.random() * 0.1 + 0.95
        })
        local v24 = {
            ["CFrame"] = CFrame.new(u20) * CFrame.Angles(0, 0, 1.5707963267948966),
            ["Anchored"] = true,
            ["CanCollide"] = false,
            ["CanQuery"] = false,
            ["Shape"] = Enum.PartType.Cylinder
        }
        local v25 = u22 * 2
        local v26 = u22 * 2
        v24.Size = Vector3.new(0.5, v25, v26)
        v24.Material = Enum.Material.ForceField
        v24.Transparency = 0.2
        v24.Color = Color3.fromRGB(255, 41, 0)
        v24.Parent = u8
        local u27 = u5("Part", v24)
        local u28 = u27:Clone()
        u28.Material = Enum.Material.Neon
        u28.Size = Vector3.new(0.6, 0, 0)
        u28.Transparency = 0.6
        u28.Parent = u8
        local v29 = p23 - u8:GetServerTimeNow()
        local v30 = math.max(v29, 0.1)
        local u31 = u7.Assets.Misc.HalloweenSkull:Clone()
        for v32, v33 in u31:GetDescendants() do
            local _ = v32 - 1
            if v33:IsA("BasePart") then
                v33.CanCollide = false
                v33.CanQuery = false
            end
        end
        u31:PivotTo(CFrame.new(u21))
        u14.scaleModel(u31, u22 * 0.6 / 0.8)
        u31.Parent = u8
        local u34 = (math.random() < 0.5 and -1 or 1) * (0.5235987755982988 + math.random() * 0.5235987755982988)
        local u35 = u31:GetPrimaryPartCFrame().Position
        u9(v30, u4, function(p36) --[[ Line: 80 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u22
                [3] = u31
                [4] = u20
                [5] = u21
                [6] = u34
                [7] = u35
            --]]
            if u28.Parent then
                local v37 = u28
                local v38 = p36 * u22 * 2
                local v39 = p36 * u22 * 2
                v37.Size = Vector3.new(0.6, v38, v39)
            end
            if u31.Parent then
                local v40 = u20 - u21
                local v41 = CFrame.lookAt(Vector3.new(0, 0, 0), v40) * CFrame.Angles(-1.5707963267948966, 0, 0) * CFrame.Angles(0, u34, 0) * Vector3.new(0, 0, 1)
                local v42 = u21
                local v43 = (u20 - u21) * p36 + v42
                local v44 = 9.87 * p36
                local v45 = math.pow(v44, 0.5)
                local v46 = v43 + v41 * (math.sin(v45) * 0.16666666666666666 * v40.Magnitude)
                local v47 = u31
                local v48 = v46 - u35
                v47:PivotTo(CFrame.new(v46, v46 + v48) * CFrame.Angles(0, 1.5707963267948966, 0))
                u35 = v46
            end
        end)
        task.delay(v30, function() --[[ Line: 112 ]]
            --[[
            Upvalues:
                [1] = u31
                [2] = u28
                [3] = u27
                [4] = u7
                [5] = u20
                [6] = u8
                [7] = u2
                [8] = u12
                [9] = u13
                [10] = u22
            --]]
            u31:Destroy()
            u28:Destroy()
            u27:Destroy()
            local v49 = u7.Assets.Effects.HalloweenExplosion:Clone()
            v49.Position = u20
            v49.Parent = u8
            u2:playSound(u12.HALLOWEEN_BOSS_RUNE_EXPLODE, {
                ["rollOffMaxDistance"] = 200,
                ["rollOffMinDistance"] = 10,
                ["position"] = u20,
                ["playbackSpeedMultiplier"] = math.random() * 0.1 + 0.95
            })
            u13:playEffects({ v49 }, nil, {
                ["destroyAfterSec"] = 4,
                ["sizeMultiplier"] = 1.2 * u22 / 12
            })
        end)
    end)
end
v3.CreateController(u15.new())
return nil