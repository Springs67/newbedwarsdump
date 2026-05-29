local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "BeachVolleyBallEmoteController"
    end,
    ["__index"] = u9
})
u15.__index = u15
function u15.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p18)
    p18.Name = "BeachVolleyBallEmoteController"
end
function u15.KnitStart(p19) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u5
        [3] = u12
        [4] = u14
        [5] = u7
        [6] = u8
        [7] = u11
        [8] = u10
        [9] = u13
        [10] = u3
        [11] = u4
    --]]
    u9.KnitStart(p19)
    local v20 = u5.Controllers.EmoteHandlerController
    local v21 = u12.BEACH_VOLLEY_BALL
    local u22 = u14
    local u23 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 42 ]]
            return "Anonymous"
        end,
        ["__index"] = u22
    })
    u23.__index = u23
    function u23.new(...) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        local v24 = u23
        local v25 = setmetatable({}, v24)
        return v25:constructor(...) or v25
    end
    function u23.constructor(p26, ...) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22.constructor(p26, ...)
    end
    function u23.onEnable(_, _, p27, _, p28) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u8
            [3] = u11
            [4] = u10
            [5] = u13
            [6] = u3
            [7] = u4
        --]]
        if not p27.PrimaryPart then
            return nil
        end
        local u29 = u7.Assets.Misc.BeachVolleyBall:Clone()
        for v30, v31 in u29:GetDescendants() do
            local _ = v30 - 1
            if v31:IsA("BasePart") then
                v31.Transparency = 1
                u29.ball.Anchored = true
            end
        end
        u29.Parent = u8
        for v32, v33 in u29:GetDescendants() do
            local _ = v32 - 1
            if v33:IsA("BasePart") then
                v33.Transparency = 0
            end
        end
        local v34 = p27:GetPivot()
        local v35 = p27.Humanoid.HipHeight + p27.PrimaryPart.Size.Y / 2
        local v36 = Vector3.new(0, v35, 0)
        local v37 = CFrame.Angles(0, 3.141592653589793, 0)
        u29:PivotTo((v34 - v36) * v37)
        local u38 = u29.AnimationController.Animator:LoadAnimation(u11:getAnimation(u10.BEACH_VOLLEY_BALL_BALL))
        local u39 = {
            u13.BEACH_VOLLEY_BALL_HIT_1,
            u13.BEACH_VOLLEY_BALL_HIT_2,
            u13.BEACH_VOLLEY_BALL_HIT_3,
            u13.BEACH_VOLLEY_BALL_HIT_4
        }
        p28:GiveTask(u38:GetMarkerReachedSignal("bounce"):Connect(function() --[[ Line: 88 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u39
                [3] = u4
                [4] = u29
            --]]
            local v40 = u39
            u4:playSound(u3.fromList(unpack(v40)), {
                ["volumeMultiplier"] = 0.7,
                ["position"] = u29:GetPivot().Position
            })
        end))
        u38:Play()
        p28:GiveTask(function() --[[ Line: 96 ]]
            --[[
            Upvalues:
                [1] = u38
            --]]
            u38:Stop()
            u38:Destroy()
        end)
        p28:GiveTask(u29)
    end
    function u23.onDisable(_, _, _, _) --[[ Line: 102 ]] end
    v20:registerHandler(v21, u23)
end
u5.CreateController(u15.new())
return nil