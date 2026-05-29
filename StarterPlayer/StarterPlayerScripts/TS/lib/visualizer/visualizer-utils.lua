local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.CollectionService
local u6 = v4.ReplicatedStorage
local v7 = v4.Workspace
local u8 = v1.import(script, script.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-meta").StatusEffectMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "visualizer", "visualizer-type").VisualizerAttachments
local u13 = v3("Folder", {
    ["Name"] = "VisualizedEffectInstances",
    ["Parent"] = v7
})
local v14 = {}
local u15 = nil
function v14.visualizeHitEffect(u16, u17, u18) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u2
        [3] = u11
        [4] = u8
    --]]
    local v19 = u18.PrimaryPart
    if v19 ~= nil then
        v19 = v19.Position
    end
    if not v19 then
        return nil
    end
    local v20 = u15(u16, "HitEffect")
    if not v20 then
        return nil
    end
    for _, v21 in v20 do
        local u22 = v21:Clone()
        if not u22 then
            return nil
        end
        task.spawn(function() --[[ Line: 40 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u11
                [3] = u22
                [4] = u18
                [5] = u8
                [6] = u17
                [7] = u16
            --]]
            local u23 = u2.new()
            u11:playEffects(u22:GetChildren(), u18)
            u23:GiveTask(u22)
            task.delay(2, function() --[[ Line: 44 ]]
                --[[
                Upvalues:
                    [1] = u23
                --]]
                u23:DoCleaning()
            end)
            u8.HitEffectVisualized:fire(u23, u17, u16, u18)
        end)
    end
end
local u24 = nil
local u25 = nil
local u26 = nil
function v14.visualizeWeaponEffect(u27, u28, u29, u30) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u15
        [3] = u5
        [4] = u24
        [5] = u12
        [6] = u2
        [7] = u25
        [8] = u26
        [9] = u8
    --]]
    local v31 = u9(u29.Name)
    if not v31.sword then
        return nil
    end
    local v32 = v31.firstPerson
    if v32 ~= nil then
        v32 = v32.scale
    end
    local v33 = v32 == nil and 1 or v32
    local u34 = u29:FindFirstChild("Handle")
    if not u34 then
        return nil
    end
    local v35 = u15(u27, "Weapon")
    if not v35 then
        return nil
    end
    if u29:GetAttribute("Visualizer_" .. u27) == true then
        return nil
    end
    u29:SetAttribute("Visualizer_" .. u27, true)
    for _, v36 in v35 do
        local u37 = v36:Clone()
        if not u37 then
            return nil
        end
        if u30 == 1 then
            u5:AddTag(u37, "visualizer_hidden_in_first")
        else
            u24(u37, v33 * 0.7)
        end
        local u38 = u34:FindFirstChild(u12.VisualTopAttachment)
        local v39 = u34:FindFirstChild(u12.VisualMiddleAttachment)
        local u40 = u34:FindFirstChild(u12.VisualBottomAttachment)
        if not (u40 and (v39 and u38)) then
            return nil
        end
        task.spawn(function() --[[ Line: 95 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u29
                [3] = u27
                [4] = u37
                [5] = u30
                [6] = u25
                [7] = u34
                [8] = u26
                [9] = u40
                [10] = u38
                [11] = u8
                [12] = u28
            --]]
            local v41 = u2.new()
            v41:GiveTask(function() --[[ Line: 97 ]]
                --[[
                Upvalues:
                    [1] = u29
                    [2] = u27
                --]]
                u29:SetAttribute("Visualizer_" .. u27, false)
            end)
            if u37:IsA("ParticleEmitter") then
                local v42 = u37:GetAttribute("ViewmodelRotation")
                if v42 ~= nil and u30 == 0 then
                    u37.Rotation = NumberRange.new(v42)
                end
                u25(v41, u37, u34)
            elseif u37:IsA("Beam") then
                u26(v41, u37, u40, u38)
            end
            u8.WeaponEffectVisualized:fire(v41, u28, u27, u29)
        end)
    end
end
local u43 = nil
function v14.visualizeProjectileEffect(u44, u45, u46) --[[ Line: 115 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u12
        [3] = u2
        [4] = u43
        [5] = u25
        [6] = u8
    --]]
    local v47 = u15(u44, "Projectile")
    if not v47 then
        return nil
    end
    local v48 = 0
    local v49 = {}
    for v50, v52 in u46:GetDescendants() do
        local _ = v50 - 1
        if not v52:IsA("Attachment") then
            local v52 = nil
        end
        if v52 ~= nil then
            v48 = v48 + 1
            v49[v48] = v52
        end
    end
    for _, v53 in v47 do
        local u54 = v53:Clone()
        if not u54 then
            return nil
        end
        local u55 = nil
        for v56, v57 in v49 do
            local _ = v56 - 1
            if v57.Name == u12.VisualTopAttachment == true then
                u55 = v57
                break
            end
        end
        local u58 = nil
        for v59, v60 in v49 do
            local _ = v59 - 1
            if v60.Name == u12.VisualBottomAttachment == true then
                u58 = v60
                break
            end
        end
        if not (u55 and u58) then
            return nil
        end
        task.spawn(function() --[[ Line: 172 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u54
                [3] = u43
                [4] = u58
                [5] = u55
                [6] = u25
                [7] = u8
                [8] = u45
                [9] = u44
                [10] = u46
            --]]
            local u61 = u2.new()
            if u54:IsA("Trail") then
                u43(u61, u54, u58, u55)
            elseif u54:IsA("ParticleEmitter") then
                u25(u61, u54, u55)
            end
            u8.ProjectileEffectVisualized:fire(u61, u45, u44, u46)
            u46.AncestryChanged:Connect(function() --[[ Line: 180 ]]
                --[[
                Upvalues:
                    [1] = u61
                --]]
                u61:DoCleaning()
            end)
        end)
    end
