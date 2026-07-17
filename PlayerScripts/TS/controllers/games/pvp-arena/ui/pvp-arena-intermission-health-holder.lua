-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local PvPArenaSoloHealthPanel = RuntimeLib.import(script, script.Parent, "pvp-arena-solo-health-panel").PvPArenaSoloHealthPanel;
local PvPArenaTeamHealthPanel = RuntimeLib.import(script, script.Parent, "pvp-arena-team-health-panel").PvPArenaTeamHealthPanel;

local function u9(p5) -- Line: 13
    local v6 = {};
    table.move(p5, 1, #p5, #v6 + 1, v6);
    table.sort(v6, function(p7, p8) -- Line: 17
        return p7.health > p8.health;
    end);

    return v6;
end;

local v33 = v3.new(u2)(function(p10, p11) -- Line: 26
    -- upvalues: u9 (copy), KnitClient (copy), QueueType (copy), u1 (copy), ClientStore (copy), u2 (copy), PvPArenaTeamHealthPanel (copy), Empty (copy), PvPArenaSoloHealthPanel (copy)
    local useEffect = p11.useEffect;
    local v12, u13 = p11.useState((u9(p10.PvPArenaTeamHealth)));
    local v14 = KnitClient.Controllers.MatchController:getQueueType() == QueueType.PVP_ARENA_SOLO;
    useEffect(function() -- Line: 35
        -- upvalues: u1 (ref), ClientStore (ref), u13 (copy), u9 (ref)
        local u15 = u1.new();
        local u18 = ClientStore.changed:connect(function(p16, p17) -- Line: 37
            -- upvalues: u13 (ref), u9 (ref)
            if p16.Game.pvpArenaTeamHealth ~= p17.Game.pvpArenaTeamHealth then
                u13((u9(p16.Game.pvpArenaTeamHealth)));
            end;
        end);
        u15:GiveTask(function() -- Line: 42
            -- upvalues: u18 (copy)
            u18:disconnect();
        end);

        return function() -- Line: 45
            -- upvalues: u15 (copy)
            u15:DoCleaning();
        end;
    end, {});

    if v14 then
        local function v21(p19, p20) -- Line: 87
            -- upvalues: u2 (ref), PvPArenaSoloHealthPanel (ref)
            return u2.createFragment({
                ["team-" .. p19.team.id] = u2.createElement(PvPArenaSoloHealthPanel, {
                    LayoutOrder = p20 + 1,
                    teamHealth = {
                        team = p19.team,
                        health = p19.health
                    }
                })
            });
        end;

        local v22 = table.create(#v12);

        for i, v in v12 do
            v22[i] = v21(v, i - 1, v12);
        end;

        local v23 = {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 1, 0)
        };
        local v24 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Right,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 12)
            }) };
        local v25 = #v24;

        for i, v in v22 do
            v24[v25 + i] = v;
        end;

        return u2.createElement(Empty, v23, v24);
    end;

    local function v28(p26, p27) -- Line: 51
        -- upvalues: u2 (ref), PvPArenaTeamHealthPanel (ref)
        return u2.createFragment({
            ["team-" .. p26.team.id] = u2.createElement(PvPArenaTeamHealthPanel, {
                LayoutOrder = p27 + 1,
                teamHealth = {
                    team = p26.team,
                    health = p26.health
                }
            })
        });
    end;

    local v29 = table.create(#v12);

    for i, v in v12 do
        v29[i] = v28(v, i - 1, v12);
    end;

    local v30 = {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0)
    };
    local v31 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 12)
        }) };
    local v32 = #v31;

    for i, v in v29 do
        v31[v32 + i] = v;
    end;

    return u2.createElement(Empty, v30, v31);
end);

return {
    PvPArenaIntermissionHealthHolder = v4.connect(function(p34, p35) -- Line: 126
        local v36 = {};

        for i, v in p35 do
            v36[i] = v;
        end;

        v36.PvPArenaTeamHealth = p34.Game.pvpArenaTeamHealth;

        return v36;
    end)(v33)
};