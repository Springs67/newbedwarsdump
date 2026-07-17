-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local MathExtras = v1.MathExtras;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InOutQuad = v3.InOutQuad;
local InQuad = v3.InQuad;
local Linear = v3.Linear;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v7.Players;
local ReplicatedStorage = v7.ReplicatedStorage;
local RunService = v7.RunService;
local Workspace = v7.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local CFrameUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cframe", "cframe-util").CFrameUtil;
local CharacterUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "character", "character-util").CharacterUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local VoidWalkerKitBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "void-walker", "void-walker-kit-balance").VoidWalkerKitBalance;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local GameWorldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
local isUsingKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local VoidWalkerRewindUI = RuntimeLib.import(script, script.Parent, "ui", "void-walker-kit-rewind-ui").VoidWalkerRewindUI;
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 44, Name: __tostring
        return "VoidWalkerKitController";
    end,

    __index = BaseKitController
});
u8.__index = u8;

function u8.new(...) -- Line: 50
    -- upvalues: u8 (ref)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10) -- Line: 54
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), GameSound (copy), u4 (copy)
    BaseKitController.constructor(p10, BedwarsKit.VOID_WALKER, {
        sounds = {
            GameSound.VOID_WALKER_PORTAL_OPEN_1,
            GameSound.VOID_WALKER_PORTAL_OPEN_2,
            GameSound.VOID_WALKER_PORTAL_OPEN_3,
            GameSound.VOID_WALKER_PORTAL_CLOSE_1,
            GameSound.VOID_WALKER_PORTAL_CLOSE_2,
            GameSound.VOID_WALKER_PORTAL_CLOSE_3,
            GameSound.VOID_WALKER_WEE_1,
            GameSound.VOID_WALKER_HEHE,
            GameSound.VOID_WALKER_LAUGH,
            GameSound.VOID_WALKER_WOOHOO,
            GameSound.VOID_WALKER_GIGGLE,
            GameSound.VOID_WALKER_WEE_2,
            GameSound.VOID_WALKER_UHH,
            GameSound.VOID_WALKER_SASSY_LAUGH,
            GameSound.VOID_WALKER_WOOP
        },
        imageIds = {},
        animations = {}
    });
    p10.Name = "VoidWalkerKitController";
    p10.mostRecentMovementDirection = Vector3.new(0, 0, 1);
    p10.playerBeamMap = {};
    p10.playerBeamDestinationMap = {};
    p10.playerBeamOriginOverrideMap = {};
    p10.warpDataMap = {};
    p10.playerWarpDataMap = {};
    p10.rewindUIMaid = u4.new();
    p10.rewindAbilityMaid = u4.new();
    p10.portalOpenSounds = { GameSound.VOID_WALKER_PORTAL_OPEN_1, GameSound.VOID_WALKER_PORTAL_OPEN_2, GameSound.VOID_WALKER_PORTAL_OPEN_3 };
    p10.portalCloseSounds = { GameSound.VOID_WALKER_PORTAL_CLOSE_1, GameSound.VOID_WALKER_PORTAL_CLOSE_2, GameSound.VOID_WALKER_PORTAL_CLOSE_3 };
    p10.harlequinWarpSounds = { GameSound.VOID_WALKER_LAUGH, GameSound.VOID_WALKER_WOOHOO, GameSound.VOID_WALKER_WOOP };
    p10.harlequinRewindSounds = { GameSound.VOID_WALKER_HEHE, GameSound.VOID_WALKER_GIGGLE };
    p10.portals = {};
    p10.portalVisualData = {};
end;

function u8.KnitStart(p11) -- Line: 76
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p11);
end;

