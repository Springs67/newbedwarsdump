local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AnimatorAdded
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "VoidCrabController"
    end,
    ["__index"] = u7
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
        [1] = u7
    --]]
    u7.constructor(p14)
    p14.Name = "VoidCrabController"
end
function u11.KnitStart(p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u10
        [3] = u2
        [4] = u5
        [5] = u9
        [6] = u8
        [7] = u6
        [8] = u4
    --]]
    u7.KnitStart(p15)
    u10("VoidCrab", function(p16) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u5
            [3] = u9
            [4] = u8
            [5] = u6
            [6] = u4
        --]]
        local u17 = p16:WaitForChild("LaserTarget")
        local v18 = p16:WaitForChild("Humanoid")
        local u19 = p16:WaitForChild("TargetBeam")
        local u20 = p16:WaitForChild("BlastBeam")
        u2(v18, function(p21) --[[ Line: 37 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u9
                [3] = u8
                [4] = u19
                [5] = u20
                [6] = u17
                [7] = u6
                [8] = u4
            --]]
            p21.AnimationPlayed:Connect(function(p22) --[[ Line: 38 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u9
                    [3] = u8
                    [4] = u19
                    [5] = u20
                    [6] = u17
                    [7] = u6
                    [8] = u4
                --]]
                local v23 = p22.Animation
                if v23 ~= nil then
                    v23 = v23.AnimationId
                end
                local u24 = u5.new()
                u24:GiveTask(p22.Stopped:Connect(function() --[[ Line: 45 ]]
                    --[[
                    Upvalues:
                        [1] = u24
                    --]]
                    u24:DoCleaning()
                end))
                u24:GiveTask(p22)
                if v23 == u9:getAssetId(u8.VOID_CRAB_BEAM_ATTACK) then
                    u19.Enabled = true
                    local v25 = u17.Value
                    if v25 ~= nil then
                        v25 = v25:FindFirstChild("UpperTorso")
                        if v25 ~= nil then
                            v25 = v25:FindFirstChild("BodyFrontAttachment")
                        end
                    end
                    u19.Attachment1 = v25
                    u20.Attachment1 = v25
                    u24:GiveTask(u17.Changed:Connect(function() --[[ Line: 64 ]]
                        --[[
                        Upvalues:
                            [1] = u17
                            [2] = u19
                            [3] = u20
                        --]]
                        local v26 = u17.Value
                        if v26 ~= nil then
                            v26 = v26:FindFirstChild("UpperTorso")
                            if v26 ~= nil then
                                v26 = v26:FindFirstChild("BodyFrontAttachment")
                            end
                        end
                        u19.Attachment1 = v26
                        u20.Attachment1 = v26
                    end))
                    u24:GiveTask(p22:GetMarkerReachedSignal("blast"):Connect(function() --[[ Line: 67 ]]
                        --[[
                        Upvalues:
                            [1] = u19
                            [2] = u20
                            [3] = u6
                            [4] = u4
                            [5] = u24
                        --]]
                        u19.Enabled = false
                        u20.Enabled = true
                        local u28 = u6(0.1, u4, function(p27) --[[ Line: 70 ]]
                            --[[
                            Upvalues:
                                [1] = u20
                            --]]
                            u20.Width0 = 0.1 + p27 * 0.4
                            u20.Width1 = 0.2 + p27 * 0.6
                        end)
                        u24:GiveTask(function() --[[ Line: 74 ]]
                            --[[
                            Upvalues:
                                [1] = u28
                            --]]
                            return u28:Cancel()
                        end)
                        task.delay(0.3, function() --[[ Line: 77 ]]
                            --[[
                            Upvalues:
                                [1] = u20
                                [2] = u6
                                [3] = u4
                                [4] = u24
                            --]]
                            if not u20.Parent then
                                return nil
                            end
                            local u30 = u6(0.05, u4, function(p29) --[[ Line: 81 ]]
                                --[[
                                Upvalues:
                                    [1] = u20
                                --]]
                                u20.Width0 = 0.5 * (1 - p29)
                                u20.Width1 = 0.8 * (1 - p29)
                            end)
                            u24:GiveTask(function() --[[ Line: 85 ]]
                                --[[
                                Upvalues:
                                    [1] = u30
                                --]]
                                return u30:Cancel()
                            end)
                        end)
                    end))
                end
            end)
        end)
    end)
end
v3.CreateController(u11.new())
return nil