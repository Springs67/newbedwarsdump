-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AbilityState = v1.AbilityState;
local DeviceUtil = v1.DeviceUtil;
local MobileTouchType = v1.MobileTouchType;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v4.ContextActionService;
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local AbilityIndicatorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "ability-indicator", "ability-indicator-util").AbilityIndicatorUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "falconer", "falcon-constants");
local SEND_BIRD_MIN_HEALTH = v5.SEND_BIRD_MIN_HEALTH;
local SEND_BIRD_RANGE = v5.SEND_BIRD_RANGE;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatefulEntityTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag;
local StatefulEntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local FalconClient = RuntimeLib.import(script, script.Parent, "falcon-client").FalconClient;
local FalconHealthbarAppWrapper = RuntimeLib.import(script, script.Parent, "falcon-healthbar-app").FalconHealthbarAppWrapper;
local u6 = Color3.fromRGB(4, 175, 236);
local u7 = Color3.fromRGB(219, 97, 99);
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 43, Name: __tostring
        return "FalconerController";
    end,

    __index = BaseKitController
});
u8.__index = u8;

function u8.new(...) -- Line: 49
    -- upvalues: u8 (ref)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10) -- Line: 53
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), Workspace (copy), u2 (copy)
    BaseKitController.constructor(p10, BedwarsKit.FALCONER);
    p10.Name = "FalconerController";
    p10.camera = Workspace.CurrentCamera;
    p10.maid = u2.new();
    p10.indicatorShown = false;
    p10.ownerFalconMap = {};
end;

function u8.KnitStart(p11) -- Line: 61
    -- upvalues: BaseKitController (copy), Workspace (copy)
    BaseKitController.KnitStart(p11);
    p11.camera = Workspace.CurrentCamera;
end;

function u8.onKitLocalActivated(u12, u13) -- Line: 65
    -- upvalues: ClientSyncEvents (copy), AbilityId (copy), KnitClient (copy), Players (copy), BedwarsKit (copy), EntityUtil (copy), MatchState (copy), default (copy), SEND_BIRD_MIN_HEALTH (copy)
    u13:GiveTask(ClientSyncEvents.CanUseLocalAbility:connect(function(p14) -- Line: 67
        -- upvalues: AbilityId (ref), KnitClient (ref), Players (ref), BedwarsKit (ref), EntityUtil (ref)
        if p14.ability ~= AbilityId.SEND_FALCON and p14.ability ~= AbilityId.RECALL_FALCON then
            return nil;
        end;

        if not KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.FALCONER) then
            return nil;
        end;

        local v15 = EntityUtil:getEntity(p14.userCharacter);

        if v15 ~= nil then
            v15 = v15:isAlive();
        end;

        if not v15 then
            p14:setCancelled(true);
        end;
    end));
    u13:GiveTask(ClientSyncEvents.MatchStateChange:connect(function(p16) -- Line: 83
        -- upvalues: KnitClient (ref), Players (ref), BedwarsKit (ref), MatchState (ref), u12 (copy)
        if not KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.FALCONER) then
            return nil;
        end;

        if p16.matchState ~= MatchState.RUNNING then
            return nil;
        end;

        u12:disableRecallFalcon(Players.LocalPlayer);
    end));
    default.Client:OnEvent("MonitorFalconHealth", function() -- Line: 94
        -- upvalues: u12 (copy), Players (ref), SEND_BIRD_MIN_HEALTH (ref)
        u12:disableSendFalcon(Players.LocalPlayer);
        local u17 = nil;
        u17 = u12.falconInstance:GetAttributeChangedSignal("Health"):Connect(function() -- Line: 97
            -- upvalues: u12 (ref), SEND_BIRD_MIN_HEALTH (ref), Players (ref), u17 (ref)
            if not u12.falconInstance then
                return nil;
            end;

            if SEND_BIRD_MIN_HEALTH <= u12.falconInstance:GetAttribute("Health") then
                u12:enableSendFalcon(Players.LocalPlayer);
                u17:Disconnect();
            end;
        end);
    end):andThen(function(p18) -- Line: 108
        -- upvalues: u13 (copy)
        u13:GiveTask(p18);
    end);
    u12:mountFalconHealthbarGui();
    u12:disableRecallFalcon(Players.LocalPlayer);
