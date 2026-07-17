-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local MobileButton = v1.MobileButton;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    TrainUi = v3.new(u2)(function(u4, p5) -- Line: 11
        -- upvalues: Flamework (copy), BedwarsImageId (copy), DeviceUtil (copy), BedwarsUI (copy), u2 (copy), MobileButton (copy)
        local _ = p5.useState;
        local _ = p5.useEffect;
        local v6 = string.gsub(Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("MoveMountUp")[1].Name, "Button", "");
        local v7 = string.gsub(Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("MoveMountDown")[1].Name, "Button", "");
        local v8 = {};
        local v9 = #v8;
        local v10 = {
            Image = BedwarsImageId.UP_MOBILE
        };
        local v11;

        if DeviceUtil.isMobileControls() then
            v11 = BedwarsUI:getActionMobileButtonPosition();
        else
            v11 = UDim2.fromScale(0.2, BedwarsUI:getActionBarPosition().Y.Scale);
        end;

        v10.Position = v11;

        function v10.OnPressDown() -- Line: 21
            -- upvalues: u4 (copy)
            u4.upChanged(true);
        end;

        function v10.OnPressUp() -- Line: 24
            -- upvalues: u4 (copy)
            u4.upChanged(false);
        end;

        local v12 = {};
        local v13 = #v12;
        local v14 = not DeviceUtil.isMobileControls() and u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            Font = "RobotoCondensed",
            TextStrokeTransparency = 0,
            TextXAlignment = "Left",
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.3, 0.3),
            Position = UDim2.fromScale(1.2, 0.5),
            Text = v6,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextStrokeColor3 = Color3.fromRGB(18, 18, 18)
        });

        if v14 then
            v12[v13 + 1] = v14;
        end;

        v8[v9 + 1] = u2.createElement(MobileButton, v10, v12);
        local v15 = {
            Image = BedwarsImageId.DOWN_MOBILE
        };
        local v16;

        if DeviceUtil.isMobileControls() then
            v16 = BedwarsUI:getActionMobileButtonPosition() - UDim2.fromScale(0.08, 0);
        else
            v16 = UDim2.fromScale(0.8, BedwarsUI:getActionBarPosition().Y.Scale);
        end;

        v15.Position = v16;

        function v15.OnPressDown() -- Line: 59
            -- upvalues: u4 (copy)
            u4.downChanged(true);
        end;

        function v15.OnPressUp() -- Line: 62
            -- upvalues: u4 (copy)
            u4.downChanged(false);
        end;

        local v17 = {};
        local v18 = #v17;
        local v19 = not DeviceUtil.isMobileControls() and u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            Font = "RobotoCondensed",
            TextXAlignment = "Right",
            TextStrokeTransparency = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.3, 0.3),
            Position = UDim2.fromScale(-0.2, 0.5),
            Text = v7,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextStrokeColor3 = Color3.fromRGB(18, 18, 18)
        });

        if v19 then
            v17[v18 + 1] = v19;
        end;

        v8[v9 + 2] = u2.createElement(MobileButton, v15, v17);

        return u2.createFragment(v8);
    end)
};