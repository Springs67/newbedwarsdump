-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local DeviceUtil = v1.DeviceUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "inspect", "inspect");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v8 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v8.Players;
local RunService = v8.RunService;
local Workspace = v8.Workspace;
local u9 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local v10 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "movement", "event", "move-mount-event");
local InputActionType = v10.InputActionType;
local MoveMountDirection = v10.MoveMountDirection;
local MoveMountUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "movement", "move-mount-ui").MoveMountUI;
local MountFlightControls = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "mount", "mount-flight-controls").MountFlightControls;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local SeasonXEnvironment = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "environments", "season-x-environment").SeasonXEnvironment;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local AngelWingsColors = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "angel-wings", "angel-wings-types").AngelWingsColors;
local WinEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType;
local LoggerProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "logger-provider").LoggerProvider;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WinEffect = RuntimeLib.import(script, script.Parent.Parent, "win-effect").WinEffect;
local v11 = {};
local u12 = setmetatable({}, {
    __index = v11
});
u12.Hover = 0;
v11[0] = "Hover";
u12.Fly = 1;
v11[1] = "Fly";
u12.Dive = 2;
v11[2] = "Dive";
u12.DiveTransition = 3;
v11[3] = "DiveTransition";
u12.GroundSmash = 4;
v11[4] = "GroundSmash";
local u13 = setmetatable({}, {
    __tostring = function() -- Line: 59, Name: __tostring
        return "AngelWingsWinEffectController";
    end,

    __index = WinEffect
});
u13.__index = u13;

function u13.new(...) -- Line: 65
    -- upvalues: u13 (ref)
    local v14 = setmetatable({}, u13);

    return v14:constructor(...) or v14;
end;

function u13.constructor(p15) -- Line: 69
    -- upvalues: WinEffect (copy), WinEffectType (copy), u3 (copy), u12 (ref), u9 (copy), u5 (copy), LoggerProvider (copy)
    WinEffect.constructor(p15, WinEffectType.ANGEL_WINGS);
    p15.Name = "AngelWingsWinEffectController";
    p15.targetVerticalVelocity = u3.SingleMotor.new(0);
    p15.flyState = u12.Hover;
    p15.flyStateUpdate = u9.new();
    p15.angelWingsPlayers = {};
    p15.upHeld = false;
    p15.downHeld = false;
    p15.maid = u5.new();
    p15.stateMaid = u5.new();
    p15.logger = LoggerProvider.getLogger("AngelWingsWinEffectController");
    p15.playerWingsAnimator = {};
end;

function u13.KnitStart(u16) -- Line: 83
    -- upvalues: WinEffect (copy), KnitClient (copy), ItemType (copy), AnimationType (copy), GameSound (copy), default (copy), Players (copy), RuntimeLib (copy), SoundManager (copy), SeasonXEnvironment (copy), u4 (copy)
    WinEffect.KnitStart(u16);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.ANGEL_WINGS, {
        animations = {
            AnimationType.ANGEL_WINGS_FLYING,
            AnimationType.ANGEL_WINGS_DIVING_IDLE,
            AnimationType.ANGEL_WINGS_DIVE,
            AnimationType.ANGEL_WINGS_PLAYER_FLYING,
            AnimationType.ANGEL_WINGS_PLAYER_DIVING_IDLE,
            AnimationType.ANGEL_WINGS_PLAYER_DIVE,
            AnimationType.ANGEL_WINGS_PLAYER_FLY,
            AnimationType.ANGEL_WINGS_PLAYER_IDLE,
            AnimationType.ANGEL_WINGS_WINGS_IDLE,
            AnimationType.ANGEL_WINGS_GROUND_SMASH,
            AnimationType.ANGEL_WINGS_PLAYER_GROUND_SMASH
        },
        sounds = {
            GameSound.XUROT_FLAP_WING_1,
            GameSound.XUROT_FLAP_WING_2,
            GameSound.WIND_TUNNEL_FLYING,
            GameSound.JUGGERNAUT_GROUND_SMASH
        }
    });
    default.Client:OnEvent("AngelWingsWinEffectSetupComplete", function(u17) -- Line: 89
        -- upvalues: u16 (copy), Players (ref), RuntimeLib (ref), SoundManager (ref), KnitClient (ref), SeasonXEnvironment (ref), u4 (ref)
        table.insert(u16.angelWingsPlayers, u17.winningPlayer.UserId);

        if Players.LocalPlayer == u17.winningPlayer then
            RuntimeLib.Promise.new(function(p18) -- Line: 94
                -- upvalues: u17 (copy), SoundManager (ref), KnitClient (ref), SeasonXEnvironment (ref), Players (ref), u16 (ref)
                local music = u17.music;

                if music ~= "" and music then
                    SoundManager:playSound(u17.music, {
                        looped = true,
                        fadeInTime = 1,
                        fadeOutTime = 1
                    });
                end;

                if u17.useSeasonXSkybox then
                    KnitClient.Controllers.EnvironmentController:setupEnvironment(SeasonXEnvironment);
                end;

                local Humanoid = Players.LocalPlayer.Character:WaitForChild("Humanoid", 5);
                u16:mountUi(Players.LocalPlayer);
                u16:bindControls(Humanoid);
                u16:orientCamera();

                return p18();
            end):timeout(5):catch(function(p19) -- Line: 111
                -- upvalues: u16 (ref), u4 (ref)
                u16.logger:Error("Failed to setup angel wings win effect on local player with reason: {err}", u4(p19));
            end);
        end;
    end);
