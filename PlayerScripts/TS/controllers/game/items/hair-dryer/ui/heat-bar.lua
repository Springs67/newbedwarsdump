-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ProgressBar = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ProgressBar;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;

return {
    HeatBar = v3.new(u2)(function(p4, p5) -- Line: 8
        -- upvalues: u2 (copy), u1 (copy), Players (copy), ProgressBar (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local u6, u7 = useState(0);
        local v8, u9 = useState(0.01);
        local v10 = u2.createRef();
        useEffect(function() -- Line: 14
            -- upvalues: u1 (ref), Players (ref), u7 (copy)
            local u11 = u1.new();
            local v12 = Players.LocalPlayer:GetAttribute("HairDryerHeat");
            u7(v12 == nil and 0 or v12);
            u11:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("HairDryerHeat"):Connect(function() -- Line: 22
                -- upvalues: Players (ref), u7 (ref)
                local v13 = Players.LocalPlayer:GetAttribute("HairDryerHeat");
                u7(v13 == nil and 0 or v13);
            end));

            return function() -- Line: 30
                -- upvalues: u11 (copy)
                return u11:DoCleaning();
            end;
        end, {});
        useEffect(function() -- Line: 34
            -- upvalues: u9 (copy), u6 (copy)
            u9(u6 / 100);
        end, { u6 });

        return u2.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.55, 0.15)
        }, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 12.441176470588236
            }), u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }), u2.createElement(ProgressBar, {
                LayoutOrder = 1,
                AcceptZero = true,
                Progress = v8,
                BarRef = v10,
                BarColor = Color3.fromRGB(181, 77, 28),
                Title = {
                    text = "Heat",
                    color = Color3.fromRGB(163, 212, 219)
                },
                Size = UDim2.fromScale(1, 1),
                BarGradient = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 122, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0)) })
            }) });
    end)
};