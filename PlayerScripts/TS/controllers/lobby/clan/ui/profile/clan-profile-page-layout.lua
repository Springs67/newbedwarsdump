-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    ClanProfilePageLayout = v2.new(u1)(function(p3, p4) -- Line: 7
        -- upvalues: u1 (copy), Theme (copy), Empty (copy)
        local _ = p4.useState;
        local v5 = p3.Title ~= nil and true or p3.RightTitleElement ~= nil;

        if v5 then
            local v6 = { u1.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0, 10)
                }) };
            local v7 = {
                Size = UDim2.new(1, 0, 0, 20)
            };
            local v8 = {};
            local v9 = #v8;
            local v10;

            if p3.Title == nil then
                v10 = false;
            else
                v10 = u1.createElement("TextLabel", {
                    AutomaticSize = "Y",
                    SizeConstraint = "RelativeXX",
                    TextScaled = true,
                    RichText = true,
                    Font = "Roboto",
                    TextXAlignment = "Left",
                    TextYAlignment = "Center",
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 0),
                    Text = "<b>" .. p3.Title .. "</b>",
                    TextColor3 = Theme.textPrimary
                }, { u1.createElement("UITextSizeConstraint", {
                        MaxTextSize = 20
                    }) });
            end;

            if v10 then
                v8[v9 + 1] = v10;
            end;

            local v11 = #v8;
            local v12 = p3.RightTitleElement and u1.createElement(Empty, {
                Size = UDim2.new(0.5, 0, 0, 20),
                Position = UDim2.fromScale(1, 0.5),
                AnchorPoint = Vector2.new(1, 0.5)
            }, { p3.RightTitleElement });

            if v12 then
                v8[v11 + 1] = v12;
            end;

            v6[#v6 + 1] = u1.createElement(Empty, v7, v8);
            v5 = u1.createFragment(v6);
        end;

        local v13 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v14 = {};
        local v15 = #v14;

        if v5 then
            v14[v15 + 1] = v5;
        end;

        local v16 = {};
        local v17;

        if p3.Title == nil and p3.RightTitleElement == nil then
            v17 = UDim2.fromScale(1, 1);
        else
            v17 = UDim2.new(1, 0, 1, -36);
        end;

        v16.Size = v17;
        local v18 = {};
        local v19 = #v18;
        local v20 = p3.PaddingBottom and u1.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 15)
        });

        if v20 then
            v18[v19 + 1] = v20;
        end;

        local v21 = #v18;
        local v22 = p3[u1.Children];

        if v22 then
            for i, v in v22 do
                if type(i) == "number" then
                    v18[v21 + i] = v;
                else
                    v18[i] = v;
                end;
            end;
        end;

        v14[#v14 + 1] = u1.createElement(Empty, v16, v18);

        return u1.createElement(Empty, v13, v14);
    end)
};