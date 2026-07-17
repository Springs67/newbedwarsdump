-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local TableUtil = v2.TableUtil;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v7.Players;
local ReplicatedStorage = v7.ReplicatedStorage;
local RunService = v7.RunService;
local Workspace = v7.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local v8 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "movement", "event", "move-mount-event");
local InputActionType = v8.InputActionType;
local MoveMountDirection = v8.MoveMountDirection;
local MoveMountUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "movement", "move-mount-ui").MoveMountUI;
local MountFlightControls = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "mount", "mount-flight-controls").MountFlightControls;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local WinEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local ModelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local WinEffect = RuntimeLib.import(script, script.Parent.Parent, "win-effect").WinEffect;
local u9 = setmetatable({}, {
    __tostring = function() -- Line: 44, Name: __tostring
        return "DragonRiderEffectController";
    end,

    __index = WinEffect
});
u9.__index = u9;

function u9.new(...) -- Line: 50
    -- upvalues: u9 (ref)
    local v10 = setmetatable({}, u9);

    return v10:constructor(...) or v10;
end;

function u9.constructor(u11) -- Line: 54
    -- upvalues: WinEffect (copy), WinEffectType (copy), u4 (copy), ClientSyncEvents (copy), MoveMountDirection (copy), InputActionType (copy), MatchState (copy), AbilityId (copy), default (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy)
    WinEffect.constructor(u11, WinEffectType.DRAGON_RIDER);
    u11.upHeld = false;
    u11.downHeld = false;
    u11.maid = u4.new();
    u11.dragonEffectMap = {};
    u11.maid:GiveTask(ClientSyncEvents.MoveMountButtonChange:connect(function(p12) -- Line: 60
        -- upvalues: MoveMountDirection (ref), u11 (copy), InputActionType (ref)
        local direction = p12.direction;

        if direction == MoveMountDirection.UP then
            u11.upHeld = p12.inputActionType == InputActionType.PRESS;

            return;
        end;

        if direction == MoveMountDirection.DOWN then
            u11.downHeld = p12.inputActionType == InputActionType.PRESS;
        end;
    end));
    u11.maid:GiveTask(ClientSyncEvents.MatchStateChange:connect(function(p13) -- Line: 73
        -- upvalues: MatchState (ref), u11 (copy), ClientSyncEvents (ref), AbilityId (ref), default (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref)
        if p13.matchState == MatchState.POST then
            u11.maid:GiveTask(ClientSyncEvents.AbilityInputStateChanged:connect(function(p14) -- Line: 75
                -- upvalues: AbilityId (ref), default (ref)
                if p14.ability.abilityId ~= AbilityId.YUZI_DRAGON_FIRE_BREATH_WIN_EFFECT then
                    return nil;
                end;

                default.Client:Get("YuziDragonFireBreathWinEffectRequest"):SendToServer({
                    enabled = p14.inputState == Enum.UserInputState.Begin
                });
            end));
            u11.maid:GiveTask(default.Client:Get("YuziDragonFireBreathWinEffect"):Connect(function(p15) -- Line: 83
                -- upvalues: u11 (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref)
                local v16 = u11.dragonEffectMap[p15.userId];

                if v16 then
                    EffectUtil:toggleEffects(v16, p15.enabled, 0.5);

                    if not u11.burnSound then
                        u11.burnSound = SoundManager:playModifiableSound(GameSound.FIRE_LOOP, {
                            volumeMultiplier = 0.4,
                            looped = true
                        });
                        u11.maid:GiveTask(u11.burnSound);
                    end;

                    u11.burnSound.Volume = p15.enabled and 0.4 or 0;

                    if p15.enabled and not u11.roarSound then
                        u11.roarSound = SoundManager:playModifiableSound(GameSound.DRAGON_ROAR);
                        u11.roarSound.Ended:Connect(function() -- Line: 99
                            -- upvalues: u11 (ref)
                            local roarSound = u11.roarSound;

                            if roarSound ~= nil then
                                roarSound:Destroy();
                            end;

                            u11.roarSound = nil;
                        end);
                    end;
                end;
            end));
        end;
    end));
end;

