local v1 = {}
local v2 = {
    ["WaterTransparency"] = 0.5,
    ["WaterReflectance"] = 1,
    ["WaterWaveSpeed"] = 15,
    ["WaterWaveSize"] = 0.15,
    ["MaterialColors"] = {
        ["LeafyGrass"] = Color3.new(0.251, 0.518, 0.451),
        ["Rock"] = Color3.new(0.718, 0.714, 0.722),
        ["Basalt"] = Color3.new(0.118, 0.118, 0.145),
        ["Sand"] = Color3.new(0.561, 0.494, 0.373),
        ["Sandstone"] = Color3.new(0.537, 0.353, 0.278),
        ["Brick"] = Color3.new(0.541, 0.337, 0.243),
        ["Cobblestone"] = Color3.new(0.424, 0.424, 0.424),
        ["Glacier"] = Color3.new(0.396, 0.69, 0.918),
        ["Ground"] = Color3.new(0.4, 0.263, 0.125),
        ["Snow"] = Color3.new(1, 1, 1),
        ["WoodPlanks"] = Color3.new(0.545, 0.427, 0.31),
        ["Limestone"] = Color3.new(0.808, 0.678, 0.58),
        ["Slate"] = Color3.new(0.153, 0.102, 0.086),
        ["Grass"] = Color3.new(0.792, 1, 0.984),
        ["Salt"] = Color3.new(0.776, 0.741, 0.71),
        ["CrackedLava"] = Color3.new(0.463, 0.604, 0.91),
        ["Pavement"] = Color3.new(0.58, 0.58, 0.549),
        ["Concrete"] = Color3.new(0.498, 0.4, 0.247),
        ["Mud"] = Color3.new(0.227, 0.18, 0.141),
        ["Asphalt"] = Color3.new(0.451, 0.482, 0.42),
        ["Ice"] = Color3.new(0.753, 0.945, 1)
    },
    ["WaterColor"] = Color3.new(0.357, 0.612, 0.624)
}
v1.Terrain = v2
v1.SunRaysEffect = {
    ["Enabled"] = false,
    ["Spread"] = 1,
    ["Intensity"] = 0.04
}
v1.ColorCorrectionEffect = {
    ["Enabled"] = true,
    ["Saturation"] = 0,
    ["Contrast"] = 0.3,
    ["Brightness"] = 0.02,
    ["TintColor"] = Color3.new(0.867, 0.961, 1)
}
v1.Sky = {
    ["StarCount"] = 3000,
    ["SkyboxUp"] = "rbxassetid://8139676647",
    ["MoonTextureId"] = "rbxasset://sky/moon.jpg",
    ["SkyboxBk"] = "rbxassetid://8139677359",
    ["CelestialBodiesShown"] = false,
    ["SkyboxDn"] = "rbxassetid://8139677253",
    ["SkyboxLf"] = "rbxassetid://8139676988",
    ["SunTextureId"] = "rbxasset://sky/sun.jpg",
    ["SunAngularSize"] = 21,
    ["SkyboxFt"] = "rbxassetid://8139677111",
    ["SkyboxRt"] = "rbxassetid://8139676842",
    ["MoonAngularSize"] = 11
}
v1.BloomEffect = {
    ["Threshold"] = 1.7,
    ["Enabled"] = true,
    ["Intensity"] = 2.5,
    ["Size"] = 1
}
v1.Atmosphere = {
    ["Density"] = 0.36,
    ["Haze"] = 2.15,
    ["Glare"] = 0,
    ["Offset"] = 0.9,
    ["Color"] = Color3.new(0.773, 0.808, 0.933),
    ["Decay"] = Color3.new(0.361, 0.235, 0.055)
}
v1.Lighting = {
    ["ClockTime"] = 13,
    ["FogEnd"] = 350,
    ["FogStart"] = 0,
    ["EnvironmentDiffuseScale"] = 0.1,
    ["EnvironmentSpecularScale"] = 0.1,
    ["ExposureCompensation"] = 0,
    ["GeographicLatitude"] = 0,
    ["ShadowSoftness"] = 0.2,
    ["Brightness"] = 1.2,
    ["GlobalShadows"] = true,
    ["ColorShift_Bottom"] = Color3.new(0, 0, 0),
    ["FogColor"] = Color3.new(0.635, 0.863, 1),
    ["Ambient"] = Color3.new(0.612, 0.612, 0.612),
    ["OutdoorAmbient"] = Color3.new(0.792, 0.792, 0.792),
    ["ColorShift_Top"] = Color3.new(0.408, 0.514, 0.906)
}
v1.Clouds = {
    ["Density"] = 0.1,
    ["Enabled"] = false,
    ["Cover"] = 0.65,
    ["Color"] = Color3.new(0.6, 0.671, 0.929)
}
v1.DepthOfFieldEffect = {
    ["Enabled"] = true,
    ["FarIntensity"] = 0,
    ["FocusDistance"] = 0.05,
    ["InFocusRadius"] = 23,
    ["NearIntensity"] = 0.75
}
return {
    ["WinterEnvironment"] = v1
}