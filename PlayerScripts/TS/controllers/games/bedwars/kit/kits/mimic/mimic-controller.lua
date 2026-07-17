-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local BlockSelectorMode = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "select", "block-selector").BlockSelectorMode;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local TimedProgressBar = v1.TimedProgressBar;
local WatchCharacter = v1.WatchCharacter;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local UserInputService = v5.UserInputService;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local v6 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller");
local InteractionCategory = v6.InteractionCategory;
local InteractionPriority = v6.InteractionPriority;
local ClientBlockEngine = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "block-engine", "client-block-engine").ClientBlockEngine;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local MimicBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "mimic-balance-file").MimicBalance;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local MimicBlockFace = RuntimeLib.import(script, script.Parent, "ui", "mimic-block-face").MimicBlockFace;
local u7 = { GameSound.MIMIC_PICKPOCKET_1, GameSound.MIMIC_PICKPOCKET_2, GameSound.MIMIC_PICKPOCKET_3 };
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 48, Name: __tostring
        return "MimicController";
    end,

    __index = BaseKitController
});
u8.__index = u8;

function u8.new(...) -- Line: 54
    -- upvalues: u8 (ref)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10) -- Line: 58
    -- upvalues: BedwarsKit (copy), GameSound (copy), u7 (copy), BedwarsImageId (copy), BaseKitController (copy)
    local MIMIC = BedwarsKit.MIMIC;
    local v11 = {};
    local v12 = { GameSound.GENERIC_BLOCK_PLACE, GameSound.MIMIC_HIDE, GameSound.MIMIC_REVEAL };
    table.move(u7, 1, #u7, #v12 + 1, v12);
    v11.sounds = v12;
    v11.imageIds = { BedwarsImageId.MIMIC_BLOCK };
    BaseKitController.constructor(p10, MIMIC, v11);
    p10.Name = "MimicController";
    p10.playerMimicMap = {};
end;

function u8.onKitLocalActivated(u13, p14) -- Line: 71
    -- upvalues: KnitClient (copy), MimicBalance (copy), DeviceUtil (copy), InteractionPriority (copy), InteractionCategory (copy), Players (copy), EntityUtil (copy), AbilityMeta (copy), AbilityId (copy), StatusEffectUtil (copy), default (copy), RandomUtil (copy), u7 (copy), SoundManager (copy)
    p14:GiveTask(KnitClient.Controllers.InteractionRegistryController:RegisterInteraction({
        interactionLabel = "Pickpocket!",
        interactionObjectText = "Pickpocket",
        interactionTag = "MimicBLockPickPocketPlayer",
        instantActivation = true,
        removePromptOnInteract = true,
        maxActivationDistance = MimicBalance.MIMIC_PICKPOCKET_RADIUS,
        clickablePrompt = DeviceUtil.isMobileControls(),
        priority = InteractionPriority.ABILITY,
        category = InteractionCategory.ABILITY,

        onInteracted = function(p15, p16, p17) -- Line: 82, Name: onInteracted
            -- upvalues: Players (ref), EntityUtil (ref), AbilityMeta (ref), AbilityId (ref), StatusEffectUtil (ref), default (ref), u13 (copy), RandomUtil (ref), u7 (ref), SoundManager (ref)
            if not p16:IsA("Model") then
                return nil;
            end;

            if not Players:GetPlayerFromCharacter(p16) then
                return nil;
            end;

            local v18 = EntityUtil:getEntity(p15);

            if v18 ~= nil then
                v18 = v18:getInstance();
            end;

            if not v18 then
                return nil;
            end;

            for _, v in AbilityMeta[AbilityId.MIMIC_BLOCK_PICKPOCKET].blockingStatusEffects or {} do
                if StatusEffectUtil:isActive(v18, v) then
                    return nil;
                end;
            end;

            local v19 = Players:GetPlayerFromCharacter(p16);

            if not v19 then
                return nil;
            end;

            if default.Client:Get("MimicBlockPickPocketPlayer"):CallServer(v19) then
                u13:hidePromptsFromPlayer(p15);
                local Character = p15.Character;

                if Character ~= nil then
                    Character = Character.PrimaryPart;

                    if Character ~= nil then
                        Character = Character.Position;
                    end;
                end;

                if Character then
                    SoundManager:playSound(RandomUtil.fromList(unpack(u7)), {
                        playbackSpeedMultiplier = 1.27,
                        position = Character
                    });
                end;
            end;
        end
    }));
end;

function u8.onKitLocalDeactivated(p20) -- Line: 128
end;

function u8.onKitReplicationActivated(u21, u22) -- Line: 130
    -- upvalues: Workspace (copy), Players (copy), default (copy), KnitClient (copy), WatchCharacter (copy), BedwarsKit (copy), Flamework (copy), u4 (copy), TimedProgressBar (copy), MimicBalance (copy), SoundManager (copy), GameSound (copy), u3 (copy), ClientSyncEvents (copy), AbilityId (copy), EntityUtil (copy)
    u22:GiveTask(task.spawn(function() -- Line: 131
        -- upvalues: u21 (copy), Workspace (ref), Players (ref), default (ref), KnitClient (ref)
        while true do
            local v23 = task.wait(0.25);

            if v23 == 0 or (v23 ~= v23 or not v23) then
                break;
            end;

            for i, v in u21.playerMimicMap do
                local Character = i.Character;

                if Character ~= nil then
                    Character = Character:FindFirstChildWhichIsA("Humanoid");
                end;

                if Character then
                    if Workspace:GetServerTimeNow() - v.lastMoveTime >= 1 and (Character.MoveDirection.Magnitude == 0 and (Character:GetState() ~= Enum.HumanoidStateType.Freefall and Character:GetState() ~= Enum.HumanoidStateType.Jumping)) then
                        if v.inMovement then
                            v.inMovement = false;

                            if Players.LocalPlayer == i then
                                if u21.lastSnapRequestThread then
                                    task.cancel(u21.lastSnapRequestThread);
                                    u21.lastSnapRequestThread = nil;
                                end;

                                u21.lastSnapRequestThread = task.spawn(function() -- Line: 159
                                    -- upvalues: default (ref)
                                    default.Client:Get("MimicBlockSnapToGrid"):SendToServer();
                                end);
                            end;
                        end;
                    elseif not v.inMovement then
                        v.inMovement = true;
                        KnitClient.Controllers.BlockDisguiseController:disguisePlayerAsBlock(i, v.selectedBlock);
                    end;
                end;
            end;
        end;
    end));
    u22:GiveTask(WatchCharacter(function(u24, p25) -- Line: 172
        -- upvalues: KnitClient (ref), BedwarsKit (ref), u21 (copy), Workspace (ref)
        if not KnitClient.Controllers.KitController:isUsingKit(u24, BedwarsKit.MIMIC) then
            return nil;
        end;

        p25:WaitForChild("Humanoid"):GetPropertyChangedSignal("MoveDirection"):Connect(function() -- Line: 176
            -- upvalues: u21 (ref), u24 (copy), Workspace (ref)
            local v26 = u21.playerMimicMap[u24];

            if v26 then
                v26.lastMoveTime = Workspace:GetServerTimeNow();
            end;
        end);
    end));
    default.Client:OnEvent("ValidatedMimicBlock", function(p27) -- Line: 185
        -- upvalues: KnitClient (ref), u21 (copy), Workspace (ref), Players (ref), Flamework (ref), u4 (ref), TimedProgressBar (ref), MimicBalance (ref)
        local player = p27.player;
        local v28 = p27.blockType ~= nil;

        if v28 then
            KnitClient.Controllers.BlockDisguiseController:hidePlayer(player);
            KnitClient.Controllers.BlockDisguiseController:disguisePlayerAsBlock(player, p27.blockType);
            u21.playerMimicMap[player] = {
                inMovement = false,
                selectedBlock = p27.blockType,
                lastMoveTime = Workspace:GetServerTimeNow()
            };

            if player == Players.LocalPlayer then
                local cooldownBar = u21.cooldownBar;

                if cooldownBar ~= nil then
                    cooldownBar:Destroy();
                end;

                u21.cooldownBar = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createElement(TimedProgressBar, {
                    Size = UDim2.fromScale(1, 0.05),
                    EndTime = Workspace:GetServerTimeNow() + MimicBalance.MIMIC_BUFFS_APPLY_DELAY,
                    ProgressBarConfig = {
                        GradientRotation = 0,
                        Title = {
                            text = "Shield & Speed buff on reveal"
                        },
                        BarGradient = ColorSequence.new(Color3.fromRGB(43, 255, 28), Color3.fromRGB(112, 255, 143))
                    }
                }));
            end;
        else
            u21.playerMimicMap[player] = nil;
            KnitClient.Controllers.BlockDisguiseController:undisguisePlayer(player);

            if player == Players.LocalPlayer then
                u21:hidePromptsFromPlayer(player);
                local cooldownBar = u21.cooldownBar;

                if cooldownBar ~= nil then
                    cooldownBar:Destroy();
                end;
            end;
        end;

        u21:playEffect(player, v28);
    end):andThen(function(p29) -- Line: 228
        -- upvalues: u22 (copy)
        u22:GiveTask(p29);
    end);
    u22:GiveTask(default.Client:Get("ValidatedMimicBlockSnapToGrid"):Connect(function(p30) -- Line: 232
        -- upvalues: u21 (copy), KnitClient (ref), Players (ref), SoundManager (ref), GameSound (ref)
        local v31 = u21.playerMimicMap[p30.player];

        if v31 ~= nil then
            v31 = v31.inMovement;
        end;

        if v31 then
            return nil;
        end;

        if not KnitClient.Controllers.BlockDisguiseController:anchorBlockModel(p30.player) then
            return nil;
        end;

        if Players.LocalPlayer == p30.player then
            local Character = p30.player.Character;

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
    end));
    u22:GiveTask(default.Client:Get("MimicBlockPickPocketReady"):Connect(function(p32) -- Line: 263
        -- upvalues: Players (ref), u21 (copy)
        if p32.player ~= Players.LocalPlayer then
            return nil;
        end;

        if p32.ready then
            u21:showPromptsForPlayer(p32.player);

            return;
        end;

        u21:hidePromptsFromPlayer(p32.player);
    end));
    u22:GiveTask(default.Client:Get("MimicBlockRevealed"):Connect(function() -- Line: 273
        -- upvalues: KnitClient (ref), MimicBalance (ref), u21 (copy), u3 (ref)
        local v33 = KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
            moveSpeedMultiplier = MimicBalance.MIMIC_BUFFS_SPEED_MULTIPLIER
        });
        local speedMaid = u21.speedMaid;

        if speedMaid ~= nil then
            speedMaid:Destroy();
        end;

        if u21.speedThread then
            task.cancel(u21.speedThread);
            u21.speedThread = nil;
        end;

        u21.speedMaid = u3.new();
        u21.speedMaid:GiveTask(v33);
        u21.speedThread = task.delay(MimicBalance.MIMIC_BUFFS_DURATION, function() -- Line: 287
            -- upvalues: u21 (ref)
            local speedMaid2 = u21.speedMaid;

            if speedMaid2 ~= nil then
                speedMaid2:Destroy();
            end;
        end);
    end));
    u22:GiveTask(ClientSyncEvents.CanUseLocalAbility:connect(function(p34) -- Line: 294
        -- upvalues: AbilityId (ref), EntityUtil (ref)
        if p34.ability ~= AbilityId.MIMIC_BLOCK then
            return nil;
        end;

        local v35 = EntityUtil:getEntity(p34.userCharacter);

        if v35 ~= nil then
            v35 = v35:isAlive();
        end;

        if not v35 then
            p34:setCancelled(true);
        end;
    end));
