-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    RoadmapCard = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u1)(function(p2, p3) -- Line: 6
        -- upvalues: ColorUtil (copy), u1 (copy)
        local _ = p3.useState;
        local v4 = {
            BackgroundColor3 = ColorUtil.hexColor(2763567),
            Size = UDim2.fromScale(1, 1),
            LayoutOrder = p2.LayoutOrder
        };
        local v5 = {
            u1.createElement("UICorner", {
                CornerRadius = UDim.new(0, 5)
            }),
            u1.createElement("UIAspectRatioConstraint", {
                AspectRatio = 3.608
            }),
            RoadmapIcon = u1.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.12147505422993492, 0.5),
                Size = UDim2.fromScale(0.1951219512195122, 0.704),
                ScaleType = Enum.ScaleType.Fit,
                Image = p2.image
            }, { u1.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) }),
            RoadmapTitle = u1.createElement("TextLabel", {
                BackgroundTransparency = 1,
                Position = UDim2.fromScale(0.28159645232815966, 0.04),
                Size = UDim2.fromScale(0.656319290465632, 0.304),
                Text = p2.title,
                FontFace = Font.new("Arial", Enum.FontWeight.Light),
                TextSize = 36 * p2.fontSizeScale,
                TextColor3 = ColorUtil.WHITE,
                TextXAlignment = Enum.TextXAlignment.Left
            }),
            RoadmapDescription = u1.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextWrapped = true,
                Position = UDim2.fromScale(0.28159645232815966, 0.36),
                Size = UDim2.fromScale(0.656319290465632, 0.64),
                Text = p2.description,
                FontFace = Font.new("Arial", Enum.FontWeight.Light),
                TextSize = 26 * p2.fontSizeScale,
                TextColor3 = ColorUtil.WHITE,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top
            })
        };
        local v6 = #v5;
        local v7;

        if p2.released == true then
            v7 = u1.createFragment({
                ReleasedIndicator = u1.createElement("TextLabel", {
                    Text = "Released",
                    BackgroundTransparency = 1,
                    Position = UDim2.fromScale(0.9822616407982262, 0.064),
                    AnchorPoint = Vector2.new(1, 0),
                    Size = UDim2.fromScale(0.656319290465632, 0.472),
                    TextXAlignment = Enum.TextXAlignment.Right,
                    TextYAlignment = Enum.TextYAlignment.Top,
                    FontFace = Font.new("Arial", Enum.FontWeight.Light),
                    TextSize = 24 * p2.fontSizeScale,
                    TextColor3 = ColorUtil.hexColor(7864161)
                })
            });
        else
            v7 = false;
        end;

        if v7 then
            v5[v6 + 1] = v7;
        end;

        return u1.createElement("Frame", v4, v5);
    end)
};