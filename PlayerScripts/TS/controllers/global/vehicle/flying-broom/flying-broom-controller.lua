-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ExpireMap = v1.ExpireMap;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local FlyingBroomBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "flying-broom-balance-file").FlyingBroomBalance;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local VehicleType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-type").VehicleType;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "FlyingBroomController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 30
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 34
    -- upvalues: KnitController (copy), ExpireMap (copy), FlyingBroomBalance (copy)
    KnitController.constructor(p7);
    p7.Name = "FlyingBroomController";
    p7.activePilots = {};
    p7.witchTrailMap = ExpireMap.new(FlyingBroomBalance.WITCH_TRAIL_DURATION);
end;

function u5.KnitStart(u8) -- Line: 40
    -- upvalues: KnitController (copy), VehicleType (copy), default (copy), Players (copy), u2 (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), Workspace (copy), GamePlayerUtil (copy), u3 (copy), FlyingBroomBalance (copy)
    KnitController.KnitStart(u8);
    u8:watchBroomVehicle(VehicleType.FLYING_BROOM);
    default.Client:Get("FlyingBroomPilotMount"):Connect(function(p9) -- Line: 43
        -- upvalues: Players (ref), u2 (ref), SoundManager (ref), GameSound (ref), u8 (copy)
        local player = p9.player;
        local UserId = Players.LocalPlayer.UserId;
        local v10 = u2.new();

        if player.UserId ~= UserId then
            return nil;
        end;

        SoundManager:playSound(GameSound.WITCH_BROOM_MOUNT, {
            volumeMultiplier = 0.7
        });

        if u8.activePilots[p9.player.UserId] ~= nil then
            local v11 = u8.activePilots[p9.player.UserId];

            if v11 ~= nil then
                v11:DoCleaning();
            end;

            u8.activePilots[p9.player.UserId] = nil;
        end;

        u8.activePilots[player.UserId] = v10;
    end);
    default.Client:Get("FlyingBroomPilotDismount"):Connect(function(p12) -- Line: 71
        -- upvalues: SoundManager (ref), GameSound (ref), u8 (copy)
        SoundManager:playSound(GameSound.WITCH_BROOM_DISMOUNT, {
            volumeMultiplier = 0.7
        });

        if u8.activePilots[p12.player.UserId] ~= nil then
            local v13 = u8.activePilots[p12.player.UserId];

            if v13 ~= nil then
                v13:DoCleaning();
            end;

            u8.activePilots[p12.player.UserId] = nil;
        end;
    end);
    default.Client:Get("FlyingBroomTrailPositionPlaced"):Connect(function(p14) -- Line: 89
        -- upvalues: ReplicatedStorage (ref), u8 (copy), Workspace (ref), SoundManager (ref), GameSound (ref), GamePlayerUtil (ref), Players (ref), u3 (ref), FlyingBroomBalance (ref)
        local v15 = ReplicatedStorage.Assets.Effects.WitchTrail:Clone();
        local PrimaryPart = v15.PrimaryPart;
        local trailTeamId = p14.trailTeamId;
        u8.witchTrailMap:set(p14.trailPosition, {
            trailModel = v15,
            trailTeamId = trailTeamId
        });

        if PrimaryPart ~= nil then
            v15.Parent = Workspace;
            v15.Name = "WitchTrail@" .. tostring(p14.trailPosition);
            v15:PivotTo(CFrame.new(p14.trailPosition));
            PrimaryPart.Anchored = true;
            PrimaryPart.CanCollide = false;
            PrimaryPart.CanTouch = false;
            PrimaryPart.Position = p14.trailPosition;
            SoundManager:playSound(GameSound.WITCH_BROOM_TRAIL_LOOP, {
                rollOffMaxDistance = 120,
                rollOffMinDistance = 50,
                looped = true,
                volumeMultiplier = 0.8,
                parent = PrimaryPart,
                position = PrimaryPart.Position
            });

            if GamePlayerUtil.getGamePlayer(Players.LocalPlayer):getTeamId() ~= trailTeamId then
                u3("Highlight", {
                    Name = "WitchTrailHighlight",
                    FillTransparency = 0.7,
                    OutlineTransparency = 0.2,
                    FillColor = Color3.fromRGB(255, 61, 0),
                    OutlineColor = Color3.fromRGB(255, 0, 0),
                    Parent = v15
                }).Enabled = true;
            end;

            task.delay(FlyingBroomBalance.WITCH_TRAIL_DURATION, function() -- Line: 126
                -- upvalues: PrimaryPart (copy)
                PrimaryPart:Destroy();
            end);
        end;
    end);
    default.Client:Get("FlyingBroomTrailDamageEvent"):Connect(function(p16) -- Line: 131
        -- upvalues: u8 (copy)
        local v17 = u8.witchTrailMap:get(p16.trailPosition);

        if v17 ~= nil then
            v17 = v17.trailModel;
        end;

        local trailPosition = p16.trailPosition;
        local hitPlayer = p16.hitPlayer;

        if v17 == nil or (trailPosition == nil or hitPlayer == nil) then
            return nil;
        end;

        u8:trailDamageEffects(v17, trailPosition, hitPlayer);
    end);
end;

function u5.watchBroomVehicle(p18, p19) -- Line: 145
    -- upvalues: WatchCollectionTag (copy), SoundManager (copy), GameSound (copy)
    WatchCollectionTag(p19, function(p20) -- Line: 146
        -- upvalues: SoundManager (ref), GameSound (ref)
        if not p20.PrimaryPart then
            p20:GetPropertyChangedSignal("PrimaryPart"):Wait();
        end;

        local WITCH_BROOM_SPAWN = GameSound.WITCH_BROOM_SPAWN;
        local v21 = {
            volumeMultiplier = 1.4
        };
        local PrimaryPart = p20.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        v21.position = PrimaryPart;
        SoundManager:playSound(WITCH_BROOM_SPAWN, v21);
    end);
end;

function u5.trailDamageEffects(p22, p23, p24, p25) -- Line: 164
    local Character = p25.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;
end;

KnitClient.CreateController(u5.new());

return nil;