-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AbilityState = v1.AbilityState;
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local TimedProgressBar = v1.TimedProgressBar;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local isUsingKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 35, Name: __tostring
        return "ScarabKitController";
    end,

    __index = BaseKitController
});
u6.__index = u6;

function u6.new(...) -- Line: 41
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 45
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), u2 (copy), Workspace (copy)
    BaseKitController.constructor(p8, BedwarsKit.SCARAB);
    p8.Name = "ScarabKitController";
    p8.spellAbilityMaid = u2.new();
    p8.maid = u2.new();
    p8.enabled = false;
    p8.camera = Workspace.CurrentCamera;
    p8.targetPosition = nil;
    p8.buttonMaid = u2.new();
end;

function u6.KnitStart(p9) -- Line: 55
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p9);
end;

function u6.onKitLocalActivated(u10, p11) -- Line: 58
    -- upvalues: Flamework (copy), AbilityId (copy), BedwarsImageId (copy), ClientSyncEvents (copy), ItemType (copy), AbilityState (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.PLACE_SCARAB_HIVE, {
        abilityType = "KitPrimary",
        abilityButton = {
            icon = BedwarsImageId.SCARAB_SPAWNER_1
        },

        getExtraData = function() -- Line: 64, Name: getExtraData
        end
    }):andThen(function(p12) -- Line: 66
        -- upvalues: u10 (copy)
        u10.abilityRef = p12;
    end);
    u10.enabledAbility = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.PLACE_SCARAB_HIVE);
    p11:GiveTask(ClientSyncEvents.NewHandItem:connect(function(p13) -- Line: 71
        -- upvalues: u10 (copy)
        if u10.enabled then
            p13:setCancelled(true);
        end;
    end));
    p11:GiveTask(ClientSyncEvents.ItemAdded:connect(function(p14) -- Line: 76
        -- upvalues: ItemType (ref), u10 (copy), AbilityState (ref), Flamework (ref)
        if p14.item.Name == ItemType.SCARAB_SPAWNER and (u10.enabledAbility and u10.enabledAbility.abilityState == AbilityState.DISABLED) then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u10.enabledAbility, AbilityState.READY);
        end;
    end));
    p11:GiveTask(ClientSyncEvents.ItemRemoved:connect(function(p15) -- Line: 83
        -- upvalues: ItemType (ref), u10 (copy), Flamework (ref), AbilityState (ref)
        if p15.itemType == ItemType.SCARAB_SPAWNER and u10.enabledAbility then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u10.enabledAbility, AbilityState.DISABLED);
        end;
    end));
end;

function u6.onKitLocalDeactivated(p16) -- Line: 91
end;

