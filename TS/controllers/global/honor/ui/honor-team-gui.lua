-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local HonorPlayerCardGUI = RuntimeLib.import(script, script.Parent, "honor-player-card-gui").HonorPlayerCardGUI;
local HonorTeamHeaderGUI = RuntimeLib.import(script, script.Parent, "honor-team-header-gui").HonorTeamHeaderGUI;

return {
    HonorTeamGUI = v3.new(u2)(function(u4, p5) -- Line: 11
        -- upvalues: u2 (copy), HonorTeamHeaderGUI (copy), DeviceUtil (copy), Players (copy), HonorPlayerCardGUI (copy), Empty (copy)
        local _ = p5.useState;
        local v6 = {
            AutomaticSize = "Y",
            BorderSizePixel = 4,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0),
            LayoutOrder = u4.LayoutOrder
        };
        local v7 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 8)
            }), u2.createElement(HonorTeamHeaderGUI, {
                Team = u4.Team
            }) };
        local _ = #v7;
        local v8 = {};
        local Players2 = u4.Players;
        table.move(Players2, 1, #Players2, #v8 + 1, v8);

        local function v12(p9, p10) -- Line: 37
            -- upvalues: DeviceUtil (ref), Players (ref), u4 (copy), u2 (ref), HonorPlayerCardGUI (ref)
            if not DeviceUtil.isHoarceKat() and Players.LocalPlayer.UserId == p9.userId then
                return nil;
            end;

            local v11 = table.find(u4.HonoredPlayers, p9.userId) ~= nil;

            return u2.createElement(HonorPlayerCardGUI, {
                DisableAnimation = true,
                Player = p9,
                Index = p10,
                IsHonored = v11,
                Disabled = u4.Disabled
            });
        end;

        local v13 = 0;
        local v14 = {};

        for i, v in v8 do
            local v15 = v12(v, i - 1, v8);

            if v15 ~= nil then
                v13 = v13 + 1;
                v14[v13] = v15;
            end;
        end;

        local v16 = {
            AutomaticSize = "Y",
            Size = UDim2.fromScale(1, 0)
        };
        local v17 = { u2.createElement("UIGridLayout", {
                FillDirectionMaxCells = 10,
                CellPadding = UDim2.new(0, 8, 0, 8),
                CellSize = UDim2.new(0, 90, 0, 120),
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }) };
        local v18 = #v17;

        for i, v in v14 do
            v17[v18 + i] = v;
        end;

        v7["HonorPlayerListGUI_" .. u4.Team.id] = u2.createElement(Empty, v16, v17);

        return u2.createFragment({
            ["HonorTeamGUI_" .. u4.Team.id] = u2.createElement("Frame", v6, v7)
        });
    end)
};