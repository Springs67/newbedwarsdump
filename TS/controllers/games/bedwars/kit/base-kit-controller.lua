-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local getAbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").getAbilityMeta;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "inspect", "inspect");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local LoggerProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "logger-provider").LoggerProvider;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "BaseKitController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.constructor(p4, p5, p6) -- Line: 26
    -- upvalues: KnitController (copy), u2 (copy), getBedwarsKitMeta (copy), LoggerProvider (copy)
    KnitController.constructor(p4);
    p4.kit = p5;
    p4.preloadAssets = p6;
    p4.Name = "BaseKitController";
    p4.localLogicActivate = false;
    p4.localKitMaid = u2.new();
    p4.replicationLogicActivate = false;
    p4.replicationKitMaid = u2.new();
    p4.retryThread = nil;
    p4.clientReady = false;
    p4.playersUsingKit = {};
    p4.kitMeta = getBedwarsKitMeta(p5);
    p4.logger = LoggerProvider.getLogger(p4.kit .. "_controller");
end;

function u3.KnitStart(u7) -- Line: 41
    -- upvalues: KnitController (copy), KnitClient (copy), PlaceUtil (copy), MatchState (copy), ClientSyncEvents (copy), Players (copy), default (copy)
    KnitController.KnitStart(u7);
    KnitClient.Controllers.KitController:watchKit(function(p8, p9) -- Line: 44
        -- upvalues: u7 (copy), PlaceUtil (ref), KnitClient (ref), MatchState (ref)
        if p9 == u7.kit then
            u7:add(p8);

            if PlaceUtil.isGameServer() and KnitClient.Controllers.MatchController:getMatchState() == MatchState.RUNNING then
                u7:initKit(p8);
            end;
        end;
    end);
    ClientSyncEvents.MatchStateChange:connect(function(p10) -- Line: 53
        -- upvalues: MatchState (ref), u7 (copy), Players (ref)
        if p10.matchState ~= MatchState.RUNNING then
            return nil;
        end;

        if next(u7.playersUsingKit) == nil then
            return nil;
        end;

        local function _(p11) -- Line: 61
            -- upvalues: Players (ref), u7 (ref)
            local v12 = Players:GetPlayerByUserId(p11);

            if v12 then
                u7:initKit(v12);
            end;
        end;

        for i in u7.playersUsingKit do
            local v13 = Players:GetPlayerByUserId(i);

            if v13 then
                u7:initKit(v13);
            end;
        end;
    end);
    Players.PlayerRemoving:Connect(function(p14) -- Line: 72
        -- upvalues: u7 (copy), PlaceUtil (ref), KnitClient (ref), MatchState (ref)
        u7:remove(p14);

        if PlaceUtil.isLobbyServer() or KnitClient.Controllers.MatchController:getMatchState() == MatchState.RUNNING then
            u7:deinitKit(p14);
        end;
    end);
    ClientSyncEvents.KitUnequip:connect(function(p15) -- Line: 78
        -- upvalues: u7 (copy), KnitClient (ref), MatchState (ref)
        if p15.kit ~= u7.kit then
            return nil;
        end;

        u7:remove(p15.player);

        if KnitClient.Controllers.MatchController:getMatchState() == MatchState.RUNNING then
            u7:deinitKit(p15.player);
        end;
    end);
    default.Client:Get("KitControllerReadyResponse"):Connect(function(p16) -- Line: 87
        -- upvalues: u7 (copy)
        if p16 ~= u7.kit then
            return nil;
        end;

        u7.clientReady = true;
    end);
end;

function u3.add(p17, p18) -- Line: 94
    p17.playersUsingKit[p18.UserId] = true;
    p17.logger:Verbose("[BASE-KIT-CONTROLLER] Add player " .. p18.Name .. " to kit: " .. p17.kit .. " ");
end;

function u3.remove(p19, p20) -- Line: 100
    if p19.playersUsingKit[p20.UserId] == nil then
        return nil;
    end;

    p19.playersUsingKit[p20.UserId] = nil;
    p19.logger:Verbose("[BASE-KIT-CONTROLLER] Remove player " .. p20.Name .. " from kit: " .. p19.kit .. " ");
end;

function u3.initKit(u21, u22) -- Line: 111
    -- upvalues: Players (copy), u3 (ref), default (copy)
    u21:activateKitReplication();

    if u22 == Players.LocalPlayer then
        u21:activateLocalKit();
    end;

    if Players.LocalPlayer == u22 then
        if u21.retryThread then
            task.cancel(u21.retryThread);
            u21.retryThread = nil;
        end;

        u21.clientReady = false;
        u21.retryThread = task.spawn(function() -- Line: 124
            -- upvalues: u3 (ref), u21 (copy), default (ref), u22 (copy)
            local v23 = 0;

            while v23 < u3.RETRIES + 1 and not u21.clientReady do
                default.Client:Get("KitControllerReady"):SendToServer(u21.kit);
                task.wait(u3.RETRY_DELAY);
                v23 = v23 + 1;
            end;

            if u3.RETRIES + 1 <= v23 and not u21.clientReady then
                u21.logger:Error("[BASE-KIT-CONTROLLER] Kit " .. u21.kit .. " failed to initialize for player " .. u22.Name);
            end;
        end);
    end;

    u21.logger:Verbose("[BASE-KIT-CONTROLLER] Init Kit " .. u21.kit .. " for player: " .. u22.Name);
end;

