-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local v12 = v3.new(u2)(function(p5, p6) -- Line: 9
    -- upvalues: u2 (copy), u1 (copy), ColorUtil (copy), KnitClient (copy)
    local useEffect = p6.useEffect;
    local v7, u8 = p6.useState(12);
    local u9 = u2.createRef();
    useEffect(function() -- Line: 14
        -- upvalues: u9 (copy), u1 (ref), u8 (copy)
        local u10 = u9:getValue();

        if not u10 then
            return nil;
        end;

        local u11 = u1.new();
        u11:GiveTask(u10:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() -- Line: 20
            -- upvalues: u10 (copy), u8 (ref)
            u8(12 * (u10.AbsoluteSize.X / 357));
        end));
        u8(12 * (u10.AbsoluteSize.X / 357));

        return function() -- Line: 26
            -- upvalues: u11 (copy)
            u11:DoCleaning();
        end;
    end, {});

    return u2.createFragment({
        MurdererCredit = u2.createElement("ScreenGui", {
            ResetOnSpawn = false,
            DisplayOrder = 9
        }, {
            CreditContainer = u2.createElement("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.4, 0.125),
                Position = UDim2.fromScale(0.5, 0.72),
                AnchorPoint = Vector2.new(0.5, 0),
                BackgroundColor3 = ColorUtil.hexColor(11512224)
            }, {
                u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder
                }),
                u2.createElement("ImageLabel", {
                    Image = "rbxassetid://12740963468",
                    LayoutOrder = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(0.19, 1)
                }, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }), u2.createElement("ImageButton", {
                        Position = UDim2.fromScale(0.5, 0.71),
                        AnchorPoint = Vector2.new(0.5, 0),
                        BackgroundTransparency = 0.33,
                        Size = UDim2.fromScale(0.65, 0.21),
                        BorderSizePixel = 0,
                        BackgroundColor3 = ColorUtil.hexColor(5329233),

                        [u2.Event.MouseButton1Click] = function() -- Line: 63
                            -- upvalues: KnitClient (ref)
                            KnitClient.Controllers.MurdererCreditController:teleportToMurderMystery2();
                        end
                    }, { u2.createElement("UIStroke", {
                            Thickness = 1,
                            Color = ColorUtil.WHITE
                        }), u2.createElement("TextLabel", {
                            Text = "<b>PLAY</b>",
                            BackgroundTransparency = 1,
                            RichText = true,
                            TextScaled = true,
                            Position = UDim2.fromScale(0.5, 0.5),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Size = UDim2.fromScale(0.8, 0.5),
                            TextColor3 = ColorUtil.WHITE,
                            Font = Enum.Font.Roboto
                        }) }) }),
                u2.createElement("Frame", {
                    BorderSizePixel = 0,
                    LayoutOrder = 2,
                    BackgroundColor3 = ColorUtil.WHITE,
                    Size = UDim2.fromScale(0.8, 1)
                }, { u2.createElement("UIGradient", {
                        Color = ColorSequence.new(ColorUtil.hexColor(9242728), ColorUtil.hexColor(16738041)),
                        Transparency = NumberSequence.new(0.35, 1)
                    }), u2.createElement("UIStroke", {
                        Thickness = 1,
                        Color = ColorUtil.WHITE
                    }, { u2.createElement("UIGradient", {
                            Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, ColorUtil.hexColor(2415599)), ColorSequenceKeypoint.new(0.6, ColorUtil.hexColor(16711818)), ColorSequenceKeypoint.new(1, ColorUtil.hexColor(16711818)) }),
                            Transparency = NumberSequence.new({
                                NumberSequenceKeypoint.new(0, 1),
                                NumberSequenceKeypoint.new(0.01, 0),
                                NumberSequenceKeypoint.new(0.6, 0),
                                NumberSequenceKeypoint.new(1, 1)
                            })
                        }) }), u2.createElement("TextLabel", {
                        [u2.Ref] = u9,
                        Size = UDim2.fromScale(0.78, 0.8),
                        AnchorPoint = Vector2.new(0, 0.5),
                        BackgroundTransparency = 1,
                        Position = UDim2.fromScale(0.025, 0.5),
                        TextColor3 = ColorUtil.WHITE,
                        Text = "This limited mode was inspired by <b>Murder Mystery 2</b>!",
                        RichText = true,
                        TextSize = v7,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextWrapped = true
                    }) }),
                u2.createElement("Frame", {}, { u2.createElement("UIGradient") })
            })
        })
    });
end);

return {
    MurdererCreditApp = v4.connect(function(p13, p14) -- Line: 125
        local v15 = {};

        for i, v in p14 do
            v15[i] = v;
        end;

        return v15;
    end)(v12)
};