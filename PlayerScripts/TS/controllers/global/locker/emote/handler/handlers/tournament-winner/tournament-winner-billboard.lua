-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;

return {
    TournamentWinnerBillboard = v2.new(u1)(function(p3, p4) -- Line: 7
        -- upvalues: u1 (copy), TweenService (copy), ColorUtil (copy)
        local _ = p4.useState;
        local useEffect = p4.useEffect;
        local u5 = u1.createRef();
        useEffect(function() -- Line: 11
            -- upvalues: u5 (copy), TweenService (ref)
            local v6 = u5:getValue();

            if not v6 then
                return nil;
            end;

            local u7 = TweenService:Create(v6, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                Size = UDim2.new(8, 0, 1.1, 0)
            });
            local u8 = TweenService:Create(v6, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                Size = UDim2.new(6, 0, 0.8, 0)
            });
            u7:Play();
            u7.Completed:Connect(function() -- Line: 23
                -- upvalues: u8 (copy)
                u8:Play();
            end);
            u8.Completed:Connect(function() -- Line: 26
                -- upvalues: u7 (copy)
                u7:Play();
            end);
        end, {});

        return u1.createFragment({
            TournamentEmoteGui = u1.createElement("BillboardGui", {
                Size = UDim2.fromScale(6, 0.8),
                StudsOffsetWorldSpace = Vector3.new(0, 3, 0),
                Adornee = p3.Character.Head,
                Brightness = 2.8,
                [u1.Ref] = u5
            }, { u1.createElement("TextLabel", {
                    Text = "<b>Champion</b>",
                    Font = "LuckiestGuy",
                    TextScaled = true,
                    RichText = true,
                    BackgroundTransparency = 1,
                    TextStrokeTransparency = 0,
                    Size = UDim2.fromScale(1, 1),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    TextColor3 = ColorUtil.WHITE,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center
                }, { u1.createElement("UIGradient", {
                        Rotation = 90,
                        Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#f8e50a")), ColorSequenceKeypoint.new(1, Color3.fromHex("#f8023e")) })
                    }) }) })
        });
    end)
};