end;

function u8.onKitLocalDeactivated(p19) -- Line: 116
    p19:unmountFalconHealthbarGui();
end;

function u8.onKitReplicationActivated(u20, u21) -- Line: 119
    -- upvalues: WatchCollectionTag (copy), StatefulEntityTag (copy), Players (copy), default (copy)
    u21:GiveTask(WatchCollectionTag(StatefulEntityTag.FALCON, function(p22) -- Line: 121
        -- upvalues: Players (ref), u20 (copy)
        local v23 = p22:GetAttribute("OwnerId");

        if v23 == nil then
            return nil;
        end;

        local v24 = tonumber(v23);

        if v24 == nil then
            return nil;
        end;

        local v25 = Players:GetPlayerByUserId(v24);

        if not v25 then
            return nil;
        end;

        local v26 = u20:spawnFalcon(p22, v25);
        u20.ownerFalconMap[v25] = v26;
    end));
    default.Client:OnEvent("SendFalcon", function(p27) -- Line: 137
        -- upvalues: u20 (copy)
        local v28 = u20.ownerFalconMap[p27.player];

        if not v28 then
            return nil;
        end;

        v28:setStrikeZoneEpicenter(p27.strikeZoneEpicenter);
    end):andThen(function(p29) -- Line: 146
        -- upvalues: u21 (copy)
        u21:GiveTask(p29);
    end);
    u21:GiveTask(default.Client:Get("FalconsEyeMarked"):Connect(function(p30) -- Line: 150
        -- upvalues: u20 (copy)
        local v31 = u20.ownerFalconMap[p30.giver];

        if not v31 then
            return nil;
        end;

        v31:setTarget(p30.target);
    end));
    u21:GiveTask(default.Client:Get("FalconsEyeUnmarked"):Connect(function(p32) -- Line: 159
        -- upvalues: u20 (copy)
        local v33 = u20.ownerFalconMap[p32.giver];

        if not v33 then
            return nil;
        end;

        v33:setTarget(nil);
    end));
    u21:GiveTask(default.Client:Get("FalconPositionSync"):Connect(function(p34, p35) -- Line: 168
        -- upvalues: u20 (copy)
        local v36 = u20.ownerFalconMap[p34];

        if not v36 then
            return nil;
        end;

        v36:setPosition(p35);
    end));
end;

function u8.onKitReplicationDeactivated(p37) -- Line: 178
end;

function u8.onInnateAbilityEnabled(p38, p39, p40) -- Line: 180
end;

function u8.onAbilityUsed(p41, p42, p43) -- Line: 182
    -- upvalues: Players (copy), KnitClient (copy), BedwarsKit (copy), AbilityId (copy), SoundManager (copy), GameSound (copy), default (copy)
    if p42 ~= Players.LocalPlayer.Character then
        return nil;
    end;

    if p43:isCancelled() then
        return nil;
    end;

    if not KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.FALCONER) then
        return nil;
    end;

    if p43.userCharacter ~= Players.LocalPlayer.Character then
        return nil;
    end;

    if p43.ability == AbilityId.RECALL_FALCON then
        SoundManager:playSound(GameSound.FALCONER_RECALL_FALCON, {
            rollOffMaxDistance = 50,
            position = p43.userCharacter:GetPivot().Position
        });
        default.Client:Get("RecallFalconRequested"):SendToServer();

        return;
    end;

    if p43.ability ~= AbilityId.ACTIVATE_FALCON_INDICATOR then
        if p43.ability == AbilityId.SEND_FALCON then
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character:SetAttribute("Transparency", 0);
            end;

            p41:setIndicatorTransparency(1);
            p41.maid:DoCleaning();
            p41:disableIndicator(true);
            p41:enableRecallFalcon(Players.LocalPlayer);
        end;

        return;
    end;

    if not p41.indicator then
        p41:activateIndicator();

        return;
    end;

    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character:SetAttribute("Transparency", 0);
    end;

    p41:setIndicatorTransparency(1);
    p41.maid:DoCleaning();
    p41:disableIndicator(true);
