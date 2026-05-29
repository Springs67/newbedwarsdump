local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.ReplicatedStorage
local u10 = v8.RunService
local u11 = v8.Workspace
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "BirdKillEffect"
    end,
    ["__index"] = u15
})
u16.__index = u16
function u16.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19, p20) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.constructor(p19, p20)
    u15.setPlayDefaultKillEffect(p19, false)
end
function u16.onKill(p21, _, p22, u23) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u11
        [3] = u15
        [4] = u6
        [5] = u9
        [6] = u4
        [7] = u14
        [8] = u3
        [9] = u13
        [10] = u12
        [11] = u10
        [12] = u5
    --]]
    local u24 = u7.new()
    p22.Archivable = true
    local u25 = p22:Clone()
    u25.HumanoidRootPart.Anchored = true
    u25.Parent = u11
    u15.hideCharacter(p21, p22)
    u24:GiveTask(u25)
    local u26 = u6.GroupMotor.new({
        ["x"] = 0,
        ["y"] = 0,
        ["z"] = 0
    })
    u24:GiveTask(function() --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        u26:destroy()
    end)
    local u27 = u9.Assets.Effects.BirdKillEffect:Clone()
    u27.PrimaryPart.Anchored = true
    u27:PivotTo(u23)
    u27.Parent = u11
    u24:GiveTask(u27)
    u4:playSound(u14.WHITE_RAVEN_FLYING_LOOP, {
        ["volumeMultiplier"] = 2,
        ["rollOffMaxDistance"] = 150,
        ["position"] = u27:GetPrimaryPartCFrame().Position,
        ["parent"] = u27.PrimaryPart
    })
    local v28 = u3:playAnimation(u27.AnimationController.Animator, u13:getAssetId(u12.RAVEN_LOOP), {
        ["looped"] = true
    })
    if v28 then
        u24:GiveTask(v28)
    end
    local u29 = nil
    local u30 = 0
    u24:GiveTask(u10.Heartbeat:Connect(function(p31) --[[ Line: 76 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u5
            [3] = u23
            [4] = u27
            [5] = u23
            [6] = u29
            [7] = u25
            [8] = u4
            [9] = u14
            [10] = u26
            [11] = u6
        --]]
        u30 = u30 + p31
        local v32 = u30
        local v33 = u5(v32, -150, 300, 4)
        local v34 = -100 / (((v32 - 2) / 0.5) ^ 2 + 2) + 50 + 6
        local v35 = Vector3.new(v33, v34, 0)
        local v36 = u30 + 0.05
        local v37 = u5(v36, -150, 300, 4)
        local v38 = -100 / (((v36 - 2) / 0.5) ^ 2 + 2) + 50 + 6
        local v39 = v35 - Vector3.new(v37, v38, 0)
        local v40 = v39.Magnitude <= 0 and Vector3.new(1, 0, 0) or v39.Unit
        local v41 = u23.Position + v35
        local v42 = u30 * 3
        local v43 = math.sin(v42) * 3
        local v44 = v41 + Vector3.new(0, v43, 0)
        u27:PivotTo(CFrame.lookAt(v44, v44 + v40))
        if u23.Position.X + v35.X > u23.Position.X then
            if u29 == nil then
                u29 = u25:GetPrimaryPartCFrame().Y - u27:GetPrimaryPartCFrame().Y
                u4:playSound(u14.WHITE_RAVEN_SNATCH, {
                    ["rollOffMaxDistance"] = 100,
                    ["position"] = u27:GetPrimaryPartCFrame().Position,
                    ["parent"] = u27.PrimaryPart
                })
            end
            local v45, v46, v47 = (u27:GetPrimaryPartCFrame() * CFrame.Angles(0, 3.141592653589793, 0)):ToOrientation()
            u26:setGoal({
                ["x"] = u6.Spring.new(v45, {
                    ["frequency"] = 2,
                    ["dampingRatio"] = 0.1
                }),
                ["y"] = u6.Spring.new(v46, {
                    ["frequency"] = 1,
                    ["dampingRatio"] = 0.1
                }),
                ["z"] = u6.Spring.new(v47, {
                    ["frequency"] = 1,
                    ["dampingRatio"] = 0.1
                })
            })
            local v48 = u26:getValue()
            local v49 = u25
            local v50 = u27:GetPrimaryPartCFrame()
            local v51 = CFrame.new(0, u29, 0)
            v49:PivotTo(CFrame.new((v50 * v51).Position) * CFrame.fromOrientation(v48.x, v48.y, v48.z))
        end
    end))
    task.delay(4.8, function() --[[ Line: 122 ]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        u24:DoCleaning()
    end)
    return u24
end
return u16