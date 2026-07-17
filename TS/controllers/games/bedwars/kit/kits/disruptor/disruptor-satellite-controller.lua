-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local GameQueryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitServer = v1.KnitServer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local SatelliteStateVariant = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "kit", "zenith", "satellite-state-variant").SatelliteStateVariant;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "pid");
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "DisruptorSatelliteController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 26
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 30
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "DisruptorSatelliteController";
    p7.satellites = {};
end;

function u5.KnitStart(u8) -- Line: 35
    -- upvalues: KnitController (copy), default (copy)
    KnitController.KnitStart(u8);
    default.Client:Get("UpdateZenithSatellite"):Connect(function(p9, p10) -- Line: 37
        -- upvalues: u8 (copy)
        u8:changeCircleOrigin(p10, p9);
    end);
    default.Client:Get("SpawnZenithSatellite"):Connect(function(p11, p12) -- Line: 40
        -- upvalues: u8 (copy)
        u8:spawnSatellite(p11, p12, {
            circlingRadius = 100,
            circleOrigin = p11
        });

        if not u8.satelliteHeartbeat then
            u8:startSatelliteHeartbeat();
        end;
    end);
    default.Client:Get("RemoveZenithSatellite"):Connect(function(p13) -- Line: 50
        -- upvalues: u8 (copy)
        u8:destroySatellite(p13);

        if #u8.satellites == 0 then
            local satelliteHeartbeat = u8.satelliteHeartbeat;

            if satelliteHeartbeat ~= nil then
                satelliteHeartbeat:Disconnect();
            end;

            u8.satelliteHeartbeat = nil;
        end;
    end);
end;

function u5.startSatelliteHeartbeat(u14) -- Line: 62
    -- upvalues: RunService (copy)
    local v24 = RunService.Heartbeat:Connect(function(p15) -- Line: 63
        -- upvalues: u14 (copy)
        debug.profilebegin("satellite-service");

        for _, v in u14.satellites do
            v.elapsedTime = v.elapsedTime + p15;

            if v.instance then
                local v16 = v.instance:GetPivot();
                local v17 = Vector3.new(0, 0.01, 0);

                if v.state.type == "circling" then
                    local circlingRadius = v.circlingRadius;
                    local v18 = circlingRadius == nil and 300 or circlingRadius;
                    local circleOrigin = v.circleOrigin;
                    local v19 = math.sin(v.elapsedTime / 4.5) * v18;
                    local v20 = math.cos(v.elapsedTime / 4.5) * v18;
                    local v21 = circleOrigin + Vector3.new(v19, 0, v20);
                    local speedMultiplier = v.speedMultiplier;
                    local v22 = v.circlingPid:Calculate(p15, (v16.Position - v21).Magnitude * (speedMultiplier == nil and 1 or speedMultiplier), 0);
                    v17 = v17 + (v21 - v16.Position).Unit * v22;
                end;

                local v23 = (v16 * CFrame.new(0, 0, -10)).Position + v17 - v16.Position;
                v.linearVelocity.VectorVelocity = v23.Unit * v23.Magnitude;
                v.instance.Propeller.Orientation = v.instance.Propeller.Orientation + Vector3.new(0, 10, 0);
            end;
        end;

        debug.profileend();
    end);
    u14.satelliteHeartbeat = v24;

    return v24;
end;

function u5.spawnSatellite(p25, p26, p27, p28) -- Line: 114
    -- upvalues: ReplicatedStorage (copy), GameQueryUtil (copy), u2 (copy), Workspace (copy), KnitServer (copy), u4 (copy), SatelliteStateVariant (copy)
    if p26 == nil then
        p26 = Vector3.new();
    end;

    local v29 = ReplicatedStorage.Assets.Misc.Satellite:Clone();
    GameQueryUtil:setQueryIgnored(v29, true);
    v29.Propeller.CanCollide = false;
    v29.Base.CanCollide = false;
    v29.Neon.CanCollide = false;
    local PrimaryPart = v29.PrimaryPart;
    PrimaryPart.CanCollide = false;
    local v30 = u2("Attachment", {
        Parent = PrimaryPart
    });
    local v31 = u2("Attachment", {
        Parent = Workspace.Terrain
    });
    local v32 = u2("LinearVelocity", {
        Parent = PrimaryPart,
        MaxForce = PrimaryPart.AssemblyMass * 100000000,
        Attachment0 = v30
    });
    local v33 = u2("AlignOrientation", {
        Responsiveness = 13,
        Parent = PrimaryPart,
        Attachment0 = v30,
        Attachment1 = v31,
        MaxTorque = PrimaryPart.AssemblyMass * 100000000
    });
    v29:PivotTo(CFrame.new(p26));
    v29.Parent = Workspace;
    local v34;

    if p28 == nil then
        v34 = p28;
    else
        v34 = p28.circleOrigin;
    end;

    if v34 == nil then
        local v35 = KnitServer.Services.MapService:waitForMapDocument();
        local v36 = v35:getLocationConfig("respawn_view");

        if v36 ~= nil then
            v36 = v36:getWorldCFrame();
        end;

        if not v36 then
            v36 = v35:getLocationConfig("center");

            if v36 ~= nil then
                v36 = v36:getWorldCFrame() + Vector3.new(0, 150, 0);
            end;
        end;

        v34 = ((v36 or CFrame.new()) * CFrame.new(0, 160, 0)).Position;
    end;

    local v37 = u4.new(20, 50, 0.8, 0, 0);
    v37:Debug("CircleAccelPID", Workspace);
    u4.new(20, 400, 1, 0, 0):Debug("DivingAccelPID", Workspace);
    v29:SetAttribute("circling", nil);
    local v38 = {
        elapsedTime = 0,
        instance = v29,
        alignOrientation = v33,
        rotationAttachment = v31,
        linearVelocity = v32,
        circleOrigin = v34,
        circlingPid = v37
    };
    local v39;

    if p28 == nil then
        v39 = p28;
    else
        v39 = p28.circlingRadius;
    end;

    v38.circlingRadius = v39;
    v38.state = SatelliteStateVariant.circling({});

    if p28 ~= nil then
        p28 = p28.speedMultiplier;
    end;

    v38.speedMultiplier = p28;
    v38.player = p27;
    table.insert(p25.satellites, v38);

    return v38;
end;

function u5.destroySatellite(p40, u41) -- Line: 202
    local function _(p42) -- Line: 204
        -- upvalues: u41 (copy)
        return p42.player == u41;
    end;

    local v43 = nil;

    for i, v in p40.satellites do
        local _ = i - 1;

        if v.player == u41 == true then
            v43 = v;
            break;
        end;
    end;

    if v43 then
        local satellites = p40.satellites;
        local v44 = (table.find(p40.satellites, v43) or 0) - 1;
        table.remove(satellites, v44 + 1);
        v43.instance:Destroy();
    end;
end;

function u5.changeCircleOrigin(p45, u46, p47) -- Line: 224
    local function _(p48) -- Line: 226
        -- upvalues: u46 (copy)
        return p48.player == u46;
    end;

    local v49 = nil;

    for i, v in p45.satellites do
        local _ = i - 1;

        if v.player == u46 == true then
            v49 = v;
            break;
        end;
    end;

    if v49 then
        v49.circleOrigin = p47;
    end;
end;

KnitClient.CreateController(u5.new());

return nil;