-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Debris = v4.Debris;
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local HalloweenKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-2025-kits").HalloweenKit;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local _ = { AbilityId.SUPER_MELODY_AURA, AbilityId.SUPER_MELODY_ULT, AbilityId.SUPER_MELODY_HEAL };
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 34, Name: __tostring
        return "HalloweenMelodyController";
    end,

    __index = GameKnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 40
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 44
    -- upvalues: GameKnitController (copy), GameType (copy), u2 (copy)
    GameKnitController.constructor(p7, { GameType.HALLOWEEN_2025_EVENT_PVE });
    p7.Name = "HalloweenMelodyController";
    p7.maid = u2.new();
    p7.inited = false;
end;

function u5.KnitStart(p8) -- Line: 50
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p8);
end;

function u5.onGameInit(u9) -- Line: 53
    -- upvalues: default (copy), ItemType (copy), GameSound (copy), Players (copy), SoundManager (copy), AbilityId (copy), HalloweenKit (copy)
    default.Client:Get("SpecialWeaponHit"):Connect(function(p10) -- Line: 54
        -- upvalues: ItemType (ref), u9 (copy), GameSound (ref), Players (ref), SoundManager (ref)
        if p10.item == ItemType.SUPER_GUITAR and p10.target then
            u9:attackEffect(p10.attacker, p10.target);
            local GUITAR_HEAL_1_ROCKSTAR = GameSound.GUITAR_HEAL_1_ROCKSTAR;
            local v11 = p10.attacker == Players.LocalPlayer;
            local v12 = {};
            local v13;

            if v11 then
                v13 = nil;
            else
                v13 = p10.attacker.Character;

                if v13 ~= nil then
                    v13 = v13.PrimaryPart;

                    if v13 ~= nil then
                        v13 = v13.Position;
                    end;
                end;
            end;

            v12.position = v13;
            v12.volumeMultiplier = v11 and 1 or 1.4;
            SoundManager:playSound(GUITAR_HEAL_1_ROCKSTAR, v12);
        end;
    end);
    default.Client:Get("SuperMelodyAbility"):Connect(function(p14) -- Line: 83
        -- upvalues: AbilityId (ref), u9 (copy)
        if p14.abilityType ~= AbilityId.SUPER_MELODY_ULT then
            if p14.abilityType == AbilityId.SUPER_MELODY_HEAL then
                u9:healEffect(p14.user, p14.targets);

                return;
            end;

            if p14.abilityType == AbilityId.SUPER_MELODY_AURA then
                u9:auraEffect(p14.user);
            end;

            return;
        end;

        local duration = p14.duration;
        u9:ultEffect(p14.user, p14.targets, duration == nil and 3 or duration);
    end);
    default.Client:Get("HalloweenSetKit"):Connect(function(p15) -- Line: 99
        -- upvalues: u9 (copy), HalloweenKit (ref)
        if not u9.inited then
            if p15.kit == HalloweenKit.MELODY then
                u9:mountAbilities();
            end;

            u9.inited = true;
        end;
    end);
end;

