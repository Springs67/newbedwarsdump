-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ScreenShakeUtil = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "screen-shake", "screen-shake-util").ScreenShakeUtil;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local JuggernautUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "juggernaut-balance-file").JuggernautUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 29, Name: __tostring
        return "JuggSpinAbilityController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 35
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 39
    -- upvalues: KnitController (copy), u2 (copy)
    KnitController.constructor(p7);
    p7.Name = "JuggSpinAbilityController";
    p7.maid = u2.new();
end;

function u5.KnitStart(u8) -- Line: 44
    -- upvalues: default (copy), Players (copy), ScreenShakeUtil (copy), SoundManager (copy), GameSound (copy), GameAnimationUtil (copy), AnimationType (copy), ClientSyncEvents (copy), AbilityId (copy), InventoryUtil (copy), ItemType (copy)
    default.Client:Get("JuggBarbSpinHit"):Connect(function(p9) -- Line: 45
        -- upvalues: Players (ref), ScreenShakeUtil (ref), SoundManager (ref), GameSound (ref), GameAnimationUtil (ref), AnimationType (ref)
        local v10 = p9 == Players.LocalPlayer;

        if v10 then
            ScreenShakeUtil.shakeScreenDirection(Vector2.new(0, 1), {
                magnitude = 0.15,
                duration = 0.12,
                cycles = 1
            });
        end;

        local Character = p9.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;

            if Character ~= nil then
                Character = Character.Position;
            end;
        end;

        if v10 or Character then
            local JUGGERNAUT_ATTACK_IMPACT_1 = GameSound.JUGGERNAUT_ATTACK_IMPACT_1;
            local v11 = {
                volumeMultiplier = 0.7,
                rollOffMaxDistance = 240,
                rollOffMinDistance = 38
            };

            if v10 then
                Character = nil;
            end;

            v11.position = Character;
            SoundManager:playSound(JUGGERNAUT_ATTACK_IMPACT_1, v11);
        end;

        local u12 = GameAnimationUtil:getAssetId(AnimationType.JUGGERNAUT_SPIN);
        local Character2 = p9.Character;

        if Character2 ~= nil then
            Character2 = Character2:FindFirstChild("Humanoid");

            if Character2 ~= nil then
                Character2 = Character2:FindFirstChild("Animator");
            end;
        end;

        if Character2 then
            local function _(p13) -- Line: 81
                -- upvalues: u12 (copy)
                local Animation = p13.Animation;

                if Animation ~= nil then
                    Animation = Animation.AnimationId;
                end;

                return Animation == u12;
            end;

            local u14 = nil;

            for i, v in Character2:GetPlayingAnimationTracks() do
                local _ = i - 1;
                local Animation = v.Animation;

                if Animation ~= nil then
                    Animation = Animation.AnimationId;
                end;

                if Animation == u12 == true then
                    u14 = v;
                    break;
                end;
            end;

            if u14 ~= nil then
                u14:AdjustSpeed(0.02);
            end;

            task.delay(0.04, function() -- Line: 102
                -- upvalues: u14 (copy)
                local v15 = u14;

                if v15 ~= nil then
                    v15:AdjustSpeed(1);
                end;
            end);
        end;
    end);
    default.Client:Get("NewJuggernaut"):Connect(function(p16) -- Line: 110
        -- upvalues: Players (ref), u8 (copy)
        if p16.player == Players.LocalPlayer then
            u8:mountAbility();

            return;
        end;

        local v17 = Players.LocalPlayer:GetAttribute("Juggernaut");

        if v17 == 0 or (v17 ~= v17 or (v17 == "" or not v17)) then
            u8:unmountAbility();
        end;
    end);
    default.Client:Get("EntityDeathEvent"):Connect(function(p18) -- Line: 120
        -- upvalues: Players (ref), u8 (copy)
        if Players:GetPlayerFromCharacter(p18.entityInstance) == Players.LocalPlayer then
            u8:unmountAbility();
        end;
    end);
    ClientSyncEvents.CanUseLocalAbility:connect(function(p19) -- Line: 126
        -- upvalues: AbilityId (ref), InventoryUtil (ref), Players (ref), ItemType (ref)
        if p19.ability ~= AbilityId.JUGGERNAUT_SPIN then
            return nil;
        end;

        local hand = InventoryUtil.getInventory(Players.LocalPlayer).hand;

        if hand ~= nil then
            hand = hand.itemType;
        end;

        if hand ~= ItemType.JUGGERNAUT_RAGE_BLADE then
            p19:setCancelled(true);
        end;
    end);
    default.Client:Get("JuggernautSpinEvent"):Connect(function(p20) -- Line: 138
        -- upvalues: u8 (copy)
        u8:playAnimation(p20.player);
        u8:playSpinEffect(p20.player);
    end);
