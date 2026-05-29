local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scalePart
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.ReplicatedStorage
local u10 = v8.RunService
local u11 = v8.Workspace
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u16 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 39 ]]
        return "ElkKillEffect"
    end,
    ["__index"] = u16
})
u17.__index = u17
function u17.new(...) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20, p21) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.constructor(p20, p21)
    u16.setPlayDefaultKillEffect(p20, false)
end
function u17.onKill(p22, _, p23, u24) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u11
        [3] = u16
        [4] = u9
        [5] = u15
        [6] = u4
        [7] = u14
        [8] = u3
        [9] = u13
        [10] = u12
        [11] = u10
        [12] = u5
        [13] = u7
    --]]
    local u25 = u6.new()
    p23.Archivable = true
    local u26 = p23:Clone()
    u26.HumanoidRootPart.Anchored = true
    u26.Parent = u11
    u16.hideCharacter(p22, p23)
    u25:GiveTask(u26)
    local u27 = u9.Assets.Effects.ElkKillEffect:Clone()
    u27.PrimaryPart.Anchored = true
    u27:PivotTo(u24)
    u27.Parent = u11
    u15:playEffects({ u27.body_mesh.Particle }, nil, {
        ["destroyAfterSec"] = 4.8
    })
    u25:GiveTask(u27)
    u25:GiveTask(u4:playSound(u14.ELK_SUMMON, {
        ["rollOffMaxDistance"] = 100,
        ["position"] = u26:GetPrimaryPartCFrame().Position,
        ["parent"] = u26.PrimaryPart
    }))
    u25:GiveTask(u4:playSound(u14.ELK_CHARGING_LOOP, {
        ["volumeMultiplier"] = 2,
        ["rollOffMaxDistance"] = 150,
        ["position"] = u27:GetPrimaryPartCFrame().Position,
        ["parent"] = u27.PrimaryPart
    }))
    local v28 = u3:playAnimation(u27.AnimationController.Animator, u13:getAssetId(u12.ELK_CHARGING), {
        ["looped"] = true
    })
    if v28 then
        u25:GiveTask(v28)
    end
    local u29 = false
    local u30 = 0
    u25:GiveTask(u10.Heartbeat:Connect(function(p31) --[[ Line: 90 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u27
            [3] = u5
            [4] = u24
            [5] = u24
            [6] = u29
            [7] = u4
            [8] = u14
            [9] = u26
            [10] = u9
            [11] = u7
            [12] = u11
            [13] = u15
        --]]
        u30 = u30 + p31
        local v32 = u27.body_mesh
        local v33 = u30
        local v34
        if v33 <= 1 then
            v34 = u5(v33, 1, -1, 1)
        else
            v34 = v33 <= 3.8 and 0 or u5(v33 - 3.8, 0, 1, 1)
        end
        v32.Transparency = v34
        local v35 = u5(u30, -100, 200, 4.8)
        local v36 = Vector3.new(v35, 0, 0)
        local v37 = u5(u30 + 0.05, -100, 200, 4.8)
        local v38 = v36 - Vector3.new(v37, 0, 0)
        local u39 = v38.Magnitude <= 0 and Vector3.new(1, 0, 0) or CFrame.Angles(0, -3.141592653589793, 0):VectorToWorldSpace(v38.Unit)
        local v40 = u24.Position + v36
        local v41 = u30 * 3
        local v42 = math.sin(v41)
        local v43 = v40 + Vector3.new(0, v42, 0)
        u27:PivotTo(CFrame.lookAt(v43, v43 + u39))
        if u24.Position.X + v36.X > u24.Position.X then
            if not u29 then
                u4:playSound(u14.ELK_UPPERCUT, {
                    ["rollOffMaxDistance"] = 100,
                    ["position"] = u27:GetPrimaryPartCFrame().Position,
                    ["parent"] = u27.PrimaryPart
                })
                u26:BreakJoints()
                local v44 = u26:GetDescendants()
                local function v50(p45) --[[ Line: 110 ]]
                    --[[
                    Upvalues:
                        [1] = u39
                    --]]
                    if p45:IsA("BasePart") then
                        p45.CanCollide = false
                        local v46 = (u39 + Vector3.new(0, 1, 0)).Unit
                        local v47 = math.random(50, 100)
                        local v48 = math.random(100, 200)
                        local v49 = math.random
                        p45.AssemblyLinearVelocity = v46 * Vector3.new(v47, v48, v49(50, 100))
                    end
                end
                for v51, v52 in v44 do
                    v50(v52, v51 - 1, v44)
                end
                local u53 = u9.Assets.Effects.SnowBlast:Clone()
                u7(u53, 5)
                u53.Parent = u11
                u15:playEffects({ u53 }, nil)
                u53.CFrame = CFrame.new(u26.PrimaryPart.Position)
                task.delay(2, function() --[[ Line: 127 ]]
                    --[[
                    Upvalues:
                        [1] = u53
                    --]]
                    u53:Destroy()
                end)
            end
            u29 = true
        end
    end))
    task.delay(4.8, function() --[[ Line: 134 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        u25:DoCleaning()
    end)
    return u25
end
return u17