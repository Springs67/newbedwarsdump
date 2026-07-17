-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ImageId = v1.ImageId;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ServerHealthMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "server-health", "server-health-state").ServerHealthMeta;

return {
    ServerHealthIcon = v3.new(u2)(function(p4, p5) -- Line: 10
        -- upvalues: u2 (copy), ImageId (copy), ServerHealthMeta (copy), TooltipContainer (copy), AutoSizedText (copy)
        local _ = p5.useState;

        return u2.createFragment({
            ServerHealthStateIcon = u2.createElement("ImageLabel", {
                ImageTransparency = 0,
                SizeConstraint = "RelativeYY",
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                Image = ImageId.WIFI_SOLID,
                ImageColor3 = ServerHealthMeta[p4.serverHealthState].color,
                LayoutOrder = p4.layoutOrder
            }, { u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                        TextSize = 16,
                        Text = "Server Health: " .. p4.serverHealthState,
                        Font = Enum.Font.SourceSansBold,
                        Limits = Vector2.new(300, 60)
                    }) }) })
        });
    end)
};