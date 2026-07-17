-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local TorunamentTeamRecommendedPlayer = RuntimeLib.import(script, script.Parent, "tournament-team-recommended-player").TorunamentTeamRecommendedPlayer;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;

return {
    TournamentOutboundRecommendations = v2.new(u1)(function(p3, p4) -- Line: 10
        -- upvalues: default (copy), ClientStore (copy), OfflinePlayerUtil (copy), u1 (copy), TorunamentTeamRecommendedPlayer (copy), Theme (copy)
        local useEffect = p4.useEffect;
        local v5, u6 = p4.useState({});
        useEffect(function() -- Line: 14
            -- upvalues: default (ref), ClientStore (ref), OfflinePlayerUtil (ref), u6 (copy)
            default.Client:GetNamespace("Tournament"):Get("FetchRecommendedPlayersToInvite"):CallServerAsync():andThen(function(p7) -- Line: 15
                -- upvalues: ClientStore (ref), OfflinePlayerUtil (ref), u6 (ref)
                local friends = ClientStore:getState().Friends.friends;

                local function _(p8) -- Line: 17
                    return p8.userId;
                end;

                local v9 = table.create(#friends);

                for i, v in friends do
                    local _ = i - 1;
                    v9[i] = v.userId;
                end;

                local v10 = {};
                local v11 = #v10;
                local v12 = #p7;
                table.move(p7, 1, v12, v11 + 1, v10);
                table.move(v9, 1, #v9, v11 + v12 + 1, v10);

                local function _(p13) -- Line: 33
                    -- upvalues: ClientStore (ref)
                    local v14 = ClientStore:getState().Tournament.myTeamMembers or {};

                    return table.find(v14, p13) == nil;
                end;

                local v15 = 0;
                local v16 = {};

                for i, v in v10 do
                    local _ = i - 1;
                    local v17 = ClientStore:getState().Tournament.myTeamMembers or {};

                    if table.find(v17, v) == nil == true then
                        v15 = v15 + 1;
                        v16[v15] = v;
                    end;
                end;

                OfflinePlayerUtil.getOfflinePlayersByUserIds(v16):andThen(function(p18) -- Line: 49
                    -- upvalues: u6 (ref)
                    u6(p18);
                end);
            end);
        end, {});
        local v19 = {};
        local LayoutOrder = p3.LayoutOrder;
        v19.LayoutOrder = LayoutOrder == nil and 2 or LayoutOrder;
        v19.Size = UDim2.fromScale(1, 0.95);
        v19.BackgroundTransparency = 1;
        local v20;

        if #v5 == 0 then
            v20 = u1.createElement("TextLabel", {
                Text = "<b>No recommended invites.</b>",
                BackgroundTransparency = 1,
                TextTransparency = 0,
                BorderSizePixel = 0,
                TextScaled = true,
                RichText = true,
                Font = "Roboto",
                LayoutOrder = 2,
                Size = UDim2.fromScale(1, 0.8),
                TextColor3 = Theme.textPrimary,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top
            }, { u1.createElement("UITextSizeConstraint", {
                    MaxTextSize = 24
                }) });
        else
            local function _(p21, p22) -- Line: 64
                -- upvalues: u1 (ref), TorunamentTeamRecommendedPlayer (ref)
                return u1.createElement(TorunamentTeamRecommendedPlayer, {
                    DisplayPlayer = p21,
                    LayoutOrder = p22
                });
            end;

            v20 = table.create(#v5);

            for i, v in v5 do
                v20[i] = u1.createElement(TorunamentTeamRecommendedPlayer, {
                    DisplayPlayer = v,
                    LayoutOrder = i - 1
                });
            end;
        end;

        local v23 = { u1.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 10)
            }) };
        local v24 = #v23;

        if v20.elements == nil and (v20.props == nil or v20.component == nil) then
            for i, v in v20 do
                v23[v24 + i] = v;
            end;
        else
            v23[v24 + 1] = v20;
        end;

        return u1.createElement("Frame", v19, v23);
    end)
};