function u8.onKitLocalActivated(u12, p13) -- Line: 79
    -- upvalues: ClientSyncEvents (copy), AbilityId (copy), EntityUtil (copy), RunService (copy), VoidWalkerKitBalance (copy), Players (copy), KnitClient (copy)
    p13:GiveTask(ClientSyncEvents.CanUseLocalAbility:connect(function(p14) -- Line: 81
        -- upvalues: AbilityId (ref), EntityUtil (ref)
        if p14.ability == AbilityId.VOID_WALKER_WARP or p14.ability == AbilityId.VOID_WALKER_REWIND then
            local v15 = EntityUtil:getEntity(p14.userCharacter);
            local v16;

            if v15 == nil then
                v16 = v15;
            else
                v16 = v15:isAlive();
            end;

            if not v16 then
                p14:setCancelled(true);

                return nil;
            end;

            if not v15:getInstance() then
                p14:setCancelled(true);
            end;
        end;
    end));
    p13:GiveTask(RunService.Heartbeat:Connect(function(p17) -- Line: 108
        -- upvalues: VoidWalkerKitBalance (ref), u12 (copy), Players (ref), KnitClient (ref)
        if not VoidWalkerKitBalance.WARP_USES_CAMERA_DIRECTION then
            local v18 = not u12.humanoid;

            if not v18 then
                local humanoid = u12.humanoid;

                if humanoid ~= nil then
                    humanoid = humanoid.Parent;
                end;

                v18 = humanoid == nil;
            end;

            if v18 then
                local Character = Players.LocalPlayer.Character;

                if Character ~= nil then
                    Character = Character:FindFirstChildOfClass("Humanoid");
                end;

                u12.humanoid = Character;

                if not u12.humanoid then
                    return nil;
                end;
            end;

            local MoveDirection = u12.humanoid.MoveDirection;

            if MoveDirection and MoveDirection.Magnitude > 0.2 then
                u12.mostRecentMovementDirection = MoveDirection;
            end;
        end;

        local function _(p19, p20) -- Line: 136
            -- upvalues: u12 (ref)
            u12:updateBeamPosition(p20);
        end;

        for i, _ in u12.playerBeamDestinationMap do
            u12:updateBeamPosition(i);
        end;

        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;
        end;

        if Character and KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
            local function _(p21) -- Line: 151
                -- upvalues: u12 (ref), Character (copy)
                if p21 == nil or (p21.Parent == nil or not p21.PrimaryPart) then
                    return nil;
                end;

                u12:checkPortalVisibility(p21, Character.Position);
            end;

            for i, v in u12.portals do
                local _ = i - 1;

                if v ~= nil and v.Parent ~= nil then
                    if v.PrimaryPart then
                        u12:checkPortalVisibility(v, Character.Position);
                    end;
                end;
            end;
        end;
    end));
end;

function u8.onKitLocalDeactivated(p22) -- Line: 171
end;

