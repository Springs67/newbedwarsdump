local v1 = {
    ["ColorCorrectionEffect"] = {
        ["Enabled"] = true,
        ["Saturation"] = 0.05,
        ["Contrast"] = 0.05,
        ["Brightness"] = 0,
        ["TintColor"] = Color3.new(1, 1, 1)
    },
    ["Atmosphere"] = {
        ["Density"] = 0.35,
        ["Haze"] = 1.67,
        ["Glare"] = 0.67,
        ["Offset"] = 1,
        ["Color"] = Color3.new(0.584, 0.584, 0.584),
        ["Decay"] = Color3.new(0.784, 0.784, 0.784)
    },
    ["Lighting"] = {
        ["ClockTime"] = 19,
        ["FogEnd"] = 10000,
        ["FogStart"] = 0,
        ["EnvironmentDiffuseScale"] = 0.67,
        ["EnvironmentSpecularScale"] = 1,
        ["ExposureCompensation"] = 0,
        ["GeographicLatitude"] = 19,
        ["ShadowSoftness"] = 0,
        ["Brightness"] = 2,
        ["GlobalShadows"] = true,
        ["ColorShift_Bottom"] = Color3.new(0.859, 1, 1),
        ["FogColor"] = Color3.new(0.522, 0.58, 0.58),
        ["Ambient"] = Color3.fromRGB(176, 194, 250),
        ["OutdoorAmbient"] = Color3.fromRGB(176, 194, 250),
        ["ColorShift_Top"] = Color3.new(0.494, 0.612, 1)
    },
    ["Sky"] = {
        ["StarCount"] = 1000,
        ["MoonTextureId"] = "rbxassetid://6444320592",
        ["SunTextureId"] = "",
        ["SunAngularSize"] = 11,
        ["CelestialBodiesShown"] = true,
        ["MoonAngularSize"] = 10,
        ["SkyboxUp"] = "http://www.roblox.com/asset/?id=6778658364",
        ["SkyboxBk"] = "http://www.roblox.com/asset/?id=6778646360",
        ["SkyboxDn"] = "http://www.roblox.com/asset/?id=6778658683",
        ["SkyboxLf"] = "http://www.roblox.com/asset/?id=6778649136",
        ["SkyboxFt"] = "http://www.roblox.com/asset/?id=6778648039",
        ["SkyboxRt"] = "http://www.roblox.com/asset/?id=6778650519"
    }
}
return {
    ["NIGHT_ENVIRONMENT"] = v1
}