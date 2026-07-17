-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getClanWarMissionDescription = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "missions", "clan-war-mission-definition").getClanWarMissionDescription;
local ClanWarMissionDefinitionConverter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "missions", "clan-war-mission-definition-converter").ClanWarMissionDefinitionConverter;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    ClanWarPlayerMissionDescription = v2.new(u1)(function(p3, p4) -- Line: 9
        -- upvalues: ClanWarMissionDefinitionConverter (copy), getClanWarMissionDescription (copy), u1 (copy), Theme (copy), ColorUtil (copy)
        local v5 = ClanWarMissionDefinitionConverter.fromMissionDto(p3.mission);
        local v6;

        if v5 then
            v6 = getClanWarMissionDescription(v5);
        else
            v6 = p3.mission.metricType;
        end;

        local createElement = u1.createElement;
        local v7 = {
            BorderSizePixel = 2,
            BackgroundTransparency = 0.8,
            Size = UDim2.new(0.95, 0, 0, 40),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = Theme.backgroundPrimary,
            LayoutOrder = p3.missionIndex
        };
        local v8 = {
            u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0, 6),
                SortOrder = Enum.SortOrder.LayoutOrder
            }),
            u1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 6),
                PaddingLeft = UDim.new(0, 12),
                PaddingBottom = UDim.new(0, 6)
            }),
            MissionDescription = u1.createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                LayoutOrder = 0,
                Size = UDim2.new(1, 0, 0, 20),
                AutomaticSize = Enum.AutomaticSize.Y
            }, { u1.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    RichText = true,
                    TextSize = 20,
                    Size = UDim2.new(1, 0, 0, 20),
                    AutomaticSize = Enum.AutomaticSize.XY,
                    Text = "<b>" .. v6 .. "</b>",
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextColor3 = ColorUtil.WHITE,
                    Font = Enum.Font.Roboto
                }) }),
            MissionRequirements = u1.createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.new(1, 0, 0, 20),
                AutomaticSize = Enum.AutomaticSize.Y
            }, { u1.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    RichText = true,
                    TextSize = 14,
                    Size = UDim2.new(1, 0, 0, 20),
                    AutomaticSize = Enum.AutomaticSize.XY,
                    Text = "Requires <b>" .. tostring(p3.mission.clanMembersRequired) .. "</b> or more clan members on your team.",
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextColor3 = ColorUtil.WHITE,
                    Font = Enum.Font.Roboto
                }) })
        };
        local createElement2 = u1.createElement;
        local v9 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            Size = UDim2.new(1, 0, 0, 20),
            AutomaticSize = Enum.AutomaticSize.Y
        };
        local v10 = {};
        local createElement3 = u1.createElement;
        local v11 = {
            BackgroundTransparency = 1,
            RichText = true,
            TextSize = 14,
            Size = UDim2.new(1, 0, 0, 20),
            AutomaticSize = Enum.AutomaticSize.XY
        };
        local v12 = math.min(p3.mission.progressValue, p3.mission.completionValue);
        local v13 = math.round(v12);
        v11.Text = "<b>" .. tostring(v13) .. "</b> out of <b>" .. tostring(p3.mission.completionValue) .. "</b>";
        v11.TextXAlignment = Enum.TextXAlignment.Left;
        v11.TextColor3 = ColorUtil.WHITE;
        v11.Font = Enum.Font.Roboto;
        v10[1] = createElement3("TextLabel", v11);
        v8.MissionProgress = createElement2("Frame", v9, v10);
        v8.MissionWorth = u1.createElement("Frame", {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            LayoutOrder = 3,
            Size = UDim2.new(1, 0, 0, 20),
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            MissionWorth = u1.createElement("TextLabel", {
                BackgroundTransparency = 1,
                RichText = true,
                TextSize = 14,
                Size = UDim2.new(1, 0, 0, 20),
                AutomaticSize = Enum.AutomaticSize.XY,
                Text = "Gives <b>+" .. tostring(p3.mission.completionScoreWorth) .. "</b> points towards this Clan War!",
                TextXAlignment = Enum.TextXAlignment.Left,
                TextColor3 = ColorUtil.WHITE,
                Font = Enum.Font.Roboto
            })
        });

        return createElement("Frame", v7, v8);
    end)
};