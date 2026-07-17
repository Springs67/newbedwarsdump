-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local MurdererBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "murderer-game", "murderer-balance").MurdererBalance;

return {
    MurderCoinDisplay = v2.new(u1)(function(p3, p4) -- Line: 8
        -- upvalues: u1 (copy), BedwarsImageId (copy), ColorUtil (copy), MurdererBalance (copy)
        local _ = p4.useState;

        return u1.createFragment({
            MurderCoinDisplay = u1.createElement("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.3, 1)
            }, {
                u1.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 4
                }),
                u1.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center",
                    Padding = UDim.new(0, 4)
                }),
                u1.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 0.8),
                    Image = BedwarsImageId.COIN,
                    ScaleType = Enum.ScaleType.Fit
                }, { u1.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) }),
                u1.createElement("TextLabel", {
                    Font = "LuckiestGuy",
                    RichText = true,
                    TextScaled = true,
                    TextXAlignment = "Left",
                    TextYAlignment = "Center",
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.8, 0.8),
                    Text = tostring(p3.coins) .. "<font color=\"" .. ColorUtil.richTextColor(Color3.fromRGB(189, 189, 189)) .. "\">/" .. tostring(MurdererBalance.CRATE_COST) .. "</font>",
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                })
            })
        });
    end)
};