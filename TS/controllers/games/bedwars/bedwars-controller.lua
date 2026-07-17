-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local ContentProvider = v3.ContentProvider;
local Players = v3.Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local KitsUpdateEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "network").KitsUpdateEventZap;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local BedPlatingUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-plating", "bed-plating-util").BedPlatingUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 32, Name: __tostring
        return "BedwarsController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 38
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 42
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "BedwarsController";
end;

function u4.KnitStart(p7) -- Line: 46
    -- upvalues: RuntimeLib (copy), ItemType (copy), getItemMeta (copy), ItemUtil (copy), u2 (copy), ContentProvider (copy), default (copy), KnitClient2 (copy), QueueType (copy), Players (copy), ClientStore (copy), KitsUpdateEventZap (copy), BedPlatingUtil (copy), EntityUtil (copy), Flamework (copy), GamePlayerUtil (copy), PlayerEntity (copy), BedwarsImageId (copy), ClientSyncEvents (copy), getQueueMeta (copy)
    RuntimeLib.Promise.defer(function() -- Line: 47
        -- upvalues: ItemType (ref), getItemMeta (ref), ItemUtil (ref), u2 (ref), ContentProvider (ref)
        local v8 = {
            ItemType.WOOL_BLUE,
            ItemType.WOOL_RED,
            ItemType.WOOL_GREEN,
            ItemType.WOOL_YELLOW,
            ItemType.WOOD_PLANK_OAK,
            ItemType.STONE_BRICK,
            ItemType.TNT
        };
        local u9 = {};

        local function v14(p10) -- Line: 50
            -- upvalues: getItemMeta (ref), ItemUtil (ref), u9 (copy), u2 (ref)
            local v11 = getItemMeta(p10);
            local v12 = ItemUtil.createItemInstance(p10);
            table.insert(u9, v12);
            local v13 = u2("ImageLabel", {
                Image = v11.image
            });
            table.insert(u9, v13);
        end;

        for i, v in v8 do
            v14(v, i - 1, v8);
        end;

        ContentProvider:PreloadAsync(u9);
    end);
    default.Client:WaitFor("EntityDeathEvent"):andThen(function(p15) -- Line: 66
        -- upvalues: RuntimeLib (ref), KnitClient2 (ref), QueueType (ref), Players (ref), ClientStore (ref)
        p15:Connect(function(u16) -- Line: 67
            -- upvalues: RuntimeLib (ref), KnitClient2 (ref), QueueType (ref), Players (ref), ClientStore (ref)
            RuntimeLib.Promise.defer(function() -- Line: 68
                -- upvalues: KnitClient2 (ref), QueueType (ref), Players (ref), u16 (copy), ClientStore (ref)
                local v17 = KnitClient2.Controllers.MatchController:getQueueType() == QueueType.JUGGERNAUT_V2 and Players:GetPlayerFromCharacter(u16.fromEntity);

                if v17 then
                    local v18 = KnitClient2.Controllers.TeamController:getPlayerTeam(v17);

                    if v18 and v18.id == "1" then
                        return nil;
                    end;
                end;

                local v19 = Players:GetPlayerFromCharacter(u16.fromEntity);
                local v20 = Players:GetPlayerFromCharacter(u16.entityInstance);

                if v19 then
                    local v21 = v20 or u16.entityInstance:GetAttribute("CountAsPlayer");

                    if v21 == 0 or (v21 ~= v21 or (v21 == "" or not v21)) then
                        if KnitClient2.Controllers.MatchController:getQueueType() == QueueType.SURVIVAL then
                            if u16.entityInstance.Name == "SurvivalCrateEntity" then
                                return nil;
                            end;

                            ClientStore:dispatch({
                                type = "BedwarsIncrementKills",
                                userId = v19.UserId
                            });
                        end;
                    else
                        ClientStore:dispatch({
                            type = "BedwarsIncrementKills",
                            userId = v19.UserId
                        });
                    end;
                end;

                if not v20 then
                    return nil;
                end;

                if u16.finalKill then
                    ClientStore:dispatch({
                        type = "BedwarsSetFinalDeaths",
                        dead = true,
                        userId = v20.UserId
                    });
                end;
            end);
        end);
    end);
    KitsUpdateEventZap.On(function(p22, p23) -- Line: 113
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "BedwarsSetKits",
            userId = p22,
            kit = p23
        });
    end);
    default.Client:WaitFor("BedwarsBedBreak"):andThen(function(p24) -- Line: 122
        -- upvalues: ClientStore (ref), BedPlatingUtil (ref), EntityUtil (ref), KnitClient2 (ref), Players (ref), Flamework (ref), GamePlayerUtil (ref), RuntimeLib (ref), PlayerEntity (ref), BedwarsImageId (ref)
        p24:Connect(function(p25) -- Line: 123
            -- upvalues: ClientStore (ref), BedPlatingUtil (ref), EntityUtil (ref), KnitClient2 (ref), Players (ref), Flamework (ref), GamePlayerUtil (ref), RuntimeLib (ref), PlayerEntity (ref), BedwarsImageId (ref)
            ClientStore:dispatch({
                type = "BedwarsSetBedStatus",
                teamId = p25.brokenBedTeam.id,
                bedStatus = BedPlatingUtil.BedStatus.BED_BROKEN
            });
            local v26 = {
                type = "BedwarsSetBedBreaks"
            };
            local player = p25.player;

            if player ~= nil then
                player = player.UserId;
            end;

            v26.userId = player;
            ClientStore:dispatch(v26);

            if p25.player then
                local v27 = EntityUtil:getEntity(p25.player);
                KnitClient2.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);
                local v28 = Flamework.resolveDependency("client/controllers/game/kill-feed/kill-feed-controller@KillFeedController");
                local v29 = {};
                local v30 = {
                    name = GamePlayerUtil.getGamePlayer(p25.player):getDisplayName(),
                    userId = p25.player.UserId
                };
                local v31;

                if RuntimeLib.instanceof(v27, PlayerEntity) then
                    v31 = KnitClient2.Controllers.TeamController:getPlayerTeam(v27:getPlayer());

                    if v31 ~= nil then
                        v31 = v31.id;
                    end;
                else
                    v31 = nil;
                end;

                v30.teamId = v31;
                v29.killer = v30;
                v29.victim = {
                    name = p25.brokenBedTeam.displayName .. " Bed",
                    teamId = p25.brokenBedTeam.id,
                    icon = BedwarsImageId.BED_BROKEN_ICON
                };
                v29.killIcons = { BedwarsImageId.STAT_UPGRADE_DESTRUCTION };
                v28:addToKillFeed(v29);
            end;
        end);
    end);
    default.Client:WaitFor("BedwarsSuddenDeath"):andThen(function(p32) -- Line: 175
        -- upvalues: ClientStore (ref)
        p32:Connect(function(p33) -- Line: 176
            -- upvalues: ClientStore (ref)
            ClientStore:dispatch({
                type = "BedwarsSetBedAliveSuddenDeath"
            });
        end);
    end);
    ClientSyncEvents.PlaceBlock:connect(function(p34) -- Line: 183
        -- upvalues: ClientStore (ref), getQueueMeta (ref)
        local queueType = ClientStore:getState().Game.queueType;

        if not queueType then
            return nil;
        end;

        local v35 = getQueueMeta(queueType);

        if v35 and v35.disableBlockPlace then
            p34:setCancelled(true);
        end;
    end);
end;

function u4.getTeamBed(p36, p37) -- Line: 194
    -- upvalues: CollectionService (copy)
    local v38 = CollectionService:GetTagged("bed:" .. p37);

    if v38 ~= nil then
        v38 = v38[1];
    end;

    return v38;
end;

function u4.getAllBeds(p39) -- Line: 201
    -- upvalues: CollectionService (copy)
    return CollectionService:GetTagged("bed");
end;

return {
    BedwarsController = KnitClient.CreateController(u4.new())
};