-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local WatchCollectionTag = v1.WatchCollectionTag;
local WatchPlayer = v1.WatchPlayer;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local getCreativeGadgetMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "creative-gadget", "creative-gadget-util").getCreativeGadgetMeta;
local GamemodeType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "gamemode", "gamemode-type").GamemodeType;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "CreativeGadgetController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 33
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 37
    -- upvalues: KnitController (copy), default (copy)
    KnitController.constructor(p6);
    p6.Name = "CreativeGadgetController";
    p6.gamemodeRemotes = default.Client:GetNamespace("Gamemode");
    p6.promptMap = {};
    p6.creativeGadgetData = {};
end;

function u4.KnitStart(u7) -- Line: 44
    -- upvalues: KnitController (copy), WatchPlayer (copy), Players (copy), KnitClient (copy), GamemodeType (copy), WatchCollectionTag (copy), getItemMeta (copy), KnitClient2 (copy), DeviceUtil (copy)
    KnitController.KnitStart(u7);
    WatchPlayer(function(p8) -- Line: 46
        -- upvalues: Players (ref), u7 (copy), KnitClient (ref)
        if p8 ~= Players.LocalPlayer then
            return nil;
        end;

        u7:toggleGadgetVisibility(KnitClient.Controllers.GamemodeController:isLocalPlayerInCreativeMode());
    end);
    u7.gamemodeRemotes:OnEvent("GamemodeUpdate", function(p9) -- Line: 52
        -- upvalues: Players (ref), u7 (copy), GamemodeType (ref)
        if p9.player ~= Players.LocalPlayer then
            return nil;
        end;

        u7:toggleGadgetVisibility(p9.gamemode == GamemodeType.CREATIVE);
    end);
    WatchCollectionTag("CreativeGadget", function(u10) -- Line: 58
        -- upvalues: getItemMeta (ref), KnitClient2 (ref), DeviceUtil (ref), u7 (copy), Players (ref)
        local v11 = getItemMeta(u10.Name);

        if not v11.gadget then
            return nil;
        end;

        if u10:GetAttribute("ClientPlaced") then
            return nil;
        end;

        local v12 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            ActionText = "Configure",
            HoldDuration = 0,
            RequiresLineOfSight = false,
            MaxActivationDistance = 6,
            ObjectText = v11.displayName,
            Parent = u10,
            ClickablePrompt = DeviceUtil.isMobileControls()
        });
        u7.promptMap[u10] = v12;
        v12.Triggered:Connect(function(p13) -- Line: 80
            -- upvalues: Players (ref), u7 (ref), u10 (copy)
            if p13 ~= Players.LocalPlayer then
                return nil;
            end;

            u7:openGadgetMenu(u10);
        end);
    end);
end;

function u4.toggleGadgetVisibility(u14, u15, p16) -- Line: 88
    -- upvalues: CollectionService (copy)
    local u17 = u15 and 0 or 1;

    local function u22(p18, p19) -- Line: 93
        -- upvalues: u14 (copy), u17 (ref)
        local v20 = u14.promptMap[p19];

        if v20 then
            v20.Enabled = p18;
        end;

        local function _(p21) -- Line: 101
            -- upvalues: u17 (ref)
            if p21:IsA("Decal") then
                p21.Transparency = u17;

                return;
            end;

            if p21:IsA("BasePart") or p21:IsA("MeshPart") then
                p21.Transparency = u17;
            end;
        end;

        for i, descendant in p19:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("Decal") then
                descendant.Transparency = u17;
            elseif descendant:IsA("BasePart") or descendant:IsA("MeshPart") then
                descendant.Transparency = u17;
            end;
        end;

        p19.Transparency = 1;
    end;

    if p16 then
        u22(u15, p16);
    else
        local function _(p23) -- Line: 117
            -- upvalues: u22 (copy), u15 (copy)
            u22(u15, p23);
        end;

        for i, v in CollectionService:GetTagged("CreativeGadget") do
            local _ = i - 1;
            u22(u15, v);
        end;
    end;
end;

function u4.getSavedDataForGadget(p24, p25, p26) -- Line: 125
    local v27 = p24.creativeGadgetData[p25];

    if v27 ~= nil then
        v27 = v27[p26];
    end;

    return v27;
end;

function u4.saveDataToGadget(p28, p29, p30, p31) -- Line: 135
    -- upvalues: MapUtil (copy)
    local v32 = MapUtil.getOrCreate(p28.creativeGadgetData, p29, {});
    v32[p30] = p31;
    p28.creativeGadgetData[p29] = v32;
end;

u4.requestGadgetRemoval = RuntimeLib.async(function(p33, u34) -- Line: 144
    -- upvalues: default (copy), Flamework (copy)
    default.Client:Get("RequestRemoveGadget"):CallServerAsync({
        blockInstance = u34
    }):andThen(function(p35) -- Line: 147
        -- upvalues: Flamework (ref), u34 (copy)
        if p35 then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                message = "Removed gadget at " .. tostring(u34.Position) .. "."
            });
        end;

        return p35;
    end);
