-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local CustomKitUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-util").CustomKitUtil;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    CustomKitCreation_AbilityPropertyLevelGUI = v4.new(u3)(function(u5, p6) -- Line: 13
        -- upvalues: CustomKitUtil (copy), u2 (copy), Flamework (copy), u3 (copy), Empty (copy), ColorUtil (copy), Theme (copy), DeviceUtil (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local u7, u8 = useState(u5.CommonProps.Ability);
        local _, u9 = useState(u5.CommonProps.Kit);
        local v10 = CustomKitUtil.getAbilityPropertyLevel(u7, u5.CustomAbilityProperty);
        local u11, u12 = useState(v10 == nil and 1 or v10);
        local _, u13 = useState(CustomKitUtil.getNameForAbilityProperty(u5.CustomAbilityProperty));

        local function _() -- Line: 24
            -- upvalues: CustomKitUtil (ref), u5 (copy)
            return CustomKitUtil.isMaxAbilityPropertyLevel(u5.CommonProps.Ability, u5.CustomAbilityProperty);
        end;

        local function _() -- Line: 27
            -- upvalues: CustomKitUtil (ref), u5 (copy)
            return CustomKitUtil.isMinAbilityPropertyLevel(u5.CommonProps.Ability, u5.CustomAbilityProperty);
        end;

        local function _() -- Line: 30
            -- upvalues: CustomKitUtil (ref), u5 (copy)
            return CustomKitUtil.canIncreaseAbilityProperty(u5.CommonProps.Kit, u5.CommonProps.Ability, u5.CustomAbilityProperty);
        end;

        local function _() -- Line: 33
            -- upvalues: CustomKitUtil (ref), u5 (copy)
            return CustomKitUtil.canDecreaseAbilityProperty(u5.CommonProps.Kit, u5.CommonProps.Ability, u5.CustomAbilityProperty);
        end;

        local u14 = u2.new();
        useEffect(function() -- Line: 37
            -- upvalues: u14 (copy)
            return function() -- Line: 38
                -- upvalues: u14 (ref)
                u14:DoCleaning();
            end;
        end, {});

        local function _() -- Line: 42
            -- upvalues: CustomKitUtil (ref), u7 (copy), u5 (copy), u11 (copy)
            local v15 = CustomKitUtil.getAbilityPropertyCost(u7, u5.CustomAbilityProperty, u11 - 1);

            if v15 == nil then
                return "";
            end;

            local v16 = CustomKitUtil.getAbilityPropertyCost(u7, u5.CustomAbilityProperty, u11);

            return v16 == nil and "" or "-" .. tostring(v16 - v15);
        end;

        local function _() -- Line: 53
            -- upvalues: CustomKitUtil (ref), u7 (copy), u5 (copy), u11 (copy)
            local v17 = CustomKitUtil.getAbilityPropertyCost(u7, u5.CustomAbilityProperty, u11 + 1);

            if v17 == nil then
                return "MAX";
            end;

            local v18 = CustomKitUtil.getAbilityPropertyCost(u7, u5.CustomAbilityProperty, u11);

            return "+" .. tostring(v17 - (v18 == nil and 0 or v18));
        end;

        local u19 = nil;

        local function _() -- Line: 66
            -- upvalues: u11 (copy), CustomKitUtil (ref), u7 (copy), u5 (copy), u19 (ref)
            if u11 <= 1 then
                return nil;
            end;

            CustomKitUtil.setAbilityPropertyLevel(u7, u5.CustomAbilityProperty, u11 - 1);
            u19();
        end;

        local function u20() -- Line: 73
            -- upvalues: CustomKitUtil (ref), u5 (copy), u7 (copy), Flamework (ref), u11 (copy), u19 (ref)
            if not CustomKitUtil.canIncreaseAbilityProperty(u5.CommonProps.Kit, u7, u5.CustomAbilityProperty) then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    message = "You don\'t have enough points to increase this ability property."
                });

                return nil;
            end;

            CustomKitUtil.setAbilityPropertyLevel(u7, u5.CustomAbilityProperty, u11 + 1);
            u19();
        end;

        u19 = function() -- Line: 83
            -- upvalues: u8 (copy), u5 (copy), u9 (copy), CustomKitUtil (ref), u7 (copy), u12 (copy), u13 (copy)
            u8(u5.CommonProps.Ability);
            u9(u5.CommonProps.Kit);
            local v21 = CustomKitUtil.getAbilityPropertyLevel(u7, u5.CustomAbilityProperty);
            u12(v21 == nil and 1 or v21);
            u13(CustomKitUtil.getNameForAbilityProperty(u5.CustomAbilityProperty));
            u5.CommonProps.RefreshFunction();
        end;

        local createFragment = u3.createFragment;
        local v22 = {};
        local createElement = u3.createElement;
        local v23 = {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 50),
            LayoutOrder = u5.LayoutOrder
        };
        local v24 = {};
        local v25 = u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.01, 0)
        });
        local v26 = u3.createElement(Empty, {
            LayoutOrder = 0,
            Size = UDim2.fromScale(0.64, 1)
        }, {
            u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }),
            StatName = u3.createElement("TextLabel", {
                LayoutOrder = 0,
                TextTransparency = 0,
                TextScaled = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Text = CustomKitUtil.getNameForAbilityProperty(u5.CustomAbilityProperty) .. " (" .. (CustomKitUtil.isMaxAbilityPropertyLevel(u5.CommonProps.Ability, u5.CustomAbilityProperty) and "MAX" or "Lv. " .. tostring(u11)) .. ")",
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextXAlignment = Enum.TextXAlignment.Left
            }, { u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = 20
                }) }),
            StatDescription = u3.createElement("TextLabel", {
                LayoutOrder = 1,
                TextTransparency = 0,
                TextSize = 18,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Text = CustomKitUtil.getAbilityPropertyEffectDescription(u5.CommonProps.Ability, u5.CustomAbilityProperty),
                TextColor3 = ColorUtil.WHITE,
                Font = Enum.Font.Roboto,
                TextXAlignment = Enum.TextXAlignment.Left
            })
        });
        local createElement2 = u3.createElement;
        local v27 = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(0.35, 1)
        };
        local v28 = { (u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Right,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            })) };
        local createElement3 = u3.createElement;
        local v29 = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(0.35, 1),
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0, 0.5)
        };
        local v30 = { (u3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            })) };
        local createElement4 = u3.createElement;
        local v31 = {
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Theme.backgroundPrimary,

            [u3.Event.Activated] = function() -- Line: 172
                -- upvalues: CustomKitUtil (ref), u5 (copy), u11 (copy), u7 (copy), u19 (ref)
                if CustomKitUtil.canDecreaseAbilityProperty(u5.CommonProps.Kit, u5.CommonProps.Ability, u5.CustomAbilityProperty) then
                    if u11 <= 1 then
                        return;
                    end;

                    CustomKitUtil.setAbilityPropertyLevel(u7, u5.CustomAbilityProperty, u11 - 1);
                    u19();
                end;
            end,

            BackgroundTransparency = CustomKitUtil.canDecreaseAbilityProperty(u5.CommonProps.Kit, u5.CommonProps.Ability, u5.CustomAbilityProperty) and 0 or 0.5,
            Interactable = CustomKitUtil.canDecreaseAbilityProperty(u5.CommonProps.Kit, u5.CommonProps.Ability, u5.CustomAbilityProperty),
            Visible = not CustomKitUtil.isMinAbilityPropertyLevel(u5.CommonProps.Ability, u5.CustomAbilityProperty)
        };
        local v32 = { (u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            })) };
        local createElement5 = u3.createElement;
        local v33 = {
            LayoutOrder = 50,
            AutomaticSize = "X",
            TextTransparency = 0,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.8, 0.8),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local v34 = CustomKitUtil.getAbilityPropertyCost(u7, u5.CustomAbilityProperty, u11 - 1);
        local v35;

        if v34 == nil then
            v35 = "";
        else
            local v36 = CustomKitUtil.getAbilityPropertyCost(u7, u5.CustomAbilityProperty, u11);
            v35 = v36 == nil and "" or "-" .. tostring(v36 - v34);
        end;

        v33.Text = v35;
        v33.TextColor3 = ColorUtil.WHITE;
        v33.Font = Enum.Font.RobotoMono;
        local v37;

        if DeviceUtil.isSmallScreen() then
            v37 = Enum.FontSize.Size18;
        else
            v37 = Enum.FontSize.Size24;
        end;

        v33.FontSize = v37;
        v32.CustomKit_AbilityPropertyLeftButtonText = createElement5("TextLabel", v33);
        v30.CustomKit_AbilityPropertyLeftButton = createElement4("ImageButton", v31, v32);
        v28.CustomKit_AbilityPropertyLeftButtonWrapper = createElement3(Empty, v29, v30);
        local createElement6 = u3.createElement;
        local v38 = {
            LayoutOrder = 2,
            TextTransparency = 0,
            TextScaled = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.3, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local v39 = CustomKitUtil.getAbilityPropertyCost(u7, u5.CustomAbilityProperty, u11);
        v38.Text = tostring(v39);
        v38.TextColor3 = ColorUtil.WHITE;
        v38.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold);
        v38.TextXAlignment = Enum.TextXAlignment.Center;
        v28.CustomKit_StatPointsAllocated = createElement6("TextLabel", v38, { u3.createElement("UITextSizeConstraint", {
                MaxTextSize = DeviceUtil.isSmallScreen() and 18 or 24
            }) });
        local createElement7 = u3.createElement;
        local v40 = {
            LayoutOrder = 3,
            Size = UDim2.fromScale(0.35, 1),
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0, 0.5)
        };
        local v41 = { (u3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            })) };
        local createElement8 = u3.createElement;
        local v42 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v43;

        if CustomKitUtil.isMaxAbilityPropertyLevel(u5.CommonProps.Ability, u5.CustomAbilityProperty) or CustomKitUtil.canIncreaseAbilityProperty(u5.CommonProps.Kit, u5.CommonProps.Ability, u5.CustomAbilityProperty) then
            if CustomKitUtil.isMaxAbilityPropertyLevel(u5.CommonProps.Ability, u5.CustomAbilityProperty) then
                v43 = Color3.fromRGB(79, 79, 79);
            else
                v43 = Theme.backgroundSuccess;
            end;
        else
            v43 = Theme.backgroundError;
        end;

        v42.BackgroundColor3 = v43;

        v42[u3.Event.Activated] = function() -- Line: 230
            -- upvalues: CustomKitUtil (ref), u5 (copy), u20 (copy), Flamework (ref)
            if CustomKitUtil.canIncreaseAbilityProperty(u5.CommonProps.Kit, u5.CommonProps.Ability, u5.CustomAbilityProperty) then
                u20();

                return;
            end;

            Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                message = "You don\'t have enough points to increase this ability property."
            });
        end;

        v42.Interactable = CustomKitUtil.canIncreaseAbilityProperty(u5.CommonProps.Kit, u5.CommonProps.Ability, u5.CustomAbilityProperty);
        v42.Visible = not CustomKitUtil.isMaxAbilityPropertyLevel(u5.CommonProps.Ability, u5.CustomAbilityProperty);
        local v44 = { (u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            })) };
        local createElement9 = u3.createElement;
        local v45 = {
            LayoutOrder = 50,
            AutomaticSize = "X",
            TextTransparency = 0,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.8, 0.8),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local v46 = CustomKitUtil.getAbilityPropertyCost(u7, u5.CustomAbilityProperty, u11 + 1);
        local v47;

        if v46 == nil then
            v47 = "MAX";
        else
            local v48 = CustomKitUtil.getAbilityPropertyCost(u7, u5.CustomAbilityProperty, u11);
            v47 = "+" .. tostring(v46 - (v48 == nil and 0 or v48));
        end;

        v45.Text = v47;
        v45.TextColor3 = ColorUtil.WHITE;
        v45.Font = Enum.Font.RobotoMono;
        local v49;

        if DeviceUtil.isSmallScreen() then
            v49 = Enum.FontSize.Size18;
        else
            v49 = Enum.FontSize.Size24;
        end;

        v45.FontSize = v49;
        v44.CustomKit_AbilityPropertyRightButtonText = createElement9("TextLabel", v45);
        v41.CustomKit_AbilityPropertyRightButton = createElement8("ImageButton", v42, v44);
        v28.CustomKit_AbilityPropertyRightButtonWrapper = createElement7(Empty, v40, v41);
        v24[1], v24[2], v24[3] = v25, v26, createElement2(Empty, v27, v28);
        v22.CustomKitCreation_StatSlot = createElement("Frame", v23, v24);

        return createFragment(v22);
    end)
};