function u6.onKitReplicationActivated(p17, p18) -- Line: 93
    -- upvalues: WatchCollectionTag (copy), Players (copy), ReplicatedStorage (copy), u4 (copy), TimedProgressBar (copy), u3 (copy), Workspace (copy), SoundManager (copy), GameSound (copy), default (copy), CollectionService (copy), RandomUtil (copy), GameQueryUtil (copy)
    p18:GiveTask(WatchCollectionTag("scarab_spawner", function(u19) -- Line: 94
        -- upvalues: Players (ref), ReplicatedStorage (ref), u4 (ref), TimedProgressBar (ref)
        task.spawn(function() -- Line: 95
            -- upvalues: u19 (copy), Players (ref), ReplicatedStorage (ref), u4 (ref), TimedProgressBar (ref)
            local v20 = u19:GetAttribute("PlacedByUserId");
            local v21 = ColorSequence.new(Color3.fromRGB(43, 255, 0), Color3.fromRGB(43, 255, 0));

            if v20 ~= 0 and (v20 == v20 and v20) then
                local v22 = Players:GetPlayerByUserId(v20);

                if v22 and v22.Team == Players.LocalPlayer.Team then
                    v21 = ColorSequence.new(Color3.fromRGB(43, 255, 0), Color3.fromRGB(43, 255, 0));
                else
                    v21 = ColorSequence.new(Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 0, 0));
                end;
            end;

            local ScarabSpawnerOne = ReplicatedStorage.Assets.Effects.ScarabSpawnerOne;
            local v23 = 0;

            while u19:GetAttribute("ScarabHiveLevel") == nil and v23 < 5 do
                task.wait(0.2);
                v23 = v23 + 1;
            end;

            local v24 = u19:GetAttribute("ScarabHiveLevel");

            if v24 == 2 then
                ScarabSpawnerOne = ReplicatedStorage.Assets.Effects.ScarabSpawnerTwo;
            end;

            if v24 == 3 then
                ScarabSpawnerOne = ReplicatedStorage.Assets.Effects.ScarabSpawnerThree;
            end;

            local v25 = ScarabSpawnerOne:Clone();
            v25:PivotTo(CFrame.new(u19.Position) + Vector3.new(-0.35, 0, 0));
            v25.Parent = u19;
            local v26 = u19:GetAttribute("ExpireTime");

            if v26 ~= 0 and (v26 == v26 and v26) then
                u4.mount(u4.createElement("BillboardGui", {
                    StudsOffsetWorldSpace = Vector3.new(0, 2, 0),
                    MaxDistance = 110,
                    ExtentsOffset = Vector3.new(0, 0, 0),
                    Size = UDim2.fromScale(4.5, 1)
                }, { u4.createElement(TimedProgressBar, {
                        Size = UDim2.fromScale(0.5, 0.2),
                        EndTime = v26,
                        ProgressBarConfig = {
                            GradientRotation = 0,
                            Flip = true,
                            BarGradient = v21
                        }
                    }) }), u19);
            end;
        end);
    end));
    p18:GiveTask(WatchCollectionTag("explosive-spider", function(u27) -- Line: 146
        -- upvalues: u3 (ref), Workspace (ref), SoundManager (ref), GameSound (ref)
        task.spawn(function() -- Line: 147
            -- upvalues: u3 (ref), u27 (copy), Workspace (ref), SoundManager (ref), GameSound (ref)
            local u28 = u3("Highlight", {
                Enabled = false,
                FillTransparency = 0.5,
                OutlineTransparency = 0,
                DepthMode = Enum.HighlightDepthMode.Occluded,
                FillColor = Color3.fromRGB(255, 59, 59),
                OutlineColor = Color3.fromRGB(255, 59, 59),
                Parent = u27
            });
            local u29 = Workspace:GetServerTimeNow() + 5;
            task.delay(0.5, function() -- Line: 158
                -- upvalues: SoundManager (ref), GameSound (ref), u27 (ref), Workspace (ref), u29 (copy), u28 (copy)
                SoundManager:playSound(GameSound.TNT_HISS_1, {
                    position = u27.PrimaryPart.Position
                });
                local v30 = 0;

                while u27 and Workspace:GetServerTimeNow() < u29 do
                    if v30 % 2 == 0 then
                        u28.Enabled = true;
                        SoundManager:playSound(GameSound.COUNTDOWN_TICK, {
                            position = u27:GetPivot().Position
                        });
                    else
                        u28.Enabled = false;
                    end;

                    task.wait((math.max(0.3 - v30 * 0.01, 0.1)));
                    v30 = v30 + 1;
                end;
            end);
        end);
    end));
    p18:GiveTask(WatchCollectionTag("Scarab", function(p31) -- Line: 178
        -- upvalues: SoundManager (ref), GameSound (ref), u3 (ref)
        SoundManager:playSound(GameSound.SCARAB_SPAWN, {
            position = p31:GetPivot().Position
        });
        local v32 = p31:GetAttribute("ScarabLevel");

        if v32 == nil then
            v32 = false;
        end;

        if v32 ~= 0 and (v32 == v32 and v32) then
            u3("Sound", {
                RollOffMinDistance = 20,
                RollOffMaxDistance = 40,
                Volume = 1,
                Playing = true,
                Looped = true,
                SoundId = "rbxassetid://" .. tostring(7910583431),
                Parent = p31.PrimaryPart
            });
        end;
    end));
    p18:GiveTask(WatchCollectionTag("FlyingScarab", function(p33) -- Line: 198
        -- upvalues: u3 (ref), GameSound (ref)
        local HumanoidRootPart = p33:WaitForChild("HumanoidRootPart", 3);
        u3("Sound", {
            RollOffMinDistance = 20,
            RollOffMaxDistance = 40,
            Volume = 1,
            Playing = true,
            Looped = true,
            SoundId = GameSound.SCARAB_FLY,
            Parent = HumanoidRootPart
        });
    end));
    default.Client:Get("EntityDeathEvent"):Connect(function(p34) -- Line: 210
        -- upvalues: CollectionService (ref), RandomUtil (ref), GameSound (ref), SoundManager (ref)
        if CollectionService:HasTag(p34.entityInstance, "Scarab") then
            SoundManager:playSound(RandomUtil.fromList(GameSound.SCARAB_DEATH_1, GameSound.SCARAB_DEATH_2, GameSound.SCARAB_DEATH_3), {
                position = p34.cframe.Position
            });
        end;
    end);
    p18:GiveTask(WatchCollectionTag("no-query-block", function(p35) -- Line: 218
        -- upvalues: GameQueryUtil (ref)
        GameQueryUtil:setQueryIgnored(p35, true);
    end));