end);
u4.requestGadgetCreation = RuntimeLib.async(function(p36, p37) -- Line: 156
    -- upvalues: getCreativeGadgetMeta (copy), ItemType (copy), getItemMeta (copy)
    local u38 = p36.creativeGadgetData[p37];

    if not u38 then
        return false;
    end;

    local Name = p37.Name;

    local function _(p39, p40) -- Line: 166
        -- upvalues: u38 (copy)
        local v41 = u38[p40];

        if v41 == "" or not v41 then
            return false;
        end;
    end;

    for i, _ in getCreativeGadgetMeta(Name).config do
        local v42 = u38[i];
        local _ = v42 == "" or v42;
    end;

    local Team = u38.Team;
    local v43 = tonumber(u38.Cooldown);
    local v44 = tonumber(u38["Max Stack Size"]);
    local Item = u38.Item;

    if Name == ItemType.BED_GADGET then
        if Team == "" or not Team then
            return false;
        end;

        return p36:setUpBed(p37, Team);
    end;

    if Name == ItemType.TEAM_GENERATOR_GADGET then
        if Team == "" or (not Team or (v43 == 0 or (v43 ~= v43 or (not v43 or (v44 == 0 or (v44 ~= v44 or not v44)))))) then
            return false;
        end;

        return p36:setUpTeamGenerator(p37, Team, v43, v44);
    end;

    if Name == ItemType.GLOBAL_GENERATOR_GADGET then
        if Item == "" or (not Item or (v43 == 0 or (v43 ~= v43 or (not v43 or (v44 == 0 or (v44 ~= v44 or not v44)))))) then
            return false;
        end;

        if getItemMeta(Item) then
            return p36:setUpGlobalGenerator(p37, Item, v43, v44);
        end;

        return false;
    end;

    if Name ~= ItemType.SPAWN_GADGET then
        return true;
    end;

    if Team == "" or not Team then
        return false;
    end;

    return p36:setUpTeamSpawn(p37, Team);
end);
u4.setUpBed = RuntimeLib.async(function(p45, u46, p47) -- Line: 211
    -- upvalues: KnitClient (copy), default (copy), Flamework (copy), ColorUtil (copy)
    local u48 = KnitClient.Controllers.TeamController:getTeamById(p47);

    if u48 then
        return default.Client:Get("RequestCreateBed"):CallServerAsync({
            blockInstance = u46,
            teamId = p47
        }):andThen(function(p49) -- Line: 219
            -- upvalues: Flamework (ref), ColorUtil (ref), u48 (copy), u46 (copy)
            if p49 then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                    message = "Placed a bed for <font color=\"" .. ColorUtil.richTextColor(u48.color) .. "\">" .. u48.name .. "</font> at " .. tostring(u46.Position) .. "."
                });
            end;

            return p49;
        end);
    end;

    return false;
end);
u4.setUpGlobalGenerator = RuntimeLib.async(function(p50, u51, u52, p53, p54) -- Line: 228
    -- upvalues: default (copy), Flamework (copy)
    return default.Client:Get("RequestCreateGenerator"):CallServerAsync({
        blockInstance = u51,
        item = u52,
        cooldown = p53,
        maxStackSize = p54
    }):andThen(function(p55) -- Line: 234
        -- upvalues: Flamework (ref), u52 (copy), u51 (copy)
        if p55 then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                message = "Placed a global generator of " .. u52 .. " at " .. tostring(u51.Position) .. "."
            });
        end;

        return p55;
    end);
end);
u4.setUpTeamGenerator = RuntimeLib.async(function(p56, u57, p58, p59, p60) -- Line: 243
    -- upvalues: KnitClient (copy), default (copy), Flamework (copy), ColorUtil (copy)
    local u61 = KnitClient.Controllers.TeamController:getTeamById(p58);

    if u61 then
        return default.Client:Get("RequestCreateTeamGenerator"):CallServerAsync({
            blockInstance = u57,
            teamId = p58,
            cooldown = p59,
            maxStackSize = p60
        }):andThen(function(p62) -- Line: 253
            -- upvalues: Flamework (ref), ColorUtil (ref), u61 (copy), u57 (copy)
            if p62 then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                    message = "Placed a team generator for <font color=\"" .. ColorUtil.richTextColor(u61.color) .. "\">" .. u61.name .. "</font> at " .. tostring(u57.Position) .. "."
                });
            end;

            return p62;
        end);
    end;

    return false;
end);
u4.setUpTeamSpawn = RuntimeLib.async(function(p63, u64, p65) -- Line: 262
    -- upvalues: KnitClient (copy), default (copy), Flamework (copy), ColorUtil (copy)
    if p65 == "" or not p65 then
        return false;
    end;

    local u66 = KnitClient.Controllers.TeamController:getTeamById(p65);

    if u66 then
        return default.Client:Get("RequestSetTeamSpawn"):CallServerAsync({
            blockInstance = u64,
            teamId = p65
        }):andThen(function(p67) -- Line: 273
            -- upvalues: Flamework (ref), ColorUtil (ref), u66 (copy), u64 (copy)
            if p67 then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                    message = "Changed the spawn position for <font color=\"" .. ColorUtil.richTextColor(u66.color) .. "\">" .. u66.name .. "</font> to " .. tostring(u64.Position) .. "."
                });
            end;

            return p67;
        end);
    end;

    return false;
end);

function u4.openGadgetMenu(p68, p69) -- Line: 282
    -- upvalues: Flamework (copy), BedwarsAppIds (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CREATIVE_GADGET_MENU, {
        CreativeGadgetBlockInstance = p69
    });
end;

function u4.closeGadgetMenu(p70) -- Line: 287
    -- upvalues: Flamework (copy), BedwarsAppIds (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.CREATIVE_GADGET_MENU);
end;

KnitClient.CreateController(u4.new());

return nil;