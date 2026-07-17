-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local MobileButton = v1.MobileButton;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local CondimentGunConfigs = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "condiment-gun", "condiment-gun-config").CondimentGunConfigs;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local CondimentAmmoComponent = RuntimeLib.import(script, script.Parent, "condiment-ammo-component").CondimentAmmoComponent;
local u5 = { GameSound.CONDIMENT_GUN_SHOT_1, GameSound.CONDIMENT_GUN_SHOT_2, GameSound.CONDIMENT_GUN_SHOT_3 };
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 32, Name: __tostring
        return "CondimentGunController";
    end,

    __index = HandKnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 38
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 42
    -- upvalues: HandKnitController (copy), u3 (copy), default (copy)
    HandKnitController.constructor(p8);
    p8.Name = "CondimentGunController";
    p8.maid = u3.new();
    p8.condimentGunToggle = default.Client:Get("CondimentGunToggle");
    p8.condimentGunToggleEffects = default.Client:Get("CondimentGunToggleEffects");
    p8.condimentGunCycleModes = default.Client:Get("CondimentGunCycleModes");
    p8.soundMaid = u3.new();
end;

function u6.KnitStart(u9) -- Line: 51
    -- upvalues: HandKnitController (copy), KnitClient (copy), ItemType (copy), AnimationType (copy), u5 (copy), EntityUtil (copy), Players (copy)
    HandKnitController.KnitStart(u9);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.CONDIMENT_GUN, {
        animations = { AnimationType.FLAMETHROWER_IDLE },
        sounds = u5
    });
    u9.condimentGunToggleEffects:Connect(function(p10, p11, p12) -- Line: 57
        -- upvalues: EntityUtil (ref), u9 (copy), Players (ref), KnitClient (ref)
        local v13 = EntityUtil:getEntity(p10);

        if v13 ~= nil then
            v13 = v13:getHandItemInstanceFromCharacter();
        end;

        if not v13 then
            return nil;
        end;

        u9:toggleEffects(v13, p11, p12);

        if p10 == Players.LocalPlayer then
            local v14 = v13:Clone();
            u9:updateEffects(v14);
            KnitClient.Controllers.ViewmodelController:setHeldItem(v14);
        end;
    end);
end;

function u6.isRelevantItem(p15, p16) -- Line: 74
    -- upvalues: ItemType (copy)
    return p16.itemType == ItemType.CONDIMENT_GUN;
end;