end;

function u13.onWin(u20, u21) -- Line: 117
    -- upvalues: default (copy), RuntimeLib (copy), ItemType (copy), Players (copy), RunService (copy), u12 (ref), u3 (copy), ClientSyncEvents (copy), MoveMountDirection (copy), InputActionType (copy), u4 (copy)
    default.Client:Get("RequestAngelWingsEffect"):SendToServer(true);
    u20:updateWingType(u21, (default.Client:Get("RequestAngelWingsEffectType"):CallServer(u21)));
    RuntimeLib.Promise.new(function(p22, p23) -- Line: 122
        -- upvalues: u20 (copy), u21 (copy), ItemType (ref)
        while table.find(u20.angelWingsPlayers, u21.UserId) == nil do
            wait(0.3);
        end;

        if not u21.Character then
            return p23("Winning player has no character model");
        end;

        local v24 = u21.Character:WaitForChild(ItemType.ANGEL_WINGS, 5);

        if not v24 then
            return p23("Could not find angel wings on player");
        end;

        u20.playerWingsAnimator[u21.UserId] = v24.Handle.rig.AnimationController.Animator;

        return p22();
    end):andThen(function() -- Line: 144
        -- upvalues: u20 (copy), u21 (copy), Players (ref), RunService (ref), u12 (ref), u3 (ref), ClientSyncEvents (ref), MoveMountDirection (ref), InputActionType (ref)
        u20.flyStateUpdate:Connect(function(p25, p26) -- Line: 145
            -- upvalues: u20 (ref)
            return u20:handleEventTransitions(p25, p26);
        end);

        if u21 == Players.LocalPlayer then
            local Humanoid = Players.LocalPlayer.Character:WaitForChild("Humanoid", 1);
            local u27 = 0;
            u20.maid:GiveTask(RunService.Heartbeat:Connect(function(p28) -- Line: 151
                -- upvalues: u20 (ref), u12 (ref), Humanoid (copy), u21 (ref), u27 (ref), u3 (ref), Players (ref)
                if u20.flyState == u12.Hover and Humanoid.MoveDirection.Magnitude > 3 then
                    u20.flyStateUpdate:Fire(u21, u12.Fly);
                end;

                if u20.upHeld and not u20.downHeld then
                    u27 = -0.3;
                    u20.targetVerticalVelocity:setGoal(u3.Spring.new(25, {
                        frequency = 1,
                        dampingRatio = 0.45
                    }));
                elseif u20.upHeld or not u20.downHeld then
                    u27 = -0.3;
                    u20.targetVerticalVelocity:setGoal(u3.Spring.new(0, {
                        frequency = 1,
                        dampingRatio = 0.45
                    }));
                else
                    u27 = u27 + p28;
                    u20.targetVerticalVelocity:setGoal(u3.Instant.new(-math.clamp(u27 * u27 * 10, 0, 50)));
                end;

                local Character = Players.LocalPlayer.Character;
                local v29;

                if Character == nil then
                    v29 = Character;
                else
                    v29 = Character.PrimaryPart;
                end;

                if not v29 then
                    return nil;
                end;

                local AssemblyLinearVelocity = Character.PrimaryPart.AssemblyLinearVelocity;
                local v30 = u20.targetVerticalVelocity:getValue();
                local v31 = Vector3.new(0, v30, 0);
                Character.PrimaryPart.AssemblyLinearVelocity = AssemblyLinearVelocity * Vector3.new(1, 0, 1) + v31;
            end));
            u20.maid:GiveTask(Humanoid.StateChanged:Connect(function(p32, p33) -- Line: 187
                -- upvalues: u20 (ref), u12 (ref), u21 (ref)
                if p33 ~= Enum.HumanoidStateType.Freefall and u20.flyState == u12.Dive then
                    u20.flyStateUpdate:Fire(u21, u12.GroundSmash);
                end;
            end));
            u20.maid:GiveTask(ClientSyncEvents.MoveMountButtonChange:connect(function(p34) -- Line: 192
                -- upvalues: MoveMountDirection (ref), u20 (ref), InputActionType (ref), Humanoid (copy)
                local direction = p34.direction;

                if direction == MoveMountDirection.UP then
                    u20:moveUp(p34.inputActionType == InputActionType.PRESS);

                    return;
                end;

                if direction ~= MoveMountDirection.DOWN then
                    return;
                end;

                u20:moveDown(p34.inputActionType == InputActionType.PRESS, Humanoid);
            end));
        end;
    end):timeout(8):catch(function(p35) -- Line: 206
        -- upvalues: u20 (copy), u4 (ref), u21 (copy), Players (ref)
        u20.logger:Error("Failed to setup angel wings win effect with reason: {reason}", u4(p35));

        if u21 == Players.LocalPlayer then
            u20.maid:DoCleaning();
        end;
    end);
