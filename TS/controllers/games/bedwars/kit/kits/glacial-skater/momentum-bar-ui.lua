-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ProgressBar = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ProgressBar;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local GlacialSkaterBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "glacial-skater", "glacial-skater-balance").GlacialSkaterBalance;
local u5 = v4.new();

return {
    momentumChanged = u5,
    MomentumBarUi = v3.new(u2)(function(p6, p7) -- Line: 10
        -- upvalues: u2 (copy), u1 (copy), u5 (copy), GlacialSkaterBalance (copy), ProgressBar (copy)
        local useEffect = p7.useEffect;
        local v8, u9 = p7.useState(0);
        local v10 = u2.createRef();
        useEffect(function() -- Line: 15
            -- upvalues: u1 (ref), u5 (ref), u9 (copy), GlacialSkaterBalance (ref)
            local u11 = u1.new();
            u11:GiveTask(u5:Connect(function(p12) -- Line: 17
                -- upvalues: u9 (ref), GlacialSkaterBalance (ref)
                u9(p12 / GlacialSkaterBalance.MAX_MOMENTUM);
            end));

            return function() -- Line: 20
                -- upvalues: u11 (copy)
                return u11:DoCleaning();
            end;
        end, {});

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
                Pills = 4,
                Progress = v8,
                BarRef = v10,
                BarColor = Color3.fromRGB(152, 193, 217)
            }) });
    end)
};