local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AnimationUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.ReplicatedStorage
local u7 = v5.RunService
local u8 = v5.Workspace
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u14 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "ChrismasCarolEmoteController"
    end,
    ["__index"] = u10
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
        [1] = u10
    --]]
    u10.constructor(p18)
    p18.Name = "ChrismasCarolEmoteController"
end
function u15.KnitStart(p19) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u3
        [3] = u13
        [4] = u14
        [5] = u6
        [6] = u8
        [7] = u7
        [8] = u9
        [9] = u4
        [10] = u2
        [11] = u12
        [12] = u11
    --]]
    u10.KnitStart(p19)
    local v20 = u3.Controllers.EmoteHandlerController
    local v21 = u13.CHRISTMAS_CAROL
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
    function u23.onEnable(p27, _, u28, _, u29) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u8
            [3] = u7
            [4] = u9
            [5] = u4
            [6] = u2
            [7] = u12
            [8] = u11
        --]]
        local u30 = u6.Assets.Effects.Book:Clone()
        u29:GiveTask(u30)
        u30.Parent = u8
        p27:setupInstance(u30)
        u29:GiveTask(u7.Heartbeat:Connect(function(_) --[[ Line: 61 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u8
                [3] = u30
            --]]
            if u28.Parent ~= u8 then
                return nil
            end
            local v31 = u28.PrimaryPart
            if v31 ~= nil then
                v31 = v31.CFrame
            end
            if not v31 then
                return nil
            end
            u30:PivotTo(v31 + v31.LookVector * 1.5)
        end))
        local u32 = u30.PrimaryPart:FindFirstChild("left")
        local u33 = u30.PrimaryPart:FindFirstChild("right")
        local u34 = u30.PrimaryPart:FindFirstChild("leftTarget")
        local u35 = u30.PrimaryPart:FindFirstChild("rightTarget")
        if u32 and u33 then
            u32.PivotOffset = CFrame.new(Vector3.new(-0.5, 0, 0))
            local _ = u32.CFrame
            local _ = u33.CFrame
            u9(2, u4, function(p36) --[[ Line: 96 ]]
                --[[
                Upvalues:
                    [1] = u32
                    [2] = u34
                    [3] = u33
                    [4] = u35
                --]]
                u32.CFrame = u32.CFrame:Lerp(u34.CFrame, p36)
                u33.CFrame = u33.CFrame:Lerp(u35.CFrame, p36)
            end, 0, 1)
        end
        local u37 = u2:playAnimation(u28, u12:getAssetId(u11.BOOK_OPEN))
        if not u37 then
            return nil
        end
        u29:GiveTask(task.delay(u37.Length - 0.1, function() --[[ Line: 106 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u2
                [3] = u28
                [4] = u12
                [5] = u11
                [6] = u6
                [7] = u29
            --]]
            u37 = u2:playAnimation(u28, u12:getAssetId(u11.SING_ALONG))
            for v38, v39 in u6.Assets.Effects.MusicParticles:Clone():GetChildren() do
                local _ = v38 - 1
                if v39:IsA("ParticleEmitter") then
                    v39.Parent = u28.PrimaryPart
                    u29:GiveTask(v39)
                end
            end
        end))
        u29:GiveTask(function() --[[ Line: 120 ]]
            --[[
            Upvalues:
                [1] = u37
            --]]
            local v40 = u37
            if v40 ~= nil then
                v40:Stop()
            end
            local v41 = u37
            if v41 ~= nil then
                v41:Destroy()
            end
        end)
    end
    function u23.onDisable(_, _, _, _) --[[ Line: 132 ]] end
    v20:registerHandler(v21, u23)
end
u3.CreateController(u15.new())
return nil