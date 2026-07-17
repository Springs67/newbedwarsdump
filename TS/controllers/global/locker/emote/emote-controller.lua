-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local ExpireList = v1.ExpireList;
local preloadImages = v1.preloadImages;
local SoundManager = v1.SoundManager;
local WatchPlayer = v1.WatchPlayer;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContentProvider = v6.ContentProvider;
local Players = v6.Players;
local RunService = v6.RunService;
local UserInputService = v6.UserInputService;
local u7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils");
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local KeybindDefaults = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "keybind", "keybind-defaults").KeybindDefaults;
local EmoteDisplayMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-display-meta").EmoteDisplayMeta;
local EmoteMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Setting = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local EmoteShowcase = RuntimeLib.import(script, script.Parent.Parent.Parent, "battle-pass", "ui", "RewardShowcase", "emote-showcase").EmoteShowcase;
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 43, Name: __tostring
        return "EmoteController";
    end,

    __index = KnitController
});
u8.__index = u8;

function u8.new(...) -- Line: 49
    -- upvalues: u8 (copy)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10) -- Line: 53
    -- upvalues: KnitController (copy), ExpireList (copy)
    KnitController.constructor(p10);
    p10.Name = "EmoteController";
    p10.emoteSoundMaid = {};
    p10.joinEmotePromptMaid = {};
    p10.joinEmotePromptMap = {};
    p10.emoteCooldowns = ExpireList.new(2);
    p10.emoteHandItemMaid = {};
    p10.emoteMaids = {};
    p10.emoteSoundMap = {};
    p10.emoteAllowed = true;
end;

