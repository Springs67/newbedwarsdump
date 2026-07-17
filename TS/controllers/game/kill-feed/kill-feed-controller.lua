-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Reflect = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local Controller = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local DamageType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType;
local getDamageTypeMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type-meta").getDamageTypeMeta;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local MonsterType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local StatefulEntityTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local MonsterIconUtil = RuntimeLib.import(script, script.Parent, "monster-icons").MonsterIconUtil;
local KillFeedWrapper = RuntimeLib.import(script, script.Parent, "ui", "kill-feed-app").KillFeedWrapper;
local KillFeedCard = RuntimeLib.import(script, script.Parent, "ui", "kill-feed-card", "kill-feed-card").KillFeedCard;
local u4 = {
    StatefulEntityTag.DIAMOND_GUARDIAN,
    StatefulEntityTag.GOLEM_BOSS,
    StatefulEntityTag.GOOSE_BOSS,
    StatefulEntityTag.VOID_CRATE,
    StatefulEntityTag.TARGET_DUMMY,
    StatefulEntityTag.BHAA,
    MonsterType.PLAYER_DUMMY,
    "Drone"
};
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 32, Name: __tostring
        return "KillFeedController";
    end
});
u5.__index = u5;

function u5.new(...) -- Line: 37
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 41
end;

