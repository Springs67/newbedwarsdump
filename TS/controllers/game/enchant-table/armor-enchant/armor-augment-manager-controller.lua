-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EnchantBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-util").EnchantBalance;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local ArmorSlot = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "ArmorAugmentManagerController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 30
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 34
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "ArmorAugmentManagerController";
end;

function u4.KnitStart(p7) -- Line: 38
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p7);
end;

function u4.getCannotPurchaseArmorEnchantReason(p8, p9) -- Line: 41
    -- upvalues: KnitClient (copy), Players (copy), BedwarsKit (copy), EnchantBalance (copy)
    local v10 = p9:GetAttribute("CannotPurchaseArmorEnchants");

    if v10 == 0 or (v10 ~= v10 or (v10 == "" or not v10)) then
        return nil;
    end;

    return not KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.BIGMAN) and (KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.VOID_KNIGHT) and "Requires Empowered Form (KIT)" or (KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.TINKER) and "Requires Diamond Mech" or (KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.WARRIOR) and "Requires Warrior Armor" or "Requires Diamond Armor"))) or "Requires " .. tostring(EnchantBalance.MIN_HP_ELDERTREE_REQUIREMENT) .. " Health";
end;

function u4.playVoidifyEffect(p11, p12) -- Line: 61
    -- upvalues: SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), Workspace (copy), u2 (copy), CollectionService (copy), TweenService (copy)
    local Character = p12.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    SoundManager:playSound(GameSound.VOIDIFY_ARMOR, {
        position = p12.Character.PrimaryPart.Position
    });
    local u13 = ReplicatedStorage.Assets.Effects.VoidifyEffect:Clone();
    u13.Parent = Workspace;
    u13:PivotTo(p12.Character.PrimaryPart.CFrame);
    u2("WeldConstraint", {
        Part0 = u13,
        Part1 = p12.Character.PrimaryPart,
        Parent = p12.Character
    });

    local function _(p14) -- Line: 81
        -- upvalues: CollectionService (ref)
        if p14.Name ~= "Pulse" and p14.Name ~= "Pulse2" then
            CollectionService:AddTag(p14, "FirstPersonHidden");
        end;
    end;

    for i, descendant in u13:GetDescendants() do
        local _ = i - 1;

        if descendant.Name ~= "Pulse" and descendant.Name ~= "Pulse2" then
            CollectionService:AddTag(descendant, "FirstPersonHidden");
        end;
    end;

    local function _(p15) -- Line: 90
        return p15:IsA("Beam");
    end;

    local v16 = 0;
    local u17 = {};

    for i, descendant in u13:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("Beam") == true then
            v16 = v16 + 1;
            u17[v16] = descendant;
        end;
    end;

    local function v21(p18) -- Line: 104
        -- upvalues: TweenService (ref)
        local v19;

        if p18.CurveSize0 > 0 then
            v19 = p18.CurveSize0 - 2;
        else
            v19 = p18.CurveSize0 + 2;
        end;

        local v20;

        if p18.CurveSize1 > 0 then
            v20 = p18.CurveSize1 - 2;
        else
            v20 = p18.CurveSize1 + 2;
        end;

        TweenService:Create(p18, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
            CurveSize0 = v19,
            CurveSize1 = v20
        }):Play();
    end;

    for i, v in u17 do
        v21(v, i - 1, u17);
    end;

    task.delay(0.5, function() -- Line: 116
        -- upvalues: u17 (copy), u13 (copy)
        local function _(p22) -- Line: 117
            p22:Destroy();
        end;

        for i, v in u17 do
            local _ = i - 1;
            v:Destroy();
        end;

        u13.BuildupParticles:Destroy();
        u13.Specs.Enabled = false;
        u13.SpecsInner.Enabled = false;
        u13.ExplosionParticles.Pulse:Emit(1);
        u13.ExplosionParticles.Pulse2:Emit(1);
        u13.ExplosionParticles.Sparks.Enabled = true;
    end);
    task.delay(1.5, function() -- Line: 130
        -- upvalues: u13 (copy)
        u13.ExplosionParticles.Sparks.Enabled = false;
    end);
    task.delay(3.5, function() -- Line: 133
        -- upvalues: u13 (copy)
        u13:Destroy();
    end);
end;

function u4.refreshArmorModels(p23, p24) -- Line: 137
    -- upvalues: KnitClient (copy), Players (copy), BedwarsKit (copy), EntityUtil (copy), u1 (copy), ArmorSlot (copy)
    if KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.BIGMAN) then
        return nil;
    end;

    if KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.VOID_KNIGHT) then
        return nil;
    end;

    if KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.TINKER) then
        return nil;
    end;

    local u25 = EntityUtil:getEntity(p24);

    if not u25 then
        return nil;
    end;

    local v26 = false;
    local v27 = 0;

    while true do
        if v26 then
            v27 = v27 + 1;
        else
            v26 = true;
        end;

        if v27 >= #u1.values(ArmorSlot) then
            return;
        end;

        local v28 = u25:getInstance():WaitForChild("ArmorInvItem_" .. tostring(v27));

        if KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.WARRIOR) then
            local Value = v28.Value;

            if Value ~= nil then
                Value = Value.Name;
            end;

            local v29 = string.find(Value, "diamond");

            if v29 ~= 0 and (v29 == v29 and v29) then
                return nil;
            end;
        end;

        (function(p30, p31) -- Line: 175
            -- upvalues: u25 (copy)
            if not p31 then
                u25:unequipArmorSlot(p30);

                return;
            end;

            local v32 = u25:getPlayer();

            if v32 ~= nil then
                v32 = v32:GetAttribute("ArmorTrimType");
            end;

            local v33 = u25:getPlayer();

            if v33 ~= nil then
                v33 = v33:GetAttribute("ArmorTrimColor");
            end;

            local v34 = u25:getPlayer();

            if v34 ~= nil then
                v34 = v34:GetAttribute("ArmorTrimEffectRank");
            end;

            u25:equipArmorItem(p31, p30, v32 and (v33 ~= nil and v34 ~= nil) and {
                type = v32,
                color = v33,
                effectRank = v34
            } or nil);
        end)(v27, v28.Value);
    end;
end;

KnitClient.CreateController(u4.new());

return {
    AUGMENT_UPGRADE_EFFECT_DURATION = 0.5
};