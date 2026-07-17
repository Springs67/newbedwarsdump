-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "TeammateHighlightController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 31
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 35
    -- upvalues: KnitController (copy), u3 (copy)
    KnitController.constructor(p8);
    p8.Name = "TeammateHighlightController";
    p8.highlightMaid = u3.new();
    p8.highlightMap = {};
end;

function u6.KnitStart(p9) -- Line: 41
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p9);
end;

function u6.setupTeamHighlightSystem(u10) -- Line: 56
    -- upvalues: ClientSyncEvents (copy), MatchState (copy), Players (copy), ClientStore (copy)
    ClientSyncEvents.MatchStateChange:connect(function(p11) -- Line: 57
        -- upvalues: MatchState (ref), u10 (copy)
        if p11.matchState ~= MatchState.RUNNING then
            return nil;
        end;

        u10:disableTeammateHighlights();
        u10:watchTeammateHighlights();
    end);
    Players.LocalPlayer:GetAttributeChangedSignal("Team"):Connect(function() -- Line: 65
        -- upvalues: ClientStore (ref), MatchState (ref), u10 (copy)
        if ClientStore:getState().Game.matchState == MatchState.PRE then
            return nil;
        end;

        u10:disableTeammateHighlights();
        u10:watchTeammateHighlights();
    end);
end;

function u6.highlightInstances(u12, p13) -- Line: 73
    -- upvalues: u3 (copy), Players (copy), u4 (copy)
    local u14 = u3.new();

    local function v17(u15) -- Line: 76
        -- upvalues: Players (ref), u4 (ref), u12 (copy), u14 (copy)
        if u15 == Players.LocalPlayer.Character then
            return nil;
        end;

        local v16 = u4("Highlight", {
            Name = "TeammateHighlight",
            FillTransparency = 0.5,
            OutlineTransparency = 1,
            Parent = u15,
            FillColor = Color3.fromRGB(0, 255, 0),
            DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        });
        u12.highlightMap[u15] = v16;
        u14:GiveTask(v16);
        u14:GiveTask(function() -- Line: 93
            -- upvalues: u12 (ref), u15 (copy)
            u12.highlightMap[u15] = nil;
        end);
    end;

    for i, v in p13 do
        v17(v, i - 1, p13);
    end;

    return u14;
end;

function u6.removeHighlightFromInstances(p18, p19) -- Line: 104
    local function _(p20) -- Line: 106
        local TeammateHighlight = p20:FindFirstChild("TeammateHighlight");

        if TeammateHighlight ~= nil then
            TeammateHighlight:Destroy();
        end;
    end;

    for i, v in p19 do
        local _ = i - 1;
        local TeammateHighlight = v:FindFirstChild("TeammateHighlight");

        if TeammateHighlight ~= nil then
            TeammateHighlight:Destroy();
        end;
    end;
end;

function u6.enableHighlight(u21, p22) -- Line: 116
    local function _(p23) -- Line: 118
        -- upvalues: u21 (copy)
        local v24 = u21.highlightMap[p23];

        if v24 then
            v24.Enabled = true;
        end;
    end;

    for i, v in p22 do
        local _ = i - 1;
        local v25 = u21.highlightMap[v];

        if v25 then
            v25.Enabled = true;
        end;
    end;
end;

function u6.disableHighlight(u26, p27) -- Line: 130
    local function _(p28) -- Line: 132
        -- upvalues: u26 (copy)
        local v29 = u26.highlightMap[p28];

        if v29 then
            v29.Enabled = false;
        end;
    end;

    for i, v in p27 do
        local _ = i - 1;
        local v30 = u26.highlightMap[v];

        if v30 then
            v30.Enabled = false;
        end;
    end;
end;

function u6.watchTeammateHighlights(u31) -- Line: 144
    -- upvalues: Players (copy), KnitClient2 (copy), CollectionService (copy), WatchCollectionTag (copy), EntityUtil (copy)
    local u32 = Players.LocalPlayer:GetAttribute("Team");

    if u32 == 0 or (u32 ~= u32 or not u32) then
        return nil;
    end;

    if not KnitClient2.Controllers.TeamController:getTeamById((tostring(u32))) then
        return nil;
    end;

    u31.highlightMaid:GiveTask(CollectionService:GetInstanceRemovedSignal("TEAM_" .. tostring(u32)):Connect(function(p33) -- Line: 153
        -- upvalues: u31 (copy)
        u31:removeHighlightFromInstances({ p33 });
    end));
    u31.highlightMaid:GiveTask(WatchCollectionTag("TEAM_" .. tostring(u32), function(p34) -- Line: 156
        -- upvalues: EntityUtil (ref), u31 (copy)
        local v35 = EntityUtil:getLocalPlayerEntity();

        if v35 ~= nil then
            v35 = v35:isDead();
        end;

        if v35 then
            return nil;
        end;

        local v36 = EntityUtil:getEntity(p34);

        if v36 ~= nil then
            v36 = v36:isPlayer();
        end;

        if not v36 then
            return nil;
        end;

        u31:highlightInstances({ p34 });
    end));
    local u37 = true;
    u31.highlightMaid:GiveTask(function() -- Line: 175
        -- upvalues: u37 (ref)
        u37 = false;
    end);
    task.spawn(function() -- Line: 178
        -- upvalues: CollectionService (ref), u32 (copy), Players (ref), EntityUtil (ref), u31 (copy), u37 (ref)
        while true do
            local v38 = CollectionService:GetTagged("TEAM_" .. tostring(u32));

            local function v41(p39) -- Line: 182
                -- upvalues: Players (ref), EntityUtil (ref), u31 (ref)
                if p39 == Players.LocalPlayer.Character then
                    return nil;
                end;

                local v40 = EntityUtil:getEntity(p39);

                if not v40 then
                    return nil;
                end;

                if not v40:isPlayer() then
                    return nil;
                end;

                if u31:canCameraSee(v40) then
                    u31:disableHighlight({ v40:getInstance() });

                    return;
                end;

                u31:enableHighlight({ v40:getInstance() });
            end;

            for i, v in v38 do
                v41(v, i - 1, v38);
            end;

            local v42 = u37 and task.wait(0.5);

            if v42 == 0 or (v42 ~= v42 or not v42) then
                return;
            end;
        end;
    end);
end;

function u6.disableTeammateHighlights(p43) -- Line: 209
    p43.highlightMaid:DoCleaning();
end;

function u6.canCameraSee(p44, p45) -- Line: 212
    -- upvalues: Players (copy), Workspace (copy), GameQueryUtil (copy)
    local Character = Players.LocalPlayer.Character;

    if not Character then
        return false;
    end;

    local v46 = p45:getInstance();
    local v47 = p45:getInstance():FindFirstChild("Head") or v46;
    local CurrentCamera = Workspace.CurrentCamera;

    if not CurrentCamera then
        return false;
    end;

    local v48, v49 = CurrentCamera:WorldToViewportPoint(v46:GetPivot().Position);

    if not v49 then
        return false;
    end;

    local v50 = CurrentCamera:ViewportPointToRay(v48.X, v48.Y, 0);
    local v51 = RaycastParams.new();
    v51.FilterDescendantsInstances = { Character, v46, v47 };
    v51.FilterType = Enum.RaycastFilterType.Exclude;
    local v52 = GameQueryUtil:raycast(v50.Origin, v47:GetPivot().Position - v50.Origin, v51);

    if v49 then
        v49 = not v52;
    end;

    return v49;
end;

KnitClient.CreateController(u6.new());

return nil;