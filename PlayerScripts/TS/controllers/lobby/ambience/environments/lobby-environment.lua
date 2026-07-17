-- Decompiled with Potassium's decompiler.

return {
    LobbyEnvironment = {
        Terrain = {
            WaterTransparency = 0.5,
            WaterReflectance = 1,
            WaterWaveSpeed = 15,
            WaterWaveSize = 0.15,
            MaterialColors = {
                LeafyGrass = Color3.new(0.106, 0.565, 0.141),
                Rock = Color3.new(0.725, 0.8, 0.616),
                Basalt = Color3.new(0.337, 0.29, 0.22),
                Sand = Color3.new(0.792, 0.635, 0.455),
                Sandstone = Color3.new(0.596, 0.384, 0.31),
                Brick = Color3.new(0.533, 0.329, 0.239),
                Cobblestone = Color3.new(0.278, 0.263, 0.212),
                Glacier = Color3.new(0.396, 0.69, 0.918),
                Ground = Color3.new(0.325, 0.286, 0.176),
                Snow = Color3.new(1, 1, 1),
                WoodPlanks = Color3.new(0.549, 0.431, 0.314),
                Limestone = Color3.new(0.314, 0.208, 0.184),
                Slate = Color3.new(0.239, 0.157, 0.137),
                Grass = Color3.new(0.153, 0.463, 0.353),
                Salt = Color3.new(0.776, 0.741, 0.71),
                CrackedLava = Color3.new(0.91, 0.576, 0.106),
                Pavement = Color3.new(0.58, 0.58, 0.549),
                Concrete = Color3.new(0.329, 0.259, 0.165),
                Mud = Color3.new(0.49, 0.443, 0.392),
                Asphalt = Color3.new(0.451, 0.482, 0.42),
                Ice = Color3.new(0.753, 0.945, 1)
            },
            WaterColor = Color3.new(0.431, 0.631, 0.718)
        },
        SunRaysEffect = {
            Enabled = true,
            Spread = 0.1,
            Intensity = 0.1
        },
        ColorCorrectionEffect = {
            Enabled = true,
            Saturation = 0.3,
            Contrast = 0.2,
            Brightness = 0.03,
            TintColor = Color3.new(1, 1, 1)
        },
        Sky = {
            StarCount = 3000,
            SkyboxUp = "http://www.roblox.com/asset/?id=6778658364",
            MoonTextureId = "rbxasset://sky/moon.jpg",
            SkyboxBk = "http://www.roblox.com/asset/?id=6778646360",
            CelestialBodiesShown = true,
            SkyboxDn = "http://www.roblox.com/asset/?id=6778658683",
            SkyboxLf = "http://www.roblox.com/asset/?id=6778649136",
            SunTextureId = "rbxassetid://6679618752",
            SunAngularSize = 20,
            SkyboxFt = "http://www.roblox.com/asset/?id=6778648039",
            SkyboxRt = "http://www.roblox.com/asset/?id=6778650519",
            MoonAngularSize = 11
        },
        DepthOfFieldEffect = {
            Enabled = true,
            FarIntensity = 0.04,
            FocusDistance = 8.28,
            InFocusRadius = 40,
            NearIntensity = 0.75
        },
        Atmosphere = {
            Density = 0.285,
            Haze = 0,
            Glare = 0,
            Offset = 1,
            Color = Color3.new(0.745, 1, 0.992),
            Decay = Color3.new(0.361, 0.235, 0.051)
        },
        BloomEffect = {
            Threshold = 1.834,
            Enabled = true,
            Intensity = 0.4,
            Size = 38
        },
        Lighting = {
            ClockTime = 11.8,
            FogEnd = 2000,
            FogStart = 0,
            EnvironmentDiffuseScale = 0.1,
            EnvironmentSpecularScale = 0,
            ExposureCompensation = 0,
            GeographicLatitude = 184,
            ShadowSoftness = 0.1,
            Brightness = 3,
            GlobalShadows = true,
            ColorShift_Bottom = Color3.new(0.573, 0.745, 1),
            FogColor = Color3.new(0.71, 0.776, 0.988),
            Ambient = Color3.new(0.561, 0.522, 0.514),
            OutdoorAmbient = Color3.new(0.675, 0.635, 0.537),
            ColorShift_Top = Color3.new(0.937, 0.965, 0.996)
        },
        Clouds = {
            Density = 0.7,
            Enabled = true,
            Cover = 0.5,
            Color = Color3.new(1, 1, 1)
        }
    }
};