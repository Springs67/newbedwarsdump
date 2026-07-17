-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ProjectileUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "projectile-util").ProjectileUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BlockKickerKitAttributes = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "block-kicker", "block-kicker-kit-attributes").BlockKickerKitAttributes;
local BlockKickerKitBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "block-kicker", "block-kicker-kit-balance").BlockKickerKitBalance;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local GetAttribute = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").GetAttribute;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u5 = {
    AnimationType.KICK_1,
    AnimationType.KICK_2,
    AnimationType.KICK_3,
    AnimationType.KICK_4,
    AnimationType.KICK_5
};
local u6 = {
    GameSound.BLOCK_KICKER_KIT_BLOCK_IMPACT_1,
    GameSound.BLOCK_KICKER_KIT_BLOCK_IMPACT_2,
    GameSound.BLOCK_KICKER_KIT_BLOCK_IMPACT_3,
    GameSound.BLOCK_KICKER_KIT_BLOCK_IMPACT_4
};
local u7 = {
    GameSound.BLOCK_KICKER_KIT_BLOCK_KICK_1,
    GameSound.BLOCK_KICKER_KIT_BLOCK_KICK_2,
    GameSound.BLOCK_KICKER_KIT_BLOCK_KICK_3,
    GameSound.BLOCK_KICKER_KIT_BLOCK_KICK_4,
    GameSound.BLOCK_KICKER_KIT_BLOCK_KICK_5
};
local u8 = {
    GameSound.BLOCK_KICKER_KIT_MITIGATE_DAMAGE_1,
    GameSound.BLOCK_KICKER_KIT_MITIGATE_DAMAGE_2,
    GameSound.BLOCK_KICKER_KIT_MITIGATE_DAMAGE_3,
    GameSound.BLOCK_KICKER_KIT_MITIGATE_DAMAGE_4,
    GameSound.BLOCK_KICKER_KIT_MITIGATE_DAMAGE_5
};
local u9 = setmetatable({}, {
    __tostring = function() -- Line: 46, Name: __tostring
        return "BlockKickerKitController";
    end,

    __index = BaseKitController
});
u9.__index = u9;

function u9.new(...) -- Line: 52
    -- upvalues: u9 (ref)
    local v10 = setmetatable({}, u9);

    return v10:constructor(...) or v10;
end;

function u9.constructor(p11) -- Line: 56
    -- upvalues: BedwarsKit (copy), u5 (copy), AnimationType (copy), u6 (copy), u7 (copy), u8 (copy), GameSound (copy), BaseKitController (copy), Workspace (copy), u3 (copy)
    local BLOCK_KICKER = BedwarsKit.BLOCK_KICKER;
    local v12 = {};
    local v13 = {};
    local v14 = #v13;
    local v15 = #u5;
    table.move(u5, 1, v15, v14 + 1, v13);
    v13[v14 + v15 + 1] = AnimationType.KICKER_STOMP;
    v12.animations = v13;
    local v16 = {};
    local v17 = #v16;
    local v18 = #u6;
    table.move(u6, 1, v18, v17 + 1, v16);
    local v19 = v17 + v18;
    local v20 = #u7;
    table.move(u7, 1, v20, v19 + 1, v16);
    local v21 = v19 + v20;
    local v22 = #u8;
    table.move(u8, 1, v22, v21 + 1, v16);
    local v23 = v21 + v22;
    v16[v23 + 1] = GameSound.BLOCK_KICKER_KIT_STOMP;
    v16[v23 + 2] = GameSound.BLOCK_KICKER_KIT_BLOCKS_ORBITING;
    v12.sounds = v16;
    BaseKitController.constructor(p11, BLOCK_KICKER, v12);
    p11.Name = "BlockKickerKitController";
    p11.blocks = {};
    p11.blockProjectiles = {};
    p11.camera = Workspace.CurrentCamera;
    p11.blockModelFolder = u3("Folder", {
        Name = "BlockKickerBlocks",
        Parent = Workspace
    });
    p11.projectileModelSet = {};
end;

