-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local WizardAbilityButton = RuntimeLib.import(script, script.Parent, "wizard-ability-button").WizardAbilityButton;

return {
    WizardAbilityBarCore = v3.new(u2)(function(u4, p5) -- Line: 11
        -- upvalues: DeviceUtil (copy), Flamework (copy), u2 (copy), UIUtil (copy), WizardAbilityButton (copy), BedwarsImageId (copy)
        local _ = p5.useState;
        local useEffect = p5.useEffect;
        local u6 = DeviceUtil.isMobileControls() or DeviceUtil.isSmallScreen();
        local v7 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("ItemPrimary");

        if v7 ~= nil then
            v7 = v7[1].Name;
        end;

        local u8 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("ItemSecondary");

        if u8 ~= nil then
            u8 = u8[1].Name;
        end;

        local u9 = u2.createRef();
        useEffect(function() -- Line: 26
            -- upvalues: u9 (copy)
            local v10 = u9:getValue();

            if not v10 then
                return nil;
            end;

            v10:SetAttribute("ActionBarLayoutOrder", 1000);
        end, {});

        local function u18(p11) -- Line: 34
            -- upvalues: u2 (ref), u6 (copy)
            local v12 = {
                BorderSizePixel = 0,
                BackgroundTransparency = 0,
                Size = UDim2.new(0, 30, 0.3, 0),
                Position = UDim2.fromScale(0.5, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(46, 46, 46)
            };
            local v13 = {};
            local v14 = #v13;
            local v15;

            if p11.AspectRatio == nil then
                v15 = false;
            else
                v15 = u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = p11.AspectRatio
                });
            end;

            if v15 then
                v13[v14 + 1] = v15;
            end;

            local v16 = #v13;
            v13[v16 + 1] = u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            });
            local v17;

            if u6 then
                v17 = u2.createElement("ImageLabel", {
                    SizeConstraint = "RelativeYY",
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Image = p11.MobileImage,
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.fromScale(1, 1),
                    ScaleType = Enum.ScaleType.Fit
                });
            else
                v17 = u2.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextScaled = true,
                    RichText = true,
                    Size = UDim2.fromScale(0.8, 0.7),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Text = "<b>" .. tostring(p11.Hotkey) .. "</b>",
                    Font = Enum.Font.Roboto,
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                });
            end;

            v13[v16 + 2] = v17;

            return u2.createFragment({
                HotkeyComponent = u2.createElement("Frame", v12, v13)
            });
        end;

        local v19 = {};
        local v20;

        if u6 then
            v20 = UDim2.fromScale(0.25, 0.135);
        else
            v20 = UDim2.fromScale(1, 0.07);
        end;

        v19.Size = v20;
        local v21;

        if u6 then
            v21 = UDim2.fromScale(0.275, 0.75);
        else
            v21 = UIUtil:getActionBarPosition();
        end;

        v19.Position = v21;
        v19.AnchorPoint = Vector2.new(0.5, 1);
        v19.BorderSizePixel = 0;
        v19.BackgroundTransparency = 1;
        v19.LayoutOrder = 2;
        v19[u2.Ref] = u9;
        local v22 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.01, 0)
            }) };
        local v23 = #v22;
        local v24 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 0.5,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        };
        local v25 = { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = #u4.Abilities * 0.8
            }), u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }) };
        local v26 = #v25;
        local Abilities = u4.Abilities;

        local function _(p27, p28) -- Line: 116
            -- upvalues: u2 (ref), WizardAbilityButton (ref), u4 (copy)
            return u2.createElement(WizardAbilityButton, {
                extra = false,
                ChangeAbility = u4.ChangeAbility,
                activeAbility = u4.activeAbility,
                ability = p27
            });
        end;

        local v29 = table.create(#Abilities);

        for i, v in Abilities do
            local _ = i - 1;
            v29[i] = u2.createElement(WizardAbilityButton, {
                extra = false,
                ChangeAbility = u4.ChangeAbility,
                activeAbility = u4.activeAbility,
                ability = v
            });
        end;

        local v30 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.8, 0.8),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5)
        };
        local v31 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.05, 0)
            }) };
        local v32 = #v31;

        for i, v in v29 do
            v31[v32 + i] = v;
        end;

        v25.AbilityButtons = u2.createElement("Frame", v30, v31);
        local v33;

        if #u4.Abilities > 1 then
            v33 = u2.createElement(u18, {
                Hotkey = v7,
                MobileImage = BedwarsImageId.SWAP_MOBILE
            });
        else
            v33 = false;
        end;

        if v33 then
            v25[v26 + 1] = v33;
        end;

        v22.SwapAbilitiesContainer = u2.createElement("Frame", v24, v25);
        local ExtraAbilities = u4.ExtraAbilities;

        local function v36(p34, p35) -- Line: 160
            -- upvalues: u2 (ref), u4 (copy), WizardAbilityButton (ref), u18 (copy), u8 (copy), BedwarsImageId (ref)
            return u2.createFragment({
                ExtraAbilitiesContainer = u2.createElement("Frame", {
                    BorderSizePixel = 0,
                    BackgroundTransparency = 0.5,
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                }, {
                    u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = #u4.ExtraAbilities * 0.8
                    }),
                    u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 6)
                    }),
                    AbilityButtons = u2.createElement("Frame", {
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(0.8, 0.8),
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5)
                    }, { u2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal,
                            VerticalAlignment = Enum.VerticalAlignment.Center,
                            HorizontalAlignment = Enum.HorizontalAlignment.Center,
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            Padding = UDim.new(0.05, 0)
                        }), u2.createElement(WizardAbilityButton, {
                            extra = true,
                            ChangeAbility = u4.ChangeAbility,
                            activeAbility = u4.activeAbility,
                            ability = p34
                        }) }),
                    u2.createElement(u18, {
                        AspectRatio = 1,
                        Hotkey = u8,
                        MobileImage = BedwarsImageId.TOUCH
                    })
                })
            });
        end;

        local v37 = table.create(#ExtraAbilities);

        for i, v in ExtraAbilities do
            v37[i] = v36(v, i - 1, ExtraAbilities);
        end;

        for i, v in v37 do
            v22[v23 + i] = v;
        end;

        return u2.createFragment({
            WizardAbilityBar = u2.createElement("Frame", v19, v22)
        });
    end)
};