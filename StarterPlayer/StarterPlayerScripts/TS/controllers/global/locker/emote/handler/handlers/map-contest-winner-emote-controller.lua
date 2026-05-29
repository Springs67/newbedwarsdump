local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.Players
local u7 = v5.ReplicatedStorage
local u8 = v5.Workspace
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "MapContestWinnerEmoteController"
    end,
    ["__index"] = u10
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
        [1] = u10
    --]]
    u10.constructor(p19)
    p19.Name = "MapContestWinnerEmoteController"
end
function u16.KnitStart(p20) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u2
        [3] = u13
        [4] = u15
        [5] = u7
        [6] = u4
        [7] = u8
        [8] = u9
        [9] = u3
        [10] = u12
        [11] = u11
        [12] = u6
        [13] = u14
    --]]
    u10.KnitStart(p20)
    local v21 = u2.Controllers.EmoteHandlerController
    local v22 = u13.MAP_CONTEST_WINNER
    local u23 = u15
    local u24 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 43 ]]
            return "Anonymous"
        end,
        ["__index"] = u23
    })
    u24.__index = u24
    function u24.new(...) --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        local v25 = u24
        local v26 = setmetatable({}, v25)
        return v26:constructor(...) or v26
    end
    function u24.constructor(p27, ...) --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        u23.constructor(p27, ...)
    end
    function u24.onEnable(p28, p29, p30, _, u31) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u4
            [3] = u8
            [4] = u9
            [5] = u3
            [6] = u12
            [7] = u11
            [8] = u6
            [9] = u14
        --]]
        math.random(10, 15)
        local u32 = u7.Assets.Misc.trophy:Clone()
        u32.Parent = p30
        local u33 = u4("Motor6D", {
            ["Name"] = "trophy",
            ["Enabled"] = true,
            ["Parent"] = p30.RightHand,
            ["C0"] = CFrame.new(Vector3.new(0, 0, 0), Vector3.new(0, 0, 0)),
            ["C1"] = CFrame.new(Vector3.new(0, 0, 0), Vector3.new(0, 0, 0)),
            ["Part0"] = p30.RightHand,
            ["Part1"] = u32
        })
        local u34 = u4("Part", {
            ["Name"] = "EmotePart",
            ["Transparency"] = 1,
            ["Size"] = Vector3.new(1, 1, 1),
            ["Parent"] = u8,
            ["Position"] = p30.Head.Position + Vector3.new(0, 6, 0),
            ["Anchored"] = true,
            ["CanCollide"] = false
        })
        local u35 = u7.Assets.Misc.TrophyParticles:Clone()
        u35.Parent = u34
        u35.Enabled = false
        local u36 = u4("PointLight", {
            ["Name"] = "EmotePointLight",
            ["Brightness"] = 0,
            ["Range"] = 10,
            ["Enabled"] = true,
            ["Parent"] = u34,
            ["Color"] = Color3.fromRGB(255, 184, 74)
        })
        local u38 = u9(1, u3, function(p37) --[[ Line: 93 ]]
            --[[
            Upvalues:
                [1] = u36
            --]]
            u36.Brightness = p37
        end, 0, 2.5)
        local v39 = p30.Humanoid.Animator
        local u40 = v39:LoadAnimation(u12:getAnimation(u11.MAP_TROPHY_THROW))
        local u41 = v39:LoadAnimation(u12:getAnimation(u11.MAP_TROPHY_HOLD))
        u40:Play()
        u38:Play()
        if p29 == u6.LocalPlayer.UserId then
            u35.Enabled = true
        end
        local u42 = p28:playSound(u14.TROPHY_SPARKLES, p29, {
            ["position"] = nil,
            ["looped"] = true,
            ["volumeMultiplier"] = 0.4
        })
        u31:GiveTask(function() --[[ Line: 109 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u33
                [3] = u34
                [4] = u35
                [5] = u36
                [6] = u38
                [7] = u40
                [8] = u42
            --]]
            u32:Destroy()
            u33:Destroy()
            u34:Destroy()
            u35:Destroy()
            u36:Destroy()
            u38:Cancel()
            u40:Stop()
            u40:Destroy()
            u42:Destroy()
        end)
        u40:GetMarkerReachedSignal("freeze"):Connect(function() --[[ Line: 120 ]]
            --[[
            Upvalues:
                [1] = u40
                [2] = u41
                [3] = u31
            --]]
            u40:AdjustSpeed(0)
            u41:Play()
            u40:Stop(1)
            u31:GiveTask(function() --[[ Line: 124 ]]
                --[[
                Upvalues:
                    [1] = u41
                --]]
                u41:Stop()
                u41:Destroy()
            end)
        end)
    end
    function u24.onDisable(_, _, _, _) --[[ Line: 130 ]] end
    v21:registerHandler(v22, u24)
end
u2.CreateController(u16.new())
return nil