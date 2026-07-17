-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;

return {
    TournamentWinnerArrowBillboard = v2.new(u1)(function(p3, p4) -- Line: 7
        -- upvalues: u1 (copy), TweenService (copy), ColorUtil (copy)
        local _ = p4.useState;
        local useEffect = p4.useEffect;
        local u5 = u1.createRef();
        local u6 = u1.createRef();
        useEffect(function() -- Line: 12
            -- upvalues: u5 (copy), u6 (copy), TweenService (ref)
            local v7 = u5:getValue();
            local v8 = u6:getValue();

            if not (v7 and v8) then
                return nil;
            end;

            local u9 = TweenService:Create(v7, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                Position = UDim2.new(0.2, 0, 0.4, 0),
                Size = UDim2.new(0.15, 0, 0.5, 0)
            });
            local u10 = TweenService:Create(v7, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                Position = UDim2.new(0.1, 0, 0.3, 0),
                Size = UDim2.new(0.1, 0, 0.5, 0)
            });
            local u11 = TweenService:Create(v8, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                Position = UDim2.new(0.8, 0, 0.4, 0),
                Size = UDim2.new(0.15, 0, 0.5, 0)
            });
            local u12 = TweenService:Create(v8, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                Position = UDim2.new(0.9, 0, 0.3, 0),
                Size = UDim2.new(0.1, 0, 0.5, 0)
            });
            task.delay(0.2, function() -- Line: 34
                -- upvalues: u9 (copy), u11 (copy)
                u9:Play();
                u11:Play();
            end);
            u9.Completed:Connect(function() -- Line: 38
                -- upvalues: u10 (copy)
                u10:Play();
            end);
            u10.Completed:Connect(function() -- Line: 41
                -- upvalues: u9 (copy)
                u9:Play();
            end);
            u11.Completed:Connect(function() -- Line: 44
                -- upvalues: u12 (copy)
                u12:Play();
            end);
            u12.Completed:Connect(function() -- Line: 47
                -- upvalues: u11 (copy)
                u11:Play();
            end);
        end);

        return u1.createFragment({
            TournamentArrowGui = u1.createElement("BillboardGui", {
                Brightness = 2.8,
                Size = UDim2.fromScale(10, 10),
                Adornee = p3.Character.Head
            }, { u1.createElement("TextLabel", {
                    Size = UDim2.fromScale(0.1, 0.5),
                    Position = UDim2.fromScale(0.1, 0.3),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Text = "<b>➡</b>",
                    Font = "LuckiestGuy",
                    TextScaled = true,
                    RichText = true,
                    TextColor3 = ColorUtil.WHITE,
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    TextStrokeTransparency = 0,
                    Rotation = 45,
                    [u1.Ref] = u5
                }, { u1.createElement("UIGradient", {
                        Rotation = 90,
                        Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#f8e50a")), ColorSequenceKeypoint.new(1, Color3.fromHex("#f8023e")) })
                    }) }), u1.createElement("TextLabel", {
                    Size = UDim2.fromScale(0.1, 0.5),
                    Position = UDim2.fromScale(0.9, 0.3),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Text = "<b>➡</b>",
                    Font = "LuckiestGuy",
                    TextScaled = true,
                    RichText = true,
                    TextColor3 = ColorUtil.WHITE,
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    TextStrokeTransparency = 0,
                    Rotation = 135,
                    [u1.Ref] = u6
                }, { u1.createElement("UIGradient", {
                        Rotation = 90,
                        Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#f8e50a")), ColorSequenceKeypoint.new(1, Color3.fromHex("#f8023e")) })
                    }) }) })
        });
    end)
};