end;

function u8.disableRecallFalcon(p44, p45) -- Line: 224
    -- upvalues: Players (copy), Flamework (copy), AbilityId (copy), AbilityState (copy)
    if p45 ~= Players.LocalPlayer then
        return nil;
    end;

    p44.recallFalconAbility = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.RECALL_FALCON);

    if not p44.recallFalconAbility then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p44.recallFalconAbility, AbilityState.DISABLED);
end;

function u8.enableRecallFalcon(p46, p47) -- Line: 234
    -- upvalues: Players (copy), Flamework (copy), AbilityState (copy)
    if p47 ~= Players.LocalPlayer then
        return nil;
    end;

    if not p46.recallFalconAbility then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p46.recallFalconAbility, AbilityState.READY);
end;

function u8.disableSendFalcon(p48, p49) -- Line: 243
    -- upvalues: Players (copy), Flamework (copy), AbilityId (copy), AbilityState (copy)
    if p49 ~= Players.LocalPlayer then
        return nil;
    end;

    p48.sendFalconAbility = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.ACTIVATE_FALCON_INDICATOR);

    if not p48.sendFalconAbility then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p48.sendFalconAbility, AbilityState.DISABLED);
end;

function u8.enableSendFalcon(p50, p51) -- Line: 253
    -- upvalues: Players (copy), Flamework (copy), AbilityState (copy)
    if p51 ~= Players.LocalPlayer then
        return nil;
    end;

    if not p50.sendFalconAbility then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p50.sendFalconAbility, AbilityState.READY);
end;

function u8.activateIndicator(u52) -- Line: 262
    -- upvalues: Players (copy), ReplicatedStorage (copy), Workspace (copy), Flamework (copy), AbilityId (copy), default (copy), MobileTouchType (copy), RunService (copy), DeviceUtil (copy), AbilityIndicatorUtil (copy), SEND_BIRD_RANGE (copy), u6 (copy), u7 (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character:SetAttribute("Transparency", 0.9);
    end;

    if u52.indicator then
        return nil;
    end;

    u52.indicator = ReplicatedStorage.Assets.Misc.FalconerIndicator:Clone();
    u52.indicator.Parent = Workspace;
    local u53 = Vector3.new();
    local v57 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "Send Falcon",

        boundFunction = function(p54, p55, p56) -- Line: 277, Name: boundFunction
            -- upvalues: u53 (ref), Flamework (ref), AbilityId (ref), default (ref)
            if not u53 then
                return nil;
            end;

            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.SEND_FALCON, p56, {
                target = u53
            });
            default.Client:Get("SendFalconRequested"):SendToServer({
                strikeZoneEpicenter = u53
            });
        end,

        mobile = {
            touchType = MobileTouchType.TouchTap,

            mobileBoundFunction = function() -- Line: 290, Name: mobileBoundFunction
                -- upvalues: u53 (ref), Flamework (ref), AbilityId (ref), default (ref)
                if not u53 then
                    return nil;
                end;

                Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.SEND_FALCON, nil, {
                    target = u53
                });
                default.Client:Get("SendFalconRequested"):SendToServer({
                    strikeZoneEpicenter = u53
                });
            end
        }
    });
    u52.maid:GiveTask(v57);
    local u58 = nil;
    u58 = RunService.Heartbeat:Connect(function() -- Line: 305
        -- upvalues: u52 (copy), u58 (ref), Players (ref), DeviceUtil (ref), u53 (ref), AbilityIndicatorUtil (ref), SEND_BIRD_RANGE (ref), u6 (ref), u7 (ref)
        if not u52.camera then
            return nil;
        end;

        if not u52.indicator then
            u58:Disconnect();

            return nil;
        end;

        local Character2 = Players.LocalPlayer.Character;

        if Character2 ~= nil then
            Character2 = Character2:GetPivot().Position;
        end;

        if not Character2 then
            return nil;
        end;

        local UnitRay = Players.LocalPlayer:GetMouse().UnitRay;
        local v59;

        if DeviceUtil.isMobileControls() then
            v59 = u52.camera.CFrame.LookVector.Unit;
        else
            v59 = UnitRay.Direction;
        end;

        u53 = AbilityIndicatorUtil:calculateBlockTargetPoint(u52.camera.CFrame.Position, v59, SEND_BIRD_RANGE, Character2);

        if not u53 then
            if u52.indicatorShown then
                u52:setIndicatorTransparency(1);
                u52.indicatorShown = false;
            end;

            return;
        end;

        local v60 = Vector3.new(u52.camera.CFrame.Position.X, u53.Y, u52.camera.CFrame.Position.Z);
        u52.indicator:PivotTo(CFrame.lookAt(u53, v60) * CFrame.Angles(0, 3.141592653589793, 0));

        if not u52.indicatorShown then
            u52:setIndicatorTransparency(0);
            u52.indicatorShown = true;
        end;

        local u61 = u6;

        if (u53 - Character2).Magnitude > 125 then
            u61 = u7;
        end;

        local function _(p62) -- Line: 340
            -- upvalues: u61 (ref)
            if p62:IsA("BasePart") then
                p62.Color = u61;
            end;
        end;

        for i, child in u52.indicator:GetChildren() do
            local _ = i - 1;

            if child:IsA("BasePart") then
                child.Color = u61;
            end;
        end;
    end);
