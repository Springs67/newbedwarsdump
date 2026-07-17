-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local CustomKitUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-util").CustomKitUtil;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    CustomKitCreation_StatSlot = v3.new(u2)(function(u4, p5) -- Line: 12
        -- upvalues: CustomKitUtil (copy), u2 (copy), Empty (copy), ColorUtil (copy), Theme (copy), DeviceUtil (copy), Flamework (copy)
        local _ = p5.useState;
        local _ = p5.useEffect;

        local function _() -- Line: 15
            -- upvalues: CustomKitUtil (ref), u4 (copy)
            local v6 = CustomKitUtil.getStatCost(u4.StatType, u4.StatLevel - 1);

            if v6 == nil then
                return "";
            end;

            local v7 = CustomKitUtil.getStatCost(u4.StatType, u4.StatLevel);

            return "-" .. tostring((v7 == nil and 0 or v7) - v6);
        end;

        local function v10() -- Line: 27
            -- upvalues: CustomKitUtil (ref), u4 (copy)
            if CustomKitUtil.isMaxStatLevel(u4.StatType, u4.StatLevel) then
                return "MAX";
            end;

            local v8 = CustomKitUtil.getStatCost(u4.StatType, u4.StatLevel + 1);

            if v8 == nil then
                return "";
            end;

            local v9 = CustomKitUtil.getStatCost(u4.StatType, u4.StatLevel);

            return "+" .. tostring(v8 - (v9 == nil and 0 or v9));
        end;

        local createFragment = u2.createFragment;
        local v11 = {};
        local createElement = u2.createElement;
        local v12 = {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 50),
            LayoutOrder = u4.LayoutOrder
        };
        local v13 = {};
        local v14 = u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.01, 0)
        });
        local v15 = u2.createElement(Empty, {
            LayoutOrder = 0,
            Size = UDim2.fromScale(0.64, 1)
        }, {
            u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }),
            StatName = u2.createElement("TextLabel", {
                LayoutOrder = 0,
                TextTransparency = 0,
                TextScaled = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Text = CustomKitUtil.getStatName(u4.StatType) .. " (" .. (CustomKitUtil.isMaxStatLevel(u4.StatType, u4.StatLevel) and "MAX" or "Lv. " .. tostring(u4.StatLevel)) .. ")",
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextXAlignment = Enum.TextXAlignment.Left
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 20
                }) }),
            StatDescription = u2.createElement("TextLabel", {
                LayoutOrder = 1,
                TextTransparency = 0,
                TextSize = 18,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Text = CustomKitUtil.getStatEffectDescription(u4.StatType, u4.StatLevel),
                TextColor3 = ColorUtil.WHITE,
                Font = Enum.Font.Roboto,
                TextXAlignment = Enum.TextXAlignment.Left
            })
        });
        local createElement2 = u2.createElement;
        local v16 = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(0.35, 1)
        };
        local v17 = { (u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Right,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            })) };
        local createElement3 = u2.createElement;
        local v18 = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(0.35, 1),
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0, 0.5)
        };
        local v19 = { (u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            })) };
        local createElement4 = u2.createElement;
        local v20 = {
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Theme.backgroundPrimary,

            [u2.Event.Activated] = function() -- Line: 120
                -- upvalues: CustomKitUtil (ref), u4 (copy)
                if CustomKitUtil.canDecreaseStat(u4.CustomKit, u4.StatType, u4.StatLevel) then
                    u4.OnDecreaseStatLevelClick(u4.StatType);
                end;
            end,

            BackgroundTransparency = CustomKitUtil.canDecreaseStat(u4.CustomKit, u4.StatType, u4.StatLevel) and 0 or 0.5,
            Interactable = CustomKitUtil.canDecreaseStat(u4.CustomKit, u4.StatType, u4.StatLevel),
            Visible = not CustomKitUtil.isMinStatLevel(u4.StatType, u4.StatLevel)
        };
        local v21 = { (u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            })) };
        local createElement5 = u2.createElement;
        local v22 = {
            LayoutOrder = 50,
            AutomaticSize = "X",
            TextTransparency = 0,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.8, 0.8),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local v23 = CustomKitUtil.getStatCost(u4.StatType, u4.StatLevel - 1);
        local v24;

        if v23 == nil then
            v24 = "";
        else
            local v25 = CustomKitUtil.getStatCost(u4.StatType, u4.StatLevel);
            v24 = "-" .. tostring((v25 == nil and 0 or v25) - v23);
        end;

        v22.Text = v24;
        v22.TextColor3 = ColorUtil.WHITE;
        v22.Font = Enum.Font.RobotoMono;
        local v26;

        if DeviceUtil.isSmallScreen() then
            v26 = Enum.FontSize.Size18;
        else
            v26 = Enum.FontSize.Size24;
        end;

        v22.FontSize = v26;
        v21.CustomKit_StatLeftButtonText = createElement5("TextLabel", v22);
        v19.CustomKit_StatLeftButton = createElement4("ImageButton", v20, v21);
        v17.CustomKit_StatLeftButtonWrapper = createElement3(Empty, v18, v19);
        local createElement6 = u2.createElement;
        local v27 = {
            LayoutOrder = 2,
            TextTransparency = 0,
            TextScaled = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.3, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local v28 = CustomKitUtil.getStatCost(u4.StatType, u4.StatLevel);
        v27.Text = tostring(v28);
        v27.TextColor3 = ColorUtil.WHITE;
        v27.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold);
        v27.TextXAlignment = Enum.TextXAlignment.Center;
        v17.CustomKit_StatPointsAllocated = createElement6("TextLabel", v27, { u2.createElement("UITextSizeConstraint", {
                MaxTextSize = DeviceUtil.isSmallScreen() and 18 or 24
            }) });
        local createElement7 = u2.createElement;
        local v29 = {
            LayoutOrder = 3,
            Size = UDim2.fromScale(0.35, 1),
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0, 0.5)
        };
        local v30 = { (u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            })) };
        local createElement8 = u2.createElement;
        local v31 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v32;

        if CustomKitUtil.isMaxStatLevel(u4.StatType, u4.StatLevel) or CustomKitUtil.canIncreaseStat(u4.CustomKit, u4.StatType, u4.StatLevel) then
            if CustomKitUtil.isMaxStatLevel(u4.StatType, u4.StatLevel) then
                v32 = Color3.fromRGB(79, 79, 79);
            else
                v32 = Theme.backgroundSuccess;
            end;
        else
            v32 = Theme.backgroundError;
        end;

        v31.BackgroundColor3 = v32;

        v31[u2.Event.Activated] = function() -- Line: 178
            -- upvalues: CustomKitUtil (ref), u4 (copy), Flamework (ref)
            if CustomKitUtil.canIncreaseStat(u4.CustomKit, u4.StatType, u4.StatLevel) then
                u4.OnIncreaseStatLevelClick(u4.StatType);

                return;
            end;

            Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                message = "You don\'t have enough points to increase this stat."
            });
        end;

        v31.Interactable = CustomKitUtil.canIncreaseStat(u4.CustomKit, u4.StatType, u4.StatLevel);
        v31.Visible = not CustomKitUtil.isMaxStatLevel(u4.StatType, u4.StatLevel);
        local v33 = { (u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            })) };
        local createElement9 = u2.createElement;
        local v34 = {
            LayoutOrder = 50,
            AutomaticSize = "X",
            TextTransparency = 0,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.8, 0.8),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Text = v10(),
            TextColor3 = ColorUtil.WHITE,
            Font = Enum.Font.RobotoMono
        };
        local v35;

        if DeviceUtil.isSmallScreen() then
            v35 = Enum.FontSize.Size18;
        else
            v35 = Enum.FontSize.Size24;
        end;

        v34.FontSize = v35;
        v33.CustomKit_StatRightButtonText = createElement9("TextLabel", v34);
        v30.CustomKit_StatRightButton = createElement8("ImageButton", v31, v33);
        v17.CustomKit_StatRightButtonWrapper = createElement7(Empty, v29, v30);
        v13[1], v13[2], v13[3] = v14, v15, createElement2(Empty, v16, v17);
        v11.CustomKitCreation_StatSlot = createElement("Frame", v12, v13);

        return createFragment(v11);
    end)
};