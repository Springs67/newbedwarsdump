-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AbilityState = v1.AbilityState;
local MobileTouchType = v1.MobileTouchType;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local VehicleType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-type").VehicleType;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "FlyingCloudController";
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
    p6.Name = "FlyingCloudController";
    p6.activeCloudPilots = {};
end;

function u4.KnitStart(u7) -- Line: 40
    -- upvalues: KnitController (copy), VehicleType (copy), ClientSyncEvents (copy), AbilityId (copy), Players (copy), default (copy), u2 (copy), SoundManager (copy), GameSound (copy), Flamework (copy), AbilityState (copy), MobileTouchType (copy)
    KnitController.KnitStart(u7);
    u7:watchCloudVehicle(VehicleType.FLYING_CLOUD);
    ClientSyncEvents.AbilityEnabled:connect(function(p8) -- Line: 43
        -- upvalues: AbilityId (ref), u7 (copy), Players (ref)
        if p8.ability.abilityId ~= AbilityId.CLOUD_LIGHTNING_STRIKE then
            return nil;
        end;

        function p8.ability.getExtraData() -- Line: 47
            -- upvalues: u7 (ref), Players (ref)
            return u7:getCloudAbilityExtra(Players.LocalPlayer);
        end;
    end);
    default.Client:Get("FlyingCloudPilotMount"):Connect(function(p9) -- Line: 51
        -- upvalues: Players (ref), u2 (ref), SoundManager (ref), GameSound (ref), u7 (copy), Flamework (ref), AbilityId (ref), AbilityState (ref), MobileTouchType (ref)
        local player = p9.player;
        local UserId = Players.LocalPlayer.UserId;
        local v10 = u2.new();

        if player.UserId ~= UserId then
            return nil;
        end;

        SoundManager:playSound(GameSound.FLYING_CLOUD_MOUNT, {
            volumeMultiplier = 0.7
        });

        if u7.activeCloudPilots[p9.player.UserId] ~= nil then
            local v11 = u7.activeCloudPilots[p9.player.UserId];

            if v11 ~= nil then
                v11:DoCleaning();
            end;

            u7.activeCloudPilots[p9.player.UserId] = nil;
        end;

        v10:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.CLOUD_LIGHTNING_STRIKE, {
            abilityType = "ItemPrimary",
            clickToTrigger = true,
            abilityButton = {
                icon = "rbxassetid://13261737928",
                stateColors = {
                    [AbilityState.READY] = Color3.fromRGB(130, 168, 191)
                }
            }
        }):expect());
        v10:GiveTask((Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
            action = "Attack",
            actionId = "cloud_lightning_strike",

            boundFunction = function(p12, p13, p14) -- Line: 89, Name: boundFunction
                -- upvalues: player (copy), u7 (ref), Flamework (ref), AbilityId (ref)
                if p14.UserInputType == Enum.UserInputType.Touch and p13 ~= Enum.UserInputState.End then
                    return Enum.ContextActionResult.Pass;
                end;

                if player ~= nil then
                    local v15 = u7:getCloudAbilityExtra(player);
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.CLOUD_LIGHTNING_STRIKE, p14, v15);
                end;
            end,

            mobile = {
                touchType = MobileTouchType.TouchBeginEnd
            }
        })));
        u7.activeCloudPilots[player.UserId] = v10;
    end);
    default.Client:Get("FlyingCloudPilotDismount"):Connect(function(p16) -- Line: 111
        -- upvalues: u7 (copy)
        if u7.activeCloudPilots[p16.player.UserId] ~= nil then
            local v17 = u7.activeCloudPilots[p16.player.UserId];

            if v17 ~= nil then
                v17:DoCleaning();
            end;

            u7.activeCloudPilots[p16.player.UserId] = nil;
        end;
    end);
end;

function u4.watchCloudVehicle(p18, p19) -- Line: 130
    -- upvalues: WatchCollectionTag (copy)
    WatchCollectionTag(p19, function(p20) -- Line: 131
        if not p20.PrimaryPart then
            p20:GetPropertyChangedSignal("PrimaryPart"):Wait();
        end;
    end);
end;

function u4.getCloudAbilityExtra(p21, p22) -- Line: 137
    -- upvalues: Workspace (copy), BalanceFile (copy)
    local Character = p22.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if Character == nil then
        return nil;
    end;

    local v23 = Workspace:Raycast(Character + Vector3.new(0, -5, 0), Vector3.new(0, -1, 0) * BalanceFile.FLYING_CLOUD_STRIKE_MAX_RANGE);

    if v23 then
        if v23.Instance.Name == "Part" then
            return nil;
        end;

        local Position = v23.Position;

        return Position ~= nil and {
            target = Position
        } or nil;
    end;
end;

KnitClient.CreateController(u4.new());

return nil;