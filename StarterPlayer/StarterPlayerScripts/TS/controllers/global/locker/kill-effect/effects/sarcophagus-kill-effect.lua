local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.SoundManager
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u6 = v5.OutExpo
local u7 = v5.SoftSpring
local u8 = v5.Spring
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.ReplicatedStorage
local u12 = v10.Workspace
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u17 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "SarcophagusKillEffect"
    end,
    ["__index"] = u17
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
function u18.constructor(p21, p22) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17.constructor(p21, p22)
    u17.setPlayDefaultKillEffect(p21, false)
end
function u18.onKill(u23, _, p24, p25) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u12
        [3] = u4
        [4] = u15
        [5] = u17
        [6] = u11
        [7] = u3
        [8] = u14
        [9] = u16
        [10] = u1
        [11] = u8
        [12] = u7
    --]]
    local u26 = u9.new()
    p24.Archivable = true
    local u27 = p24:Clone()
    u27.HumanoidRootPart.Anchored = true
    u27.Parent = u12
    u26:GiveTask(u27)
    local v28 = u27:GetPrimaryPartCFrame()
    u26:GiveTask(u4:playSound(u15.SARCOPHAGUS_KILL_EFFECT, {
        ["rollOffMaxDistance"] = 80,
        ["position"] = p25.Position
    }))
    u17.hideCharacter(u23, p24)
    local u29 = u11.Assets.Misc.sarcophagus:Clone()
    for v30, v31 in u29:GetDescendants() do
        local _ = v30 - 1
        if v31:IsA("BasePart") then
            u3:setQueryIgnored(v31, true)
            v31.CanCollide = false
        end
    end
    local v32 = v28.Position
    local v33 = -(select(2, u29:GetBoundingBox()).Y / 2.6)
    local v34 = u14 * 1.8
    local v35 = Vector3.new(0, v33, v34)
    local u36 = CFrame.new(v32 - v35) * CFrame.Angles(0, 3.141592653589793, 0)
    local v37 = u14 * 4
    u29:PivotTo(u36 - Vector3.new(0, v37, 0))
    u29:ScaleTo(1.25)
    u29.Parent = u12
    u26:GiveTask(u29)
    task.delay(0.18, function() --[[ Line: 76 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u12
            [3] = u29
            [4] = u36
            [5] = u16
            [6] = u26
        --]]
        local v38 = u11.Assets.Effects.DustLandEffect:Clone()
        v38.Parent = u12
        local v39 = select(2, u29:GetBoundingBox()).Y / 2
        v38.CFrame = u36 - Vector3.new(0, v39, 0)
        u16:playEffects({ v38 }, nil, {
            ["destroyAfterSec"] = 3
        })
        u26:GiveTask(v38)
    end)
    local u49 = u1.Promise.new(function() --[[ Line: 86 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u29
            [3] = u36
            [4] = u8
            [5] = u7
            [6] = u11
            [7] = u12
            [8] = u16
            [9] = u26
            [10] = u27
            [11] = u14
        --]]
        u23:tweenCFrame(u29, u36, 0.3, u8):Wait()
        local v40 = u29.front:GetPivot()
        local v41 = u23
        local v42 = u29.front
        local v43 = u29.front:GetPivot()
        local v44 = CFrame.new(-3, 0, 0)
        local v45 = CFrame.Angles(0, -0.3490658503988659, 0)
        v41:tweenCFrame(v42, v43 * v44 * v45, 0.4, u7):Wait()
        local v46 = u11.Assets.Effects.DustLandEffect:Clone()
        v46.Parent = u12
        v46.CFrame = u36 * CFrame.Angles(1.5707963267948966, 0, 0)
        u16:playEffects({ v46 }, nil, {
            ["destroyAfterSec"] = 3
        })
        u26:GiveTask(v46)
        u23:tweenCFrame(u27, v40 - Vector3.new(0, -0.5, 0.8), 0.4, u7):Wait()
        u23:tweenCFrame(u29.front, v40, 0.4, u7):Wait()
        u27:Destroy()
        local v47 = u23
        local v48 = u14 * 5
        v47:tweenCFrame(u29, u36 - Vector3.new(0, v48, 0), 0.65):Wait()
        u26:DoCleaning()
    end)
    u26:GiveTask(function() --[[ Line: 117 ]]
        --[[
        Upvalues:
            [1] = u49
        --]]
        return u49:cancel()
    end)
    return u26
end
function u18.tweenCFrame(_, u50, p51, p52, p53) --[[ Line: 122 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u6
    --]]
    return u13(p52 == nil and 0.3 or p52, p53 or u6, function(p54) --[[ Line: 127 ]]
        --[[
        Upvalues:
            [1] = u50
        --]]
        return u50:PivotTo(p54)
    end, u50:GetPivot(), p51)
end
return u18