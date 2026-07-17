-- Decompiled with Potassium's decompiler.

return {
    HW_STAGE_3_ENVIRONMENT = {
        Atmosphere = {
            Density = 0.35,
            Haze = 1.67,
            Glare = 0.67,
            Offset = 1,
            Color = Color3.new(0.584, 0.584, 0.584),
            Decay = Color3.new(0.784, 0.784, 0.784)
        },
        DepthOfFieldEffect = {
            Enabled = true,
            FarIntensity = 0.333,
            FocusDistance = 110,
            InFocusRadius = 125,
            NearIntensity = 0.1
        },
        Sky = {
            StarCount = 3000,
            SkyboxUp = "rbxassetid://10290025302",
            MoonTextureId = "rbxasset://sky/moon.jpg",
            SkyboxBk = "rbxassetid://10290026331",
            CelestialBodiesShown = true,
            SkyboxDn = "rbxassetid://10290026184",
            SkyboxLf = "rbxassetid://10290025786",
            SunTextureId = "rbxasset://sky/sun.jpg",
            SunAngularSize = 21,
            SkyboxFt = "rbxassetid://10290026023",
            SkyboxRt = "rbxassetid://10290025545",
            MoonAngularSize = 11
        },
        BloomEffect = {
            Threshold = 1.8940000000000001,
            Enabled = true,
            Intensity = 1,
            Size = 31
        },
        Lighting = {
            ClockTime = 0,
            FogEnd = 10000,
            FogStart = 0,
            EnvironmentDiffuseScale = 0,
            EnvironmentSpecularScale = 1,
            ExposureCompensation = 0,
            GeographicLatitude = 223,
            ShadowSoftness = 0.43,
            Brightness = 15,
            GlobalShadows = true,
            ColorShift_Bottom = Color3.new(1, 1, 1),
            FogColor = Color3.new(0.522, 0.58, 0.58),
            Ambient = Color3.new(0.122, 0.118, 0.173),
            OutdoorAmbient = Color3.new(0.157, 0.18, 0.212),
            ColorShift_Top = Color3.new(0.271, 0.306, 1)
        },
        ColorCorrectionEffect = {
            Enabled = true,
            Saturation = 0.2,
            Contrast = 0.1,
            Brightness = 0.05,
            TintColor = Color3.new(1, 1, 1)
        },
        Terrain = {
            WaterTransparency = 0.5,
            WaterReflectance = 1,
            WaterWaveSpeed = 15,
            WaterWaveSize = 0.15,
            MaterialColors = {
                LeafyGrass = Color3.new(0.408, 0.392, 0.424),
                Rock = Color3.new(0.42, 0.42, 0.424),
                Basalt = Color3.new(0.118, 0.118, 0.145),
                Sand = Color3.new(0.561, 0.494, 0.373),
                Sandstone = Color3.new(0.537, 0.353, 0.278),
                Brick = Color3.new(0.541, 0.337, 0.243),
                Cobblestone = Color3.new(0.424, 0.424, 0.424),
                Glacier = Color3.new(0.396, 0.69, 0.918),
                Ground = Color3.new(0.298, 0.294, 0.231),
                Snow = Color3.new(1, 1, 1),
                WoodPlanks = Color3.new(0.545, 0.427, 0.31),
                Limestone = Color3.new(0.808, 0.678, 0.58),
                Slate = Color3.new(0.153, 0.102, 0.086),
                Grass = Color3.new(0.592, 0.667, 0.686),
                Salt = Color3.new(0.776, 0.741, 0.71),
                CrackedLava = Color3.new(0.463, 0.604, 0.91),
                Pavement = Color3.new(0.58, 0.58, 0.549),
                Concrete = Color3.new(0.498, 0.4, 0.247),
                Mud = Color3.new(0.227, 0.18, 0.141),
                Asphalt = Color3.new(0.451, 0.482, 0.42),
                Ice = Color3.new(0.753, 0.945, 1)
            },
            WaterColor = Color3.new(0.357, 0.612, 0.624)
        },
        Clouds = {
            Density = 0.1,
            Enabled = true,
            Cover = 0.65,
            Color = Color3.new(0.6, 0.671, 0.929)
        }
    }
};