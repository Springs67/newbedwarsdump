-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local BlockSelectorMode = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "select", "block-selector").BlockSelectorMode;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AbilityState = v1.AbilityState;
local AnnouncementVariant = v1.AnnouncementVariant;
local DeviceUtil = v1.DeviceUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local WatchComponent = v1.WatchComponent;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local UserInputService = v5.UserInputService;
local Workspace = v5.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local ClientBlockEngine = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "block-engine", "client-block-engine").ClientBlockEngine;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "shop-component");
local default2 = v6.default;
local BedwarsShopType = v6.BedwarsShopType;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local FireworkType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local BlockHuntConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "block-hunt", "block-hunt-config").BlockHuntConfig;
local BlockHuntTeamId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "block-hunt", "block-hunt-team-id").BlockHuntTeamId;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local CircleCountdownAnnouncement = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "components", "circle-countdown-announcement").CircleCountdownAnnouncement;
local MimicBlockFace = RuntimeLib.import(script, script.Parent.Parent, "bedwars", "kit", "kits", "mimic", "ui", "mimic-block-face").MimicBlockFace;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 53, Name: __tostring
        return "BlockHuntHiderController";
    end,

    __index = GameKnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 59
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 63
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p9, { GameType.BLOCK_HUNT });
    p9.Name = "BlockHuntHiderController";
    p9.disguisedPlayerMap = {};
    p9.invisiblePlayers = {};
    p9.hiderList = {};
    p9.isPreloaded = false;
end;

