-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local MissionCard = RuntimeLib.import(script, script.Parent, "mission-card").MissionCard;
local MissionsListTimer = RuntimeLib.import(script, script.Parent, "missions-list-timer").MissionsListTimer;

return {
    MissionsList = v2.new(u1)(function(u3, p4) -- Line: 8
        -- upvalues: u1 (copy), ColorUtil (copy), MissionsListTimer (copy), MissionCard (copy)
        local v5 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            LayoutOrder = u3.LayoutOrder
        };
        local v6 = { u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                Padding = UDim.new(0, 12)
            }) };
        local v7 = #v6;
        local v8 = {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 18)
        };
        local v9 = {};
        local v10 = #v9;
        local v11;

        if u3.Title == nil then
            v11 = false;
        else
            v11 = u1.createElement("TextLabel", {
                BackgroundTransparency = 1,
                RichText = true,
                TextSize = 24,
                AnchorPoint = Vector2.new(0, 1),
                Position = UDim2.fromScale(0, 1),
                Size = UDim2.fromScale(0, 1),
                AutomaticSize = Enum.AutomaticSize.X,
                Text = "<b>" .. u3.Title .. "</b>",
                TextXAlignment = Enum.TextXAlignment.Left,
                TextColor3 = ColorUtil.WHITE,
                Font = Enum.Font.Roboto
            });
        end;

        if v11 then
            v9[v10 + 1] = v11;
        end;

        v9[#v9 + 1] = u1.createElement(MissionsListTimer, {
            EndTime = u3.EndTime,
            AnchorPoint = Vector2.new(1, 1),
            Position = UDim2.fromScale(1, 1)
        });
        v6[v7 + 1] = u1.createElement("Frame", v8, v9);

        local function _(p12) -- Line: 54
            -- upvalues: u3 (copy), u1 (ref), MissionCard (ref)
            local playerLevelReq = p12.playerLevelReq;

            if u3.PlayerLevel < (playerLevelReq == nil and 0 or playerLevelReq) then
                return nil;
            end;

            return u1.createElement(MissionCard, {
                AppId = "Mission",
                Mission = p12,
                TicketView = u3.TicketView
            });
        end;

        local v13 = 0;
        local v14 = {};

        for i, v in u3.Missions do
            local _ = i - 1;
            local playerLevelReq = v.playerLevelReq;
            local v15;

            if u3.PlayerLevel < (playerLevelReq == nil and 0 or playerLevelReq) then
                v15 = nil;
            else
                v15 = u1.createElement(MissionCard, {
                    AppId = "Mission",
                    Mission = v,
                    TicketView = u3.TicketView
                });
            end;

            if v15 ~= nil then
                v13 = v13 + 1;
                v14[v13] = v15;
            end;
        end;

        local v16 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0),
            AutomaticSize = Enum.AutomaticSize.Y
        };
        local v17 = { u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                Padding = UDim.new(0, 8)
            }) };
        local v18 = #v17;

        for i, v in v14 do
            v17[v18 + i] = v;
        end;

        v6[v7 + 2] = u1.createElement("Frame", v16, v17);

        return u1.createFragment({
            PassMissionLists = u1.createElement("Frame", v5, v6)
        });
    end)
};