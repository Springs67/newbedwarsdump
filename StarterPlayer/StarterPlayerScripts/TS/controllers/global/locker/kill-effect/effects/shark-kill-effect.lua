local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.TweenService
local u9 = v6.Workspace
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u14 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "SharkKillEffect"
    end,
    ["__index"] = u14
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
function u15.constructor(p18, p19) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.constructor(p18, p19)
    u14.setPlayDefaultKillEffect(p18, false)
end
function u15.onKill(p20, _, p21, p22) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u9
        [3] = u14
        [4] = u7
        [5] = u8
        [6] = u13
        [7] = u4
        [8] = u12
        [9] = u3
        [10] = u11
        [11] = u10
    --]]
    local u23 = u5.new()
    p21.Archivable = true
    local u24 = p21:Clone()
    u24.HumanoidRootPart.Anchored = true
    u24.Parent = u9
    u14.hideCharacter(p20, p21)
    u23:GiveTask(u24)
    local u25 = u7.Assets.Effects.SharkKillEffect:Clone()
    local v26 = u24:GetPivot()
    local v27 = u24.Humanoid.HipHeight
    u25:PivotTo(v26 - Vector3.new(0, v27, 0))
    local function u36(u28, u29) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u8
        --]]
        local v30 = u25:GetDescendants()
        local function v33(p31) --[[ Line: 49 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u8
                [3] = u28
            --]]
            if p31:IsA("BasePart") and p31.Name ~= "RootPart" then
                if u29 ~= 0 and (u29 == u29 and u29) then
                    local v32 = {
                        ["Transparency"] = u28
                    }
                    u8:Create(p31, TweenInfo.new(u29), v32):Play()
                    return
                end
                p31.Transparency = u28
            end
        end
        for v34, v35 in v30 do
            v33(v35, v34 - 1, v30)
        end
    end
    u36(1)
    u25.Parent = u9
    u23:GiveTask(u25)
    local v37 = u7.Assets.Effects.WaterPortalParticles:Clone()
    local v38 = u24.Humanoid.HipHeight
    v37:PivotTo(p22 - Vector3.new(0, v38, 0))
    v37.Parent = u9
    u23:GiveTask(v37)
    u13:playEffects({ v37 }, nil, {
        ["disableEffectsAfterSec"] = 1,
        ["destroyAfterSec"] = 1.75,
        ["sizeMultiplier"] = 2
    })
    u23:GiveTask(u4:playSound(u12.SHARK_BITE, {
        ["volumeMultiplier"] = 2,
        ["position"] = u24:GetPivot().Position
    }))
    u3:playAnimation(u25.AnimationController.Animator, u11:getAssetId(u10.SHARK_BITE), {
        ["looped"] = false,
        ["speed"] = 0.75
    })
    task.delay(0.25, function() --[[ Line: 88 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        u36(0, 0.5)
    end)
    task.delay(0.75, function() --[[ Line: 91 ]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        u24:Destroy()
    end)
    task.delay(1.25, function() --[[ Line: 94 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        u36(1, 0.5)
    end)
    task.delay(1.75, function() --[[ Line: 97 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        u23:DoCleaning()
    end)
    return u23
end
return u15