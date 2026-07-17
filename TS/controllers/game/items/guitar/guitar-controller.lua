-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local CollectionTagAdded = v1.CollectionTagAdded;
local GameQueryUtil = v1.GameQueryUtil;
local MobileTouchType = v1.MobileTouchType;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Debris = v4.Debris;
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local MelodyKitBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "melody", "melody-kit-balance").MelodyKitBalance;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 38, Name: __tostring
        return "GuitarController";
    end,

    __index = HandKnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 44
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 48
    -- upvalues: HandKnitController (copy), u2 (copy)
    HandKnitController.constructor(p7);
    p7.Name = "GuitarController";
    p7.maid = u2.new();
    p7.playingMaid = u2.new();
    p7.lastClickTime = -1;
    p7.playing = false;
    p7.lastHealTime = -1;
end;

function u5.KnitStart(u8) -- Line: 57
    -- upvalues: HandKnitController (copy), default (copy), ItemType (copy), Players (copy), GameAnimationUtil (copy), AnimationType (copy), GameSound (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), SoundManager (copy), u3 (copy), Workspace (copy), GameQueryUtil (copy), ReplicatedStorage (copy), u2 (copy), RuntimeLib (copy), RunService (copy), TweenService (copy), Debris (copy), ClientSyncEvents (copy), AbilityId (copy), MelodyKitBalance (copy), CollectionTagAdded (copy), CollectionService (copy)
    HandKnitController.KnitStart(u8);
    default.Client:WaitFor("GuitarHeal"):andThen(function(p9) -- Line: 60
        -- upvalues: ItemType (ref), Players (ref), GameAnimationUtil (ref), AnimationType (ref), GameSound (ref), KnitClient (ref), BedwarsKitSkinMeta (ref), SoundManager (ref), u3 (ref), Workspace (ref), GameQueryUtil (ref), ReplicatedStorage (ref), u2 (ref), RuntimeLib (ref), u8 (copy), RunService (ref), TweenService (ref), Debris (ref)
        p9:Connect(function(p10) -- Line: 61
            -- upvalues: ItemType (ref), Players (ref), GameAnimationUtil (ref), AnimationType (ref), GameSound (ref), KnitClient (ref), BedwarsKitSkinMeta (ref), SoundManager (ref), u3 (ref), Workspace (ref), GameQueryUtil (ref), ReplicatedStorage (ref), u2 (ref), RuntimeLib (ref), u8 (ref), RunService (ref), TweenService (ref), Debris (ref)
            local PrimaryPart = p10.targetEntity.PrimaryPart;

            if PrimaryPart ~= nil then
                PrimaryPart = PrimaryPart:FindFirstChild("RootRigAttachment");
            end;

            local u11 = p10.sourceEntity:FindFirstChild(ItemType.GUITAR);

            if u11 ~= nil then
                u11 = u11:FindFirstChild("Handle");

                if u11 ~= nil then
                    u11 = u11:FindFirstChild("HealBeamAttachment");
                end;
            end;

            if PrimaryPart and u11 then
                local v12 = p10.sourceEntity == Players.LocalPlayer.Character;

                if v12 then
                    GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.GUITAR_HEAL);
                end;

                local GUITAR_HEAL_1 = GameSound.GUITAR_HEAL_1;
                local v13 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(p10.sourceEntity)];

                if v13.melody then
                    GUITAR_HEAL_1 = v13.melody.guitarHealSound;
                end;

                local v14 = {};
                local v15;

                if v12 then
                    v15 = nil;
                else
                    v15 = p10.sourceEntity:GetPrimaryPartCFrame().Position;
                end;

                v14.position = v15;
                v14.volumeMultiplier = v12 and 1 or 1.4;
                SoundManager:playSound(GUITAR_HEAL_1, v14);
                local u16 = u3("Part", {
                    Size = Vector3.new(1, 1, 1),
                    Transparency = 1,
                    Anchored = true,
                    CanCollide = false,
                    CFrame = p10.sourceEntity:GetPrimaryPartCFrame(),
                    Parent = Workspace.CurrentCamera
                });
                GameQueryUtil:setQueryIgnored(u16, true);
                local u17 = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("GuitarHeal"):Clone();
                local melody = v13.melody;

                if melody ~= nil then
                    melody = melody.particleColor;
                end;

                if melody then
                    u17.Color = v13.melody.particleColor;
                end;

                u17.Parent = u16;
                local u18 = u2.new();
                u18:GiveTask(function() -- Line: 113
                    -- upvalues: u17 (copy), RuntimeLib (ref), u8 (ref), u16 (copy)
                    u17.Enabled = false;
                    RuntimeLib.Promise.delay(u8:getVisualPlayingTime()):andThen(function() -- Line: 116
                        -- upvalues: u16 (ref)
                        u16:Destroy();
                    end);
                end);
                local u19 = tick();
                u18:GiveTask(RunService.Heartbeat:Connect(function(p20) -- Line: 123
                    -- upvalues: u19 (copy), u11 (copy), PrimaryPart (copy), u16 (copy), u18 (copy)
                    local v21 = (tick() - u19) / 0.8;
                    local v22 = math.min(1, v21);
                    u16.CFrame = u11.WorldCFrame:Lerp(PrimaryPart.WorldCFrame, v22);

                    if v22 == 1 then
                        u18:DoCleaning();
                    end;
                end));
                local u23 = u3("Beam", {
                    TextureSpeed = 10,
                    Width0 = 0,
                    Width1 = 0,
                    FaceCamera = true,
                    Attachment0 = u11,
                    Attachment1 = PrimaryPart,
                    Color = u17.Color,
                    Parent = Workspace.CurrentCamera
                });
                TweenService:Create(u23, TweenInfo.new(0.2), {
                    Width0 = 0.35,
                    Width1 = 0.35
                }):Play();
                RuntimeLib.Promise.defer(function() -- Line: 146
                    -- upvalues: TweenService (ref), u23 (copy), Debris (ref)
                    task.wait(0.2);
                    TweenService:Create(u23, TweenInfo.new(0.4), {
                        Width0 = 0,
                        Width1 = 0
                    }):Play();
                    Debris:AddItem(u23, 1);
                end);
            end;
        end);
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p24) -- Line: 158
        -- upvalues: Players (ref), AbilityId (ref), u8 (copy), RuntimeLib (ref), MelodyKitBalance (ref), ClientSyncEvents (ref)
        if p24.userCharacter ~= Players.LocalPlayer.Character then
            return nil;
        end;

        if p24.ability ~= AbilityId.MELODY_HEAL then
            return nil;
        end;

        if not u8.playing then
            u8:startPlaying();
        end;

        local u25 = tick();
        u8.lastClickTime = u25;
        local u26 = RuntimeLib.Promise.delay(u8:getVisualPlayingTime()):andThen(function() -- Line: 171
            -- upvalues: u8 (ref), u25 (copy)
            if u8.lastClickTime == u25 then
                u8:stopPlaying();
            end;
        end);
        u8.playingMaid:GiveTask(function() -- Line: 177
            -- upvalues: u26 (copy)
            u26:cancel();
        end);

        if ClientSyncEvents.ItemCooldownModifierCheck:fire(MelodyKitBalance.HEAL_COOLDOWN).cooldown < tick() - u8.lastHealTime then
            u8:performHeal();
        end;
    end);
    CollectionTagAdded("GuitarPlaying", function(u27) -- Line: 186
        -- upvalues: u2 (ref), Players (ref), GameSound (ref), KnitClient (ref), BedwarsKitSkinMeta (ref), SoundManager (ref), TweenService (ref), RuntimeLib (ref), CollectionService (ref)
        local u28 = u2.new();
        local v29 = u27 == Players.LocalPlayer.Character;
        local GUITAR_LOOP = GameSound.GUITAR_LOOP;
        local v30 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(u27)];

        if v30.melody then
            GUITAR_LOOP = v30.melody.guitarLoopSound;
        end;

        local v31 = {};
        local v32;

        if v29 then
            v32 = nil;
        else
            v32 = u27:GetPrimaryPartCFrame().Position;
        end;

        v31.position = v32;
        local v33;

        if v29 then
            v33 = nil;
        else
            v33 = u27.PrimaryPart;
        end;

        v31.parent = v33;
        v31.volumeMultiplier = v29 and 1 or 1.4;
        local u34 = SoundManager:playModifiableSound(GUITAR_LOOP, v31);

        if u34 then
            u34.TimePosition = tick() % u34.TimeLength;
            u34.Looped = true;
            u28:GiveTask(function() -- Line: 204
                -- upvalues: TweenService (ref), u34 (copy), RuntimeLib (ref)
                TweenService:Create(u34, TweenInfo.new(0.4), {
                    Volume = 0
                }):Play();
                RuntimeLib.Promise.delay(0.4):andThen(function() -- Line: 209
                    -- upvalues: u34 (ref)
                    u34:Stop();
                end);
            end);
        end;

        u28:GiveTask(CollectionService:GetInstanceRemovedSignal("GuitarPlaying"):Connect(function(p35) -- Line: 215
            -- upvalues: u27 (copy), u28 (copy)
            if p35 == u27 then
                u28:DoCleaning();
            end;
        end));
    end);
