-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local StatusEffectMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-meta").StatusEffectMeta;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local VisualizerAttachments = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "visualizer", "visualizer-type").VisualizerAttachments;
local u4 = v2("Folder", {
    Name = "VisualizedEffectInstances",
    Parent = Workspace
});
local v5 = {};
local u6 = nil;

function v5.visualizeHitEffect(u7, u8, u9) -- Line: 22
    -- upvalues: u6 (ref), u1 (copy), EffectUtil (copy), ClientSyncEvents (copy)
    local PrimaryPart = u9.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.Position;
    end;

    if not PrimaryPart then
        return nil;
    end;

    local v10 = u6(u7, "HitEffect");

    if not v10 then
        return nil;
    end;

    for _, v in v10 do
        local u11 = v:Clone();

        if not u11 then
            return nil;
        end;

        task.spawn(function() -- Line: 40
            -- upvalues: u1 (ref), EffectUtil (ref), u11 (copy), u9 (copy), ClientSyncEvents (ref), u8 (copy), u7 (copy)
            local u12 = u1.new();
            EffectUtil:playEffects(u11:GetChildren(), u9);
            u12:GiveTask(u11);
            task.delay(2, function() -- Line: 44
                -- upvalues: u12 (copy)
                u12:DoCleaning();
            end);
            ClientSyncEvents.HitEffectVisualized:fire(u12, u8, u7, u9);
        end);
    end;
end;

local u13 = nil;
local u14 = nil;
local u15 = nil;

function v5.visualizeWeaponEffect(u16, u17, u18, u19) -- Line: 53
    -- upvalues: getItemMeta (copy), u6 (ref), CollectionService (copy), u13 (ref), VisualizerAttachments (copy), u1 (copy), u14 (ref), u15 (ref), ClientSyncEvents (copy)
    local v20 = getItemMeta(u18.Name);

    if not v20.sword then
        return nil;
    end;

    local firstPerson = v20.firstPerson;

    if firstPerson ~= nil then
        firstPerson = firstPerson.scale;
    end;

    local v21 = firstPerson == nil and 1 or firstPerson;
    local Handle = u18:FindFirstChild("Handle");

    if not Handle then
        return nil;
    end;

    local v22 = u6(u16, "Weapon");

    if not v22 then
        return nil;
    end;

    if u18:GetAttribute("Visualizer_" .. u16) == true then
        return nil;
    end;

    u18:SetAttribute("Visualizer_" .. u16, true);

    for _, v in v22 do
        local u23 = v:Clone();

        if not u23 then
            return nil;
        end;

        if u19 == 1 then
            CollectionService:AddTag(u23, "visualizer_hidden_in_first");
        else
            u13(u23, v21 * 0.7);
        end;

        local u24 = Handle:FindFirstChild(VisualizerAttachments.VisualTopAttachment);
        local v25 = Handle:FindFirstChild(VisualizerAttachments.VisualMiddleAttachment);
        local u26 = Handle:FindFirstChild(VisualizerAttachments.VisualBottomAttachment);

        if not (u26 and (v25 and u24)) then
            return nil;
        end;

        task.spawn(function() -- Line: 95
            -- upvalues: u1 (ref), u18 (copy), u16 (copy), u23 (copy), u19 (copy), u14 (ref), Handle (copy), u15 (ref), u26 (copy), u24 (copy), ClientSyncEvents (ref), u17 (copy)
            local v27 = u1.new();
            v27:GiveTask(function() -- Line: 97
                -- upvalues: u18 (ref), u16 (ref)
                u18:SetAttribute("Visualizer_" .. u16, false);
            end);

            if u23:IsA("ParticleEmitter") then
                local v28 = u23:GetAttribute("ViewmodelRotation");

                if v28 ~= nil and u19 == 0 then
                    u23.Rotation = NumberRange.new(v28);
                end;

                u14(v27, u23, Handle);
            elseif u23:IsA("Beam") then
                u15(v27, u23, u26, u24);
            end;

            ClientSyncEvents.WeaponEffectVisualized:fire(v27, u17, u16, u18);
        end);
    end;
end;

local u29 = nil;

