-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    CustomKitGame_KitSelectionGUI = v4.new(u3)(function(u5, p6) -- Line: 12
        -- upvalues: u2 (copy), ColorUtil (copy), u3 (copy), Empty (copy), Button (copy), Theme (copy), AutoCanvasScrollingFrame (copy)
        local _ = p6.useState;
        local useEffect = p6.useEffect;
        local u7 = u2.new();
        useEffect(function() -- Line: 16
            -- upvalues: u7 (copy)
            return function() -- Line: 17
                -- upvalues: u7 (ref)
                u7:DoCleaning();
            end;
        end, {});
        local v8 = {};
        local _ = #v8;
        local v9 = {
            BackgroundTransparency = 0.2,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0, 0.5),
            Size = UDim2.fromScale(0.3, 0.8),
            Position = UDim2.new(0, 10, 0.5, 0),
            BackgroundColor3 = ColorUtil.BLACK
        };
        local v10 = {
            u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }),
            CustomKitSelection_Header = u3.createElement(Empty, {
                BackgroundTransparency = 1,
                LayoutOrder = 0,
                Size = UDim2.fromScale(0.9, 0.08),
                Position = UDim2.fromScale(0.5, 0),
                AnchorPoint = Vector2.new(0.5, 0)
            }, { u3.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    Text = "Select a Custom Kit",
                    TextScaled = true,
                    Size = UDim2.fromScale(1, 1),
                    TextColor3 = ColorUtil.WHITE,
                    Font = Enum.Font.GothamBold
                }) })
        };
        local _ = #v10;
        local v11 = {
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.92),
            Position = UDim2.fromScale(0, 0.08),
            AnchorPoint = Vector2.new(0, 0)
        };
        local v12 = {};
        local CustomKits = u5.CustomKits;

        local function v15(u13, p14) -- Line: 67
            -- upvalues: u3 (ref), Button (ref), Theme (ref), u5 (copy)
            return u3.createElement(Button, {
                LayoutOrder = 100,
                Selectable = true,
                ZIndex = 60,
                Size = UDim2.fromScale(0.9, 0.1),
                BackgroundColor3 = Theme.buttonPrimary,
                Text = u13.name,

                OnClick = function() -- Line: 74, Name: OnClick
                    -- upvalues: u5 (ref), u13 (copy)
                    u5.OnKitClicked(u13);
                end,

                TextLabel = {
                    ZIndex = 61,
                    Size = UDim2.fromScale(0.9, 0.8),
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                }
            });
        end;

        local v16 = table.create(#CustomKits);
        local v17 = {
            DisplayOrder = 22,
            ResetOnSpawn = false
        };

        for i, v in CustomKits do
            v16[i] = v15(v, i - 1, CustomKits);
        end;

        local v18 = {
            ScrollingFrameProps = {
                Size = UDim2.fromScale(1, 1),
                ScrollingDirection = Enum.ScrollingDirection.Y
            }
        };
        local v19 = { u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                Padding = UDim.new(0.02, 0)
            }), u3.createElement("UIPadding", {
                PaddingTop = UDim.new(0.02, 0),
                PaddingBottom = UDim.new(0.02, 0),
                PaddingLeft = UDim.new(0.02, 0),
                PaddingRight = UDim.new(0.02, 0)
            }) };
        local v20 = #v19;

        for i, v in v16 do
            v19[v20 + i] = v;
        end;

        v12[#v12 + 1] = u3.createElement(AutoCanvasScrollingFrame, v18, v19);
        v10.CustomKitSelection_Content = u3.createElement(Empty, v11, v12);
        v8.CustomKitCreation_Main_Frame = u3.createElement("Frame", v9, v10);

        return u3.createFragment({
            CustomKitCreation_MainGui = u3.createElement("ScreenGui", v17, v8)
        });
    end)
};