function u9.KnitStart(p24) -- Line: 93
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p24);
end;

function u9.onKitLocalActivated(p25, p26) -- Line: 96
end;

function u9.onKitLocalDeactivated(p27) -- Line: 98
    -- upvalues: Players (copy)
    p27:removeAllBlocksFromPlayer(Players.LocalPlayer);
end;

function u9.onKitReplicationActivated(u28, p29) -- Line: 101
    -- upvalues: ClientSyncEvents (copy), Players (copy), EntityUtil (copy), AbilityId (copy), GetAttribute (copy), BlockKickerKitAttributes (copy), default (copy), WatchCollectionTag (copy), ReplicatedStorage (copy), RunService (copy), Workspace (copy)
    p29:GiveTask(ClientSyncEvents.CanUseLocalAbility:connect(function(p30) -- Line: 103
        -- upvalues: Players (ref), EntityUtil (ref), AbilityId (ref), GetAttribute (ref), BlockKickerKitAttributes (ref), u28 (copy)
        if p30.userCharacter ~= Players.LocalPlayer.Character then
            return nil;
        end;

        local v31 = EntityUtil:getEntity(Players.LocalPlayer);

        if not v31 then
            return nil;
        end;

        if p30.ability == AbilityId.BLOCK_KICK then
            local v32;

            if v31 == nil then
                v32 = v31;
            else
                v32 = v31:isAlive();
            end;

            if not v32 then
                p30:setCancelled(true);

                return nil;
            end;

            local v33 = GetAttribute(v31:getInstance(), BlockKickerKitAttributes.BlockKickerKit_BlockCount);

            if (v33 == nil and 0 or v33) <= 0 then
                p30:setCancelled(true);

                return nil;
            end;

            if u28.blocks[Players.LocalPlayer] == nil then
                p30:setCancelled(true);

                return nil;
            end;

            if #u28.blocks[Players.LocalPlayer] <= 0 then
                p30:setCancelled(true);

                return nil;
            end;

            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character:FindFirstChildWhichIsA("Humanoid");
            end;

            if not Character then
                p30:setCancelled(true);

                return nil;
            end;

            local v34 = Character:GetState();

            if v34 ~= Enum.HumanoidStateType.Landed then
                if v34 ~= Enum.HumanoidStateType.Running then
                    p30:setCancelled(true);

                    return nil;
                end;
            end;
        elseif p30.ability == AbilityId.BLOCK_STOMP then
            if v31 ~= nil then
                v31 = v31:isAlive();
            end;

            if not v31 then
                p30:setCancelled(true);

                return nil;
            end;

            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character:FindFirstChildWhichIsA("Humanoid");
            end;

            if not Character then
                p30:setCancelled(true);

                return nil;
            end;

            local v35 = Character:GetState();

            if v35 ~= Enum.HumanoidStateType.Landed then
                if v35 ~= Enum.HumanoidStateType.Running then
                    p30:setCancelled(true);

                    return nil;
                end;
            end;
        end;
    end));
    p29:GiveTask(default.Client:Get("BlockStomp"):Connect(function(p36) -- Line: 183
        -- upvalues: Players (ref), u28 (copy)
        if Players.LocalPlayer ~= p36.player then
            u28:playStompEffect(p36.player);
        end;

        u28:createBlocksForPlayer(p36.player, p36.blocks);
    end));
    p29:GiveTask(default.Client:Get("EntityDeathEvent"):Connect(function(p37) -- Line: 193
        -- upvalues: Players (ref), u28 (copy)
        local v38 = Players:GetPlayerFromCharacter(p37.entityInstance);

        if v38 and u28.blocks[v38] ~= nil then
            u28:removeAllBlocksFromPlayer(v38);
        end;
    end));
    p29:GiveTask(default.Client:Get("BlockKick"):Connect(function(p39) -- Line: 202
        -- upvalues: Players (ref), u28 (copy)
        if p39.player ~= Players.LocalPlayer then
            u28:playKickAnimation(p39.player, p39.kickCombo, p39.originPosition, p39.direction);
            u28:launchLocalBlockProjectile(p39.player, p39.originPosition, p39.direction, p39.projectileRefId);
        end;
    end));
    p29:GiveTask(default.Client:Get("BlockKickHit"):Connect(function(p40) -- Line: 214
        -- upvalues: u28 (copy)
        u28:blockHit(p40.user, p40.hitPosition, p40.projectileRefId, p40.directHit);
    end));
    p29:GiveTask(default.Client:Get("ConsumeBlock"):Connect(function(p41) -- Line: 218
        -- upvalues: u28 (copy)
        u28:removeBlockFromDamageMitigation(p41.player);
    end));
    p29:GiveTask(WatchCollectionTag("VoidTerraBlock", function(u42) -- Line: 221
        -- upvalues: u28 (copy), ReplicatedStorage (ref), RunService (ref), Workspace (ref)
        if u28.projectileModelSet[u42] ~= nil then
            return nil;
        end;

        u28.projectileModelSet[u42] = true;
        local u43 = ReplicatedStorage.Assets.Effects.Terra.VoidBlock:Clone();
        u43.Parent = u42;
        local u44 = nil;
        u44 = RunService.Heartbeat:Connect(function(p45) -- Line: 233
            -- upvalues: u42 (copy), Workspace (ref), u28 (ref), u44 (ref), u43 (copy)
            if not u42:IsDescendantOf(Workspace) then
                u28.projectileModelSet[u42] = nil;
                u44:Disconnect();

                return nil;
            end;

            u43:PivotTo(u42.CFrame);
        end);
    end));