function u9.onWin(u17, u18) -- Line: 112
    -- upvalues: EntityUtil (copy), u5 (copy), Workspace (copy), Players (copy), ReplicatedStorage (copy), EffectUtil (copy), GameAnimationUtil (copy), AnimationType (copy), u3 (copy), RunService (copy)
    local Character = u18.Character;

    if not Character then
        return nil;
    end;

    local Humanoid = Character:FindFirstChild("Humanoid");

    if not Humanoid then
        return nil;
    end;

    local PrimaryPart = Character.PrimaryPart;

    if not PrimaryPart then
        return nil;
    end;

    local u19 = EntityUtil:getEntity(u18);

    if not u19 then
        return nil;
    end;

    local v20 = u5("Folder", {
        Parent = Workspace,
        Name = "Dragon_" .. tostring(u18.UserId)
    });
    u17.maid:GiveTask(v20);
    local v21 = {
        Name = "DragonPart_Start"
    };
    local Character2 = u18.Character;

    if Character2 ~= nil then
        Character2 = Character2:GetPivot();
    end;

    v21.CFrame = Character2;
    v21.Size = Vector3.new(4.525, 5.648, 7.5);
    v21.Anchored = true;
    v21.CanCollide = false;
    v21.CanQuery = false;
    v21.CanTouch = false;
    v21.Transparency = 1;
    v21.Parent = v20;
    local u22 = u5("Part", v21);
    u17.maid:GiveTask(u22);

    if Players.LocalPlayer == u18 then
        u17:mountUi(u18);
        u17:bindControls();
        u17:orientCamera(PrimaryPart);
        u17:setupFireBreathAbility();
    end;

    local v23 = u5("Attachment", {
        Parent = Character.PrimaryPart
    });
    u17.maid:GiveTask(v23);
    local v24 = u5("AngularVelocity", {
        MaxTorque = 5000,
        RelativeTo = Enum.ActuatorRelativeTo.Attachment0,
        Attachment0 = v23,
        Parent = Character.PrimaryPart
    });
    u17.maid:GiveTask(v24);
    local u25 = u17:makeDragonSegments(u22, 7, 5, v20);
    local v26 = u25[#u25 - 1 + 1];
    local v27 = ReplicatedStorage.Assets.Effects.DragonEffect:Clone();
    local v28 = v26:GetPivot();
    local v29 = CFrame.new(Vector3.new(0, -2, -8));
    local v30 = CFrame.Angles(0, 1.5707963267948966, 0);
    v27:PivotTo(v28 * v29 * v30);
    v27.Anchored = false;
    v27.Parent = v26;
    EffectUtil:toggleEffects(v27, false);
    u17.dragonEffectMap[u18.UserId] = v27;
    u17.maid:GiveTask(function() -- Line: 185
        -- upvalues: u17 (copy), u18 (copy)
        local v31 = u17.dragonEffectMap[u18.UserId];

        if v31 ~= nil then
            v31:Destroy();
        end;

        u17.dragonEffectMap[u18.UserId] = nil;
    end);
    local v32 = u5("WeldConstraint", {
        Part0 = v26,
        Part1 = v27,
        Parent = v26
    });
    u17.maid:GiveTask(v32);
    Character.Archivable = true;
    local v33 = Character:Clone();
    v33.Parent = v20;
    v33.Name = "Conductor";

    local function _(p34) -- Line: 208
        if p34:IsA("Part") then
            p34.CanCollide = false;
            p34.CanQuery = false;
            p34.CanTouch = false;
        end;
    end;

    for i, descendant in v33:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("Part") then
            descendant.CanCollide = false;
            descendant.CanQuery = false;
            descendant.CanTouch = false;
        end;
    end;

    v33:PivotTo(v26:GetPivot() + Vector3.new(0, 3, 0));
    u17.maid:GiveTask(v33);
    local v35 = u5("WeldConstraint", {
        Parent = v26,
        Part0 = v26,
        Part1 = v33.PrimaryPart
    });
    u17.maid:GiveTask(v35);
    local u36 = v33:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation((u5("Animation", {
        AnimationId = GameAnimationUtil:getAssetId(AnimationType.R15_SIT)
    })));
    u36:Play();
    u17.maid:GiveTask(function() -- Line: 236
        -- upvalues: u36 (copy)
        u36:Stop();
        u36:Destroy();
    end);
    u19:getInstance():SetAttribute("Transparency", 1);
    u19:hideNametag();
    u17.maid:GiveTask(function() -- Line: 242
        -- upvalues: u19 (copy)
        u19:getInstance():SetAttribute("Transparency", 0);
        u19:showNametag();
    end);
    local u37 = 0;
    local u38 = u3.SingleMotor.new(0);
    RunService.Heartbeat:Connect(function(p39) -- Line: 248
        -- upvalues: u37 (ref), u18 (copy), u22 (copy), u17 (copy), u25 (copy), Players (ref), PrimaryPart (copy), u38 (copy), u3 (ref), Humanoid (copy)
        u37 = u37 + p39;
        local v40 = u18.Character:GetPivot();
        local v41 = math.rad(u37) * 150;
        local v42 = math.sin(v41) * 5;
        u22.CFrame = v40 + Vector3.new(0, v42, 0);
        u17:solveIK(u25, u22);

        if Players.LocalPlayer == u18 and PrimaryPart then
            PrimaryPart.CFrame = PrimaryPart.CFrame * CFrame.new(0, 0, -20 * p39);

            if u17.upHeld and not u17.downHeld then
                u38:setGoal(u3.Spring.new(938));
            elseif u17.downHeld and not u17.upHeld then
                u38:setGoal(u3.Spring.new(-938));
            else
                u38:setGoal(u3.Spring.new(0, {
                    frequency = 1
                }));
            end;

            local v43 = u38:getValue() * p39;
            PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, v43, 0);
            Humanoid:Move(Vector3.new(0, 0, 0));
        end;
    end);