end;

function u5.isRelevantItem(p36, p37) -- Line: 222
    -- upvalues: ItemType (copy)
    return p37.itemType == ItemType.GUITAR;
end;

function u5.onEnable(p38, p39) -- Line: 225
    -- upvalues: Flamework (copy), AbilityId (copy), MobileTouchType (copy), AbilityMeta (copy)
    local v43 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "guitar-click",

        boundFunction = function(p40, p41, p42) -- Line: 230, Name: boundFunction
            -- upvalues: Flamework (ref), AbilityId (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.MELODY_HEAL);
        end,

        mobile = {
            touchType = MobileTouchType.TouchTap,

            mobileBoundFunction = function() -- Line: 235, Name: mobileBoundFunction
                -- upvalues: Flamework (ref), AbilityId (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.MELODY_HEAL);
            end
        }
    });
    p38.maid:GiveTask(v43);
    p38.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.MELODY_HEAL, AbilityMeta[AbilityId.MELODY_HEAL].triggerConfig):expect());
end;

function u5.onDisable(p44) -- Line: 262
    p44:stopPlaying();
    p44.maid:DoCleaning();
end;

function u5.startPlaying(p45) -- Line: 266
    -- upvalues: GameAnimationUtil (copy), Players (copy), AnimationType (copy)
    p45.playing = true;
    local u46 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.GUITAR_PLAY, {
        looped = true
    });

    if u46 then
        p45.playingMaid:GiveTask(function() -- Line: 272
            -- upvalues: u46 (copy)
            u46:Stop();
        end);
    end;
