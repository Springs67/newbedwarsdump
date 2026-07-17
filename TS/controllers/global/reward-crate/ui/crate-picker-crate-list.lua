-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local QueueGroupType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-group-type").QueueGroupType;
local CrateMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-meta").CrateMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;

return {
    CratePickerCrateList = v4.new(u3)(function(u5, p6) -- Line: 16
        -- upvalues: SoundManager (copy), GameSound (copy), u3 (copy), u2 (copy), CrateMeta (copy), ColorUtil (copy), Empty (copy), Padding (copy), AutoSizedText (copy), QueueGroupType (copy), AutoCanvasScrollingFrame (copy)
        local _ = p6.useState;

        local function _(p7) -- Line: 18
            -- upvalues: SoundManager (ref), GameSound (ref), u5 (copy)
            SoundManager:playSound(GameSound.UI_CLICK_2);
            u5.setSelectedCrate(p7);
        end;

        local v8 = {
            ScrollingFrameProps = {
                LayoutOrder = 2,
                Size = UDim2.fromScale(1, 0.9),
                ScrollingDirection = Enum.ScrollingDirection.Y
            }
        };
        local v9 = { u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 14)
            }) };
        local v10 = u2.entries(u5.crates);

        local function v19(p11) -- Line: 38
            -- upvalues: CrateMeta (ref), u5 (copy), u3 (ref), SoundManager (ref), GameSound (ref), ColorUtil (ref), Empty (ref), Padding (ref), AutoSizedText (ref)
            local u12 = p11[1];
            local v13 = p11[2];
            local v14 = CrateMeta[u12];
            local v15 = u12 == u5.selectedCrate;
            local v16 = {
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = Color3.fromRGB(154, 89, 89),
                BorderSizePixel = 0,
                ClipsDescendants = true,

                [u3.Event.Activated] = function() -- Line: 48
                    -- upvalues: u12 (copy), SoundManager (ref), GameSound (ref), u5 (ref)
                    SoundManager:playSound(GameSound.UI_CLICK_2);
                    u5.setSelectedCrate(u12);
                end,

                [u3.Event.MouseEnter] = function() -- Line: 51
                    -- upvalues: SoundManager (ref), GameSound (ref)
                    SoundManager:playSound(GameSound.UI_HOVER);
                end
            };
            local v17 = { u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 10)
                }) };
            local v18 = #v17;

            if v15 then
                v15 = u3.createElement("UIStroke", {
                    Thickness = 2,
                    Color = ColorUtil.WHITE
                });
            end;

            if v15 then
                v17[v18 + 1] = v15;
            end;

            local _ = #v17;
            v17.GradientOverlay = u3.createElement("Frame", {
                BorderSizePixel = 0,
                ZIndex = 10,
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = ColorUtil.WHITE
            }, { u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 10)
                }), u3.createElement("UIGradient", {
                    Rotation = -90,
                    Color = ColorSequence.new(Color3.fromRGB(249, 194, 43), Color3.fromRGB(249, 194, 43)),
                    Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.3), NumberSequenceKeypoint.new(0.45, 1), NumberSequenceKeypoint.new(1, 1) })
                }) });
            v17.DarkOverlay = u3.createElement("Frame", {
                BackgroundTransparency = 0.8,
                BorderSizePixel = 0,
                ZIndex = 9,
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = ColorUtil.BLACK
            }, { u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 10)
                }) });
            v17.BackgroundImage = u3.createElement("ImageLabel", {
                ImageTransparency = 0.8,
                BackgroundTransparency = 1,
                ZIndex = 8,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Image = v14.image,
                ScaleType = Enum.ScaleType.Fit
            }, { u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 10)
                }) });
            v17.Content = u3.createElement(Empty, {
                ZIndex = 11,
                Size = UDim2.fromScale(1, 1)
            }, {
                u3.createElement(Padding, {
                    Padding = UDim.new(0, 10)
                }),
                CrateAmount = u3.createElement(Empty, {
                    Size = UDim2.new(1, 0, 0, 18)
                }, { u3.createElement(AutoSizedText, {
                        TextSize = 16,
                        ZIndex = 11,
                        Position = UDim2.fromScale(1, 0),
                        AnchorPoint = Vector2.new(1, 0),
                        Text = "x" .. tostring(#v13),
                        Font = Enum.Font.SourceSansBold
                    }) }),
                CategoryIcon = u3.createElement("ImageLabel", {
                    SizeConstraint = "RelativeYY",
                    ScaleType = "Fit",
                    BackgroundTransparency = 1,
                    ZIndex = 11,
                    Image = v14.image,
                    Size = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 1),
                    Position = UDim2.fromScale(0.5, 0.5)
                }, { u3.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 6)
                    }), u3.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) }),
                CategoryText = u3.createElement(Empty, {
                    ZIndex = 11,
                    Size = UDim2.fromScale(1, 0.3),
                    AnchorPoint = Vector2.new(0.5, 1),
                    Position = UDim2.fromScale(0.5, 0.98)
                }, { u3.createElement("UIListLayout", {
                        FillDirection = "Vertical",
                        HorizontalAlignment = "Center",
                        VerticalAlignment = "Center",
                        Padding = UDim.new(0, -2)
                    }), u3.createElement(AutoSizedText, {
                        TextSize = 24,
                        ZIndex = 11,
                        Text = string.upper(v14.displayName),
                        Font = Enum.Font.SourceSansBold,
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        Limits = Vector2.new(140, 30)
                    }) })
            });

            return u3.createFragment({
                LobbyPlayMenuSquareButton = u3.createElement("ImageButton", v16, v17)
            });
        end;

        local v20 = table.create(#v10);

        for i, v in v10 do
            v20[i] = v19(v, i - 1, v10);
        end;

        local v21 = {
            AutomaticSize = "X",
            Size = UDim2.fromScale(0, 1),
            LayoutOrder = #u2.values(QueueGroupType)
        };
        local v22 = { u3.createElement(Padding, {
                Padding = {
                    Horizontal = 2,
                    Vertical = 2
                }
            }), u3.createElement("UIGridLayout", {
                FillDirectionMaxCells = 5,
                FillDirection = "Horizontal",
                VerticalAlignment = "Top",
                HorizontalAlignment = "Center",
                CellSize = UDim2.fromOffset(140, 140),
                CellPadding = UDim2.fromOffset(14, 14)
            }) };
        local v23 = #v22;

        for i, v in v20 do
            v22[v23 + i] = v;
        end;

        v9[#v9 + 1] = u3.createElement(Empty, v21, v22);

        return u3.createFragment({
            CrateList = u3.createElement(AutoCanvasScrollingFrame, v8, v9)
        });
    end)
};