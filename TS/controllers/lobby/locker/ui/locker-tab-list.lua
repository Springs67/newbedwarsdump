-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-tab");
local LockerTab = v4.LockerTab;
local LockerTabOrder = v4.LockerTabOrder;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    LockerTabList = v3.new(u2)(function(u5, p6) -- Line: 11
        -- upvalues: u1 (copy), LockerTab (copy), Theme (copy), LockerTabOrder (copy), u2 (copy), DeviceUtil (copy)
        local u7 = u5.ExcludedTabs or {};

        local function _(p8) -- Line: 14
            -- upvalues: u7 (copy)
            return table.find(u7, p8[2]) == nil;
        end;

        local v9 = 0;
        local v10 = {};

        for i, v in u1.entries(LockerTab) do
            local _ = i - 1;

            if table.find(u7, v[2]) == nil == true then
                v9 = v9 + 1;
                v10[v9] = v;
            end;
        end;

        local v11 = {
            BorderSizePixel = 0,
            ScrollBarThickness = 6,
            Size = u5.Size or UDim2.fromScale(1, 0.1),
            BackgroundColor3 = Theme.backgroundTertiary,
            ScrollingDirection = Enum.ScrollingDirection.X,
            AutomaticCanvasSize = Enum.AutomaticSize.XY
        };
        local LayoutOrder = u5.LayoutOrder;
        v11.LayoutOrder = LayoutOrder == nil and 0 or LayoutOrder;

        local function v23(p12, p13) -- Line: 45
            -- upvalues: u5 (copy), LockerTab (ref), LockerTabOrder (ref), u2 (ref), DeviceUtil (ref)
            local u14 = p12[1];
            local v15 = p12[2];
            local u16 = u5.Tab == LockerTab[u14];
            local v19 = {
                Size = UDim2.fromScale(0, 1),
                AutomaticSize = "X",
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                BackgroundTransparency = u16 and 0.7 or 1,
                BorderSizePixel = 0,
                LayoutOrder = LockerTabOrder[v15],

                [u2.Event.Activated] = function() -- Line: 56
                    -- upvalues: u5 (ref), LockerTab (ref), u14 (copy)
                    u5.ChangeTab(LockerTab[u14]);
                end,

                [u2.Event.MouseEnter] = function(p17) -- Line: 59
                    p17.BackgroundTransparency = 0.7;
                end,

                [u2.Event.MouseLeave] = function(p18) -- Line: 62
                    -- upvalues: u16 (copy)
                    p18.BackgroundTransparency = u16 and 0.7 or 1;
                end
            };
            local v20 = { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 6)
                }), u2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 10),
                    PaddingRight = UDim.new(0, 10)
                }) };
            local v21 = #v20;
            local v22 = not DeviceUtil.isSmallScreen() and u2.createElement("UIListLayout", {
                VerticalAlignment = "Center"
            });

            if v22 then
                v20[v21 + 1] = v22;
            end;

            v20[#v20 + 1] = u2.createElement("TextLabel", {
                AutomaticSize = "X",
                TextScaled = false,
                BackgroundTransparency = 1,
                TextWrap = false,
                Size = UDim2.fromScale(0, DeviceUtil.isSmallScreen() and 1 or 0.8),
                Text = string.upper(v15),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 22,
                    MinTextSize = 12
                }) });

            return u2.createElement("ImageButton", v19, v20);
        end;

        local v24 = table.create(#v10);

        for i, v in v10 do
            v24[i] = v23(v, i - 1, v10);
        end;

        local v25 = { u2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 12),
                PaddingRight = UDim.new(0, 8),
                PaddingTop = UDim.new(0, 6),
                PaddingBottom = UDim.new(0, 6)
            }), u2.createElement("UIListLayout", {
                SortOrder = "LayoutOrder",
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                Padding = u5.Padding or UDim.new(0, DeviceUtil.isSmallScreen() and 20 or 10)
            }) };
        local v26 = #v25;

        for i, v in v24 do
            v25[v26 + i] = v;
        end;

        return u2.createFragment({
            Tabs = u2.createElement("ScrollingFrame", v11, v25)
        });
    end)
};