function u8.KnitStart(u11) -- Line: 65
    -- upvalues: WatchPlayer (copy), Players (copy), EmoteMeta (copy), Flamework (copy), u7 (copy), u3 (copy), EmoteType (copy), u5 (copy), EmoteShowcase (copy), KnitClient (copy), ClientStore (copy), preloadImages (copy), BedwarsImageId (copy), default (copy), GameAnimationUtil (copy)
    WatchPlayer(function(p12) -- Line: 66
        -- upvalues: Players (ref), u11 (copy), EmoteMeta (ref)
        if p12.UserId ~= Players.LocalPlayer.UserId then
            return nil;
        end;

        local function _(p13) -- Line: 71
            -- upvalues: u11 (ref), EmoteMeta (ref), Players (ref)
            local v14 = u11:getPlayingEmote(p13);

            if not v14 then
                return nil;
            end;

            if EmoteMeta[v14].joinable and p13 ~= Players.LocalPlayer then
                u11:setupEmoteJoinPrompt(p13, v14);
            end;
        end;

        for i, v in Players:GetPlayers() do
            local _ = i - 1;
            local v15 = u11:getPlayingEmote(v);

            if v15 then
                if EmoteMeta[v15].joinable and v ~= Players.LocalPlayer then
                    u11:setupEmoteJoinPrompt(v, v15);
                end;
            end;
        end;
    end);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        actionId = "spray-keyboard",
        action = "Emote",

        boundFunction = function(p16, p17, p18) -- Line: 90, Name: boundFunction
            -- upvalues: u11 (copy), Players (ref), u7 (ref), u3 (ref), EmoteType (ref), u5 (ref), EmoteShowcase (ref), EmoteMeta (ref), KnitClient (ref)
            if not u11:canEmote() then
                return nil;
            end;

            if p17 == Enum.UserInputState.Begin then
                local v19 = {};

                for i, v in Players.LocalPlayer:GetAttributes() do
                    if u7.startsWith(i, "EmoteTypeSlot") and table.find(u3.values(EmoteType), v) ~= nil then
                        v19[tonumber(u7.slice(i, #i - 1))] = {
                            element = u5.createElement(EmoteShowcase, {
                                Emote = v
                            }),
                            title = EmoteMeta[v].name,

                            onSelect = function() -- Line: 114, Name: onSelect
                                -- upvalues: u11 (ref), v (copy), KnitClient (ref)
                                u11:emote(v);
                                KnitClient.Controllers.RadialWheelController:closeRadialWheel();
                            end
                        };
                    end;
                end;

                local v20 = false;
                local v21 = 1;

                while true do
                    if true then
                        if v20 then
                            v21 = v21 + 1;
                        else
                            v20 = true;
                        end;
                    end;

                    if v21 > 8 then
                        break;
                    end;

                    if v19[v21] == nil then
                        v19[v21] = {
                            title = "",
                            element = u5.createElement(EmoteShowcase, {
                                Emote = EmoteType.NONE
                            }),

                            onSelect = function() -- Line: 141, Name: onSelect
                                -- upvalues: KnitClient (ref)
                                KnitClient.Controllers.RadialWheelController:closeRadialWheel();
                            end
                        };
                    end;
                end;

                local RadialWheelController = KnitClient.Controllers.RadialWheelController;
                local v22 = u3.values(v19);
                local v23;

                if p18 == nil then
                    v23 = p18;
                else
                    v23 = p18.Position.X;
                end;

                local v24;

                if p18 == nil then
                    v24 = p18;
                else
                    v24 = p18.Position.Y;
                end;

                RadialWheelController:openRadialWheel(v22, 8, p18, true, UDim2.fromOffset(v23, v24), nil);
            end;
        end
    });
    u11:preloadEmote();
    ClientStore.changed:connect(function(p25, p26) -- Line: 166
        -- upvalues: u11 (copy), u3 (ref), EmoteType (ref), preloadImages (ref), BedwarsImageId (ref)
        if p25.Locker.selectedEmotes ~= p26.Locker.selectedEmotes then
            u11:preloadEmote();
            local v27 = u3.values(p25.Locker.selectedEmotes);

            if table.find(v27, EmoteType.ROCK_PAPER_SCISSORS) ~= nil then
                preloadImages({ BedwarsImageId.HAND_FIST_ICON, BedwarsImageId.HAND_SCISSOR_ICON, BedwarsImageId.HAND_STOP_ICON });
            end;

            local v28 = u3.values(p25.Locker.selectedEmotes);

            if table.find(v28, EmoteType.COIN_TOSS) ~= nil then
                preloadImages({ BedwarsImageId.COIN_TOSS_SKULL, BedwarsImageId.COIN_TOSS_BONES });
            end;
        end;
    end);
    default.Client:OnEvent("EmotePlaying", function(p29, p30, p31, p32) -- Line: 181
        -- upvalues: Players (ref), u11 (copy), EmoteMeta (ref), GameAnimationUtil (ref)
        if Players.LocalPlayer == p29 or not p31 then
            u11:playEmoteBeginSounds(p30, p29, p32);
        end;

        local v33 = EmoteMeta[p30];

        if v33.joinable then
            if p29 == Players.LocalPlayer then
                u11:disableSameEmotePrompts(p29, p30);
            else
                u11:setupEmoteJoinPrompt(p29, p30);
            end;

            if p32 then
                local animation = v33.animation;

                if animation ~= nil then
                    animation = animation.type;
                end;

                if animation == 0 or (animation ~= animation or not animation) then
                    return nil;
                end;

                local v34 = GameAnimationUtil:getAssetId(animation);
                local v35 = false;
                local v36 = 0;

                while true do
                    if true then
                        if v35 then
                            v36 = v36 + 1;
                        else
                            v35 = true;
                        end;
                    end;

                    if v36 >= 5 or u11:syncAnimations(v34, p32, p29) then
                        break;
                    end;

                    task.wait(0.1);
                end;
            end;
        end;
    end);
    default.Client:OnEvent("EmoteEnding", function(p37, p38, p39) -- Line: 226
        -- upvalues: u11 (copy), Players (ref)
        local v40 = u11.emoteSoundMaid[p37.UserId];

        if v40 ~= nil then
            v40:DoCleaning();
        end;

        local v41 = u11.joinEmotePromptMaid[p37.UserId];

        if v41 ~= nil then
            v41:DoCleaning();
        end;

        if p37 == Players.LocalPlayer then
            u11:cleanupLocalEmoteCamera();

            local function _(p42, p43) -- Line: 247
                p42.Enabled = true;
            end;

            for _, v in u11.joinEmotePromptMap do
                v.Enabled = true;
            end;
        end;

        if not p39 then
            u11:playEmoteEndSounds(p38, p37);
        end;
    end);
