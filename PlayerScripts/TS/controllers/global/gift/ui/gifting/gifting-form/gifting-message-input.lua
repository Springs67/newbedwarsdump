-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local TextBoxCharacterCounter = RuntimeLib.import(script, script.Parent, "text-box-character-counter").TextBoxCharacterCounter;

return {
    GiftingMessageInput = v2.new(u1)(function(u3, p4) -- Line: 8
        -- upvalues: u1 (copy), ColorUtil (copy), Theme (copy), TextBoxCharacterCounter (copy)
        local _ = p4.useState;
        local _ = p4.useEffect;
        local v5 = u1.createRef();

        return u1.createElement("Frame", {
            BackgroundTransparency = 1,
            Size = u3.Size,
            LayoutOrder = u3.LayoutOrder
        }, {
            u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 6)
            }),
            u1.createElement("TextLabel", {
                Text = "Message",
                TextTransparency = 0.3,
                RichText = true,
                TextSize = 20,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.new(1, 0, 0.13, 0),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
                TextColor3 = ColorUtil.WHITE,
                Font = Enum.Font.Roboto
            }),
            u1.createElement("Frame", {
                BorderSizePixel = 0,
                LayoutOrder = 2,
                BackgroundColor3 = Theme.backgroundTertiary,
                Size = UDim2.fromScale(1, 0.7)
            }, { u1.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 5)
                }), u1.createElement("TextBox", {
                    Size = UDim2.fromScale(1, 1),
                    Text = "",
                    PlaceholderText = "message",
                    BackgroundTransparency = 1,
                    BackgroundColor3 = Theme.backgroundTertiary,
                    BorderSizePixel = 0,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Top,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    PlaceholderColor3 = Color3.fromRGB(107, 110, 136),
                    MultiLine = true,
                    TextWrapped = true,
                    TextSize = 20,
                    Font = Enum.Font.Roboto,
                    ClearTextOnFocus = false,
                    [u1.Ref] = v5,
                    AutoLocalize = false,

                    [u1.Change.Text] = function(p6) -- Line: 13
                        -- upvalues: u3 (copy)
                        if #p6.Text > 100 then
                            p6.Text = string.sub(p6.Text, 0, 100);

                            return nil;
                        end;

                        u3.SetMessage(p6.Text);
                    end
                }, { u1.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 8),
                        PaddingBottom = UDim.new(0, 8),
                        PaddingLeft = UDim.new(0, 12),
                        PaddingRight = UDim.new(0, 12)
                    }) }) }),
            u1.createElement(TextBoxCharacterCounter, {
                MaxCharCount = 100,
                LayoutOrder = 3,
                TextBox = v5
            })
        });
    end)
};