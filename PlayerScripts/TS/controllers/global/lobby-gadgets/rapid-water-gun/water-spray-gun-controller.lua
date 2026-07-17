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
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local WaterType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "water-gun", "water-gun-util").WaterType;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WaterBar = RuntimeLib.import(script, script.Parent, "ui", "water-bar").WaterBar;
local u5 = { GameSound.CONDIMENT_GUN_SHOT_1, GameSound.CONDIMENT_GUN_SHOT_2, GameSound.CONDIMENT_GUN_SHOT_3 };
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 29, Name: __tostring
        return "WaterSprayGunController";
    end,

    __index = HandKnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 35
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 39
    -- upvalues: HandKnitController (copy), u3 (copy), default (copy), WaterType (copy)
    HandKnitController.constructor(p8);
    p8.Name = "WaterSprayGunController";
    p8.maid = u3.new();
    p8.condimentGunToggle = default.Client:Get("WaterSprayGunToggle");
    p8.condimentGunToggleEffects = default.Client:Get("WaterSprayGunToggleEffects");
    p8.condimentGunCycleModes = default.Client:Get("WaterSprayGunCycleModes");
    p8.soundMaid = u3.new();
    p8.waterType = WaterType.DEFAULT;
end;

function u6.KnitStart(u9) -- Line: 49
    -- upvalues: HandKnitController (copy), KnitClient (copy), ItemType (copy), AnimationType (copy), u5 (copy), EntityUtil (copy), Players (copy), WaterType (copy)
    HandKnitController.KnitStart(u9);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.CONDIMENT_GUN, {
        animations = { AnimationType.FLAMETHROWER_IDLE },
        sounds = u5
    });
    u9.condimentGunToggleEffects:Connect(function(p10, p11) -- Line: 55
        -- upvalues: EntityUtil (ref), ItemType (ref), u9 (copy), Players (ref), KnitClient (ref)
        local v12 = EntityUtil:getEntity(p10);

        if v12 ~= nil then
            v12 = v12:getHandItemInstanceFromCharacter();
        end;

        local v13;

        if v12 == nil then
            v13 = v12;
        else
            v13 = v12.Name;
        end;

        if v13 ~= ItemType.WATER_SPRAYING_GUN then
            return nil;
        end;

        u9:toggleEffects(v12, p11);

        if p10 ~= Players.LocalPlayer then
            u9:updateEffects(v12, p10);

            return;
        end;

        local v14 = v12:Clone();
        u9:updateEffects(v14);
        KnitClient.Controllers.ViewmodelController:setHeldItem(v14);
    end);
    Players.LocalPlayer:GetAttributeChangedSignal("WaterType"):Connect(function() -- Line: 77
        -- upvalues: Players (ref), WaterType (ref), u9 (copy), EntityUtil (ref), ItemType (ref), KnitClient (ref)
        local v15 = Players.LocalPlayer:GetAttribute("WaterType");

        if v15 == nil then
            v15 = WaterType.DEFAULT;
        end;

        u9.waterType = v15;
        local v16 = EntityUtil:getLocalPlayerEntity();

        if v16 ~= nil then
            v16 = v16:getHandItemInstanceFromCharacter();
        end;

        local v17;

        if v16 == nil then
            v17 = v16;
        else
            v17 = v16.Name;
        end;

        if v17 == ItemType.WATER_SPRAYING_GUN then
            u9:updateEffects(v16);
            local v18 = KnitClient.Controllers.ViewmodelController:getFirstPersonHandItem();
            local v19;

            if v18 == nil then
                v19 = v18;
            else
                v19 = v18.Name;
            end;

            if v19 == ItemType.WATER_SPRAYING_GUN then
                u9:updateEffects(v18);
            end;
        end;
    end);
end;

function u6.isRelevantItem(p20, p21) -- Line: 106
    -- upvalues: ItemType (copy)
    return p21.itemType == ItemType.WATER_SPRAYING_GUN;
end;

