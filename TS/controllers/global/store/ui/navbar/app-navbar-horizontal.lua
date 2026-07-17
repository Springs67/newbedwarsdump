-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Empty = v1.Empty;
local Padding = v1.Padding;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    AppNavbarHorizontal = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(u3, p4) -- Line: 8
        -- upvalues: u2 (copy), Padding (copy), Empty (copy)
        local _ = p4.useState;
        local _ = p4.useEffect;
        local v5 = {
            Size = UDim2.fromScale(1, 0.15),
            Position = UDim2.fromScale(0.5, 0),
            AnchorPoint = Vector2.new(0.5, 0)
        };
        local FrameProps = u3.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v5[i] = v;
            end;
        end;

        local v6 = {};
        local _ = #v6;
        local NavButtons = u3.NavButtons;

        local function v17(u7) -- Line: 25
            -- upvalues: u3 (copy), u2 (ref)
            local v8 = u3.ActiveAppId == u7.Id;
            local createElement = u2.createElement;
            local v9 = {
                Size = UDim2.fromScale(1, 0.8),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                BackgroundTransparency = 0.3,
                BorderSizePixel = 0,

                [u2.Event.Activated] = function() -- Line: 32
                    -- upvalues: u3 (ref), u7 (copy)
                    if u3.ActiveAppId == u7.Id then
                        return nil;
                    end;

                    u3.SetActiveAppId(u7.Id);
                end,

                ZIndex = 2
            };
            local v10 = {};
            local v11 = u2.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            });
            local v12 = u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            });
            local createElement2 = u2.createElement;
            local v13 = {
                Thickness = 2,
                Color = Color3.fromRGB(255, 255, 255)
            };
            local v14 = {};
            local createElement3 = u2.createElement;
            local v15 = {
                Rotation = 90
            };
            local new = ColorSequence.new;
            local v16;

            if v8 then
                v16 = Color3.fromRGB(255, 255, 255);
            else
                v16 = Color3.fromRGB(131, 131, 131);
            end;

            v15.Color = new(v16);
            v15.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.49, 1),
                NumberSequenceKeypoint.new(0.5, 0.4),
                NumberSequenceKeypoint.new(1, 0)
            });
            v14[1] = createElement3("UIGradient", v15);
            v10[1], v10[2], v10[3] = v11, v12, createElement2("UIStroke", v13, v14);
            v10.Icon = u2.createElement("ImageLabel", {
                SizeConstraint = "RelativeYY",
                BackgroundTransparency = 1,
                ZIndex = 2,
                Size = UDim2.fromScale(0.8, 0.8),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Image = u7.Icon
            });
            v10.Title = u2.createElement("TextLabel", {
                TextScaled = true,
                TextXAlignment = "Center",
                BackgroundTransparency = 1,
                ZIndex = 2,
                Text = u7.Title,
                Size = UDim2.fromScale(1.25, 0.45),
                Position = UDim2.fromScale(0.5, 1.45),
                AnchorPoint = Vector2.new(0.5, 1),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.ExtraBold)
            });

            return createElement("ImageButton", v9, v10);
        end;

        local v18 = table.create(#NavButtons);

        for i, v in NavButtons do
            v18[i] = v17(v, i - 1, NavButtons);
        end;

        local v19 = {
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0, -0.08)
        };
        local v20 = { u2.createElement(Padding, {
                Padding = {
                    Horizontal = 32
                }
            }), u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                Padding = UDim.new(0, 32)
            }) };
        local v21 = #v20;

        for i, v in v18 do
            v20[v21 + i] = v;
        end;

        v6.NavButtons = u2.createElement(Empty, v19, v20);
        v6.Background = u2.createElement("Frame", {
            BackgroundTransparency = 0.7,
            BorderSizePixel = 0,
            ZIndex = 1,
            Size = UDim2.fromScale(1, 0.75),
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        }, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 3)
            }) });

        return u2.createFragment({
            Navbar = u2.createElement(Empty, v5, v6)
        });
    end)
};