end;

function u5.stopPlaying(p47) -- Line: 277
    -- upvalues: default (copy)
    p47.playing = false;
    p47.playingMaid:DoCleaning();
    task.spawn(function() -- Line: 280
        -- upvalues: default (ref)
        default.Client:Get("StopPlayingGuitar"):SendToServer();
    end);
end;

function u5.performHeal(p48) -- Line: 284
    -- upvalues: Players (copy), EntityUtil (copy), MelodyKitBalance (copy), RuntimeLib (copy), PlayerEntity (copy), default (copy)
    p48.lastHealTime = tick();
    local v49 = nil;

    if Players.LocalPlayer.Character then
        local Position = Players.LocalPlayer.Character:GetPrimaryPartCFrame().Position;
        EntityUtil:getAliveEntityInstances();

        local function _(p50) -- Line: 291
            -- upvalues: Players (ref)
            return p50 ~= Players.LocalPlayer.Character;
        end;

        local v51 = 0;
        local v52 = {};

        for i, v in EntityUtil:getAliveEntityInstances() do
            local _ = i - 1;

            if v ~= Players.LocalPlayer.Character == true then
                v51 = v51 + 1;
                v52[v51] = v;
            end;
        end;

        local function _(p53) -- Line: 304
            -- upvalues: EntityUtil (ref)
            return EntityUtil:getEntity(p53);
        end;

        local v54 = 0;
        local v55 = {};

        for i, v in v52 do
            local _ = i - 1;
            local v56 = EntityUtil:getEntity(v);

            if v56 ~= nil then
                v54 = v54 + 1;
                v55[v54] = v56;
            end;
        end;

        local function _(p57) -- Line: 318
            -- upvalues: Position (copy), MelodyKitBalance (ref)
            local v58 = p57:getInstance().PrimaryPart and (p57:getInstance():GetPrimaryPartCFrame().Position - Position).Magnitude <= MelodyKitBalance.HEAL_TARGET_RANGE;

            return v58;
        end;

        local v59 = 0;
        local v60 = {};

        for i, v in v55 do
            local _ = i - 1;
            local v61 = v:getInstance().PrimaryPart and (v:getInstance():GetPrimaryPartCFrame().Position - Position).Magnitude <= MelodyKitBalance.HEAL_TARGET_RANGE;

            if v61 == true then
                v59 = v59 + 1;
                v60[v59] = v;
            end;
        end;

        local function _(p62) -- Line: 331
            -- upvalues: RuntimeLib (ref), PlayerEntity (ref), Players (ref)
            local v63 = RuntimeLib.instanceof(p62, PlayerEntity) and p62:getPlayer().Team == Players.LocalPlayer.Team;

            return v63;
        end;

        local v64 = 0;
        local v65 = {};

        for i, v in v60 do
            local _ = i - 1;
            local v66 = RuntimeLib.instanceof(v, PlayerEntity) and v:getPlayer().Team == Players.LocalPlayer.Team;

            if v66 == true then
                v64 = v64 + 1;
                v65[v64] = v;
            end;
        end;

        local function _(p67) -- Line: 344
            return p67:isAlive();
        end;

        local v68 = 0;
        local v69 = {};

        for i, v in v65 do
            local _ = i - 1;

            if v:isAlive() == true then
                v68 = v68 + 1;
                v69[v68] = v;
            end;
        end;

        table.sort(v69, function(p70, p71) -- Line: 357
            return p70:getHealth() < p71:getHealth();
        end);

        if #v69 > 0 then
            v49 = v69[1]:getInstance();
        end;
    end;

    default.Client:Get("PlayGuitar"):SendToServer({
        healTarget = v49
    });
end;

function u5.getCooldown(p72) -- Line: 370
    -- upvalues: MelodyKitBalance (copy), ClientSyncEvents (copy)
    return ClientSyncEvents.ItemCooldownModifierCheck:fire(MelodyKitBalance.HEAL_COOLDOWN).cooldown;
end;

function u5.getVisualPlayingTime(p73) -- Line: 375
    -- upvalues: MelodyKitBalance (copy)
    return p73:getCooldown() + MelodyKitBalance.VISUAL_PLAYING_ADDED_TIME;
end;

KnitClient.CreateController(u5.new());

return nil;