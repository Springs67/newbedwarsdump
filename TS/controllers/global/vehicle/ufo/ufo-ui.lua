-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local MobileButton = v1.MobileButton;
local ProgressBar = v1.ProgressBar;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    UfoUi = v4.new(u3)(function(u5, p6) -- Line: 14
        -- upvalues: u2 (copy), Flamework (copy), BedwarsImageId (copy), DeviceUtil (copy), BedwarsUI (copy), u3 (copy), MobileButton (copy), ProgressBar (copy), Theme (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local v7, u8 = useState(u5.vehicleModel:GetAttribute("Health"));
        local v9, u10 = useState(u5.vehicleModel:GetAttribute("MaxHealth"));
        local v11, u12 = useState(u5.vehicleModel:GetAttribute("TractorBeamEnergy"));
        useEffect(function() -- Line: 20
            -- upvalues: u2 (ref), u5 (copy), u8 (copy), u10 (copy), u12 (copy)
            local u13 = u2.new();
            u13:GiveTask(u5.vehicleModel:GetAttributeChangedSignal("Health"):Connect(function() -- Line: 22
                -- upvalues: u8 (ref), u5 (ref)
                u8(u5.vehicleModel:GetAttribute("Health"));
            end));
            u13:GiveTask(u5.vehicleModel:GetAttributeChangedSignal("MaxHealth"):Connect(function() -- Line: 25
                -- upvalues: u10 (ref), u5 (ref)
                u10(u5.vehicleModel:GetAttribute("MaxHealth"));
            end));
            u13:GiveTask(u5.vehicleModel:GetAttributeChangedSignal("TractorBeamEnergy"):Connect(function() -- Line: 28
                -- upvalues: u12 (ref), u5 (ref)
                u12(u5.vehicleModel:GetAttribute("TractorBeamEnergy"));
            end));

            return function() -- Line: 31
                -- upvalues: u13 (copy)
                u13:DoCleaning();
            end;
        end);
        local v14 = string.gsub(Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("MoveMountUp")[1].Name, "Button", "");
        local v15 = string.gsub(Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("MoveMountDown")[1].Name, "Button", "");
        local v16 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController").actionBarRef:getValue();
        local v17 = {};
        local v18 = #v17;
        local v19 = {
            Image = BedwarsImageId.UP_MOBILE
        };
        local v20;

        if DeviceUtil.isMobileControls() then
            v20 = BedwarsUI:getActionMobileButtonPosition();
        else
            v20 = UDim2.fromScale(0.2, BedwarsUI:getActionBarPosition().Y.Scale);
        end;

        v19.Position = v20;

        function v19.OnPressDown() -- Line: 43
            -- upvalues: u5 (copy)
            u5.upChanged(true);
        end;

        function v19.OnPressUp() -- Line: 46
            -- upvalues: u5 (copy)
            u5.upChanged(false);
        end;

        local v21 = {};
        local v22 = #v21;
        local v23 = not DeviceUtil.isMobileControls() and u3.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            Font = "RobotoCondensed",
            TextStrokeTransparency = 0,
            TextXAlignment = "Left",
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.3, 0.3),
            Position = UDim2.fromScale(1.2, 0.5),
            Text = v14,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextStrokeColor3 = Color3.fromRGB(18, 18, 18)
        });

        if v23 then
            v21[v22 + 1] = v23;
        end;

        v17[v18 + 1] = u3.createElement(MobileButton, v19, v21);
        local v24 = {
            Image = BedwarsImageId.DOWN_MOBILE
        };
        local v25;

        if DeviceUtil.isMobileControls() then
            v25 = BedwarsUI:getActionMobileButtonPosition() - UDim2.fromScale(0.08, 0);
        else
            v25 = UDim2.fromScale(0.8, BedwarsUI:getActionBarPosition().Y.Scale);
        end;

        v24.Position = v25;

        function v24.OnPressDown() -- Line: 81
            -- upvalues: u5 (copy)
            u5.downChanged(true);
        end;

        function v24.OnPressUp() -- Line: 84
            -- upvalues: u5 (copy)
            u5.downChanged(false);
        end;

        local v26 = {};
        local v27 = #v26;
        local v28 = not DeviceUtil.isMobileControls() and u3.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            Font = "RobotoCondensed",
            TextXAlignment = "Right",
            TextStrokeTransparency = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.3, 0.3),
            Position = UDim2.fromScale(-0.2, 0.5),
            Text = v15,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextStrokeColor3 = Color3.fromRGB(18, 18, 18)
        });

        if v28 then
            v26[v27 + 1] = v28;
        end;

        v17[v18 + 2] = u3.createElement(MobileButton, v24, v26);
        local v29;

        if v16 then
            v29 = u3.createElement(u3.Portal, {
                target = v16
            }, { u3.createElement(ProgressBar, {
                    AcceptZero = true,
                    LayoutOrder = 1,
                    Size = Theme.actionBarProgressBarSize,
                    Progress = v7 / v9,
                    BarGradient = ColorSequence.new(Color3.fromRGB(217, 51, 51), Color3.fromRGB(138, 38, 18))
                }), u3.createElement(ProgressBar, {
                    AcceptZero = true,
                    LayoutOrder = 2,
                    Size = Theme.actionBarProgressBarSize,
                    Progress = v11,
                    BarGradient = ColorSequence.new(Color3.fromRGB(42, 170, 255), Color3.fromRGB(26, 108, 159))
                }) });
        else
            v29 = nil;
        end;

        if v29 then
            v17[v18 + 3] = v29;
        end;

        return u3.createFragment(v17);
    end)
};