function u5.onStart(u8) -- Line: 43
    -- upvalues: PlaceUtil (copy), KnitClient (copy), getQueueMeta (copy), default (copy), EntityUtil (copy), RuntimeLib (copy), PlayerEntity (copy), GamePlayerUtil (copy), DamageType (copy), BedwarsImageId (copy), u1 (copy), MonsterIconUtil (copy)
    if PlaceUtil.isLobbyServer() then
        return nil;
    end;

    if getQueueMeta((KnitClient.Controllers.MatchController:getQueueTypeAsync():expect())).disableKillFeed then
        return nil;
    end;

    u8:setupKillFeedContainer();
    default.Client:OnEvent("EntityDeathEvent", function(u9) -- Line: 53
        -- upvalues: EntityUtil (ref), u8 (copy), RuntimeLib (ref), PlayerEntity (ref), GamePlayerUtil (ref), DamageType (ref), BedwarsImageId (ref), u1 (ref), KnitClient (ref), MonsterIconUtil (ref)
        local u10 = EntityUtil:getEntity(u9.entityInstance);

        if not u10 then
            return nil;
        end;

        if not u8:shouldShowKillfeed(u10) then
            return nil;
        end;

        local u11;

        if u9.fromEntity then
            u11 = EntityUtil:getEntity(u9.fromEntity);
        else
            u11 = nil;
        end;

        local u12 = {};
        local u13 = {};
        local u14;

        if RuntimeLib.instanceof(u11, PlayerEntity) then
            u14 = GamePlayerUtil.getGamePlayer(u11:getPlayer()):getDisplayName();

            if u14 == nil then
                u14 = u11:getPlayer().DisplayName;
            end;
        elseif u11 then
            if u11 == nil then
                u14 = u11;
            else
                u14 = u11:getInstance().Name;
            end;
        else
            u14 = u8:getKillerNameFromDamageType(u9.damageType);

            if u14 == nil then
                u14 = string.gsub(DamageType[u9.damageType], "_", " ");
            end;
        end;

        local function _(p15) -- Line: 94
            -- upvalues: u12 (copy)
            local v16 = u12;
            table.insert(v16, p15);

            return #v16;
        end;

        for i, v in u8:getDamageIconsFromDamageEvent(u9.damageType, u9.itemUsed) do
            local _ = i - 1;
            table.insert(u12, v);
            local _ = #u12;
        end;

        if u9.finalKill and RuntimeLib.instanceof(u10, PlayerEntity) then
            table.insert(u12, BedwarsImageId.SKULL_LINE_ICON);
        end;

        local u17;

        if RuntimeLib.instanceof(u10, PlayerEntity) then
            u17 = GamePlayerUtil.getGamePlayer(u10:getPlayer()):getDisplayName();

            if u17 == nil then
                u17 = u10:getPlayer().DisplayName;
            end;
        else
            u17 = u10:getInstance().Name;
        end;

        if u9.deathPayout then
            local function _(p18) -- Line: 122
                -- upvalues: u13 (copy)
                local v19 = tonumber(p18[1]);

                if v19 ~= 0 and (v19 == v19 and v19) then
                    u13[v19] = p18[2];
                end;
            end;

            for i, v in u1.entries(u9.deathPayout) do
                local _ = i - 1;
                local v20 = tonumber(v[1]);

                if v20 ~= 0 and (v20 == v20 and v20) then
                    u13[v20] = v[2];
                end;
            end;
        end;

        task.spawn(function() -- Line: 133
            -- upvalues: u8 (ref), u14 (ref), RuntimeLib (ref), u11 (copy), PlayerEntity (ref), KnitClient (ref), u17 (ref), u10 (copy), MonsterIconUtil (ref), u12 (copy), u13 (copy), u9 (copy)
            local v21 = {};
            local v22 = {
                name = u14
            };
            local v23;

            if RuntimeLib.instanceof(u11, PlayerEntity) then
                v23 = u11:getPlayer().UserId;
            else
                v23 = nil;
            end;

            v22.userId = v23;
            local v24;

            if RuntimeLib.instanceof(u11, PlayerEntity) then
                v24 = KnitClient.Controllers.TeamController:getPlayerTeam(u11:getPlayer());

                if v24 ~= nil then
                    v24 = v24.id;
                end;
            else
                v24 = nil;
            end;

            v22.teamId = v24;
            v21.killer = v22;
            local v25 = {
                name = u17
            };
            local v26;

            if RuntimeLib.instanceof(u10, PlayerEntity) then
                v26 = u10:getPlayer().UserId;
            else
                v26 = nil;
            end;

            v25.userId = v26;
            local v27;

            if RuntimeLib.instanceof(u10, PlayerEntity) then
                v27 = KnitClient.Controllers.TeamController:getPlayerTeam(u10:getPlayer());

                if v27 ~= nil then
                    v27 = v27.id;
                end;
            else
                v27 = nil;
            end;

            v25.teamId = v27;
            local v28;

            if RuntimeLib.instanceof(u10, PlayerEntity) then
                v28 = nil;
            else
                v28 = MonsterIconUtil.getIconFromName(u10:getInstance().Name);
            end;

            v25.icon = v28;
            v21.victim = v25;
            v21.killIcons = u12;
            local v29;

            if RuntimeLib.instanceof(u11, PlayerEntity) then
                v29 = u13[u11:getPlayer().UserId];
            else
                v29 = nil;
            end;

            v21.killPayout = v29;
            v21.multiKillCount = u9.multiKillCount;
            u8:addToKillFeed(v21);
        end);
    end);
    default.Client:Get("AddPlayerToKillFeed"):Connect(function(p30) -- Line: 187
        -- upvalues: u8 (copy)
        u8:addToKillFeed(p30);
    end);
end;

function u5.setupKillFeedContainer(p31) -- Line: 191
    -- upvalues: u2 (copy), KillFeedWrapper (copy), Players (copy)
    p31.killFeedContainer = u2.mount(u2.createElement(KillFeedWrapper), Players.LocalPlayer:WaitForChild("PlayerGui"));
end;

function u5.addToKillFeed(p32, u33) -- Line: 195
    -- upvalues: ItemType (copy), u2 (copy), KillFeedCard (copy), Players (copy)
    if not p32.killFeedContainer then
        return nil;
    end;

    if u33.killPayout then
        local function _(p34) -- Line: 215
            -- upvalues: u33 (copy)
            local killPayout = u33.killPayout;

            if killPayout ~= nil then
                killPayout = killPayout[p34.itemType];

                if killPayout ~= nil then
                    killPayout = killPayout.amount;
                end;
            end;

            return (killPayout == nil and 0 or killPayout) >= p34.minAmount;
        end;

        local v35 = false;

        for i, v in {
            {
                minAmount = 2,
                itemType = ItemType.EMERALD
            },
            {
                minAmount = 2,
                itemType = ItemType.DIAMOND
            },
            {
                minAmount = 2,
                itemType = ItemType.GOLD
            },
            {
                minAmount = 2,
                itemType = ItemType.VOID_CRYSTAL
            }
        } do
            local _ = i - 1;
            local killPayout = u33.killPayout;

            if killPayout ~= nil then
                killPayout = killPayout[v.itemType];

                if killPayout ~= nil then
                    killPayout = killPayout.amount;
                end;
            end;

            if (killPayout == nil and 0 or killPayout) >= v.minAmount then
                v35 = true;
                break;
            end;
        end;

        if not v35 then
            u33.killPayout = nil;
        end;
    end;

    u2.mount(u2.createElement(KillFeedCard, {
        KillFeedData = u33
    }), Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("KillFeedGui"):WaitForChild("KillFeedContainer"));
