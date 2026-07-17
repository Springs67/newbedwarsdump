-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "kit", "oasis", "oasis-constants");
local OasisTargetIndicator = v3.OasisTargetIndicator;
local OasisVesselMode = v3.OasisVesselMode;

return {
    OasisVesselModeUi = v2.new(u1)(function(p4, p5) -- Line: 8
        -- upvalues: u1 (copy), OasisTargetIndicator (copy), OasisVesselMode (copy)
        local _ = p5.useState;

        return u1.createFragment({
            OasisModeIndicator = u1.createElement("Frame", {
                BackgroundTransparency = 0.5,
                Size = UDim2.fromScale(0.15, 1),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            }, {
                u1.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 8)
                }),
                u1.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 3.667
                }),
                u1.createElement(
                    "UIListLayout",
                    {
                        FillDirection = "Horizontal",
                        HorizontalAlignment = "Center",
                        VerticalAlignment = "Center",
                        SortOrder = "LayoutOrder"
                    }
                ),
                u1.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 1),
                    Image = OasisTargetIndicator[p4.mode].Icon
                }, { u1.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) }),
                u1.createElement("TextLabel", {
                    Font = "RobotoCondensed",
                    RichText = true,
                    TextScaled = true,
                    TextXAlignment = "Left",
                    TextYAlignment = "Center",
                    BackgroundTransparency = 1,
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(1, 1),
                    Text = "<b>" .. (p4.mode == OasisVesselMode.HEAL and "HEAL" or "BUFF") .. "</b>",
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                }, { u1.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1.3
                    }) })
            })
        });
    end)
};