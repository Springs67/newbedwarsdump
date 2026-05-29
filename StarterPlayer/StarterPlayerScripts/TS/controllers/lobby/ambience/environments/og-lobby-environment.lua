local v1 = {
    ["SunRaysEffect"] = {
        ["Enabled"] = true,
        ["Spread"] = 0.1,
        ["Intensity"] = 0.01
    },
    ["Sky"] = {
        ["StarCount"] = 3000,
        ["SkyboxUp"] = "rbxassetid://6412503613",
        ["MoonTextureId"] = "rbxassetid://6444320592",
        ["SkyboxBk"] = "rbxassetid://6444884337",
        ["CelestialBodiesShown"] = true,
        ["SkyboxDn"] = "rbxassetid://6444884785",
        ["SkyboxLf"] = "rbxassetid://6444884337",
        ["SunTextureId"] = "rbxassetid://6196665106",
        ["SunAngularSize"] = 11,
        ["SkyboxFt"] = "rbxassetid://6444884337",
        ["SkyboxRt"] = "rbxassetid://6444884337",
        ["MoonAngularSize"] = 11
    },
    ["DepthOfFieldEffect"] = {
        ["Enabled"] = false,
        ["FarIntensity"] = 0.1,
        ["FocusDistance"] = 0.05,
        ["InFocusRadius"] = 30,
        ["NearIntensity"] = 0.75
    },
    ["BloomEffect"] = {
        ["Threshold"] = 2,
        ["Enabled"] = true,
        ["Intensity"] = 1,
        ["Size"] = 24
    },
    ["Lighting"] = {
        ["ClockTime"] = 12.3,
        ["FogEnd"] = 100000,
        ["FogStart"] = 0,
        ["EnvironmentDiffuseScale"] = 1,
        ["EnvironmentSpecularScale"] = 1,
        ["ExposureCompensation"] = 0,
        ["GeographicLatitude"] = 0,
        ["ShadowSoftness"] = 0.2,
        ["Brightness"] = 3,
        ["GlobalShadows"] = true,
        ["ColorShift_Bottom"] = Color3.new(0, 0, 0),
        ["FogColor"] = Color3.new(1, 1, 1),
        ["Ambient"] = Color3.new(0.129, 0.129, 0.129),
        ["OutdoorAmbient"] = Color3.new(0.275, 0.275, 0.275),
        ["ColorShift_Top"] = Color3.new(0, 0, 0)
    },
    ["Atmosphere"] = {
        ["Density"] = 0.262,
        ["Haze"] = 0,
        ["Glare"] = 0,
        ["Offset"] = 0.177,
        ["Color"] = Color3.new(0.78, 0.78, 0.78),
        ["Decay"] = Color3.new(0.416, 0.439, 0.49)
    }
}
local v2 = {
    ["WaterTransparency"] = 0.3,
    ["WaterReflectance"] = 1,
    ["WaterWaveSpeed"] = 10,
    ["WaterWaveSize"] = 0.15,
    ["MaterialColors"] = {
        ["LeafyGrass"] = Color3.new(0.325, 0.537, 0.533),
        ["Rock"] = Color3.new(0.369, 0.388, 0.384),
        ["Basalt"] = Color3.new(0.086, 0.094, 0.071),
        ["Sand"] = Color3.new(0.482, 0.424, 0.314),
        ["Sandstone"] = Color3.new(0.529, 0.337, 0.263),
        ["Brick"] = Color3.new(0.498, 0.255, 0.157),
        ["Cobblestone"] = Color3.new(0.212, 0.2, 0.161),
        ["Glacier"] = Color3.new(0.678, 0.859, 0.957),
        ["Ground"] = Color3.new(0.325, 0.286, 0.176),
        ["Snow"] = Color3.new(1, 1, 1),
        ["WoodPlanks"] = Color3.new(0.545, 0.431, 0.306),
        ["Limestone"] = Color3.new(0.737, 0.596, 0.537),
        ["Slate"] = Color3.new(0.133, 0.122, 0),
        ["Grass"] = Color3.new(0.153, 0.463, 0.353),
        ["Salt"] = Color3.new(0.729, 0.722, 0.604),
        ["CrackedLava"] = Color3.new(0.31, 0.184, 0.063),
        ["Pavement"] = Color3.new(0.776, 0.773, 0.741),
        ["Concrete"] = Color3.new(0.557, 0.569, 0.416),
        ["Mud"] = Color3.new(0.106, 0.071, 0.051),
        ["Asphalt"] = Color3.new(0.416, 0.482, 0.369),
        ["Ice"] = Color3.new(0.455, 0.71, 0.831)
    },
    ["WaterColor"] = Color3.new(0.047, 0.329, 0.361)
}
v1.Terrain = v2
v1.Clouds = {
    ["Density"] = 0.033,
    ["Enabled"] = false,
    ["Cover"] = 1,
    ["Color"] = Color3.new(1, 1, 1)
}
return {
    ["OG_LOBBY_ENVIRONMENT"] = v1
}