end;

function u8.onKitReplicationDeactivated(p36) -- Line: 308
end;

function u8.onInnateAbilityEnabled(p37, p38, p39) -- Line: 310
end;

function u8.onAbilityUsed(p40, p41, p42) -- Line: 312
    -- upvalues: AbilityId (copy), Players (copy), default (copy)
    if p42:isCancelled() then
        return nil;
    end;

    if p42.ability ~= AbilityId.MIMIC_BLOCK then
        return nil;
    end;

    local v43 = Players:GetPlayerFromCharacter(p42.userCharacter);

    if not v43 then
        return nil;
    end;

    if v43 ~= Players.LocalPlayer then
        return nil;
    end;

    local u44 = p40:getSelectedBlockFromPlayer(v43);
    task.spawn(function() -- Line: 327
        -- upvalues: default (ref), u44 (copy)
        default.Client:Get("MimicBlock"):SendToServer({
            data = {
                blockType = u44
            }
        });
    end);
end;

function u8.playEffect(p45, p46, p47) -- Line: 335
    -- upvalues: EntityUtil (copy), GameSound (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), u4 (copy), MimicBlockFace (copy), SoundManager (copy)
    local Character = p46.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return nil;
    end;

    local v48 = EntityUtil:getEntity(p46);
    local v49;

    if p47 then
        v49 = GameSound.MIMIC_HIDE;
    else
        v49 = GameSound.MIMIC_REVEAL;
    end;

    if v48 then
        local v50 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(v48:getInstance())];
        local v51 = ReplicatedStorage.Assets.Effects.MimicBlockEffect:Clone();
        local milo = v50.milo;

        if milo ~= nil then
            milo = milo.blockEffect;
        end;

        if milo then
            v51 = v50.milo.blockEffect:Clone();
        end;

        v51.Parent = Workspace;
        v51.Position = Character;
        EffectUtil:playEffects({ v51 }, nil, {
            destroyAfterSec = 1
        });

        if v50.milo then
            if p47 then
                v49 = v50.milo.disguiseSound;
            else
                v49 = v50.milo.revealSound;
            end;
        end;
    end;

    if p47 then
        local v52 = KnitClient.Controllers.BlockDisguiseController:getPlayerBlockModel(p46);

        if v52 then
            local u53 = {};

            for _, v in Enum.NormalId:GetEnumItems() do
                local v54 = u4.mount(u4.createElement(MimicBlockFace, {
                    face = v
                }), v52:FindFirstChild("Handle"));
                table.insert(u53, v54);
            end;

            task.delay(2, function() -- Line: 386
                -- upvalues: u4 (ref), u53 (copy)
                local function _(p55) -- Line: 387
                    -- upvalues: u4 (ref)
                    return u4.unmount(p55);
                end;

                for i, v in u53 do
                    local _ = i - 1;
                    u4.unmount(v);
                end;
            end);
        end;
    end;

    SoundManager:playSound(v49, {
        volumeMultiplier = 0.25,
        position = Character
    });