end;

function u13.mountUi(p36, p37) -- Line: 213
    -- upvalues: DeviceUtil (copy), KnitClient2 (copy), u7 (copy), MoveMountUI (copy)
    if DeviceUtil.isMobileControls() then
        KnitClient2.Controllers.MobileUiController:toggleMountMovementControls(true);
        p36.maid:GiveTask(function() -- Line: 216
            -- upvalues: KnitClient2 (ref)
            KnitClient2.Controllers.MobileUiController:toggleMountMovementControls(false);
        end);

        return;
    end;

    local u38 = u7.mount(u7.createElement("ScreenGui", {
        ResetOnSpawn = false
    }, { u7.createElement(MoveMountUI) }), p37:WaitForChild("PlayerGui"));
    p36.maid:GiveTask(function() -- Line: 225
        -- upvalues: u7 (ref), u38 (copy)
        u7.unmount(u38);
    end);
end;

function u13.orientCamera(p39) -- Line: 230
    -- upvalues: Workspace (copy), Players (copy)
    if Workspace.CurrentCamera then
        Players.LocalPlayer.CameraMaxZoomDistance = 40;
        Players.LocalPlayer.CameraMinZoomDistance = 20;
    end;
end;

function u13.bindControls(u40, u41) -- Line: 236
    -- upvalues: MountFlightControls (copy)
    local v42 = MountFlightControls.bindUpDownControls();
    u40.maid:GiveTask(v42.bindActionMaid);
    u40.maid:GiveTask(v42.shouldFlyUpRef.Changed:Connect(function(p43) -- Line: 239
        -- upvalues: u40 (copy)
        return u40:moveUp(p43);
    end));
    u40.maid:GiveTask(v42.shouldFlyDownRef.Changed:Connect(function(p44) -- Line: 242
        -- upvalues: u40 (copy), u41 (copy)
        return u40:moveDown(p44, u41);
    end));
end;