end;

function u8.syncAnimations(p44, u45, p46, p47) -- Line: 260
    if p46 ~= nil then
        p46 = p46.Character;

        if p46 ~= nil then
            p46 = p46:FindFirstChildWhichIsA("Humanoid");

            if p46 ~= nil then
                p46 = p46:FindFirstChildWhichIsA("Animator");
            end;
        end;
    end;

    local v48;

    if p46 then
        local function _(p49) -- Line: 275
            -- upvalues: u45 (copy)
            local Animation = p49.Animation;

            if Animation ~= nil then
                Animation = Animation.AnimationId;
            end;

            return Animation == u45;
        end;

        v48 = nil;

        for i, v in p46:GetPlayingAnimationTracks() do
            local _ = i - 1;
            local Animation = v.Animation;

            if Animation ~= nil then
                Animation = Animation.AnimationId;
            end;

            if Animation == u45 == true then
                v48 = v;
                break;
            end;
        end;
    else
        v48 = nil;
    end;

    if p47 ~= nil then
        p47 = p47.Character;

        if p47 ~= nil then
            p47 = p47:FindFirstChildWhichIsA("Humanoid");

            if p47 ~= nil then
                p47 = p47:FindFirstChildWhichIsA("Animator");
            end;
        end;
    end;

    local v50;

    if p47 then
        local function _(p51) -- Line: 307
            -- upvalues: u45 (copy)
            local Animation = p51.Animation;

            if Animation ~= nil then
                Animation = Animation.AnimationId;
            end;

            return Animation == u45;
        end;

        v50 = nil;

        for i, v in p47:GetPlayingAnimationTracks() do
            local _ = i - 1;
            local Animation = v.Animation;

            if Animation ~= nil then
                Animation = Animation.AnimationId;
            end;

            if Animation == u45 == true then
                v50 = v;
                break;
            end;
        end;
    else
        v50 = nil;
    end;

    if not (v48 and v50) then
        return false;
    end;

    v50.TimePosition = v48.TimePosition;

    return true;
end;