end;

function u8.showPromptsForPlayer(p56, u57) -- Line: 401
    -- upvalues: Players (copy), KnitClient (copy), CollectionService (copy)
    local v58 = Players:GetPlayers();

    local function v60(p59) -- Line: 403
        -- upvalues: u57 (copy), KnitClient (ref), CollectionService (ref)
        if p59 == u57 then
            return nil;
        end;

        if KnitClient.Controllers.TeamController:getPlayerTeam(p59) == KnitClient.Controllers.TeamController:getPlayerTeam(u57) then
            return nil;
        end;

        if not p59.Character then
            return nil;
        end;

        if p59:HasTag("PlayerHidden") then
            return nil;
        end;

        CollectionService:AddTag(p59.Character, "MimicBLockPickPocketPlayer");
    end;

    for i, v in v58 do
        v60(v, i - 1, v58);
    end;
end;

function u8.hidePromptsFromPlayer(p61, u62) -- Line: 422
    -- upvalues: Players (copy), CollectionService (copy), KnitClient2 (copy)
    local function _(p63) -- Line: 424
        -- upvalues: u62 (copy), CollectionService (ref), KnitClient2 (ref)
        if p63 == u62 then
            return nil;
        end;

        if not p63.Character then
            return nil;
        end;

        if not CollectionService:HasTag(p63.Character, "MimicBLockPickPocketPlayer") then
            return nil;
        end;

        KnitClient2.Controllers.InteractionRegistryController:removePrompt(p63.Character, "MimicBLockPickPocketPlayer");
    end;

    for i, v in Players:GetPlayers() do
        local _ = i - 1;

        if v ~= u62 then
            if v.Character then
                if CollectionService:HasTag(v.Character, "MimicBLockPickPocketPlayer") then
                    KnitClient2.Controllers.InteractionRegistryController:removePrompt(v.Character, "MimicBLockPickPocketPlayer");
                end;
            end;
        end;
    end;
