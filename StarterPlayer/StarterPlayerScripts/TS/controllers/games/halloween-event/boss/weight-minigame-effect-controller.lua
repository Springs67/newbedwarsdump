local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.SoundManager
local u4 = v2.WatchCollectionTag
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutQuad
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "WeightMinigameEffectController"
    end,
    ["__index"] = u8
})
u10.__index = u10
function u10.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p13)
    p13.Name = "WeightMinigameEffectController"
end
function u10.KnitStart(p14) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u4
        [3] = u5
        [4] = u7
        [5] = u6
        [6] = u3
        [7] = u9
    --]]
    u8.KnitStart(p14)
    u4("HWWeightGame", function(u15) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u7
            [3] = u6
            [4] = u3
            [5] = u9
        --]]
        u5.Controllers.PoisonFogEffectController:enablePoisonCountdownSound()
        u15:WaitForChild("FinishedSetup")
        if not u15.PrimaryPart then
            u15:GetPropertyChangedSignal("PrimaryPart"):Wait()
        end
        local u16 = u15:GetPrimaryPartCFrame()
        local u17 = u15:GetPrimaryPartCFrame() + Vector3.new(0, -10, 0)
        u7(2.5, u6, function(p18) --[[ Line: 41 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u17
                [3] = u16
            --]]
            u15:PivotTo(u17:Lerp(u16, p18))
        end)
        for _, v19 in u15:GetChildren() do
            local v20 = v19:FindFirstChild("FloatingRock3")
            local v21
            if v20 == nil then
                v21 = v20
            else
                v21 = v20:IsA("BasePart")
            end
            if v21 then
                local u22 = v20.Position
                v20.AncestryChanged:Connect(function() --[[ Line: 54 ]]
                    --[[
                    Upvalues:
                        [1] = u3
                        [2] = u9
                        [3] = u22
                    --]]
                    local v23 = {
                        ["rollOffMaxDistance"] = 80,
                        ["rollOffMinDistance"] = 60,
                        ["position"] = u22
                    }
                    u3:playSound(u9.MINER_STONE_BREAK, v23)
                end)
                local u24 = u3:playSound(u9.ROCK_RUMBLE, {
                    ["volumeMultiplier"] = 1.3,
                    ["rollOffMaxDistance"] = 420,
                    ["rollOffMinDistance"] = 90,
                    ["fadeInTime"] = 0.1,
                    ["parent"] = v20
                })
                task.delay(3, function() --[[ Line: 68 ]]
                    --[[
                    Upvalues:
                        [1] = u24
                        [2] = u3
                    --]]
                    if u24 then
                        local u25 = u3:tweenSoundVolume(u24, 0, 0.5)
                        u25.Completed:Connect(function() --[[ Line: 71 ]]
                            --[[
                            Upvalues:
                                [1] = u24
                                [2] = u25
                            --]]
                            u24:Stop()
                            u24:Destroy()
                            u25:Destroy()
                        end)
                    end
                end)
            end
        end
    end)
end
u5.CreateController(u10.new())
return nil