end;

function u5.getKillerNameFromDamageType(p36, p37) -- Line: 248
    -- upvalues: DamageType (copy), getDamageTypeMeta (copy)
    if p37 == DamageType.VOID then
        return "VOID";
    end;

    if p37 == DamageType.FALL then
        return "FALL DAMAGE";
    end;

    if p37 == DamageType.MINIGAME_DAMAGE then
        return "STORM";
    end;

    if p37 == DamageType.WINTER_BOSS_DAMAGE then
        return "Adetunde";
    end;

    if p37 == DamageType.SPIDER_QUEEN_BOSS then
        return "Spider Queen";
    end;

    if p37 == DamageType.BOMBER_PENGUIN then
        return "Bomber Penguin";
    end;

    if p37 == DamageType.SKELETON_KIT_POISON then
        return "Marrow\'s Poison";
    end;

    local v38 = getDamageTypeMeta(p37);

    if v38 ~= nil then
        v38 = v38.name;
    end;

    return v38;
end;

function u5.getDamageIconsFromDamageEvent(p39, p40, p41) -- Line: 280
    -- upvalues: getItemMeta (copy), DamageType (copy), getDamageTypeMeta (copy), BedwarsImageId (copy)
    local v42 = {};
    local v43;

    if p41 then
        v43 = getItemMeta(p41);
    else
        v43 = nil;
    end;

    local v44 = p40 == DamageType.SWORD;

    if not v44 then
        if v43 == nil then
            v44 = v43;
        else
            v44 = v43.sword;
        end;
    end;

    if v44 then
        v44 = p41;
    end;

    if v44 then
        local image = getItemMeta(p41).image;

        if image ~= "" and image then
            table.insert(v42, image);
        end;
    else
        local v45 = p40 == DamageType.PROJECTILE;

        if v45 then
            v43 = v45;
        elseif v43 ~= nil then
            v43 = v43.projectileSource;
        end;

        if v43 then
            v43 = p41;
        end;

        if v43 then
            local image = getItemMeta(p41).image;

            if image ~= "" and image then
                table.insert(v42, image);
            end;
        end;
    end;

    local v46 = getDamageTypeMeta(p40);

    if v46 ~= nil then
        v46 = v46.killFeedIcon;
    end;

    if v46 == "" or not v46 then
        table.insert(v42, BedwarsImageId.killfeed.sword);

        return v42;
    end;

    table.insert(v42, v46);

    return v42;
end;

function u5.shouldShowKillfeed(p47, p48) -- Line: 335
    -- upvalues: RuntimeLib (copy), PlayerEntity (copy), CollectionService (copy), u4 (copy)
    if RuntimeLib.instanceof(p48, PlayerEntity) then
        return true;
    end;

    local u49 = p48:getInstance();

    local function _(p50) -- Line: 340
        -- upvalues: CollectionService (ref), u49 (copy)
        return CollectionService:HasTag(u49, p50);
    end;

    for i, v in u4 do
        local _ = i - 1;

        if CollectionService:HasTag(u49, v) then
            return true;
        end;
    end;

    return false;
end;

Reflect.defineMetadata(u5, "identifier", "client/controllers/game/kill-feed/kill-feed-controller@KillFeedController");
Reflect.defineMetadata(u5, "flamework:implements", { "$:flamework@OnStart" });
Reflect.decorate(u5, "$:flamework@Controller", Controller, { {} });

return {
    KillFeedController = u5
};