function u6.onEnable(u22, p23, p24) -- Line: 109
    -- upvalues: GameAnimationUtil (copy), Players (copy), AnimationType (copy), Flamework (copy), DeviceUtil (copy), KnitClient2 (copy), u4 (copy), MobileButton (copy), WaterBar (copy)
    u22:setupYield(function() -- Line: 110
        -- upvalues: GameAnimationUtil (ref), Players (ref), AnimationType (ref)
        local u25 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.FLAMETHROWER_IDLE, {
            looped = true
        });

        return function() -- Line: 114
            -- upvalues: u25 (copy)
            local v26 = u25;

            if v26 ~= nil then
                v26:Stop();
            end;
        end;
    end);
    u22.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "use-water-gun",

        boundFunction = function(p27, p28, p29) -- Line: 124, Name: boundFunction
            -- upvalues: u22 (copy)
            if p28 == Enum.UserInputState.Begin then
                u22:toggleCondimentGun(true);

                return;
            end;

            if p28 == Enum.UserInputState.End then
                u22:toggleCondimentGun(false);
            end;
        end
    }));

    if DeviceUtil.isMobileControls() then
        u22:setupYield(function() -- Line: 133
            -- upvalues: KnitClient2 (ref), u4 (ref), MobileButton (ref), Flamework (ref), u22 (copy), Players (ref)
            KnitClient2.Controllers.MobileLayoutLoadController:onMobileLayoutLoaded():await();
            local u30 = u4.mount(u4.createElement("ScreenGui", {
                ResetOnSpawn = false
            }, { u4.createElement(MobileButton, {
                    Image = "rbxassetid://136145446675408",
                    Position = Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonPosition("ItemSecondary"),
                    Size = Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonSize("ItemSecondary"),

                    OnPressDown = function() -- Line: 142, Name: OnPressDown
                        -- upvalues: u22 (ref)
                        u22:toggleCondimentGun(true);
                    end,

                    OnPressUp = function() -- Line: 145, Name: OnPressUp
                        -- upvalues: u22 (ref)
                        u22:toggleCondimentGun(false);
                    end
                }) }), Players.LocalPlayer:WaitForChild("PlayerGui"));

            return function() -- Line: 150
                -- upvalues: u4 (ref), u30 (copy)
                u4.unmount(u30);
            end;
        end);
    end;

    u22.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createElement(WaterBar)));
    local tool = p23.tool;

    if not tool then
        return nil;
    end;

    u22:updateEffects(tool);
end;

function u6.onDisable(p31) -- Line: 162
    p31:toggleCondimentGun(false);
    p31.maid:DoCleaning();
end;

function u6.toggleCondimentGun(p32, p33) -- Line: 166
    p32.condimentGunToggle:CallServerAsync({
        enabled = p33
    });
end;

function u6.updateEffects(p34, p35, p36) -- Line: 171
    -- upvalues: WaterType (copy), Players (copy), KnitClient (copy)
    local v37 = p35:GetAttribute("Enabled");

    for _, descendant in p35.Handle.Emitter:GetDescendants() do
        if descendant:IsA("Attachment") then
            local waterType = p34.waterType;

            if p36 then
                waterType = p36:GetAttribute("WaterType");

                if waterType == nil then
                    waterType = WaterType.DEFAULT;
                end;
            end;

            for _, descendant2 in descendant:GetDescendants() do
                if descendant2:IsA("ParticleEmitter") then
                    local v38 = Color3.fromRGB(28, 99, 181);

                    if waterType == WaterType.SLIME then
                        v38 = Color3.fromRGB(43, 255, 0);
                    elseif waterType == WaterType.FROSTY then
                        v38 = Color3.fromRGB(0, 255, 235);
                    end;

                    descendant2.Color = ColorSequence.new(v38);
                end;
            end;
        end;
    end;

    p34:toggleEffects(p35, v37);

    if (not p36 or p36 == Players.LocalPlayer) and KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
        local v39 = p35:Clone();
        KnitClient.Controllers.ViewmodelController:setHeldItem(v39);
    end;
end;

function u6.toggleEffects(p40, p41, p42) -- Line: 207
    -- upvalues: RandomUtil (copy), u5 (copy), SoundManager (copy), GameSound (copy)
    SoundManager:playSound(RandomUtil.fromList(unpack(u5)), {
        volumeMultiplier = 0.2,
        parent = p41.Handle
    });

    if p42 then
        local v43 = SoundManager:playSound(GameSound.CONDIMENT_GUN_LOOP, {
            looped = true,
            volumeMultiplier = 0.2,
            parent = p41.Handle
        });

        if v43 then
            p40.soundMaid:GiveTask(v43);
        end;
    else
        p40.soundMaid:DoCleaning();
    end;

    for _, descendant in p41.Handle.Emitter:GetDescendants() do
        if descendant:IsA("Attachment") then
            for _, descendant2 in descendant:GetDescendants() do
                if descendant2:IsA("ParticleEmitter") then
                    descendant2.Enabled = p42;
                end;
            end;

            p42 = p42;
        end;
    end;
end;

KnitClient.CreateController(u6.new());

return nil;