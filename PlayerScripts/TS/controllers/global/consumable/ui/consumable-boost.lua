-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local Countdown = v1.Countdown;
local StringUtil = v1.StringUtil;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getConsumableMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-type-meta").getConsumableMeta;

return {
    ConsumableBoost = v3.new(u2)(function(p4, p5) -- Line: 12
        -- upvalues: getConsumableMeta (copy), ColorUtil (copy), u2 (copy), Countdown (copy), AutoSizedText (copy), StringUtil (copy), TooltipContainer (copy)
        local _ = p5.useState;
        local v6 = getConsumableMeta(p4.Consumable.consumable);
        local v7 = {
            SizeConstraint = "RelativeYY",
            BackgroundTransparency = 0.3,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = ColorUtil.BLACK
        };
        local v8 = { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }), u2.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), u2.createElement("ImageLabel", {
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.7, 0.7),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Image = v6.image
            }) };
        local v9 = #v8;
        local v10;

        if p4.Consumable.matchUsesLeft == nil then
            v10 = false;
        else
            v10 = u2.createElement("Frame", {
                BorderSizePixel = 0,
                Size = UDim2.fromScale(0.4, 0.4),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.9, 0.9),
                BackgroundColor3 = Color3.fromRGB(2, 135, 236)
            }, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }), u2.createElement("TextLabel", {
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.7, 0.7),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Text = "x" .. tostring(p4.Consumable.matchUsesLeft),
                    TextColor3 = ColorUtil.WHITE,
                    FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
                }) });
        end;

        if v10 then
            v8[v9 + 1] = v10;
        end;

        local v11 = #v8;
        local v12;

        if p4.Consumable.endTime == nil then
            v12 = false;
        else
            v12 = u2.createElement(Countdown, {
                TextLabel = {
                    Size = UDim2.fromScale(0.7, 0.6),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5)
                },
                CountdownConfig = {
                    days = false
                },
                EndTime = p4.Consumable.endTime
            });
        end;

        if v12 then
            v8[v11 + 1] = v12;
        end;

        local v13 = { u2.createElement(AutoSizedText, {
                TextSize = 16,
                Text = v6.displayName,
                Font = Enum.Font.SourceSansBold,
                Limits = Vector2.new(300, 60)
            }) };
        local v14 = #v13;
        local v15;

        if p4.Consumable.endTime == nil then
            v15 = false;
        else
            v15 = u2.createElement(AutoSizedText, {
                TextSize = 14,
                Text = StringUtil.fromNow(p4.Consumable.endTime, {
                    hideIfZero = true
                }),
                Font = Enum.Font.SourceSans,
                TextColor3 = Color3.fromRGB(2, 135, 236),
                Limits = Vector2.new(300, 60)
            });
        end;

        if v15 then
            v13[v14 + 1] = v15;
        end;

        local v16 = #v13;
        local v17;

        if p4.Consumable.matchUsesLeft == nil then
            v17 = false;
        else
            v17 = u2.createElement(AutoSizedText, {
                TextSize = 14,
                Text = tostring(p4.Consumable.matchUsesLeft) .. " Match Uses Left",
                Font = Enum.Font.SourceSans,
                TextColor3 = Color3.fromRGB(2, 135, 236),
                Limits = Vector2.new(300, 60)
            });
        end;

        if v17 then
            v13[v16 + 1] = v17;
        end;

        local v18 = #v13;
        local v19;

        if v6.description == nil then
            v19 = false;
        else
            v19 = u2.createElement(AutoSizedText, {
                TextSize = 14,
                Text = v6.description,
                Font = Enum.Font.SourceSans,
                TextColor3 = Color3.fromRGB(191, 191, 191),
                Limits = Vector2.new(300, 60)
            });
        end;

        if v19 then
            v13[v18 + 1] = v19;
        end;

        v8[#v8 + 1] = u2.createElement(TooltipContainer, {}, v13);

        return u2.createElement("Frame", v7, v8);
    end)
};