function u8.emote(u52, u53, p54) -- Line: 331
    -- upvalues: EmoteType (copy), u4 (copy), Players (copy), EmoteMeta (copy), default (copy), EmoteDisplayMeta (copy), GameAnimationUtil (copy), ClientSyncEvents (copy), RunService (copy), SyncEventPriority (copy), UserInputService (copy)
    if u53 == EmoteType.NONE then
        return nil;
    end;

    if not u52:canEmote() then
        return nil;
    end;

    local u55 = u4.new();
    local LocalPlayer = Players.LocalPlayer;
    local u56 = EmoteMeta[u53];

    if u52.emoteCooldowns:has(LocalPlayer.UserId) then
        return nil;
    end;

    u52.emoteCooldowns:add(LocalPlayer.UserId);
    local v57 = u52.emoteMaids[LocalPlayer.UserId];

    if v57 ~= nil then
        v57:DoCleaning();
    end;

    if not default.Client:Get("Emote"):CallServer({
        emoteType = u53,
        referencePlayer = p54
    }) then
        u55:DoCleaning();

        return nil;
    end;

    u52:setupLocalEmoteCamera(u55);
    local animation = u56.animation;

    if u56.emoteDisplayType ~= nil and not animation then
        animation = EmoteDisplayMeta[u56.emoteDisplayType].animation;
    end;

    if animation then
        local u58 = GameAnimationUtil:getAssetId(animation.type);

        if p54 ~= nil then
            p54 = p54.Character;

            if p54 ~= nil then
                p54 = p54:FindFirstChildWhichIsA("Humanoid");

                if p54 ~= nil then
                    p54 = p54:FindFirstChildWhichIsA("Animator");
                end;
            end;
        end;

        local v59;

        if p54 then
            local function _(p60) -- Line: 384
                -- upvalues: u58 (copy)
                local Animation = p60.Animation;

                if Animation ~= nil then
                    Animation = Animation.AnimationId;
                end;

                return Animation == u58;
            end;

            v59 = nil;

            for i, v in p54:GetPlayingAnimationTracks() do
                local _ = i - 1;
                local Animation = v.Animation;

                if Animation ~= nil then
                    Animation = Animation.AnimationId;
                end;

                if Animation == u58 == true then
                    v59 = v;
                    break;
                end;
            end;
        else
            v59 = nil;
        end;

        local Character = LocalPlayer.Character;

        if Character then
            if v59 ~= nil then
                v59 = v59.TimePosition;
            end;

            u55:GiveTask((u52:playEmoteAnimation(LocalPlayer.UserId, Character, animation, u53, v59)));
            u52.emoteMaids[LocalPlayer.UserId] = u55;
            u55:GiveTask(function() -- Line: 417
                -- upvalues: u52 (copy), LocalPlayer (copy)
                u52.emoteMaids[LocalPlayer.UserId] = nil;
            end);
        end;
    end;

    u55:GiveTask(function() -- Line: 425
        -- upvalues: ClientSyncEvents (ref), default (ref), u53 (copy)
        ClientSyncEvents.CancelEmoteEvent:fire();
        default.Client:Get("EmoteCancelled"):CallServer({
            emoteType = u53
        });
    end);
    local Character = LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    local u61;

    if Character == nil then
        u61 = Character;
    else
        u61 = Character.Position;
    end;

    u55:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 441
        -- upvalues: u56 (copy), Character (copy), u55 (copy), u61 (copy)
        if u56.allowMovement then
            return nil;
        end;

        local v62 = Character;

        if v62 ~= nil then
            v62 = v62.Parent;
        end;

        if not v62 then
            u55:DoCleaning();

            return nil;
        end;

        if not u61 or (Character.Position - u61).Magnitude > 0.6 then
            u55:DoCleaning();
        end;
    end));

    if u56.allowMovement then
        u55:GiveTask(ClientSyncEvents.SwordSwing:connect(function(p63) -- Line: 458
            -- upvalues: u55 (copy)
            u55:DoCleaning();
        end));
        u55:GiveTask(ClientSyncEvents.SwordChargedSwing:connect(function(p64) -- Line: 461
            -- upvalues: u55 (copy)
            u55:DoCleaning();
        end));
        u55:GiveTask(ClientSyncEvents.AbilityUsed:setPriority(SyncEventPriority.HIGHEST):connect(function(p65) -- Line: 464
            -- upvalues: Players (ref), u55 (copy)
            if p65.userCharacter ~= Players.LocalPlayer.Character then
                return nil;
            end;

            u55:DoCleaning();
        end));
        u55:GiveTask(ClientSyncEvents.BeginProjectileTargeting:connect(function(p66) -- Line: 470
            -- upvalues: u55 (copy)
            u55:DoCleaning();
        end));
        u55:GiveTask(UserInputService.JumpRequest:Connect(function() -- Line: 473
            -- upvalues: u55 (copy)
            u55:DoCleaning();
        end));
    end;
end;

function u8.getPlayingEmote(p67, p68) -- Line: 478
    local Character = p68.Character;

    if Character then
        return Character:GetAttribute("PlayingEmote");
    end;
end;

