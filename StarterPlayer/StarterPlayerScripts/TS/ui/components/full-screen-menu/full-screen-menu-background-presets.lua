local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v5 = {}
local v6 = {
    ["Blur"] = true,
    ["BackgroundImageProps"] = {
        ["ImageTransparency"] = 1,
        ["BackgroundTransparency"] = 0.2,
        ["BackgroundColor3"] = v2.darken(v4.backgroundPrimary, 0.25)
    }
}
v5.BACKGROUND_BLUR_PRESET = v6
local v7 = {
    ["BackgroundImageProps"] = {
        ["ImageTransparency"] = 0.95,
        ["Image"] = v3.BW_IN_GAME_ILLUSTRATION_BACKGROUND,
        ["ScaleType"] = Enum.ScaleType.Crop,
        ["BackgroundColor3"] = v2.darken(v4.backgroundPrimary, 0.2)
    }
}
v5.GENERIC_BW_IMAGE_PRESET = v7
v5.NO_BACKGROUND_PRESET = {
    ["BackgroundImageProps"] = {
        ["ImageTransparency"] = 1,
        ["BackgroundTransparency"] = 1,
        ["Visible"] = false
    }
}
return {
    ["FullScreenMenuBackgroundPresets"] = v5
}