-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local Players = v2.Players;
local RunService = v2.RunService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "custom-match", "custom-match-role");
local CustomMatchRole = v3.CustomMatchRole;
local CustomMatchRoleAttribute = v3.CustomMatchRoleAttribute;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local Setting = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting;
local getPrimaryActiveKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").getPrimaryActiveKit;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local NametagController = RuntimeLib.import(script, script.Parent.Parent, "nametag", "nametag-controller").NametagController;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 28, Name: __tostring
        return "StreamerModeController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 34
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 38
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "StreamerModeController";
    p6.isActive = false;
end;

function u4.KnitStart(u7) -- Line: 43
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), Setting (copy), KnitClient2 (copy)
    KnitController.KnitStart(u7);
    ClientSyncEvents.SettingChanged:connect(function(p8) -- Line: 45
        -- upvalues: Setting (ref), KnitClient2 (ref), u7 (copy)
        if p8.setting ~= Setting.STREAMER_MODE then
            return nil;
        end;

        local v9 = KnitClient2.Controllers.SettingsController:getSettings();

        if v9 ~= nil then
            v9 = v9[Setting.STREAMER_MODE];
        end;

        if v9 then
            u7:activate();

            return;
        end;

        u7:deactivate();
    end);
    KnitClient2.Controllers.SettingsController:waitForSettingsAsync():andThen(function(p10) -- Line: 62
        -- upvalues: Setting (ref), u7 (copy)
        if p10[Setting.STREAMER_MODE] then
            u7:activate();
        end;
    end);
end;

function u4.inStreamerMode(p11) -- Line: 70
    -- upvalues: KnitClient (copy), Setting (copy)
    local v12 = KnitClient.Controllers.SettingsController:getSetting(Setting.STREAMER_MODE);

    if v12 == nil then
        v12 = false;
    end;

    return v12;
end;

function u4.getDisplayName(p13, p14) -- Line: 77
    -- upvalues: getPrimaryActiveKit (copy), getBedwarsKitMeta (copy), PlaceUtil (copy), KnitClient2 (copy), MatchState (copy), ClientStore (copy)
    local name = getBedwarsKitMeta((getPrimaryActiveKit(p14))).name;

    if PlaceUtil.isGameServer() then
        local v15 = KnitClient2.Controllers.MatchController:getMatchState() == MatchState.PRE and "Player" or name;
        local v16 = KnitClient2.Controllers.TeamController:getPlayerTeam(p14);

        if v16 ~= nil then
            v16 = v16.id;
        end;

        local startTime = ClientStore:getState().Game.startTime;
        local v17 = Random.new(startTime + p14.UserId);
        name = (v15 .. "-" .. (v16 == nil and "" or v16)) .. tostring(v17:NextInteger(0, 9)) .. tostring(v17:NextInteger(0, 9));
    end;

    return name;
end;

function u4.hasPermissionToSeeThrough(p18) -- Line: 104
    -- upvalues: RunService (copy), KnitClient2 (copy), Players (copy), CustomMatchRoleAttribute (copy), CustomMatchRole (copy)
    if RunService:IsStudio() then
        return false;
    end;

    return KnitClient2.Controllers.PermissionController:hasPermission("anticheat_mod") or (Players.LocalPlayer:GetAttribute(CustomMatchRoleAttribute) == CustomMatchRole.COHOST and true or Players.LocalPlayer:GetAttribute(CustomMatchRoleAttribute) == CustomMatchRole.HOST);
end;

function u4.activate(p19) -- Line: 113
    p19:updateNametags(true);
    p19.isActive = true;
end;

function u4.deactivate(p20) -- Line: 117
    p20:updateNametags(false);
    p20.isActive = false;
end;

function u4.updateNametags(p21, p22) -- Line: 121
    -- upvalues: CollectionService (copy), EntityUtil (copy), RuntimeLib (copy), PlayerEntity (copy), NametagController (copy)
    local v23 = CollectionService:GetTagged("entity");

    local function v28(p24) -- Line: 123
        -- upvalues: EntityUtil (ref), RuntimeLib (ref), PlayerEntity (ref), NametagController (ref)
        local v25 = EntityUtil:getEntity(p24);

        if not RuntimeLib.instanceof(v25, PlayerEntity) then
            return nil;
        end;

        local v26 = v25:getPlayer();
        local v27 = v26:GetAttribute("DisguiseDisplayName");

        if v27 == "" or not v27 then
            v25:setNametag((NametagController:getNewNametagTextForPlayer(v26)));
        end;
    end;

    for i, v in v23 do
        v28(v, i - 1, v23);
    end;
end;

KnitClient.CreateController(u4.new());

return nil;