end;

function u9.onKitReplicationDeactivated(p46) -- Line: 245
end;

function u9.onInnateAbilityEnabled(p47, p48, p49) -- Line: 247
end;

function u9.onAbilityUsed(p50, p51, p52) -- Line: 249
    -- upvalues: Players (copy), EntityUtil (copy), AbilityId (copy), KnitClient2 (copy), Workspace (copy), KnitClient (copy), GetAttribute (copy), BlockKickerKitAttributes (copy), ProjectileUtil (copy), default (copy)
    if p51 ~= Players.LocalPlayer.Character then
        return nil;
    end;

    local v53 = Players:GetPlayerFromCharacter(p51);

    if not v53 then
        return nil;
    end;

    if not EntityUtil:getEntity(p51) then
        return nil;
    end;

    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    if p52.ability ~= AbilityId.BLOCK_STOMP then
        if p52.ability == AbilityId.BLOCK_KICK then
            local LookVector = Workspace.CurrentCamera.CFrame.LookVector;

            if KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 1 then
                LookVector = Vector3.new(LookVector.X, LookVector.Y + 0.35, LookVector.Z);
            end;

            local v54 = p50:getKickBlockProjectileOriginPosition(Players.LocalPlayer.Character.PrimaryPart.Position, LookVector);
            local v55 = GetAttribute(v53, BlockKickerKitAttributes.BlockKickerKit_CurrentKickCombo);
            p50:playKickAnimation(v53, v55 == nil and 0 or v55, v54, LookVector);
            local u56 = KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
                moveSpeedMultiplier = 0.5,
                blockSprint = true
            });
            task.delay(0.25, function() -- Line: 304
                -- upvalues: u56 (copy)
                u56.Destroy();
            end);
            local v57 = ProjectileUtil.generateRefId();
            local v58 = p50:launchLocalBlockProjectile(v53, v54, LookVector, v57);
            default.Client:Get("TryBlockKick"):SendToServer({
                originPosition = v54,
                direction = LookVector,
                projectileRefId = v57,
                blockType = v58
            });
        end;

        return;
    end;

    local u59 = KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
        moveSpeedMultiplier = 0,
        blockSprint = true
    });
    task.delay(0.7, function() -- Line: 277
        -- upvalues: u59 (copy)
        u59.Destroy();
    end);
    p50:playStompEffect(v53);
end;

