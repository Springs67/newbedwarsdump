-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local EnchantRuneWheel = RuntimeLib.import(script, script.Parent, "enchant-rune-wheel").EnchantRuneWheel;

return {
    EnchantShowCase = v2.new(u1)(function(p3, p4) -- Line: 9
        -- upvalues: BedwarsImageId (copy), u1 (copy), TweenService (copy), Empty (copy), EnchantRuneWheel (copy)
        local useEffect = p4.useEffect;
        local ENCHANTING_TABLE = BedwarsImageId.ENCHANTING_TABLE;
        local u5 = u1.createRef();
        useEffect(function() -- Line: 13
            -- upvalues: u5 (copy), TweenService (ref)
            local v6 = u5:getValue();

            if v6 then
                TweenService:Create(v6, TweenInfo.new(1.25, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, true), {
                    Position = UDim2.fromScale(0.5, 0.475)
                }):Play();
            end;
        end, {});

        return u1.createElement(Empty, {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = p3.Size,
            LayoutOrder = p3.LayoutOrder
        }, {
            u1.createElement(EnchantRuneWheel, {
                RuneTransparency = 0.4,
                Color = p3.ThemeColor,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5)
            }),
            EnchantTableRender = u1.createElement("ImageLabel", {
                Image = ENCHANTING_TABLE,
                Size = UDim2.fromScale(0.95, 0.95),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.525),
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                [u1.Ref] = u5
            })
        });
    end)
};