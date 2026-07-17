-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local WatchCharacter = v1.WatchCharacter;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local HttpService = v3.HttpService;
local Players = v3.Players;
local Workspace = v3.Workspace;
local t = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "attribute-config");
local EffectTransparencyFP = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").Attribute.new("EffectTransparencyFP", t.optional(t.NumberSequence));
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "FirstPersonVisibilityController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 31
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 35
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "FirstPersonVisibilityController";
    p7.instanceMap = {};
    p7.thirdPersonDataSave = {};
end;

function u5.KnitStart(u8) -- Line: 41
    -- upvalues: WatchCharacter (copy), Players (copy), KnitClient (copy), WatchCollectionTag (copy)
    WatchCharacter(function(p9, p10) -- Line: 42
        -- upvalues: Players (ref), u8 (copy)
        if p9 == Players.LocalPlayer then
            u8:updateAll(p10);
            p10.DescendantAdded:Connect(function(p11) -- Line: 45
                -- upvalues: u8 (ref)
                u8:update(p11);
            end);
        end;
    end);
    KnitClient.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function() -- Line: 50
        -- upvalues: u8 (copy), Players (ref)
        u8:updateAll(Players.LocalPlayer.Character);
    end);
    WatchCollectionTag("FirstPersonHidden", function(p12) -- Line: 54
        -- upvalues: u8 (copy)
        u8:update(p12);
    end);
end;

function u5.updateAll(p13, p14) -- Line: 58
    -- upvalues: CollectionService (copy)
    if p14 then
        for _, descendant in p14:GetDescendants() do
            p13:update(descendant);
        end;
    end;

    for _, v in CollectionService:GetTagged("FirstPersonHidden") do
        local v15 = {};
        local v16 = #v15;
        local v17 = v:GetDescendants();
        local v18 = #v17;
        table.move(v17, 1, v18, v16 + 1, v15);
        v15[v16 + v18 + 1] = v;

        for _, v2 in v15 do
            p13:update(v2);
        end;
    end;
end;

function u5.update(p19, p20) -- Line: 78
    -- upvalues: Workspace (copy), KnitClient (copy), CollectionService (copy), u2 (copy)
    if not p20:IsDescendantOf(Workspace) then
        return nil;
    end;

    if p20:GetAttribute("FirstPersonVisible_UpdateDisabled") == true then
        return nil;
    end;

    local v21 = KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective();

    if p20:IsA("BasePart") and p20:GetAttribute("LocalTransparency") ~= nil then
        p20.LocalTransparencyModifier = p20:GetAttribute("LocalTransparency");
    end;

    local v22 = p20:GetAttribute("FirstPersonVisible");
    local v23 = CollectionService:HasTag(p20, "FirstPersonHidden");

    if v22 == nil and not v23 then
        return nil;
    end;

    local v24 = p19:createVisiblityAttributesConfig(p20);

    local function _(p25) -- Line: 100
        return p25 ~= nil;
    end;

    local v26 = false;

    for i, v in u2.values(v24.Values) do
        local _ = i - 1;

        if v ~= nil then
            v26 = true;
            break;
        end;
    end;

    if v26 then
        if v21 == 0 then
            p19:setFirstPersonAttributes(p20);

            return;
        end;

        p19:applyThirdPersonSave(p20);

        return;
    end;

    local v27 = v22 == false and true or v23;

    if p20:IsA("Beam") or (p20:IsA("ParticleEmitter") or (p20:IsA("Trail") or p20:IsA("BillboardGui"))) then
        if v21 == 0 and v27 then
            if p20:IsA("ParticleEmitter") then
                p20:Clear();
            end;

            p20.Enabled = false;
        else
            p20.Enabled = true;
        end;
    end;

    if p20:IsA("BasePart") or p20:IsA("MeshPart") then
        if v21 == 0 and v27 then
            p20.Transparency = 1;

            return;
        end;

        local v28 = p20:GetAttribute("InitialTransparency");

        if v28 ~= 0 and (v28 == v28 and (v28 ~= "" and v28)) then
            p20.Transparency = p20:GetAttribute("InitialTransparency");

            return;
        end;

        p20.Transparency = 0;
    end;
end;

function u5.setFirstPersonAttributes(p29, p30) -- Line: 147
    -- upvalues: u2 (copy)
    local v31 = p29:createVisiblityAttributesConfig(p30);

    local function _(p32) -- Line: 152
        return p32 ~= nil;
    end;

    local v33 = {};
    local v34 = false;

    for i, v in u2.values(v31.Values) do
        local _ = i - 1;

        if v ~= nil then
            v34 = true;
            break;
        end;
    end;

    if not v34 then
        return nil;
    end;

    local v35 = (p30:IsA("Beam") or (p30:IsA("ParticleEmitter") or p30:IsA("Trail"))) and v31.Values.EffectTransparencyFP;

    if v35 then
        v33.EffectTransparencyFP = p30.Transparency;
        p30.Transparency = v35;
    end;

    local v36 = p29:getOrCreateInstanceId(p30);
    p29.thirdPersonDataSave[v36] = v33;
end;

function u5.applyThirdPersonSave(p37, p38) -- Line: 178
    local v39 = p37:getOrCreateInstanceId(p38);
    local v40 = p37.thirdPersonDataSave[v39];

    if p38:IsA("Beam") or (p38:IsA("ParticleEmitter") or p38:IsA("Trail")) then
        local v41;

        if v40 == nil then
            v41 = v40;
        else
            v41 = v40.EffectTransparencyFP;
        end;

        if v41 then
            if v40 ~= nil then
                v40 = v40.EffectTransparencyFP;
            end;

            p38.Transparency = v40;
        end;
    end;

    p37.thirdPersonDataSave[v39] = nil;
end;

function u5.getOrCreateInstanceId(u42, p43) -- Line: 196
    -- upvalues: HttpService (copy)
    local v44 = p43:GetAttribute("FirstPersonVisibleId");

    if v44 ~= nil then
        return v44;
    end;

    local u45 = HttpService:GenerateGUID(false);
    p43:SetAttribute("FirstPersonVisibleId", u45);
    u42.instanceMap[u45] = p43;
    p43.Destroying:Once(function() -- Line: 207
        -- upvalues: u42 (copy), u45 (copy)
        u42.instanceMap[u45] = nil;
        u42.thirdPersonDataSave[u45] = nil;
    end);

    return u45;
end;

function u5.createVisiblityAttributesConfig(p46, p47) -- Line: 213
    -- upvalues: u4 (copy), EffectTransparencyFP (copy)
    return u4.new(p47, { EffectTransparencyFP });
end;

return {
    FirstPersonVisibilityController = KnitClient.CreateController(u5.new())
};