function u7.onGameInit(u10) -- Line: 71
    -- upvalues: Flamework (copy), AnnouncementVariant (copy), CircleCountdownAnnouncement (copy), WatchComponent (copy), default2 (copy), BedwarsShopType (copy), u3 (copy), Workspace (copy), Players (copy), default3 (copy), KnitClient (copy), WatchCharacter (copy), BlockHuntTeamId (copy), GameSound (copy), BedwarsImageId (copy), u2 (copy), AbilityId (copy), AbilityState (copy), ClientSyncEvents (copy), SoundManager (copy), RandomUtil (copy), ReplicatedStorage (copy), default (copy), Linear (copy), FireworkType (copy), EffectUtil (copy), CooldownId (copy), BlockHuntConfig (copy), EntityUtil (copy), ClientStore (copy), MatchState (copy), BlockEngine (copy), getItemMeta (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/announcement/announcement-controller@AnnouncementController"):setDefaultUI(AnnouncementVariant.countdown.type, CircleCountdownAnnouncement);
    WatchComponent(default2, function(p11) -- Line: 74
        -- upvalues: BedwarsShopType (ref), u3 (ref)
        if p11.attributes.ShopType == BedwarsShopType.ITEM_SHOP and p11:waitForShopModel() then
            u3("Highlight", {
                Name = "ShopHighlight",
                OutlineTransparency = 0,
                FillTransparency = 0.75,
                Parent = p11:waitForShopModel(),
                FillColor = Color3.fromRGB(251, 255, 0),
                DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            });
        end;
    end);
    task.spawn(function() -- Line: 89
        -- upvalues: u10 (copy), Workspace (ref), Players (ref), default3 (ref), KnitClient (ref)
        while true do
            local v12 = task.wait(0.25);

            if v12 == 0 or (v12 ~= v12 or not v12) then
                break;
            end;

            for i, v in u10.disguisedPlayerMap do
                local Character = i.Character;

                if Character ~= nil then
                    Character = Character:FindFirstChildWhichIsA("Humanoid");
                end;

                if Character and u10.invisiblePlayers[i.UserId] == nil then
                    if Workspace:GetServerTimeNow() - v.lastMoveTime >= 1 and (Character.MoveDirection.Magnitude == 0 and (Character:GetState() ~= Enum.HumanoidStateType.Freefall and Character:GetState() ~= Enum.HumanoidStateType.Jumping)) then
                        if v.inMovement then
                            v.inMovement = false;

                            if Players.LocalPlayer == i then
                                if u10.lastSnapRequestThread then
                                    task.cancel(u10.lastSnapRequestThread);
                                    u10.lastSnapRequestThread = nil;
                                end;

                                u10.lastSnapRequestThread = task.spawn(function() -- Line: 120
                                    -- upvalues: default3 (ref)
                                    default3.Client:Get("BHHiderSnapToGrid"):SendToServer();
                                end);
                            end;
                        end;
                    elseif not v.inMovement then
                        v.inMovement = true;

                        if Players.LocalPlayer == i then
                            local tauntMaid = u10.tauntMaid;

                            if tauntMaid ~= nil then
                                tauntMaid:Destroy();
                            end;
                        end;

                        KnitClient.Controllers.BlockDisguiseController:disguisePlayerAsBlock(i, v.selectedBlock);
                    end;
                end;
            end;
        end;
    end);
    WatchCharacter(function(u13, p14) -- Line: 141
        -- upvalues: u10 (copy), BlockHuntTeamId (ref), Workspace (ref)
        if u10:waitForPlayerTeam(u13).id ~= BlockHuntTeamId.HIDERS then
            return nil;
        end;

        p14:WaitForChild("Humanoid"):GetPropertyChangedSignal("MoveDirection"):Connect(function() -- Line: 145
            -- upvalues: u10 (ref), u13 (copy), Workspace (ref)
            local v15 = u10.disguisedPlayerMap[u13];

            if v15 then
                v15.lastMoveTime = Workspace:GetServerTimeNow();
            end;
        end);
    end);
    WatchCharacter(function(u16, p17) -- Line: 154
        -- upvalues: Players (ref), u10 (copy), BlockHuntTeamId (ref), KnitClient (ref), GameSound (ref), BedwarsImageId (ref), u2 (ref), Flamework (ref), AbilityId (ref), AbilityState (ref)
        if u16 ~= Players.LocalPlayer then
            return nil;
        end;

        if u10:waitForPlayerTeam(u16).id ~= BlockHuntTeamId.HIDERS then
            return nil;
        end;

        if u10.hiderList[u16.UserId] ~= nil then
            return nil;
        end;

        u10.hiderList[u16.UserId] = true;

        if not u10.isPreloaded then
            KnitClient.Controllers.PreloadController:runPreload({
                sounds = { GameSound.GENERIC_BLOCK_PLACE, GameSound.MIMIC_HIDE, GameSound.ERROR_NOTIFICATION },
                animations = {},
                imageIds = { BedwarsImageId.MIMIC_BLOCK }
            });
            u10.isPreloaded = true;
        end;

        local hiderMaid = u10.hiderMaid;

        if hiderMaid ~= nil then
            hiderMaid:Destroy();
        end;

        local u18 = u2.new();
        u16.CameraMaxZoomDistance = 50;
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.BH_HIDER_DISGUISE_BLOCK, {
            abilityType = "KitPrimary",
            abilityButton = {
                icon = BedwarsImageId.BH_DISGUISE,
                stateColors = {
                    [AbilityState.PROGRESSING] = Color3.fromRGB(120, 133, 140)
                }
            }
        }):andThen(function(p19) -- Line: 193
            -- upvalues: u18 (copy)
            u18:GiveTask(p19);
        end);
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.BH_HIDER_INVISIBLITY, {
            abilityType = "KitSecondary",
            abilityButton = {
                icon = BedwarsImageId.SMOKE,
                stateColors = {
                    [AbilityState.PROGRESSING] = Color3.fromRGB(120, 133, 140)
                }
            }
        }):andThen(function(p20) -- Line: 207
            -- upvalues: u18 (copy)
            u18:GiveTask(p20);
        end);
        u18:GiveTask(function() -- Line: 211
            -- upvalues: u16 (copy)
            u16.CameraMaxZoomDistance = 14;
        end);
        u10.hiderMaid = u18;
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p21) -- Line: 217
        -- upvalues: AbilityId (ref), Players (ref), GameSound (ref), SoundManager (ref), RandomUtil (ref)
        if p21:isCancelled() then
            return nil;
        end;

        if p21.ability ~= AbilityId.BH_HIDER_TAUNT_SOUND then
            return nil;
        end;

        if not Players:GetPlayerFromCharacter(p21.userCharacter) then
            return nil;
        end;

        SoundManager:playSound(RandomUtil.fromList(unpack({ GameSound.VOICE_HONK, GameSound.TOAD_CROAK, GameSound.YETI_ROAR })), {
            rollOffMaxDistance = 100,
            rollOffMinDistance = 40,
            position = p21.userCharacter:GetPivot().Position
        });
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p22) -- Line: 236
        -- upvalues: AbilityId (ref), Players (ref), ReplicatedStorage (ref), Workspace (ref), default (ref), Linear (ref), SoundManager (ref), GameSound (ref), FireworkType (ref), KnitClient (ref), RandomUtil (ref)
        if p22:isCancelled() then
            return nil;
        end;

        if p22.ability ~= AbilityId.BH_HIDER_TAUNT_FIREWORK then
            return nil;
        end;

        local v23 = Players:GetPlayerFromCharacter(p22.userCharacter);

        if not v23 then
            return nil;
        end;

        local v24 = v23 == Players.LocalPlayer;
        local Position = p22.userCharacter:GetPivot().Position;
        local u25 = Position + Vector3.new(0, 48, 0);
        local u26 = ReplicatedStorage.Assets.Effects.NewYearsFireworkRocket:Clone();
        u26.Parent = Workspace;
        u26:PivotTo(CFrame.new(Position));
        default(1, Linear, function(p27) -- Line: 255
            -- upvalues: Position (copy), u25 (copy), u26 (copy)
            local v28 = Position:Lerp(u25, p27);
            u26:PivotTo(CFrame.new(v28));
            u26.Transparency = p27 / 1;
        end):Play();
        local FIREWORK_LAUNCH = GameSound.FIREWORK_LAUNCH;
        local v29 = {};

        if v24 then
            Position = nil;
        end;

        v29.position = Position;
        SoundManager:playSound(FIREWORK_LAUNCH, v29);
        local FIREWORK_TRAIL = GameSound.FIREWORK_TRAIL;
        local v30 = {
            looped = true
        };
        local v31;

        if v24 then
            v31 = nil;
        else
            v31 = u26.CFrame.Position;
        end;

        v30.position = v31;
        local u32 = SoundManager:playSound(FIREWORK_TRAIL, v30);
        task.delay(1, function() -- Line: 268
            -- upvalues: u32 (copy), u26 (copy), FireworkType (ref), KnitClient (ref), u25 (copy), RandomUtil (ref)
            local v33 = u32;

            if v33 ~= nil then
                v33:Destroy();
            end;

            u26:Destroy();
            KnitClient.Controllers.FireworkController:playFireworkEffect(u25, RandomUtil.fromList(unpack({
                FireworkType.HEART,
                FireworkType.NEW_YEARS,
                FireworkType.SPARKS,
                FireworkType.NORMAL
            })), {
                sizeMultiplier = 0.9,
                volumeMultiplier = 0.6,
                popSoundPlaybackSpeedMultiplier = 1
            });
        end);
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p34) -- Line: 283
        -- upvalues: AbilityId (ref), Players (ref), u10 (copy), default3 (ref)
        if p34:isCancelled() then
            return nil;
        end;

        if p34.ability ~= AbilityId.BH_HIDER_DISGUISE_BLOCK then
            return nil;
        end;

        local v35 = Players:GetPlayerFromCharacter(p34.userCharacter);

        if not v35 then
            return nil;
        end;

        if v35 ~= Players.LocalPlayer then
            return nil;
        end;

        if not u10.currentSelectedBlock then
            return nil;
        end;

        default3.Client:Get("BHHiderDisguiseBlock"):SendToServer({
            data = {
                blockType = u10.currentSelectedBlock
            }
        });
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p36) -- Line: 307
        -- upvalues: AbilityId (ref), Players (ref), default3 (ref)
        if p36:isCancelled() then
            return nil;
        end;

        if p36.ability ~= AbilityId.BH_HIDER_INVISIBLITY then
            return nil;
        end;

        local v37 = Players:GetPlayerFromCharacter(p36.userCharacter);

        if not v37 then
            return nil;
        end;

        if v37 ~= Players.LocalPlayer then
            return nil;
        end;

        default3.Client:Get("BHHiderInvisibility"):SendToServer();
    end);
    default3.Client:Get("ValidatedBHHiderInvisibility"):Connect(function(p38) -- Line: 323
        -- upvalues: u10 (copy), KnitClient (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref), Players (ref), Flamework (ref), CooldownId (ref), BlockHuntConfig (ref)
        if p38.invisible then
            u10.invisiblePlayers[p38.player.UserId] = true;
            local v39 = KnitClient.Controllers.BlockDisguiseController:getPlayerBlockModel(p38.player);

            if v39 then
                v39:Destroy();
            end;

            if p38.player.Character then
                local Position = p38.player.Character:GetPivot().Position;
                local v40 = ReplicatedStorage.Assets.Effects.MimicBlockEffect:Clone();
                v40.Parent = Workspace;
                v40.Position = Position;
                EffectUtil:playEffects({ v40 }, nil, {
                    destroyAfterSec = 1
                });
                SoundManager:playSound(GameSound.SMOKE_GRENADE_POP, {
                    position = Position
                });
            end;

            if Players.LocalPlayer == p38.player then
                local invisiblityBarMaid = u10.invisiblityBarMaid;

                if invisiblityBarMaid ~= nil then
                    invisiblityBarMaid:Destroy();
                end;

                u10.invisiblityBarMaid = Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(CooldownId.BH_HIDER_INVISIBLITY_BAR);
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.BH_HIDER_INVISIBLITY_BAR, BlockHuntConfig.HIDER_INVISIBLITY_DURATION, {
                    cooldownBar = {
                        color = Color3.fromRGB(255, 247, 105)
                    }
                });
            end;
        else
            u10.invisiblePlayers[p38.player.UserId] = nil;

            if Players.LocalPlayer == p38.player then
                local invisiblityBarMaid = u10.invisiblityBarMaid;

                if invisiblityBarMaid ~= nil then
                    invisiblityBarMaid:Destroy();
                end;
            end;
        end;
    end);
    ClientSyncEvents.CanUseLocalAbility:connect(function(p41) -- Line: 369
        -- upvalues: AbilityId (ref), EntityUtil (ref), Players (ref), u10 (copy), SoundManager (ref), GameSound (ref)
        if p41.ability ~= AbilityId.BH_HIDER_DISGUISE_BLOCK then
            return nil;
        end;

        local v42 = EntityUtil:getEntity(p41.userCharacter);

        if v42 ~= nil then
            v42 = v42:isAlive();
        end;

        if not v42 then
            p41:setCancelled(true);
        end;

        local v43 = Players:GetPlayerFromCharacter(p41.userCharacter);

        if v43 then
            local v44 = u10.disguisedPlayerMap[v43];
            u10.currentSelectedBlock = u10:getSelectedBlockFromPlayer(v43);
            local v45 = u10.currentSelectedBlock == nil;

            if not v45 then
                if v44 ~= nil then
                    v44 = v44.selectedBlock;
                end;

                v45 = v44 == u10.currentSelectedBlock;
            end;

            if v45 then
                p41:setCancelled(true);
            end;

            if u10.invisiblePlayers[v43.UserId] ~= nil then
                p41:setCancelled(true);
            end;
        end;

        if p41:isCancelled() then
            SoundManager:playSound(GameSound.ERROR_NOTIFICATION, {
                volumeMultiplier = 0.25
            });
        end;
    end);
    ClientSyncEvents.CanUseLocalAbility:connect(function(p46) -- Line: 409
        -- upvalues: AbilityId (ref), EntityUtil (ref), Players (ref), u10 (copy), SoundManager (ref), GameSound (ref)
        if p46.ability ~= AbilityId.BH_HIDER_TAUNT_FIREWORK then
            return nil;
        end;

        local v47 = EntityUtil:getEntity(p46.userCharacter);

        if v47 ~= nil then
            v47 = v47:isAlive();
        end;

        if not v47 then
            p46:setCancelled(true);
        end;

        local v48 = Players:GetPlayerFromCharacter(p46.userCharacter);

        if v48 and u10.invisiblePlayers[v48.UserId] ~= nil then
            p46:setCancelled(true);
        end;

        if p46:isCancelled() then
            SoundManager:playSound(GameSound.ERROR_NOTIFICATION, {
                volumeMultiplier = 0.25
            });
        end;
    end);
    ClientSyncEvents.CanUseLocalAbility:connect(function(p49) -- Line: 436
        -- upvalues: AbilityId (ref), EntityUtil (ref), Players (ref), u10 (copy), SoundManager (ref), GameSound (ref)
        if p49.ability ~= AbilityId.BH_HIDER_TAUNT_SOUND then
            return nil;
        end;

        local v50 = EntityUtil:getEntity(p49.userCharacter);

        if v50 ~= nil then
            v50 = v50:isAlive();
        end;

        if not v50 then
            p49:setCancelled(true);
        end;

        local v51 = Players:GetPlayerFromCharacter(p49.userCharacter);

        if v51 and u10.invisiblePlayers[v51.UserId] ~= nil then
            p49:setCancelled(true);
        end;

        if p49:isCancelled() then
            SoundManager:playSound(GameSound.ERROR_NOTIFICATION, {
                volumeMultiplier = 0.25
            });
        end;
    end);
    ClientSyncEvents.CanUseLocalAbility:connect(function(p52) -- Line: 463
        -- upvalues: AbilityId (ref), EntityUtil (ref), Workspace (ref), ClientStore (ref), BlockHuntConfig (ref), SoundManager (ref), GameSound (ref)
        if p52.ability ~= AbilityId.BH_HIDER_INVISIBLITY then
            return nil;
        end;

        local v53 = EntityUtil:getEntity(p52.userCharacter);

        if v53 ~= nil then
            v53 = v53:isAlive();
        end;

        if not v53 then
            p52:setCancelled(true);
        end;

        if Workspace:GetServerTimeNow() < ClientStore:getState().Game.startTime + BlockHuntConfig.RELEASE_HUNTERS_DELAY then
            p52:setCancelled(true);
        end;

        if p52:isCancelled() then
            SoundManager:playSound(GameSound.ERROR_NOTIFICATION, {
                volumeMultiplier = 0.25
            });
        end;
    end);
    default3.Client:Get("BHSetHunter"):Connect(function(p54) -- Line: 484
        -- upvalues: Players (ref), u10 (copy)
        if p54.player ~= Players.LocalPlayer then
            return nil;
        end;

        local hiderMaid = u10.hiderMaid;

        if hiderMaid ~= nil then
            hiderMaid:Destroy();
        end;

        local tauntMaid = u10.tauntMaid;

        if tauntMaid ~= nil then
            tauntMaid:Destroy();
        end;
    end);
    ClientSyncEvents.MatchStateChange:connect(function(p55) -- Line: 497
        -- upvalues: MatchState (ref), u10 (copy)
        if p55.matchState ~= MatchState.POST then
            return nil;
        end;

        local tauntMaid = u10.tauntMaid;

        if tauntMaid ~= nil then
            tauntMaid:Destroy();
        end;
    end);
    default3.Client:Get("ValidatedBHHiderSnapToGrid"):Connect(function(p56) -- Line: 507
        -- upvalues: KnitClient (ref), Players (ref), SoundManager (ref), GameSound (ref)
        if not KnitClient.Controllers.BlockDisguiseController:anchorBlockModel(p56.player) then
            return nil;
        end;

        if Players.LocalPlayer == p56.player then
            local Character = p56.player.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;

                if Character ~= nil then
                    Character = Character.Position;
                end;
            end;

            if Character then
                SoundManager:playSound(GameSound.GENERIC_BLOCK_PLACE, {
                    playbackSpeedMultiplier = 1.27,
                    position = Character
                });
            end;
        end;
    end);
    default3.Client:Get("BHHiderRegisterTauntAbilities"):Connect(function() -- Line: 529
        -- upvalues: ClientStore (ref), MatchState (ref), u10 (copy), Players (ref)
        if ClientStore:getState().Game.matchState ~= MatchState.RUNNING then
            return nil;
        end;

        local v57 = u10.disguisedPlayerMap[Players.LocalPlayer];

        if not v57 then
            return nil;
        end;

        if v57.inMovement then
            return nil;
        end;

        u10:registerTauntAbilities(Players.LocalPlayer);
    end);
    default3.Client:OnEvent("ValidatedBHHiderDisguiseBlock", function(p58) -- Line: 545
        -- upvalues: KnitClient (ref), u10 (copy), Workspace (ref)
        local player = p58.player;
        local v59 = p58.blockType ~= nil;

        if v59 then
            KnitClient.Controllers.BlockDisguiseController:hidePlayer(player, true);
            KnitClient.Controllers.BlockDisguiseController:disguisePlayerAsBlock(player, p58.blockType);
            u10.disguisedPlayerMap[player] = {
                inMovement = false,
                selectedBlock = p58.blockType,
                lastMoveTime = Workspace:GetServerTimeNow()
            };
        else
            u10.disguisedPlayerMap[player] = nil;
            KnitClient.Controllers.BlockDisguiseController:undisguisePlayer(player);
        end;

        u10:playEffect(player, v59);
    end);
    ClientSyncEvents.MatchStateChange:connect(function(p60) -- Line: 565
        -- upvalues: MatchState (ref), BlockEngine (ref), getItemMeta (ref), RandomUtil (ref), Players (ref), default3 (ref)
        if p60.matchState == MatchState.RUNNING then
            task.spawn(function() -- Line: 567
                -- upvalues: BlockEngine (ref), getItemMeta (ref), RandomUtil (ref), Players (ref), default3 (ref)
                local v61 = BlockEngine:getStore():getAllBlocks();

                local function _(p62) -- Line: 570
                    return p62.Name;
                end;

                local v63 = table.create(#v61);
                local v64 = {};

                for i, v in v61 do
                    local _ = i - 1;
                    v63[i] = v.Name;
                end;

                for _, v in v63 do
                    v64[v] = true;
                end;

                local v65 = {};
                local v66 = #v65;

                for i in v64 do
                    v66 = v66 + 1;
                    v65[v66] = i;
                end;

                local function _(p67) -- Line: 589
                    -- upvalues: getItemMeta (ref)
                    local v68;

                    if p67 then
                        v68 = getItemMeta(p67);
                    else
                        v68 = nil;
                    end;

                    return v68 and (v68.block and v68.block.greedyMesh) and true or false;
                end;

                local v69 = 0;
                local v70 = {};

                for i, v in v65 do
                    local _ = i - 1;
                    local v71;

                    if v then
                        v71 = getItemMeta(v);
                    else
                        v71 = nil;
                    end;

                    if (v71 and (v71.block and v71.block.greedyMesh) and true or false) == true then
                        v69 = v69 + 1;
                        v70[v69] = v;
                    end;
                end;

                local u72 = RandomUtil.fromList(unpack(v70));
                Players.LocalPlayer.CharacterAdded:Once(function() -- Line: 606
                    -- upvalues: default3 (ref), u72 (copy)
                    default3.Client:Get("BHHiderDisguiseBlock"):SendToServer({
                        data = {
                            blockType = u72
                        }
                    });
                end);
            end);
        end;
    end);
end;

function u7.registerTauntAbilities(p73, p74) -- Line: 617
    -- upvalues: Players (copy), u2 (copy), Flamework (copy), AbilityId (copy), BedwarsImageId (copy), AbilityState (copy)
    if p74 ~= Players.LocalPlayer then
        return nil;
    end;

    local u75 = u2.new();
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.BH_HIDER_TAUNT_SOUND, {
        abilityType = "KitTertiary",
        abilityButton = {
            icon = BedwarsImageId.BH_TAUNT_SOUND,
            stateColors = {
                [AbilityState.PROGRESSING] = Color3.fromRGB(120, 133, 140)
            }
        }
    }):andThen(function(p76) -- Line: 632
        -- upvalues: u75 (copy)
        u75:GiveTask(p76);
    end);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.BH_HIDER_TAUNT_FIREWORK, {
        abilityType = "ItemPrimary",
        abilityButton = {
            icon = BedwarsImageId.BH_TAUNT_FIREWORK,
            stateColors = {
                [AbilityState.PROGRESSING] = Color3.fromRGB(120, 133, 140)
            }
        }
    }):andThen(function(p77) -- Line: 646
        -- upvalues: u75 (copy)
        u75:GiveTask(p77);
    end);
    p73.tauntMaid = u75;
