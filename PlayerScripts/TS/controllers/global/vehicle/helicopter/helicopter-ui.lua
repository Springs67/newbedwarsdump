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
    HelicopterUi = v4.new(u3)(function(u5, p6) -- Line: 14
        -- upvalues: u2 (copy), Flamework (copy), BedwarsImageId (copy), DeviceUtil (copy), BedwarsUI (copy), u3 (copy), MobileButton (copy), ProgressBar (copy), Theme (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local v7, u8 = useState(u5.vehicleModel:GetAttribute("Health"));
        local v9, u10 = useState(u5.vehicleModel:GetAttribute("MaxHealth"));
        local v11, u12 = useState(u5.vehicleModel:GetAttribute("IsAttack"));
        local v13, u14 = useState(u5.vehicleModel:GetAttribute("AttackEnergy"));
        useEffect(function() -- Line: 21
            -- upvalues: u2 (ref), u5 (copy), u8 (copy), u10 (copy), u12 (copy), u14 (copy)
            local u15 = u2.new();
            u15:GiveTask(u5.vehicleModel:GetAttributeChangedSignal("Health"):Connect(function() -- Line: 23
                -- upvalues: u8 (ref), u5 (ref)
                u8(u5.vehicleModel:GetAttribute("Health"));
            end));
            u15:GiveTask(u5.vehicleModel:GetAttributeChangedSignal("MaxHealth"):Connect(function() -- Line: 26
                -- upvalues: u10 (ref), u5 (ref)
                u10(u5.vehicleModel:GetAttribute("MaxHealth"));
            end));
            u15:GiveTask(u5.vehicleModel:GetAttributeChangedSignal("IsAttack"):Connect(function() -- Line: 29
                -- upvalues: u12 (ref), u5 (ref)
                u12(u5.vehicleModel:GetAttribute("IsAttack"));
            end));
            u15:GiveTask(u5.vehicleModel:GetAttributeChangedSignal("AttackEnergy"):Connect(function() -- Line: 32
                -- upvalues: u14 (ref), u5 (ref)
                u14(u5.vehicleModel:GetAttribute("AttackEnergy"));
            end));

            return function() -- Line: 35
                -- upvalues: u15 (copy)
                u15:DoCleaning();
            end;
        end);
        local v16 = string.gsub(Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("MoveMountUp")[1].Name, "Button", "");
        local v17 = string.gsub(Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("MoveMountDown")[1].Name, "Button", "");
        local v18 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController").actionBarRef:getValue();
        local v19 = {};
        local v20 = #v19;
        local v21 = {
            Image = BedwarsImageId.UP_MOBILE
        };
        local v22;

        if DeviceUtil.isMobileControls() then
            v22 = BedwarsUI:getActionMobileButtonPosition();
        else
            v22 = UDim2.fromScale(0.2, BedwarsUI:getActionBarPosition().Y.Scale);
        end;

        v21.Position = v22;

        function v21.OnPressDown() -- Line: 47
            -- upvalues: u5 (copy)
            u5.upChanged(true);
        end;

        function v21.OnPressUp() -- Line: 50
            -- upvalues: u5 (copy)
            u5.upChanged(false);
        end;

        local v23 = {};
        local v24 = #v23;
        local v25 = not DeviceUtil.isMobileControls() and u3.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            Font = "RobotoCondensed",
            TextStrokeTransparency = 0,
            TextXAlignment = "Left",
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.3, 0.3),
            Position = UDim2.fromScale(1.2, 0.5),
            Text = v16,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextStrokeColor3 = Color3.fromRGB(18, 18, 18)
        });

        if v25 then
            v23[v24 + 1] = v25;
        end;

        v19[v20 + 1] = u3.createElement(MobileButton, v21, v23);
        local v26 = {
            Image = BedwarsImageId.DOWN_MOBILE
        };
        local v27;

        if DeviceUtil.isMobileControls() then
            v27 = BedwarsUI:getActionMobileButtonPosition() - UDim2.fromScale(0.08, 0);
        else
            v27 = UDim2.fromScale(0.8, BedwarsUI:getActionBarPosition().Y.Scale);
        end;

        v26.Position = v27;

        function v26.OnPressDown() -- Line: 85
            -- upvalues: u5 (copy)
            u5.downChanged(true);
        end;

        function v26.OnPressUp() -- Line: 88
            -- upvalues: u5 (copy)
            u5.downChanged(false);
        end;

        local v28 = {};
        local v29 = #v28;
        local v30 = not DeviceUtil.isMobileControls() and u3.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            Font = "RobotoCondensed",
            TextXAlignment = "Right",
            TextStrokeTransparency = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.3, 0.3),
            Position = UDim2.fromScale(-0.2, 0.5),
            Text = v17,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextStrokeColor3 = Color3.fromRGB(18, 18, 18)
        });

        if v30 then
            v28[v29 + 1] = v30;
        end;

        v19[v20 + 2] = u3.createElement(MobileButton, v26, v28);
        local v31;

        if v18 then
            local v32 = {
                target = v18
            };
            local v33 = { u3.createElement(ProgressBar, {
                    AcceptZero = true,
                    LayoutOrder = 1,
                    Size = Theme.actionBarProgressBarSize,
                    Progress = v7 / v9,
                    BarGradient = ColorSequence.new(Color3.fromRGB(217, 51, 51), Color3.fromRGB(138, 38, 18))
                }) };
            local v34 = #v33;
            local v35;

            if v11 then
                v35 = u3.createElement(ProgressBar, {
                    AcceptZero = true,
                    LayoutOrder = 2,
                    Size = Theme.actionBarProgressBarSize,
                    Progress = v13,
                    BarGradient = ColorSequence.new(Color3.fromRGB(42, 170, 255), Color3.fromRGB(26, 108, 159))
                });
            else
                v35 = nil;
            end;

            if v35 then
                v33[v34 + 1] = v35;
            end;

            v31 = u3.createElement(u3.Portal, v32, v33);
        else
            v31 = nil;
        end;

        if v31 then
            v19[v20 + 3] = v31;
        end;

        return u3.createFragment(v19);
    end)
};