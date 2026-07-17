-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local useSpring = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-spring", "src").useSpring;

return {
    EnemyHealthbar = v2.new(u1)(function(u3, p4) -- Line: 6
        -- upvalues: useSpring (copy), u1 (copy)
        local u5 = p4.useMemo(function() -- Line: 7
            -- upvalues: u3 (copy)
            return u3.health / u3.maxHealth;
        end, { u3.health, u3.maxHealth });
        local v6 = p4.useMemo(function() -- Line: 10
            -- upvalues: u5 (copy)
            return 1 / u5;
        end, { u5 });
        local v7 = useSpring(p4, {
            config = {
                tension = 440,
                friction = 26,
                mass = 0.6
            },
            to = {
                size1 = UDim2.fromScale(u5, 1),
                size2 = UDim2.fromScale(v6, 1)
            }
        }, { u5, v6 });
        local createElement = u1.createElement;
        local v8 = {
            BackgroundTransparency = 0.7,
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        };
        local v9 = {};
        local v10 = u1.createElement("UIAspectRatioConstraint", {
            AspectRatio = 7.138613861386139
        });
        local v11 = u1.createElement("UIStroke", {
            Thickness = 4,
            Color = Color3.fromRGB(255, 255, 255)
        });
        local v12 = u1.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        });
        local v13 = u1.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(150, 150)
        });
        local v14 = u1.createElement("Frame", {
            ClipsDescendants = true,
            BackgroundTransparency = 1,
            Size = v7.size1,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0, 0.5)
        }, { u1.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 0.5),
                Size = v7.size2,
                Position = UDim2.fromScale(0, 0.5),
                BackgroundColor3 = Color3.fromRGB(238, 114, 0)
            }, { u1.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }) }) });
        local createElement2 = u1.createElement;
        local v15 = {
            TextScaled = true,
            RichText = true,
            BackgroundTransparency = 1,
            Font = "RobotoCondensed",
            ZIndex = 2,
            Size = UDim2.fromScale(0.8, 0.8),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local v16 = math.round(u3.health);
        local v17 = tostring(v16);
        local v18 = math.round(u3.maxHealth);
        v15.Text = "<b>" .. v17 .. "/" .. tostring(v18) .. "</b>";
        v15.TextColor3 = Color3.fromRGB(255, 255, 255);
        v9[1], v9[2], v9[3], v9[4], v9[5], v9[6] = v10, v11, v12, v13, v14, createElement2("TextLabel", v15);

        return createElement("Frame", v8, v9);
    end)
};