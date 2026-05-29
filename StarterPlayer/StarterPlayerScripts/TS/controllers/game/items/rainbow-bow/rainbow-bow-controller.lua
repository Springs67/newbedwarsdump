local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.ReplicatedStorage
local u6 = v4.TweenService
local u7 = v4.Workspace
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u13 = {
    Color3.fromRGB(255, 115, 115),
    Color3.fromRGB(255, 188, 105),
    Color3.fromRGB(251, 255, 124),
    Color3.fromRGB(150, 255, 129),
    Color3.fromRGB(101, 201, 255),
    Color3.fromRGB(140, 120, 255),
    Color3.fromRGB(255, 139, 255)
}
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "RainbowBowController"
    end,
    ["__index"] = u9
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
function u14.constructor(p17) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p17)
    p17.Name = "RainbowBowController"
end
function u14.KnitStart(u18) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
        [3] = u3
        [4] = u10
    --]]
    u9.KnitStart(u18)
    u8.ProjectileRender:connect(function(p19) --[[ Line: 36 ]]
        if p19.projectile.Name == "rainbow_arrow" then
            p19.cframe = p19.cframe * CFrame.Angles(0, p19.totalTime * 0.5 * 3.141592653589793, 0)
        end
    end)
    u8.ProjectileLaunched:connect(function(p20) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u3
        --]]
        if p20.projectile.Name ~= "rainbow_arrow" then
            return nil
        end
        if not p20:isLocalShooter() then
            return nil
        end
        if u3.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
            local v21 = p20.projectile:FindFirstChild("Handle")
            if v21 ~= nil then
                for v22, v23 in v21:GetChildren() do
                    local _ = v22 - 1
                    if v23:IsA("Trail") then
                        v23.Lifetime = v23.Lifetime / 2
                        v23.Transparency = NumberSequence.new(0.6)
                    end
                end
            end
        end
    end)
    u10.Client:WaitFor("RainbowExplode"):andThen(function(p24) --[[ Line: 69 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        p24:Connect(function(p25) --[[ Line: 70 ]]
            --[[
            Upvalues:
                [1] = u18
            --]]
            u18:playExplosion(p25.position, 2, Color3.fromRGB(255, 255, 255))
            u18:playSplitEffects(p25.position, p25.offsets, p25.duration, p25.explosionDelay)
        end)
    end)
end
function u14.playExplosion(_, p26, p27, p28) --[[ Line: 77 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u12
        [4] = u2
        [5] = u11
    --]]
    local u29 = u5.Assets.Effects.RainbowExplosion:Clone()
    u29.Parent = u7
    for v30, v31 in u29.ParticleAttachment:GetChildren() do
        local _ = v30 - 1
        if v31.Name == "Color" then
            v31.Color = ColorSequence.new(p28)
        end
    end
    u12:playEffects({ u29 }, nil, {
        ["sizeMultiplier"] = p27
    })
    u29:PivotTo(CFrame.new(p26))
    u2:playSound(u11.RAINBOW_EXPLODE, {
        ["rollOffMaxDistance"] = 300,
        ["position"] = p26
    })
    task.delay(2, function() --[[ Line: 98 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        u29:Destroy()
    end)
end
function u14.playSplitEffects(u32, p33, p34, u35, u36) --[[ Line: 102 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u13
        [3] = u7
        [4] = u6
    --]]
    local u37 = 0
    local v38 = false
    while true do
        if v38 then
            u37 = u37 + 1
        else
            v38 = true
        end
        if u37 >= #p34 then
            return
        end
        local u39 = u5.Assets.Misc.RainbowSplit:Clone()
        local u40 = u13[u37 + 1] or u13[1]
        u39.CFrame = CFrame.new(p33)
        local u41 = u39:FindFirstChild("Neon")
        u41.Color = u40
        u41.CFrame = CFrame.new(p33)
        u41:FindFirstChild("Trail").Color = ColorSequence.new(u40)
        u39.Parent = u7
        local u42 = u41.Position + p34[u37 + 1]
        local u43 = u42 - Vector3.new(1, 3, -1)
        local u44 = u42 - Vector3.new(-1, 2, 1)
        task.spawn(function() --[[ Line: 135 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u36
                [3] = u6
                [4] = u41
                [5] = u35
                [6] = u43
                [7] = u44
                [8] = u42
            --]]
            task.wait(u37 * u36)
            u6:Create(u41, TweenInfo.new(u35 / 3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                ["Position"] = u43,
                ["Size"] = u41.Size * 0.1
            }):Play()
            task.wait(u35 / 3)
            u6:Create(u41, TweenInfo.new(u35 / 3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                ["Position"] = u44,
                ["Size"] = u41.Size * 0.1
            }):Play()
            task.wait(u35 / 3)
            u6:Create(u41, TweenInfo.new(u35 / 3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                ["Position"] = u42,
                ["Size"] = u41.Size * 0.1
            }):Play()
        end)
        task.delay(u35 + u37 * u36, function() --[[ Line: 153 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u42
                [3] = u40
                [4] = u39
            --]]
            u32:playExplosion(u42, 1, u40)
            u39:Destroy()
        end)
    end
end
u3.CreateController(u14.new())
return nil