function v5.visualizeProjectileEffect(u30, u31, u32) -- Line: 115
    -- upvalues: u6 (ref), VisualizerAttachments (copy), u1 (copy), u29 (ref), u14 (ref), ClientSyncEvents (copy)
    local v33 = u6(u30, "Projectile");

    if not v33 then
        return nil;
    end;

    local function _(p34) -- Line: 121
        if p34:IsA("Attachment") then
            return p34;
        end;
    end;

    local v35 = 0;
    local v36 = {};

    for i, descendant in u32:GetDescendants() do
        local _ = i - 1;

        if not descendant:IsA("Attachment") then
            local descendant = nil;
        end;

        if descendant ~= nil then
            v35 = v35 + 1;
            v36[v35] = descendant;
        end;
    end;

    for _, v in v33 do
        local u37 = v:Clone();

        if not u37 then
            return nil;
        end;

        local function _(p38) -- Line: 143
            -- upvalues: VisualizerAttachments (ref)
            return p38.Name == VisualizerAttachments.VisualTopAttachment;
        end;

        local u39 = nil;

        for i, v4 in v36 do
            local _ = i - 1;

            if v4.Name == VisualizerAttachments.VisualTopAttachment == true then
                u39 = v4;
                break;
            end;
        end;

        local function _(p40) -- Line: 156
            -- upvalues: VisualizerAttachments (ref)
            return p40.Name == VisualizerAttachments.VisualBottomAttachment;
        end;

        local u41 = nil;

        for i, v4 in v36 do
            local _ = i - 1;

            if v4.Name == VisualizerAttachments.VisualBottomAttachment == true then
                u41 = v4;
                break;
            end;
        end;

        if not (u39 and u41) then
            return nil;
        end;

        task.spawn(function() -- Line: 172
            -- upvalues: u1 (ref), u37 (copy), u29 (ref), u41 (copy), u39 (copy), u14 (ref), ClientSyncEvents (ref), u31 (copy), u30 (copy), u32 (copy)
            local u42 = u1.new();

            if u37:IsA("Trail") then
                u29(u42, u37, u41, u39);
            elseif u37:IsA("ParticleEmitter") then
                u14(u42, u37, u39);
            end;

            ClientSyncEvents.ProjectileEffectVisualized:fire(u42, u31, u30, u32);
            u32.AncestryChanged:Connect(function() -- Line: 180
                -- upvalues: u42 (copy)
                u42:DoCleaning();
            end);
        end);
    end;
end;

function v5.visualizeToolEffect(u43, u44, u45, u46) -- Line: 187
    -- upvalues: getItemMeta (copy), u6 (ref), CollectionService (copy), u13 (ref), VisualizerAttachments (copy), u1 (copy), u14 (ref), u15 (ref), ClientSyncEvents (copy)
    local v47 = getItemMeta(u45.Name);

    if not v47.breakBlock then
        return nil;
    end;

    local firstPerson = v47.firstPerson;

    if firstPerson ~= nil then
        firstPerson = firstPerson.scale;
    end;

    local v48 = firstPerson == nil and 1 or firstPerson;
    local Handle = u45:FindFirstChild("Handle");

    if not Handle then
        return nil;
    end;

    local v49 = u6(u43, "Tool");

    if not v49 then
        return nil;
    end;

    if u45:GetAttribute("Visualizer_" .. u43) == true then
        return nil;
    end;

    u45:SetAttribute("Visualizer_" .. u43, true);

    for _, v in v49 do
        local u50 = v:Clone();

        if not u50 then
            return nil;
        end;

        if u46 == 1 then
            CollectionService:AddTag(u50, "visualizer_hidden_in_first");
        else
            u13(u50, v48 * 0.7);
        end;

        local u51 = Handle:FindFirstChild(VisualizerAttachments.VisualTopAttachment);
        local v52 = Handle:FindFirstChild(VisualizerAttachments.VisualMiddleAttachment);
        local u53 = Handle:FindFirstChild(VisualizerAttachments.VisualBottomAttachment);

        if not (u53 and (v52 and u51)) then
            return nil;
        end;

        task.spawn(function() -- Line: 229
            -- upvalues: u1 (ref), u45 (copy), u43 (copy), u50 (copy), u46 (copy), u14 (ref), Handle (copy), u15 (ref), u53 (copy), u51 (copy), ClientSyncEvents (ref), u44 (copy)
            local v54 = u1.new();
            v54:GiveTask(function() -- Line: 231
                -- upvalues: u45 (ref), u43 (ref)
                u45:SetAttribute("Visualizer_" .. u43, false);
            end);

            if u50:IsA("ParticleEmitter") then
                local v55 = u50:GetAttribute("ViewmodelRotation");

                if v55 ~= nil and u46 == 0 then
                    u50.Rotation = NumberRange.new(v55);
                end;

                u14(v54, u50, Handle);
            elseif u50:IsA("Beam") then
                u15(v54, u50, u53, u51);
            end;

            ClientSyncEvents.WeaponEffectVisualized:fire(v54, u44, u43, u45);
        end);
    end;
