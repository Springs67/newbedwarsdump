-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v1.CollectionService;
local Players = v1.Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityDamageEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap;
local VisualizerUtils = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "visualizer", "visualizer-utils").VisualizerUtils;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "VisualizerController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 23
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "VisualizerController";
    p4.entityVisualMaidMap = {};
end;

function u2.KnitStart(u5) -- Line: 32
    -- upvalues: ClientSyncEvents (copy), VisualizerUtils (copy), EntityDamageEventZap (copy), StatusEffectUtil (copy), Players (copy), EntityUtil (copy), CollectionService (copy), KnitClient (copy)
    ClientSyncEvents.ProjectileLaunched:connect(function(p6) -- Line: 34
        -- upvalues: VisualizerUtils (ref)
        if p6:isCancelled() then
            return nil;
        end;

        if p6.shooter == nil then
            return nil;
        end;

        for _, v in p6:getActiveStatusEffects() do
            VisualizerUtils.visualizeProjectileEffect(v.statusEffect, p6.shooter, p6.projectile);
        end;
    end);
    EntityDamageEventZap.On(function(p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20) -- Line: 47
        -- upvalues: StatusEffectUtil (ref), VisualizerUtils (ref)
        if not p11 then
            return nil;
        end;

        for _, v in StatusEffectUtil:getAllActive(p11) do
            VisualizerUtils.visualizeHitEffect(v.statusEffect, p11, p7);
        end;
    end);
    ClientSyncEvents.EntityChangeHeldItem:connect(function(u21) -- Line: 57
        -- upvalues: StatusEffectUtil (ref), VisualizerUtils (ref), Players (ref), u5 (copy)
        task.spawn(function() -- Line: 58
            -- upvalues: u21 (copy), StatusEffectUtil (ref), VisualizerUtils (ref), Players (ref), u5 (ref)
            local v22 = u21.entity:getInstance();

            if not v22 then
                return nil;
            end;

            local v23 = u21.entity:getHandItemInstanceFromCharacter();

            if not v23 then
                return nil;
            end;

            for _, v in StatusEffectUtil:getAllActive(v22) do
                VisualizerUtils.visualizeWeaponEffect(v.statusEffect, v22, v23, 1);
                VisualizerUtils.visualizeToolEffect(v.statusEffect, v22, v23, 1);

                if Players:GetPlayerFromCharacter(u21.entity:getInstance()) == Players.LocalPlayer then
                    u5:applyVisualToViewmodelItem(v.statusEffect, v22, v23.Name);
                end;
            end;
        end);
    end);
    ClientSyncEvents.StatusEffectAdded:connect(function(p24) -- Line: 78
        -- upvalues: Players (ref), EntityUtil (ref), u5 (copy), VisualizerUtils (ref)
        local entityInstance = p24.entityInstance;

        if not entityInstance then
            return nil;
        end;

        local v25 = Players:GetPlayerFromCharacter(entityInstance);

        if not v25 then
            return nil;
        end;

        local v26 = EntityUtil:getEntity(v25);

        if not v26 then
            return nil;
        end;

        local v27 = v26:getHandItemInstanceFromCharacter();

        if not v27 then
            return nil;
        end;

        if v25 == Players.LocalPlayer then
            u5:applyVisualToViewmodelItem(p24.statusEffect, p24.entityInstance, v27.Name);
        end;

        VisualizerUtils.visualizeWeaponEffect(p24.statusEffect, p24.entityInstance, v27, 1);
        VisualizerUtils.visualizeToolEffect(p24.statusEffect, p24.entityInstance, v27, 1);
    end);
    ClientSyncEvents.ViewModelItemAdded:connect(function(p28) -- Line: 101
        -- upvalues: EntityUtil (ref), StatusEffectUtil (ref), VisualizerUtils (ref)
        local v29 = EntityUtil:getLocalPlayerEntity();

        if v29 ~= nil then
            v29 = v29:getInstance();
        end;

        if not v29 then
            return nil;
        end;

        for _, v in StatusEffectUtil:getAllActive(v29) do
            VisualizerUtils.visualizeWeaponEffect(v.statusEffect, v29, p28.item, 0);
            VisualizerUtils.visualizeToolEffect(v.statusEffect, v29, p28.item, 0);
        end;
    end);
    CollectionService:GetInstanceAddedSignal("visualizer_hidden_in_first"):Connect(function(p30) -- Line: 116
        -- upvalues: KnitClient (ref), u5 (copy)
        if KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
            u5:hideVisuals(p30);
        end;
    end);
    KnitClient.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(p31) -- Line: 123
        -- upvalues: CollectionService (ref), u5 (copy)
        local v32 = CollectionService:GetTagged("visualizer_hidden_in_first");

        if p31 == 0 then
            for _, v in v32 do
                u5:hideVisuals(v);
            end;

            return;
        end;

        for _, v in v32 do
            u5:showVisuals(v);
        end;
    end);
    ClientSyncEvents.ProjectileEffectVisualized:connect(function(p33) -- Line: 136
        -- upvalues: u5 (copy)
        u5:addMaidToVisualMap(p33.effect, p33.fromEntity, p33.visualizerMaid);
    end);
    ClientSyncEvents.HitEffectVisualized:connect(function(p34) -- Line: 139
        -- upvalues: u5 (copy)
        u5:addMaidToVisualMap(p34.effect, p34.fromEntity, p34.visualizerMaid);
    end);
    ClientSyncEvents.WeaponEffectVisualized:connect(function(p35) -- Line: 142
        -- upvalues: u5 (copy)
        u5:addMaidToVisualMap(p35.effect, p35.fromEntity, p35.visualizerMaid);
        u5:checkHideVisuals(p35.fromEntity);
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p36) -- Line: 146
        -- upvalues: u5 (copy)
        u5:clearVisualsForEffect(p36.statusEffect, p36.entityInstance);
    end);
