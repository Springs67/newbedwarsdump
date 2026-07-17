-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local BlockEngineClientEvents = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "block-engine-client-events").BlockEngineClientEvents;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local StringUtil = v1.StringUtil;
local WatchPlayer = v1.WatchPlayer;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local BedPlatingUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-plating", "bed-plating-util").BedPlatingUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local SharedSyncEvents = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game-knit-controller").GameKnitController;
local u6 = { GameSound.BED_PLATING_HIT_1, GameSound.BED_PLATING_HIT_2, GameSound.BED_PLATING_HIT_3 };
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 46, Name: __tostring
        return "BedPlatingController";
    end,

    __index = GameKnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 52
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 56
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p9, {
        GameType.BEDWARS,
        GameType.LB_ONEBLOCK,
        GameType.COMBINED_KIT,
        GameType.CUSTOM_KIT,
        GameType.MINE_WARS,
        GameType.OVERPOWERED
    });
    p9.Name = "BedPlatingController";
    p9.bedPlatingMaid = {};
    p9.bedPlatingModelMap = {};
end;

function u7.KnitStart(p10) -- Line: 62
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p10);
end;

function u7.onGameInit(u11) -- Line: 65
    -- upvalues: GameKnitController (copy), KnitClient2 (copy), getQueueMeta (copy), u6 (copy), GameSound (copy), BedPlatingUtil (copy), BlockEngineClientEvents (copy), ItemType (copy), BlockEngine (copy), SoundManager (copy), RandomUtil (copy), u3 (copy), ClientStore (copy), WatchPlayer (copy), Players (copy), KnitClient (copy), MatchState (copy), CollectionService (copy), default (copy), SharedSyncEvents (copy), ReplicatedStorage (copy), EffectUtil (copy), Flamework (copy), GamePlayerUtil (copy), StringUtil (copy), BedwarsImageId (copy)
    GameKnitController.onGameInit(u11);
    task.spawn(function() -- Line: 67
        -- upvalues: KnitClient2 (ref), getQueueMeta (ref), u6 (ref), GameSound (ref), BedPlatingUtil (ref)
        local v12, v13 = KnitClient2.Controllers.MatchController:getQueueTypeAsync():await();

        if v12 then
            local disabledFeatures = getQueueMeta(v13).disabledFeatures;

            if disabledFeatures ~= nil then
                disabledFeatures = disabledFeatures.disableBedPlating;
            end;

            if disabledFeatures then
                return nil;
            end;

            local PreloadController = KnitClient2.Controllers.PreloadController;
            local v14 = {};
            local v15 = {};
            local v16 = #v15;
            local v17 = #u6;
            table.move(u6, 1, v17, v16 + 1, v15);
            local v18 = v16 + v17;
            v15[v18 + 1] = GameSound.BED_PLATING_BREAK_PLAYER;
            v15[v18 + 2] = GameSound.BED_PLATING_BREAK_NATURAL;
            v14.sounds = v15;
            PreloadController:runPreload(v14);
            BedPlatingUtil.setupBedPlating();
        end;
    end);
    BlockEngineClientEvents.DamageBlockEffect:connect(function(p19) -- Line: 93
        -- upvalues: ItemType (ref), BlockEngine (ref), u11 (copy), SoundManager (ref), RandomUtil (ref), u6 (ref)
        if p19.blockType ~= ItemType.BED then
            return nil;
        end;

        local v20 = BlockEngine:getWorldPosition(p19.blockPosition);

        if u11.bedPlatingModelMap[v20] ~= nil then
            p19.sound = SoundManager:createSound(RandomUtil.fromList(unpack(u6)));

            return;
        end;

        local v21 = BlockEngine:getStore():getBlockAt(p19.blockPosition);

        if not v21 then
            return nil;
        end;

        if v21.Name ~= ItemType.BED then
            return nil;
        end;

        if u11.bedPlatingModelMap[v21.Position] ~= nil then
            p19.sound = SoundManager:createSound(RandomUtil.fromList(unpack(u6)));
        end;
    end);

    local function u25(p22) -- Line: 132
        -- upvalues: u3 (ref), u11 (copy), ClientStore (ref), BedPlatingUtil (ref)
        local v23 = u3.new();
        u11.bedPlatingMaid[p22.Position] = v23;
        local v24 = p22:GetAttribute("id");
        ClientStore:dispatch({
            type = "BedwarsSetBedStatus",
            teamId = string.split(v24, "_")[1],
            bedStatus = BedPlatingUtil.BedStatus.BED_PLATING_ACTIVE
        });
    end;

    WatchPlayer(function(p26, p27) -- Line: 146
        -- upvalues: Players (ref), KnitClient (ref), MatchState (ref), CollectionService (ref), u25 (copy)
        if Players.LocalPlayer.UserId ~= p26.UserId then
            return nil;
        end;

        if KnitClient.Controllers.MatchController:getMatchState() ~= MatchState.RUNNING then
            return nil;
        end;

        local v28 = KnitClient.Controllers.MatchController:getQueueMeta();

        if v28 ~= nil then
            v28 = v28.disabledFeatures;

            if v28 ~= nil then
                v28 = v28.disableBedPlating;
            end;
        end;

        if v28 then
            return nil;
        end;

        local function _(p29) -- Line: 166
            -- upvalues: u25 (ref)
            u25(p29);
        end;

        for i, v in CollectionService:GetTagged("bed") do
            local _ = i - 1;
            u25(v);
        end;
    end);
    default.Client:Get("AddBedPlating"):Connect(function(p30) -- Line: 173
        -- upvalues: u25 (copy)
        u25(p30);
    end);
    default.Client:Get("RemoveBedPlating"):Connect(function(p31) -- Line: 177
        -- upvalues: u11 (copy), SoundManager (ref), GameSound (ref), ClientStore (ref), BedPlatingUtil (ref)
        local Position = p31.bed.Position;
        local v32 = u11.bedPlatingMaid[Position];

        if v32 ~= nil then
            v32:DoCleaning();
        end;

        if not p31.playerBroken then
            SoundManager:playSound(GameSound.BED_PLATING_BREAK_NATURAL, {
                position = Position
            });
        end;

        local v33 = p31.bed:GetAttribute("id");
        ClientStore:dispatch({
            type = "BedwarsSetBedStatus",
            teamId = string.split(v33, "_")[1],
            bedStatus = BedPlatingUtil.BedStatus.BED_ALIVE
        });
    end);
    SharedSyncEvents.BedPlatingDestroyed:connect(function(p34) -- Line: 197
        -- upvalues: SoundManager (ref), GameSound (ref), u11 (copy), ReplicatedStorage (ref), EffectUtil (ref), KnitClient (ref), Flamework (ref), GamePlayerUtil (ref), KnitClient2 (ref), StringUtil (ref), BedwarsImageId (ref), ItemType (ref)
        local Position = p34.bed.Position;
        SoundManager:playSound(GameSound.BED_PLATING_BREAK_PLAYER, {
            position = Position
        });
        local v35 = u11.bedPlatingModelMap[Position];

        if v35 then
            u11:fullyBreakBedPlating(v35);
        end;

        local v36 = ReplicatedStorage.Assets.Effects.PulseEffect:Clone();
        v36.CFrame = CFrame.new(Position);
        v36.Anchored = true;
        v36.Parent = p34.bed;
        EffectUtil:playEffects({ v36 }, nil, {
            destroyAfterSec = 0.25
        });
        local v37 = p34.bed:GetAttribute("id");
        local v38 = string.split(v37, "_")[1];
        local v39 = KnitClient.Controllers.TeamController:getTeamById(v38);

        if v39 ~= nil then
            v39 = v39.name;
        end;

        local v40 = Flamework.resolveDependency("client/controllers/game/kill-feed/kill-feed-controller@KillFeedController");
        local v41 = {};
        local v42 = {
            name = GamePlayerUtil.getGamePlayer(p34.destroyer):getDisplayName(),
            userId = p34.destroyer.UserId
        };
        local v43 = KnitClient2.Controllers.TeamController:getPlayerTeam(p34.destroyer);

        if v43 ~= nil then
            v43 = v43.id;
        end;

        v42.teamId = v43;
        v41.killer = v42;
        v41.victim = {
            name = StringUtil.capitalizeFirstLetter(v39 == nil and "" or v39) .. " Bed Plating",
            teamId = v38,
            icon = BedwarsImageId.BED_PLATING_ACTIVE_ICON
        };
        v41.killIcons = { BedwarsImageId.STAT_UPGRADE_DESTRUCTION };
        v41.killPayout = {
            [ItemType.DIAMOND] = {
                amount = p34.diamondRewardAmount
            }
        };
        v40:addToKillFeed(v41);
    end);
