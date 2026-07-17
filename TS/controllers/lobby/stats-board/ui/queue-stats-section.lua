-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DropdownComponent = v1.DropdownComponent;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local GameMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-meta").GameMeta;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta");
local getQueueMeta = v5.getQueueMeta;
local QueueMeta = v5.QueueMeta;
local QueueStatsDisplay = RuntimeLib.import(script, script.Parent, "queue-stats").QueueStatsDisplay;
local SectionTitle = RuntimeLib.import(script, script.Parent, "section-title").SectionTitle;
local u6 = {};
local v7 = u2.values(GameType);

local function v15(u8) -- Line: 19
    -- upvalues: u2 (copy), QueueMeta (copy), u6 (copy)
    local u9 = {};

    local function _(p10) -- Line: 22
        -- upvalues: u8 (copy), u9 (copy)
        local v11 = p10[1];
        local v12 = p10[2];

        if v12.disableMatchStatsProgression then
            return nil;
        end;

        if u8 == v12.game then
            table.insert(u9, v11);
        end;
    end;

    for i, v in u2.entries(QueueMeta) do
        local _ = i - 1;
        local v13 = v[1];
        local v14 = v[2];

        if not v14.disableMatchStatsProgression then
            if u8 == v14.game then
                table.insert(u9, v13);
            end;
        end;
    end;

    u6[u8] = u9;
end;

for i, v in v7 do
    v15(v, i - 1, v7);
end;

return {
    QueueStatsSection = v4.new(u3)(function(u16, p17) -- Line: 41
        -- upvalues: GameType (copy), u3 (copy), SectionTitle (copy), ColorUtil (copy), GameMeta (copy), u2 (copy), u6 (copy), DropdownComponent (copy), Empty (copy), getQueueMeta (copy), QueueStatsDisplay (copy)
        local u18, u19 = p17.useState(GameType.BEDWARS);
        local v20 = {
            Size = UDim2.fromScale(1, 0),
            AutomaticSize = Enum.AutomaticSize.Y
        };
        local v21 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 20)
            }), u3.createElement(SectionTitle, {
                title = "Queue Stats",
                SectionDivider = true
            }) };
        local v22 = #v21;
        local v23 = {
            ZIndex = 10,
            Size = UDim2.new(1, 0, 0, 30)
        };
        local v24 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 0)
            }), u3.createElement("TextLabel", {
                Text = "Choose Game Type",
                TextSize = 16,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(0.5, 1),
                TextColor3 = ColorUtil.WHITE,
                TextXAlignment = Enum.TextXAlignment.Left,
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
            }) };
        local v25 = {
            OnSurfaceGui = true,
            Size = UDim2.new(0.5, 0, 1, 0),
            DefaultItem = {
                text = GameMeta[u18].title,
                value = u18
            }
        };

        local function _(p26) -- Line: 95
            -- upvalues: u6 (ref)
            local v27 = u6[p26];

            if v27 ~= nil then
                v27 = #v27 == 0;
            end;

            return not v27;
        end;

        local v28 = 0;
        local v29 = {};

        for i, v in u2.keys(u6) do
            local _ = i - 1;
            local v30 = u6[v];

            if v30 ~= nil then
                v30 = #v30 == 0;
            end;

            if not v30 == true then
                v28 = v28 + 1;
                v29[v28] = v;
            end;
        end;

        table.sort(v29);

        local function v37(p31, p32) -- Line: 114
            -- upvalues: GameMeta (ref)
            local v33 = {
                text = GameMeta[p32].title,
                value = p32
            };
            local v34 = {};
            local v35 = #v34;
            local v36 = #p31;
            table.move(p31, 1, v36, v35 + 1, v34);
            v34[v35 + v36 + 1] = v33;

            return v34;
        end;

        local v38 = {};

        for i = 1, #v29 do
            v38 = v37(v38, v29[i], i - 1, v29);
        end;

        v25.Items = v38;

        function v25.OnItemSelected(p39) -- Line: 135
            -- upvalues: u19 (copy)
            u19(p39);
        end;

        v24[#v24 + 1] = u3.createElement(DropdownComponent, v25);
        v21[v22 + 1] = u3.createElement(Empty, v23, v24);
        local v40 = u6[u18];

        if v40 ~= nil then
            local function _(p41) -- Line: 142
                -- upvalues: getQueueMeta (ref), u18 (copy)
                return getQueueMeta(p41).game == u18;
            end;

            local v42 = 0;
            local v43 = {};

            for i, v in v40 do
                local _ = i - 1;

                if getQueueMeta(v).game == u18 == true then
                    v42 = v42 + 1;
                    v43[v42] = v;
                end;
            end;

            table.sort(v43, function(p44, p45) -- Line: 155
                -- upvalues: getQueueMeta (ref)
                return getQueueMeta(p44).title < getQueueMeta(p45).title;
            end);

            local function _(p46) -- Line: 159
                -- upvalues: getQueueMeta (ref), u3 (ref), QueueStatsDisplay (ref), u16 (copy)
                if getQueueMeta(p46).disableMatchStatsProgression then
                    return nil;
                end;

                return u3.createElement(QueueStatsDisplay, {
                    store = u16.store,
                    QueueType = p46,
                    Queues = u16.Queues
                });
            end;

            local v47 = 0;
            v40 = {};

            for i, v in v43 do
                local _ = i - 1;
                local v48;

                if getQueueMeta(v).disableMatchStatsProgression then
                    v48 = nil;
                else
                    v48 = u3.createElement(QueueStatsDisplay, {
                        store = u16.store,
                        QueueType = v,
                        Queues = u16.Queues
                    });
                end;

                if v48 ~= nil then
                    v47 = v47 + 1;
                    v40[v47] = v48;
                end;
            end;
        end;

        if v40 then
            for i, v in v40 do
                v21[v22 + 1 + i] = v;
            end;
        end;

        return u3.createElement(Empty, v20, v21);
    end)
};