end;

function u7.playEffect(p78, p79, p80) -- Line: 652
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), KnitClient (copy), u4 (copy), MimicBlockFace (copy), SoundManager (copy), GameSound (copy)
    local Character = p79.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if Character then
        local v81 = ReplicatedStorage.Assets.Effects.DisguiseEffect:Clone();
        v81.Parent = Workspace;
        v81.Position = Character;
        EffectUtil:playEffects({ v81 }, nil, {
            destroyAfterSec = 1
        });

        if p80 then
            local v82 = KnitClient.Controllers.BlockDisguiseController:getPlayerBlockModel(p79);

            if v82 then
                local u83 = {};

                for _, v in Enum.NormalId:GetEnumItems() do
                    local v84 = u4.mount(u4.createElement(MimicBlockFace, {
                        face = v
                    }), v82:FindFirstChild("Handle"));
                    table.insert(u83, v84);
                end;

                task.delay(2, function() -- Line: 678
                    -- upvalues: u4 (ref), u83 (copy)
                    local function _(p85) -- Line: 679
                        -- upvalues: u4 (ref)
                        return u4.unmount(p85);
                    end;

                    for i, v in u83 do
                        local _ = i - 1;
                        u4.unmount(v);
                    end;
                end);
            end;
        end;

        SoundManager:playSound(GameSound.BLOCK_DISGUISE, {
            volumeMultiplier = 0.5,
            position = Character
        });
    end;