function u8.onKitReplicationActivated(u23, p24) -- Line: 173
    -- upvalues: default2 (copy), CharacterUtil (copy), Workspace (copy), BedwarsKitSkin (copy), RandomUtil (copy), SoundManager (copy)
    default2.Client:Get("VoidWalker_UseWarpAbility"):Connect(function(p25) -- Line: 174
        -- upvalues: u23 (copy)
        u23:useWarpAbility(p25.player, p25.uuid, p25.startPosition, p25.endPosition, p25.warpStartTime, p25.warpEndTime);
    end);
    default2.Client:Get("VoidWalker_DisableRewind"):Connect(function(p26) -- Line: 177
        -- upvalues: u23 (copy)
        local v27 = u23.warpDataMap[p26.uuid];

        if not v27 then
            return nil;
        end;

        v27.maid:DoCleaning();
    end);
    default2.Client:Get("VoidWalker_CleanupRewind"):Connect(function(p28) -- Line: 186
        -- upvalues: u23 (copy)
        u23:cleanupRewind(p28.player);
    end);
    default2.Client:Get("VoidWalker_Rewind"):Connect(function(u29) -- Line: 189
        -- upvalues: CharacterUtil (ref), Workspace (ref), u23 (copy), BedwarsKitSkin (ref), RandomUtil (ref), SoundManager (ref)
        local v30 = CharacterUtil.getPlayerCameraFocusPosition(u29.player) or u29.startPosition;
        local v31 = CharacterUtil.getPlayerCameraFocusOffsetHeight(u29.player);
        local v32 = u29.endPosition + Vector3.new(0, v31 == nil and 0 or v31, 0);
        local v33 = u29.endTime - Workspace:GetServerTimeNow();
        local v34 = v33 <= 0 and 0.5 or v33;
        task.delay(v34, function() -- Line: 204
            -- upvalues: u23 (ref), u29 (copy)
            local function _(p35) -- Line: 206
                -- upvalues: u29 (ref), u23 (ref)
                if p35.player == u29.player then
                    p35.maid:DoCleaning();
                    u23.warpDataMap[p35.uuid] = nil;
                    u23.playerWarpDataMap[u29.player] = nil;
                end;
            end;

            for _, v in u23.warpDataMap do
                if v.player == u29.player then
                    v.maid:DoCleaning();
                    u23.warpDataMap[v.uuid] = nil;
                    u23.playerWarpDataMap[u29.player] = nil;
                end;
            end;
        end);
        u23:cleanupRewind(u29.player);
        u23:createPortal(v30, 0.5, true, u23:getPlayerSkin(u29.player));
        u23:teleportPlayer(u29.player, v30, v32, v34, true);
        u23:playPortalOpenSound(v30, u23:getPlayerSkin(u29.player));

        if u23:getPlayerSkin(u29.player) == BedwarsKitSkin.VOID_WALKER_HARLEQUIN then
            local v36 = RandomUtil.fromList(unpack(u23.harlequinRewindSounds));
            SoundManager:playSound(v36, {
                position = v30
            });
            SoundManager:playSound(v36, {
                position = v32
            });
        end;
    end);
end;

function u8.onKitReplicationDeactivated(p37) -- Line: 240
end;

function u8.onInnateAbilityEnabled(p38, p39, p40) -- Line: 242
end;

function u8.onAbilityUsed(p41, p42, p43) -- Line: 244
    -- upvalues: EntityUtil (copy), Players (copy), isUsingKit (copy), BedwarsKit (copy), AbilityId (copy), VoidWalkerKitBalance (copy), Workspace (copy), GameWorldUtil (copy), default2 (copy)
    local v44 = EntityUtil:getPlayerFromEntityInstance(p43.userCharacter);

    if not v44 then
        return nil;
    end;

    if v44 ~= Players.LocalPlayer then
        return nil;
    end;

    if not isUsingKit(v44, BedwarsKit.VOID_WALKER) then
        return nil;
    end;

    local Character = v44.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return nil;
    end;

    if p43.ability == AbilityId.VOID_WALKER_WARP then
        local v45;

        if VoidWalkerKitBalance.WARP_USES_CAMERA_DIRECTION then
            local CurrentCamera = Workspace.CurrentCamera;

            if not CurrentCamera then
                return nil;
            end;

            v45 = CurrentCamera.CFrame.LookVector;

            if not v45 then
                return nil;
            end;

            if v45.Magnitude == 0 then
                return nil;
            end;
        else
            local mostRecentMovementDirection = p41.mostRecentMovementDirection;
            v45 = Vector3.new(mostRecentMovementDirection.X, 0, mostRecentMovementDirection.Z).Unit;
        end;

        local Unit = v45.Unit;
        local v46 = Character + Unit * VoidWalkerKitBalance.WARP_DISTANCE;
        local v47 = GameWorldUtil.raycastWithOnlyWorldCollision(Character, Unit, VoidWalkerKitBalance.WARP_DISTANCE);

        if v47 then
            v46 = v47.Position;
        end;

        default2.Client:Get("VoidWalker_ClientUsedWarpAbility"):SendToServer({
            clientStartPosition = Character,
            direction = Unit,
            clientDestinationPosition = v46
        });
    end;
end;