function u8.setupLocalEmoteCamera(u69, p70) -- Line: 484
    -- upvalues: KnitClient (copy), Players (copy), u4 (copy)
    if KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() ~= 0 then
        return nil;
    end;

    u69:cleanupLocalEmoteCamera();
    local LocalPlayer = Players.LocalPlayer;
    local CameraMode = LocalPlayer.CameraMode;
    local CameraMinZoomDistance = LocalPlayer.CameraMinZoomDistance;
    local CameraMaxZoomDistance = LocalPlayer.CameraMaxZoomDistance;
    local u71 = u4.new();
    u69.localEmoteCameraMaid = u71;
    LocalPlayer.CameraMode = Enum.CameraMode.Classic;
    LocalPlayer.CameraMaxZoomDistance = math.max(8, CameraMaxZoomDistance);
    LocalPlayer.CameraMinZoomDistance = 8;
    KnitClient.Controllers.CameraController:setZoom(8);
    u71:GiveTask(function() -- Line: 499
        -- upvalues: LocalPlayer (copy), CameraMaxZoomDistance (copy), CameraMinZoomDistance (copy), CameraMode (copy), KnitClient (ref), u69 (copy), u71 (copy)
        LocalPlayer.CameraMinZoomDistance = 0;
        LocalPlayer.CameraMaxZoomDistance = math.max(CameraMaxZoomDistance, CameraMinZoomDistance);
        LocalPlayer.CameraMinZoomDistance = CameraMinZoomDistance;
        LocalPlayer.CameraMaxZoomDistance = CameraMaxZoomDistance;
        LocalPlayer.CameraMode = CameraMode;

        if CameraMode ~= Enum.CameraMode.LockFirstPerson then
            KnitClient.Controllers.CameraController:setZoom((math.min(CameraMinZoomDistance, 0.5)));
        end;

        if u69.localEmoteCameraMaid == u71 then
            u69.localEmoteCameraMaid = nil;
        end;
    end);
    p70:GiveTask(u71);
end;

function u8.cleanupLocalEmoteCamera(p72) -- Line: 514
    local localEmoteCameraMaid = p72.localEmoteCameraMaid;

    if localEmoteCameraMaid ~= nil then
        localEmoteCameraMaid:DoCleaning();
    end;

    p72.localEmoteCameraMaid = nil;
end;

function u8.disableSameEmotePrompts(u73, p74, u75) -- Line: 521
    -- upvalues: Players (copy)
    local function _(p76, p77) -- Line: 523
        -- upvalues: Players (ref), u73 (copy), u75 (copy)
        local v78 = Players:GetPlayerByUserId(p77);

        if not v78 then
            return nil;
        end;

        if u73:getPlayingEmote(v78) == u75 then
            p76.Enabled = false;
        end;
    end;

    for i, v in u73.joinEmotePromptMap do
        local v79 = Players:GetPlayerByUserId(i);

        if v79 then
            if u73:getPlayingEmote(v79) == u75 then
                v.Enabled = false;
            end;
        end;
    end;
end;

function u8.setupEmoteJoinPrompt(u80, u81, u82) -- Line: 537
    -- upvalues: Players (copy), u4 (copy), EmoteMeta (copy), KnitClient (copy), KeybindDefaults (copy), KnitClient2 (copy), DeviceUtil (copy)
    local u83;

    if u81 then
        u83 = u81.UserId;
    else
        u83 = Players.LocalPlayer.UserId;
    end;

    local v84 = u80.joinEmotePromptMaid[u83] or u4.new();
    v84:DoCleaning();
    local v85 = EmoteMeta[u82];
    local v86 = KnitClient.Controllers.KeybindLoadController:getKeybinds();
    local v87;

    if v86 == nil then
        v87 = v86;
    else
        v87 = v86.keyboard;

        if v87 ~= nil then
            v87 = v87.controlActions.Emote;
        end;
    end;

    local v88 = v87 or KeybindDefaults.KEYBOARD_KEYBINDS.controlActions.Interact;

    if v86 ~= nil then
        v86 = v86.gamepad;

        if v86 ~= nil then
            v86 = v86.controlActions.Emote;
        end;
    end;

    local v89 = v86 or KeybindDefaults.GAMEPAD_KEYBINDS.controlActions.Emote;
    local v90 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
        ObjectText = "Join!",
        RequiresLineOfSight = false,
        MaxActivationDistance = 10,
        HoldDuration = 0.2,
        Parent = u81.Character,
        ActionText = v85.name,
        ClickablePrompt = DeviceUtil.isMobileControls(),
        KeyboardKeyCode = v88,
        GamepadKeyCode = v89
    });
    v84:GiveTask(v90);
    u80.joinEmotePromptMap[u83] = v90;
    v84:GiveTask(function() -- Line: 580
        -- upvalues: u80 (copy), u83 (copy)
        u80.joinEmotePromptMap[u83] = nil;
    end);
    local v92 = v90.Triggered:Connect(function(p91) -- Line: 583
        -- upvalues: u80 (copy), u82 (copy), u81 (copy)
        u80:emote(u82, u81);
    end);

    if u80:getPlayingEmote(Players.LocalPlayer) == u82 then
        v90.Enabled = false;
    end;

    v84:GiveTask(v92);
    u80.joinEmotePromptMaid[u83] = v84;