end
function v14.visualizeToolEffect(u62, u63, u64, u65) --[[ Line: 187 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u15
        [3] = u5
        [4] = u24
        [5] = u12
        [6] = u2
        [7] = u25
        [8] = u26
        [9] = u8
    --]]
    local v66 = u9(u64.Name)
    if not v66.breakBlock then
        return nil
    end
    local v67 = v66.firstPerson
    if v67 ~= nil then
        v67 = v67.scale
    end
    local v68 = v67 == nil and 1 or v67
    local u69 = u64:FindFirstChild("Handle")
    if not u69 then
        return nil
    end
    local v70 = u15(u62, "Tool")
    if not v70 then
        return nil
    end
    if u64:GetAttribute("Visualizer_" .. u62) == true then
        return nil
    end
    u64:SetAttribute("Visualizer_" .. u62, true)
    for _, v71 in v70 do
        local u72 = v71:Clone()
        if not u72 then
            return nil
        end
        if u65 == 1 then
            u5:AddTag(u72, "visualizer_hidden_in_first")
        else
            u24(u72, v68 * 0.7)
        end
        local u73 = u69:FindFirstChild(u12.VisualTopAttachment)
        local v74 = u69:FindFirstChild(u12.VisualMiddleAttachment)
        local u75 = u69:FindFirstChild(u12.VisualBottomAttachment)
        if not (u75 and (v74 and u73)) then
            return nil
        end
        task.spawn(function() --[[ Line: 229 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u64
                [3] = u62
                [4] = u72
                [5] = u65
                [6] = u25
                [7] = u69
                [8] = u26
                [9] = u75
                [10] = u73
                [11] = u8
                [12] = u63
            --]]
            local v76 = u2.new()
            v76:GiveTask(function() --[[ Line: 231 ]]
                --[[
                Upvalues:
                    [1] = u64
                    [2] = u62
                --]]
                u64:SetAttribute("Visualizer_" .. u62, false)
            end)
            if u72:IsA("ParticleEmitter") then
                local v77 = u72:GetAttribute("ViewmodelRotation")
                if v77 ~= nil and u65 == 0 then
                    u72.Rotation = NumberRange.new(v77)
                end
                u25(v76, u72, u69)
            elseif u72:IsA("Beam") then
                u26(v76, u72, u75, u73)
            end
            u8.WeaponEffectVisualized:fire(v76, u63, u62, u64)
        end)
    end
end
u24 = function(p78, p79) --[[ Name: scaleFirstPersonVisual, Line 248 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11:scaleEffect({ p78 }, p79)
    if p78:IsA("ParticleEmitter") then
        p78.Lifetime = NumberRange.new(p78.Lifetime.Min * p79, p78.Lifetime.Max * p79)
        p78.Rate = p78.Rate * p79
        local v80 = p78.Transparency.Keypoints
        local v81 = table.create(#v80)
        for v82, v83 in v80 do
            local _ = v82 - 1
            v81[v82] = NumberSequenceKeypoint.new(v83.Time, v83.Value * p79, v83.Envelope * p79)
        end
        p78.Transparency = NumberSequence.new(v81)
    elseif p78:IsA("Beam") then
        local v84 = p78.Transparency.Keypoints
        local v85 = table.create(#v84)
        for v86, v87 in v84 do
            local _ = v86 - 1
            v85[v86] = NumberSequenceKeypoint.new(v87.Time, v87.Value * p79, v87.Envelope * p79)
        end
        p78.Transparency = NumberSequence.new(v85)
    end
end
u26 = function(p88, u89, p90, p91) --[[ Name: handleBeamEffect, Line 278 ]]
    u89.Parent = p90
    u89.Attachment0 = p90
    u89.Attachment1 = p91
    u89.Enabled = true
    p88:GiveTask(function() --[[ Line: 283 ]]
        --[[
        Upvalues:
            [1] = u89
        --]]
        u89.Enabled = false
        task.delay(1, function() --[[ Line: 285 ]]
            --[[
            Upvalues:
                [1] = u89
            --]]
            u89:Destroy()
        end)
    end)
end
u25 = function(p92, u93, p94) --[[ Name: handleParticleEmitterEffect, Line 290 ]]
    u93.Parent = p94
    u93.Enabled = true
    u93.LockedToPart = true
    p92:GiveTask(function() --[[ Line: 294 ]]
        --[[
        Upvalues:
            [1] = u93
        --]]
        u93.Enabled = false
        task.delay(2.5, function() --[[ Line: 296 ]]
            --[[
            Upvalues:
                [1] = u93
            --]]
            u93:Destroy()
        end)
    end)
end
u43 = function(p95, u96, p97, p98) --[[ Name: handleTrailEffect, Line 301 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u96.Attachment0 = p97
    u96.Attachment1 = p98
    u96.Parent = u13
    p95:GiveTask(function() --[[ Line: 305 ]]
        --[[
        Upvalues:
            [1] = u96
        --]]
        task.delay(4, function() --[[ Line: 306 ]]
            --[[
            Upvalues:
                [1] = u96
            --]]
            u96:Destroy()
        end)
    end)
end
u15 = function(p99, p100) --[[ Name: getVisualizersForEffect, Line 311 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u6
    --]]
    local v101 = u10[p99].visualizer
    if v101 then
        local v102 = u6.Assets.Effects.Visualizer:FindFirstChild(v101)
        if v102 ~= nil then
            v102 = v102:FindFirstChild(p100)
        end
        if v102 and v102:IsA("Folder") then
            return v102:GetChildren()
        else
            return nil
        end
    else
        return
    end
end
return {
    ["VisualizerUtils"] = v14
}