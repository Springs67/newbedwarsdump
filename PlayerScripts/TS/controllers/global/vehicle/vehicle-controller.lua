-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local getVehicleMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-meta").getVehicleMeta;
local VehicleUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-util").VehicleUtil;
local HelicopterPilotClient = RuntimeLib.import(script, script.Parent, "helicopter", "helicopter-pilot-client").HelicopterPilotClient;
local UfoPilotClient = RuntimeLib.import(script, script.Parent, "ufo", "ufo-pilot-client").UfoPilotClient;
local FlyingCarpetPilot = RuntimeLib.import(script, script.Parent.Parent.Parent, "lobby", "lobby-gadget", "flying-carpet", "flying-carpet-pilot-client").FlyingCarpetPilot;
local VehicleType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-type").VehicleType;
local FlyingBroomPilot = RuntimeLib.import(script, script.Parent, "flying-broom", "flying-broom-pilot-client").FlyingBroomPilot;
local FlyingCloudPilot = RuntimeLib.import(script, script.Parent, "flying-cloud", "flying-cloud-pilot-client").FlyingCloudPilot;
local HotAirBalloonPilot = RuntimeLib.import(script, script.Parent, "hot-air-balloon", "hot-air-balloon-pilot-client").HotAirBalloonPilot;
local JellyfishMountPilot = RuntimeLib.import(script, script.Parent, "jellyfish-mount", "jellyfish-mount-pilot-client").JellyfishMountPilot;
local SleighPilot = RuntimeLib.import(script, script.Parent, "sleigh", "sleigh-pilot-client").SleighPilot;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 28, Name: __tostring
        return "VehicleController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 34
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 38
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "VehicleController";
end;

function u3.KnitStart(p6) -- Line: 42
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), u1 (copy), getVehicleMeta (copy), Players (copy), HelicopterPilotClient (copy), VehicleType (copy), UfoPilotClient (copy), FlyingCloudPilot (copy), HotAirBalloonPilot (copy), FlyingBroomPilot (copy), JellyfishMountPilot (copy), FlyingCarpetPilot (copy), SleighPilot (copy), ClientSyncEvents (copy), SyncEventPriority (copy), VehicleUtil (copy)
    KnitController.KnitStart(p6);
    WatchCollectionTag("vehicle", function(u7) -- Line: 44
        -- upvalues: u1 (ref), getVehicleMeta (ref), Players (ref), HelicopterPilotClient (ref), VehicleType (ref), UfoPilotClient (ref), FlyingCloudPilot (ref), HotAirBalloonPilot (ref), FlyingBroomPilot (ref), JellyfishMountPilot (ref), FlyingCarpetPilot (ref), SleighPilot (ref), ClientSyncEvents (ref), SyncEventPriority (ref), VehicleUtil (ref)
        local u8 = u1.new();
        u7.Destroying:Connect(function() -- Line: 46
            -- upvalues: u8 (copy)
            u8:DoCleaning();
        end);
        local u9 = getVehicleMeta(u7.Name);
        local Driver = u7:WaitForChild("Driver");

        if u9.checkOwner and u7:GetAttribute("PlacedByUserId") ~= Players.LocalPlayer.UserId then
            Driver.Disabled = true;
        end;

        local function u11() -- Line: 54
            -- upvalues: u9 (copy), HelicopterPilotClient (ref), u7 (copy), VehicleType (ref), UfoPilotClient (ref), FlyingCloudPilot (ref), HotAirBalloonPilot (ref), FlyingBroomPilot (ref), JellyfishMountPilot (ref), FlyingCarpetPilot (ref), SleighPilot (ref), Driver (copy)
            local v10 = nil;

            if u9.helicopter then
                v10 = HelicopterPilotClient.new(u7, u9.helicopter.attack);
            elseif u7.Name == VehicleType.UFO then
                v10 = UfoPilotClient.new(u7);
            elseif u7.Name == VehicleType.FLYING_CLOUD then
                v10 = FlyingCloudPilot.new(u7);
            elseif u7.Name == VehicleType.HOT_AIR_BALLOON then
                v10 = HotAirBalloonPilot.new(u7);
            elseif u7.Name == VehicleType.FLYING_BROOM then
                v10 = FlyingBroomPilot.new(u7);
            elseif u7.Name == VehicleType.JELLYFISH_MOUNT then
                v10 = JellyfishMountPilot.new(u7);
            elseif u7.Name == VehicleType.FLYING_CARPET then
                v10 = FlyingCarpetPilot.new(u7);
            elseif u7.Name == VehicleType.SLEIGH then
                v10 = SleighPilot.new(u7);
            else
                error("Failed to find vehicle client: " .. u7.Name);
            end;

            v10:enable(Driver);
        end;

        local function u12() -- Line: 77
            -- upvalues: Driver (copy), Players (ref), u7 (copy), VehicleType (ref), u9 (copy), u11 (copy)
            local Occupant = Driver.Occupant;

            if Occupant then
                local Occupant2 = Driver.Occupant;
                local Character = Players.LocalPlayer.Character;

                if Character ~= nil then
                    Character = Character:FindFirstChild("Humanoid");
                end;

                Occupant = Occupant2 == Character;
            end;

            if Occupant then
                if u7.Name == VehicleType.FLYING_CLOUD then
                    Players.LocalPlayer:SetAttribute("FlyingCloudPilot", true);
                end;

                if not u9.checkOwner or u7:GetAttribute("PlacedByUserId") == Players.LocalPlayer.UserId then
                    u11();
                end;
            end;
        end;

        u8:GiveTask(Driver:GetPropertyChangedSignal("Occupant"):Connect(function() -- Line: 96
            -- upvalues: u12 (copy)
            u12();
        end));
        u12();
        u8:GiveTask(ClientSyncEvents.ProjectileHit:setPriority(SyncEventPriority.HIGH):connect(function(p13) -- Line: 100
            -- upvalues: u7 (copy), VehicleUtil (ref)
            if p13:isCancelled() then
                return nil;
            end;

            local part = p13.hitData.part;

            if part ~= nil then
                part = part:IsDescendantOf(u7);
            end;

            if part and (p13.shooter and VehicleUtil:isInVehicle(p13.shooter:getInstance(), u7)) then
                p13:setCancelled(true);
            end;
        end));
    end);
end;

function u3.getVehicleModel(p14, p15) -- Line: 116
    -- upvalues: ReplicatedStorage (copy), CollectionService (copy)
    local Vehicles = ReplicatedStorage:FindFirstChild("Vehicles");

    if Vehicles ~= nil then
        Vehicles = Vehicles:FindFirstChild(p15);
    end;

    if not Vehicles then
        return nil;
    end;

    CollectionService:AddTag(Vehicles, "vehicle");
    CollectionService:AddTag(Vehicles, p15);

    return Vehicles:Clone();
end;

KnitClient.CreateController(u3.new());

return nil;