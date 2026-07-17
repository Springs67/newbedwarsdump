-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local SwapButton = RuntimeLib.import(script, script.Parent, "swap-ability-button").SwapButton;

return {
    NecromancerStaffCore = v3.new(u2)(function(u4, p5) -- Line: 11
        -- upvalues: DeviceUtil (copy), Flamework (copy), u2 (copy), UIUtil (copy), SwapButton (copy), BedwarsImageId (copy)
        local _ = p5.useState;
        local useEffect = p5.useEffect;
        local u6 = DeviceUtil.isMobileControls() or DeviceUtil.isSmallScreen();
        local v7 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("KitPrimary");

        if v7 ~= nil then
            v7 = v7[1].Name;
        end;

        local u8 = u2.createRef();
        useEffect(function() -- Line: 21
            -- upvalues: u8 (copy)
            local v9 = u8:getValue();

            if not v9 then
                return nil;
            end;

            v9:SetAttribute("ActionBarLayoutOrder", 1000);
        end, {});

        local function v17(p10) -- Line: 29
            -- upvalues: u2 (ref), u6 (copy)
            local v11 = {
                BorderSizePixel = 0,
                BackgroundTransparency = 0,
                Size = UDim2.new(0, 30, 0.3, 0),
                Position = UDim2.fromScale(0.5, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(46, 46, 46)
            };
            local v12 = {};
            local v13 = #v12;
            local v14;

            if p10.AspectRatio == nil then
                v14 = false;
            else
                v14 = u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = p10.AspectRatio
                });
            end;

            if v14 then
                v12[v13 + 1] = v14;
            end;

            local v15 = #v12;
            v12[v15 + 1] = u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            });
            local v16;

            if u6 then
                v16 = u2.createElement("ImageLabel", {
                    SizeConstraint = "RelativeYY",
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Image = p10.MobileImage,
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.fromScale(1, 1),
                    ScaleType = Enum.ScaleType.Fit
                });
            else
                v16 = u2.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextScaled = true,
                    RichText = true,
                    Size = UDim2.fromScale(0.8, 0.7),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Text = "<b>" .. tostring(p10.Hotkey) .. "</b>",
                    Font = Enum.Font.Roboto,
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                });
            end;

            v12[v15 + 2] = v16;

            return u2.createFragment({
                HotkeyComponent = u2.createElement("Frame", v11, v12)
            });
        end;

        local v18 = {};
        local v19;

        if u6 then
            v19 = UDim2.fromScale(0.25, 0.135);
        else
            v19 = UDim2.fromScale(1, 0.07);
        end;

        v18.Size = v19;
        local v20;

        if u6 then
            v20 = UDim2.fromScale(0.275, 0.75);
        else
            v20 = UIUtil:getActionBarPosition();
        end;

        v18.Position = v20;
        v18.AnchorPoint = Vector2.new(0.5, 1);
        v18.BorderSizePixel = 0;
        v18.BackgroundTransparency = 1;
        v18.LayoutOrder = 2;
        v18[u2.Ref] = u8;
        local v21 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.01, 0)
            }) };
        local _ = #v21;
        local v22 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 0.5,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        };
        local v23 = { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = #u4.Modes * 0.8
            }), u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }) };
        local v24 = #v23;
        local Modes = u4.Modes;

        local function _(p25, p26) -- Line: 111
            -- upvalues: u2 (ref), SwapButton (ref), u4 (copy)
            return u2.createElement(SwapButton, {
                extra = false,
                ChangeAbility = u4.ChangeAbility,
                activeMode = u4.activeMode,
                buttonMode = p25
            });
        end;

        local v27 = table.create(#Modes);

        for i, v in Modes do
            local _ = i - 1;
            v27[i] = u2.createElement(SwapButton, {
                extra = false,
                ChangeAbility = u4.ChangeAbility,
                activeMode = u4.activeMode,
                buttonMode = v
            });
        end;

        local v28 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.8, 0.8),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5)
        };
        local v29 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.05, 0)
            }) };
        local v30 = #v29;

        for i, v in v27 do
            v29[v30 + i] = v;
        end;

        v23.AbilityButtons = u2.createElement("Frame", v28, v29);
        local v31;

        if #u4.Modes > 1 then
            v31 = u2.createElement(v17, {
                Hotkey = v7,
                MobileImage = BedwarsImageId.SWAP_MOBILE
            });
        else
            v31 = false;
        end;

        if v31 then
            v23[v24 + 1] = v31;
        end;

        v21.SwapAbilitiesContainer = u2.createElement("Frame", v22, v23);

        return u2.createFragment({
            SwapAbilityBar = u2.createElement("Frame", v18, v21)
        });
    end)
};