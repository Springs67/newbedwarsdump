-- Decompiled with Potassium's decompiler.

return {
    HalloweenLobbyEnvironment = {
        Sky = {
            StarCount = 3000,
            SkyboxUp = "rbxassetid://18966818887",
            MoonTextureId = "rbxassetid://6444320592",
            SkyboxBk = "rbxassetid://18966821189",
            CelestialBodiesShown = true,
            SkyboxDn = "rbxassetid://18966821155",
            SkyboxLf = "rbxassetid://18966820043",
            SunTextureId = "rbxassetid://6196665106",
            SunAngularSize = 11,
            SkyboxFt = "rbxassetid://18966820419",
            SkyboxRt = "rbxassetid://18966819743",
            MoonAngularSize = 11
        },
        DepthOfFieldEffect = {
            Enabled = true,
            FarIntensity = 0.04,
            FocusDistance = 0.05,
            InFocusRadius = 40,
            NearIntensity = 0.75
        },
        ColorCorrectionEffect = {
            Enabled = true,
            Saturation = 0.2,
            Contrast = 0.1,
            Brightness = 0.05,
            TintColor = Color3.new(1, 1, 1)
        },
        BloomEffect = {
            Threshold = 2.013,
            Enabled = true,
            Intensity = 1,
            Size = 12
        },
        Lighting = {
            ClockTime = 0,
            FogEnd = 2000,
            FogStart = 0,
            EnvironmentDiffuseScale = 0.67,
            EnvironmentSpecularScale = 1,
            ExposureCompensation = 0,
            GeographicLatitude = 177,
            ShadowSoftness = 0.1,
            Brightness = 10,
            GlobalShadows = true,
            ColorShift_Bottom = Color3.new(0.859, 1, 1),
            FogColor = Color3.new(0.71, 0.776, 0.988),
            Ambient = Color3.new(0.271, 0.263, 0.388),
            OutdoorAmbient = Color3.new(0.157, 0.18, 0.212),
            ColorShift_Top = Color3.new(0.494, 0.612, 1)
        },
        Terrain = {
            WaterTransparency = 0.5,
            WaterReflectance = 1,
            WaterWaveSpeed = 15,
            WaterWaveSize = 0.15,
            MaterialColors = {
                LeafyGrass = Color3.new(0.776, 0.725, 0.353),
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
                Grass = Color3.new(1, 0.831, 0.216),
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
        Atmosphere = {
            Density = 0.218,
            Haze = 1.85,
            Glare = 1.51,
            Offset = 0,
            Color = Color3.new(0, 0, 0),
            Decay = Color3.new(1, 1, 1)
        },
        Clouds = {
            Density = 0.414,
            Enabled = true,
            Cover = 0.655,
            Color = Color3.new(0.839, 0.827, 1)
        }
    }
};