function u9.playStompEffect(p60, p61) -- Line: 320
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), GameSound (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), SoundManager (copy), Players (copy), KnitClient2 (copy)
    AnimationUtil:playAnimation(p61, GameAnimationUtil:getAssetId(AnimationType.KICKER_STOMP));
    task.wait(0.2);
    local Character = p61.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.CFrame;
        end;
    end;

    if not Character then
        return nil;
    end;

    local u62 = ReplicatedStorage.Assets.Effects.BlockStompShockwave:Clone();
    u62:PivotTo(CFrame.new(Character.Position + Vector3.new(0, -3, 0)));
    u62.Parent = Workspace;
    EffectUtil:playEffects({ u62 }, nil);
    local BLOCK_KICKER_KIT_STOMP = GameSound.BLOCK_KICKER_KIT_STOMP;
    local Character2 = p61.Character;

    if Character2 then
        local terra = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(Character2)].terra;
        local v63;

        if terra == nil then
            v63 = terra;
        else
            v63 = terra.stompSound;
        end;

        if v63 ~= "" and v63 then
            BLOCK_KICKER_KIT_STOMP = terra.stompSound;
        end;
    end;

    SoundManager:playSound(BLOCK_KICKER_KIT_STOMP, {
        volumeMultiplier = 1,
        position = Character.Position
    });
    task.delay(0.2, function() -- Line: 364
        -- upvalues: EffectUtil (ref), u62 (copy)
        EffectUtil:disableEffects({ u62 });
    end);
    task.delay(1, function() -- Line: 367
        -- upvalues: u62 (copy)
        u62:Destroy();
    end);
    local v64 = p61 == Players.LocalPlayer;

    if v64 then
        v64 = Players.LocalPlayer.Character;

        if v64 ~= nil then
            v64 = v64:GetPivot();

            if v64 ~= nil then
                v64 = v64.Position;
            end;
        end;
    end;

    if v64 then
        KnitClient2.Controllers.ScreenShakeController:shake(Players.LocalPlayer.Character:GetPivot().Position, Vector3.new(0, -1, 0), {
            magnitude = 0.4,
            cycles = 5,
            duration = 0.5
        });
    end;
end;

