-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ProgressBar = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ProgressBar;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local WarriorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "warrior", "warrior-kit-util").WarriorUtil;

return {
    WarriorGritBar = v3.new(u2)(function(p4, p5) -- Line: 9
        -- upvalues: u2 (copy), u1 (copy), Players (copy), WarriorUtil (copy), ProgressBar (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local u6, u7 = useState(0);
        local v8, u9 = useState(0.01);
        local v10 = u2.createRef();
        useEffect(function() -- Line: 15
            -- upvalues: u1 (ref), Players (ref), WarriorUtil (ref), u7 (copy)
            local u11 = u1.new();
            u11:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal(WarriorUtil.GRIT_ATTRIBUTE):Connect(function() -- Line: 17
                -- upvalues: Players (ref), WarriorUtil (ref), u7 (ref)
                local v12 = Players.LocalPlayer:GetAttribute(WarriorUtil.GRIT_ATTRIBUTE);
                u7(v12 == nil and 0 or v12);
            end));

            return function() -- Line: 25
                -- upvalues: u11 (copy)
                return u11:DoCleaning();
            end;
        end, {});
        useEffect(function() -- Line: 29
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
            }), u2.createElement("Frame", {
                BorderSizePixel = 0,
                ZIndex = 10,
                AnchorPoint = Vector2.new(0.5, 0.1),
                Position = UDim2.new(0.5, 0, 0, 0),
                Size = UDim2.new(0, 3, 0.9, 0),
                BackgroundColor3 = Color3.fromRGB(84, 84, 84)
            }), u2.createElement(ProgressBar, {
                LayoutOrder = 1,
                AcceptZero = true,
                Progress = v8,
                BarRef = v10,
                BarColor = Color3.fromRGB(250, 255, 0),
                Size = UDim2.fromScale(1, 1),
                ChangingBarColor = {
                    MinBarColor = Color3.fromRGB(250, 255, 0),
                    MaxBarColor = Color3.fromRGB(255, 61, 61)
                }
            }) });
    end)
};