function u5.attackEffect(p16, p17, p18) -- Line: 108
    -- upvalues: u3 (copy), ItemType (copy), Players (copy), GameAnimationUtil (copy), AnimationType (copy), Workspace (copy), GameQueryUtil (copy), ReplicatedStorage (copy), u2 (copy), RuntimeLib (copy), RunService (copy), TweenService (copy), Debris (copy)
    local v19 = not p18;

    if not v19 then
        local v20;

        if p18 == nil then
            v20 = p18;
        else
            v20 = p18.PrimaryPart;
        end;

        v19 = not v20;
    end;

    if v19 then
        return nil;
    end;

    local PrimaryPart = p18.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart:FindFirstChild("RootRigAttachment");
    end;

    if PrimaryPart == nil then
        PrimaryPart = u3("Attachment", {
            Parent = p18.PrimaryPart
        });
    end;

    local Character = p17.Character;

    if Character ~= nil then
        Character = Character:FindFirstChild(ItemType.SUPER_GUITAR);

        if Character ~= nil then
            Character = Character:FindFirstChild("Handle");

            if Character ~= nil then
                Character = Character:FindFirstChild("HealBeamAttachment");
            end;
        end;
    end;

    if PrimaryPart and Character then
        if p17 == Players.LocalPlayer then
            GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.GUITAR_HEAL);
        end;

        local v21 = {
            Size = Vector3.new(1, 1, 1)
        };
        local Character2 = p17.Character;

        if Character2 ~= nil then
            Character2 = Character2.PrimaryPart;

            if Character2 ~= nil then
                Character2 = Character2.CFrame;
            end;
        end;

        v21.CFrame = Character2;
        v21.Transparency = 1;
        v21.Anchored = true;
        v21.CanCollide = false;
        v21.Parent = Workspace.CurrentCamera;
        local u22 = u3("Part", v21);
        GameQueryUtil:setQueryIgnored(u22, true);
        local u23 = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("GuitarHeal"):Clone();
        u23.Parent = u22;
        local u24 = u2.new();
        u24:GiveTask(function() -- Line: 170
            -- upvalues: u23 (copy), RuntimeLib (ref), u22 (copy)
            u23.Enabled = false;
            RuntimeLib.Promise.delay(3):andThen(function() -- Line: 173
                -- upvalues: u22 (ref)
                u22:Destroy();
            end);
        end);
        local u25 = tick();
        u24:GiveTask(RunService.RenderStepped:Connect(function(p26) -- Line: 180
            -- upvalues: u25 (copy), Character (copy), PrimaryPart (copy), u22 (copy), u24 (copy)
            local v27 = (tick() - u25) / 0.8;
            local v28 = math.min(1, v27);
            u22.CFrame = Character.WorldCFrame:Lerp(PrimaryPart.WorldCFrame, v28);

            if v28 == 1 then
                u24:DoCleaning();
            end;
        end));
        local u29 = u3("Beam", {
            TextureSpeed = 10,
            Width0 = 0,
            Width1 = 0,
            FaceCamera = true,
            Attachment0 = Character,
            Attachment1 = PrimaryPart,
            Color = u23.Color,
            Parent = Workspace.CurrentCamera
        });
        TweenService:Create(u29, TweenInfo.new(0.2), {
            Width0 = 0.35,
            Width1 = 0.35
        }):Play();
        RuntimeLib.Promise.defer(function() -- Line: 203
            -- upvalues: TweenService (ref), u29 (copy), Debris (ref)
            wait(0.2);
            TweenService:Create(u29, TweenInfo.new(0.4), {
                Width0 = 0,
                Width1 = 0
            }):Play();
            Debris:AddItem(u29, 1);
        end);
    end;
end;

function u5.healEffect(p30, p31, p32) -- Line: 213
    -- upvalues: SoundManager (copy), GameSound (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    local Character = p31.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return nil;
    end;

    SoundManager:playSound(GameSound.GUITAR_HEAL_1, {
        volumeMultiplier = 1.4,
        position = Character
    });

    for _, v in p32 do
        p30:attackEffect(p31, v);
    end;

    AnimationUtil:playAnimation(p31, GameAnimationUtil:getAssetId(AnimationType.GUITAR_HEAL));
end;

function u5.auraEffect(p33, p34, p35) -- Line: 234
    -- upvalues: SoundManager (copy), GameSound (copy), GameAnimationUtil (copy), AnimationType (copy), TweenService (copy), Players (copy)
    local v36 = p35 == nil and 5 or p35;
    local Character = p34.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return nil;
    end;

    local u37 = SoundManager:playModifiableSound(GameSound.GUITAR_LOOP, {
        volumeMultiplier = 2,
        position = Character,
        parent = p34.Character.PrimaryPart
    });
    local u38 = GameAnimationUtil:playAnimation(p34, AnimationType.GUITAR_PLAY);

    if u37 then
        u37.TimePosition = 0;
        u37.Looped = true;
        TweenService:Create(u37, TweenInfo.new(2), {
            Volume = 1
        }):Play();
        task.delay(v36, function() -- Line: 261
            -- upvalues: u37 (copy)
            u37:Stop();
            u37:Destroy();
        end);
    end;

    task.delay(v36, function() -- Line: 266
        -- upvalues: u38 (copy)
        local v39 = u38;

        if v39 ~= nil then
            v39:Stop();
        end;

        local v40 = u38;

        if v40 ~= nil then
            v40:Destroy();
        end;
    end);
    p33:mountAuraEffect(p34, v36, false);

    if p34 == Players.LocalPlayer then
        p33:setOnCommonCD(v36);
    end;
end;

function u5.mountAbilities(p41) -- Line: 281
    -- upvalues: Flamework (copy), AbilityId (copy), BedwarsImageId (copy)
    local u42 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.SUPER_MELODY_HEAL, {
        abilityType = "KitPrimary",
        abilityButton = {
            icon = "rbxassetid://7085044606"
        }
    }):expect();
    local u43 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.SUPER_MELODY_AURA, {
        abilityType = "KitSecondary",
        abilityButton = {
            icon = BedwarsImageId.MUSIC_SOLID
        }
    }):expect();
    local u44 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.SUPER_MELODY_ULT, {
        abilityType = "KitTertiary",
        abilityButton = {
            icon = "rbxassetid://137863481960527"
        }
    }):expect();
    p41.maid:GiveTask(function() -- Line: 300
        -- upvalues: u42 (copy), u43 (copy), u44 (copy)
        u42.Destroy();
        u43.Destroy();
        u44.Destroy();
    end);