end;

function u7.getSelectedBlockFromPlayer(p86, p87) -- Line: 694
    -- upvalues: BLOCK_SIZE (copy), BlockEngine (copy), ItemType (copy), DeviceUtil (copy), UserInputService (copy), ClientBlockEngine (copy), BlockSelectorMode (copy)
    local Character = p87.Character;

    if not Character then
        return nil;
    end;

    local v88 = Character:FindFirstChildWhichIsA("Humanoid");

    if not v88 then
        return nil;
    end;

    local PrimaryPart = Character.PrimaryPart;

    if not PrimaryPart then
        return nil;
    end;

    local v89 = PrimaryPart.Position - Vector3.new(0, PrimaryPart.Size.Y / 2 + v88.HipHeight + 0.25 * BLOCK_SIZE, 0);
    local v90 = BlockEngine:getStore():getBlockAt(BlockEngine:getBlockPosition(v89));
    local v91;

    if v90 and ItemType[v90.Name] ~= nil then
        v91 = v90.Name;
    else
        v91 = nil;
    end;

    if not DeviceUtil.isMobileControls() and (not DeviceUtil.isGamepadControls() and #UserInputService:GetConnectedGamepads() == 0) then
        local v92 = ClientBlockEngine:getBlockSelector():getMouseInfo(BlockSelectorMode.SELECT);

        if v92 ~= nil then
            v92 = v92.target;
        end;

        if v92 ~= nil then
            v92 = v92.blockInstance.Name;
        end;

        if v92 ~= nil then
            v91 = v92;
        end;
    end;

    return v91;
end;

function u7.waitForPlayerTeam(p93, p94) -- Line: 735
    -- upvalues: KnitClient (copy)
    local v95 = KnitClient.Controllers.TeamController:getPlayerTeam(p94);

    while true do
        local v96 = task.wait(0.1);

        if v96 ~= 0 and (v96 == v96 and v96) then
            v96 = not v95;
        end;

        if v96 == 0 or (v96 ~= v96 or not v96) then
            return v95;
        end;

        v95 = KnitClient.Controllers.TeamController:getPlayerTeam(p94);
    end;
end;

KnitClient.CreateController(u7.new());

return nil;