function u9.createBlocksForPlayer(p65, p66, p67) -- Line: 390
    p65:removeAllBlocksFromPlayer(p66);
    local v68 = 0;
    local v69 = {};

    for _, v in p67 do
        local v70 = p65:createBlock(p66, v68, #p67, v.blockType, v.blockPosition);

        if v70 then
            table.insert(v69, v70);
            v68 = v68 + 1;
        end;
    end;

    p65.blocks[p66] = v69;
end;

function u9.removeAllBlocksFromPlayer(p71, p72) -- Line: 408
    local v73 = p71.blocks[p72];

    if not v73 then
        return nil;
    end;

    local function _(p74) -- Line: 415
        p74:Destroy();
    end;

    for i, v in v73 do
        local _ = i - 1;
        v:Destroy();
    end;

    p71.blocks[p72] = nil;
end;

function u9.createBlock(u75, u76, p77, p78, p79, p80) -- Line: 425
    -- upvalues: BedwarsKitSkin (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), ReplicatedStorage (copy), BlockEngine (copy), u3 (copy), Workspace (copy), EntityUtil (copy), StatusEffectUtil (copy), StatusEffectType (copy), TweenService (copy), RunService (copy), Players (copy)
    local Character = u76.Character;

    if Character ~= nil then
        Character = Character:GetPivot();
    end;

    local v81;

    if Character == nil then
        v81 = Character;
    else
        v81 = Character.Position;
    end;

    if not Character then
        return nil;
    end;

    local u82 = false;
    local u83 = nil;
    local Character2 = u76.Character;
    local DEFAULT = BedwarsKitSkin.DEFAULT;

    if Character2 then
        DEFAULT = KnitClient.Controllers.KitSkinController:getKitSkin(Character2);
        local v84 = BedwarsKitSkinMeta[DEFAULT];

        if v84.terra then
            u83 = v84.terra.customBlock:Clone();
        end;
    end;

    if not u83 then
        u83 = ReplicatedStorage:WaitForChild("Items"):WaitForChild(p79, 3);

        if u83 ~= nil then
            u83 = u83:WaitForChild("Handle"):Clone();
        end;
    end;

    local v85;

    if p80 then
        v85 = BlockEngine:getWorldPosition(p80);
    else
        v85 = u75:getPositionAroundPlayer(Character, p77);
    end;

    if u83 then
        u83.Position = v85;
        u83.CanCollide = false;
        u83.CanQuery = false;
        u83.Size = Vector3.new(1.5, 1.5, 1.5);
        u83.Anchored = true;

        local function _(p86) -- Line: 480
            if p86:IsA("BasePart") then
                p86.Anchored = true;
            end;
        end;

        for i, descendant in u83:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                descendant.Anchored = true;
            end;
        end;

        u83.Name = p79;
        u83.Parent = u75.blockModelFolder;
        u83:SetAttribute("BlockOwner", u76.UserId);
        local v87 = EntityUtil:getEntity(u76);

        if v87 ~= nil then
            v87 = v87:getInstance();
        end;

        if v87 and StatusEffectUtil:isActive(v87, StatusEffectType.INVISIBILITY) then
            u83.Transparency = 1;

            local function _(p88) -- Line: 500
                if p88:IsA("Texture") then
                    p88.Transparency = 1;
                end;
            end;

            for i, descendant in u83:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("Texture") then
                    descendant.Transparency = 1;
                end;
            end;
        end;
    else
        u83 = u3("Part", {
            Size = Vector3.new(1.5, 1.5, 1.5),
            CanCollide = false,
            CanQuery = false,
            CanTouch = false,
            Anchored = true,
            Name = p79,
            Position = v85,
            Parent = Workspace
        });
    end;

    if not (v81 and u83) then
        return u83;
    end;

    local u89 = 360 / p78 * 0.017453292519943295 * p77;
    local v90 = math.sin(u89) * 5;
    local v91 = math.cos(u89) * 5;
    local v92 = v81 + Vector3.new(v90, 0, v91);
    u3("BodyForce", {
        Name = "PartForce",
        Force = Vector3.new(0, Workspace.Gravity * u83.Mass, 0),
        Parent = u83
    });
    local v93 = TweenService:Create(u83, TweenInfo.new(0.5), {
        Position = v92
    });
    v93:Play();
    local u94 = 0;
    v93.Completed:Connect(function() -- Line: 530
        -- upvalues: RunService (ref), u83 (ref), u75 (copy), u76 (copy), u94 (ref), u89 (copy), KnitClient (ref), BedwarsKitSkinMeta (ref), Players (ref), u82 (ref), DEFAULT (ref)
        local u95 = nil;
        u95 = RunService.Heartbeat:Connect(function(p96) -- Line: 532
            -- upvalues: u83 (ref), u75 (ref), u76 (ref), u95 (ref), u94 (ref), u89 (ref), KnitClient (ref), BedwarsKitSkinMeta (ref), Players (ref), u82 (ref), DEFAULT (ref)
            if not u83 or u83.Parent ~= u75.blockModelFolder then
                return nil;
            end;

            local Character3 = u76.Character;

            if Character3 ~= nil then
                Character3 = Character3:GetPivot().Position;
            end;

            if not Character3 then
                u95:Disconnect();

                return nil;
            end;

            u94 = u94 + p96;
            local v97 = math.sin(u94 * 2) * 1;
            local v98 = math.sin(u94 + u89) * 5;
            local v99 = math.cos(u94 + u89) * 5;
            local u100 = Vector3.new(v98, v97, v99);
            local u101 = CFrame.Angles(math.sin(u94) * 3.141592653589793 / 24, math.cos(u94) * 3.141592653589793 / 24, math.sin(u94) * 3.141592653589793 / 24);
            local Character4 = u76.Character;

            if Character4 then
                local v102 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(Character4)];
                local terra = v102.terra;

                if terra ~= nil then
                    terra = terra.blockRotation;
                end;

                if terra then
                    u101 = v102.terra;

                    if u101 ~= nil then
                        u101 = u101.blockRotation(u94);
                    end;
                end;
            end;

            u83:PivotTo(CFrame.new(Character3 + u100) * u101);

            local function _(p103) -- Line: 574
                -- upvalues: Character3 (copy), u100 (copy), u101 (ref)
                if p103:IsA("BasePart") then
                    p103:PivotTo(CFrame.new(Character3 + u100) * u101);
                end;
            end;

            for i, descendant in u83:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") then
                    descendant:PivotTo(CFrame.new(Character3 + u100) * u101);
                end;
            end;

            if u76 == Players.LocalPlayer then
                local camera = u75.camera;

                if camera ~= nil then
                    camera = (camera.Focus.Position - u75.camera.CFrame.Position).Magnitude;
                end;

                if camera == 0 or (camera ~= camera or not camera) then
                    return nil;
                end;

                if camera < 0.6 and not u82 then
                    u82 = true;
                    local terra = BedwarsKitSkinMeta[DEFAULT].terra;

                    if terra ~= nil then
                        terra = terra.blockTransparency;
                    end;

                    local u104 = terra == nil and 0.75 or terra;
                    u83.Transparency = u104;

                    local function _(p105) -- Line: 611
                        -- upvalues: u104 (copy)
                        if p105:IsA("BasePart") then
                            p105.Transparency = u104;

                            return;
                        end;

                        if p105:IsA("Texture") then
                            p105.Transparency = u104;
                        end;
                    end;

                    for i, child in u83:GetChildren() do
                        local _ = i - 1;

                        if child:IsA("BasePart") then
                            child.Transparency = u104;
                        elseif child:IsA("Texture") then
                            child.Transparency = u104;
                        end;
                    end;
                elseif camera > 0.6 and u82 then
                    u82 = false;
                    u83.Transparency = 0;

                    local function _(p106) -- Line: 625
                        if p106:IsA("BasePart") then
                            p106.Transparency = 0;

                            return;
                        end;

                        if p106:IsA("Texture") then
                            p106.Transparency = 0;
                        end;
                    end;

                    for i, child in u83:GetChildren() do
                        local _ = i - 1;

                        if child:IsA("BasePart") then
                            child.Transparency = 0;
                        elseif child:IsA("Texture") then
                            child.Transparency = 0;
                        end;
                    end;
                end;
            end;
        end);
    end);

    return u83;
