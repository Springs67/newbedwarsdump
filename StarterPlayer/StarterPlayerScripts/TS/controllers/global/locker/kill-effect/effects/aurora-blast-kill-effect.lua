local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u6 = v5.InOutExpo
local u7 = v5.InOutSine
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.ReplicatedStorage
local u11 = v9.TweenService
local u12 = v9.Workspace
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u18 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "AuroraBlastKillEffect"
    end,
    ["__index"] = u18
})
u19.__index = u19
function u19.new(...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22, p23) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    u18.constructor(p22, p23)
    u18.setPlayDefaultKillEffect(p22, false)
end
function u19.onKill(p24, _, p25, p26) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u12
        [3] = u18
        [4] = u3
        [5] = u15
        [6] = u14
        [7] = u10
        [8] = u13
        [9] = u6
        [10] = u4
        [11] = u16
        [12] = u17
        [13] = u7
        [14] = u11
    --]]
    local u27 = u8.new()
    p25.Archivable = true
    local u28 = p25:Clone()
    u28.HumanoidRootPart.Anchored = true
    u28:PivotTo(p26)
    u28.Parent = u12
    u27:GiveTask(u28)
    u18.hideCharacter(p24, p25)
    local v29 = u28:FindFirstChild("Humanoid")
    if v29 ~= nil then
        v29 = v29:FindFirstChild("Animator")
    end
    local u30 = u3:playAnimation(v29, u15:getAssetId(u14.RAVEN_ATTACK_KILL_EFFECT), {
        ["looped"] = false
    })
    u27:GiveTask(function() --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        local v31 = u30
        if v31 ~= nil then
            v31 = v31:Destroy()
        end
        return v31
    end)
    local v32 = u10.Assets.Effects.AuroraBlast:Clone()
    v32:PivotTo(p26)
    v32.Parent = u12
    u27:GiveTask(v32)
    local u33 = v32.aurora
    local u34 = v32.blast
    local u35 = u33.start
    local u36 = u33["end"]
    local u37 = u33.starthead
    local u38 = u33.endhead
    local v39 = u34.blast
    local u40 = p26.Position
    local u41 = u40 + Vector3.new(-6, 0, 6)
    local u42 = u40 + Vector3.new(6, 0, -6)
    local u43 = u40 + Vector3.new(6, 0, 6)
    local u44 = u40 + Vector3.new(-6, 0, -6)
    u35.WorldPosition = u40
    u36.WorldPosition = u40
    u37.WorldPosition = u40
    u38.WorldPosition = u40
    v39.WorldPosition = u40
    local u46 = u13(2.5, u6, function(p45) --[[ Line: 91 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u40
            [3] = u41
            [4] = u36
            [5] = u42
            [6] = u37
            [7] = u43
            [8] = u38
            [9] = u44
        --]]
        u35.WorldPosition = u40:Lerp(u41, p45)
        u36.WorldPosition = u40:Lerp(u42, p45)
        u37.WorldPosition = u40:Lerp(u43, p45)
        u38.WorldPosition = u40:Lerp(u44, p45)
    end, 0, 1)
    u46:Play()
    u27:GiveTask(function() --[[ Line: 99 ]]
        --[[
        Upvalues:
            [1] = u46
        --]]
        if u46.Running then
            u46:Cancel()
        end
    end)
    local u47 = u4:playSound(u16.WIND_TUNNEL_FLYING, {
        ["volumeMultiplier"] = 0.5,
        ["looped"] = true,
        ["position"] = u28:GetPivot().Position
    })
    u4:tweenSoundVolume(u47, 0.5, 0.5)
    u27:GiveTask(function() --[[ Line: 110 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u47
        --]]
        u4:tweenSoundVolume(u47, 0, 0.5)
        task.delay(0.5, function() --[[ Line: 112 ]]
            --[[
            Upvalues:
                [1] = u47
            --]]
            u47:Destroy()
        end)
    end)
    u27:GiveTask(task.delay(2.6, function() --[[ Line: 116 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u16
            [3] = u28
            [4] = u17
            [5] = u34
            [6] = u41
            [7] = u42
            [8] = u43
            [9] = u44
            [10] = u13
            [11] = u7
            [12] = u35
            [13] = u36
            [14] = u37
            [15] = u38
            [16] = u27
            [17] = u33
            [18] = u11
        --]]
        u4:playSound(u16.COMET_VOLLEY_HERO_ORE, {
            ["position"] = u28:GetPivot().Position
        })
        u17:playInstanceEffects({ u34 }, {
            ["particleMultiplier"] = 3
        })
        local u48 = u41 + Vector3.new(-2, 0, 2)
        local u49 = u42 + Vector3.new(2, 0, -2)
        local u50 = u43 + Vector3.new(2, 0, 2)
        local u51 = u44 + Vector3.new(-2, 0, -2)
        local u53 = u13(0.5, u7, function(p52) --[[ Line: 132 ]]
            --[[
            Upvalues:
                [1] = u35
                [2] = u41
                [3] = u48
                [4] = u36
                [5] = u42
                [6] = u49
                [7] = u37
                [8] = u43
                [9] = u50
                [10] = u38
                [11] = u44
                [12] = u51
            --]]
            u35.WorldPosition = u41:Lerp(u48, p52)
            u36.WorldPosition = u42:Lerp(u49, p52)
            u37.WorldPosition = u43:Lerp(u50, p52)
            u38.WorldPosition = u44:Lerp(u51, p52)
        end, 0, 1)
        u53:Play()
        u27:GiveTask(function() --[[ Line: 139 ]]
            --[[
            Upvalues:
                [1] = u53
            --]]
            if u53.Running then
                u53:Cancel()
            end
        end)
        u17:tweenEffectTransparency({ u33 }, 1, 0.5)
        u28:BreakJoints()
        local v54 = u28:GetDescendants()
        local function v63(p55) --[[ Line: 147 ]]
            if p55:IsA("BasePart") then
                p55.CanCollide = false
                local v56 = math.random()
                local v57 = 0.5 + math.random() * 0.1
                local v58 = math.random
                local v59 = Vector3.new(v56, v57, v58()).Unit
                local v60 = math.random(50, 100)
                local v61 = math.random(100, 200)
                local v62 = math.random
                p55.AssemblyLinearVelocity = v59 * Vector3.new(v60, v61, v62(50, 100))
            end
        end
        for v64, v65 in v54 do
            v63(v65, v64 - 1, v54)
        end
        u27:GiveTask(task.delay(0.5, function() --[[ Line: 158 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u11
            --]]
            for _, v66 in u28:GetDescendants() do
                if v66:IsA("BasePart") then
                    v66.Material = Enum.Material.Neon
                    u11:Create(v66, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                        ["Transparency"] = 1
                    }):Play()
                elseif v66:IsA("Decal") then
                    u11:Create(v66, TweenInfo.new(0.5), {
                        ["Transparency"] = 1
                    }):Play()
                end
            end
        end))
    end))
    u27:GiveTask(task.delay(5.1, function() --[[ Line: 173 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27:DoCleaning()
    end))
    return u27
end
return u19