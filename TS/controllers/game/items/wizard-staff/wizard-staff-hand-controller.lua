-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local MobileButton = v1.MobileButton;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local BedwarsUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local WizardUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "wizard", "wizard-util").WizardUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local WizardAbilityBarBase = RuntimeLib.import(script, script.Parent, "ui", "wizard-ability-bar-base").WizardAbilityBarBase;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 35, Name: __tostring
        return "WizardStaffHandController";
    end,

    __index = HandKnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 41
    -- upvalues: u6 (copy)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 45
    -- upvalues: HandKnitController (copy), u3 (copy)
    HandKnitController.constructor(p8);
    p8.Name = "WizardStaffHandController";
    p8.abilitiesMaid = u3.new();
    p8.uiMaid = u3.new();
end;

function u6.KnitStart(p9) -- Line: 51
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(p9);
end;

function u6.onDisable(p10) -- Line: 54
    p10:setAbility(nil);
    p10.uiMaid:DoCleaning();
    p10.abilitiesMaid:DoCleaning();
end;

function u6.onEnable(u11, u12, p13) -- Line: 59
    -- upvalues: Flamework (copy), WizardUtil (copy), AbilityId (copy), WizardAbilityBarBase (copy), DeviceUtil (copy), u4 (copy), MobileButton (copy), BedwarsImageId (copy), BedwarsUI (copy), Players (copy), ClientStore (copy), KnitClient2 (copy), BedwarsKitSkin (copy)
    u11.currentStaff = u12.itemType;
    u11:setupDestroyableYield(function() -- Line: 62
        -- upvalues: Flamework (ref), WizardUtil (ref), u12 (copy), AbilityId (ref)
        return Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(WizardUtil:getManaId(u12.itemType) or AbilityId.WIZARD_MANA, nil):expect();
    end);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        appId = "WizardAbilityBar",
        app = WizardAbilityBarBase
    }, {
        ChangeAbility = function(p14) -- Line: 70, Name: ChangeAbility
            -- upvalues: u11 (copy)
            return u11:changeAbility(p14);
        end,

        ChangeNextAbility = function() -- Line: 73, Name: ChangeNextAbility
            -- upvalues: u11 (copy)
            return u11:changeNextAbility();
        end,

        Abilities = WizardUtil:getStaffAbilities(u12.itemType) or {},
        ExtraAbilities = WizardUtil:getStaffExtraAbilities(u12.itemType) or {}
    });
    u11.uiMaid:GiveTask(function() -- Line: 79
        -- upvalues: Flamework (ref)
        return Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("WizardAbilityBar");
    end);

    if DeviceUtil.isMobileControls() then
        local u15 = u4.mount(u4.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, { u4.createElement(MobileButton, {
                Image = BedwarsImageId.SWAP_MOBILE,
                Position = BedwarsUI:getActionMobileButtonPosition(),

                OnClick = function() -- Line: 92, Name: OnClick
                    -- upvalues: u11 (copy)
                    u11:changeNextAbility();
                end
            }) }), Players.LocalPlayer:WaitForChild("PlayerGui"));
        u11.uiMaid:GiveTask(function() -- Line: 97
            -- upvalues: u4 (ref), u15 (copy)
            return u4.unmount(u15);
        end);
    end;

    local u19 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "ItemPrimary",
        actionId = "change-ability",

        boundFunction = function(p16, p17, p18) -- Line: 105, Name: boundFunction
            -- upvalues: u11 (copy)
            if p17 == Enum.UserInputState.Begin then
                u11:changeNextAbility();
            end;
        end
    });
    u11.abilitiesMaid:GiveTask(function() -- Line: 111
        -- upvalues: u19 (copy)
        return u19;
    end);
    u11.abilitiesMaid:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("WizardAbility"):Connect(function() -- Line: 114
        -- upvalues: ClientStore (ref), u11 (copy)
        ClientStore:dispatch({
            type = "KitWizardSetAbility",
            ability = u11:getAbility()
        });
    end));
    local v20 = WizardUtil:getStaffAbilities(u12.itemType);
    local v21;

    if v20 then
        v21 = v20[1];
    else
        v21 = u11:getAbility();
    end;

    u11:setAbility(v21);
    local LocalPlayer = Players.LocalPlayer;

    if not LocalPlayer then
        return nil;
    end;

    if KnitClient2.Controllers.KitController:getKitSkin(LocalPlayer) == BedwarsKitSkin.DEFAULT then
        u11:setTheme(u12.tool, u11:getAbility());
    end;
end;

function u6.changeAbility(u22, u23) -- Line: 136
    -- upvalues: GameAnimationUtil (copy), Players (copy), AnimationType (copy), EntityUtil (copy), KnitClient2 (copy), BedwarsKitSkin (copy), KnitClient (copy)
    if u23 == u22:getAbility() then
        return nil;
    end;

    GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.WIZARD_ABILITY_SWITCH);
    u22:setAbility(u23);
    local v24 = EntityUtil:getEntity(Players.LocalPlayer);

    if not v24 then
        return nil;
    end;

    local v25 = v24:getInstance();

    if KnitClient2.Controllers.KitController:getKitSkin(v25) == BedwarsKitSkin.DEFAULT then
        local v26 = v24:getItemInHand();

        if v26 then
            u22:setTheme(v26, u23);
        end;

        local v27 = KnitClient.Controllers.ViewmodelController:getViewModel();

        if v27 ~= nil then
            local function _(p28) -- Line: 158
                -- upvalues: u22 (copy), u23 (copy)
                local v29 = string.find(p28.Name, "wizard_staff");

                if v29 ~= 0 and (v29 == v29 and v29) then
                    u22:setTheme(p28, u23);
                end;
            end;

            for i, child in v27:GetChildren() do
                local _ = i - 1;
                local v30 = string.find(child.Name, "wizard_staff");

                if v30 ~= 0 and (v30 == v30 and v30) then
                    u22:setTheme(child, u23);
                end;
            end;
        end;
    end;