end;

u13 = function(p56, u57) -- Line: 248, Name: scaleFirstPersonVisual
    -- upvalues: EffectUtil (copy)
    EffectUtil:scaleEffect({ p56 }, u57);

    if not p56:IsA("ParticleEmitter") then
        if p56:IsA("Beam") then
            local Keypoints = p56.Transparency.Keypoints;

            local function _(p58) -- Line: 266
                -- upvalues: u57 (copy)
                return NumberSequenceKeypoint.new(p58.Time, p58.Value * u57, p58.Envelope * u57);
            end;

            local v59 = table.create(#Keypoints);

            for i, v in Keypoints do
                local _ = i - 1;
                v59[i] = NumberSequenceKeypoint.new(v.Time, v.Value * u57, v.Envelope * u57);
            end;

            p56.Transparency = NumberSequence.new(v59);
        end;

        return;
    end;

    p56.Lifetime = NumberRange.new(p56.Lifetime.Min * u57, p56.Lifetime.Max * u57);
    p56.Rate = p56.Rate * u57;
    local Keypoints = p56.Transparency.Keypoints;

    local function _(p60) -- Line: 254
        -- upvalues: u57 (copy)
        return NumberSequenceKeypoint.new(p60.Time, p60.Value * u57, p60.Envelope * u57);
    end;

    local v61 = table.create(#Keypoints);

    for i, v in Keypoints do
        local _ = i - 1;
        v61[i] = NumberSequenceKeypoint.new(v.Time, v.Value * u57, v.Envelope * u57);
    end;

    p56.Transparency = NumberSequence.new(v61);
end;

u15 = function(p62, u63, p64, p65) -- Line: 278, Name: handleBeamEffect
    u63.Parent = p64;
    u63.Attachment0 = p64;
    u63.Attachment1 = p65;
    u63.Enabled = true;
    p62:GiveTask(function() -- Line: 283
        -- upvalues: u63 (copy)
        u63.Enabled = false;
        task.delay(1, function() -- Line: 285
            -- upvalues: u63 (ref)
            u63:Destroy();
        end);
    end);
end;

u14 = function(p66, u67, p68) -- Line: 290, Name: handleParticleEmitterEffect
    u67.Parent = p68;
    u67.Enabled = true;
    u67.LockedToPart = true;
    p66:GiveTask(function() -- Line: 294
        -- upvalues: u67 (copy)
        u67.Enabled = false;
        task.delay(2.5, function() -- Line: 296
            -- upvalues: u67 (ref)
            u67:Destroy();
        end);
    end);
end;

u29 = function(p69, u70, p71, p72) -- Line: 301, Name: handleTrailEffect
    -- upvalues: u4 (copy)
    u70.Attachment0 = p71;
    u70.Attachment1 = p72;
    u70.Parent = u4;
    p69:GiveTask(function() -- Line: 305
        -- upvalues: u70 (copy)
        task.delay(4, function() -- Line: 306
            -- upvalues: u70 (ref)
            u70:Destroy();
        end);
    end);
end;

u6 = function(p73, p74) -- Line: 311, Name: getVisualizersForEffect
    -- upvalues: StatusEffectMeta (copy), ReplicatedStorage (copy)
    local visualizer = StatusEffectMeta[p73].visualizer;

    if visualizer then
        local v75 = ReplicatedStorage.Assets.Effects.Visualizer:FindFirstChild(visualizer);

        if v75 ~= nil then
            v75 = v75:FindFirstChild(p74);
        end;

        if v75 and v75:IsA("Folder") then
            return v75:GetChildren();
        end;

        return nil;
    end;
end;

return {
    VisualizerUtils = v5
};