end;

function u5.cleanUp(p45) -- Line: 306
    p45.maid:DoCleaning();
end;

function u5.ultEffect(p46, p47, p48, p49) -- Line: 309
    -- upvalues: SoundManager (copy), GameSound (copy), u2 (copy), GameAnimationUtil (copy), AnimationType (copy), TweenService (copy)
    local u50 = p49 == nil and 3 or p49;
    local Character = p47.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return nil;
    end;

    local u51 = SoundManager:playModifiableSound(GameSound.GUITAR_LOOP_ROCKSTAR, {
        volumeMultiplier = 2,
        position = Character,
        parent = p47.Character.PrimaryPart
    });
    u2.new();
    local u52 = GameAnimationUtil:playAnimation(p47, AnimationType.GUITAR_PLAY);

    if u51 then
        u51.TimePosition = 0;
        u51.Looped = true;
        TweenService:Create(u51, TweenInfo.new(2), {
            Volume = 1
        }):Play();
        task.delay(u50, function() -- Line: 337
            -- upvalues: u51 (copy)
            u51:Stop();
            u51:Destroy();
        end);
    end;

    task.delay(u50, function() -- Line: 342
        -- upvalues: u52 (copy)
        local v53 = u52;

        if v53 ~= nil then
            v53:Stop();
        end;

        local v54 = u52;

        if v54 ~= nil then
            v54:Destroy();
        end;
    end);

    local function _(p55) -- Line: 353
        -- upvalues: GameAnimationUtil (ref), AnimationType (ref), u50 (ref)
        local u56 = GameAnimationUtil:playAnimation(p55, AnimationType.DISCO_DANCE);
        task.delay(u50, function() -- Line: 355
            -- upvalues: u56 (copy)
            local v57 = u56;

            if v57 ~= nil then
                v57:Stop();
            end;

            local v58 = u56;

            if v58 ~= nil then
                v58:Destroy();
            end;
        end);
    end;

    for i, v in p48 do
        local _ = i - 1;
        local u59 = GameAnimationUtil:playAnimation(v, AnimationType.DISCO_DANCE);
        task.delay(u50, function() -- Line: 355
            -- upvalues: u59 (copy)
            local v60 = u59;

            if v60 ~= nil then
                v60:Stop();
            end;

            local v61 = u59;

            if v61 ~= nil then
                v61:Destroy();
            end;
        end);
    end;

    p46:setOnCommonCD(u50);
    p46:mountAuraEffect(p47, u50, true);
end;

function u5.setOnCommonCD(p62, p63) -- Line: 372
    -- upvalues: Flamework (copy), CooldownId (copy)
    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(CooldownId.SUPER_MELODY_AURA) < p63 then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.SUPER_MELODY_AURA, p63);
    end;

    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(CooldownId.SUPER_MELODY_ULT) < p63 then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.SUPER_MELODY_ULT, p63);
    end;

    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(CooldownId.SUPER_MELODY_HEAL) < p63 then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.SUPER_MELODY_HEAL, p63);
    end;
end;

function u5.mountAuraEffect(p64, u65, p66, p67) -- Line: 383
    -- upvalues: ReplicatedStorage (copy), u2 (copy), Workspace (copy), RunService (copy)
    local u68 = p66 == nil and 5 or p66;
    local Character = u65.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.CFrame;
        end;
    end;

    local u69 = Character;

    if not u69 then
        return nil;
    end;

    local u70;

    if p67 then
        u70 = ReplicatedStorage.Assets.Effects.AttackMusicAura:Clone();
    else
        u70 = ReplicatedStorage.Assets.Effects.HealMusicAura:Clone();
    end;

    local u71 = u2.new();
    u70.Parent = Workspace;
    u70:PivotTo(u69 + Vector3.new(0, 2, 0));
    u71:GiveTask(u70);
    local u72 = 0;
    u71:GiveTask(RunService.Heartbeat:Connect(function(p73) -- Line: 418
        -- upvalues: u65 (copy), u69 (ref), u70 (ref), u72 (ref), u68 (ref), u71 (copy)
        local Character2 = u65.Character;

        if Character2 ~= nil then
            Character2 = Character2.PrimaryPart;

            if Character2 ~= nil then
                Character2 = Character2.CFrame;
            end;
        end;

        u69 = Character2;

        if not u69 or (not u70 or u68 < u72) then
            u71:DoCleaning();

            return nil;
        end;

        u72 = u72 + p73;
        u70.Position = u69.Position - Vector3.new(0, 1, 0);
    end));
end;

KnitClient.CreateController(u5.new());

return nil;