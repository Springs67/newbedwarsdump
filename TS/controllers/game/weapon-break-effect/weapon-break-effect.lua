-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;

return {
    WeaponBreakEffect = v2.new(u1)(function(p3, p4) -- Line: 7
        -- upvalues: u1 (copy), TweenService (copy), Empty (copy)
        local _ = p4.useState;
        local useEffect = p4.useEffect;
        local u5 = u1.createRef();
        local u6 = u1.createRef();
        useEffect(function() -- Line: 12
            -- upvalues: u5 (copy), u6 (copy), TweenService (ref)
            local v7 = u5:getValue();
            local v8 = u6:getValue();

            if v7 and v8 then
                local v9 = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
                local u10 = TweenService:Create(v7, v9, {
                    Rotation = -20,
                    Position = UDim2.new(0.3, 0, 0.5, 0)
                });
                local u11 = TweenService:Create(v8, v9, {
                    Rotation = 35,
                    Position = UDim2.new(0.7, 0, 0.5, 0)
                });
                task.delay(0.1, function() -- Line: 26
                    -- upvalues: u10 (copy), u11 (copy)
                    u10:Play();
                    u11:Play();
                end);
            end;
        end, {});

        return u1.createFragment({
            WeaponBreakEffect = u1.createElement("ScreenGui", {}, { u1.createElement(Empty, {
                    Size = UDim2.fromScale(0.15, 0.15),
                    Position = UDim2.fromScale(0.42, 0.7)
                }, {
                    WeaponBreakEffect1 = u1.createElement("ImageLabel", {
                        [u1.Ref] = u5,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        Size = UDim2.fromScale(1, 1),
                        SizeConstraint = "RelativeYY",
                        BackgroundTransparency = 1,
                        Image = p3.WeaponImage,
                        ImageTransparency = 0,
                        ZIndex = 10
                    }, { u1.createElement("UIGradient", {
                            Rotation = 0,
                            Transparency = NumberSequence.new({
                                NumberSequenceKeypoint.new(0, 0),
                                NumberSequenceKeypoint.new(0.48, 0),
                                NumberSequenceKeypoint.new(0.5, 1),
                                NumberSequenceKeypoint.new(1, 1)
                            })
                        }) }),
                    WeaponBreakEffect2 = u1.createElement("ImageLabel", {
                        [u1.Ref] = u6,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        Size = UDim2.fromScale(1, 1),
                        SizeConstraint = "RelativeYY",
                        BackgroundTransparency = 1,
                        Image = p3.WeaponImage,
                        ImageTransparency = 0,
                        ZIndex = 10
                    }, { u1.createElement("UIGradient", {
                            Rotation = 0,
                            Transparency = NumberSequence.new({
                                NumberSequenceKeypoint.new(0, 1),
                                NumberSequenceKeypoint.new(0.48, 1),
                                NumberSequenceKeypoint.new(0.5, 0),
                                NumberSequenceKeypoint.new(1, 0)
                            })
                        }) })
                }) })
        });
    end)
};