end;

function u8.playEmoteAnimation(u93, u94, p95, p96, u97, p98) -- Line: 594
    -- upvalues: u4 (copy), GameAnimationUtil (copy), Players (copy), default (copy)
    local u99 = u4.new();
    local u100;

    if p96.noAutoPlayAnimation then
        u100 = nil;
    else
        local type2 = p96.type;
        local v101 = {};
        local looped = p96.looped;

        if looped == nil then
            looped = false;
        end;

        v101.looped = looped;
        local speed = p96.speed;
        v101.speed = speed == nil and 1 or speed;
        u100 = GameAnimationUtil:playAnimation(p95, type2, v101);
        local v102 = u100 and p98;

        if v102 ~= 0 and (v102 == v102 and v102) then
            u100.TimePosition = p98;
        end;
    end;

    local v103 = p96.hideItemInHand and u94 ~= -1 and Players:GetPlayerByUserId(u94);

    if v103 then
        u93:hideItemInHand(v103);
    end;

    u99:GiveTask(function() -- Line: 626
        -- upvalues: u100 (ref), u93 (copy), u94 (copy), default (ref), u97 (copy)
        local v104 = u100;

        if v104 ~= nil then
            v104:Stop();
        end;

        local v105 = u100;

        if v105 ~= nil then
            v105:Destroy();
        end;

        local v106 = u93.emoteHandItemMaid[u94];

        if v106 ~= nil then
            v106:DoCleaning();
        end;

        default.Client:Get("EmoteCancelled"):CallServer({
            emoteType = u97
        });
        local v107 = u93.emoteMaids[u94];

        if v107 ~= nil then
            v107:DoCleaning();
        end;

        u93.emoteMaids[u94] = nil;
    end);
    local v108 = u100;

    if v108 ~= nil then
        v108 = v108.Looped;
    end;

    if not v108 and p96.disableCleanupOnAnimationEnd then
        local u109 = nil;
        local v110 = u100;

        if v110 ~= nil then
            v110 = v110.Stopped:Connect(function() -- Line: 667
                -- upvalues: u99 (copy), u109 (ref)
                u99:DoCleaning();
                local v111 = u109;

                if v111 ~= nil then
                    v111:Disconnect();
                end;
            end);
        end;
    end;

    return u99;
end;