function u8.useWarpAbility(u48, u49, u50, u51, u52, u53, u54) -- Line: 333
    -- upvalues: Players (copy), Flamework (copy), u6 (copy), VoidWalkerRewindUI (copy), VoidWalkerKitBalance (copy), Workspace (copy), CharacterUtil (copy), KnitClient (copy), u4 (copy), BedwarsKitSkin (copy), RandomUtil (copy), SoundManager (copy), AbilityId (copy), BedwarsImageId (copy)
    task.spawn(function() -- Line: 334
        -- upvalues: u49 (copy), Players (ref), u48 (copy), Flamework (ref), u6 (ref), VoidWalkerRewindUI (ref), u53 (copy), u54 (copy), VoidWalkerKitBalance (ref), Workspace (ref), CharacterUtil (ref), u51 (copy), u52 (copy), KnitClient (ref), u4 (ref), u50 (copy), BedwarsKitSkin (ref), RandomUtil (ref), SoundManager (ref), AbilityId (ref), BedwarsImageId (ref)
        if u49 == Players.LocalPlayer then
            if u48.rewindUIMaid then
                u48.rewindUIMaid:DoCleaning();
            end;

            u48.rewindUIMaid = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u6.createElement(VoidWalkerRewindUI, {
                HideOnComplete = true,
                Size = UDim2.fromScale(0.3, 0.03),
                StartTime = u53,
                EndTime = u54 + VoidWalkerKitBalance.REWIND_AVAILABILITY_DURATION,
                ProgressBarConfig = {
                    Flip = true,
                    GradientRotation = 0,
                    BarGradient = ColorSequence.new(Color3.fromRGB(153, 38, 199), Color3.fromRGB(99, 232, 255))
                }
            }));
        end;

        local Character = u49.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;
        end;

        local v55 = u54 - Workspace:GetServerTimeNow();
        local u56 = CharacterUtil.getPlayerCameraFocusPosition(u49) or u51;
        local v57 = CharacterUtil.getPlayerCameraFocusOffsetHeight(u49);
        local u58 = v57 == nil and 0 or v57;
        local u59 = u52 + Vector3.new(0, u58, 0);

        local function _(p60) -- Line: 373
            -- upvalues: u49 (ref), u48 (ref)
            if p60.player == u49 then
                p60.maid:DoCleaning();
                u48.warpDataMap[p60.uuid] = nil;
            end;
        end;

        for _, v in u48.warpDataMap do
            if v.player == u49 then
                v.maid:DoCleaning();
                u48.warpDataMap[v.uuid] = nil;
            end;
        end;

        local u61;

        if VoidWalkerKitBalance.WARP_CREATES_FIRST_PORTAL then
            u61 = u48:createPortal(u56, 0.5, true, u48:getPlayerSkin(u49));
        else
            u61 = nil;
        end;

        if u61 ~= nil then
            table.insert(u48.portals, u61);

            if KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
                u48:setPortalHiddenState(u61, true);
            end;
        end;

        local v62 = u54 - Workspace:GetServerTimeNow() + VoidWalkerKitBalance.REWIND_AVAILABILITY_DURATION;
        local u63 = u48:createPortal(u59, math.max(1, v62), false, u48:getPlayerSkin(u49));

        if KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
            u48:setPortalHiddenState(u63, true);
        end;

        table.insert(u48.portals, u63);
        local v64 = u4.new();
        local v65 = {
            rewindTrail = nil,
            rewindTrailMaid = nil,
            uuid = u50,
            player = u49,
            portal1 = u61,
            portal2 = u63,
            maid = v64,
            rewindPoints = { u52 },
            nextRewindPointCaptureTime = time() + v55 + 0.1
        };
        u48.warpDataMap[u50] = v65;
        u48.playerWarpDataMap[u49] = v65;

        if u48:getPlayerSkin(u49) == BedwarsKitSkin.VOID_WALKER_HARLEQUIN then
            local v66 = RandomUtil.fromList(unpack(u48.harlequinWarpSounds));
            SoundManager:playSound(v66, {
                position = u56
            });
            SoundManager:playSound(v66, {
                position = u59
            });
        end;

        if Character then
            Character.AssemblyLinearVelocity = Vector3.new(0, 0, 0);
        end;

        v64:GiveTask(function() -- Line: 443
            -- upvalues: u61 (copy), u48 (ref), u56 (copy), u49 (ref), u63 (copy), u59 (copy)
            local v67 = u61;

            if v67 then
                local v68 = u61;

                if v68 ~= nil then
                    v68 = v68.Parent;
                end;

                v67 = v68 ~= nil;
            end;

            if v67 then
                u48:playPortalCloseSound(u56, u48:getPlayerSkin(u49));
                u61:Destroy();
                local v69 = (table.find(u48.portals, u61) or 0) - 1;

                if v69 > -1 then
                    table.remove(u48.portals, v69 + 1);
                end;
            end;

            local v70 = u63;

            if v70 then
                local v71 = u63;

                if v71 ~= nil then
                    v71 = v71.Parent;
                end;

                v70 = v71 ~= nil;
            end;

            if v70 then
                u48:playPortalCloseSound(u59, u48:getPlayerSkin(u49));
                u63:Destroy();
                local v72 = (table.find(u48.portals, u63) or 0) - 1;

                if v72 > -1 then
                    table.remove(u48.portals, v72 + 1);
                end;
            end;
        end);
        u48:disablePlayerBeam(u49);
        u48:teleportPlayer(u49, u56, u59, v55);
        task.delay(v55, function() -- Line: 482
            -- upvalues: u48 (ref), u49 (ref), u52 (ref), u58 (copy), Players (ref), Flamework (ref), AbilityId (ref), BedwarsImageId (ref)
            local v73 = u48:getPlayerBeam(u49);
            u48.playerBeamDestinationMap[u49] = u52 + Vector3.new(0, u58, 0);
            u48:updateBeamPosition(u49);
            u48:enableBeam(v73);

            if u49 == Players.LocalPlayer then
                if u48.rewindAbilityMaid then
                    u48.rewindAbilityMaid:DoCleaning();
                end;

                Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.VOID_WALKER_REWIND, {
                    abilityType = "KitSecondary",
                    abilityButton = {
                        icon = BedwarsImageId.VOID_WALKER_REWIND_ICON
                    }
                }):andThen(function(p74) -- Line: 505
                    -- upvalues: u48 (ref)
                    u48.rewindAbilityMaid:GiveTask(p74);
                end);
            end;
        end);
        task.delay(u54 - Workspace:GetServerTimeNow() + VoidWalkerKitBalance.REWIND_AVAILABILITY_DURATION, function() -- Line: 516
            -- upvalues: u48 (ref), u49 (ref), u50 (ref), Players (ref)
            local v75 = u48.playerWarpDataMap[u49];

            if v75 and v75.uuid == u50 then
                u48:disablePlayerBeam(u49);

                if v75.rewindTrailMaid then
                    v75.rewindTrailMaid:DoCleaning();
                end;

                if u49 == Players.LocalPlayer and u48.rewindAbilityMaid then
                    u48.rewindAbilityMaid:DoCleaning();
                end;

                u48.playerWarpDataMap[u49] = nil;
            end;
        end);
    end);
