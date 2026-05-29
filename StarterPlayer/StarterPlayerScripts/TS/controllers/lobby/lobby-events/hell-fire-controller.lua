local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u6 = v5.KnitClient
local u7 = v5.KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Lighting
local u13 = v11.Players
local u14 = v11.ReplicatedStorage
local u15 = v11.RunService
local u16 = v11.Workspace
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 38 ]]
        return "HellFireController"
    end,
    ["__index"] = u18
})
u22.__index = u22
function u22.new(...) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(p25) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u10
        [3] = u16
    --]]
    u18.constructor(p25)
    p25.Name = "HellFireController"
    p25.meteorsFolder = u10("Folder", {
        ["Name"] = "Meteors",
        ["Parent"] = u16
    })
    p25.shardMap = {}
end
function u22.KnitStart(u26) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u6
        [3] = u20
        [4] = u19
        [5] = u17
        [6] = u8
        [7] = u10
        [8] = u12
        [9] = u9
        [10] = u14
        [11] = u15
        [12] = u16
        [13] = u21
        [14] = u4
        [15] = u3
        [16] = u7
        [17] = u13
    --]]
    u18.KnitStart(u26)
    u6.Controllers.PreloadController:runPreload({
        ["sounds"] = {
            u20.METEOR_LOBBY_MUSIC,
            u20.EXPLODING_TANK_BLOCK_EXPLODE_1,
            u20.EXPLODING_TANK_BLOCK_EXPLODE_2,
            u20.EXPLODING_TANK_BLOCK_EXPLODE_3,
            u20.METEOR_HITS,
            u20.METEOR_LOOP
        }
    })
    u19.Client:Get("LobbyMeteorStart"):Connect(function(p27) --[[ Line: 64 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u20
            [3] = u17
            [4] = u8
            [5] = u26
            [6] = u10
            [7] = u12
        --]]
        if p27.cleanUp then
            u6.Controllers.BackgroundMusicController:stopMusic()
            u6.Controllers.BackgroundMusicController:startMusic(u20.LOBBY_MUSIC)
            u17(4, u8, function(p28) --[[ Line: 68 ]]
                --[[
                Upvalues:
                    [1] = u26
                --]]
                if u26.colorCorrectionEffect then
                    u26.colorCorrectionEffect.Brightness = -0.05 * p28
                    u26.colorCorrectionEffect.Contrast = 0.05 * p28
                    u26.colorCorrectionEffect.TintColor = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(255, 255, 255), p28)
                end
                if u26.atmosphereEffect then
                    u26.atmosphereEffect.Color = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(25, 0, 54), p28)
                    u26.atmosphereEffect.Decay = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(37, 12, 50), p28)
                    u26.atmosphereEffect.Glare = 1 * p28
                    u26.atmosphereEffect.Haze = 4.5 * p28
                end
            end, 1, 0)
        else
            u6.Controllers.BackgroundMusicController:stopMusic()
            local v29 = u6.Controllers.BackgroundMusicController:startMusic(u20.METEOR_LOBBY_MUSIC)
            if v29 then
                local v30 = v29.track
                v30.Volume = v30.Volume * 0.5
            end
            u26.colorCorrectionEffect = u10("ColorCorrectionEffect", {
                ["Parent"] = u12
            })
            u26.atmosphereEffect = u12:FindFirstChildWhichIsA("Atmosphere") or u10("Atmosphere", {
                ["Parent"] = u12
            })
            u17(5, u8, function(p31) --[[ Line: 95 ]]
                --[[
                Upvalues:
                    [1] = u26
                --]]
                if u26.colorCorrectionEffect then
                    u26.colorCorrectionEffect.Brightness = -0.05 * p31
                    u26.colorCorrectionEffect.Contrast = 0.05 * p31
                    u26.colorCorrectionEffect.TintColor = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(255, 143, 110), p31)
                end
                if u26.atmosphereEffect then
                    u26.atmosphereEffect.Color = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(25, 0, 54), p31)
                    u26.atmosphereEffect.Decay = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(37, 12, 50), p31)
                    u26.atmosphereEffect.Glare = p31
                    u26.atmosphereEffect.Haze = 4.5 * p31
                end
            end, 0, 1)
        end
    end)
    u19.Client:Get("MeteorShardDestroy"):Connect(function(p32) --[[ Line: 131 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        local v33 = u26.shardMap[p32.secret]
        if v33 ~= nil then
            v33:Destroy()
        end
        u26.shardMap[p32.secret] = nil
    end)
    u19.Client:GetNamespace("Disaster"):OnEvent("SpawnMeteor", function(p34, u35, u36, u37, p38, p39) --[[ Line: 142 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u14
            [3] = u26
            [4] = u10
            [5] = u20
            [6] = u15
            [7] = u16
            [8] = u21
            [9] = u4
        --]]
        local v40 = Random.new(p38)
        local u41 = u9.new()
        local u42 = CFrame.new(p34) * CFrame.Angles(v40:NextNumber() * 3.141592653589793 * 2, v40:NextNumber() * 3.141592653589793 * 2, v40:NextNumber() * 3.141592653589793 * 2)
        local u43 = CFrame.new(u35)
        local u44 = u14.Assets.Effects.Meteor:Clone()
        u44:PivotTo(u42)
        u44.Parent = u26.meteorsFolder
        local u45 = u10("Part", {
            ["Anchored"] = true,
            ["Name"] = "Meteor",
            ["Size"] = Vector3.new(4, 4, 4),
            ["CanCollide"] = false,
            ["CFrame"] = u42,
            ["Color"] = Color3.fromRGB(0, 0, 0),
            ["Material"] = Enum.Material.Rock,
            ["Parent"] = u44
        })
        if p39 then
            local u46 = u10("Sound", {
                ["RollOffMinDistance"] = 20,
                ["RollOffMaxDistance"] = 60,
                ["Volume"] = 0.5,
                ["Playing"] = false,
                ["SoundId"] = u20.METEOR_LOOP,
                ["Parent"] = u45
            })
            task.delay(u37 - u36 - 3, function() --[[ Line: 171 ]]
                --[[
                Upvalues:
                    [1] = u46
                --]]
                u46:Play()
            end)
        end
        local u47 = v40:NextNumber(0.2, 0.5)
        local u48 = v40:NextNumber(0.2, 0.5)
        local u49 = v40:NextNumber(0.2, 0.5)
        local u50 = 0
        u41:GiveTask(u15.Heartbeat:Connect(function(p51) --[[ Line: 182 ]]
            --[[
            Upvalues:
                [1] = u50
                [2] = u42
                [3] = u43
                [4] = u16
                [5] = u36
                [6] = u37
                [7] = u35
                [8] = u44
                [9] = u47
                [10] = u48
                [11] = u49
                [12] = u45
                [13] = u41
            --]]
            u50 = u50 + p51
            local v52 = u42:Lerp(u43, (u16:GetServerTimeNow() - u36) / (u37 - u36))
            local v53 = CFrame.new(v52.Position, u35) * CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966)
            u44:PivotTo(v53)
            u45.CFrame = v53 * CFrame.Angles(u50 * 3.141592653589793 * 2 * u47, u50 * 3.141592653589793 * 2 * u48, u50 * 3.141592653589793 * 2 * u49)
            if u37 <= u16:GetServerTimeNow() then
                u41:DoCleaning()
            end
        end))
        u41:GiveTask(function() --[[ Line: 197 ]]
            --[[
            Upvalues:
                [1] = u44
                [2] = u16
                [3] = u35
                [4] = u14
                [5] = u43
                [6] = u26
                [7] = u21
                [8] = u4
                [9] = u20
            --]]
            task.spawn(function() --[[ Line: 198 ]]
                --[[
                Upvalues:
                    [1] = u44
                    [2] = u16
                    [3] = u35
                    [4] = u14
                    [5] = u43
                    [6] = u26
                    [7] = u21
                    [8] = u4
                    [9] = u20
                --]]
                u44:Destroy()
                local v54 = not u16.CurrentCamera and 0 or (u35 - u16.CurrentCamera.CFrame.Position).Magnitude
                local v55 = u14.Assets.Effects.MeteorHitEffect:Clone()
                v55.CFrame = u43
                v55.Parent = u26.meteorsFolder
                u21:playEffects({ v55 }, nil, {
                    ["destroyAfterSec"] = 3,
                    ["particleMultiplier"] = v54 > 200 and 0.2 or 1
                })
                local v56 = {
                    ["rollOffMaxDistance"] = 300,
                    ["position"] = u35
                }
                u4:playSound(u20.TNT_EXPLODE_1, v56)
                local v57 = {
                    ["rollOffMaxDistance"] = 300,
                    ["position"] = u35
                }
                u4:playSound(u20.CARROT_LAUNCHER_IMPACT, v57)
            end)
        end)
    end)
    u19.Client:Get("LargeMeteorSpawned"):Connect(function(u58) --[[ Line: 225 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u4
            [3] = u3
            [4] = u20
            [5] = u14
            [6] = u16
            [7] = u26
            [8] = u10
            [9] = u15
            [10] = u7
            [11] = u13
            [12] = u19
            [13] = u21
        --]]
        local u59 = Random.new(u58.randomFloat)
        local u60 = u9.new()
        u4:playSound(u3.fromList(u20.GUARDIAN_OF_DREAM_PERISH), {
            ["rollOffMinDistance"] = 1,
            ["rollOffMaxDistance"] = 200,
            ["position"] = u58.initialPosition,
            ["rollOffMode"] = Enum.RollOffMode.Linear
        })
        local u61 = CFrame.new(u58.initialPosition) * CFrame.Angles(u59:NextNumber() * 3.141592653589793 * 2, u59:NextNumber() * 3.141592653589793 * 2, u59:NextNumber() * 3.141592653589793 * 2)
        local v62 = u14.Assets.Effects.MeteorSpawnPortal
        if u58.rarity >= 1 then
            v62 = u14.Assets.Effects.CosmicMeteorPortal
        end
        local u63 = v62:Clone()
        u63.Parent = u16
        u63:PivotTo(CFrame.new(u58.initialPosition, u58.impactPosition) * CFrame.Angles(1.5707963267948966, 0, 0))
        local u64 = u58.spawnTime + 2
        task.delay(2, function() --[[ Line: 248 ]]
            --[[
            Upvalues:
                [1] = u63
                [2] = u58
                [3] = u14
                [4] = u61
                [5] = u26
                [6] = u10
                [7] = u20
                [8] = u59
                [9] = u60
                [10] = u15
                [11] = u16
                [12] = u64
                [13] = u7
                [14] = u13
                [15] = u19
                [16] = u4
                [17] = u21
            --]]
            task.delay(1, function() --[[ Line: 249 ]]
                --[[
                Upvalues:
                    [1] = u63
                --]]
                for v65, v66 in u63:GetDescendants() do
                    local _ = v65 - 1
                    if v66:IsA("ParticleEmitter") then
                        v66.Enabled = false
                    end
                end
            end)
            local u67 = CFrame.new(u58.impactPosition)
            local v68 = u14.Assets.Effects.Meteor
            if u58.rarity >= 1 then
                v68 = u14.Assets.Effects.RainbowMeteor
            end
            local u69 = v68:Clone()
            u69:PivotTo(u61)
            u69.Parent = u26.meteorsFolder
            local v70 = u14.Assets.Effects.BigFireMeteor
            if u58.rarity >= 1 then
                v70 = u14.Assets.Effects.BigCosmicMeteor
            end
            local u71 = v70:Clone()
            u71:PivotTo(u61)
            u71.Parent = u69
            u71.Anchored = true
            for v72, v73 in u71:GetChildren() do
                local _ = v72 - 1
                if v73:IsA("MeshPart") then
                    v73.CollisionGroup = "Players"
                end
            end
            u26.shardMap[u58.secret] = u69
            local u74 = u10("Sound", {
                ["RollOffMinDistance"] = 60,
                ["RollOffMaxDistance"] = 120,
                ["Volume"] = 0.25,
                ["Playing"] = true,
                ["Looped"] = true,
                ["SoundId"] = u20.METEOR_LOOP,
                ["Parent"] = u71
            })
            local u75 = u59:NextNumber(0.2, 0.5)
            local u76 = u59:NextNumber(0.2, 0.5)
            local u77 = u59:NextNumber(0.2, 0.5)
            local u78 = 0
            u60:GiveTask(u15.Heartbeat:Connect(function(p79) --[[ Line: 304 ]]
                --[[
                Upvalues:
                    [1] = u78
                    [2] = u61
                    [3] = u67
                    [4] = u16
                    [5] = u64
                    [6] = u58
                    [7] = u69
                    [8] = u75
                    [9] = u76
                    [10] = u77
                    [11] = u71
                    [12] = u60
                --]]
                u78 = u78 + p79
                local v80 = u61:Lerp(u67, (u16:GetServerTimeNow() - u64) / (u58.impactTime - u64))
                local v81 = CFrame.new(v80.Position, u58.impactPosition) * CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966)
                u69:PivotTo(v81)
                u71:PivotTo(v81 * CFrame.Angles(u78 * 3.141592653589793 * 2 * u75, u78 * 3.141592653589793 * 2 * u76, u78 * 3.141592653589793 * 2 * u77))
                if u16:GetServerTimeNow() >= u58.impactTime then
                    u60:DoCleaning()
                end
            end))
            u60:GiveTask(function() --[[ Line: 320 ]]
                --[[
                Upvalues:
                    [1] = u63
                    [2] = u74
                    [3] = u7
                    [4] = u71
                    [5] = u13
                    [6] = u19
                    [7] = u58
                    [8] = u4
                    [9] = u20
                    [10] = u69
                    [11] = u67
                    [12] = u14
                    [13] = u16
                    [14] = u26
                    [15] = u21
                --]]
                task.spawn(function() --[[ Line: 321 ]]
                    --[[
                    Upvalues:
                        [1] = u63
                        [2] = u74
                        [3] = u7
                        [4] = u71
                        [5] = u13
                        [6] = u19
                        [7] = u58
                        [8] = u4
                        [9] = u20
                        [10] = u69
                        [11] = u67
                        [12] = u14
                        [13] = u16
                        [14] = u26
                        [15] = u21
                    --]]
                    u63:Destroy()
                    u74:Destroy()
                    local v82 = {
                        ["ActionText"] = "Open",
                        ["RequiresLineOfSight"] = false,
                        ["MaxActivationDistance"] = 12,
                        ["ClickablePrompt"] = true,
                        ["HoldDuration"] = 2,
                        ["Parent"] = u71
                    }
                    local u83 = u7.Controllers.ProximityPromptController:createProximityPrompt(v82)
                    u83.Triggered:Connect(function(p84) --[[ Line: 333 ]]
                        --[[
                        Upvalues:
                            [1] = u13
                            [2] = u19
                            [3] = u58
                            [4] = u4
                            [5] = u20
                            [6] = u83
                            [7] = u71
                            [8] = u69
                        --]]
                        if p84 == u13.LocalPlayer then
                            u19.Client:Get("MeteorShardCollected"):SendToServer({
                                ["secret"] = u58.secret
                            })
                            u4:playSound(u20.MINER_STONE_BREAK)
                            u83:Destroy()
                            local v85 = u71:WaitForChild("welds", 1)
                            if v85 ~= nil then
                                v85:Destroy()
                            end
                            local v86 = u71:WaitForChild("rewardParticles", 1)
                            if v86 ~= nil then
                                for v87, v88 in v86:GetChildren() do
                                    local _ = v87 - 1
                                    if v88:IsA("ParticleEmitter") then
                                        v88.Enabled = true
                                    end
                                end
                            end
                            task.delay(1, function() --[[ Line: 356 ]]
                                --[[
                                Upvalues:
                                    [1] = u69
                                --]]
                                u69:Destroy()
                            end)
                        end
                    end)
                    u4:playSound(u20.METEOR_HITS, {
                        ["rollOffMinDistance"] = 110,
                        ["rollOffMaxDistance"] = 220,
                        ["position"] = u67.Position
                    })
                    u7.Controllers.ScreenShakeController:shake(u67.Position, Vector3.new(0, -1, 0), {
                        ["magnitude"] = 1,
                        ["cycles"] = 3,
                        ["duration"] = 0.5,
                        ["zMagnitude"] = 0.2
                    })
                    local v89 = u14.Assets.Effects.GroudCrack:Clone()
                    v89.Parent = u69
                    v89.Position = u58.impactPosition + Vector3.new(0, -1, 0)
                    local v90 = not u16.CurrentCamera and 0 or (u58.impactPosition - u16.CurrentCamera.CFrame.Position).Magnitude
                    local v91 = u14.Assets.Effects.MeteorHitEffect:Clone()
                    v91.CFrame = u67
                    v91.Parent = u26.meteorsFolder
                    u21:playEffects({ v91 }, nil, {
                        ["destroyAfterSec"] = 3,
                        ["particleMultiplier"] = v90 > 200 and 0.2 or 1
                    })
                    task.delay(60, function() --[[ Line: 391 ]]
                        --[[
                        Upvalues:
                            [1] = u69
                        --]]
                        u69:Destroy()
                    end)
                end)
            end)
        end)
    end)
end
u6.CreateController(u22.new())
return nil