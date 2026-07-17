-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local MatchDraftConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "draft", "match-draft-config").MatchDraftConfig;
local MatchDraftPhase = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "draft", "match-draft-phase").MatchDraftPhase;
local MatchDraftSelectorOption = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "draft", "match-draft-selector-options").MatchDraftSelectorOption;
local MatchDraftBanBox = RuntimeLib.import(script, script.Parent, "match-draft-ban-box").MatchDraftBanBox;
local MatchDraftTeamPlayerIcon = RuntimeLib.import(script, script.Parent, "match-draft-team-player-icon").MatchDraftTeamPlayerIcon;

return {
    MatchDraftTeamCard = v4.new(u3)(function(u5, p6) -- Line: 16
        -- upvalues: MatchDraftConfig (copy), ColorUtil (copy), u3 (copy), MatchDraftBanBox (copy), Empty (copy), u2 (copy), getQueueMeta (copy), QueueType (copy), MatchDraftPhase (copy), MatchDraftSelectorOption (copy), MatchDraftTeamPlayerIcon (copy)
        local _ = p6.useState;
        local sharedData = u5.store.Draft.sharedData;

        if sharedData ~= nil then
            sharedData = sharedData.kitBans[u5.Team.id];
        end;

        local v7 = sharedData == nil and {} or sharedData;
        local v8 = #v7;
        local v9 = false;

        while true do
            if v9 then
                v8 = v8 + 1;
            else
                v9 = true;
            end;

            if v8 >= MatchDraftConfig.BANNING_ROUNDS then
                local v10 = {};

                for i, v in u5 do
                    v10[i] = v;
                end;

                v10.store = nil;
                v10.Team = nil;
                v10.IsTeamLockedIn = nil;
                local v11 = {};

                for i, v in v10 do
                    v11[i] = v;
                end;

                v11.BackgroundColor3 = ColorUtil.WHITE;
                v11.ClipsDescendants = false;
                v11.BorderSizePixel = 0;
                local v12 = {};
                local createElement = u3.createElement;
                local v13 = {
                    Rotation = 0
                };
                local new = ColorSequence.new;
                local v14;

                if u5.IsTeamLockedIn then
                    v14 = {};
                    local v15 = ColorSequenceKeypoint.new(0, u5.Team.color or Color3.fromRGB(62, 174, 255));
                    local new2 = ColorSequenceKeypoint.new;
                    local v16;

                    if u5.Team.color then
                        v16 = ColorUtil.darken(u5.Team.color, 0.6);
                    else
                        v16 = Color3.fromRGB(42, 113, 165);
                    end;

                    v14[1], v14[2] = v15, new2(1, v16);
                else
                    v14 = {};
                    local new2 = ColorSequenceKeypoint.new;
                    local v17;

                    if u5.Team.color then
                        v17 = ColorUtil.darken(u5.Team.color, 0.3);
                    else
                        v17 = Color3.fromRGB(42, 113, 165);
                    end;

                    v14[1], v14[2] = new2(0, v17), ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 15));
                end;

                v13.Color = new(v14);
                v12[1], v12[2] = createElement("UIGradient", v13), u3.createElement("UIAspectRatioConstraint", {
    AspectRatio = 2
});
                local v18 = #v12;

                local function v20(p19) -- Line: 69
                    -- upvalues: u3 (ref), MatchDraftBanBox (ref), u5 (copy)
                    return u3.createFragment({
                        TeamKitBanBox = u3.createElement(MatchDraftBanBox, {
                            Size = UDim2.fromScale(0.9, 0.9),
                            Position = UDim2.fromScale(0.5, 0.5),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            TeamColor = u5.Team.color,
                            BanData = {
                                LockedIn = true,
                                Kit = p19 or nil
                            }
                        })
                    });
                end;

                local v21 = table.create(#v7);

                for i, v in v7 do
                    v21[i] = v20(v, i - 1, v7);
                end;

                local v22 = {
                    Size = UDim2.fromScale(1, 0.8)
                };
                local v23 = { u3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        Padding = UDim.new(0.02, 0),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }) };
                local v24 = #v23;

                for i, v in v21 do
                    v23[v24 + i] = v;
                end;

                v12[v18 + 1] = u3.createElement(Empty, v22, v23);
                local v25 = {
                    BackgroundTransparency = 0.3,
                    BorderSizePixel = 0,
                    ZIndex = 2,
                    Size = UDim2.fromScale(1, 0.2),
                    Position = UDim2.fromScale(0, 1),
                    AnchorPoint = Vector2.new(0, 1),
                    BackgroundColor3 = ColorUtil.BLACK
                };
                local v26 = {};
                local _ = #v26;
                local v27 = {
                    Size = UDim2.fromScale(0.48, 1),
                    Position = UDim2.fromScale(0.02, 0),
                    Text = "Team " .. u5.Team.name
                };
                local myTeam = u5.store.Game.myTeam;

                if myTeam ~= nil then
                    myTeam = myTeam.id;
                end;

                local v28;

                if u5.Team.id == myTeam then
                    v28 = Color3.fromRGB(255, 204, 92);
                else
                    v28 = Color3.fromRGB(255, 255, 255);
                end;

                v27.TextColor3 = v28;
                v27.TextXAlignment = Enum.TextXAlignment.Left;
                v27.TextScaled = true;
                v27.Font = Enum.Font.SourceSansBold;
                v27.AutoLocalize = false;
                v27.BorderSizePixel = 0;
                v27.BackgroundTransparency = 1;
                v27.ZIndex = 2;
                v26.TeamName = u3.createElement("TextLabel", v27, { u3.createElement("UITextSizeConstraint", {
                        MaxTextSize = 18
                    }) });
                v12.TextBackgroundBar = u3.createElement("Frame", v25, v26);
                local v29 = u2.values(u5.Team.members);

                local function v42(p30, p31) -- Line: 142
                    -- upvalues: u5 (copy), getQueueMeta (ref), QueueType (ref), MatchDraftPhase (ref), MatchDraftSelectorOption (ref), u3 (ref), MatchDraftTeamPlayerIcon (ref)
                    local myTeam2 = u5.store.Game.myTeam;

                    if myTeam2 ~= nil then
                        myTeam2 = myTeam2.id;
                    end;

                    local v32 = myTeam2 == u5.Team.id;

                    local function _(p33) -- Line: 149
                        -- upvalues: u5 (ref)
                        return p33.id ~= u5.Team.id;
                    end;

                    local v34 = nil;

                    for i, v in getQueueMeta(u5.store.Game.queueType or QueueType.BEDWARS_TO4).teams do
                        local _ = i - 1;

                        if v.id ~= u5.Team.id == true then
                            v34 = v;
                            break;
                        end;
                    end;

                    if v34 ~= nil then
                        v34 = v34.maxPlayers;
                    end;

                    local v35 = false;
                    local v36;

                    if v32 then
                        local sharedData2 = u5.store.Draft.sharedData;

                        if sharedData2 ~= nil then
                            sharedData2 = sharedData2.matchDraftPhase;
                        end;

                        if sharedData2 == MatchDraftPhase.BANNING then
                            local v37 = u5.store.Draft.teamData.votedKitBans[tostring(p31.userId)];

                            if v37 ~= nil then
                                v37 = v37.selectorOption;
                            end;

                            v36 = v37 == MatchDraftSelectorOption.SELECT;
                        else
                            local sharedData3 = u5.store.Draft.sharedData;

                            if sharedData3 ~= nil then
                                sharedData3 = sharedData3.matchDraftPhase;
                            end;

                            if sharedData3 == MatchDraftPhase.KIT_SELECT then
                                local v38 = u5.store.Draft.teamData.kitSelection[tostring(p31.userId)];

                                if v38 ~= nil then
                                    v38 = v38.selectorOption;
                                end;

                                v36 = v38 == MatchDraftSelectorOption.SELECT;
                            else
                                local sharedData4 = u5.store.Draft.sharedData;

                                if sharedData4 ~= nil then
                                    sharedData4 = sharedData4.matchDraftPhase;
                                end;

                                v36 = sharedData4 == MatchDraftPhase.BANNING_TRANSITION and true or v35;
                            end;
                        end;
                    else
                        local sharedData2 = u5.store.Draft.sharedData;

                        if sharedData2 ~= nil then
                            sharedData2 = sharedData2.matchDraftPhase;
                        end;

                        if sharedData2 == MatchDraftPhase.BANNING then
                            local v39 = u5.store.Draft.enemyTeamData[u5.Team.id];

                            if v39 ~= nil then
                                v39 = v39.playersVoted;
                            end;

                            v36 = v39[tostring(p31.userId)] ~= nil;

                            if v36 == nil then
                                v36 = false;
                            end;
                        else
                            local sharedData3 = u5.store.Draft.sharedData;

                            if sharedData3 ~= nil then
                                sharedData3 = sharedData3.matchDraftPhase;
                            end;

                            if sharedData3 == MatchDraftPhase.KIT_SELECT then
                                local v40 = u5.store.Draft.enemyTeamData[u5.Team.id];

                                if v40 ~= nil then
                                    v40 = v40.kitSelection;
                                end;

                                v36 = v40[tostring(p31.userId)] ~= nil;

                                if v36 == nil then
                                    v36 = false;
                                end;
                            else
                                local sharedData4 = u5.store.Draft.sharedData;

                                if sharedData4 ~= nil then
                                    sharedData4 = sharedData4.matchDraftPhase;
                                end;

                                v36 = sharedData4 == MatchDraftPhase.BANNING_TRANSITION and true or v35;
                            end;
                        end;
                    end;

                    local v41 = u3.createElement(MatchDraftTeamPlayerIcon, {
                        Player = p31,
                        DidPlayerVote = v36,
                        TeamSize = v34 == nil and 4 or v34
                    });
                    table.insert(p30, v41);

                    return p30;
                end;

                local v43 = {};

                for i = 1, #v29 do
                    v43 = v42(v43, v29[i], i - 1, v29);
                end;

                local v44 = {
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0, 35, 1, 0),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(1, 0.5),
                    BackgroundColor3 = ColorUtil.BLACK
                };
                local v45 = { u3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        VerticalAlignment = Enum.VerticalAlignment.Top,
                        Padding = UDim.new(0.02, 0),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }) };
                local v46 = #v45;

                for i, v in v43 do
                    v45[v46 + i] = v;
                end;

                v12[v18 + 2] = u3.createElement("Frame", v44, v45);

                return u3.createElement("Frame", v11, v12);
            end;

            table.insert(v7, false);
        end;
    end)
};