end;

function u9.makeDragonSegments(p44, p45, p46, p47, p48) -- Line: 274
    -- upvalues: ReplicatedStorage (copy), u5 (copy), ModelUtil (copy), TableUtil (copy)
    local v49 = {};
    local v50 = setmetatable({}, {
        __index = v49
    });
    v50.HEAD = "headSegment";
    v49.headSegment = "HEAD";
    v50.LEG = "legSegment";
    v49.legSegment = "LEG";
    v50.TORSO = "torsoSegment";
    v49.torsoSegment = "TORSO";
    local v51 = {};
    local LEG = v50.LEG;
    table.insert(v51, v50.HEAD);
    table.insert(v51, LEG);
    local v52 = false;
    local v53 = 0;
    local v54 = {};

    while true do
        if v52 then
            v53 = v53 + 1;
        else
            v52 = true;
        end;

        if v53 >= p46 then
            break;
        end;

        table.insert(v51, v50.TORSO);
    end;

    table.insert(v51, v50.LEG);
    local v55 = false;
    local v56 = 0;

    while true do
        if v55 then
            v56 = v56 + 1;
        else
            v55 = true;
        end;

        if v56 >= p47 then
            break;
        end;

        table.insert(v51, v50.TORSO);
    end;

    local v57 = false;
    local v58 = 0;

    while true do
        if v57 then
            v58 = v58 + 1;
        else
            v57 = true;
        end;

        if v58 >= #v51 then
            return TableUtil.Reverse(v54);
        end;

        local v59 = ReplicatedStorage.Assets.Misc.PaperDragon[v51[v58 + 1]]:Clone();
        table.insert(v54, v59);
        v59.Size = p45.Size;
        v59.CFrame = p45.CFrame * CFrame.new(0, 0, p45.Size.Z + p45.Size.Z);
        local v60 = u5("Model", {
            Children = { v59 },
            Parent = p48,
            PrimaryPart = v59
        });

        if #v51 - p47 <= v58 then
            ModelUtil.scaleModel(v60, 1 / (v58 + 1 - (#v51 - p47)));
        end;

        v59.Parent = p48;
        v60:Destroy();
    end;
end;

function u9.makeSegments(p61, p62, p63, p64, p65) -- Line: 363
    -- upvalues: u5 (copy)
    local v66 = p64 / p63;
    local v67 = false;
    local v68 = 0;
    local v69 = {};

    while true do
        if v67 then
            v68 = v68 + 1;
        else
            v67 = true;
        end;

        if v68 >= p63 then
            return v69;
        end;

        local v70 = u5("Part", {
            Anchored = true,
            CanCollide = false,
            CanQuery = false,
            CanTouch = false,
            Name = "DragonPart" .. tostring(v68),
            Size = Vector3.new(5 - (p63 - v68) * 5 / p63 + 1, 5 - (p63 - v68) * 5 / p63 + 1, v66),
            Color = Color3.fromRGB(255, 255, 255),
            CFrame = p62.CFrame * CFrame.new(0, 0, p62.Size.Z + v66 * (v68 - 1)),
            Parent = p65
        });
        table.insert(v69, v70);
    end;
end;

function u9.solveIK(p71, p72, p73) -- Line: 398
    local v74 = #p72 - 1;
    local v75 = false;
    local v76 = nil;

    while true do
        if v75 then
            v74 = v74 - 1;
        else
            v75 = true;
        end;

        if v74 < 0 then
            return;
        end;

        local v77 = p72[v74 + 1];
        local v78;

        if v76 then
            v78 = (v76.CFrame * CFrame.new(0, 0, v76.Size.Z / 2)).Position;
        else
            v78 = p73.Position;
        end;

        local Position = (v77.CFrame * CFrame.new(0, 0, v77.Size.Z / 2)).Position;
        local v79 = CFrame.new(v78, Position);
        local v80 = CFrame.new(0, 0, -v77.Size.Z / 2);
        local v81 = CFrame.Angles(0, 3.141592653589793, 0);
        v77.CFrame = v79 * v80 * v81;
        v76 = v77;
    end;
end;

function u9.mountUi(p82, p83) -- Line: 432
    -- upvalues: DeviceUtil (copy), KnitClient2 (copy), u6 (copy), MoveMountUI (copy)
    if DeviceUtil.isMobileControls() then
        KnitClient2.Controllers.MobileUiController:toggleMountMovementControls(true);
        p82.maid:GiveTask(function() -- Line: 435
            -- upvalues: KnitClient2 (ref)
            KnitClient2.Controllers.MobileUiController:toggleMountMovementControls(false);
        end);

        return;
    end;

    local u84 = u6.mount(u6.createElement("ScreenGui", {
        ResetOnSpawn = false
    }, { u6.createElement(MoveMountUI) }), p83:WaitForChild("PlayerGui"));
    p82.maid:GiveTask(function() -- Line: 444
        -- upvalues: u6 (ref), u84 (copy)
        u6.unmount(u84);
    end);
end;

function u9.orientCamera(p85, p86) -- Line: 449
    -- upvalues: Workspace (copy), Players (copy)
    if Workspace.CurrentCamera then
        Workspace.CurrentCamera.CameraSubject = p86;
        Players.LocalPlayer.CameraMaxZoomDistance = 100;
        Players.LocalPlayer.CameraMinZoomDistance = 60;
    end;
end;

function u9.bindControls(u87) -- Line: 456
    -- upvalues: MountFlightControls (copy)
    local v88 = MountFlightControls.bindUpDownControls();
    u87.maid:GiveTask(v88.bindActionMaid);
    u87.maid:GiveTask(v88.shouldFlyUpRef.Changed:Connect(function(p89) -- Line: 459
        -- upvalues: u87 (copy)
        u87.upHeld = p89;

        return u87.upHeld;
    end));
    u87.maid:GiveTask(v88.shouldFlyDownRef.Changed:Connect(function(p90) -- Line: 463
        -- upvalues: u87 (copy)
        u87.downHeld = p90;

        return u87.downHeld;
    end));
end;

function u9.setupFireBreathAbility(p91) -- Line: 468
    -- upvalues: Flamework (copy), AbilityId (copy), BedwarsImageId (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.YUZI_DRAGON_FIRE_BREATH_WIN_EFFECT, {
        abilityType = "MiscPrimary",
        abilityButton = {
            icon = BedwarsImageId.FIRE_ENCHANT
        }
    });
end;

KnitClient.CreateController(u9.new());

return nil;