end;

function u6.onKitReplicationDeactivated(p36) -- Line: 222
end;

function u6.onInnateAbilityEnabled(p37, p38, p39) -- Line: 224
end;

function u6.onAbilityUsed(p40, p41, p42) -- Line: 226
    -- upvalues: Players (copy), isUsingKit (copy), BedwarsKit (copy), AbilityId (copy), default (copy)
    local v43 = Players:GetPlayerFromCharacter(p42.userCharacter);

    if not v43 or v43 ~= Players.LocalPlayer then
        return nil;
    end;

    if not isUsingKit(v43, BedwarsKit.SCARAB) then
        return nil;
    end;

    if p42.ability == AbilityId.PLACE_SCARAB_HIVE then
        local v44 = p40:selectBlockPosition();

        if not v44 then
            return nil;
        end;

        default.Client:Get("ScarabHiveRequest"):SendToServer({
            blockPosition = v44
        });
    end;
end;

function u6.disableBlockPlacement(p45) -- Line: 244
    -- upvalues: ClientStore (copy)
    if p45.blockPlacer then
        ClientStore:dispatch({
            type = "UnequipItemInHand",
            equip = true
        });
        p45.blockPlacer:disable();
        p45.blockPlacer = nil;
        p45.enabled = false;
        p45:cleanUpIndicator();
    end;
end;

function u6.cleanUpIndicator(p46) -- Line: 256
    p46:disableBlockPlacement();
    p46.maid:DoCleaning();
end;

function u6.selectBlockPosition(p47) -- Line: 260
    -- upvalues: Players (copy), BlockEngine (copy), KnitClient (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return nil;
    end;

    local v48 = BlockEngine:getBlockPosition(Character);
    local v49 = false;
    local v50 = 0;

    while true do
        if v49 then
            v50 = v50 + 1;
        else
            v49 = true;
        end;

        if v50 >= 5 then
            break;
        end;

        if not p47:checkPlacement(v48) then
            v48 = v48 - Vector3.new(0, 1, 0);
        end;
    end;

    if not p47:checkPlacement(v48) then
        return nil;
    end;

    local v51 = false;
    local v52 = 0;

    while true do
        if v51 then
            v52 = v52 + 1;
        else
            v51 = true;
        end;

        if v52 >= 2 then
            return;
        end;

        local v53 = false;
        local v54 = 0;

        while true do
            if true then
                if v53 then
                    v54 = v54 + 1;
                else
                    v53 = true;
                end;
            end;

            if v54 >= 2 then
                break;
            end;

            local v55 = v48 + Vector3.new(v52, 0, v54);
            local v56 = BlockEngine:getStore():getBlockAt(v55);

            if not (KnitClient.Controllers.MapController:isInDenyRegion(v55) or (KnitClient.Controllers.MapController:isOutOfBounds(v55) or v56)) then
                return v55;
            end;
        end;
    end;
end;

function u6.checkPlacement(p57, p58) -- Line: 337
    -- upvalues: BlockEngine (copy)
    return (BlockEngine:getStore():getBlockAt(p58 - Vector3.new(0, 1, 0)) or BlockEngine:getStore():getBlockAt(p58 + Vector3.new(0, 1, 0)) or (BlockEngine:getStore():getBlockAt(p58 - Vector3.new(1, 0, 0)) or BlockEngine:getStore():getBlockAt(p58 - Vector3.new(-1, 0, 0)) or (BlockEngine:getStore():getBlockAt(p58 - Vector3.new(0, 0, 1)) or BlockEngine:getStore():getBlockAt(p58 - Vector3.new(0, 0, -1))))) and true or false;
end;

KnitClient.CreateController(u6.new());

return nil;