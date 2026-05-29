local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.ReplicatedStorage
local u6 = v4.TweenService
local u7 = v4.Workspace
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "PumpkinBombController"
    end,
    ["__index"] = u8
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p15)
    p15.Name = "PumpkinBombController"
    p15.miniPumpkinCount = 3
end
function u12.KnitStart(u16) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
    --]]
    u8.KnitStart(u16)
    u9.Client:WaitFor("PumpkinExplode"):andThen(function(p17) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        p17:Connect(function(p18) --[[ Line: 36 ]]
            --[[
            Upvalues:
                [1] = u16
            --]]
            u16:playExplosion(p18.position)
            u16:playMiniEffects(p18.position)
        end)
    end)
end
function u12.playExplosion(_, p19) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u11
    --]]
    local u20 = u5.Assets.Effects.Explosion:Clone()
    u20.Parent = u7
    u11:playEffects({ u20 }, nil, {
        ["sizeMultiplier"] = 1
    })
    u20.CFrame = CFrame.new(p19)
    task.delay(2, function() --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        u20:Destroy()
    end)
end
function u12.playMiniEffects(u21, p22) --[[ Line: 63 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u6
        [4] = u2
        [5] = u10
    --]]
    local u23 = 0
    local v24 = false
    local v25 = { Vector3.new(0, 5, 0), Vector3.new(6, 2, 3), Vector3.new(-6, 2, -3) }
    while true do
        if v24 then
            u23 = u23 + 1
        else
            v24 = true
        end
        if u23 >= u21.miniPumpkinCount then
            return
        end
        local u26 = u5.Assets.Misc.PumpkinBomb:Clone()
        local v27 = u26
        u26.CFrame = CFrame.new(p22)
        local u28 = v27
        for v29, v30 in u26:GetChildren() do
            local _ = v29 - 1
            if v30.Name == "Pumpkin" then
                v27 = v30
                v30.CFrame = CFrame.new(p22)
                u28 = v27
            end
        end
        u26.Parent = u7
        local u31 = u28.Position + v25[u23 + 1]
        task.delay(0.1, function() --[[ Line: 96 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u28
                [3] = u23
                [4] = u31
            --]]
            u6:Create(u28, TweenInfo.new(u23 * 0.55 + 0.55, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut), {
                ["Orientation"] = Vector3.new(90, 180, 90),
                ["Position"] = u31,
                ["Size"] = u28.Size * 2
            }):Play()
        end)
        task.delay(u23 * 0.5 + 0.5, function() --[[ Line: 103 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u31
                [3] = u2
                [4] = u10
                [5] = u26
            --]]
            u21:playExplosion(u31)
            local v32 = {
                ["rollOffMaxDistance"] = 300,
                ["position"] = u31
            }
            u2:playSound(u10.TNT_EXPLODE_1, v32)
            u26:Destroy()
        end)
    end
end
v3.CreateController(u12.new())
return nil