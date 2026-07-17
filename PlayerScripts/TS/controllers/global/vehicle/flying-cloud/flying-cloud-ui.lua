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
    FlyingCloudUi = v4.new(u3)(function(u5, p6) -- Line: 14
        -- upvalues: u2 (copy), Flamework (copy), BedwarsImageId (copy), DeviceUtil (copy), BedwarsUI (copy), u3 (copy), MobileButton (copy), ProgressBar (copy), Theme (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local v7, u8 = useState(u5.vehicleModel:GetAttribute("Health"));
        local v9, u10 = useState(u5.vehicleModel:GetAttribute("MaxHealth"));
        useEffect(function() -- Line: 19
            -- upvalues: u2 (ref), u5 (copy), u8 (copy), u10 (copy)
            local u11 = u2.new();
            u11:GiveTask(u5.vehicleModel:GetAttributeChangedSignal("Health"):Connect(function() -- Line: 21
                -- upvalues: u8 (ref), u5 (ref)
                u8(u5.vehicleModel:GetAttribute("Health"));
            end));
            u11:GiveTask(u5.vehicleModel:GetAttributeChangedSignal("MaxHealth"):Connect(function() -- Line: 24
                -- upvalues: u10 (ref), u5 (ref)
                u10(u5.vehicleModel:GetAttribute("MaxHealth"));
            end));

            return function() -- Line: 27
                -- upvalues: u11 (copy)
                u11:DoCleaning();
            end;
        end);
        local v12 = string.gsub(Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("MoveMountUp")[1].Name, "Button", "");
        local v13 = string.gsub(Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("MoveMountDown")[1].Name, "Button", "");
        local v14 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController").actionBarRef:getValue();
        local v15 = {};
        local v16 = #v15;
        local v17 = {
            Image = BedwarsImageId.UP_MOBILE
        };
        local v18;

        if DeviceUtil.isMobileControls() then
            v18 = BedwarsUI:getActionMobileButtonPosition();
        else
            v18 = UDim2.fromScale(0.2, BedwarsUI:getActionBarPosition().Y.Scale);
        end;

        v17.Position = v18;

        function v17.OnPressDown() -- Line: 39
            -- upvalues: u5 (copy)
            u5.upChanged(true);
        end;

        function v17.OnPressUp() -- Line: 42
            -- upvalues: u5 (copy)
            u5.upChanged(false);
        end;

        local v19 = {};
        local v20 = #v19;
        local v21 = not DeviceUtil.isMobileControls() and u3.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            Font = "RobotoCondensed",
            TextStrokeTransparency = 0,
            TextXAlignment = "Left",
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.3, 0.3),
            Position = UDim2.fromScale(1.2, 0.5),
            Text = v12,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextStrokeColor3 = Color3.fromRGB(18, 18, 18)
        });

        if v21 then
            v19[v20 + 1] = v21;
        end;

        v15[v16 + 1] = u3.createElement(MobileButton, v17, v19);
        local v22 = {
            Image = BedwarsImageId.DOWN_MOBILE
        };
        local v23;

        if DeviceUtil.isMobileControls() then
            v23 = BedwarsUI:getActionMobileButtonPosition() - UDim2.fromScale(0.08, 0);
        else
            v23 = UDim2.fromScale(0.8, BedwarsUI:getActionBarPosition().Y.Scale);
        end;

        v22.Position = v23;

        function v22.OnPressDown() -- Line: 77
            -- upvalues: u5 (copy)
            u5.downChanged(true);
        end;

        function v22.OnPressUp() -- Line: 80
            -- upvalues: u5 (copy)
            u5.downChanged(false);
        end;

        local v24 = {};
        local v25 = #v24;
        local v26 = not DeviceUtil.isMobileControls() and u3.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            Font = "RobotoCondensed",
            TextXAlignment = "Right",
            TextStrokeTransparency = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.3, 0.3),
            Position = UDim2.fromScale(-0.2, 0.5),
            Text = v13,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextStrokeColor3 = Color3.fromRGB(18, 18, 18)
        });

        if v26 then
            v24[v25 + 1] = v26;
        end;

        v15[v16 + 2] = u3.createElement(MobileButton, v22, v24);
        local v27;

        if v14 then
            v27 = u3.createElement(u3.Portal, {
                target = v14
            }, { u3.createElement(ProgressBar, {
                    AcceptZero = true,
                    LayoutOrder = 1,
                    Size = Theme.actionBarProgressBarSize,
                    Progress = v7 / v9,
                    BarGradient = ColorSequence.new(Color3.fromRGB(217, 51, 51), Color3.fromRGB(138, 38, 18))
                }) });
        else
            v27 = nil;
        end;

        if v27 then
            v15[v16 + 3] = v27;
        end;

        return u3.createFragment(v15);
    end)
};