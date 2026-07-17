-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v4 = RuntimeLib.import(script, script.Parent, "audit-log-visualizer");
local getAuditActionDisplay = v4.getAuditActionDisplay;
local getUserDisplayName = v4.getUserDisplayName;
local renderAuditLogDescription = v4.renderAuditLogDescription;

return {
    ClanAuditLogRow = v3.new(u2)(function(p5, p6) -- Line: 13
        -- upvalues: getUserDisplayName (copy), getAuditActionDisplay (copy), renderAuditLogDescription (copy), Theme (copy), u2 (copy), ColorUtil (copy), Empty (copy)
        local _ = p6.useState;
        local v7 = {};

        for i, v in p5.ColumnData[1] do
            v7[i] = v;
        end;

        v7.rowText = getUserDisplayName(p5.store, p5.AuditLog.performedByUserId);
        local v8 = {};

        for i, v in p5.ColumnData[2] do
            v8[i] = v;
        end;

        v8.rowText = getAuditActionDisplay(p5.AuditLog.actionId);
        local v9 = {};

        for i, v in p5.ColumnData[3] do
            v9[i] = v;
        end;

        local v10 = DateTime.fromIsoDate(p5.AuditLog.timestamp);

        if v10 ~= nil then
            v10 = v10:FormatLocalTime("lll", "en-us");
        end;

        if v10 == nil then
            v10 = p5.AuditLog.timestamp;
        end;

        v9.rowText = v10;
        local v11 = {};

        for i, v in p5.ColumnData[4] do
            v11[i] = v;
        end;

        v11.rowText = renderAuditLogDescription(p5.store, p5.AuditLog);
        local v12 = {
            v7,
            v8,
            v9,
            v11
        };
        local u13 = (#v12 - 1) * 0.05 / #v12;
        local v14 = {
            BorderSizePixel = 0,
            Size = UDim2.new(0.95, 0, 0, 60),
            BackgroundColor3 = Theme.backgroundPrimary,
            LayoutOrder = p5.Index
        };
        local v15 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }) };
        local _ = #v15;
        local v16 = {
            BackgroundTransparency = 1,
            Text = "",
            TextTransparency = 1,
            AnchorPoint = Vector2.new(0, 0),
            Size = UDim2.fromScale(1, 1)
        };
        local v17 = { u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0.15, 0),
                PaddingBottom = UDim.new(0.15, 0),
                PaddingLeft = UDim.new(0.03, 0),
                PaddingRight = UDim.new(0.03, 0)
            }), u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 12)
            }) };

        local function v19(p18) -- Line: 81
            -- upvalues: u2 (ref), u13 (copy), ColorUtil (ref)
            return u2.createElement("TextLabel", {
                TextScaled = true,
                RichText = true,
                Font = "Roboto",
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                TextTransparency = 0.3,
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                Size = UDim2.new(p18.width - u13, 0, 1, 0),
                Text = p18.rowText,
                TextColor3 = ColorUtil.WHITE
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 18
                }) });
        end;

        local v20 = table.create(#v12);

        for i, v in v12 do
            v20[i] = v19(v, i - 1, v12);
        end;

        local v21 = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 1)
        };
        local v22 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }) };
        local v23 = #v22;

        for i, v in v20 do
            v22[v23 + i] = v;
        end;

        v17[#v17 + 1] = u2.createElement(Empty, v21, v22);
        v15["ToggleAuditLog_" .. tostring(p5.Index)] = u2.createElement("TextButton", v16, v17);

        return u2.createElement("Frame", v14, v15);
    end)
};