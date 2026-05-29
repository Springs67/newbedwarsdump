local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u4 = v3.Linear
local u5 = v3.OutBack
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scalePart
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.ReplicatedStorage
local u10 = v8.Workspace
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u19 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "SummonSnowEmoteController"
    end,
    ["__index"] = u12
})
u20.__index = u20
function u20.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p23)
    p23.Name = "SummonSnowEmoteController"
end
function u20.KnitStart(p24) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u2
        [3] = u15
        [4] = u19
        [5] = u9
        [6] = u6
        [7] = u7
        [8] = u18
        [9] = u14
        [10] = u13
        [11] = u10
        [12] = u11
        [13] = u5
        [14] = u17
        [15] = u16
        [16] = u4
    --]]
    u12.KnitStart(p24)
    local v25 = u2.Controllers.EmoteHandlerController
    local v26 = u15.SUMMON_SNOW
    local u27 = u19
    local u28 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 47 ]]
            return "Anonymous"
        end,
        ["__index"] = u27
    })
    u28.__index = u28
    function u28.new(...) --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u28
        --]]
        local v29 = u28
        local v30 = setmetatable({}, v29)
        return v30:constructor(...) or v30
    end
    function u28.constructor(p31, ...) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27.constructor(p31, ...)
    end
    function u28.onEnable(u32, u33, u34, _, u35) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u6
            [3] = u7
            [4] = u18
            [5] = u14
            [6] = u13
            [7] = u10
            [8] = u11
            [9] = u5
            [10] = u17
            [11] = u16
            [12] = u4
        --]]
        local u36 = u9.Assets.Misc.ChristmasTreeOrb.Spirit:Clone()
        u36.Name = "Handle"
        u36.Anchored = false
        local u37 = u6("Attachment", {
            ["Name"] = "LeftGripAttachment",
            ["Orientation"] = Vector3.new(0, 130, 0),
            ["Position"] = Vector3.new(1, 0, 0),
            ["Parent"] = u36
        })
        u7(u36, 0.5)
        local u38 = u6("Accessory", {
            ["Children"] = { u36 }
        })
        u38.Parent = u34
        u35:GiveTask(u38)
        u18:weldCharacterAccessories(u34)
        local u39 = u14:getAssetId(u13.SUMMON_SNOW)
        u35:GiveTask((u34.Humanoid.Animator.AnimationPlayed:Connect(function(p40) --[[ Line: 81 ]]
            --[[
            Upvalues:
                [1] = u39
                [2] = u9
                [3] = u35
                [4] = u36
                [5] = u37
                [6] = u38
                [7] = u10
                [8] = u11
                [9] = u5
                [10] = u17
                [11] = u32
                [12] = u16
                [13] = u33
                [14] = u4
                [15] = u34
            --]]
            local v41 = p40.Animation
            if v41 ~= nil then
                v41 = v41.AnimationId
            end
            if v41 ~= u39 then
                return nil
            end
            local u42 = u9.Assets.Effects.SnowflakeFallPart:Clone()
            local u43 = u9.Assets.Effects.SnowBlast:Clone()
            u35:GiveTask(u42)
            u35:GiveTask(u43)
            local v44 = u35
            local v45
            if p40 == nil then
                v45 = p40
            else
                v45 = p40:GetMarkerReachedSignal("LeaveHand"):Connect(function() --[[ Line: 96 ]]
                    --[[
                    Upvalues:
                        [1] = u36
                        [2] = u37
                        [3] = u38
                        [4] = u10
                        [5] = u11
                        [6] = u5
                        [7] = u43
                        [8] = u17
                        [9] = u32
                        [10] = u16
                        [11] = u33
                        [12] = u4
                        [13] = u42
                        [14] = u34
                    --]]
                    u36.Anchored = true
                    u37:Destroy()
                    u38.Parent = u10
                    local u46 = u36.CFrame
                    local v47 = u36.CFrame
                    local v48 = CFrame.Angles(41252.96124941927, 0, 0)
                    local u49 = (v47 + Vector3.new(0, 1, 0)) * v48
                    u11(1.15, u5, function(p50) --[[ Line: 106 ]]
                        --[[
                        Upvalues:
                            [1] = u36
                            [2] = u46
                            [3] = u49
                        --]]
                        u36:PivotTo(u46:Lerp(u49, p50))
                    end)
                    task.delay(0.8499999999999999, function() --[[ Line: 109 ]]
                        --[[
                        Upvalues:
                            [1] = u43
                            [2] = u36
                            [3] = u17
                            [4] = u32
                            [5] = u16
                            [6] = u33
                            [7] = u49
                            [8] = u11
                            [9] = u4
                            [10] = u42
                            [11] = u10
                            [12] = u34
                        --]]
                        if not u43 then
                            return nil
                        end
                        u43:PivotTo(u36.CFrame)
                        u43.Parent = u36
                        u17:playEffects({ u36 }, nil, {
                            ["destroyAfterSec"] = 1
                        })
                        u32:playSound(u16.CHRISTMAS_ELDERTREE_PICKUP_5, u33, {
                            ["position"] = u49.Position
                        })
                        u11(0.7, u4, function(p51) --[[ Line: 123 ]]
                            --[[
                            Upvalues:
                                [1] = u36
                            --]]
                            u36.Transparency = p51
                        end)
                        u42.Size = Vector3.new(10, 0.5, 10)
                        u42.Anchored = true
                        u42.Parent = u10
                        u42:PivotTo(u34:GetPivot() + Vector3.new(0, 6, 0))
                    end)
                end)
            end
            v44:GiveTask(v45)
            local v52 = u35
            local v53
            if p40 == nil then
                v53 = p40
            else
                v53 = p40:GetMarkerReachedSignal("Summon"):Connect(function() --[[ Line: 140 ]] end)
            end
            v52:GiveTask(v53)
            local v54 = u35
            if p40 ~= nil then
                p40 = p40:GetMarkerReachedSignal("End"):Connect(function() --[[ Line: 146 ]]
                    --[[
                    Upvalues:
                        [1] = u42
                        [2] = u35
                    --]]
                    if u42 then
                        for v55, v56 in u42:GetDescendants() do
                            local _ = v55 - 1
                            if v56:IsA("ParticleEmitter") then
                                v56.Enabled = false
                            end
                        end
                    end
                    task.delay(2, function() --[[ Line: 159 ]]
                        --[[
                        Upvalues:
                            [1] = u35
                        --]]
                        u35:DoCleaning()
                    end)
                end)
            end
            v54:GiveTask(p40)
        end)))
    end
    function u28.onDisable(_, _, _, _) --[[ Line: 168 ]] end
    v25:registerHandler(v26, u28)
end
u2.CreateController(u20.new())
return nil