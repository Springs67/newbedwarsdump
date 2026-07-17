-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "JuggDashAbilityController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 33
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 37
    -- upvalues: KnitController (copy), u3 (copy)
    KnitController.constructor(p7);
    p7.Name = "JuggDashAbilityController";
    p7.maid = u3.new();
end;

function u5.KnitStart(u8) -- Line: 42
    -- upvalues: default (copy), Players (copy), ClientSyncEvents (copy), AbilityId (copy), SoundManager (copy), GameSound (copy)
    default.Client:Get("NewJuggernaut"):Connect(function(p9) -- Line: 43
        -- upvalues: Players (ref), u8 (copy)
        if p9.player == Players.LocalPlayer then
            u8:mountAbility();

            return;
        end;

        local v10 = Players.LocalPlayer:GetAttribute("Juggernaut");

        if v10 == 0 or (v10 ~= v10 or (v10 == "" or not v10)) then
            u8:unmountAbility();
        end;
    end);
    default.Client:Get("EntityDeathEvent"):Connect(function(p11) -- Line: 53
        -- upvalues: Players (ref), u8 (copy)
        if Players:GetPlayerFromCharacter(p11.entityInstance) == Players.LocalPlayer then
            u8:unmountAbility();
        end;
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p12) -- Line: 59
        -- upvalues: AbilityId (ref), Players (ref), default (ref), u8 (copy), SoundManager (ref), GameSound (ref)
        if p12.ability == AbilityId.JUGGERNAUT_DASH and (p12.userCharacter == Players.LocalPlayer.Character and default.Client:Get("JuggernautDash"):CallServer()) then
            u8:jump();
            SoundManager:playSound(GameSound.JUGGERNAUT_LEAP, {
                rollOffMaxDistance = 45,
                volumeMultiplier = 1.2,
                position = p12.userCharacter:GetPrimaryPartCFrame().Position
            });
        end;
    end);
    default.Client:Get("JuggernautLeapEvent"):Connect(function(p13) -- Line: 72
        -- upvalues: u8 (copy)
        u8:playAnimation(p13.player);
    end);
    default.Client:Get("JuggernautLandedEvent"):Connect(function(p14) -- Line: 75
        -- upvalues: u8 (copy), SoundManager (ref), GameSound (ref)
        u8:playParticleEffect(p14.player);
        local STOMPER_HIT = GameSound.STOMPER_HIT;
        local v15 = {};
        local Character = p14.player.Character;

        if Character ~= nil then
            Character = Character:GetPrimaryPartCFrame().Position;
        end;

        v15.position = Character;
        v15.rollOffMaxDistance = 45;
        v15.volumeMultiplier = 0.7;
        SoundManager:playSound(STOMPER_HIT, v15);
    end);
end;

function u5.mountAbility(p16) -- Line: 91
    -- upvalues: Flamework (copy), AbilityId (copy), BedwarsImageId (copy)
    local u17 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.JUGGERNAUT_DASH, {
        abilityType = "MiscPrimary",
        abilityButton = {
            icon = BedwarsImageId.JUGG_BARB_LEAP
        }
    }):expect();
    p16.maid:GiveTask(function() -- Line: 98
        -- upvalues: u17 (copy)
        u17.Destroy();
    end);
end;

function u5.unmountAbility(p18) -- Line: 102
    p18.maid:DoCleaning();
end;

function u5.jump(p19) -- Line: 105
    -- upvalues: Players (copy), Workspace (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    local AssemblyLinearVelocity = Character.AssemblyLinearVelocity;
    local Character2 = Players.LocalPlayer.Character;

    if Character2 ~= nil then
        Character2 = Character2:FindFirstChild("Humanoid");
    end;

    local AssemblyMass = Character.AssemblyMass;
    local v20 = AssemblyLinearVelocity.Y * AssemblyMass * 0.5;
    local CurrentCamera = Workspace.CurrentCamera;

    if CurrentCamera ~= nil then
        CurrentCamera = (CurrentCamera.CFrame.LookVector * Vector3.new(1, 0, 1)).Unit;
    end;

    local Character3 = Players.LocalPlayer.Character;

    if Character3 ~= nil then
        Character3 = Character3:GetPrimaryPartCFrame();
    end;

    if Character3 ~= nil then
        Character3 = Character3.Position;
    end;

    if Character3 and CurrentCamera then
        local Character4 = Players.LocalPlayer.Character;

        if Character4 ~= nil then
            Character4:PivotTo(CFrame.lookAt(Character3, Character3 + CurrentCamera));
        end;
    end;

    local Character4 = Players.LocalPlayer.Character;

    if Character4 ~= nil then
        Character4 = Character4:GetPrimaryPartCFrame().LookVector * 100;
    end;

    local v21;

    if Character2 == nil then
        v21 = Character2;
    else
        v21 = Character2:GetState();
    end;

    local v22 = v21 == Enum.HumanoidStateType.Landed and 0 or v20;

    if Character ~= nil then
        Character:ApplyImpulse((Vector3.new(Character4.X * AssemblyMass * 0.75, AssemblyMass * 30 - v22, Character4.Z * AssemblyMass * 0.75)));
    end;

    if Character2 ~= nil then
        Character2:ChangeState(Enum.HumanoidStateType.Jumping);
    end;
end;

function u5.playAnimation(p23, p24) -- Line: 167
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), Players (copy), KnitClient2 (copy)
    AnimationUtil:playAnimation(p24, GameAnimationUtil:getAssetId(AnimationType.JUGGERNAUT_LEAP_ATTACK));

    if p24 == Players.LocalPlayer then
        KnitClient2.Controllers.ViewmodelController:playAnimation(AnimationType.JUGGERNAUT_LEAP_FP);
    end;
end;

function u5.playParticleEffect(p25, p26) -- Line: 173
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), Players (copy)
    local Character = p26.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return nil;
    end;

    local u27 = ReplicatedStorage.Assets.Effects.JuggernautStabGround:Clone();
    local u28 = ReplicatedStorage.Assets.Effects.GroudCrack:Clone();
    u27.Position = Character;
    u27.Parent = Workspace;
    u28.Position = Character;
    u28.Parent = Workspace;
    local Character2 = Players.LocalPlayer.Character;

    if Character2 ~= nil then
        Character2 = Character2.PrimaryPart;

        if Character2 ~= nil then
            Character2 = Character2.Position;
        end;
    end;

    if Character2 then
        Character2 = (Character2 - Character).Magnitude <= 20;
    end;

    if Character2 then
        p25:shakeScreen(Character);
    end;

    local function _(p29) -- Line: 209
        if p29:IsA("ParticleEmitter") then
            p29:Emit(30);
        end;
    end;

    for i, descendant in u27:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") then
            descendant:Emit(30);
        end;
    end;

    task.delay(1, function() -- Line: 217
        -- upvalues: u27 (copy), u28 (copy)
        u27:Destroy();
        u28:Destroy();
    end);
end;

function u5.shakeScreen(p30, p31) -- Line: 222
    -- upvalues: Players (copy), KnitClient (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:GetPrimaryPartCFrame();
    end;

    if not Character then
        return nil;
    end;

    KnitClient.Controllers.ScreenShakeController:shake(p31, Character.LookVector, {
        magnitude = 5,
        cycles = 5,
        duration = 0.4
    });
end;

KnitClient.CreateController(u5.new());

return nil;