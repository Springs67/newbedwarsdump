local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.CollectionService
local u5 = v3.Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "visualizer", "visualizer-utils").VisualizerUtils
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "VisualizerController"
    end,
    ["__index"] = u7
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p15)
    p15.Name = "VisualizerController"
    p15.entityVisualMaidMap = {}
end
function u12.KnitStart(u16) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u9
        [3] = u8
        [4] = u11
        [5] = u5
        [6] = u10
        [7] = u4
        [8] = u2
    --]]
    u6.ProjectileLaunched:connect(function(p17) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        if p17:isCancelled() then
            return nil
        end
        if p17.shooter == nil then
            return nil
        end
        for _, v18 in p17:getActiveStatusEffects() do
            u9.visualizeProjectileEffect(v18.statusEffect, p17.shooter, p17.projectile)
        end
    end)
    u8.On(function(p19, _, _, _, p20, _, _, _, _, _, _, _, _, _) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u9
        --]]
        if not p20 then
            return nil
        end
        for _, v21 in u11:getAllActive(p20) do
            u9.visualizeHitEffect(v21.statusEffect, p20, p19)
        end
    end)
    u6.EntityChangeHeldItem:connect(function(u22) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u9
            [3] = u5
            [4] = u16
        --]]
        task.spawn(function() --[[ Line: 58 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u11
                [3] = u9
                [4] = u5
                [5] = u16
            --]]
            local v23 = u22.entity:getInstance()
            if not v23 then
                return nil
            end
            local v24 = u22.entity:getHandItemInstanceFromCharacter()
            if not v24 then
                return nil
            end
            for _, v25 in u11:getAllActive(v23) do
                u9.visualizeWeaponEffect(v25.statusEffect, v23, v24, 1)
                u9.visualizeToolEffect(v25.statusEffect, v23, v24, 1)
                if u5:GetPlayerFromCharacter(u22.entity:getInstance()) == u5.LocalPlayer then
                    u16:applyVisualToViewmodelItem(v25.statusEffect, v23, v24.Name)
                end
            end
        end)
    end)
    u6.StatusEffectAdded:connect(function(p26) --[[ Line: 78 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u10
            [3] = u16
            [4] = u9
        --]]
        local v27 = p26.entityInstance
        if not v27 then
            return nil
        end
        local v28 = u5:GetPlayerFromCharacter(v27)
        if not v28 then
            return nil
        end
        local v29 = u10:getEntity(v28)
        if not v29 then
            return nil
        end
        local v30 = v29:getHandItemInstanceFromCharacter()
        if not v30 then
            return nil
        end
        if v28 == u5.LocalPlayer then
            u16:applyVisualToViewmodelItem(p26.statusEffect, p26.entityInstance, v30.Name)
        end
        u9.visualizeWeaponEffect(p26.statusEffect, p26.entityInstance, v30, 1)
        u9.visualizeToolEffect(p26.statusEffect, p26.entityInstance, v30, 1)
    end)
    u6.ViewModelItemAdded:connect(function(p31) --[[ Line: 101 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u11
            [3] = u9
        --]]
        local v32 = u10:getLocalPlayerEntity()
        if v32 ~= nil then
            v32 = v32:getInstance()
        end
        if not v32 then
            return nil
        end
        for _, v33 in u11:getAllActive(v32) do
            u9.visualizeWeaponEffect(v33.statusEffect, v32, p31.item, 0)
            u9.visualizeToolEffect(v33.statusEffect, v32, p31.item, 0)
        end
    end)
    u4:GetInstanceAddedSignal("visualizer_hidden_in_first"):Connect(function(p34) --[[ Line: 116 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u16
        --]]
        if u2.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
            u16:hideVisuals(p34)
        end
    end)
    u2.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(p35) --[[ Line: 123 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u16
        --]]
        local v36 = u4:GetTagged("visualizer_hidden_in_first")
        if p35 == 0 then
            for _, v37 in v36 do
                u16:hideVisuals(v37)
            end
        else
            for _, v38 in v36 do
                u16:showVisuals(v38)
            end
        end
    end)
    u6.ProjectileEffectVisualized:connect(function(p39) --[[ Line: 136 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16:addMaidToVisualMap(p39.effect, p39.fromEntity, p39.visualizerMaid)
    end)
    u6.HitEffectVisualized:connect(function(p40) --[[ Line: 139 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16:addMaidToVisualMap(p40.effect, p40.fromEntity, p40.visualizerMaid)
    end)
    u6.WeaponEffectVisualized:connect(function(p41) --[[ Line: 142 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16:addMaidToVisualMap(p41.effect, p41.fromEntity, p41.visualizerMaid)
        u16:checkHideVisuals(p41.fromEntity)
    end)
    u6.StatusEffectRemoved:connect(function(p42) --[[ Line: 146 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16:clearVisualsForEffect(p42.statusEffect, p42.entityInstance)
    end)
end
function u12.checkHideVisuals(p43, p44) --[[ Line: 150 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u4
    --]]
    if u5.LocalPlayer.Character == p44 and u2.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
        for _, v45 in u4:GetTagged("visualizer_hidden_in_first") do
            p43:hideVisuals(v45)
        end
    end
end
function u12.hideVisuals(_, p46) --[[ Line: 160 ]]
    if p46:IsA("ParticleEmitter") then
        p46:Clear()
        if p46.Enabled then
            p46.Enabled = false
        end
    end
    if p46:IsA("Beam") and p46.Enabled then
        p46.Enabled = false
    end
    if p46:IsA("Trail") and p46.Enabled then
        p46.Enabled = false
    end
end
function u12.showVisuals(_, p47) --[[ Line: 179 ]]
    if p47:IsA("ParticleEmitter") and not p47.Enabled then
        p47.Enabled = true
    end
    if p47:IsA("Beam") and not p47.Enabled then
        p47.Enabled = true
    end
    if p47:IsA("Trail") and not p47.Enabled then
        p47.Enabled = true
    end
end
function u12.applyVisualToViewmodelItem(_, p48, p49, p50) --[[ Line: 196 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u9
    --]]
    local v51 = u2.Controllers.ViewmodelController:getViewModel()
    if v51 ~= nil then
        v51 = v51:WaitForChild(p50, 1)
    end
    if not v51 then
        return nil
    end
    u9.visualizeWeaponEffect(p48, p49, v51, 0)
end
function u12.clearVisualsForEffect(p52, p53, p54) --[[ Line: 207 ]]
    local v55 = p52.entityVisualMaidMap[p54]
    if not v55 then
        return false
    end
    local v56 = v55[p53]
    if not v56 then
        return false
    end
    for v57, v58 in v56 do
        local _ = v57 - 1
        v58:DoCleaning()
    end
    return true
end
function u12.addMaidToVisualMap(p59, p60, p61, p62) --[[ Line: 228 ]]
    local v63 = p59.entityVisualMaidMap[p61]
    local v64
    if v63 == nil then
        v64 = v63
    else
        v64 = v63[p60]
    end
    local v65 = v64 == nil and {} or v64
    if v63 then
        table.insert(v65, p62)
        v63[p60] = v65
        p59.entityVisualMaidMap[p61] = v63
    else
        p59.entityVisualMaidMap[p61] = {
            [p60] = { p62 }
        }
    end
end
u2.CreateController(u12.new())
return nil