end;

function u9.getPositionAroundPlayer(p107, p108, p109) -- Line: 641
    local v110 = select(2, p108:ToOrientation());
    local v111 = p109 % 6 / 6 * 6.283185307179586 - v110;
    local v112 = math.cos(v111) * 3.5;
    local v113 = math.sin(v111) * 3.5;

    return (p108 + Vector3.new(v112, 0, v113)).Position;
end;

function u9.launchLocalBlockProjectile(p114, p115, p116, p117, p118) -- Line: 649
    -- upvalues: Players (copy), u3 (copy), ReplicatedStorage (copy), Workspace (copy), TweenService (copy), BlockKickerKitBalance (copy)
    if p115 ~= Players.LocalPlayer then
        local v119 = p114:popBlock(p115);

        if v119 then
            v119:Destroy();
        end;

        return nil;
    end;

    local Character = p115.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    local u120 = p114:popBlock(p115);
    local v121;

    if u120 then
        v121 = u3("Model", {});
        u120.Parent = v121;
        v121.PrimaryPart = u120;
    else
        v121 = ReplicatedStorage.Assets.Misc.BlockKickerBlock:Clone();
    end;

    if not v121 then
        return nil;
    end;

    v121.Parent = Workspace;

    if v121.PrimaryPart then
        local function _(p122) -- Line: 689
            if p122:IsA("Texture") then
                p122.Transparency = 0;
            end;
        end;

        for i, child in v121.PrimaryPart:GetChildren() do
            local _ = i - 1;

            if child:IsA("Texture") then
                child.Transparency = 0;
            end;
        end;
    end;

    p114.blockProjectiles[p118] = v121;
    local v123 = p114:getKickBlockProjectileOriginPosition(p116, p117);
    local v124 = TweenInfo.new(0.1);
    TweenService:Create(v121.PrimaryPart, v124, {
        Position = v123
    }):Play();
    local _ = p117 * BlockKickerKitBalance.KICK_BLOCK_VELOCITY;
    task.delay(0.11, function() -- Line: 714
        -- upvalues: u120 (copy)
        local PartForce = u120:WaitForChild("PartForce", 1);

        if PartForce ~= nil then
            PartForce:Destroy();
        end;

        u120.AssemblyLinearVelocity = Vector3.new(0, 0, 0);

        if u120 then
            u120:Destroy();
        end;
    end);

    if u120 ~= nil then
        u120 = u120.Name;
    end;

    return u120;
