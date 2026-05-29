local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutCubic
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.Workspace
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u12 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "SkeletonKillEffect"
    end,
    ["__index"] = u12
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
function u13.constructor(p16, p17) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p16, p17)
    u12.setPlayDefaultKillEffect(p16, false)
end
function u13.onKill(p18, _, u19, u20) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u8
        [4] = u7
        [5] = u11
        [6] = u2
        [7] = u10
        [8] = u9
        [9] = u3
    --]]
    local u21 = u4.new()
    local v22 = {}
    local v23 = u5("Part", {
        ["Anchored"] = true,
        ["Transparency"] = 1,
        ["CanCollide"] = false,
        ["CanQuery"] = false,
        ["CanTouch"] = false,
        ["Position"] = u20.Position,
        ["Parent"] = u8
    })
    u21:GiveTask(v23)
    local v24 = u7.Assets.Effects.SmokePuff:Clone()
    table.insert(v22, v24)
    v24.Parent = v23
    local v25 = u7.Assets.Effects.MagicSmoke:Clone()
    table.insert(v22, v25)
    v25.Parent = v23
    u11:playEffects(v22, nil, {
        ["destroyAfterSec"] = 1,
        ["sizeMultiplier"] = 0.25
    })
    u2:playSound(u10.GHOST_PILLAR_ERUPT, {
        ["playbackSpeedMultiplier"] = 1.7,
        ["rollOffMaxDistance"] = 40,
        ["position"] = u20.Position
    })
    u2:playSound(u10.CLUE_DISCOVERED, {
        ["playbackSpeedMultiplier"] = 2,
        ["rollOffMaxDistance"] = 40,
        ["position"] = u20.Position
    })
    u9(0.5, u3, function(p26) --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        for v27, v28 in u19:GetDescendants() do
            local _ = v27 - 1
            if v28:IsA("BasePart") then
                v28.Transparency = p26
            end
        end
    end, 0, 1)
    local u29 = u7.Assets.Misc.Skeleton:Clone()
    u21:GiveTask(u29)
    local v30 = u29:FindFirstChild("TeamIndicator")
    if v30 ~= nil then
        v30:Destroy()
    end
    local v31 = u29:FindFirstChild("3DClothing")
    if v31 ~= nil then
        local v32 = v31:FindFirstChild("Head")
        if v32 ~= nil then
            local v33 = v32:FindFirstChild("Neon")
            if v33 ~= nil then
                v33:Destroy()
            end
        end
    end
    u29:PivotTo(u20)
    p18:scaleModel(u29, 1.15, TweenInfo.new(0))
    for v34, v35 in u29:GetDescendants() do
        local _ = v34 - 1
        if v35:IsA("BasePart") then
            v35.CollisionGroup = "ItemDrops"
            v35.CanCollide = true
            v35.Anchored = true
        end
    end
    u29.Parent = u8
    task.delay(0.5, function() --[[ Line: 110 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u2
            [3] = u10
            [4] = u20
            [5] = u21
        --]]
        for v36, v37 in u29:GetDescendants() do
            local _ = v36 - 1
            if v37:IsA("Motor6D") or v37:IsA("WeldConstraint") then
                v37:Destroy()
            elseif v37:IsA("BasePart") then
                v37.Anchored = false
            end
        end
        u2:playSound(u10.ROCK_CRUMBLE_3, {
            ["rollOffMaxDistance"] = 40,
            ["position"] = u20.Position
        })
        task.delay(3, function() --[[ Line: 127 ]]
            --[[
            Upvalues:
                [1] = u21
            --]]
            u21:DoCleaning()
        end)
    end)
    return u21
end
return u13