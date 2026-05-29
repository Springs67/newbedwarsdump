local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u6 = v5.InQuad
local u7 = v5.OutQuad
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.CollectionService
local u11 = v9.ReplicatedStorage
local u12 = v9.RunService
local u13 = v9.Workspace
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "SymbolMinigameEffectController"
    end,
    ["__index"] = u15
})
u18.__index = u18
function u18.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.constructor(p21)
    p21.Name = "SymbolMinigameEffectController"
end
function u18.KnitStart(p22) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u10
        [3] = u4
        [4] = u8
        [5] = u3
        [6] = u16
        [7] = u14
        [8] = u6
        [9] = u11
        [10] = u13
        [11] = u17
        [12] = u7
        [13] = u12
        [14] = u2
    --]]
    u15.KnitStart(p22)
    u10:GetInstanceAddedSignal("HWSymbolGame"):Connect(function(u23) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u8
            [3] = u3
            [4] = u16
            [5] = u14
            [6] = u6
            [7] = u11
            [8] = u13
            [9] = u17
            [10] = u7
            [11] = u12
            [12] = u2
        --]]
        u4.Controllers.PoisonFogEffectController:enablePoisonCountdownSound()
        if not u23:IsA("Model") then
            return nil
        end
        u23:WaitForChild("FinishedSetup")
        if not u23.PrimaryPart then
            u23:GetPropertyChangedSignal("PrimaryPart"):Wait()
        end
        local u24 = u8.new()
        local u25 = u23:GetPrimaryPartCFrame()
        local u26 = u23:GetPrimaryPartCFrame() + Vector3.new(0, -20, 0)
        local u27 = u3:playSound(u16.ROCK_RUMBLE, {
            ["volumeMultiplier"] = 1.1,
            ["rollOffMaxDistance"] = 400,
            ["rollOffMinDistance"] = 80,
            ["fadeInTime"] = 0.1,
            ["position"] = u25.Position
        })
        task.delay(3, function() --[[ Line: 60 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u3
            --]]
            if u27 then
                local u28 = u3:tweenSoundVolume(u27, 0, 0.5)
                u28.Completed:Connect(function() --[[ Line: 63 ]]
                    --[[
                    Upvalues:
                        [1] = u27
                        [2] = u28
                    --]]
                    u27:Stop()
                    u27:Destroy()
                    u28:Destroy()
                end)
            end
        end)
        task.delay(9.65, function() --[[ Line: 70 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u14
                [3] = u6
                [4] = u3
                [5] = u16
                [6] = u11
                [7] = u13
                [8] = u17
            --]]
            local v29 = u23:GetAttribute("WinningClue")
            for _, u30 in u23:GetChildren() do
                if u30:IsA("Model") then
                    if u30:GetAttribute("ClueType") == v29 then
                        task.delay(4, function() --[[ Line: 78 ]]
                            --[[
                            Upvalues:
                                [1] = u30
                            --]]
                            local v31 = u30:GetDescendants()
                            local function v36(u32) --[[ Line: 80 ]]
                                if u32:IsA("BasePart") then
                                    u32.Anchored = false
                                    u32.CanCollide = false
                                    u32.CanQuery = false
                                    local v33 = math.random() * 3.141592653589793 * 2
                                    local v34 = math.sin(v33) * 10
                                    local v35 = math.cos(v33) * 10
                                    u32:ApplyImpulse(Vector3.new(v34, 10, v35) * u32.Mass)
                                    task.delay(1, function() --[[ Line: 90 ]]
                                        --[[
                                        Upvalues:
                                            [1] = u32
                                        --]]
                                        u32:Destroy()
                                    end)
                                end
                            end
                            for v37, v38 in v31 do
                                v36(v38, v37 - 1, v31)
                            end
                        end)
                    else
                        for _, v39 in u30:GetChildren() do
                            if v39.Name == "Clue" then
                                v39:Destroy()
                            end
                        end
                        local u40 = u30:FindFirstChild("Pillar")
                        local v41
                        if u40 == nil then
                            v41 = u40
                        else
                            v41 = u40:IsA("BasePart")
                        end
                        if v41 then
                            local u42 = u40.CFrame
                            local u43 = u42 + Vector3.new(0, -9.643, 0)
                            u14(0.2, u6, function(p44) --[[ Line: 115 ]]
                                --[[
                                Upvalues:
                                    [1] = u40
                                    [2] = u42
                                    [3] = u43
                                --]]
                                u40.CFrame = u42:Lerp(u43, p44)
                            end)
                            task.delay(0.25, function() --[[ Line: 119 ]]
                                --[[
                                Upvalues:
                                    [1] = u3
                                    [2] = u16
                                    [3] = u43
                                    [4] = u11
                                    [5] = u13
                                    [6] = u17
                                    [7] = u30
                                --]]
                                u3:playSound(u16.HALLOWEEN_BOSS_ROCK_CRUMBLE, {
                                    ["rollOffMinDistance"] = 50,
                                    ["rollOffMaxDistance"] = 120,
                                    ["volumeMultiplier"] = 0.2,
                                    ["position"] = u43.Position
                                })
                                local v45 = u11.Assets.Effects.HalloweenExplosion:Clone()
                                v45.Position = u43.Position
                                v45.Parent = u13
                                u17:playEffects({ v45 }, nil, {
                                    ["destroyAfterSec"] = 4,
                                    ["sizeMultiplier"] = 0.39999999999999997
                                })
                                u30:Destroy()
                            end)
                        else
                            task.delay(0.35, function() --[[ Line: 136 ]]
                                --[[
                                Upvalues:
                                    [1] = u30
                                --]]
                                u30:Destroy()
                            end)
                        end
                    end
                end
            end
        end)
        local u47 = u14(3.5, u7, function(p46) --[[ Line: 142 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u26
                [3] = u25
            --]]
            u23:PivotTo(u26:Lerp(u25, p46))
        end)
        u24:GiveTask(function() --[[ Line: 145 ]]
            --[[
            Upvalues:
                [1] = u47
            --]]
            return u47:Cancel()
        end)
        local u48 = {}
        local u49 = 0
        u12:BindToRenderStep("pillar-pre-camera", Enum.RenderPriority.Camera.Value - 1, function(p50) --[[ Line: 150 ]]
            --[[
            Upvalues:
                [1] = u49
                [2] = u23
                [3] = u2
                [4] = u48
            --]]
            u49 = u49 + p50
            for _, v51 in u23:GetChildren() do
                for _, v52 in v51:GetChildren() do
                    if v52.Name == "Pillar" and v52:IsA("BasePart") then
                        local v53 = u2.getOrCreate(u48, v52, {
                            ["offset"] = math.random()
                        })
                        v53.lastFrame = v52.CFrame
                        local v54 = v52.CFrame
                        local v55 = u49 + v53.offset * 3.141592653589793 * 2
                        local v56 = math.sin(v55) * 1.4
                        v52.CFrame = v54 + Vector3.new(0, v56, 0)
                    end
                end
            end
        end)
        u24:GiveTask(function() --[[ Line: 166 ]]
            --[[
            Upvalues:
                [1] = u12
            --]]
            return u12:UnbindFromRenderStep("pillar-pre-camera")
        end)
        u12:BindToRenderStep("pillar-post-camera", Enum.RenderPriority.Camera.Value - 1, function(_) --[[ Line: 169 ]]
            --[[
            Upvalues:
                [1] = u48
            --]]
            for v57, v58 in u48 do
                if v58.lastFrame then
                    v57.CFrame = v58.lastFrame
                end
            end
        end)
        u24:GiveTask(function() --[[ Line: 176 ]]
            --[[
            Upvalues:
                [1] = u12
            --]]
            return u12:UnbindFromRenderStep("pillar-post-camera")
        end)
        u24:GiveTask(u23.AncestryChanged:Connect(function() --[[ Line: 179 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u24
            --]]
            if not u23.Parent then
                u24:DoCleaning()
            end
        end))
    end)
end
u4.CreateController(u18.new())
return nil