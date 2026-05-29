local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "HalloweenRavenController"
    end,
    ["__index"] = u9
})
u16.__index = u16
function u16.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u13
    --]]
    u9.constructor(p19, { u13.HALLOWEEN_2024_EVENT, u13.HALLOWEEN_EVENT, u13.HALLOWEEN_2025_EVENT_PVE })
    p19.Name = "HalloweenRavenController"
end
function u16.onGameInit(_) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u10
        [3] = u15
        [4] = u14
        [5] = u4
        [6] = u3
        [7] = u7
        [8] = u11
        [9] = u12
        [10] = u8
        [11] = u6
    --]]
    u5.Controllers.PreloadController:runPreload({
        ["animations"] = { u10.HALLOWEEN_RAVEN_FLIGHT_LOOP },
        ["sounds"] = { u15.HALLOWEEN_RAVENS_1, u15.HALLOWEEN_RAVENS_2 }
    })
    u14.Client:Get("PlayRavenAmbient"):Connect(function(p20) --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u3
            [3] = u15
            [4] = u7
            [5] = u11
            [6] = u10
            [7] = u12
            [8] = u8
            [9] = u6
        --]]
        u4:playSound(u3.fromList(u15.HALLOWEEN_RAVENS_1, u15.HALLOWEEN_RAVENS_2), {
            ["rollOffMinDistance"] = 30,
            ["rollOffMaxDistance"] = 350,
            ["position"] = p20.ravenModel:GetPivot().Position
        })
        local v21 = p20.ravenModel.Parent
        if not v21 then
            return nil
        end
        for _, u22 in v21:GetChildren() do
            if u22:IsA("Model") then
                local u23 = u7.new()
                u23:GiveTask(task.delay(2.5, function() --[[ Line: 56 ]]
                    --[[
                    Upvalues:
                        [1] = u23
                    --]]
                    u23:Destroy()
                end))
                u4:playSound(u3.fromList(u15.HALLOWEEN_RAVENS_1, u15.HALLOWEEN_RAVENS_2), {
                    ["rollOffMaxDistance"] = 120,
                    ["volumeMultiplier"] = 0.7,
                    ["position"] = u22:GetPivot().Position
                })
                local v24 = u11
                local v25 = u22:FindFirstChildWhichIsA("AnimationController")
                if v25 ~= nil then
                    v25 = v25:FindFirstChild("Animator")
                end
                local u26 = v24:playAnimation(v25, u10.HALLOWEEN_RAVEN_FLIGHT_LOOP)
                if u26 then
                    u26:Play()
                    u23:GiveTask(function() --[[ Line: 72 ]]
                        --[[
                        Upvalues:
                            [1] = u26
                        --]]
                        u26:Stop()
                        u26:Destroy()
                    end)
                end
                local u27 = u22:GetPivot()
                local v28 = u27.Position
                local v29 = u27.LookVector * ((35 + math.random() * 15) * u12)
                local v30 = 35 + math.random() * 15
                local v31 = Vector3.new(0, v30, 0)
                local v32 = v28 + v29 + v31
                local v33 = u27.LookVector
                local u34 = CFrame.new(v32, v32 + v33)
                local u36 = u8(2.5, u6, function(p35) --[[ Line: 86 ]]
                    --[[
                    Upvalues:
                        [1] = u22
                        [2] = u27
                        [3] = u34
                    --]]
                    u22:PivotTo(u27:Lerp(u34, p35))
                end)
                u36:Play()
                u23:GiveTask(function() --[[ Line: 90 ]]
                    --[[
                    Upvalues:
                        [1] = u36
                    --]]
                    u36:Cancel()
                end)
                u23:GiveTask(task.delay(2, function() --[[ Line: 93 ]]
                    --[[
                    Upvalues:
                        [1] = u22
                        [2] = u8
                        [3] = u6
                        [4] = u23
                    --]]
                    local v37 = u22:GetDescendants()
                    local function v42(u38) --[[ Line: 95 ]]
                        --[[
                        Upvalues:
                            [1] = u8
                            [2] = u6
                            [3] = u23
                        --]]
                        if not u38:IsA("BasePart") then
                            return nil
                        end
                        local u39 = u38.Transparency
                        if u39 == 1 then
                            return nil
                        end
                        local u41 = u8(0.5, u6, function(p40) --[[ Line: 103 ]]
                            --[[
                            Upvalues:
                                [1] = u38
                                [2] = u39
                            --]]
                            if u38.Parent ~= nil then
                                u38.Transparency = p40 * 1 + (1 - p40) * u39
                            end
                        end)
                        u41:Play()
                        u23:GiveTask(function() --[[ Line: 109 ]]
                            --[[
                            Upvalues:
                                [1] = u41
                            --]]
                            u41:Cancel()
                        end)
                    end
                    for v43, v44 in v37 do
                        v42(v44, v43 - 1, v37)
                    end
                end))
            end
        end
    end)
end
u5.CreateController(u16.new())
return nil