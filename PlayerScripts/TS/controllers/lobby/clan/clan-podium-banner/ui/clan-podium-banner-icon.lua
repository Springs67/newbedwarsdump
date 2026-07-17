-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    ClanPodiumBannerIcon = function(p2) -- Line: 5, Name: ClanPodiumBannerIcon
        -- upvalues: u1 (copy), Theme (copy)
        return u1.createFragment({
            ClanPodiumBannerIconSurface = u1.createElement("SurfaceGui", {
                LightInfluence = 1,
                ResetOnSpawn = false,
                Adornee = p2.Adornee,
                Face = Enum.NormalId.Front,
                SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
            }, {
                ClanEmblem = u1.createElement("ImageLabel", {
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(1, 1),
                    BackgroundTransparency = p2.Image == "" and 0 or 1,
                    BackgroundColor3 = Theme.backgroundTertiary,
                    Image = p2.Image,
                    ScaleType = Enum.ScaleType.Fit
                })
            })
        });
    end
};