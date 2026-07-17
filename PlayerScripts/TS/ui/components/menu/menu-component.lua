-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local Empty = v1.Empty;
local Padding = v1.Padding;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local MenuItem = RuntimeLib.import(script, script.Parent, "menu-item").MenuItem;

return {
    MenuComponent = v3.new(u2)(function(u4, p5) -- Line: 11
        -- upvalues: u2 (copy), MenuItem (copy), Theme (copy), Padding (copy), ButtonComponent (copy), Empty (copy)
        local _ = p5.useEffect;
        local u6, u7 = p5.useState(false);
        local v8 = {};

        for i, v in u4 do
            v8[i] = v;
        end;

        v8.ButtonText = nil;
        v8.Items = nil;
        v8.OnMenuClick = nil;
        local v9 = {};

        local function u10() -- Line: 30
            -- upvalues: u7 (copy)
            u7(false);
        end;

        local function v11() -- Line: 23
            -- upvalues: u7 (copy), u6 (copy), u4 (copy)
            u7(not u6);
            local OnMenuClick = u4.OnMenuClick;

            if OnMenuClick ~= nil then
                OnMenuClick();
            end;
        end;

        for i, v in v8 do
            v9[i] = v;
        end;

        if u6 then
            local Items = u4.Items;

            local function _(p12, p13) -- Line: 40
                -- upvalues: u2 (ref), MenuItem (ref), u10 (copy)
                return u2.createElement(MenuItem, {
                    id = p13,
                    item = p12,
                    closeMenu = u10
                });
            end;

            local v14 = table.create(#Items);

            for i, v in Items do
                v14[i] = u2.createElement(MenuItem, {
                    id = i - 1,
                    item = v,
                    closeMenu = u10
                });
            end;

            local v15 = {
                BorderSizePixel = 0,
                ZIndex = 100,
                Size = UDim2.new(2, 0, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                Position = UDim2.fromScale(0, 1.1),
                AnchorPoint = Vector2.new(0.5, 0),
                BackgroundColor3 = Theme.backgroundTertiary
            };
            local v16 = { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 3)
                }), u2.createElement(
                    "UIListLayout",
                    {
                        FillDirection = "Vertical",
                        HorizontalAlignment = "Center",
                        VerticalAlignment = "Center"
                    }
                ), u2.createElement(Padding, {
                    Padding = {
                        Horizontal = 5,
                        Vertical = 5
                    }
                }) };
            local v17 = #v16;

            for i, v in v14 do
                v16[v17 + i] = v;
            end;

            u6 = u2.createFragment({
                Menu = u2.createElement("Frame", v15, v16)
            });
        end;

        local v18 = { u2.createElement(ButtonComponent, {
                Text = u4.ButtonText,
                Size = UDim2.new(1, 0, 1, 0),
                OnClick = v11
            }) };
        local v19 = #v18;

        if u6 then
            v18[v19 + 1] = u6;
        end;

        return u2.createElement(Empty, v9, v18);
    end)
};