end;

function u8.createPortal(u76, u77, u78, p79, u80) -- Line: 539
    -- upvalues: BedwarsKitSkin (copy), ReplicatedStorage (copy), CFrameUtil (copy), Workspace (copy), RunService (copy), default (copy), InQuad (copy), MathExtras (copy)
    local v81 = u80 == BedwarsKitSkin.VOID_WALKER_HARLEQUIN;
    local u82;

    if p79 then
        if v81 then
            u82 = ReplicatedStorage.Assets.Misc.VoidWalker_Harlequin_Portal_Spirit:Clone();
        else
            u82 = ReplicatedStorage.Assets.Misc.VoidWalker_Portal_Spirit:Clone();
        end;
    elseif v81 then
        u82 = ReplicatedStorage.Assets.Misc.VoidWalker_Harlequin_Portal_Void:Clone();
    else
        u82 = ReplicatedStorage.Assets.Misc.VoidWalker_Portal_Void:Clone();
    end;

    u82:PivotTo(CFrame.new(u77));
    CFrameUtil.billboardToCameraOnlyOnYAxis(u82, 90);
    u82:ScaleTo(0.01);
    u82.Parent = Workspace;
    task.spawn(function() -- Line: 547
        -- upvalues: u76 (copy), u77 (copy), u80 (copy), RunService (ref), u82 (copy), CFrameUtil (ref), default (ref), InQuad (ref), MathExtras (ref), u78 (copy)
        u76:playPortalOpenSound(u77, u80);
        local u83 = nil;
        u83 = RunService.Heartbeat:Connect(function(p84) -- Line: 552
            -- upvalues: u82 (ref), u83 (ref), CFrameUtil (ref)
            if u82 and u82.Parent ~= nil then
                CFrameUtil.billboardToCameraOnlyOnYAxis(u82, 90);
            elseif u83.Connected then
                u83:Disconnect();
            end;
        end);
        default(0.2, InQuad, function(p85) -- Line: 562
            -- upvalues: u82 (ref), MathExtras (ref)
            if not u82 or u82.Parent == nil then
                return nil;
            end;

            u82:ScaleTo((MathExtras:lerp(0.01, 1, p85)));
        end, 0, 1);
        task.delay(u78, function() -- Line: 570
            -- upvalues: u82 (ref), u76 (ref), u77 (ref), u80 (ref), default (ref), InQuad (ref), MathExtras (ref), u83 (ref)
            if not u82 or u82.Parent == nil then
                return nil;
            end;

            u76:playPortalCloseSound(u77, u80);
            default(0.2, InQuad, function(p86) -- Line: 576
                -- upvalues: u82 (ref), MathExtras (ref)
                if not u82 or u82.Parent == nil then
                    return nil;
                end;

                u82:ScaleTo((MathExtras:lerp(1, 0.01, p86)));
            end, 0, 1):Wait();

            if u83.Connected then
                u83:Disconnect();
            end;

            if u82 and u82.Parent ~= nil then
                u82:Destroy();
            end;

            local v87 = (table.find(u76.portals, u82) or 0) - 1;

            if v87 > -1 then
                table.remove(u76.portals, v87 + 1);
            end;
        end);
    end);

    return u82;
