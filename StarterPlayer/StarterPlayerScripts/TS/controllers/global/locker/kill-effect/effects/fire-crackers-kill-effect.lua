local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.Workspace
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "math-util").MathUtil
local u12 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "FireCrackersKillEffect"
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
function u13.onKill(p18, _, p19, p20) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u8
        [3] = u12
        [4] = u11
        [5] = u13
    --]]
    local u21 = u5.new()
    p19.Archivable = true
    local v22 = p19:Clone()
    v22.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    v22.HumanoidRootPart.Anchored = false
    v22:PivotTo(p20)
    v22.Parent = u8
    u21:GiveTask(v22)
    u12.hideCharacter(p18, p19)
    local v23 = 0
    local v24 = {}
    local u25 = 0
    for v26, v27 in v22:GetDescendants() do
        local _ = v26 - 1
        if v27:IsA("BasePart") == true then
            v23 = v23 + 1
            v24[v23] = v27
        end
    end
    table.sort(v24, function(p28, p29) --[[ Line: 57 ]]
        return p28.Position.Y > p29.Position.Y
    end)
    local function v45(u30) --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u11
            [3] = u13
            [4] = u21
        --]]
        local v31 = u25 * u11.randomFloatMaxInclusive(u13.DELAY_RANGE.Min, u13.DELAY_RANGE.Max)
        u30.CollisionGroup = "Players"
        u30.Anchored = false
        u30.CanCollide = true
        for v32, u33 in u30:GetJoints() do
            local _ = v32 - 1
            u21:GiveTask(task.delay(v31, function() --[[ Line: 69 ]]
                --[[
                Upvalues:
                    [1] = u33
                --]]
                u33:Destroy()
            end))
        end
        u21:GiveTask(task.delay(v31, function() --[[ Line: 76 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u13
                [3] = u21
                [4] = u11
            --]]
            local v34 = u30
            local v35 = math.random(-15, 15)
            local v36 = math.random(10, 20)
            local v37 = math.random
            v34:ApplyImpulse((Vector3.new(v35, v36, v37(-15, 15))))
            u13:playExplosionAtPart(u30, math.random(0.1, 0.25), u21)
            local u38 = math.random(1, 5)
            u21:GiveTask(task.spawn(function() --[[ Line: 80 ]]
                --[[
                Upvalues:
                    [1] = u38
                    [2] = u11
                    [3] = u13
                    [4] = u30
                    [5] = u21
                --]]
                local v39 = false
                local v40 = 0
                while true do
                    if v39 then
                        v40 = v40 + 1
                    else
                        v39 = true
                    end
                    if v40 >= u38 then
                        return
                    end
                    task.wait(u11.randomFloatMaxInclusive(0.5, 1))
                    u13:playExplosionAtPart(u30, u11.randomFloatMaxInclusive(0.25, 0.35), u21)
                    if v40 == u38 - 1 then
                        u30:Destroy()
                    else
                        local v41 = u30
                        local v42 = math.random(-15, 15)
                        local v43 = math.random(10, 20)
                        local v44 = math.random
                        v41:ApplyImpulse((Vector3.new(v42, v43, v44(-15, 15))))
                    end
                end
            end))
        end))
        u25 = u25 + 1
    end
    for v46, v47 in v24 do
        v45(v47, v46 - 1, v24)
    end
    task.delay(#v24 * u13.DELAY_RANGE.Max + 5, function() --[[ Line: 109 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        u21:DoCleaning()
    end)
    return u21
end
function u13.playExplosionAtPart(_, p48, p49, p50) --[[ Line: 114 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
        [3] = u10
        [4] = u3
        [5] = u13
        [6] = u4
    --]]
    local v51 = p49 == nil and 0.5 or p49
    local v52 = u7.Assets.Effects.Explosion:Clone()
    v52.Position = p48.Position
    v52.Parent = u8
    p50:GiveTask(v52)
    u10:playEffects({ v52 }, nil, {
        ["destroyAfterSec"] = 1,
        ["sizeMultiplier"] = v51
    })
    local v53 = u3.fromList
    local v54 = u13.sounds
    u4:playSound(v53(unpack(v54)), {
        ["position"] = p48.Position
    })
end
u13.sounds = {
    v9.FIRECRACKER_BANG_SHORT_1,
    v9.FIRECRACKER_BANG_SHORT_2,
    v9.FIRECRACKER_BANG_SHORT_3,
    v9.FIRECRACKER_BANG_SHORT_4,
    v9.FIRECRACKER_BANG_SHORT_5,
    v9.FIRECRACKER_BANG_SHORT_6,
    v9.FIRECRACKER_BANG_SHORT_7,
    v9.FIRECRACKER_BANG_SHORT_8,
    v9.FIRECRACKER_BANG_SHORT_9,
    v9.FIRECRACKER_BANG_SHORT_10
}
u13.DELAY_RANGE = NumberRange.new(0.25, 0.4)
return u13