end;

function u7.fullyBreakBedPlating(u44, p45) -- Line: 253
    -- upvalues: u5 (copy)
    local function _(p46) -- Line: 256
        -- upvalues: u5 (ref)
        local v47 = u5.includes(p46.Name, "Plate") and p46:IsA("MeshPart");

        return v47;
    end;

    local v48 = 0;
    local v49 = {};

    for i, child in p45:GetChildren() do
        local _ = i - 1;
        local v50 = u5.includes(child.Name, "Plate") and child:IsA("MeshPart");

        if v50 == true then
            v48 = v48 + 1;
            v49[v48] = child;
        end;
    end;

    local function _(p51) -- Line: 269
        -- upvalues: u44 (copy)
        u44:createBedPlatingDebris(p51);
        p51:Destroy();
    end;

    for i, v in v49 do
        local _ = i - 1;
        u44:createBedPlatingDebris(v);
        v:Destroy();
    end;

    local Border = p45:FindFirstChild("Border");

    if Border ~= nil then
        Border:Destroy();
    end;
end;

function u7.createBedPlatingDebris(p52, p53) -- Line: 282
    -- upvalues: Players (copy), BLOCK_SIZE (copy), KnitClient2 (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:GetPivot().Position;
    end;

    if not Character then
        return nil;
    end;

    if (Character - p53.Position).Magnitude > BLOCK_SIZE * 15 then
        return nil;
    end;

    local v54 = false;
    local v55 = 0;

    while true do
        if v54 then
            v55 = v55 + 1;
        else
            v54 = true;
        end;

        if v55 >= 3 then
            local BlockDebrisController = KnitClient2.Controllers.BlockDebrisController;
            local Position = p53.Position;
            local v56 = Color3.fromRGB(87, 149, 176);
            local v57 = {
                material = Enum.Material.Neon
            };
            local v58 = 0.2 + math.random() * 0.25;
            local v59 = 0.2 + math.random() * 0.25;
            v57.size = Vector3.new(0.25, v58, v59);
            BlockDebrisController:createDebris(Position, v56, Vector3.new(0, 0, 0), v57);

            return;
        end;

        local BlockDebrisController = KnitClient2.Controllers.BlockDebrisController;
        local Position = p53.Position;
        local v60 = Color3.fromRGB(120, 178, 212);
        local v61 = {
            material = Enum.Material.SmoothPlastic
        };
        local v62 = 0.6 + math.random() * 0.3;
        local v63 = 0.6 + math.random() * 0.3;
        v61.size = Vector3.new(0.35, v62, v63);
        BlockDebrisController:createDebris(Position, v60, Vector3.new(0, 0, 0), v61);
    end;
end;

function u7.breakBedPlate(p64, p65, p66) -- Line: 321
    -- upvalues: u5 (copy), BedPlatingUtil (copy), RandomUtil (copy)
    local function _(p67) -- Line: 323
        -- upvalues: u5 (ref)
        local v68 = u5.includes(p67.Name, "PlateR") and p67:IsA("MeshPart");

        return v68;
    end;

    local v69 = 0;
    local v70 = {};

    for i, child in p65:GetChildren() do
        local _ = i - 1;
        local v71 = u5.includes(child.Name, "PlateR") and child:IsA("MeshPart");

        if v71 == true then
            v69 = v69 + 1;
            v70[v69] = child;
        end;
    end;

    local function _(p72) -- Line: 338
        -- upvalues: u5 (ref)
        local v73 = u5.includes(p72.Name, "PlateL") and p72:IsA("MeshPart");

        return v73;
    end;

    local v74 = 0;
    local v75 = {};

    for i, child in p65:GetChildren() do
        local _ = i - 1;
        local v76 = u5.includes(child.Name, "PlateL") and child:IsA("MeshPart");

        if v76 == true then
            v74 = v74 + 1;
            v75[v74] = child;
        end;
    end;

    if #v70 == 0 or #v75 == 0 then
        return nil;
    end;

    local v77 = math.floor(p66 / BedPlatingUtil.HEALTH_PER_PLATE_STAGE) + 1;
    local v78 = #v70 - v77;
    local v79 = #v75 - v77;

    if v78 ~= 0 and (v78 == v78 and v78) then
        local v80 = false;
        local v81 = 0;

        while true do
            if true then
                if v80 then
                    v81 = v81 + 1;
                else
                    v80 = true;
                end;
            end;

            if v81 >= v78 then
                break;
            end;

            local v82 = RandomUtil.fromList(unpack(v70));
            p64:createBedPlatingDebris(v82);
            v82:Destroy();
        end;
    end;

    if v79 ~= 0 and (v79 == v79 and v79) then
        local v83 = false;
        local v84 = 0;

        while true do
            if true then
                if v83 then
                    v84 = v84 + 1;
                else
                    v83 = true;
                end;
            end;

            if v84 >= v79 then
                break;
            end;

            local v85 = RandomUtil.fromList(unpack(v75));
            p64:createBedPlatingDebris(v85);
            v85:Destroy();
        end;
    end;
end;

function u7.addBedPlatingModel(u86, u87, p88) -- Line: 397
    -- upvalues: ReplicatedStorage (copy)
    local u89 = ReplicatedStorage.Assets.Misc.BedPlating:Clone();
    local Bed = u87:FindFirstChild("Bed");

    if not Bed then
        return nil;
    end;

    local v90 = { Bed.CFrame:ToOrientation() };
    u89:PivotTo(CFrame.new(Bed.Position - Vector3.new(0, 0.415, 0)) * CFrame.Angles(v90[1], v90[2], v90[3]));
    u89.Parent = u87;
    p88:GiveTask(function() -- Line: 411
        -- upvalues: u86 (copy), u87 (copy), u89 (copy)
        u86.bedPlatingModelMap[u87.Position] = nil;
        task.delay(3, function() -- Line: 415
            -- upvalues: u89 (ref)
            u89:Destroy();
        end);
    end);
    u86.bedPlatingModelMap[u87.Position] = u89;
end;

KnitClient.CreateController(u7.new());

return nil;