end;

function u2.checkHideVisuals(p37, p38) -- Line: 150
    -- upvalues: Players (copy), KnitClient (copy), CollectionService (copy)
    if Players.LocalPlayer.Character == p38 and KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
        for _, v in CollectionService:GetTagged("visualizer_hidden_in_first") do
            p37:hideVisuals(v);
        end;
    end;
end;

function u2.hideVisuals(p39, p40) -- Line: 160
    if p40:IsA("ParticleEmitter") then
        p40:Clear();

        if p40.Enabled then
            p40.Enabled = false;
        end;
    end;

    if p40:IsA("Beam") and p40.Enabled then
        p40.Enabled = false;
    end;

    if p40:IsA("Trail") and p40.Enabled then
        p40.Enabled = false;
    end;
end;

function u2.showVisuals(p41, p42) -- Line: 179
    if p42:IsA("ParticleEmitter") and not p42.Enabled then
        p42.Enabled = true;
    end;

    if p42:IsA("Beam") and not p42.Enabled then
        p42.Enabled = true;
    end;

    if p42:IsA("Trail") and not p42.Enabled then
        p42.Enabled = true;
    end;
end;

function u2.applyVisualToViewmodelItem(p43, p44, p45, p46) -- Line: 196
    -- upvalues: KnitClient (copy), VisualizerUtils (copy)
    local v47 = KnitClient.Controllers.ViewmodelController:getViewModel();

    if v47 ~= nil then
        v47 = v47:WaitForChild(p46, 1);
    end;

    if not v47 then
        return nil;
    end;

    VisualizerUtils.visualizeWeaponEffect(p44, p45, v47, 0);
end;

function u2.clearVisualsForEffect(p48, p49, p50) -- Line: 207
    local v51 = p48.entityVisualMaidMap[p50];

    if not v51 then
        return false;
    end;

    local v52 = v51[p49];

    if not v52 then
        return false;
    end;

    local function _(p53) -- Line: 217
        return p53:DoCleaning();
    end;

    for i, v in v52 do
        local _ = i - 1;
        v:DoCleaning();
    end;

    return true;
end;

function u2.addMaidToVisualMap(p54, p55, p56, p57) -- Line: 228
    local v58 = p54.entityVisualMaidMap[p56];
    local v59;

    if v58 == nil then
        v59 = v58;
    else
        v59 = v58[p55];
    end;

    local v60 = v59 == nil and {} or v59;

    if not v58 then
        p54.entityVisualMaidMap[p56] = {
            [p55] = { p57 }
        };

        return;
    end;

    table.insert(v60, p57);
    v58[p55] = v60;
    p54.entityVisualMaidMap[p56] = v58;
end;

KnitClient.CreateController(u2.new());

return nil;