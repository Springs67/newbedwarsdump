-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local CircularProgress = v1.CircularProgress;
local Empty = v1.Empty;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local SurvivalConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "survival", "survival-constants").SurvivalConstants;

return {
    SurvivalComboUi = v3.new(u2)(function(p4, p5) -- Line: 12
        -- upvalues: SurvivalConstants (copy), u2 (copy), BedwarsImageId (copy), CircularProgress (copy), TooltipContainer (copy), AutoSizedText (copy), Empty (copy)
        local _ = p5.useEffect;
        local _ = p5.useState;
        local v6 = p4.Chain >= SurvivalConstants.COMBO_BOOST_AMOUNT;
        local v7 = {
            DisplayOrder = 10,
            ResetOnSpawn = false
        };
        local v8 = {};
        local v9 = {
            Size = UDim2.fromScale(0.13, 0.13),
            Position = UDim2.new(0.8, 0, 0.1, 0)
        };
        local v10 = { (u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1.5
            })) };
        local createElement = u2.createElement;
        local v11 = {
            ImageTransparency = 0,
            ScaleType = "Fit",
            BackgroundTransparency = 1,
            ZIndex = 9,
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Image = BedwarsImageId.CIRCLE_PROGRESS_BAR
        };
        local v12;

        if v6 then
            v12 = Color3.fromRGB(255, 179, 79);
        else
            v12 = Color3.fromRGB(255, 242, 79);
        end;

        v11.ImageColor3 = v12;
        v10.BackgroundCircle = createElement("ImageLabel", v11);
        v10[2] = u2.createElement(CircularProgress, {
    Progress = 0,
    ZIndex = 10,
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.5),
    Color = Color3.fromRGB(102, 102, 102),
    Duration = SurvivalConstants.COMBO_COOLDOWN
});
        local createElement2 = u2.createElement;
        local v13 = {
            BackgroundTransparency = 1,
            TextScaled = true,
            Size = UDim2.fromScale(0.5, 0.6),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.45),
            Text = tostring(p4.Chain),
            Font = Enum.Font.GothamBold
        };
        local v14;

        if v6 then
            v14 = Color3.fromRGB(255, 242, 79);
        else
            v14 = Color3.fromRGB(255, 255, 255);
        end;

        v13.TextColor3 = v14;
        local v15 = {};
        local createElement3 = u2.createElement;
        local v16 = {};
        local v17;

        if v6 then
            v17 = Color3.fromRGB(138, 92, 5);
        else
            v17 = Color3.fromRGB(0, 0, 0);
        end;

        v16.Color = v17;
        v15[1] = createElement3("UIStroke", v16);
        v10.ChainCount = createElement2("TextLabel", v13, v15);
        local createElement4 = u2.createElement;
        local v18 = {
            Text = "STREAK",
            TextScaled = true,
            BackgroundTransparency = 1,
            ZIndex = 11,
            Size = UDim2.fromScale(0.4, 0.2),
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.5, 0.6)
        };
        local v19;

        if v6 then
            v19 = Color3.fromRGB(255, 242, 79);
        else
            v19 = Color3.fromRGB(255, 255, 255);
        end;

        v18.TextColor3 = v19;
        v18.Font = Enum.Font.GothamBold;
        local v20 = {};
        local createElement5 = u2.createElement;
        local v21 = {};
        local v22;

        if v6 then
            v22 = Color3.fromRGB(138, 92, 5);
        else
            v22 = Color3.fromRGB(0, 0, 0);
        end;

        v21.Color = v22;
        v20[1] = createElement5("UIStroke", v21);
        v10.StreakText = createElement4("TextLabel", v18, v20);
        local v23 = #v10;

        if v6 then
            v6 = u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                    Text = "ON FIRE! Deal increased damage!",
                    TextSize = 16,
                    Font = Enum.Font.SourceSansBold,
                    Limits = Vector2.new(300, 60)
                }) });
        end;

        if v6 then
            v10[v23 + 1] = v6;
        end;

        v8[#v8 + 1] = u2.createElement(Empty, v9, v10);

        return u2.createFragment({
            SurvivalComboUi = u2.createElement("ScreenGui", v7, v8)
        });
    end)
};