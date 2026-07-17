-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    FullScreenMenuBackgroundPresets = {
        BACKGROUND_BLUR_PRESET = {
            Blur = true,
            BackgroundImageProps = {
                ImageTransparency = 1,
                BackgroundTransparency = 0.2,
                BackgroundColor3 = ColorUtil.darken(Theme.backgroundPrimary, 0.25)
            }
        },
        GENERIC_BW_IMAGE_PRESET = {
            BackgroundImageProps = {
                ImageTransparency = 0.95,
                Image = BedwarsImageId.BW_IN_GAME_ILLUSTRATION_BACKGROUND,
                ScaleType = Enum.ScaleType.Crop,
                BackgroundColor3 = ColorUtil.darken(Theme.backgroundPrimary, 0.2)
            }
        },
        NO_BACKGROUND_PRESET = {
            BackgroundImageProps = {
                ImageTransparency = 1,
                BackgroundTransparency = 1,
                Visible = false
            }
        }
    }
};