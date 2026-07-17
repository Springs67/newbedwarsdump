-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out");
local Reflect = v1.Reflect;
local Flamework = v1.Flamework;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ConstraintType = v2.ConstraintType;
local DeviceUtil = v2.DeviceUtil;
local GameQueryUtil = v2.GameQueryUtil;
local IndicatorTransparencyFunctions = v2.IndicatorTransparencyFunctions;
local IndicatorUIType = v2.IndicatorUIType;
local SoundManager = v2.SoundManager;
local StringUtil = v2.StringUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local Controller = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v5.ContextActionService;
local Players = v5.Players;
local TweenService = v5.TweenService;
local Workspace = v5.Workspace;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ping", "ping-type");
local PING_SLOTS = v6.PING_SLOTS;
local PingType = v6.PingType;
local Pings = v6.Pings;
local getPingFromSlot = v6.getPingFromSlot;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local PingConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-constants").PingConstants;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local PingGuiObject = RuntimeLib.import(script, script.Parent, "ui", "ping-gui-object").PingGuiObject;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 38, Name: __tostring
        return "PingController";
    end
});
u7.__index = u7;

function u7.new(...) -- Line: 43
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 47
    p9.lastPing = 0;
    p9.touchPingEnabled = false;
end;

function u7.onStart(u10) -- Line: 51
    -- upvalues: PlaceUtil (copy), KnitClient (copy), u3 (copy), Pings (copy), default (copy), ClientStore (copy), MatchState (copy), Flamework (copy), PING_SLOTS (copy), getPingFromSlot (copy), u4 (copy), DeviceUtil (copy), PingType (copy)
    if PlaceUtil.isLobbyServer() then
        return nil;
    end;

    local PreloadController = KnitClient.Controllers.PreloadController;

    local function _(p11) -- Line: 59
        return p11.sound;
    end;

    local v12 = 0;
    local v13 = {};
    local v14 = {};

    for i, v in u3.values(Pings) do
        local _ = i - 1;
        local sound = v.sound;

        if sound ~= nil then
            v12 = v12 + 1;
            v13[v12] = sound;
        end;
    end;

    v14.sounds = v13;
    local v15 = u3.values(Pings);

    local function _(p16) -- Line: 76
        return p16.image;
    end;

    local v17 = table.create(#v15);

    for i, v in v15 do
        local _ = i - 1;
        v17[i] = v.image;
    end;

    v14.imageIds = v17;
    PreloadController:runPreload(v14);
    default.Client:Get("LocationPinged"):Connect(function(p18) -- Line: 87
        -- upvalues: ClientStore (ref), MatchState (ref), u10 (copy)
        local location = p18.location;
        local pingType = p18.pingType;
        local creator = p18.creator;

        if ClientStore:getState().Game.matchState == MatchState.PRE then
            return nil;
        end;

        u10:createIndicator(location, pingType, creator);
    end);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        actionId = "ping-location",
        action = "Ping",

        boundFunction = function(p19, p20, p21) -- Line: 99, Name: boundFunction
            -- upvalues: u10 (copy), PING_SLOTS (ref), getPingFromSlot (ref), u4 (ref), KnitClient (ref), DeviceUtil (ref), u3 (ref), PingType (ref)
            if p20 == Enum.UserInputState.Begin then
                u10:setSelectedSlot(nil);
                u10.pingPosition = u10:getMousePosition();
                local u22 = 1;
                local v23 = false;
                local v24 = {};

                while true do
                    if true then
                        if v23 then
                            u22 = u22 + 1;
                        else
                            v23 = true;
                        end;
                    end;

                    if u22 > PING_SLOTS then
                        break;
                    end;

                    local v25 = getPingFromSlot(u22);
                    v24[u22] = {
                        element = u4.createElement("ImageLabel", {
                            BackgroundTransparency = 1,
                            Image = v25.data.image,
                            ImageColor3 = v25.data.color,
                            Size = UDim2.fromScale(0.9, 0.9)
                        }),
                        title = v25.data.title,

                        onSelect = function() -- Line: 127, Name: onSelect
                            -- upvalues: u10 (ref), u22 (ref), KnitClient (ref)
                            u10:setSelectedSlot(u22);
                            KnitClient.Controllers.RadialWheelController:closeRadialWheel();
                        end
                    };
                    u22 = u22;
                end;

                local v26 = DeviceUtil.isGamepadControls();
                local RadialWheelController = KnitClient.Controllers.RadialWheelController;
                local v27 = u3.values(v24);
                local v28;

                if v26 then
                    v28 = UDim2.fromScale(0.5, 0.5);
                else
                    local v29;

                    if p21 == nil then
                        v29 = p21;
                    else
                        v29 = p21.Position.X;
                    end;

                    local v30;

                    if p21 == nil then
                        v30 = p21;
                    else
                        v30 = p21.Position.Y;
                    end;

                    v28 = UDim2.fromOffset(v29, v30);
                end;

                local v31;

                if v26 then
                    v31 = UDim2.fromScale(0.6, 0.6);
                else
                    v31 = nil;
                end;

                RadialWheelController:openRadialWheel(v27, PING_SLOTS, p21, true, v28, v31, function() -- Line: 155
                    -- upvalues: u10 (ref), getPingFromSlot (ref), PingType (ref)
                    if u10.pingPosition then
                        local pingPosition = u10.pingPosition;
                        local selectedSlot = u10.selectedSlot;
                        local v32;

                        if selectedSlot == 0 or (selectedSlot ~= selectedSlot or not selectedSlot) then
                            v32 = PingType.GENERIC;
                        else
                            v32 = getPingFromSlot(u10.selectedSlot).pingType;
                        end;

                        u10:ping(pingPosition, v32);
                    end;
                end);
            end;
        end
    });
