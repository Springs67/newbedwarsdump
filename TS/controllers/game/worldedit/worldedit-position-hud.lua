-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    WorldToolPositionHUD = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u1)(function(p2, p3) -- Line: 6
        -- upvalues: u1 (copy), ColorUtil (copy)
        return u1.createFragment({
            WorldEditPositionGUI = u1.createElement("ScreenGui", {
                ResetOnSpawn = false
            }, {
                WorldEditPositionFrame = u1.createElement("Frame", {
                    BackgroundTransparency = 0.35,
                    Size = UDim2.fromScale(0.1, 0.1),
                    Position = UDim2.fromScale(1, 0.8),
                    AnchorPoint = Vector2.new(1, 1),
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                }, {
                    u1.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0.02, 0),
                        PaddingRight = UDim.new(0.02, 0)
                    }),
                    u1.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 3)
                    }),
                    Label = u1.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        TextXAlignment = "Left",
                        RichText = true,
                        TextScaled = true,
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        Text = p2.Label,
                        Font = Enum.Font.ArialBold,
                        Size = UDim2.fromScale(1, 0.25),
                        Position = UDim2.fromScale(0, 0),
                        AnchorPoint = Vector2.new(0, 0)
                    }, { u1.createElement("UITextSizeConstraint", {
                            MaxTextSize = 16
                        }) }),
                    Pos1Display = u1.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        TextXAlignment = "Left",
                        RichText = true,
                        TextScaled = true,
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        Text = "<font color=\"" .. ColorUtil.richTextColor(p2.Pos1Color) .. "\">POS1:</font> (" .. tostring(p2.Pos1 or "Unset") .. ")",
                        Font = Enum.Font.Arial,
                        Size = UDim2.fromScale(1, 0.25),
                        Position = UDim2.fromScale(0, 0.25),
                        AnchorPoint = Vector2.new(0, 0)
                    }, { u1.createElement("UITextSizeConstraint", {
                            MaxTextSize = 16
                        }) }),
                    Pos2Display = u1.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        TextXAlignment = "Left",
                        RichText = true,
                        TextScaled = true,
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        Text = "<font color=\"" .. ColorUtil.richTextColor(p2.Pos2Color) .. "\">POS2:</font> (" .. tostring(p2.Pos2 or "Unset") .. ")",
                        Font = Enum.Font.Arial,
                        Size = UDim2.fromScale(1, 0.25),
                        Position = UDim2.fromScale(0, 0.5),
                        AnchorPoint = Vector2.new(0, 0)
                    }, { u1.createElement("UITextSizeConstraint", {
                            MaxTextSize = 16
                        }) }),
                    SizeDisplay = u1.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        TextXAlignment = "Left",
                        RichText = true,
                        TextScaled = true,
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        Text = "<font color=\"" .. ColorUtil.richTextColor(p2.SizeColor) .. "\">SIZE:</font> (" .. tostring(p2.Size or "Unset") .. ")",
                        Font = Enum.Font.Arial,
                        Size = UDim2.fromScale(1, 0.25),
                        Position = UDim2.fromScale(0, 0.75),
                        AnchorPoint = Vector2.new(0, 0)
                    }, { u1.createElement("UITextSizeConstraint", {
                            MaxTextSize = 16
                        }) })
                })
            })
        });
    end)
};