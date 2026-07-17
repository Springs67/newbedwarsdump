-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;

return {
    EnchantRuneWheel = v2.new(u1)(function(p3, p4) -- Line: 7
        -- upvalues: u1 (copy), TweenService (copy), Empty (copy)
        local useEffect = p4.useEffect;
        local v5 = {};

        for i, v in p3 do
            v5[i] = v;
        end;

        v5.Color = nil;
        v5.RuneTransparency = nil;
        v5.RuneSize = nil;
        local v6 = p3.Color or Color3.fromRGB(242, 156, 48);
        local RuneTransparency = p3.RuneTransparency;
        local v7 = RuneTransparency == nil and 0.6 or RuneTransparency;
        local v8 = p3.RuneSize or UDim2.fromScale(1, 1);
        local u9 = u1.createRef();
        local u10 = u1.createRef();
        local u11 = u1.createRef();
        local u12 = u1.createRef();
        local v13 = u1.createRef();
        useEffect(function() -- Line: 29
            -- upvalues: u9 (copy), u10 (copy), u11 (copy), u12 (copy), TweenService (ref)
            local v14 = u9:getValue();
            local v15 = u10:getValue();
            local v16 = u11:getValue();
            local v17 = u12:getValue();

            if v14 then
                TweenService:Create(v14, TweenInfo.new(20, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
                    Rotation = 180
                }):Play();
            end;

            if v15 then
                TweenService:Create(v15, TweenInfo.new(12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
                    Rotation = 180
                }):Play();
            end;

            if v16 then
                TweenService:Create(v16, TweenInfo.new(16, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
                    Rotation = -180
                }):Play();
            end;

            if v17 then
                TweenService:Create(v17, TweenInfo.new(18, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
                    Rotation = -180
                }):Play();
            end;
        end, {});
        local v18 = {};

        for i, v in v5 do
            v18[i] = v;
        end;

        return u1.createElement(Empty, v18, {
            OuterRuneWheel = u1.createElement("ImageLabel", {
                Image = "rbxassetid://8247934954",
                Size = v8,
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                ImageColor3 = v6,
                ImageTransparency = v7,
                [u1.Ref] = u9
            }),
            Square = u1.createElement("ImageLabel", {
                Image = "rbxassetid://8247934767",
                Size = v8,
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                ImageColor3 = v6,
                ImageTransparency = v7,
                [u1.Ref] = u10
            }),
            SquareDiamond = u1.createElement("ImageLabel", {
                Image = "rbxassetid://8247934648",
                Size = v8,
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                ImageColor3 = v6,
                ImageTransparency = v7,
                [u1.Ref] = u11
            }),
            InnerRuneWheel = u1.createElement("ImageLabel", {
                Image = "rbxassetid://8247934516",
                Size = v8,
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                ImageColor3 = v6,
                ImageTransparency = v7,
                [u1.Ref] = u12
            }),
            CenterPiece = u1.createElement("ImageLabel", {
                Image = "rbxassetid://8247934380",
                Size = v8,
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                ImageColor3 = v6,
                ImageTransparency = v7,
                [u1.Ref] = v13
            })
        });
    end)
};