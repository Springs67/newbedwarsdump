local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.ReplicatedStorage
local u6 = v4.Workspace
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "EggLauncherController"
    end,
    ["__index"] = u8
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
function u11.constructor(p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p14)
    p14.Name = "EggLauncherController"
end
function u11.KnitStart(p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
        [3] = u5
        [4] = u6
        [5] = u2
        [6] = u10
        [7] = u7
    --]]
    u8.KnitStart(p15)
    u9.Client:Get("EggExplode"):Connect(function(u16) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u6
            [3] = u2
            [4] = u10
        --]]
        local u17 = u5.Assets.Effects.EggExplosion:Clone()
        u17.Parent = u6
        u17.Position = u16.position
        u2:playSound(u10.GLUE_ENCHANT_01, {
            ["rollOffMaxDistance"] = 220,
            ["volumeMultiplier"] = 2,
            ["position"] = u16.position
        })
        u2:playSound(u10.EGG_EXPLOSION, {
            ["rollOffMaxDistance"] = 220,
            ["position"] = u16.position
        })
        for v18, v19 in u17:GetDescendants() do
            local _ = v18 - 1
            if v19:IsA("ParticleEmitter") then
                v19:Emit(30)
            end
        end
        local v20 = false
        local v21 = 0
        while true do
            if v20 then
                v21 = v21 + 1
            else
                v20 = true
            end
            if v21 >= math.random() * 2 + 3 then
                task.delay(1, function() --[[ Line: 81 ]]
                    --[[
                    Upvalues:
                        [1] = u17
                    --]]
                    u17:Destroy()
                end)
                return
            end
            task.spawn(function() --[[ Line: 67 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u6
                    [3] = u16
                --]]
                local v22 = u5.Assets.Effects.EasterEggDebris:Clone()
                v22.Parent = u6
                v22.Position = u16.position
                local v23 = math.random() * 3.141592653589793 * 2
                local v24 = math.cos(v23) * 20
                local v25 = math.sin(v23) * 20
                v22:ApplyImpulse(Vector3.new(v24, 50, v25) * v22.Mass)
                task.wait(1)
                v22:Destroy()
            end)
        end
    end)
    u7.ProjectileRender:connect(function(p26) --[[ Line: 85 ]]
        if p26.projectile.Name == "easter_egg" then
            p26.cframe = p26.cframe * CFrame.Angles(0, 0, p26.totalTime * 3.141592653589793)
        end
    end)
end
v3.CreateController(u11.new())
return nil