function u13.handleEventTransitions(u45, u46, p47) -- Line: 246
    -- upvalues: u12 (ref), GameAnimationUtil (copy), AnimationType (copy), AnimationUtil (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy), RuntimeLib (copy), KnitClient (copy), Players (copy)
    local u48 = u45.playerWingsAnimator[u46.UserId];
    assert(u48 ~= nil, "Sent angel wings state update without wings animator");
    u45.flyState = p47;
    u45.stateMaid:DoCleaning();

    if p47 == u12.Hover then
        local u49 = GameAnimationUtil:playAnimation(u48, AnimationType.ANGEL_WINGS_WINGS_IDLE, {
            looped = true
        });
        local u50 = AnimationUtil:playAnimation(u46, GameAnimationUtil:getAssetId(AnimationType.ANGEL_WINGS_PLAYER_IDLE), {
            looped = true
        });
        local u51;

        if u49 == nil then
            u51 = u49;
        else
            u51 = u49:GetMarkerReachedSignal("flap"):Connect(function() -- Line: 264
                -- upvalues: SoundManager (ref), RandomUtil (ref), GameSound (ref), u46 (copy), u48 (copy)
                local v52 = RandomUtil.fromList(GameSound.XUROT_FLAP_WING_1, GameSound.XUROT_FLAP_WING_2);
                local v53 = {};
                local Character = u46.Character;

                if Character ~= nil then
                    Character = Character:GetPivot().Position;
                end;

                v53.position = Character;
                v53.volumeMultiplier = 0.1;
                v53.rollOffMaxDistance = 10;
                v53.parent = u48.Parent;
                SoundManager:playSound(v52, v53);
            end);
        end;

        u45.stateMaid:GiveTask(function() -- Line: 281
            -- upvalues: u49 (copy), u50 (copy), u51 (copy)
            local v54 = u49;

            if v54 ~= nil then
                v54:Destroy();
            end;

            local v55 = u50;

            if v55 ~= nil then
                v55:Destroy();
            end;

            local v56 = u51;

            if v56 ~= nil then
                v56:Disconnect();
            end;
        end);

        return;
    end;

    if p47 ~= u12.Fly then
        if p47 == u12.DiveTransition then
            local v57 = GameAnimationUtil:playAnimation(u48, AnimationType.ANGEL_WINGS_DIVE, {
                looped = false
            });
            local v58 = AnimationUtil:playAnimation(u46, GameAnimationUtil:getAssetId(AnimationType.ANGEL_WINGS_PLAYER_DIVE));

            if v57 then
                u45.stateMaid:GiveTask(v57);
                local u59 = RuntimeLib.Promise.delay(v57.Length):andThen(function() -- Line: 346
                    -- upvalues: u45 (copy), u46 (copy), u12 (ref)
                    u45.flyStateUpdate:Fire(u46, u12.Dive);
                end);
                u45.stateMaid:GiveTask(function() -- Line: 349
                    -- upvalues: u59 (copy)
                    return u59:cancel();
                end);
            end;

            if v58 then
                u45.stateMaid:GiveTask(v58);

                return;
            end;
        else
            if p47 == u12.Dive then
                local u60 = GameAnimationUtil:playAnimation(u48, AnimationType.ANGEL_WINGS_DIVING_IDLE, {
                    looped = true
                });
                local u61 = AnimationUtil:playAnimation(u46, GameAnimationUtil:getAssetId(AnimationType.ANGEL_WINGS_PLAYER_DIVING_IDLE), {
                    looped = true
                });
                local WIND_TUNNEL_FLYING = GameSound.WIND_TUNNEL_FLYING;
                local v62 = {};
                local Character = u46.Character;

                if Character ~= nil then
                    Character = Character:GetPivot().Position;
                end;

                v62.position = Character;
                v62.volumeMultiplier = 0.5;
                v62.rollOffMaxDistance = 10;
                v62.parent = u48.Parent;
                local u63 = SoundManager:playSound(WIND_TUNNEL_FLYING, v62);
                u45.stateMaid:GiveTask(function() -- Line: 378
                    -- upvalues: u60 (copy), u61 (copy), u63 (copy)
                    local v64 = u60;

                    if v64 ~= nil then
                        v64:Destroy();
                    end;

                    local v65 = u61;

                    if v65 ~= nil then
                        v65:Destroy();
                    end;

                    u63:Destroy();
                end);

                return;
            end;

            if p47 == u12.GroundSmash then
                local u66 = GameAnimationUtil:playAnimation(u48, AnimationType.ANGEL_WINGS_GROUND_SMASH, {
                    looped = false,
                    speed = 2.5
                });
                local u67 = AnimationUtil:playAnimation(u46, GameAnimationUtil:getAssetId(AnimationType.ANGEL_WINGS_PLAYER_GROUND_SMASH), {
                    looped = false,
                    speed = 2.5
                });
                local u68;

                if u67 == nil then
                    u68 = u67;
                else
                    u68 = u67:GetMarkerReachedSignal("HitGround"):Connect(function() -- Line: 402
                        -- upvalues: u46 (copy), SoundManager (ref), GameSound (ref), u48 (copy), KnitClient (ref), Players (ref)
                        local Character = u46.Character;

                        if Character ~= nil then
                            Character = Character:GetPivot().Position;
                        end;

                        if not Character then
                            return nil;
                        end;

                        SoundManager:playSound(GameSound.JUGGERNAUT_GROUND_SMASH, {
                            volumeMultiplier = 0.4,
                            position = Character,
                            parent = u48.Parent
                        });
                        local v69 = false;
                        local v70 = 0;

                        while true do
                            if v69 then
                                v70 = v70 + 1;
                            else
                                v69 = true;
                            end;

                            if v70 >= 9 then
                                if u46 == Players.LocalPlayer then
                                    KnitClient.Controllers.ScreenShakeController:shake(Character, u46.Character:GetPivot().LookVector, {
                                        magnitude = 5,
                                        cycles = 5,
                                        duration = 0.4
                                    });
                                end;

                                return;
                            end;

                            KnitClient.Controllers.BlockDebrisController:createDebris(Character, Color3.fromRGB(25, 25, 25), Vector3.new(0.1, 0.3, 0.1));
                        end;
                    end);
                end;

                local v71;

                if u66 == nil then
                    v71 = u66;
                else
                    v71 = u66.Length;
                end;

                local u72 = RuntimeLib.Promise.delay(v71 == nil and 0.3 or v71):andThen(function() -- Line: 450
                    -- upvalues: u45 (copy), u46 (copy), u12 (ref)
                    u45.flyStateUpdate:Fire(u46, u12.Hover);
                end);
                u45.stateMaid:GiveTask(function() -- Line: 453
                    -- upvalues: u72 (copy), u66 (copy), u67 (copy), u68 (copy)
                    u72:cancel();
                    local v73 = u66;

                    if v73 ~= nil then
                        v73:Destroy();
                    end;

                    local v74 = u67;

                    if v74 ~= nil then
                        v74:Destroy();
                    end;

                    local v75 = u68;

                    if v75 ~= nil then
                        v75:Disconnect();
                    end;
                end);

                return;
            end;
        end;

        return;
    end;

    local u76 = GameAnimationUtil:playAnimation(u48, AnimationType.ANGEL_WINGS_FLYING, {
        looped = true
    });
    local u77 = AnimationUtil:playAnimation(u46, GameAnimationUtil:getAssetId(AnimationType.ANGEL_WINGS_PLAYER_FLYING), {
        looped = true
    });
    local u78;

    if u76 == nil then
        u78 = u76;
    else
        u78 = u76:GetMarkerReachedSignal("Flap"):Connect(function() -- Line: 306
            -- upvalues: SoundManager (ref), RandomUtil (ref), GameSound (ref), u46 (copy), u48 (copy)
            local v79 = RandomUtil.fromList(GameSound.XUROT_FLAP_WING_1, GameSound.XUROT_FLAP_WING_2);
            local v80 = {};
            local Character = u46.Character;

            if Character ~= nil then
                Character = Character:GetPivot().Position;
            end;

            v80.position = Character;
            v80.volumeMultiplier = 0.2;
            v80.rollOffMaxDistance = 10;
            v80.parent = u48.Parent;
            SoundManager:playSound(v79, v80);
        end);
    end;

    u45.stateMaid:GiveTask(function() -- Line: 323
        -- upvalues: u76 (copy), u77 (copy), u78 (copy)
        local v81 = u76;

        if v81 ~= nil then
            v81:Destroy();
        end;

        local v82 = u77;

        if v82 ~= nil then
            v82:Destroy();
        end;

        local v83 = u78;

        if v83 ~= nil then
            v83:Disconnect();
        end;
    end);
