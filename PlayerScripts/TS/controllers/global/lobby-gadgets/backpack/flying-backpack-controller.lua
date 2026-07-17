-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local UserInputService = v5.UserInputService;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local BackpackEnergyComponent = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "items", "backpack", "ui", "backpack-energy-component").BackpackEnergyComponent;
local u6 = { GameSound.XUROT_FLAP_WING_1, GameSound.XUROT_FLAP_WING_2 };
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 30, Name: __tostring
        return "FlyingBackpackController";
    end,

    __index = KnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 36
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 40
    -- upvalues: KnitController (copy), u2 (copy)
    KnitController.constructor(p9);
    p9.Name = "FlyingBackpackController";
    p9.equipped = false;
    p9.jumpReadyTime = -1;
    p9.lastJumpTime = -1;
    p9.isFlying = false;
    p9.uiMaid = u2.new();
end;

function u7.KnitStart(u10) -- Line: 49
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), ItemType (copy), ReplicatedStorage (copy), Players (copy), Workspace (copy), EffectUtil (copy), UserInputService (copy), default (copy)
    KnitController.KnitStart(u10);
    local u11 = -1;
    ClientSyncEvents.ItemAdded:connect(function(p12) -- Line: 52
        -- upvalues: ItemType (ref), ReplicatedStorage (ref), Players (ref), Workspace (ref), EffectUtil (ref)
        if p12.item.Name == ItemType.FLYING_BACKPACK then
            local v13 = ReplicatedStorage.Assets.Effects.FlyingBackpackEffect:Clone();
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;

                if Character ~= nil then
                    Character = Character.Position;
                end;
            end;

            if not Character then
                return nil;
            end;

            v13.Position = Character;
            v13.Parent = Workspace;
            EffectUtil:playEffects({ v13 }, nil, {
                destroyAfterSec = 1
            });
        end;
    end);
    ClientSyncEvents.BackpackEquipEvent:connect(function(p14) -- Line: 73
        -- upvalues: Players (ref), ItemType (ref), u10 (copy)
        if p14.player == Players.LocalPlayer then
            if p14.item == ItemType.FLYING_BACKPACK then
                u10:equip(p14.backpack);

                return;
            end;

            u10:unequip();
        end;
    end);
    UserInputService.JumpRequest:Connect(function() -- Line: 82
        -- upvalues: u11 (ref), Players (ref), u10 (copy)
        if u11 < time() then
            u11 = time() + 0.15;
            local Character = Players.LocalPlayer.Character;

            if (Character.Humanoid:GetState() == Enum.HumanoidStateType.Jumping or Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall) and (u10.equipped and u10:flapWings()) then
                u11 = time() + 1;
            end;
        end;
    end);
    default.Client:Get("flyingBackpackFlap"):Connect(function(p15) -- Line: 93
        -- upvalues: Players (ref), u10 (copy)
        if p15.player ~= Players.LocalPlayer then
            u10:flapAnimation(p15.player);
        end;
    end);
end;

function u7.equip(u16, p17) -- Line: 99
    -- upvalues: ItemType (copy), Flamework (copy), u4 (copy), BackpackEnergyComponent (copy)
    u16.uiMaid:DoCleaning();

    if not p17 or p17.itemType ~= ItemType.FLYING_BACKPACK then
        return nil;
    end;

    u16.uiMaid = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createElement(BackpackEnergyComponent, {
        backpack = p17.tool
    }));
    u16.uiMaid:GiveTask(function() -- Line: 107
        -- upvalues: u16 (copy)
        u16.uiMaid:DoCleaning();
    end);
    u16.equipped = true;
end;

function u7.unequip(p18) -- Line: 112
    p18.uiMaid:DoCleaning();
    p18.equipped = false;
end;

function u7.flapWings(u19) -- Line: 116
    -- upvalues: default (copy), Players (copy), u3 (copy), Workspace (copy)
    if not default.Client:Get("FlyingBackpackFlap"):CallServer() then
        return nil;
    end;

    u19:flapAnimation(Players.LocalPlayer);
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    local Character2 = Players.LocalPlayer.Character;

    if Character2 ~= nil then
        Character2 = Character2:FindFirstChild("Humanoid");
    end;

    local AssemblyMass = Character.AssemblyMass;
    local v20 = Character.AssemblyLinearVelocity.Y * AssemblyMass;

    if Character2 ~= nil then
        Character2 = Character2:GetState();
    end;

    local v21 = Character2 == Enum.HumanoidStateType.Landed and 0 or v20;

    if Character ~= nil then
        Character:ApplyImpulse((Vector3.new(0, AssemblyMass * 40 - v21, 0)));
    end;

    if not u19.liftBodyForce then
        u19.liftBodyForce = u3("BodyForce", {
            Name = "FlapWingForce",
            Force = Vector3.new(0, Workspace.Gravity * AssemblyMass * 0.75, 0),
            Parent = Character
        });
    end;

    local u22 = Workspace:GetServerTimeNow();
    u19.lastJumpTime = u22;
    task.delay(1.1, function() -- Line: 157
        -- upvalues: u22 (copy), u19 (copy)
        if u22 == u19.lastJumpTime then
            local liftBodyForce = u19.liftBodyForce;

            if liftBodyForce ~= nil then
                liftBodyForce:Destroy();
            end;

            u19.liftBodyForce = nil;
        end;
    end);

    return true;
end;

function u7.flapAnimation(p23, p24) -- Line: 168
    -- upvalues: GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), RandomUtil (copy), u6 (copy)
    local Character = p24.Character;

    if Character ~= nil then
        Character = Character:FindFirstChild("flying_backpack");

        if Character ~= nil then
            Character = Character:WaitForChild("AnimationController", 3);

            if Character ~= nil then
                Character = Character:WaitForChild("Animator", 3);
            end;
        end;
    end;

    if not Character then
        return nil;
    end;

    GameAnimationUtil:playAnimation(Character, AnimationType.FLYING_BACKPACK_FLAP);
    local Character2 = p24.Character;

    if Character2 ~= nil then
        Character2 = Character2:GetPrimaryPartCFrame().Position;
    end;

    SoundManager:playSound(RandomUtil.fromList(unpack(u6)), {
        rollOffMaxDistance = 45,
        volumeMultiplier = 0.5,
        position = Character2
    });
end;

KnitClient.CreateController(u7.new());

return nil;