function u8.playEmoteBeginSounds(u112, p113, u114, u115) -- Line: 679
    -- upvalues: EmoteMeta (copy), EmoteDisplayMeta (copy), ClientStore (copy), SoundManager (copy), Players (copy), u4 (copy), ClientSyncEvents (copy), Setting (copy)
    local v116 = EmoteMeta[p113];
    local u117;

    if u114 == nil then
        u117 = u114;
    else
        u117 = u114.Character;
    end;

    if u114 then
        local v118;

        if u114 == nil then
            v118 = u114;
        else
            v118 = u114.UserId;
        end;

        local v119 = u112.emoteSoundMaid[v118];

        if v119 ~= nil then
            v119:DoCleaning();
        end;
    end;

    local v120 = v116.soundsOnBegin or {};
    local v121;

    if v116.emoteDisplayType == nil then
        v121 = v120;
    else
        local soundsOnBegin = EmoteDisplayMeta[v116.emoteDisplayType].soundsOnBegin;

        if soundsOnBegin then
            v121 = {};
            local v122 = #v121;
            local v123 = #v120;
            table.move(v120, 1, v123, v122 + 1, v121);
            table.move(soundsOnBegin, 1, #soundsOnBegin, v122 + v123 + 1, v121);
        else
            v121 = v120;
        end;
    end;

    local emote_volume = ClientStore:getState().Settings.emote_volume;

    local function v130(p124) -- Line: 713
        -- upvalues: SoundManager (ref), u117 (copy), emote_volume (copy), u114 (copy), u112 (copy), u115 (copy)
        local sound = p124.sound;
        local v125 = {
            rollOffMaxDistance = 30
        };
        local v126;

        if u117 then
            v126 = u117:GetPivot().Position;
        else
            v126 = nil;
        end;

        v125.position = v126;
        local v127;

        if u117 then
            v127 = u117.PrimaryPart;
        else
            v127 = nil;
        end;

        v125.parent = v127;
        v125.volumeMultiplier = 0.5 * emote_volume;
        local config = p124.config;

        if type(config) == "table" then
            for i, v in config do
                v125[i] = v;
            end;
        end;

        local v128 = SoundManager:playModifiableSound(sound, v125);

        if u114 then
            u112.emoteSoundMap[u114] = v128;

            if u115 then
                local v129 = u112.emoteSoundMap[u115];

                if v129 ~= nil then
                    v129 = v129.TimePosition;
                end;

                if v129 ~= 0 and (v129 == v129 and v129) then
                    v128.TimePosition = v129;
                end;
            end;
        end;

        return v128;
    end;

    local v131 = 0;
    local u132 = {};

    for i, v in v121 do
        local v133 = v130(v, i - 1, v121);

        if v133 ~= nil then
            v131 = v131 + 1;
            u132[v131] = v133;
        end;
    end;

    if u132 then
        local v134;

        if u114 then
            v134 = u114.UserId;
        else
            v134 = Players.LocalPlayer.UserId;
        end;

        local v135 = u4.new();
        v135:GiveTask(function() -- Line: 763
            -- upvalues: u132 (copy)
            local function _(p136) -- Line: 764
                p136:Stop();
                p136:Destroy();
            end;

            for i, v in u132 do
                local _ = i - 1;
                v:Stop();
                v:Destroy();
            end;
        end);
        u112.emoteSoundMaid[v134] = v135;
        v135:GiveTask(ClientSyncEvents.SettingChanged:connect(function(p137) -- Line: 773
            -- upvalues: Setting (ref), ClientStore (ref), u132 (copy)
            if p137.setting == Setting.EMOTE_VOLUME then
                local emote_volume2 = ClientStore:getState().Settings.emote_volume;

                local function _(p138) -- Line: 776
                    -- upvalues: emote_volume2 (copy)
                    p138.Volume = 0.5 * emote_volume2;
                end;

                for i, v in u132 do
                    local _ = i - 1;
                    v.Volume = 0.5 * emote_volume2;
                end;
            end;
        end));
    end;

    return u132;
end;

function u8.playEmoteEndSounds(p139, p140, p141) -- Line: 787
    -- upvalues: EmoteMeta (copy), EmoteDisplayMeta (copy), ClientStore (copy), SoundManager (copy)
    local v142 = EmoteMeta[p140];
    local Character = p141.Character;

    if not Character then
        return nil;
    end;

    local v143 = v142.soundsOnEnd or {};
    local v144;

    if v142.emoteDisplayType == nil then
        v144 = v143;
    else
        local soundsOnEnd = EmoteDisplayMeta[v142.emoteDisplayType].soundsOnEnd;

        if soundsOnEnd then
            v144 = {};
            local v145 = #v144;
            local v146 = #v143;
            table.move(v143, 1, v146, v145 + 1, v144);
            table.move(soundsOnEnd, 1, #soundsOnEnd, v145 + v146 + 1, v144);
        else
            v144 = v143;
        end;
    end;

    local function v148(p147) -- Line: 808
        -- upvalues: ClientStore (ref), SoundManager (ref), Character (copy)
        if p147.sound == "" then
            return nil;
        end;

        local emote_volume = ClientStore:getState().Settings.emote_volume;

        return SoundManager:playModifiableSound(p147.sound, {
            rollOffMaxDistance = 30,
            position = Character:GetPivot().Position,
            parent = Character.PrimaryPart,
            volumeMultiplier = 0.5 * emote_volume
        });
    end;

    local v149 = 0;
    local v150 = {};

    for i, v in v144 do
        local v151 = v148(v, i - 1, v144);

        if v151 ~= nil then
            v149 = v149 + 1;
            v150[v149] = v151;
        end;
    end;

    return v150;
end;

function u8.preloadEmote(p152) -- Line: 834
    -- upvalues: ClientStore (copy), u3 (copy), EmoteMeta (copy), preloadImages (copy), ContentProvider (copy), GameAnimationUtil (copy)
    local selectedEmotes = ClientStore:getState().Locker.selectedEmotes;
    local v153 = u3.values(selectedEmotes);

    local function v156(p154) -- Line: 837
        -- upvalues: EmoteMeta (ref), preloadImages (ref), ContentProvider (ref), GameAnimationUtil (ref)
        local u155 = EmoteMeta[p154];

        if not u155 then
            return nil;
        end;

        if u155.image ~= nil then
            preloadImages({ u155.image });
        end;

        task.spawn(function() -- Line: 845
            -- upvalues: u155 (copy), ContentProvider (ref), GameAnimationUtil (ref)
            if u155.animation then
                ContentProvider:PreloadAsync({ GameAnimationUtil:getAnimation(u155.animation.type) });
            end;
        end);
    end;

    for i, v in v153 do
        v156(v, i - 1, v153);
    end;
end;

function u8.playEmoteShowcase(p157, p158) -- Line: 855
    p157.activeEmoteShowcaseSounds = p157:playEmoteBeginSounds(p158);
end;

function u8.stopEmoteShowcase(p159) -- Line: 858
    local activeEmoteShowcaseSounds = p159.activeEmoteShowcaseSounds;

    if activeEmoteShowcaseSounds then
        local function _(p160) -- Line: 861
            p160:Stop();
            p160:Destroy();
        end;

        for i, v in activeEmoteShowcaseSounds do
            local _ = i - 1;
            v:Stop();
            v:Destroy();
        end;

        p159.activeEmoteShowcaseSounds = nil;
    end;
end;

function u8.hideItemInHand(p161, p162) -- Line: 871
    -- upvalues: u4 (copy), EntityUtil (copy)
    local v163 = u4.new();
    local u164 = EntityUtil:getEntity(p162);

    if u164 ~= nil then
        u164 = u164:getHandItemInstanceFromCharacter();
    end;

    local u165 = {};
    local v166 = 0;

    for _ in u165 do
        v166 = v166 + 1;
    end;

    if v166 == 0 and u164 ~= nil then
        local function _(p167) -- Line: 890
            -- upvalues: u165 (copy)
            if p167:IsA("BasePart") or p167:IsA("Decal") then
                u165[p167] = p167.Transparency;
                p167.Transparency = 1;
            end;
        end;

        for i, descendant in u164:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") or descendant:IsA("Decal") then
                u165[descendant] = descendant.Transparency;
                descendant.Transparency = 1;
            end;
        end;
    end;

    v163:GiveTask(function() -- Line: 903
        -- upvalues: u164 (copy), u165 (copy)
        local v168 = u164;

        if v168 ~= nil then
            local function _(p169) -- Line: 907
                -- upvalues: u165 (ref)
                if p169:IsA("BasePart") or p169:IsA("Decal") then
                    local v170 = u165[p169];

                    if v170 ~= nil then
                        p169.Transparency = v170;
                    end;
                end;
            end;

            for i, descendant in v168:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") or descendant:IsA("Decal") then
                    local v171 = u165[descendant];

                    if v171 ~= nil then
                        descendant.Transparency = v171;
                    end;
                end;
            end;
        end;

        table.clear(u165);
    end);
    p161.emoteHandItemMaid[p162.UserId] = v163;
end;

function u8.canEmote(p172) -- Line: 926
    -- upvalues: PlaceUtil (copy), KnitClient (copy)
    if not PlaceUtil.isLobbyServer() then
        local v173 = KnitClient.Controllers.MatchController:getQueueMeta();

        if v173 and v173.disableEmotes == true then
            return false;
        end;
    end;

    return p172.emoteAllowed;
end;

function u8.setCanEmote(p174, p175) -- Line: 937
    p174.emoteAllowed = p175;
end;

KnitClient.CreateController(u8.new());

return nil;