end;

function u8.teleportPlayer(u88, u89, u90, u91, u92, u93) -- Line: 600
    -- upvalues: u5 (copy), Workspace (copy), Players (copy), ClientStore (copy), default (copy), Linear (copy), InOutQuad (copy), CharacterUtil (copy)
    if u93 == nil then
        u93 = false;
    end;

    task.spawn(function() -- Line: 604
        -- upvalues: u90 (copy), u5 (ref), Workspace (ref), u88 (copy), u89 (copy), Players (ref), ClientStore (ref), default (ref), u92 (copy), Linear (ref), u91 (copy), InOutQuad (ref), CharacterUtil (ref), u93 (ref)
        local u94 = u90;
        local u95 = u5("Part", {
            Size = Vector3.new(1, 1, 1),
            Anchored = true,
            CanCollide = false,
            Transparency = 1,
            CFrame = CFrame.new(u94),
            Parent = Workspace
        });
        u88.playerBeamOriginOverrideMap[u89] = u95;
        u88.playerBeamOriginOverrideMap[u89] = u95;

        if u89 == Players.LocalPlayer then
            local CurrentCamera = Workspace.CurrentCamera;

            if u95 and CurrentCamera then
                CurrentCamera.CameraSubject = u95;
            end;

            ClientStore:dispatch({
                type = "UnequipItemInHand",
                equip = false
            });
        end;

        default(u92, Linear, function(p96) -- Line: 635
            -- upvalues: u95 (copy), u94 (copy), u91 (ref)
            u95:PivotTo(CFrame.new(u94):Lerp(CFrame.new(u91), p96));
        end):Wait();

        if u89 == Players.LocalPlayer then
            ClientStore:dispatch({
                type = "UnequipItemInHand",
                equip = true
            });
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character:FindFirstChildOfClass("Humanoid");
            end;

            local v97;

            if Character == nil then
                v97 = Character;
            else
                v97 = Character.RootPart;
            end;

            if v97 then
                local u98 = CFrame.new(u95.Position);
                local u99 = nil;
                u99 = default(0.2, InOutQuad, function(p100) -- Line: 657
                    -- upvalues: Character (copy), u99 (ref), CharacterUtil (ref), u95 (copy), u98 (copy)
                    local v101 = Character;

                    if v101 ~= nil then
                        v101 = v101.RootPart;
                    end;

                    if not v101 then
                        u99:Cancel();

                        return nil;
                    end;

                    local v102 = CharacterUtil.getHumanoidCameraFocusPosition(Character);

                    if not v102 then
                        return nil;
                    end;

                    u95:PivotTo(u98:Lerp(CFrame.new(v102), p100));
                end):Wait();
                Workspace.CurrentCamera.CameraSubject = Character;
            end;
        end;

        u95:Destroy();
        u88.playerBeamOriginOverrideMap[u89] = nil;

        if u93 then
            u88:disablePlayerBeam(u89);
        end;
    end);