function u3.deinitKit(p24, p25) -- Line: 143
    -- upvalues: Players (copy)
    p24.playersUsingKit[p25.UserId] = nil;

    if p25 == Players.LocalPlayer then
        p24:deactivateLocalKit();
    end;

    if next(p24.playersUsingKit) == nil then
        p24:deactivateKitReplication();
    end;

    p24.logger:Verbose("[BASE-KIT-CONTROLLER] Deinit Kit " .. p24.kit .. " for player: " .. p25.Name);
end;

function u3.activateLocalKit(p26) -- Line: 157
    if p26.localLogicActivate then
        return nil;
    end;

    p26.localLogicActivate = true;
    p26:onKitLocalActivated(p26.localKitMaid);
    p26:preloadKitAssets();
    p26:setupInnateAbilities();
    p26.logger:Verbose("[BASE-KIT-CONTROLLER] Activated Local Kit: " .. p26.kit);
end;

function u3.deactivateLocalKit(p27) -- Line: 167
    -- upvalues: Flamework (copy)
    if not p27.localLogicActivate then
        return nil;
    end;

    p27.localLogicActivate = false;

    if p27.kitMeta.abilities ~= nil and #p27.kitMeta.abilities ~= 0 then
        local function _(p28) -- Line: 175
            -- upvalues: Flamework (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(p28.abilityId);
        end;

        for i, v in p27.kitMeta.abilities do
            local _ = i - 1;
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(v.abilityId);
        end;
    end;

    p27.localKitMaid:DoCleaning();
    p27:onKitLocalDeactivated();
    p27.logger:Verbose("[BASE-KIT-CONTROLLER] Deactivated Local Kit: " .. p27.kit);
end;

function u3.activateKitReplication(u29) -- Line: 186
    -- upvalues: ClientSyncEvents (copy)
    if u29.replicationLogicActivate then
        return nil;
    end;

    u29.replicationLogicActivate = true;

    if u29.kitMeta.abilities ~= nil and #u29.kitMeta.abilities ~= 0 then
        u29.localKitMaid:GiveTask(ClientSyncEvents.AbilityUsed:connect(function(p30) -- Line: 192
            -- upvalues: u29 (copy)
            u29:onAbilityUsed(p30.userCharacter, p30);
        end));
    end;

    u29:onKitReplicationActivated(u29.replicationKitMaid);
    u29.logger:Verbose("[BASE-KIT-CONTROLLER] Activate Kit Replication: " .. u29.kit);
end;

function u3.deactivateKitReplication(p31) -- Line: 199
    p31.replicationLogicActivate = false;
    p31.replicationKitMaid:DoCleaning();
    p31:onKitReplicationDeactivated();
    p31.logger:Verbose("[BASE-KIT-CONTROLLER] Deactivate Kit Replication: " .. p31.kit);
end;

function u3.preloadKitAssets(p32) -- Line: 205
    -- upvalues: KnitClient (copy)
    if p32.preloadAssets then
        KnitClient.Controllers.PreloadController:runPreload(p32.preloadAssets);
    end;
end;

function u3.setupInnateAbilities(u33) -- Line: 210
    -- upvalues: Flamework (copy), getAbilityMeta (copy), u1 (copy), ClientSyncEvents (copy), MatchState (copy), KnitClient (copy)
    local abilities = u33.kitMeta.abilities;

    if abilities ~= nil then
        local function _(p34) -- Line: 213
            return p34.innate;
        end;

        local v35 = 0;
        abilities = {};

        for i, v in abilities do
            local _ = i - 1;

            if v.innate == true then
                v35 = v35 + 1;
                abilities[v35] = v;
            end;
        end;
    end;

    if abilities == nil or #abilities == 0 then
        return nil;
    end;

    local u36 = false;

    local function u42(p37) -- Line: 233
        -- upvalues: u36 (ref), Flamework (ref), getAbilityMeta (ref), u33 (copy), u1 (ref)
        u36 = true;

        local function v41(u38) -- Line: 236
            -- upvalues: Flamework (ref), getAbilityMeta (ref), u33 (ref), u1 (ref)
            if not u38.innate then
                return nil;
            end;

            if Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u38.abilityId) then
                return nil;
            end;

            local v39 = getAbilityMeta(u38.abilityId);
            u33.logger:Verbose("[BASE-KIT-CONTROLLER] Setup Innate Ability Request: " .. u38.abilityId .. " " .. tostring(u38.innate) .. " " .. u1(u38.triggerConfigOverride or v39.triggerConfig));
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u38.abilityId, u38.triggerConfigOverride or v39.triggerConfig):andThen(function(p40) -- Line: 246
                -- upvalues: u33 (ref), u38 (copy)
                u33.logger:Verbose("[BASE-KIT-CONTROLLER] Setup Innate Ability Succcess: " .. u38.abilityId .. " " .. tostring(u38.innate));
                u33:onInnateAbilityEnabled(u38, p40);
                u33.localKitMaid:GiveTask(p40);
            end);
        end;

        for i, v in p37 do
            v41(v, i - 1, p37);
        end;
    end;

    u33.localKitMaid:GiveTask(ClientSyncEvents.MatchStateChange:connect(function(p43) -- Line: 260
        -- upvalues: MatchState (ref), u36 (ref), u42 (copy), abilities (copy)
        if p43.matchState == MatchState.RUNNING and not u36 then
            u42(abilities);
        end;
    end));

    if KnitClient.Controllers.MatchController:getMatchState() == MatchState.RUNNING and not u36 then
        u42(abilities);
    end;
end;

u3.RETRIES = 5;
u3.RETRY_DELAY = 1;

return {
    BaseKitController = u3
};