-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local GameTheme = v1.GameTheme;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TournamentAppEmoteGrid = RuntimeLib.import(script, script.Parent, "tournament-app-emote-grid").TournamentAppEmoteGrid;

return {
    TournamentAppEmotePopup = v3.new(u2)(function(u4, p5) -- Line: 9
        -- upvalues: u2 (copy), GameTheme (copy), ColorUtil (copy), TournamentAppEmoteGrid (copy)
        local _ = p5.useState;
        local _ = p5.useEffect;

        return u2.createFragment({
            EmotePopup = u2.createElement("Frame", {
                BorderSizePixel = 0,
                ZIndex = 4,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.55),
                Size = UDim2.fromScale(0.9, 1),
                BackgroundColor3 = Color3.fromHex("#6467A7")
            }, {
                EmotePopupHeader = u2.createElement("Frame", {
                    BorderSizePixel = 0,
                    ZIndex = 4,
                    Size = UDim2.fromScale(1, 0.1),
                    BackgroundColor3 = Color3.fromHex("#403E74")
                }, {
                    EmotePopupTitle = u2.createElement("TextLabel", {
                        Text = "<b>Select a Team Icon</b>",
                        TextScaled = true,
                        RichText = true,
                        Font = "Roboto",
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        ZIndex = 4,
                        AnchorPoint = Vector2.new(0, 0.5),
                        Position = UDim2.fromScale(0.03, 0.5),
                        Size = UDim2.fromScale(0.9, 0.7),
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextXAlignment = Enum.TextXAlignment.Left
                    }),
                    u2.createElement("TextButton", {
                        AnchorPoint = Vector2.new(1, 0.5),
                        Position = UDim2.new(1, -15, 0.5, 0),
                        Size = UDim2.fromOffset(28, 28),
                        BackgroundColor3 = GameTheme.backgroundPrimary,
                        Text = "",

                        [u2.Event.Activated] = function() -- Line: 47
                            -- upvalues: u4 (copy)
                            return u4.onClose();
                        end,

                        ZIndex = 4
                    }, { u2.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        }), u2.createElement("TextLabel", {
                            Text = "<b>X</b>",
                            Font = "Arial",
                            TextScaled = true,
                            RichText = true,
                            BackgroundTransparency = 1,
                            LayoutOrder = 1,
                            ZIndex = 4,
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Position = UDim2.fromScale(0.5, 0.5),
                            Size = UDim2.fromScale(0.7, 0.7),
                            TextColor3 = ColorUtil.WHITE
                        }) })
                }),
                EmotePopupContent = u2.createElement("Frame", {
                    BackgroundTransparency = 1,
                    ZIndex = 4,
                    Size = UDim2.fromScale(1, 0.9),
                    Position = UDim2.fromScale(0, 0.1)
                }, { u2.createElement(TournamentAppEmoteGrid, {
                        onClose = function() -- Line: 77, Name: onClose
                            -- upvalues: u4 (copy)
                            return u4.onClose();
                        end,

                        onSetIcon = u4.onSetIcon
                    }) })
            })
        });
    end)
};