end;

function u5.mountAbility(p21) -- Line: 143
    -- upvalues: Flamework (copy), AbilityId (copy), BedwarsImageId (copy)
    local u22 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.JUGGERNAUT_SPIN, {
        abilityType = "MiscSecondary",
        abilityButton = {
            icon = BedwarsImageId.JUGG_BARB_SPIN
        }
    }):expect();
    p21.maid:GiveTask(function() -- Line: 150
        -- upvalues: u22 (copy)
        u22.Destroy();
    end);
end;

function u5.unmountAbility(p23) -- Line: 154
    p23.maid:DoCleaning();
end;

function u5.playAnimation(p24, p25) -- Line: 157
    -- upvalues: Players (copy), KnitClient2 (copy), AnimationType (copy), GameAnimationUtil (copy), JuggernautUtil (copy)
    local Character = p25.Character;

    if Character ~= nil then
        Character = Character:WaitForChild("Humanoid", 3);

        if Character ~= nil then
            Character = Character:WaitForChild("Animator", 3);
        end;
    end;

    if not Character then
        return nil;
    end;

    local u26;

    if p25 == Players.LocalPlayer then
        u26 = KnitClient2.Controllers.ViewmodelController:playAnimation(AnimationType.JUGGERNAUT_SPIN_FP, {
            looped = true
        });
    else
        u26 = nil;
    end;

    local u27 = Character:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.JUGGERNAUT_SPIN));
    u27:Play();
    task.delay(JuggernautUtil.SPIN_DURATION, function() -- Line: 177
        -- upvalues: u27 (copy), u26 (ref)
        u27:Stop();
        u27:Destroy();

        if u26 then
            u26:Stop();
            u26:Destroy();
        end;
    end);
end;

function u5.playSpinEffect(p28, u29) -- Line: 186
    -- upvalues: ReplicatedStorage (copy), u3 (copy), GameSound (copy), default (copy), JuggernautUtil (copy)
    local u30 = ReplicatedStorage.Assets.Effects.JuggernautSpin:Clone();
    local Character = u29.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    u30.Position = Character.CFrame.Position;
    u30.Parent = u29.Character;
    local v31 = {
        Part0 = u30
    };
    local Character2 = u29.Character;

    if Character2 ~= nil then
        Character2 = Character2.PrimaryPart;
    end;

    v31.Part1 = Character2;
    v31.Parent = u30;
    u3("WeldConstraint", v31);
    local u32 = u3("Sound", {
        RollOffMinDistance = 20,
        RollOffMaxDistance = 40,
        Volume = 0.7,
        Playing = true,
        PlaybackSpeed = 1,
        SoundId = GameSound.JUGGERNAUT_SPIN,
        Parent = Character
    });
    local u33 = u3("Sound", {
        RollOffMinDistance = 20,
        RollOffMaxDistance = 40,
        Volume = 0.7,
        Playing = false,
        PlaybackSpeed = 1,
        Looped = true,
        SoundId = GameSound.JUGGERNAUT_SPIN_LOOP,
        Parent = Character
    });
    task.delay(0.75, function() -- Line: 229
        -- upvalues: u33 (copy)
        u33.Playing = true;
        u33:Play();
    end);
    local Character3 = u29.Character;

    if Character3 ~= nil then
        Character3 = Character3.Destroying:Connect(function() -- Line: 235
            -- upvalues: u30 (copy), u33 (copy)
            u30:Destroy();
            u33:Destroy();
        end);
    end;

    local u36 = default.Client:Get("JuggernautSpinEnding"):Connect(function(p34) -- Line: 241
        -- upvalues: u29 (copy), u30 (copy), Character3 (copy), u33 (copy), u32 (copy)
        if p34.player == u29 then
            u30:Destroy();
            local v35 = Character3;

            if v35 ~= nil then
                v35:Disconnect();
            end;

            u33:Destroy();
            u32:Destroy();
        end;
    end);
    task.delay(JuggernautUtil.SPIN_DURATION, function() -- Line: 252
        -- upvalues: u36 (copy), u30 (copy), Character3 (copy), u33 (copy), u32 (copy)
        u36:Disconnect();
        u30:Destroy();
        local v37 = Character3;

        if v37 ~= nil then
            v37:Disconnect();
        end;

        u33:Destroy();
        u32:Destroy();
    end);
end;

KnitClient.CreateController(u5.new());

return nil;