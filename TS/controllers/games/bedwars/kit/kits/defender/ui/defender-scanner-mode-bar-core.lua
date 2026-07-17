-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local DefenderScannerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "defender", "defender-kit-balance").DefenderScannerUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local DefenderScannerModeButton = RuntimeLib.import(script, script.Parent, "defender-scanner-mode-button").DefenderScannerModeButton;

return {
    DefenderScannerModeBarCore = v3.new(u2)(function(u4, p5) -- Line: 12
        -- upvalues: DeviceUtil (copy), Flamework (copy), u2 (copy), UIUtil (copy), DefenderScannerUtil (copy), DefenderScannerModeButton (copy), BedwarsImageId (copy)
        local useEffect = p5.useEffect;
        local u6 = DeviceUtil.isMobileControls() or DeviceUtil.isSmallScreen();
        local v7 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("ItemPrimary");

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

        local function v16(p10) -- Line: 28
            -- upvalues: u2 (ref), u6 (copy)
            local createFragment = u2.createFragment;
            local v11 = {};
            local createElement = u2.createElement;
            local v12 = {
                BorderSizePixel = 0,
                BackgroundTransparency = 0,
                Size = UDim2.new(0, 30, 0.3, 0),
                Position = UDim2.fromScale(0.5, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(46, 46, 46)
            };
            local v13 = {};
            local v14 = u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            });
            local v15;

            if u6 then
                v15 = u2.createElement("ImageLabel", {
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
                v15 = u2.createElement("TextLabel", {
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

            v13[1], v13[2] = v14, v15;
            v11.HotkeyComponent = createElement("Frame", v12, v13);

            return createFragment(v11);
        end;

        local v17 = {};
        local v18;

        if u6 then
            v18 = UDim2.fromScale(0.25, 0.17);
        else
            v18 = UDim2.fromScale(1, 0.095);
        end;

        v17.Size = v18;
        local v19;

        if u6 then
            v19 = UDim2.fromScale(0.275, 0.75);
        else
            v19 = UIUtil:getActionBarPosition();
        end;

        v17.Position = v19;
        v17.AnchorPoint = Vector2.new(0.5, 1);
        v17.BorderSizePixel = 0;
        v17.BackgroundTransparency = 1;
        v17.LayoutOrder = 2;
        v17[u2.Ref] = u8;
        local v20 = {
            u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.03, 0)
            }),
            ModeTitle = u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 0,
                TextStrokeTransparency = 0.25,
                TextScaled = true,
                Size = UDim2.fromScale(1, 0.24),
                Text = "Mode: " .. DefenderScannerUtil.getModeTitle(u4.activeMode),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
                Font = Enum.Font.RobotoCondensed
            })
        };
        local _ = #v20;
        local v21 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 0.5,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.73),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        };
        local v22 = { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = #u4.Modes * 0.8
            }), u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }) };
        local v23 = #v22;
        local Modes = u4.Modes;

        local function _(p24) -- Line: 113
            -- upvalues: u2 (ref), DefenderScannerModeButton (ref), u4 (copy)
            return u2.createElement(DefenderScannerModeButton, {
                ChangeMode = u4.ChangeMode,
                activeMode = u4.activeMode,
                mode = p24
            });
        end;

        local v25 = table.create(#Modes);

        for i, v in Modes do
            local _ = i - 1;
            v25[i] = u2.createElement(DefenderScannerModeButton, {
                ChangeMode = u4.ChangeMode,
                activeMode = u4.activeMode,
                mode = v
            });
        end;

        local v26 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.8, 0.8),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5)
        };
        local v27 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.05, 0)
            }) };
        local v28 = #v27;

        for i, v in v25 do
            v27[v28 + i] = v;
        end;

        v22.ModeButtons = u2.createElement("Frame", v26, v27);
        local v29;

        if #u4.Modes > 1 then
            v29 = u2.createElement(v16, {
                Hotkey = v7,
                MobileImage = BedwarsImageId.SWAP_MOBILE
            });
        else
            v29 = false;
        end;

        if v29 then
            v22[v23 + 1] = v29;
        end;

        v20.ScannerModesContainer = u2.createElement("Frame", v21, v22);

        return u2.createFragment({
            DefenderScannerModeBar = u2.createElement("Frame", v17, v20)
        });
    end)
};