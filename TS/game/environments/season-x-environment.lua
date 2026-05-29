local v1 = {}
local v2 = {
    ["WaterTransparency"] = 0.5,
    ["WaterReflectance"] = 1,
    ["WaterWaveSpeed"] = 15,
    ["WaterWaveSize"] = 0.15,
    ["MaterialColors"] = {
        ["LeafyGrass"] = Color3.new(0.271, 0.702, 0.686),
        ["Rock"] = Color3.new(0.749, 0.827, 0.635),
        ["Basalt"] = Color3.new(0.31, 0.267, 0.2),
        ["Sand"] = Color3.new(0.769, 0.62, 0.443),
        ["Sandstone"] = Color3.new(0.537, 0.353, 0.278),
        ["Brick"] = Color3.new(0.541, 0.337, 0.243),
        ["Cobblestone"] = Color3.new(0.282, 0.231, 0.192),
        ["Glacier"] = Color3.new(0.396, 0.69, 0.918),
        ["Ground"] = Color3.new(0.831, 0.91, 0.686),
        ["Snow"] = Color3.new(1, 1, 1),
        ["WoodPlanks"] = Color3.new(0.545, 0.427, 0.31),
        ["Limestone"] = Color3.new(0.455, 0.306, 0.271),
        ["Slate"] = Color3.new(0.153, 0.102, 0.086),
        ["Grass"] = Color3.new(0.467, 1, 0.753),
        ["Salt"] = Color3.new(0.776, 0.741, 0.71),
        ["CrackedLava"] = Color3.new(0.91, 0.576, 0.106),
        ["Pavement"] = Color3.new(0.58, 0.58, 0.549),
        ["Concrete"] = Color3.new(0.498, 0.4, 0.247),
        ["Mud"] = Color3.new(0.42, 0.38, 0.333),
        ["Asphalt"] = Color3.new(0.451, 0.482, 0.42),
        ["Ice"] = Color3.new(0.753, 0.945, 1)
    },
    ["WaterColor"] = Color3.new(0.31, 0.443, 0.718)
}
v1.Terrain = v2
v1.SunRaysEffect = {
    ["Enabled"] = true,
    ["Spread"] = 0.1,
    ["Intensity"] = 0.1
}
v1.Sky = {
    ["StarCount"] = 3000,
    ["SkyboxUp"] = "rbxassetid://11554996247",
    ["MoonTextureId"] = "rbxasset://sky/moon.jpg",
    ["SkyboxBk"] = "rbxassetid://11555017034",
    ["CelestialBodiesShown"] = true,
    ["SkyboxDn"] = "rbxassetid://11555013415",
    ["SkyboxLf"] = "rbxassetid://11555006545",
    ["SunTextureId"] = "rbxasset://sky/sun.jpg",
    ["SunAngularSize"] = 21,
    ["SkyboxFt"] = "rbxassetid://11555010145",
    ["SkyboxRt"] = "rbxassetid://11555000712",
    ["MoonAngularSize"] = 11
}
v1.ColorCorrectionEffect = {
    ["Enabled"] = true,
    ["Saturation"] = 0.3,
    ["Contrast"] = 0.1,
    ["Brightness"] = 0.05,
    ["TintColor"] = Color3.fromRGB(255, 253, 234)
}
v1.Atmosphere = {
    ["Density"] = 0.3,
    ["Haze"] = 0,
    ["Glare"] = 0,
    ["Offset"] = 0,
    ["Color"] = Color3.fromRGB(190, 255, 253),
    ["Decay"] = Color3.fromRGB(92, 60, 13)
}
v1.BloomEffect = {
    ["Threshold"] = 1.834,
    ["Enabled"] = true,
    ["Intensity"] = 0.55,
    ["Size"] = 33
}
v1.DepthOfFieldEffect = {
    ["Enabled"] = true,
    ["FarIntensity"] = 0.1,
    ["FocusDistance"] = 0.05,
    ["InFocusRadius"] = 30,
    ["NearIntensity"] = 0.75
}
v1.Lighting = {
    ["ClockTime"] = 9.2,
    ["FogEnd"] = 200000,
    ["FogStart"] = 150,
    ["EnvironmentDiffuseScale"] = 0.301,
    ["EnvironmentSpecularScale"] = 0,
    ["ExposureCompensation"] = 0,
    ["GeographicLatitude"] = 190,
    ["ShadowSoftness"] = 0.1,
    ["Brightness"] = 3,
    ["GlobalShadows"] = true,
    ["ColorShift_Bottom"] = Color3.new(0.471, 0.541, 0.773),
    ["FogColor"] = Color3.new(0.988, 0.988, 0.988),
    ["Ambient"] = Color3.new(0.373, 0.392, 0.478),
    ["OutdoorAmbient"] = Color3.new(0.408, 0.408, 0.408),
    ["ColorShift_Top"] = Color3.new(1, 0.945, 0.863)
}
v1.Clouds = {
    ["Density"] = 0.7,
    ["Enabled"] = true,
    ["Cover"] = 0.5,
    ["Color"] = Color3.new(1, 1, 1)
}
return {
    ["SeasonXEnvironment"] = v1
}