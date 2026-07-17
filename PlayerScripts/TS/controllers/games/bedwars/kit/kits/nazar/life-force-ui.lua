-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ProgressBar = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ProgressBar;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local LifeForceAttr = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes").LifeForceAttr;
local NazarKitBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "nazar", "nazar-kit-balance").NazarKitBalance;
local GetAttribute = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").GetAttribute;

return {
    LifeForceUi = v3.new(u2)(function(p4, p5) -- Line: 11
        -- upvalues: u2 (copy), u1 (copy), Players (copy), LifeForceAttr (copy), GetAttribute (copy), NazarKitBalance (copy), ProgressBar (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local u6, u7 = useState(0);
        local v8, u9 = useState(0.01);
        local v10 = u2.createRef();
        useEffect(function() -- Line: 17
            -- upvalues: u1 (ref), Players (ref), LifeForceAttr (ref), GetAttribute (ref), u7 (copy)
            local u11 = u1.new();
            u11:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal(LifeForceAttr.Name):Connect(function() -- Line: 19
                -- upvalues: GetAttribute (ref), Players (ref), LifeForceAttr (ref), u7 (ref)
                local v12 = GetAttribute(Players.LocalPlayer, LifeForceAttr);
                u7(v12 == nil and 0 or v12);
            end));

            return function() -- Line: 27
                -- upvalues: u11 (copy)
                return u11:DoCleaning();
            end;
        end, {});
        useEffect(function() -- Line: 31
            -- upvalues: u9 (copy), u6 (copy), NazarKitBalance (ref)
            u9(u6 / NazarKitBalance.MAX_STORED_LIFE_FORCE);
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
                BarRef = v10
            }) });
    end)
};