end;

function u8.getSelectedBlockFromPlayer(p64, p65) -- Line: 440
    -- upvalues: BLOCK_SIZE (copy), BlockEngine (copy), ItemType (copy), DeviceUtil (copy), UserInputService (copy), ClientBlockEngine (copy), BlockSelectorMode (copy)
    local Character = p65.Character;

    if not Character then
        return nil;
    end;

    local v66 = Character:FindFirstChildWhichIsA("Humanoid");

    if not v66 then
        return nil;
    end;

    local PrimaryPart = Character.PrimaryPart;

    if not PrimaryPart then
        return nil;
    end;

    local v67 = PrimaryPart.Position - Vector3.new(0, PrimaryPart.Size.Y / 2 + v66.HipHeight + 0.25 * BLOCK_SIZE, 0);
    local v68 = BlockEngine:getStore():getBlockAt(BlockEngine:getBlockPosition(v67));
    local v69;

    if v68 and ItemType[v68.Name] ~= nil then
        v69 = v68.Name;
    else
        v69 = nil;
    end;

    if not DeviceUtil.isMobileControls() and (not DeviceUtil.isGamepadControls() and #UserInputService:GetConnectedGamepads() == 0) then
        local v70 = ClientBlockEngine:getBlockSelector():getMouseInfo(BlockSelectorMode.SELECT);

        if v70 ~= nil then
            v70 = v70.target;
        end;

        if v70 ~= nil then
            v70 = v70.blockInstance.Name;
        end;

        if v70 ~= nil then
            v69 = v70;
        end;
    end;

    return v69;
end;

KnitClient.CreateController(u8.new());

return nil;