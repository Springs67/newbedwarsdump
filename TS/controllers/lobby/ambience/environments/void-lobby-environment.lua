-- Decompiled with Potassium's decompiler.

return {
    VoidLobbyEnvironment = {
        Lighting = {
            FogEnd = 2000,
            FogStart = 0,
            EnvironmentDiffuseScale = 0.1,
            EnvironmentSpecularScale = 0,
            GeographicLatitude = 184,
            ShadowSoftness = 0.1,
            Brightness = 3,
            GlobalShadows = true,
            ClockTime = 6.3,
            ExposureCompensation = 0.62,
            ColorShift_Bottom = Color3.new(0.573, 0.745, 1),
            FogColor = Color3.new(0.71, 0.776, 0.988),
            OutdoorAmbient = Color3.new(0.408, 0.408, 0.408),
            ColorShift_Top = Color3.new(0.937, 0.965, 0.996),
            Ambient = Color3.fromRGB(255, 255, 255)
        },
        SunRaysEffect = {
            Enabled = true,
            Spread = 0.1,
            Intensity = 0.005
        },
        Sky = {
            SkyboxBk = "rbxassetid://9851144466",
            SkyboxDn = "rbxassetid://9851144249",
            SkyboxFt = "rbxassetid://9851144099",
            SkyboxLf = "rbxassetid://9851143942",
            SkyboxRt = "rbxassetid://9851143761",
            SkyboxUp = "rbxassetid://9851143257",
            StarCount = 3000,
            MoonTextureId = "rbxasset://sky/moon.jpg",
            CelestialBodiesShown = true,
            SunTextureId = "rbxassetid://6679618752",
            SunAngularSize = 20,
            MoonAngularSize = 11
        },
        ColorCorrectionEffect = {
            Enabled = true,
            Saturation = 0.3,
            Contrast = 0.1,
            Brightness = 0.05,
            TintColor = Color3.new(1, 0.992, 0.918)
        },
        DepthOfFieldEffect = {
            Enabled = true,
            FarIntensity = 0.04,
            FocusDistance = 0.05,
            InFocusRadius = 40,
            NearIntensity = 0.75
        },
        Atmosphere = {
            Density = 0.45,
            Offset = 0,
            Glare = 0,
            Haze = 0,
            Color = Color3.fromRGB(193, 193, 193),
            Decay = Color3.new(0.361, 0.235, 0.051)
        },
        BloomEffect = {
            Threshold = 1.834,
            Enabled = true,
            Intensity = 0.55,
            Size = 33
        },
        Terrain = {
            WaterTransparency = 0.5,
            WaterReflectance = 1,
            WaterWaveSpeed = 15,
            WaterWaveSize = 0.15,
            MaterialColors = {
                LeafyGrass = Color3.new(0.459, 0.361, 0.702),
                Rock = Color3.new(0.725, 0.8, 0.616),
                Basalt = Color3.new(0.337, 0.29, 0.22),
                Sand = Color3.new(0.792, 0.635, 0.455),
                Sandstone = Color3.new(0.596, 0.384, 0.31),
                Brick = Color3.new(0.533, 0.329, 0.239),
                Cobblestone = Color3.new(0.192, 0.098, 0.29),
                Glacier = Color3.new(0.396, 0.69, 0.918),
                Ground = Color3.new(0.424, 0.322, 1),
                Snow = Color3.new(1, 1, 1),
                WoodPlanks = Color3.new(0.549, 0.431, 0.314),
                Limestone = Color3.new(0.314, 0.208, 0.184),
                Slate = Color3.new(0.239, 0.157, 0.137),
                Grass = Color3.new(0.608, 0.537, 1),
                Salt = Color3.new(0.776, 0.741, 0.71),
                CrackedLava = Color3.new(0.91, 0.576, 0.106),
                Pavement = Color3.new(0.58, 0.58, 0.549),
                Concrete = Color3.new(0.329, 0.259, 0.165),
                Mud = Color3.new(0.49, 0.443, 0.392),
                Asphalt = Color3.new(0.451, 0.482, 0.42),
                Ice = Color3.new(0.753, 0.945, 1)
            },
            WaterColor = Color3.new(0.486, 0.443, 0.718)
        },
        Clouds = {
            Density = 0.7,
            Enabled = false,
            Cover = 0.5,
            Color = Color3.new(1, 1, 1)
        }
    }
};