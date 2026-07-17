-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local NewsMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "news", "news-types").NewsMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;

return {
    Issue2Reader = v3.new(u2)(function(u4, p5) -- Line: 11
        -- upvalues: NewsMeta (copy), SoundManager (copy), GameSound (copy), u2 (copy), Empty (copy), BedwarsImageId (copy)
        local _ = p5.useEffect;
        local v6 = NewsMeta[u4.SelectedNews];
        local u7, u8 = p5.useState(0);

        local function v9() -- Line: 17
            -- upvalues: SoundManager (ref), GameSound (ref), u4 (copy)
            SoundManager:playSound(GameSound.UI_CLICK_2);
            u4.SetSelectedNews(nil);
        end;

        local function v10() -- Line: 21
            -- upvalues: u8 (copy), u7 (copy)
            u8((u7 + 1) % 2);
        end;

        return u2.createFragment({
            NewsReader = u2.createElement(Empty, {
                LayoutOrder = 2,
                Size = UDim2.fromScale(1, 1)
            }, { u2.createElement("ImageButton", {
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Image = v6.pageAssetIds[u7 + 1],
                    Size = UDim2.fromScale(1, 1),
                    ScaleType = Enum.ScaleType.Fit,
                    BackgroundTransparency = 1,
                    [u2.Event.MouseButton1Click] = v10
                }, {
                    u2.createElement("Frame", {
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(1, 0.05),
                        Position = UDim2.fromScale(0, 0.03)
                    }, {
                        GoBackIcon = u2.createElement("ImageButton", {
                            Size = UDim2.fromScale(1, 1),
                            AnchorPoint = Vector2.new(0, 0.5),
                            Position = UDim2.fromScale(0.05, 0.5),
                            Image = BedwarsImageId.HOME,
                            SizeConstraint = Enum.SizeConstraint.RelativeYY,
                            ScaleType = Enum.ScaleType.Fit,
                            ImageTransparency = 0.2,
                            BackgroundTransparency = 1,
                            [u2.Event.Activated] = v9
                        })
                    }),
                    NextPageIcon = u2.createElement("ImageButton", {
                        Size = UDim2.fromScale(0.05, 0.1),
                        AnchorPoint = Vector2.new(0, 0.5),
                        Position = UDim2.fromScale(1, 0.5),
                        Image = BedwarsImageId.TRIANGLE_ARROW_RIGHT,
                        ScaleType = Enum.ScaleType.Fit,
                        ImageTransparency = 0.2,
                        BackgroundTransparency = 1,
                        [u2.Event.Activated] = v10
                    }),
                    u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1.2828752642706132
                    })
                }) })
        });
    end)
};