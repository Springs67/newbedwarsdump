-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local VehicleType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-type").VehicleType;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "HotAirBalloonController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 31
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 35
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "HotAirBalloonController";
    p6.activeHotAirBalloonPilots = {};
end;

function u4.KnitStart(u7) -- Line: 40
    -- upvalues: KnitController (copy), VehicleType (copy), default (copy), Players (copy), u2 (copy), SoundManager (copy), GameSound (copy), PlaceUtil (copy), Flamework (copy), AbilityId (copy), RunService (copy), GameQueryUtil (copy), ReplicatedStorage (copy), Workspace (copy)
    KnitController.KnitStart(u7);
    u7:watchHotAirBalloonVehicle(VehicleType.HOT_AIR_BALLOON);
    default.Client:Get("HotAirBalloonPlayerMount"):Connect(function(u8) -- Line: 43
        -- upvalues: Players (ref), u2 (ref), SoundManager (ref), GameSound (ref), u7 (copy), PlaceUtil (ref), Flamework (ref), AbilityId (ref), RunService (ref), GameQueryUtil (ref), ReplicatedStorage (ref), Workspace (ref)
        local player = u8.player;
        local UserId = Players.LocalPlayer.UserId;
        local v9 = u2.new();

        if player.UserId ~= UserId then
            return nil;
        end;

        SoundManager:playSound(GameSound.HOT_AIR_BALLOON_MOUNT, {
            volumeMultiplier = 0.7
        });

        if u7.activeHotAirBalloonPilots[u8.player.UserId] ~= nil then
            local v10 = u7.activeHotAirBalloonPilots[u8.player.UserId];

            if v10 ~= nil then
                v10:DoCleaning();
            end;

            u7.activeHotAirBalloonPilots[u8.player.UserId] = nil;
        end;

        if not PlaceUtil.isLobbyServer() then
            v9:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.HOT_AIR_BALLOON_TNT, {
                abilityType = "ItemPrimary",
                clickToTrigger = false,
                abilityButton = {
                    icon = "rbxassetid://17332947490"
                }
            }):expect());
        end;

        local u11 = nil;
        v9:GiveTask(function() -- Line: 76
            -- upvalues: u11 (ref)
            local v12 = u11;

            if v12 ~= nil then
                v12:Destroy();
            end;
        end);
        v9:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 82
            -- upvalues: u8 (copy), u11 (ref), GameQueryUtil (ref), ReplicatedStorage (ref), Workspace (ref)
            local Root = u8.vehicle:FindFirstChild("Root");

            if Root ~= nil then
                Root = Root:FindFirstChild("Cannon");
            end;

            if Root == nil then
                local v13 = u11;

                if v13 ~= nil then
                    v13:Destroy();
                end;

                return nil;
            end;

            local v14 = RaycastParams.new();
            v14.FilterType = Enum.RaycastFilterType.Exclude;
            v14.FilterDescendantsInstances = { u8.vehicle };
            local v15 = GameQueryUtil:raycast(Root.Position, Vector3.new(0, -1000, 0), v14);
            local v16;

            if v15 == nil then
                v16 = v15;
            else
                v16 = v15.Instance;
            end;

            if not v16 then
                local v17 = u11;

                if v17 ~= nil then
                    v17:Destroy();
                end;

                return nil;
            end;

            if math.abs(v15.Position.Y - Root.Position.Y) < 10 then
                local v18 = u11;

                if v18 ~= nil then
                    v18:Destroy();
                end;

                return nil;
            end;

            if not u11 then
                u11 = ReplicatedStorage.Assets.Effects.TNTTarget:Clone();
                u11.Parent = Workspace;
                u11.Transparency = 0.5;
                u11:WaitForChild("Decal").Transparency = 0.3;
            end;

            u11.Position = v15.Position;
        end));
        u7.activeHotAirBalloonPilots[player.UserId] = v9;
    end);
    default.Client:Get("HotAirBalloonPlayerDismount"):Connect(function(p19) -- Line: 129
        -- upvalues: u7 (copy)
        if u7.activeHotAirBalloonPilots[p19.player.UserId] ~= nil then
            local v20 = u7.activeHotAirBalloonPilots[p19.player.UserId];

            if v20 ~= nil then
                v20:DoCleaning();
            end;

            u7.activeHotAirBalloonPilots[p19.player.UserId] = nil;
        end;
    end);
end;

function u4.watchHotAirBalloonVehicle(p21, p22) -- Line: 145
    -- upvalues: WatchCollectionTag (copy)
    WatchCollectionTag(p22, function(p23) -- Line: 146
        if not p23.PrimaryPart then
            p23:GetPropertyChangedSignal("PrimaryPart"):Wait();
        end;
    end);
end;

KnitClient.CreateController(u4.new());

return nil;