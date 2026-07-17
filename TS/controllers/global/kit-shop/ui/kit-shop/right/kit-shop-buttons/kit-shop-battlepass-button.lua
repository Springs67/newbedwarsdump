-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ImageId = v1.ImageId;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    KitShopBattlePassButton = v3.new(u2)(function(p4, p5) -- Line: 11
        -- upvalues: u2 (copy), Button (copy), Theme (copy), Flamework (copy), BedwarsAppIds (copy), ImageId (copy)
        local _ = p5.useState;

        return u2.createElement(Button, {
            Selectable = false,
            Size = p4.Size,
            BackgroundColor3 = Theme.backgroundSuccess,

            OnClick = function() -- Line: 17, Name: OnClick
                -- upvalues: Flamework (ref), BedwarsAppIds (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.BATTLEPASS, {});
            end,

            LayoutOrder = p4.LayoutOrder
        }, { u2.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                SizeConstraint = "RelativeYY",
                ScaleType = "Fit",
                Image = ImageId.TICKET,
                ImageColor3 = Color3.fromRGB(255, 255, 255),
                Size = UDim2.fromScale(0.67, 0.65),
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromScale(0.2, 0.5)
            }), u2.createElement("TextLabel", {
                Text = "BATTLE PASS",
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextScaled = true,
                TextXAlignment = "Left",
                Size = UDim2.fromScale(0.42, 0.45),
                Position = UDim2.fromScale(0.36, 0.5),
                AnchorPoint = Vector2.new(0, 0.5),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
            }) });
    end)
};