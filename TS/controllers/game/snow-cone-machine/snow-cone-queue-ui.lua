-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;

return {
    SnowConeQueueUI = v2.new(u1)(function(u3, p4) -- Line: 7
        -- upvalues: default (copy), u1 (copy), Empty (copy)
        local useEffect = p4.useEffect;
        local v5, u6 = p4.useState(0);
        useEffect(function() -- Line: 11
            -- upvalues: default (ref), u3 (copy), u6 (copy)
            default.Client:OnEvent("SnowConeQueueChanged", function(p7) -- Line: 12
                -- upvalues: u3 (ref), u6 (ref)
                if p7.snowConeMachine == u3.SnowConeMachine then
                    u6(p7.numberInQueue);
                end;
            end);
        end, {});

        if v5 == 0 then
            return u1.createElement(Empty);
        end;

        return u1.createElement("ImageLabel", {
            Transparency = 1,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5)
        }, { u1.createElement("ImageLabel", {
                Transparency = 0.8,
                Position = UDim2.fromScale(0.5, 0.45),
                Size = UDim2.fromScale(1, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            }, { u1.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 8)
                }) }), u1.createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.4, 0.4),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5)
            }, {
                u1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder
                }),
                SnowConeImage = u1.createElement("ImageLabel", {
                    Image = "rbxassetid://10489888403",
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = 3,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    Size = UDim2.fromScale(0.8, 0.8),
                    SizeConstraint = Enum.SizeConstraint.RelativeXY,
                    ScaleType = Enum.ScaleType.Fit
                }),
                u1.createElement("TextLabel", {
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    Font = "LuckiestGuy",
                    TextStrokeTransparency = 0.6,
                    LayoutOrder = 1,
                    Text = tostring(v5),
                    Size = UDim2.fromScale(1, 1),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    TextColor3 = Color3.fromRGB(255, 255, 0)
                }),
                u1.createElement("TextLabel", {
                    Text = "x",
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    Font = "LuckiestGuy",
                    TextStrokeTransparency = 0.6,
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(0.6, 0.6),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    TextColor3 = Color3.fromRGB(255, 255, 0)
                })
            }) });
    end)
};