function u6.onEnable(u17, p18, p19) -- Line: 77
    -- upvalues: GameAnimationUtil (copy), Players (copy), AnimationType (copy), Flamework (copy), AbilityId (copy), BedwarsImageId (copy), ClientSyncEvents (copy), DeviceUtil (copy), KnitClient2 (copy), u4 (copy), MobileButton (copy), CondimentAmmoComponent (copy), EntityUtil (copy)
    u17:setupYield(function() -- Line: 78
        -- upvalues: GameAnimationUtil (ref), Players (ref), AnimationType (ref)
        local u20 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.FLAMETHROWER_IDLE, {
            looped = true
        });

        return function() -- Line: 82
            -- upvalues: u20 (copy)
            local v21 = u20;

            if v21 ~= nil then
                v21:Stop();
            end;
        end;
    end);
    u17.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "use-condiment-gun",

        boundFunction = function(p22, p23, p24) -- Line: 92, Name: boundFunction
            -- upvalues: u17 (copy)
            if p23 == Enum.UserInputState.Begin then
                u17:toggleCondimentGun(true);

                return;
            end;

            if p23 == Enum.UserInputState.End then
                u17:toggleCondimentGun(false);
            end;
        end
    }));
    u17.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.CONDIMENT_GUN_CYCLE, {
        abilityType = "ItemPrimary",
        abilityButton = {
            icon = BedwarsImageId.CONDIMENT_GUN_ICON
        }
    }):expect());
    u17.maid:GiveTask(ClientSyncEvents.AbilityUsed:connect(function(p25) -- Line: 106
        -- upvalues: Players (ref), u17 (copy)
        if p25.userCharacter == Players.LocalPlayer.Character then
            u17:cycleCondimentGunMode();
        end;
    end));

    if DeviceUtil.isMobileControls() then
        u17:setupYield(function() -- Line: 112
            -- upvalues: KnitClient2 (ref), u4 (ref), MobileButton (ref), BedwarsImageId (ref), Flamework (ref), u17 (copy), Players (ref)
            KnitClient2.Controllers.MobileLayoutLoadController:onMobileLayoutLoaded():await();
            local u26 = u4.mount(u4.createElement("ScreenGui", {
                ResetOnSpawn = false
            }, { u4.createElement(MobileButton, {
                    Image = BedwarsImageId.CONDIMENT_GUN_ICON,
                    Position = Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonPosition("ItemSecondary"),
                    Size = Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonSize("ItemSecondary"),

                    OnPressDown = function() -- Line: 121, Name: OnPressDown
                        -- upvalues: u17 (ref)
                        u17:toggleCondimentGun(true);
                    end,

                    OnPressUp = function() -- Line: 124, Name: OnPressUp
                        -- upvalues: u17 (ref)
                        u17:toggleCondimentGun(false);
                    end
                }) }), Players.LocalPlayer:WaitForChild("PlayerGui"));

            return function() -- Line: 129
                -- upvalues: u4 (ref), u26 (copy)
                u4.unmount(u26);
            end;
        end);
    end;

    u17.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createElement(CondimentAmmoComponent, {
        item = p18.tool
    })));
    local v27 = EntityUtil:getEntity(Players.LocalPlayer);

    if v27 ~= nil then
        v27 = v27:getHandItemInstanceFromCharacter();
    end;

    if not v27 then
        return nil;
    end;

    u17:updateEffects(v27);
end;

function u6.onDisable(p28) -- Line: 147
    p28.maid:DoCleaning();
end;

function u6.toggleCondimentGun(p29, p30) -- Line: 150
    p29.condimentGunToggle:CallServerAsync({
        enabled = p30
    });
end;

function u6.cycleCondimentGunMode(p31) -- Line: 155
    p31.condimentGunCycleModes:CallServerAsync();
end;

function u6.updateEffects(p32, p33) -- Line: 158
    -- upvalues: KnitClient (copy)
    p32:toggleEffects(p33, p33:GetAttribute("Enabled"), (p33:GetAttribute("Mode")));

    if KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
        local v34 = p33:Clone();
        KnitClient.Controllers.ViewmodelController:setHeldItem(v34);
    end;
end;

function u6.toggleEffects(p35, p36, p37, p38) -- Line: 167
    -- upvalues: RandomUtil (copy), u5 (copy), SoundManager (copy), GameSound (copy), CondimentGunConfigs (copy)
    SoundManager:playSound(RandomUtil.fromList(unpack(u5)), {
        volumeMultiplier = 0.2,
        parent = p36.Handle
    });

    if p37 then
        local v39 = SoundManager:playSound(GameSound.CONDIMENT_GUN_LOOP, {
            looped = true,
            volumeMultiplier = 0.2,
            parent = p36.Handle
        });

        if v39 then
            p35.soundMaid:GiveTask(v39);
        end;
    else
        p35.soundMaid:DoCleaning();
    end;

    local Handle = p36.Handle;

    for _, descendant in Handle.Emitter:GetDescendants() do
        if descendant:IsA("Attachment") then
            local v40;

            if descendant.Name == p38 then
                v40 = p37;
            else
                v40 = false;
            end;

            for _, descendant2 in descendant:GetDescendants() do
                if descendant2:IsA("ParticleEmitter") then
                    descendant2.Enabled = v40;
                end;
            end;
        end;
    end;

    local color = CondimentGunConfigs.condiments[p38].color;
    local dark = color.dark;
    Handle.liquid.Color = color.light;
    Handle.band.Color = dark;
    Handle.bottle_cap.Color = dark;
end;

KnitClient.CreateController(u6.new());

return nil;