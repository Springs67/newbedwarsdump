-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ProgressBar = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ProgressBar;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local WaterType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "water-gun", "water-gun-util").WaterType;
local WATER_ATTRIBUTE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "water-guns", "water-gun-util").WATER_ATTRIBUTE;

return {
    WaterBar = v3.new(u2)(function(p4, p5) -- Line: 10
        -- upvalues: u2 (copy), Players (copy), WaterType (copy), u1 (copy), WATER_ATTRIBUTE (copy), ProgressBar (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local u6, u7 = useState(0);
        local v8, u9 = useState(0.01);
        local v10 = u2.createRef();
        local v11 = Players.LocalPlayer:GetAttribute("WaterType");

        if v11 == nil then
            v11 = WaterType.DEFAULT;
        end;

        local v12, u13 = useState(v11);
        useEffect(function() -- Line: 21
            -- upvalues: u1 (ref), Players (ref), WATER_ATTRIBUTE (ref), u7 (copy), WaterType (ref), u13 (copy), u9 (copy)
            local u14 = u1.new();
            local v15 = Players.LocalPlayer:GetAttribute(WATER_ATTRIBUTE);
            u7(v15 == nil and 0 or v15);
            u14:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal(WATER_ATTRIBUTE):Connect(function() -- Line: 29
                -- upvalues: Players (ref), WATER_ATTRIBUTE (ref), u7 (ref), WaterType (ref), u13 (ref)
                local v16 = Players.LocalPlayer:GetAttribute(WATER_ATTRIBUTE);
                u7(v16 == nil and 0 or v16);
                local v17 = Players.LocalPlayer:GetAttribute("WaterType");

                if v17 == nil then
                    v17 = WaterType.DEFAULT;
                end;

                u13(v17);
            end));
            u14:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("WATER_CAPACITY"):Connect(function() -- Line: 43
                -- upvalues: Players (ref), WATER_ATTRIBUTE (ref), u9 (ref), u7 (ref)
                local v18 = Players.LocalPlayer:GetAttribute(WATER_ATTRIBUTE);
                local v19 = v18 == nil and 0 or v18;
                local v20 = Players.LocalPlayer:GetAttribute("WATER_CAPACITY");
                u9(v19 / (v20 == nil and 100 or v20));
                u7(v19);
            end));

            return function() -- Line: 57
                -- upvalues: u14 (copy)
                return u14:DoCleaning();
            end;
        end, {});
        useEffect(function() -- Line: 61
            -- upvalues: Players (ref), u9 (copy), u6 (copy)
            local v21 = Players.LocalPlayer:GetAttribute("WATER_CAPACITY");
            u9(u6 / (v21 == nil and 100 or v21));
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
                BarColor = Color3.fromRGB(28, 99, 181),
                Title = {
                    text = v12 == WaterType.FROSTY and "Ice Water" or (v12 == WaterType.SLIME and "Slime Liquid" or "Water"),
                    color = Color3.fromRGB(163, 212, 219)
                },
                Size = UDim2.fromScale(1, 1)
            }) });
    end)
};