end;

function u8.getPlayerBeam(p103, p104) -- Line: 687
    -- upvalues: ReplicatedStorage (copy), Workspace (copy)
    local v105 = p103.playerBeamMap[p104];

    if v105 and v105.Parent ~= nil then
        return v105;
    end;

    local v106 = ReplicatedStorage.Assets.Misc.VoidWalker_Beam:Clone();
    v106.Parent = Workspace;
    p103.playerBeamMap[p104] = v106;

    return v106;
end;

function u8.enableBeam(p107, p108) -- Line: 703
    local function _(p109) -- Line: 705
        return p109:IsA("Beam");
    end;

    local v110 = 0;
    local v111 = {};

    for i, descendant in p108:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("Beam") == true then
            v110 = v110 + 1;
            v111[v110] = descendant;
        end;
    end;

    for _, v in v111 do
        v.Enabled = true;
    end;
end;

function u8.disableBeam(p112, p113) -- Line: 723
    local function _(p114) -- Line: 725
        return p114:IsA("Beam");
    end;

    local v115 = 0;
    local v116 = {};

    for i, descendant in p113:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("Beam") == true then
            v115 = v115 + 1;
            v116[v115] = descendant;
        end;
    end;

    for _, v in v116 do
        v.Enabled = false;
    end;
end;

function u8.enablePlayerBeam(p117, p118) -- Line: 743
    local v119 = p117.playerBeamMap[p118];

    if not v119 then
        return nil;
    end;

    p117:enableBeam(v119);
end;

function u8.disablePlayerBeam(p120, p121) -- Line: 752
    local v122 = p120.playerBeamMap[p121];

    if not v122 then
        return nil;
    end;

    p120:disableBeam(v122);
end;

function u8.deleteBeamDestination(p123, p124) -- Line: 761
    p123.playerBeamDestinationMap[p124] = nil;
end;

function u8.updateBeamPosition(p125, p126) -- Line: 766
    -- upvalues: CharacterUtil (copy)
    local v127 = p125.playerBeamMap[p126];

    if not v127 then
        return nil;
    end;

    local v128 = p125.playerBeamDestinationMap[p126];

    if not v128 then
        return nil;
    end;

    local v129 = p125.playerBeamOriginOverrideMap[p126];
    local v130;

    if v129 and v129.Parent ~= nil then
        v130 = p125.playerBeamOriginOverrideMap[p126];

        if v130 ~= nil then
            local Position = v130.Position;
            local v131 = CharacterUtil.getPlayerCameraFocusOffsetHeight(p126);
            v130 = Position - Vector3.new(0, v131, 0);
        end;
    else
        v130 = p126.Character;

        if v130 ~= nil then
            v130 = v130.PrimaryPart;

            if v130 ~= nil then
                v130 = v130.Position;
            end;
        end;
    end;

    if not v130 then
        return nil;
    end;

    v127.BeamPoint1:PivotTo(CFrame.new(v130));
    v127.BeamPoint2:PivotTo(CFrame.new(v128));