end;

function u6.changeNextAbility(p31) -- Line: 170
    p31:changeAbility(p31:getNextAbility());
end;

function u6.setAbility(p32, p33) -- Line: 173
    -- upvalues: Players (copy)
    Players.LocalPlayer:SetAttribute("WizardAbility", p33);
end;

function u6.getAbility(p34) -- Line: 176
    -- upvalues: Players (copy), AbilityId (copy)
    return Players.LocalPlayer:GetAttribute("WizardAbility") or AbilityId.LIGHTNING_STRIKE;
end;

function u6.getNextAbility(p35) -- Line: 180
    -- upvalues: WizardUtil (copy)
    local u36 = p35:getAbility();
    local v37 = WizardUtil:getStaffAbilities(p35.currentStaff);

    if not v37 then
        return u36;
    end;

    local function _(p38) -- Line: 186
        -- upvalues: u36 (copy)
        return p38 == u36;
    end;

    local v39 = -1;

    for i, v in v37 do
        local _ = i - 1;

        if v == u36 == true then
            v39 = i - 1;
            break;
        end;
    end;

    local v40 = v39 + 1;

    return v37[(#v37 <= v40 and 0 or v40) + 1];
end;

function u6.getColorTheme(p41, p42) -- Line: 204
    -- upvalues: AbilityId (copy), ColorUtil (copy)
    return p42 == AbilityId.LIGHTNING_STRIKE and {
        Neon = ColorUtil.hexColor(6260671),
        OuterOrb = ColorUtil.hexColor(6260671),
        CenterOrb = ColorUtil.hexColor(6260671),
        InnerOrb = ColorUtil.hexColor(6260671)
    } or (p42 == AbilityId.LIGHTNING_STORM and {
        Neon = ColorUtil.hexColor(15191385),
        OuterOrb = ColorUtil.hexColor(15191385),
        CenterOrb = ColorUtil.hexColor(15191385),
        InnerOrb = ColorUtil.hexColor(15191385)
    } or {
        Neon = ColorUtil.hexColor(6260671),
        OuterOrb = ColorUtil.hexColor(6260671),
        CenterOrb = ColorUtil.hexColor(6260671),
        InnerOrb = ColorUtil.hexColor(6260671)
    });
end;

function u6.setTheme(p43, p44, p45) -- Line: 232
    -- upvalues: ItemType (copy), CollectionService (copy)
    local u46 = p43:getColorTheme(p45);

    local function _(p47) -- Line: 237
        -- upvalues: u46 (copy)
        if p47:IsA("BasePart") and string.lower(p47.Name) == "neon" then
            p47.Color = u46.Neon;
        end;
    end;

    for i, child in p44.Handle:GetChildren() do
        local _ = i - 1;

        if child:IsA("BasePart") and string.lower(child.Name) == "neon" then
            child.Color = u46.Neon;
        end;
    end;

    if p44.Handle:FindFirstChild("Neon") then
        p44.Handle.Neon.Color = u46.Neon;
    end;

    if p43.currentStaff ~= ItemType.WIZARD_STAFF then
        if p44.Handle:FindFirstChild("OuterOrb") then
            p44.Handle.OuterOrb.Color = u46.OuterOrb;
        end;

        if p44.Handle:FindFirstChild("CenterOrb") then
            p44.Handle.CenterOrb.Color = u46.OuterOrb;
        end;

        if p44.Handle:FindFirstChild("InnerOrb") then
            p44.Handle.InnerOrb.Color = u46.OuterOrb;
        end;

        local function _(p48) -- Line: 259
            -- upvalues: u46 (copy), CollectionService (ref)
            if p48:IsA("ParticleEmitter") then
                p48.Color = ColorSequence.new(u46.OuterOrb);
                CollectionService:AddTag(p48, "FirstPersonHidden");
            end;
        end;

        for i, descendant in p44:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("ParticleEmitter") then
                descendant.Color = ColorSequence.new(u46.OuterOrb);
                CollectionService:AddTag(descendant, "FirstPersonHidden");
            end;
        end;
    end;
end;

function u6.isRelevantItem(p49, p50) -- Line: 270
    -- upvalues: WizardUtil (copy)
    return WizardUtil:isWizardStaff(p50.itemType);
end;

function u6.onStartCharging(p51) -- Line: 273
end;

function u6.onStopCharging(p52) -- Line: 275
end;

function u6.onLaunch(p53) -- Line: 277
end;

function u6.onStartReload(p54) -- Line: 279
end;

KnitClient.CreateController(u6.new());

return nil;