end;

function u13.moveDown(u84, p85, u86) -- Line: 472
    -- upvalues: u12 (ref), RuntimeLib (copy), Players (copy)
    u84.downHeld = p85;

    if u84.flyState ~= u12.Hover or not p85 then
        if (u84.flyState == u12.Dive or u84.flyState == u12.DiveTransition) and not p85 then
            local diveTransitionPromise = u84.diveTransitionPromise;

            if diveTransitionPromise ~= nil then
                diveTransitionPromise:cancel();
            end;

            u84.flyStateUpdate:Fire(Players.LocalPlayer, u12.Hover);
        end;

        return;
    end;

    local diveTransitionPromise = u84.diveTransitionPromise;

    if diveTransitionPromise ~= nil then
        diveTransitionPromise:cancel();
    end;

    u84.diveTransitionPromise = RuntimeLib.Promise.delay(0.3):andThen(function() -- Line: 479
        -- upvalues: u86 (copy), u84 (copy), Players (ref), u12 (ref)
        if u86:GetState() == Enum.HumanoidStateType.Freefall or u86:GetState() == Enum.HumanoidStateType.FallingDown then
            u84.flyStateUpdate:Fire(Players.LocalPlayer, u12.DiveTransition);
        end;
    end);
end;

function u13.moveUp(p87, p88) -- Line: 492
    -- upvalues: u12 (ref), Players (copy)
    local diveTransitionPromise = p87.diveTransitionPromise;

    if diveTransitionPromise ~= nil then
        diveTransitionPromise:cancel();
    end;

    if p87.flyState == u12.Fly and not p88 then
        p87.flyStateUpdate:Fire(Players.LocalPlayer, u12.Hover);
    elseif p87.flyState ~= u12.Fly and p88 then
        p87.flyStateUpdate:Fire(Players.LocalPlayer, u12.Fly);
    end;

    p87.upHeld = p88;
