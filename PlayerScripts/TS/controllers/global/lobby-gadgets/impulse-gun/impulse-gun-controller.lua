-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local DeviceUtil = v1.DeviceUtil;
local MobileTouchType = v1.MobileTouchType;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v3.ContextActionService;
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local KnockbackUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "knockback-util").KnockbackUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = { GameSound.IMPULSE_GUN_FIRE_1, GameSound.IMPULSE_GUN_FIRE_2, GameSound.IMPULSE_GUN_FIRE_3 };
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 33, Name: __tostring
        return "ImpulseGunController";
    end,

    __index = HandKnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 39
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 43
    -- upvalues: HandKnitController (copy), u2 (copy)
    HandKnitController.constructor(p7);
    p7.Name = "ImpulseGunController";
    p7.abilityMaid = u2.new();
end;

function u5.isRelevantItem(p8, p9) -- Line: 48
    -- upvalues: ItemType (copy)
    return p9.itemType == ItemType.IMPULSE_GUN;
end;

function u5.onEnable(p10, p11, p12) -- Line: 51
    -- upvalues: Flamework (copy), AbilityId (copy), MobileTouchType (copy), DeviceUtil (copy), BedwarsImageId (copy)
    local v16 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "Impulse Gun Fire",

        boundFunction = function(p13, p14, p15) -- Line: 56, Name: boundFunction
            -- upvalues: Flamework (ref), AbilityId (ref)
            if p14 ~= Enum.UserInputState.Begin then
                return nil;
            end;

            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.IMPULSE_GUN);
        end,

        mobile = {
            touchType = MobileTouchType.TouchTap,

            mobileBoundFunction = function() -- Line: 64, Name: mobileBoundFunction
                -- upvalues: Flamework (ref), AbilityId (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.IMPULSE_GUN);
            end
        }
    });
    p10.abilityMaid:GiveTask(v16);

    if DeviceUtil.isMobileControls() then
        local u17 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.IMPULSE_GUN, {
            abilityType = "ItemPrimary",
            abilityButton = {
                icon = BedwarsImageId.IMPULSE_GUN_RENDER
            }
        }):expect();
        p10.abilityMaid:GiveTask(function() -- Line: 77
            -- upvalues: u17 (copy)
            u17.Destroy();
        end);
    end;
end;

function u5.onDisable(p18) -- Line: 82
    -- upvalues: ContextActionService (copy)
    ContextActionService:UnbindAction("Impulse Gun Fire");
    p18.abilityMaid:DoCleaning();
end;

function u5.KnitStart(u19) -- Line: 86
    -- upvalues: HandKnitController (copy), KnitClient (copy), ItemType (copy), u4 (copy), ClientSyncEvents (copy), Players (copy), AbilityId (copy), default (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), RandomUtil (copy), SoundManager (copy)
    HandKnitController.KnitStart(u19);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.IMPULSE_GUN, {
        sounds = u4
    });
    ClientSyncEvents.AbilityUsed:connect(function(p20) -- Line: 91
        -- upvalues: Players (ref), AbilityId (ref), u19 (copy)
        if p20.userCharacter == Players.LocalPlayer.Character and p20.ability == AbilityId.IMPULSE_GUN then
            u19:fire();
        end;
    end);
    default.Client:Get("ImpulseGunEffect"):Connect(function(p21) -- Line: 96
        -- upvalues: Players (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), u19 (copy), RandomUtil (ref), u4 (ref), SoundManager (ref)
        if p21.player ~= Players.LocalPlayer then
            AnimationUtil:playAnimation(p21.player, GameAnimationUtil:getAssetId(AnimationType.TORNADO_LAUNCHER_SHOOT), {
                looped = false
            });
            u19:playImpulseEffect(p21.player, p21.direction);
            local Character = p21.player.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;

                if Character ~= nil then
                    Character = Character.Position;
                end;
            end;

            if not Character then
                return nil;
            end;

            SoundManager:playSound(RandomUtil.fromList(unpack(u4)), {
                position = Character
            });
        end;
    end);
end;

function u5.fire(p22) -- Line: 120
    -- upvalues: Workspace (copy), Players (copy), default (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), RandomUtil (copy), u4 (copy), SoundManager (copy), KnockbackUtil (copy)
    local CurrentCamera = Workspace.CurrentCamera;
    local v23;

    if CurrentCamera == nil then
        v23 = CurrentCamera;
    else
        v23 = CurrentCamera.CFrame.LookVector.Unit;
    end;

    if not v23 then
        return nil;
    end;

    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    local AssemblyMass = Character.AssemblyMass;

    if not default.Client:Get("ImpulseGunFire"):CallServer({
        velocity = v23,
        lookVector = v23
    }) then
        return nil;
    end;

    AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.TORNADO_LAUNCHER_SHOOT), {
        looped = false
    });
    p22:playImpulseEffect(Players.LocalPlayer, v23);
    SoundManager:playSound((RandomUtil.fromList(unpack(u4))));
    Character.CFrame = CFrame.new(Character.Position, Character.Position + CurrentCamera.CFrame.LookVector * Vector3.new(1, 0, 1));
    KnockbackUtil.applyKnockbackPlatformStand(Character);
    Character:ApplyImpulse(v23 * (AssemblyMass * 120 * -1));
end;

function u5.playImpulseEffect(p24, p25, p26) -- Line: 164
    -- upvalues: EntityUtil (copy), ReplicatedStorage (copy), Workspace (copy)
    if not EntityUtil:getEntity(p25) then
        return nil;
    end;

    local u27 = ReplicatedStorage.Assets.Effects.ImpulseGunEffect:Clone();
    u27.Parent = Workspace;
    local Character = p25.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return false;
    end;

    u27.CFrame = CFrame.new(Character, Character + p26.Unit * 10);

    local function _(p28) -- Line: 185
        if p28:IsA("ParticleEmitter") then
            p28:Emit(15);
        end;
    end;

    for i, child in u27:WaitForChild("particleAttachment"):GetChildren() do
        local _ = i - 1;

        if child:IsA("ParticleEmitter") then
            child:Emit(15);
        end;
    end;

    task.delay(1, function() -- Line: 193
        -- upvalues: u27 (copy)
        u27:Destroy();
    end);
end;

KnitClient.CreateController(u5.new());

return nil;