end;

function u9.popBlock(p125, p126) -- Line: 740
    local v127 = p125.blocks[p126];

    if not v127 then
        return nil;
    end;

    local v128 = #v127;
    local v129 = v127[v128];
    v127[v128] = nil;

    return v129;
end;

function u9.getKickBlockProjectileOriginPosition(p130, p131, p132) -- Line: 754
    return p131 + p132.Unit * 2;
end;

function u9.blockHit(p133, p134, p135, p136, p137) -- Line: 759
    -- upvalues: KnitClient (copy), BedwarsKitSkinMeta (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), SoundManager (copy), u6 (copy)
    local v138 = p133.blockProjectiles[p136];

    if v138 then
        v138:Destroy();
    end;

    local v139 = nil;
    local Character = p134.Character;

    if Character then
        local terra = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(Character)].terra;

        if terra ~= nil then
            terra = terra.customBlockImpactEffect:Clone();
        end;

        v139 = terra or v139;
    end;

    local v140 = v139 or ReplicatedStorage.Assets.Effects.BlockKickImpactExplosion:Clone();
    v140.Parent = Workspace;
    EffectUtil:playEffects({ v140 }, nil, {
        sizeMultiplier = 1,
        destroyAfterSec = 1
    });
    v140.CFrame = CFrame.new(p135);
    SoundManager:playSound(u6[math.random(0, #u6 - 1) + 1], {
        position = p135
    });
end;

function u9.calculateNormalId(p141, p142, p143) -- Line: 806
    -- upvalues: BlockEngine (copy)
    local Unit = (p142 - BlockEngine:getWorldPosition(p143)).Unit;
    local Right = Enum.NormalId.Right;
    local v144 = 1.1;
    local v145 = 1.1;

    for _, v in Enum.NormalId:GetEnumItems() do
        if v ~= Enum.NormalId.Top and v ~= Enum.NormalId.Bottom then
            local v146 = Vector3.FromNormalId(v) - Unit;

            if math.abs(v146.X) < v144 and math.abs(v146.Z) < v145 then
                v144 = math.abs(v146.X);
                v145 = math.abs(v146.Z);
                Right = v;
            end;
        end;
    end;

    return Right;
end;

function u9.setAbilityState(p147, p148, p149) -- Line: 827
    -- upvalues: Flamework (copy)
    local v150 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(p148);

    if not v150 then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v150, p149);
end;