end;

function u13.updateWingType(u89, u90, u91) -- Line: 504
    -- upvalues: RuntimeLib (copy), ItemType (copy), AngelWingsColors (copy), KnitClient2 (copy), u6 (copy), u4 (copy)
    RuntimeLib.Promise.new(function(p92, p93) -- Line: 505
        -- upvalues: u90 (copy), ItemType (ref), AngelWingsColors (ref), u91 (copy), KnitClient2 (ref), u6 (ref), u89 (copy)
        local Character = u90.Character;

        if Character ~= nil then
            Character = Character:WaitForChild("Humanoid");
        end;

        local Character2 = u90.Character;

        if Character2 ~= nil then
            Character2 = Character2.PrimaryPart;
        end;

        if not (Character2 and Character) then
            return p93("No player humanoid found");
        end;

        local Character3 = u90.Character;

        if Character3 ~= nil then
            Character3 = Character3:WaitForChild(ItemType.ANGEL_WINGS, 5);
        end;

        if not Character3 then
            return p93("Could not find angel wings accessory");
        end;

        local u94 = AngelWingsColors[u91];

        local function _(p95) -- Line: 529
            -- upvalues: u94 (copy)
            if p95:IsA("BasePart") then
                p95.Color = u94.neonColor;

                return;
            end;

            if p95:IsA("Decal") then
                p95.Color3 = u94.wingsDecalColor;
            end;
        end;

        for i, descendant in Character3:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                descendant.Color = u94.neonColor;
            elseif descendant:IsA("Decal") then
                descendant.Color3 = u94.wingsDecalColor;
            end;
        end;

        KnitClient2.Controllers.FancyExplosionController:createExplosion({
            radius = 20,
            randomSizeOffset = 0,
            randomPositionOffset = 0,
            inDuration = 0.5,
            outDuration = 1,
            position = Character2.Position,
            model = u94.ExplosionEffect
        });
        local v96 = u94.EffectModel:Clone();
        v96:PivotTo(Character2.CFrame);
        v96.Parent = Character2;
        u6("WeldConstraint", {
            Enabled = true,
            Part0 = v96.EffectPart,
            Part1 = Character2,
            Parent = v96
        });
        u89.maid:GiveTask(v96);

        return p92();
    end):catch(function(p97) -- Line: 559
        -- upvalues: u89 (copy), u4 (ref)
        u89.logger:Warn("Failed to update wing type for player with error reason: {err}", u4(p97));
    end);
end;

KnitClient.CreateController(u13.new());

return nil;