end;

function u8.destroyAllPortalsForPlayer(p132, u133) -- Line: 809
    -- upvalues: u2 (copy)
    local function _(p134) -- Line: 811
        -- upvalues: u133 (copy)
        return p134.player == u133;
    end;

    local v135 = 0;
    local v136 = {};

    for i, v in u2.values(p132.warpDataMap) do
        local _ = i - 1;

        if v.player == u133 == true then
            v135 = v135 + 1;
            v136[v135] = v;
        end;
    end;

    for _, v in v136 do
        v.maid:DoCleaning();
        p132.warpDataMap[v.uuid] = nil;
    end;
end;

function u8.playPortalOpenSound(p137, p138, p139) -- Line: 832
    -- upvalues: RandomUtil (copy), SoundManager (copy)
    SoundManager:playSound(RandomUtil.fromList(unpack(p137.portalOpenSounds)), {
        position = p138
    });
end;

function u8.playPortalCloseSound(p140, p141, p142) -- Line: 838
    -- upvalues: RandomUtil (copy), SoundManager (copy)
    SoundManager:playSound(RandomUtil.fromList(unpack(p140.portalCloseSounds)), {
        position = p141
    });
end;

function u8.checkPortalVisibility(p143, p144, p145) -- Line: 844
    if not p144.PrimaryPart then
        return nil;
    end;

    local v146 = p143.portalVisualData[p144];

    if v146 == nil then
        v146 = {
            isHidden = false
        };
        p143.portalVisualData[p144] = v146;
    end;

    local Magnitude = (p144.PrimaryPart.Position - p145).Magnitude;

    if Magnitude >= 10 or v146.isHidden then
        if Magnitude >= 10 and v146.isHidden then
            v146.isHidden = false;
            p143:setPortalHiddenState(p144, false);
        end;

        return;
    end;

    v146.isHidden = true;
    p143:setPortalHiddenState(p144, true);
end;

function u8.setPortalHiddenState(p147, p148, p149) -- Line: 871
    if p149 then
        local v150 = p148:GetDescendants();

        local function v152(p151) -- Line: 874
            if p151:IsA("MeshPart") then
                p151.Transparency = 0.8;

                return;
            end;

            if p151:IsA("Decal") then
                p151.Transparency = 1;

                return;
            end;

            if p151:IsA("ParticleEmitter") then
                p151.Enabled = false;

                return;
            end;

            if p151:IsA("Beam") then
                p151.Enabled = false;
            end;
        end;

        for i, v in v150 do
            v152(v, i - 1, v150);
        end;

        return;
    end;

    local v153 = p148:GetDescendants();

    local function v155(p154) -- Line: 899
        if p154:IsA("MeshPart") then
            p154.Transparency = 0;

            return;
        end;

        if p154:IsA("Decal") then
            p154.Transparency = 0.65;

            return;
        end;

        if p154:IsA("ParticleEmitter") then
            p154.Enabled = true;

            return;
        end;

        if p154:IsA("Beam") then
            p154.Enabled = true;
        end;
    end;

    for i, v in v153 do
        v155(v, i - 1, v153);
    end;
end;

function u8.cleanupRewind(p156, p157) -- Line: 924
    -- upvalues: Players (copy)
    p156:disablePlayerBeam(p157);

    if p157 == Players.LocalPlayer then
        if p156.rewindAbilityMaid then
            p156.rewindAbilityMaid:DoCleaning();
        end;

        if p156.rewindUIMaid then
            p156.rewindUIMaid:DoCleaning();
        end;
    end;

    p156.playerWarpDataMap[p157] = nil;
end;

function u8.getPlayerSkin(p158, p159) -- Line: 939
    -- upvalues: KnitClient (copy)
    if p159.Character then
        return KnitClient.Controllers.KitSkinController:getKitSkin(p159.Character);
    end;

    return nil;
end;

KnitClient.CreateController(u8.new());

return nil;