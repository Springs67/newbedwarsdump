local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.TweenService
local u8 = v6.Workspace
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "SpiritAssassinKillEffect"
    end,
    ["__index"] = u13
})
u14.__index = u14
function u14.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17, p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.constructor(p17, p18)
    u13.setPlayDefaultKillEffect(p17, false)
end
function u14.onKill(p19, p20, p21, _) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u11
        [3] = u8
        [4] = u13
        [5] = u3
        [6] = u10
        [7] = u9
        [8] = u4
        [9] = u12
    --]]
    local u22 = u5.new()
    local v23 = p21.PrimaryPart
    if v23 ~= nil then
        v23 = v23.CFrame
    end
    if v23 == nil then
        return u22
    end
    local v24 = u11:getEntity(p20)
    if v24 ~= nil then
        v24:hideNametag()
    end
    p21.Archivable = true
    local u25 = p21:Clone()
    u25.HumanoidRootPart.Anchored = true
    u25.Parent = u8
    local v26 = u25.Humanoid.Animator
    u13.hideCharacter(p19, p21)
    u22:GiveTask(u25)
    local v27 = u3:playAnimation(v26, u10:getAssetId(u9.SPIRIT_ASSASSIN_KILL_EFFECT_PLAYER), {
        ["looped"] = true
    })
    u22:GiveTask(u4:playSound(u12.SPIRIT_ASSASSIN_GHOST_DRAG, {
        ["rollOffMaxDistance"] = 160,
        ["looped"] = false,
        ["volumeMultiplier"] = 0.8,
        ["position"] = v23.Position
    }))
    u22:GiveTask(p19:setupGhosts(u25, v23, u22))
    if v27 ~= nil then
        v27.Stopped:Connect(function() --[[ Line: 68 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u25
            --]]
            local v28 = u22
            if v28 ~= nil then
                v28:DoCleaning()
            end
            local v29 = u25
            if v29 ~= nil then
                v29:Destroy()
            end
        end)
    end
    task.delay(7.12, function() --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u25
        --]]
        local v30 = u22
        if v30 ~= nil then
            v30:DoCleaning()
        end
        local v31 = u25
        if v31 ~= nil then
            v31:Destroy()
        end
    end)
    return u22
end
function u14.setupGhosts(p32, p33, p34, p35) --[[ Line: 91 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u3
        [3] = u10
        [4] = u9
    --]]
    local u36 = p33:Clone()
    local u37 = p33:Clone()
    local u38 = p33:Clone()
    local v39 = { u36, u37, u38 }
    u36.HumanoidRootPart.Anchored = true
    u36.Parent = u8
    u36:PivotTo(p34)
    u36.Name = "GhostFront"
    u37.HumanoidRootPart.Anchored = true
    u37.Parent = u8
    u37:PivotTo(p34)
    u37.Name = "GhostBack1"
    u38.HumanoidRootPart.Anchored = true
    u38.Parent = u8
    u38:PivotTo(p34)
    u38.Name = "GhostBack2"
    local v40 = u36.Humanoid.Animator
    local v41 = u37.Humanoid.Animator
    local v42 = u38.Humanoid.Animator
    local v43 = u3:playAnimation(v40, u10:getAssetId(u9.SPIRIT_ASSASSIN_KILL_EFFECT_GHOST_1), {
        ["looped"] = false
    })
    local v44 = u3:playAnimation(v41, u10:getAssetId(u9.SPIRIT_ASSASSIN_KILL_EFFECT_GHOST_2), {
        ["looped"] = false
    })
    local v45 = u3:playAnimation(v42, u10:getAssetId(u9.SPIRIT_ASSASSIN_KILL_EFFECT_GHOST_3), {
        ["looped"] = false
    })
    if v43 ~= nil then
        v43.Stopped:Connect(function() --[[ Line: 123 ]]
            --[[
            Upvalues:
                [1] = u36
            --]]
            local v46 = u36
            if v46 ~= nil then
                v46:Destroy()
            end
        end)
    end
    if v44 ~= nil then
        v44.Stopped:Connect(function() --[[ Line: 132 ]]
            --[[
            Upvalues:
                [1] = u37
            --]]
            local v47 = u37
            if v47 ~= nil then
                v47:Destroy()
            end
        end)
    end
    if v45 ~= nil then
        v45.Stopped:Connect(function() --[[ Line: 141 ]]
            --[[
            Upvalues:
                [1] = u38
            --]]
            local v48 = u38
            if v48 ~= nil then
                v48:Destroy()
            end
        end)
    end
    p35:GiveTask(u36)
    p35:GiveTask(u37)
    p35:GiveTask(u38)
    p32:applyGhostEffects(v39)
    return p35
end
function u14.applyGhostEffects(_, p49) --[[ Line: 154 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local function v52(p50) --[[ Line: 156 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        for _, v51 in p50:GetDescendants() do
            if v51:IsA("BasePart") and v51.Transparency < 0.5 then
                if v51:GetAttribute("SpiritTransparency") == nil then
                    v51:SetAttribute("SpiritTransparency", v51.Transparency)
                end
                u7:Create(v51, TweenInfo.new(0.1), {
                    ["Transparency"] = 0.369
                }):Play()
                v51.Material = Enum.Material.ForceField
            end
        end
    end
    for v53, v54 in p49 do
        v52(v54, v53 - 1, p49)
    end
end
return u14