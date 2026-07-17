-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "TeamScoreController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 18
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 22
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "TeamScoreController";
    p3.scoresFolder = nil;
end;

function u1.KnitStart(u4) -- Line: 27
    -- upvalues: KnitController (copy), Workspace (copy), ClientStore (copy)
    KnitController.KnitStart(u4);
    task.spawn(function() -- Line: 29
        -- upvalues: u4 (copy), Workspace (ref), ClientStore (ref)
        u4.scoresFolder = Workspace:WaitForChild("TeamScores");
        local v5 = {};

        for _, child in u4.scoresFolder:GetChildren() do
            u4:hookScoreInstance(child);
            table.insert(v5, child);
        end;

        local function _(p6) -- Line: 42
            return {
                teamId = p6.Name,
                score = p6:GetAttribute("Score")
            };
        end;

        local v7 = table.create(#v5);
        local v8 = {
            type = "GameSetTeamScores"
        };

        for i, v in v5 do
            local _ = i - 1;
            v7[i] = {
                teamId = v.Name,
                score = v:GetAttribute("Score")
            };
        end;

        v8.teamScores = v7;
        ClientStore:dispatch(v8);
        u4.scoresFolder.ChildAdded:Connect(function(p9) -- Line: 56
            -- upvalues: ClientStore (ref), u4 (ref)
            ClientStore:dispatch({
                type = "GameAddTeamScore",
                teamId = p9.Name,
                score = p9:GetAttribute("Score")
            });
            u4:hookScoreInstance(p9);
        end);
    end);
end;

function u1.getHighestTeamScore(p10) -- Line: 67
    if not p10.scoresFolder then
        return nil;
    end;

    local v11 = p10.scoresFolder:GetChildren();
    table.sort(v11, function(p12, p13) -- Line: 72
        return p12:GetAttribute("Score") > p13:GetAttribute("Score");
    end);
    local u14 = v11[1]:GetAttribute("Score");

    local function _(p15) -- Line: 78
        -- upvalues: u14 (copy)
        return p15:GetAttribute("Score") == u14;
    end;

    local v16 = 0;
    local v17 = {};

    for i, v in v11 do
        local _ = i - 1;

        if v:GetAttribute("Score") == u14 == true then
            v16 = v16 + 1;
            v17[v16] = v;
        end;
    end;

    return v17;
end;

function u1.getTeamScores(p18) -- Line: 94
    if not p18.scoresFolder then
        return nil;
    end;

    local v19 = {};

    for _, child in p18.scoresFolder:GetChildren() do
        table.insert(v19, child);
    end;

    return v19;
end;

function u1.hookScoreInstance(p20, u21) -- Line: 106
    -- upvalues: ClientStore (copy), ClientSyncEvents (copy)
    u21:GetAttributeChangedSignal("Score"):Connect(function(p22) -- Line: 107
        -- upvalues: ClientStore (ref), u21 (copy), ClientSyncEvents (ref)
        ClientStore:dispatch({
            type = "GameUpdateTeamScore",
            teamId = u21.Name,
            score = u21:GetAttribute("Score")
        });
        ClientSyncEvents.TeamScoreChange:fire(u21, p22);
    end);
end;

KnitClient.CreateController(u1.new());

return nil;