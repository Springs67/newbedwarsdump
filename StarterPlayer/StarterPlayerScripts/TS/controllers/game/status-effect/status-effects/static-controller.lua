local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.Players
local u6 = v4.ReplicatedStorage
local u7 = v4.TweenService
local u8 = v4.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "StaticController"
    end,
    ["__index"] = u9
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p16)
    p16.Name = "StaticController"
end
function u13.KnitStart(u17) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
        [3] = u5
        [4] = u2
        [5] = u11
        [6] = u6
        [7] = u7
    --]]
    u9.KnitStart(u17)
    u10.Client:OnEvent("StaticHit", function(p18, p19) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u5
            [3] = u2
            [4] = u11
            [5] = u6
            [6] = u7
        --]]
        local v20 = {}
        for _, v21 in p18 do
            v20[v21] = {}
        end
        for _, v22 in p18 do
            local v23 = v22:FindFirstChild("UpperTorso")
            if v23 ~= nil then
                v23 = v23:FindFirstChild("BodyFrontAttachment")
            end
            if v23 then
                u17:playHitSpark(v22)
                local v24 = u5.LocalPlayer.Character == p19
                local v25 = u2
                local v26 = u11.STATIC_HIT
                local v27 = {}
                local v28
                if v24 then
                    v28 = nil
                else
                    v28 = v22.PrimaryPart
                    if v28 ~= nil then
                        v28 = v28.Position
                    end
                end
                v27.position = v28
                v27.rollOffMaxDistance = 80
                v25:playSound(v26, v27)
                for _, v29 in p18 do
                    if v29 ~= v22 and (v20[v22][v29] == nil and v20[v29][v22] == nil) then
                        v20[v22][v29] = true
                        local v30 = v29:FindFirstChild("UpperTorso")
                        if v30 ~= nil then
                            v30 = v30:FindFirstChild("BodyFrontAttachment")
                        end
                        if v30 then
                            local v31 = u6.Assets.Effects.StaticConnection
                            local u32 = v31.Beam1:Clone()
                            local u33 = v31.Beam2:Clone()
                            local u34 = v31.PointLight:Clone()
                            u32.Parent = v23
                            u32.Attachment0 = v23
                            u32.Attachment1 = v30
                            u33.Parent = v23
                            u33.Attachment0 = v23
                            u33.Attachment1 = v30
                            u34.Parent = v23
                            task.delay(0.24, function() --[[ Line: 110 ]]
                                --[[
                                Upvalues:
                                    [1] = u7
                                    [2] = u32
                                    [3] = u33
                                    [4] = u34
                                --]]
                                u7:Create(u32, TweenInfo.new(0.12), {
                                    ["Width0"] = 0,
                                    ["Width1"] = 0
                                }):Play()
                                u7:Create(u33, TweenInfo.new(0.12), {
                                    ["Width0"] = 0,
                                    ["Width1"] = 0
                                }):Play()
                                task.wait(0.12)
                                u32:Destroy()
                                u33:Destroy()
                                u34:Destroy()
                            end)
                        end
                    end
                end
            end
        end
    end)
end
function u13.playHitSpark(_, p35) --[[ Line: 128 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u8
        [3] = u12
    --]]
    local v36 = p35:FindFirstChild("UpperTorso")
    if not v36 then
        return nil
    end
    local u37 = u6.Assets.Effects.StaticHit:Clone()
    u37.Parent = u8
    u37.Anchored = false
    u37.CFrame = v36.CFrame
    u37.Lightning.Anchored = false
    u37.Lightning.CFrame = v36.CFrame
    u12:playEffects(u37:GetChildren(), p35)
    task.delay(0.2, function() --[[ Line: 140 ]]
        --[[
        Upvalues:
            [1] = u37
        --]]
        u37.Attachment.PointLight.Enabled = false
    end)
    task.delay(5, function() --[[ Line: 143 ]]
        --[[
        Upvalues:
            [1] = u37
        --]]
        u37:Destroy()
    end)
end
v3.CreateController(u13.new())
return nil