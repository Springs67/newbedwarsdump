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
local Debris = v4.Debris;
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local BedwarsUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PARTY_POPPER = ItemType.PARTY_POPPER;
local PARTY_POPPER2 = AbilityId.PARTY_POPPER;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 40, Name: __tostring
        return "PartyPopperController";
    end,

    __index = HandKnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 46
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 50
    -- upvalues: HandKnitController (copy), u2 (copy)
    HandKnitController.constructor(p7);
    p7.Name = "PartyPopperController";
    p7.abilityMaid = u2.new();
end;

function u5.KnitStart(p8) -- Line: 55
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(p8);
    p8:listenForAbility();
end;

function u5.onEnable(p9, p10, p11) -- Line: 60
    p9:setupPopperControls();
end;

function u5.onDisable(p12) -- Line: 63
    p12.abilityMaid:DoCleaning();
end;

function u5.listenForAbility(u13) -- Line: 66
    -- upvalues: ClientSyncEvents (copy), PARTY_POPPER2 (copy), Players (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), Workspace (copy), Debris (copy)
    ClientSyncEvents.AbilityUsed:connect(function(p14) -- Line: 67
        -- upvalues: PARTY_POPPER2 (ref), Players (ref), u13 (copy), SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), Workspace (ref), Debris (ref)
        if p14:isCancelled() then
            return nil;
        end;

        if p14.ability ~= PARTY_POPPER2 then
            return nil;
        end;

        if p14.ability == PARTY_POPPER2 and (p14.userCharacter == Players.LocalPlayer.Character and not u13:isPopperInHand()) then
            p14:setCancelled(true);

            return nil;
        end;

        local CONFETTI_POPPER = GameSound.CONFETTI_POPPER;
        local v15 = {};
        local v16;

        if p14.userCharacter == Players.LocalPlayer.Character then
            v16 = nil;
        else
            v16 = p14.userCharacter:GetPivot().Position;
        end;

        v15.position = v16;
        SoundManager:playSound(CONFETTI_POPPER, v15);
        local v17 = ReplicatedStorage.Assets.Effects.NewYearsConfetti:Clone();
        v17.CFrame = p14.userCharacter:GetPivot() + p14.userCharacter:GetPivot().LookVector * 5.5;
        v17.Parent = Workspace;
        local v18 = v17:FindFirstChildWhichIsA("ParticleEmitter", true);

        if v18 then
            v18:Emit(40);
        end;

        Debris:AddItem(v17, 1.25);
    end);
end;

function u5.setupPopperControls(u19) -- Line: 97
    -- upvalues: Flamework (copy), PARTY_POPPER2 (copy), ContextActionService (copy), DeviceUtil (copy), u3 (copy), MobileButton (copy), BedwarsUI (copy), Players (copy)
    u19:setupDestroyableYield(function() -- Line: 99
        -- upvalues: Flamework (ref), PARTY_POPPER2 (ref)
        return Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(PARTY_POPPER2, nil):expect();
    end);
    u19.abilityMaid:GiveTask(function() -- Line: 102
        -- upvalues: ContextActionService (ref)
        return ContextActionService:UnbindAction("use-popper");
    end);
    local v23 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "use-popper",

        boundFunction = function(p20, p21, p22) -- Line: 109, Name: boundFunction
            -- upvalues: u19 (copy)
            if p21 == Enum.UserInputState.Begin then
                u19:tryUseAbility();
            end;
        end
    });
    u19.abilityMaid:GiveTask(v23);

    if DeviceUtil.isMobileControls() then
        u19:setupYield(function() -- Line: 119
            -- upvalues: u3 (ref), MobileButton (ref), BedwarsUI (ref), u19 (copy), Players (ref)
            local u24 = u3.mount(u3.createElement("ScreenGui", {
                ResetOnSpawn = false
            }, { u3.createElement(MobileButton, {
                    Image = "rbxassetid://6862310392",
                    Position = BedwarsUI:getActionMobileButtonPosition(),

                    OnClick = function() -- Line: 126, Name: OnClick
                        -- upvalues: u19 (ref)
                        return u19:tryUseAbility();
                    end
                }) }), Players.LocalPlayer:WaitForChild("PlayerGui"));

            return function() -- Line: 131
                -- upvalues: u3 (ref), u24 (copy)
                u3.unmount(u24);
            end;
        end);
    end;
end;

function u5.tryUseAbility(p25) -- Line: 137
    -- upvalues: Flamework (copy), PARTY_POPPER2 (copy)
    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(PARTY_POPPER2) then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(PARTY_POPPER2);
    end;
end;

function u5.isPopperInHand(p26) -- Line: 142
    -- upvalues: InventoryUtil (copy), Players (copy)
    local hand = InventoryUtil.getInventory(Players.LocalPlayer).hand;

    if hand then
        return p26:isRelevantItem(hand);
    end;

    return false;
end;

function u5.isRelevantItem(p27, p28) -- Line: 149
    -- upvalues: PARTY_POPPER (copy)
    return p28.itemType == PARTY_POPPER;
end;

KnitClient.CreateController(u5.new());

return nil;