end;

function u8.disableIndicator(p63, p64) -- Line: 356
    -- upvalues: ContextActionService (copy), Players (copy)
    local indicator = p63.indicator;

    if indicator ~= nil then
        indicator:Destroy();
    end;

    p63.indicator = nil;
    ContextActionService:UnbindAction("Send Falcon");

    if p64 then
        return nil;
    end;

    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character:SetAttribute("Transparency", 0);
    end;
end;

function u8.setIndicatorTransparency(p65, u66) -- Line: 371
    if not p65.indicator then
        return nil;
    end;

    local function _(p67) -- Line: 376
        -- upvalues: u66 (copy)
        if p67:IsA("Part") or (p67:IsA("MeshPart") or p67:IsA("UnionOperation")) then
            p67.Transparency = u66;
        end;
    end;

    for i, child in p65.indicator:GetChildren() do
        local _ = i - 1;

        if child:IsA("Part") or (child:IsA("MeshPart") or child:IsA("UnionOperation")) then
            child.Transparency = u66;
        end;
    end;
end;

function u8.mountFalconHealthbarGui(p68) -- Line: 385
    -- upvalues: CreateRoduxApp (copy), FalconHealthbarAppWrapper (copy)
    if not p68.falconInstance then
        return nil;
    end;

    p68:unmountFalconHealthbarGui();
    p68.falconHealthbarGui = CreateRoduxApp("FalconHealthbar", FalconHealthbarAppWrapper, {
        instance = p68.falconInstance
    });
end;

function u8.unmountFalconHealthbarGui(p69) -- Line: 396
    -- upvalues: u3 (copy)
    if p69.falconHealthbarGui then
        u3.unmount(p69.falconHealthbarGui);
    end;
end;

function u8.setFalconReference(p70, p71) -- Line: 402
    p70.falconInstance = p71;
    p70:mountFalconHealthbarGui();
end;

function u8.spawnFalcon(p72, p73, p74) -- Line: 406
    -- upvalues: StatefulEntityUtil (copy), FalconClient (copy)
    local v75 = StatefulEntityUtil:getGameEntityCFrame(p73);
    local v76 = p73:GetAttribute("EntityUUID");

    return FalconClient.new(v75, v76, p73, p74);
end;

KnitClient.CreateController(u8.new());

return nil;