end;

function u7.ping(p33, p34, p35) -- Line: 167
    -- upvalues: Workspace (copy), PingConstants (copy), Players (copy), default (copy)
    if Workspace:GetServerTimeNow() - p33.lastPing < PingConstants.PING_COOLDOWN then
        return nil;
    end;

    p33.lastPing = Workspace:GetServerTimeNow();
    local v36 = p34 + Vector3.new(0, 2, 0);
    p33:createIndicator(v36, p35, Players.LocalPlayer);
    default.Client:Get("Ping"):SendToServer({
        location = v36,
        pingType = p35
    });
end;

function u7.notificationPing(p37, p38, p39) -- Line: 182
    -- upvalues: Players (copy)
    p37:createIndicator(p38 + Vector3.new(0, 2, 0), p39, Players.LocalPlayer, {
        hidePlayerIcon = true
    });
end;

function u7.enableTouchPing(u40) -- Line: 190
    -- upvalues: ContextActionService (copy), getPingFromSlot (copy), PingType (copy)
    u40.touchPingEnabled = true;
    ContextActionService:BindAction("touch-ping", function(p41, p42, p43) -- Line: 192
        -- upvalues: u40 (copy), getPingFromSlot (ref), PingType (ref)
        u40.pingPosition = u40:getMousePosition();

        if u40.pingPosition then
            local pingPosition = u40.pingPosition;
            local selectedSlot = u40.selectedSlot;
            local v44;

            if selectedSlot == 0 or (selectedSlot ~= selectedSlot or not selectedSlot) then
                v44 = PingType.GENERIC;
            else
                v44 = getPingFromSlot(u40.selectedSlot).pingType;
            end;

            u40:ping(pingPosition, v44);
        end;

        u40:disableTouchPing();
    end, false, Enum.UserInputType.MouseButton1, Enum.UserInputType.Touch);
end;

function u7.disableTouchPing(p45) -- Line: 203
    -- upvalues: ContextActionService (copy)
    p45.touchPingEnabled = false;
    ContextActionService:UnbindAction("touch-ping");
end;

function u7.setSelectedSlot(p46, p47) -- Line: 207
    p46.selectedSlot = p47;
end;

