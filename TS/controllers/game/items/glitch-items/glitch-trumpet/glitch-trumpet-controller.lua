-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local MobileButton = v1.MobileButton;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v4.ContextActionService;
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local BedwarsUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 29, Name: __tostring
        return "GlitchTrumpetController";
    end,

    __index = HandKnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 35
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 39
    -- upvalues: HandKnitController (copy), u2 (copy)
    HandKnitController.constructor(p7);
    p7.Name = "GlitchTrumpetController";
    p7.maid = u2.new();
    p7.effectCooldown = {};
end;

function u5.isRelevantItem(p8, p9) -- Line: 45
    -- upvalues: ItemType (copy)
    return p9.itemType == ItemType.GLITCH_TRUMPET;
end;

function u5.onEnable(p10, p11, p12) -- Line: 48
    -- upvalues: Flamework (copy), AbilityId (copy), ContextActionService (copy), DeviceUtil (copy), u3 (copy), MobileButton (copy), BedwarsUI (copy), Players (copy)
    p10:setupDestroyableYield(function() -- Line: 50
        -- upvalues: Flamework (ref), AbilityId (ref)
        return Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.GLITCH_TRUMPET_PLAY, nil):expect();
    end);
    p10.maid:GiveTask(function() -- Line: 53
        -- upvalues: ContextActionService (ref)
        ContextActionService:UnbindAction("use-glitch-trumpet");
    end);
    local v16 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "glitch-infernal-shield-click",

        boundFunction = function(p13, p14, p15) -- Line: 61, Name: boundFunction
            -- upvalues: Flamework (ref), AbilityId (ref)
            if p14 == Enum.UserInputState.Begin then
                if not Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(AbilityId.GLITCH_TRUMPET_PLAY) then
                    return nil;
                end;

                Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.GLITCH_TRUMPET_PLAY);
            end;
        end
    });
    p10.maid:GiveTask(v16);

    if DeviceUtil.isMobileControls() then
        p10:setupYield(function() -- Line: 72
            -- upvalues: u3 (ref), MobileButton (ref), BedwarsUI (ref), Flamework (ref), AbilityId (ref), Players (ref)
            local u17 = u3.mount(u3.createElement("ScreenGui", {
                ResetOnSpawn = false
            }, { u3.createElement(MobileButton, {
                    Image = "rbxassetid://6862310392",
                    Position = BedwarsUI:getActionMobileButtonPosition(),

                    OnClick = function() -- Line: 79, Name: OnClick
                        -- upvalues: Flamework (ref), AbilityId (ref)
                        if not Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(AbilityId.GLITCH_TRUMPET_PLAY) then
                            return nil;
                        end;

                        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.GLITCH_TRUMPET_PLAY);
                    end
                }) }), Players.LocalPlayer:WaitForChild("PlayerGui"));

            return function() -- Line: 87
                -- upvalues: u3 (ref), u17 (copy)
                u3.unmount(u17);
            end;
        end);
    end;
end;

function u5.onDisable(p18) -- Line: 93
    p18.maid:DoCleaning();
end;

function u5.KnitStart(p19) -- Line: 96
    -- upvalues: HandKnitController (copy), KnitClient (copy), ItemType (copy), GameSound (copy), ClientSyncEvents (copy), AbilityId (copy), Players (copy), InventoryUtil (copy), SoundManager (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), default (copy)
    HandKnitController.KnitStart(p19);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.GLITCH_TRUMPET, {
        sounds = { GameSound.TRUMPET_PLAY }
    });
    ClientSyncEvents.AbilityUsed:connect(function(p20) -- Line: 103
        -- upvalues: AbilityId (ref), Players (ref), InventoryUtil (ref), ItemType (ref), SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), default (ref)
        local v21;

        if p20.ability == AbilityId.GLITCH_TRUMPET_PLAY then
            v21 = p20.userCharacter == Players.LocalPlayer.Character;
        else
            v21 = false;
        end;

        if v21 then
            local hand = InventoryUtil.getInventory(Players.LocalPlayer).hand;

            if hand ~= nil then
                hand = hand.itemType;
            end;

            v21 = hand == ItemType.GLITCH_TRUMPET;
        end;

        if v21 then
            local TRUMPET_PLAY = GameSound.TRUMPET_PLAY;
            local v22 = {};
            local v23;

            if p20.userCharacter == Players.LocalPlayer.Character then
                v23 = nil;
            else
                v23 = p20.userCharacter:GetPivot().Position;
            end;

            v22.position = v23;
            SoundManager:playSound(TRUMPET_PLAY, v22);
            local v24 = ReplicatedStorage.Assets.Effects.Trumpet:Clone();
            v24.CFrame = p20.userCharacter:GetPivot();
            v24.Parent = Workspace;
            EffectUtil:playEffects({ v24 }, nil);
            default.Client:Get("GlitchTrumpetPlay"):CallServer();
        end;
    end);
end;

KnitClient.CreateController(u5.new());

return nil;