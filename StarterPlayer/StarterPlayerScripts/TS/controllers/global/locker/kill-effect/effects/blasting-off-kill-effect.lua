local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.RandomUtil
local u5 = v2.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.ReplicatedStorage
local u9 = v7.TweenService
local u10 = v7.Workspace
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "BlastingOffKillEffect"
    end,
    ["__index"] = u15
})
u16.__index = u16
function u16.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19, p20) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.constructor(p19, p20)
    u15.setPlayDefaultKillEffect(p19, false)
end
function u16.onKill(u21, p22, p23, _) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u13
        [3] = u10
        [4] = u15
        [5] = u4
        [6] = u12
        [7] = u11
        [8] = u3
        [9] = u5
        [10] = u14
    --]]
    local u24 = u6.new()
    local u25 = p23.PrimaryPart
    if u25 ~= nil then
        u25 = u25.CFrame
    end
    if u25 == nil then
        return u24
    end
    p23.Archivable = true
    local v26 = u13:getEntity(p22)
    if v26 ~= nil then
        v26:hideNametag()
    end
    p23.Archivable = true
    local u27 = p23:Clone()
    u27.HumanoidRootPart.Anchored = true
    u27.Parent = u10
    local v28 = u27.Humanoid.Animator
    u15.hideCharacter(u21, p23)
    u24:GiveTask(u27)
    local u29 = u27.PrimaryPart
    if u29 == nil then
        return u24
    end
    local u30 = u3:playAnimation(v28, (u4.fromList(u12:getAssetId(u11.BLASTING_OFF_AGAIN_0), u12:getAssetId(u11.BLASTING_OFF_AGAIN_1), u12:getAssetId(u11.BLASTING_OFF_AGAIN_2), u12:getAssetId(u11.BLASTING_OFF_AGAIN_3), u12:getAssetId(u11.BLASTING_OFF_AGAIN_4))))
    if u30 ~= nil then
        u30:AdjustSpeed(0.7)
    end
    if u30 ~= nil then
        u30:GetMarkerReachedSignal("BlastingOffEnd"):Connect(function() --[[ Line: 73 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u21
                [3] = u24
                [4] = u25
                [5] = u29
                [6] = u27
                [7] = u5
                [8] = u14
            --]]
            local v31 = u30
            if v31 ~= nil then
                v31:AdjustSpeed(0)
            end
            u21:tweenDeadPlayer(u24, u25.Position, u29, u27)
            local v32 = u24
            local v33 = u5
            local v34 = u14.BLASTING_OFF_YELL
            local v35 = {}
            local v36 = u29
            if v36 ~= nil then
                v36 = v36.Position
            end
            v35.position = v36
            v35.parent = u29
            v35.volumeMultiplier = 1.4
            v35.rollOffMaxDistance = 280
            v32:GiveTask(v33:playSound(v34, v35))
            task.delay(4.6000000000000005, function() --[[ Line: 93 ]]
                --[[
                Upvalues:
                    [1] = u27
                --]]
                local v37 = u27
                if v37 ~= nil then
                    v37:Destroy()
                end
            end)
            task.delay(5.7, function() --[[ Line: 99 ]]
                --[[
                Upvalues:
                    [1] = u24
                    [2] = u5
                    [3] = u14
                    [4] = u27
                --]]
                u24:GiveTask(u5:playSound(u14.BLASTING_OFF_SPARKLE, {
                    ["looped"] = false,
                    ["volumeMultiplier"] = 0.85
                }))
                local v38 = u24
                if v38 ~= nil then
                    v38:DoCleaning()
                end
                local v39 = u27
                if v39 ~= nil then
                    v39:Destroy()
                end
            end)
        end)
    end
    u24:GiveTask(u5:playSound(u14.BLASTING_OFF_JINGLE, {
        ["rollOffMaxDistance"] = 160,
        ["looped"] = false,
        ["volumeMultiplier"] = 0.6,
        ["position"] = u25.Position
    }))
    return u24
end
function u16.tweenDeadPlayer(p40, u41, p42, u43, u44) --[[ Line: 123 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
        [3] = u10
    --]]
    local v45 = p42 + Vector3.new(0, 170, 0)
    local v46 = p40:getRandomDirectionVector(110)
    local v47 = CFrame.new(v45 + v46)
    local v48 = u9:Create(u43, TweenInfo.new(4.7, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0), {
        ["CFrame"] = CFrame.new(v45 + v46)
    })
    local v49 = nil
    local u50 = u8.Assets.Effects.Sparkle:Clone()
    u50.Parent = u10
    u50:PivotTo(v47)
    u50.Anchored = true
    local u51 = v49
    for v52, v53 in u50:GetDescendants() do
        local _ = v52 - 1
        if v53:IsA("ParticleEmitter") then
            v49 = v53
            v49.Enabled = false
            u51 = v49
        end
    end
    v48:Play()
    v48.Completed:Connect(function() --[[ Line: 148 ]]
        --[[
        Upvalues:
            [1] = u43
            [2] = u51
            [3] = u44
            [4] = u41
            [5] = u50
        --]]
        local v54 = u43
        if v54 ~= nil then
            v54:Destroy()
        end
        if u51 ~= nil then
            u51.Enabled = true
            u51:Emit(1)
        end
        local v55 = u44
        if v55 ~= nil then
            v55:Destroy()
        end
        u41:GiveTask(function() --[[ Line: 161 ]]
            --[[
            Upvalues:
                [1] = u51
                [2] = u50
            --]]
            local v56 = u51
            if v56 ~= nil then
                v56:Destroy()
            end
            local v57 = u50
            if v57 ~= nil then
                v57:Destroy()
            end
        end)
    end)
end
function u16.getRandomDirectionVector(_, p58) --[[ Line: 173 ]]
    local v59 = math.random(-1, 1)
    local v60 = math.random(-1, 1)
    local v61 = math.random
    return Vector3.new(v59, v60, v61(-1, 1)).Unit * p58
end
return u16