function u7.createIndicator(p48, p49, p50, p51, p52) -- Line: 210
    -- upvalues: SoundManager (copy), Pings (copy), GameSound (copy), Players (copy), StringUtil (copy), IndicatorTransparencyFunctions (copy), PingConstants (copy), Flamework (copy), IndicatorUIType (copy), PingGuiObject (copy), TweenService (copy), ConstraintType (copy)
    local sound = Pings[p50].sound;

    if sound == nil then
        sound = GameSound.PING;
    end;

    local v53 = {
        rollOffMaxDistance = 1500,
        rollOffMinDistance = 1400
    };
    local v54;

    if p51 == Players.LocalPlayer then
        v54 = nil;
    else
        v54 = p49;
    end;

    v53.position = v54;
    SoundManager:playSound(sound, v53);

    local function v60(p55, p56, p57, p58, p59) -- Line: 222
        -- upvalues: Players (ref), StringUtil (ref)
        local Container = p58:FindFirstChild("Container");

        if Container ~= nil then
            Container = Container:FindFirstChild("PingCreatorAvatar");
        end;

        if Container and p59 then
            if p59 ~= nil then
                p59 = p59.UserId;
            end;

            Container.Image = Players:GetUserThumbnailAsync(p59, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size352x352);
        end;

        local Container2 = p58:FindFirstChild("Container");

        if Container2 ~= nil then
            Container2 = Container2:FindFirstChild("DistanceTracker");
        end;

        if Container2 then
            Container2.Text = "<b>" .. StringUtil.roundNumber(p55 / 3, 0) .. "m</b>";
        end;
    end;

    local v61;

    if p52 == nil then
        v61 = p52;
    else
        v61 = p52.indicatorLifetime;
    end;

    if v61 == nil then
        v61 = PingConstants.PING_LIFETIME;
    end;

    local u62 = IndicatorTransparencyFunctions:fadeOverTime(v61 - 1, 1);
    local v63 = Pings[p50];
    local v64 = p51 or Players.LocalPlayer;
    local v65 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/indicators/world-indicator-controller@WorldIndicatorController");
    local v66 = {
        uiType = IndicatorUIType.Custom
    };
    local v67 = {
        color3 = Color3.new(255, 255, 255)
    };
    local image = v63.image;
    local color = v63.color;
    local v68 = {};
    local v69;

    if p52 == nil then
        v69 = p52;
    else
        v69 = p52.hidePlayerIcon;
    end;

    v68.disablePlayerAvatar = v69;
    v67.template = PingGuiObject(image, color, v68);

    function v67.transparency(p70, p71, p72) -- Line: 277
        -- upvalues: u62 (copy)
        local u73 = u62(p71);

        local function _(p74) -- Line: 280
            -- upvalues: u73 (copy)
            if p74:IsA("TextLabel") then
                p74.TextTransparency = u73;
            end;

            if p74:IsA("UIStroke") then
                p74.Transparency = u73;
            end;

            if p74:IsA("ImageLabel") then
                p74.ImageTransparency = u73;
            end;
        end;

        for i, descendant in p70:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("TextLabel") then
                descendant.TextTransparency = u73;
            end;

            if descendant:IsA("UIStroke") then
                descendant.Transparency = u73;
            end;

            if descendant:IsA("ImageLabel") then
                descendant.ImageTransparency = u73;
            end;
        end;

        return u73;
    end;

    v67.distanceRelativeToPlayer = true;
    v67.scaleWithAlpha = false;
    v67.scaleOnFade = false;
    v67.easeOutOnAppoach = false;

    function v67.onEnterAnimation(p75) -- Line: 300
        -- upvalues: TweenService (ref)
        local PingIcon = p75:FindFirstChild("PingIcon");

        if PingIcon ~= nil then
            PingIcon = PingIcon:Clone();
        end;

        if not PingIcon then
            return nil;
        end;

        PingIcon.Parent = p75;
        local u76 = TweenService:Create(PingIcon, TweenInfo.new(0.15), {
            ImageTransparency = 1,
            Size = UDim2.fromScale(1.5, 1.5)
        });
        u76:Play();
        u76.Completed:Connect(function() -- Line: 315
            -- upvalues: u76 (copy), PingIcon (copy)
            u76:Destroy();
            PingIcon:Destroy();
        end);
    end;

    v66.uiConfig = v67;
    local v77;

    if p52 == nil then
        v77 = p52;
    else
        v77 = p52.hidePlayerIcon;
    end;

    if v77 then
        v64 = nil;
    end;

    v66.creator = v64;
    v66.attachTo = p49;
    v66.constraintType = ConstraintType.Constrained;
    v66.onUpdateProperties = v60;
    local u78 = v65:addIndicator(v66);

    if p52 ~= nil then
        p52 = p52.indicatorLifetime;
    end;

    if p52 == nil then
        p52 = PingConstants.PING_LIFETIME;
    end;

    task.delay(p52 + 2, function() -- Line: 340
        -- upvalues: u78 (copy)
        u78:destroy();
    end);

    return u78;
end;

function u7.getMousePosition(p79) -- Line: 345
    -- upvalues: Players (copy), GameQueryUtil (copy)
    local UnitRay = Players.LocalPlayer:GetMouse().UnitRay;
    local Character = Players.LocalPlayer.Character;

    if not Character then
        return nil;
    end;

    local v80 = RaycastParams.new();
    v80.FilterDescendantsInstances = { Character };
    v80.FilterType = Enum.RaycastFilterType.Blacklist;
    local v82 = GameQueryUtil:raycast(UnitRay.Origin, UnitRay.Direction.Unit * 1000, v80, {
        ignorePart = function(p81) -- Line: 355, Name: ignorePart
            return p81:IsA("BasePart") and not p81.CanCollide and true or false;
        end
    });

    if v82 ~= nil then
        v82 = v82.Position;
    end;

    return v82;
end;

Reflect.defineMetadata(u7, "identifier", "client/controllers/game/ping/ping-controller@PingController");
Reflect.defineMetadata(u7, "flamework:implements", { "$:flamework@OnStart" });
Reflect.decorate(u7, "$:flamework@Controller", Controller, { {} });

return {
    PingController = u7
};