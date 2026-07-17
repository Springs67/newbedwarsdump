-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local Button = v1.Button;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local CustomKitConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-constants").CustomKitConstants;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local CustomKitCreation_KitSelection_SlotGUI = RuntimeLib.import(script, script.Parent, "custom-kit-creation-kit-selection-slot-gui").CustomKitCreation_KitSelection_SlotGUI;

return {
    CustomKitCreation_KitSelectionGUI = v3.new(u2)(function(u4, p5) -- Line: 13
        -- upvalues: u2 (copy), CustomKitCreation_KitSelection_SlotGUI (copy), CustomKitConstants (copy), Button (copy), DeviceUtil (copy), Theme (copy), AutoCanvasScrollingFrame (copy), Empty (copy)
        local _ = p5.useState;
        local _ = p5.useEffect;

        local function u7(p6) -- Line: 16
            -- upvalues: u4 (copy)
            u4.OnKitSlotClicked(p6);
        end;

        local function _() -- Line: 19
            -- upvalues: u4 (copy)
            u4.OnAddKitSlotClicked();
        end;

        local v8 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v9 = {};
        local CustomKits = u4.CustomKits;

        local function v13(p10, u11) -- Line: 28
            -- upvalues: u4 (copy), u7 (copy), u2 (ref), CustomKitCreation_KitSelection_SlotGUI (ref)
            local v12 = {
                Index = u11,
                Kit = p10,
                LayoutOrder = u11
            };
            local CurrentKit = u4.CurrentKit;

            if CurrentKit ~= nil then
                CurrentKit = CurrentKit.id;
            end;

            v12.Selected = CurrentKit == p10.id;

            function v12.OnClicked() -- Line: 39
                -- upvalues: u7 (ref), u11 (copy)
                return u7(u11);
            end;

            function v12.OnEditClicked() -- Line: 42
                -- upvalues: u4 (ref), u11 (copy)
                return u4.OnEditKitSlotClicked(u11);
            end;

            function v12.OnDeleteClicked() -- Line: 45
                -- upvalues: u4 (ref), u11 (copy)
                return u4.OnDeleteKitSlotClicked(u11);
            end;

            return u2.createElement(CustomKitCreation_KitSelection_SlotGUI, v12);
        end;

        local v14 = table.create(#CustomKits);

        for i, v in CustomKits do
            v14[i] = v13(v, i - 1, CustomKits);
        end;

        local v15 = {
            ScrollingFrameProps = {
                Size = UDim2.fromScale(1, 1),
                ScrollingDirection = Enum.ScrollingDirection.Y
            }
        };
        local v16 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.01, 0)
            }), u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0.02, 0),
                PaddingBottom = UDim.new(0.02, 0),
                PaddingLeft = UDim.new(0.02, 0),
                PaddingRight = UDim.new(0.02, 0)
            }) };
        local v17 = #v16;

        for i, v in v14 do
            v16[v17 + i] = v;
        end;

        local v18 = #v16;
        local v19;

        if #u4.CustomKits < CustomKitConstants.MaxKits then
            v19 = u2.createElement(Button, {
                LayoutOrder = 100,
                Text = "ADD NEW KIT",
                Selectable = true,
                ZIndex = 60,
                Size = UDim2.new(0.5, 0, 0, DeviceUtil.isSmallScreen() and 35 or 45),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Theme.buttonPrimary,

                OnClick = function() -- Line: 89, Name: OnClick
                    -- upvalues: u4 (copy)
                    u4.OnAddKitSlotClicked();
                end,

                TextLabel = {
                    ZIndex = 61,
                    Size = UDim2.fromScale(0.8, 0.55),
                    TextXAlignment = Enum.TextXAlignment.Center,
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                }
            });
        else
            v19 = false;
        end;

        if v19 then
            v16[v18 + 1] = v19;
        end;

        v9[#v9 + 1] = u2.createElement(AutoCanvasScrollingFrame, v15, v16);

        return u2.createFragment({
            CustomKitCreation_KitSelectionGUI = u2.createElement(Empty, v8, v9)
        });
    end)
};