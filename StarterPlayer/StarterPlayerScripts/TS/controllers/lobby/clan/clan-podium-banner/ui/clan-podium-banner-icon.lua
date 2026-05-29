local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["ClanPodiumBannerIcon"] = function(p4) --[[ Name: ClanPodiumBannerIcon, Line 5 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u3
        --]]
        local v5 = u2.createFragment
        local v6 = {}
        local v7 = u2.createElement
        local v8 = {
            ["LightInfluence"] = 1,
            ["ResetOnSpawn"] = false,
            ["Adornee"] = p4.Adornee,
            ["Face"] = Enum.NormalId.Front,
            ["SizingMode"] = Enum.SurfaceGuiSizingMode.PixelsPerStud
        }
        local v9 = {
            ["ClanEmblem"] = u2.createElement("ImageLabel", {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundTransparency"] = p4.Image == "" and 0 or 1,
                ["BackgroundColor3"] = u3.backgroundTertiary,
                ["Image"] = p4.Image,
                ["ScaleType"] = Enum.ScaleType.Fit
            })
        }
        v6.ClanPodiumBannerIconSurface = v7("SurfaceGui", v8, v9)
        return v5(v6)
    end
}