function u9.removeBlockFromDamageMitigation(p151, p152) -- Line: 834
    -- upvalues: u8 (copy), SoundManager (copy)
    local v153 = p151.blocks[p152];

    if not v153 then
        return nil;
    end;

    local v154 = #v153;
    local u155 = v153[v154];
    v153[v154] = nil;

    if u155 then
        p151:createBlockDebris(u155);
    end;

    local Character = p152.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if Character then
        SoundManager:playSound(u8[math.random(0, #u8 - 1) + 1], {
            position = Character
        });
    end;

    task.delay(0.25, function() -- Line: 865
        -- upvalues: u155 (copy)
        local v156 = u155;

        if v156 ~= nil then
            v156:Destroy();
        end;
    end);
end;

function u9.createBlockDebris(p157, p158) -- Line: 872
    -- upvalues: BlockEngine (copy), KnitClient (copy)
    local PartForce = p158:WaitForChild("PartForce", 1);

    if PartForce ~= nil then
        PartForce:Destroy();
    end;

    local v159 = BlockEngine:getBlockPosition(p158.Position);
    KnitClient.Controllers.BlockDebrisController:convertBlockToDebris(p158, p158.Name, v159, Vector3.new(0, 10, 0));
end;

function u9.playKickAnimation(p160, u161, u162, u163, p164) -- Line: 880
    -- upvalues: GameAnimationUtil (copy), u5 (copy), u7 (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), SoundManager (copy), ReplicatedStorage (copy), Workspace (copy), GameQueryUtil (copy), EffectUtil (copy), u6 (copy), Players (copy), KnitClient2 (copy)
    local Character = u161.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.CFrame;
        end;
    end;

    if Character then
        local Character2 = u161.Character;

        if Character2 ~= nil then
            local PrimaryPart = u161.Character.PrimaryPart;

            if PrimaryPart ~= nil then
                PrimaryPart = PrimaryPart.Position;
            end;

            local PrimaryPart2 = u161.Character.PrimaryPart;

            if PrimaryPart2 ~= nil then
                PrimaryPart2 = PrimaryPart2.Position + p164;
            end;

            Character2:PivotTo(CFrame.lookAt(PrimaryPart, PrimaryPart2));
        end;
    end;

    local v165 = GameAnimationUtil:playAnimation(u161, u5[u162 + 1]);

    if v165 ~= nil then
        v165:AdjustSpeed(v165.Length * 3);
    end;

    local Character2 = u161.Character;

    if Character2 ~= nil then
        Character2 = Character2.PrimaryPart;

        if Character2 ~= nil then
            Character2 = Character2.Position;
        end;
    end;

    local v166 = u7[u162 + 1];
    local Character3 = u161.Character;

    if Character3 then
        local terra = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(Character3)].terra;

        if terra ~= nil then
            terra = terra.blockKickSounds;
        end;

        if terra then
            v166 = terra[u162 % #terra + 1];
        end;
    end;

    SoundManager:playSound(v166, {
        position = Character2
    });

    if v165 ~= nil then
        v165:GetMarkerReachedSignal("hit"):Connect(function() -- Line: 941
            -- upvalues: u161 (copy), u163 (copy), ReplicatedStorage (ref), Workspace (ref), GameQueryUtil (ref), EffectUtil (ref), SoundManager (ref), u6 (ref), u162 (copy), Players (ref), KnitClient2 (ref)
            local Character4 = u161.Character;

            if Character4 ~= nil then
                Character4 = Character4.PrimaryPart;

                if Character4 ~= nil then
                    Character4 = Character4.CFrame;
                end;
            end;

            if not Character4 then
                return nil;
            end;

            local v167 = u163;
            local v168 = ReplicatedStorage.Assets.Effects.HitEffect:Clone();
            v168.Anchored = true;
            v168.Parent = Workspace;
            GameQueryUtil:setQueryIgnored(v168, true);
            v168:PivotTo(CFrame.new(v167));
            EffectUtil:playEffects({ v168 }, nil, {
                destroyAfterSec = 0.5
            });
            SoundManager:playSound(u6[u162 + 1], {
                position = v167
            });
            local v169 = u161 == Players.LocalPlayer;

            if v169 then
                v169 = Players.LocalPlayer.Character;

                if v169 ~= nil then
                    v169 = v169:GetPivot();

                    if v169 ~= nil then
                        v169 = v169.Position;
                    end;
                end;
            end;

            if v169 then
                KnitClient2.Controllers.ScreenShakeController:shake(Players.LocalPlayer.Character:GetPivot().Position, Vector3.new(0, -1, 0), {
                    magnitude = 0.25,
                    cycles = 3,
                    duration = 0.3,
                    zMagnitude = 0.1
                });
            end;
        end);
    end;
end;

KnitClient.CreateController(u9.new());

return nil;