-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local Signal = v1.Signal;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v3.ContextActionService;
local StarterGui = v3.StarterGui;
local UserInputService = v3.UserInputService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local TabList = RuntimeLib.import(script, script.Parent, "ui", "tab-list").TabList;
local u4 = false;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "TablistController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 29
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(u7) -- Line: 33
    -- upvalues: KnitController (copy), Signal (copy), Flamework (copy), TabList (copy), RuntimeLib (copy)
    KnitController.constructor(u7);
    u7.Name = "TablistController";
    u7.tablistOpen = false;
    u7.NewScoreboardSnapshot = Signal.new();

    function u7.openTablist() -- Line: 38
        -- upvalues: Flamework (ref), TabList (ref), u7 (copy)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
            appId = "TabList",
            app = TabList
        }, {});
        u7.tablistOpen = true;
    end;

    function u7.closeTablist() -- Line: 45
        -- upvalues: Flamework (ref), u7 (copy)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("TabList");
        u7.tablistOpen = false;
    end;

    function u7.toggleTablist() -- Line: 49
        -- upvalues: u7 (copy)
        if u7.tablistOpen then
            u7.closeTablist();
        else
            u7.openTablist();
        end;

        u7.tablistOpen = not u7.tablistOpen;
    end;

    function u7.getLatestScoreboardSnapshot() -- Line: 57
        -- upvalues: u7 (copy)
        return u7.latestSnapshot;
    end;

    function u7.waitForScoreboardSnapshot() -- Line: 60
        -- upvalues: RuntimeLib (ref), u7 (copy)
        return RuntimeLib.Promise.new(function(p8) -- Line: 61
            -- upvalues: u7 (ref)
            if u7.latestSnapshot then
                p8(u7.latestSnapshot);

                return;
            end;

            p8(({ u7.NewScoreboardSnapshot:Wait() })[1]);
        end);
    end;
end;

