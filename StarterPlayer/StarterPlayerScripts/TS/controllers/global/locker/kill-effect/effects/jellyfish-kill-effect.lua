local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u6 = v5.InOutQuad
local u7 = v5.InQuad
local u8 = v5.OutQuad
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.ReplicatedStorage
local u12 = v10.Workspace
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "JellyfishKillEffect"
    end,
    ["__index"] = u17
})
u18.__index = u18
function u18.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21, p22) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17.constructor(p21, p22)
    u17.setPlayDefaultKillEffect(p21, false)
end
function u18.onKill(u23, _, u24, u25) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u1
        [3] = u12
        [4] = u17
        [5] = u16
        [6] = u11
        [7] = u15
        [8] = u14
        [9] = u13
        [10] = u8
        [11] = u4
        [12] = u3
        [13] = u6
        [14] = u7
    --]]
    local u26 = u9.new()
    local u50 = u1.Promise.new(function() --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u12
            [3] = u26
            [4] = u17
            [5] = u23
            [6] = u16
            [7] = u11
            [8] = u25
            [9] = u15
            [10] = u14
            [11] = u13
            [12] = u8
            [13] = u4
            [14] = u3
            [15] = u6
            [16] = u7
        --]]
        u24.Archivable = true
        local v27 = u24:Clone()
        v27.HumanoidRootPart.Anchored = true
        v27.Parent = u12
        u26:GiveTask(v27)
        local v28 = v27:FindFirstChild("_DamageHighlight_")
        if v28 then
            v28:Destroy()
        end
        u17.hideCharacter(u23, u24)
        local v29 = { u16.JELLYFISH_DEPLOY_1, u16.JELLYFISH_DEPLOY_2, u16.JELLYFISH_DEPLOY_3 }
        local _ = { u16.JELLYFISH_ZAP_1, u16.JELLYFISH_ZAP_2 }
        local _ = {
            u16.JELLYFISH_PULSE_2,
            u16.JELLYFISH_PULSE_3,
            u16.JELLYFISH_PULSE_4,
            u16.JELLYFISH_PULSE_5
        }
        local u30 = u11.Assets.Misc.Jellyfish:Clone()
        u26:GiveTask(u30)
        u30:ScaleTo(4)
        u30:WaitForChild("RootPart")
        for v31, v32 in u30:GetChildren() do
            local _ = v31 - 1
            if v32:IsA("MeshPart") then
                v32.LocalTransparencyModifier = 1
            end
        end
        local v33 = u25.Position
        u30:PivotTo(CFrame.new(v33 + Vector3.new(0, 15, 0)))
        u30.Parent = u12
        local v34 = Instance.new("AnimationController")
        v34.Parent = u30
        local v35 = Instance.new("Animator")
        v35.Parent = v34
        v35:LoadAnimation(u15:getAnimation(u14.JELLYFISH_SPAWN))
        local v36 = v35:LoadAnimation(u15:getAnimation(u14.JELLYFISH_MOUNT_IDLE))
        v35:LoadAnimation(u15:getAnimation(u14.JELLYFISH_ATTACK))
        v36:Play()
        task.spawn(function() --[[ Line: 92 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u13
                [3] = u8
            --]]
            local v37 = u30:GetChildren()
            local function v40(u38) --[[ Line: 94 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u8
                --]]
                if u38:IsA("MeshPart") then
                    u38.LocalTransparencyModifier = 1
                    u13(1.5, u8, function(p39) --[[ Line: 97 ]]
                        --[[
                        Upvalues:
                            [1] = u38
                        --]]
                        u38.LocalTransparencyModifier = p39
                        return u38.LocalTransparencyModifier
                    end, 1, 0):Play()
                end
            end
            for v41, v42 in v37 do
                v40(v42, v41 - 1, v37)
            end
        end)
        local u43 = u30:GetPivot().Position
        u4:playSound(u3.fromList(unpack(v29)), {
            ["position"] = u43
        })
        local u44 = u25.Position + Vector3.new(0, 0, 0)
        u13(2, u6, function(p45) --[[ Line: 116 ]]
            --[[
            Upvalues:
                [1] = u43
                [2] = u44
                [3] = u30
            --]]
            local v46 = u43:Lerp(u44, p45)
            u30:PivotTo(CFrame.new(v46))
        end, 0, 1):Play():Wait()
        v27.Parent = u30
        local u47 = u44 + Vector3.new(0, 200, 0)
        u13(4.5, u7, function(p48) --[[ Line: 125 ]]
            --[[
            Upvalues:
                [1] = u44
                [2] = u47
                [3] = u30
            --]]
            local v49 = u44:Lerp(u47, p48)
            u30:PivotTo(CFrame.new(v49))
        end, 0, 1):Play():Wait()
        u26:Destroy()
    end)
    u26:GiveTask(function() --[[ Line: 132 ]]
        --[[
        Upvalues:
            [1] = u50
        --]]
        return u50:cancel()
    end)
    return u26
end
return u18