function u5.KnitStart(u9) -- Line: 71
    -- upvalues: PlaceUtil (copy), u4 (ref), StarterGui (copy), ContextActionService (copy), UserInputService (copy), default (copy), u2 (copy), ClientStore (copy)
    if PlaceUtil.isLobbyServer() then
        u4 = true;
    end;

    if PlaceUtil.isAfkServer() then
        u4 = true;
    end;

    if u4 then
        StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true);

        return nil;
    end;

    if not u4 then
        ContextActionService:BindAction("tab_list-toggle", function(p10, p11, p12) -- Line: 86
            -- upvalues: u9 (copy), UserInputService (ref)
            if p11 == Enum.UserInputState.Begin then
                u9.openTablist();
            end;

            if not UserInputService.GamepadEnabled and (p11 == Enum.UserInputState.End or p11 == Enum.UserInputState.Change) then
                u9.closeTablist();
            end;
        end, false, Enum.KeyCode.Tab, Enum.KeyCode.ButtonSelect);
    end;

    default.Client:WaitFor("SendTablistSnapshot"):andThen(function(p13) -- Line: 98
        -- upvalues: u2 (ref), ClientStore (ref), u9 (copy)
        p13:Connect(function(p14) -- Line: 99
            -- upvalues: u2 (ref), ClientStore (ref), u9 (ref)
            local v15 = u2.entries(p14.players);

            local function _(p16, p17) -- Line: 102
                local v18 = p17[2];
                p16[tonumber(p17[1])] = v18;

                return p16;
            end;

            local v19 = {};

            for i = 1, #v15 do
                local v20 = v15[i];
                local _ = i - 1;
                local v21 = v20[2];
                v19[tonumber(v20[1])] = v21;
            end;

            p14.players = v19;
            local v22 = u2.entries(p14.players);

            local function _(p23, p24) -- Line: 118
                local v25 = p24[1];
                local v26 = p24[2];
                local offlinePlayerDisplay = v26.offlinePlayerDisplay;

                if offlinePlayerDisplay ~= nil then
                    offlinePlayerDisplay = offlinePlayerDisplay.userId;
                end;

                if offlinePlayerDisplay ~= nil then
                    v25 = offlinePlayerDisplay;
                end;

                p23[v25] = v26.kills;

                return p23;
            end;

            local v27 = {};

            for i = 1, #v22 do
                local v28 = v22[i];
                local _ = i - 1;
                local v29 = v28[1];
                local v30 = v28[2];
                local offlinePlayerDisplay = v30.offlinePlayerDisplay;

                if offlinePlayerDisplay ~= nil then
                    offlinePlayerDisplay = offlinePlayerDisplay.userId;
                end;

                if offlinePlayerDisplay ~= nil then
                    v29 = offlinePlayerDisplay;
                end;

                v27[v29] = v30.kills;
            end;

            local function _(p31, p32) -- Line: 141
                p31[p32[1]] = p32[2].eliminated;

                return p31;
            end;

            local v33 = {};

            for i = 1, #v22 do
                local v34 = v22[i];
                local _ = i - 1;
                v33[v34[1]] = v34[2].eliminated;
            end;

            ClientStore:dispatch({
                type = "BedwarsSetSome",
                data = {
                    kills = v27,
                    finalDeaths = v33
                }
            });

            local function _(p35) -- Line: 163
                -- upvalues: ClientStore (ref)
                local v36 = p35[1];
                local v37 = p35[2];

                if v37.kit then
                    ClientStore:dispatch({
                        type = "BedwarsSetKits",
                        userId = v36,
                        kit = v37.kit
                    });
                end;
            end;

            for i, v in v22 do
                local _ = i - 1;
                local v38 = v[1];
                local v39 = v[2];

                if v39.kit then
                    ClientStore:dispatch({
                        type = "BedwarsSetKits",
                        userId = v38,
                        kit = v39.kit
                    });
                end;
            end;

            local function _(p40) -- Line: 179
                -- upvalues: ClientStore (ref)
                local v41 = p40[2];
                ClientStore:dispatch({
                    type = "BedwarsSetBedStatus",
                    teamId = tostring(p40[1]),
                    bedStatus = v41.bedStatus
                });
            end;

            for i, v in u2.entries(p14.teams) do
                local _ = i - 1;
                local v42 = v[2];
                ClientStore:dispatch({
                    type = "BedwarsSetBedStatus",
                    teamId = tostring(v[1]),
                    bedStatus = v42.bedStatus
                });
            end;

            u9.latestSnapshot = p14;
            u9.NewScoreboardSnapshot:Fire(p14);
        end);
    end);
    default.Client:WaitFor("SendTablistPlayerUpdate"):andThen(function(p43) -- Line: 198
        -- upvalues: ClientStore (ref)
        p43:Connect(function(p44, p45) -- Line: 199
            -- upvalues: ClientStore (ref)
            if p45.isEliminated then
                ClientStore:dispatch({
                    type = "BedwarsSetFinalDeaths",
                    userId = p44,
                    dead = p45.isEliminated
                });
            end;
        end);
    end);
    default.Client:WaitFor("SendTablistTeamUpdate"):andThen(function(p46) -- Line: 211
        -- upvalues: ClientStore (ref)
        p46:Connect(function(p47, p48) -- Line: 212
            -- upvalues: ClientStore (ref)
            ClientStore:dispatch({
                type = "BedwarsSetBedStatus",
                teamId = tostring(p47),
                bedStatus = p48.bedStatus
            });
        end);
    end);
    default.Client:WaitFor("SendTablistTeamsUpdate"):andThen(function(p49) -- Line: 222
        -- upvalues: u2 (ref), ClientStore (ref)
        p49:Connect(function(p50) -- Line: 223
            -- upvalues: u2 (ref), ClientStore (ref)
            local function _(p51) -- Line: 226
                -- upvalues: ClientStore (ref)
                local v52 = p51[2];
                ClientStore:dispatch({
                    type = "BedwarsSetBedStatus",
                    teamId = tostring(p51[1]),
                    bedStatus = v52.bedStatus
                });
            end;

            for i, v in u2.entries(p50) do
                local _ = i - 1;
                local v53 = v[2];
                ClientStore:dispatch({
                    type = "BedwarsSetBedStatus",
                    teamId = tostring(v[1]),
                    bedStatus = v53.bedStatus
                });
            end;
        end);
    end);
    default.Client:Get("RequestTablistSnapshot"):SendToServer();
end;

return {
    TablistController = KnitClient.CreateController(u5.new())
};