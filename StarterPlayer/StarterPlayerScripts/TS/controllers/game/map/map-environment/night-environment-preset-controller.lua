local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Lighting
local u10 = v8.ReplicatedStorage
local u11 = v8.Workspace
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "environments", "night-environment").NIGHT_ENVIRONMENT
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "environments", "map-environment-types").EnvironmentPreset
local u19 = v1.import(script, script.Parent, "base-environment-preset-controller").BaseEnvironmentPresetController
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "NightEnvironmentPresetController"
    end,
    ["__index"] = u19
})
u20.__index = u20
function u20.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u18
    --]]
    u19.constructor(p23, u18.Night)
    p23.Name = "NightEnvironmentPresetController"
end
function u20.KnitStart(p24) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    u19.KnitStart(p24)
end
function u20.onEnable(u25) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u13
        [3] = u15
        [4] = u16
        [5] = u17
    --]]
    task.spawn(function() --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u14
            [3] = u13
            [4] = u15
        --]]
        u25:createAtmosphere(u14)
        u25:setupSky(u14)
        u13.MatchStateChange:connect(function(p26) --[[ Line: 48 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u25
                [3] = u14
            --]]
            if p26.matchState == u15.RUNNING then
                task.delay(20, function() --[[ Line: 50 ]]
                    --[[
                    Upvalues:
                        [1] = u25
                        [2] = u14
                    --]]
                    u25:tweenTime(20, 20)
                    u25:tweenMoonSize(u14, 15, 20)
                end)
                task.delay(40, function() --[[ Line: 54 ]]
                    --[[
                    Upvalues:
                        [1] = u25
                        [2] = u14
                    --]]
                    u25:tweenTime(21, 20)
                    u25:tweenMoonSize(u14, 17, 20)
                end)
                task.delay(60, function() --[[ Line: 58 ]]
                    --[[
                    Upvalues:
                        [1] = u25
                        [2] = u14
                    --]]
                    u25:tweenTime(22, 20)
                    u25:tweenMoonSize(u14, 19, 20)
                end)
                task.delay(80, function() --[[ Line: 62 ]]
                    --[[
                    Upvalues:
                        [1] = u25
                        [2] = u14
                    --]]
                    u25:tweenTime(23, 20)
                    u25:tweenMoonSize(u14, 21, 20)
                end)
            end
        end)
    end)
    u16.Client:Get("SpawnFireFly"):Connect(function(p27) --[[ Line: 69 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        u25:spawnFirefly(p27.positions)
    end)
    u13.MatchStateChange:connect(function(_) --[[ Line: 72 ]] end)
    u17.isGameServer()
end
function u20.setupSky(p28, p29) --[[ Line: 76 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u7
        [3] = u4
        [4] = u11
    --]]
    if p29.BlurEffect then
        local v30 = p28.environmentMaid
        local v31 = {}
        for v32, v33 in p29.BlurEffect do
            v31[v32] = v33
        end
        v31.Parent = u9
        v30:GiveTask(u7("BlurEffect", v31))
    end
    if p29.BloomEffect then
        local v34 = p28.environmentMaid
        local v35 = {}
        for v36, v37 in p29.BloomEffect do
            v35[v36] = v37
        end
        v35.Parent = u9
        v34:GiveTask(u7("BloomEffect", v35))
    end
    if p29.DepthOfFieldEffect then
        local v38 = p28.environmentMaid
        local v39 = {}
        for v40, v41 in p29.DepthOfFieldEffect do
            v39[v40] = v41
        end
        v39.Parent = u9
        v38:GiveTask(u7("DepthOfFieldEffect", v39))
    end
    if p29.SunRaysEffect then
        local v42 = p28.environmentMaid
        local v43 = u4.Controllers.LightingController.sunRayModifier
        local v44 = {}
        for v45, v46 in p29.SunRaysEffect do
            v44[v45] = v46
        end
        v42:GiveTask(v43:addModifier(10, v44))
    end
    if p29.Sky then
        local v47 = u4.Controllers.LightingController.skyModifier
        local v48 = {}
        for v49, v50 in p29.Sky do
            v48[v49] = v50
        end
        p28.skyModifier = v47:addModifier(10, v48)
        p28.environmentMaid:GiveTask(p28.skyModifier)
    end
    if p29.Clouds then
        local v51 = p28.environmentMaid
        local v52 = {}
        for v53, v54 in p29.Clouds do
            v52[v53] = v54
        end
        v52.Parent = u11.Terrain
        v51:GiveTask(u7("Clouds", v52))
    end
end
function u20.createAtmosphere(p55, p56) --[[ Line: 132 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u9
    --]]
    local v57 = u7("ColorCorrectionEffect", {
        ["Parent"] = u9
    })
    local v58 = u9:FindFirstChildWhichIsA("Atmosphere") or u7("Atmosphere", {
        ["Parent"] = u9
    })
    p55:tweenLighting(p56)
    if p56.ColorCorrectionEffect then
        local v59 = p56.ColorCorrectionEffect.Brightness
        if v59 ~= 0 and (v59 == v59 and v59) then
            v57.Brightness = p56.ColorCorrectionEffect.Brightness
        end
        local v60 = p56.ColorCorrectionEffect.Contrast
        if v60 ~= 0 and (v60 == v60 and v60) then
            v57.Brightness = p56.ColorCorrectionEffect.Contrast
        end
        if p56.ColorCorrectionEffect.TintColor then
            v57.TintColor = p56.ColorCorrectionEffect.TintColor
        end
    end
    if p56.Atmosphere then
        if p56.Atmosphere.Color then
            v58.Color = p56.Atmosphere.Color
        end
        if p56.Atmosphere.Decay then
            v58.Decay = p56.Atmosphere.Decay
        end
        local v61 = p56.Atmosphere.Glare
        if v61 ~= 0 and (v61 == v61 and v61) then
            v58.Glare = p56.Atmosphere.Glare
        end
        local v62 = p56.Atmosphere.Haze
        if v62 ~= 0 and (v62 == v62 and v62) then
            v58.Glare = p56.Atmosphere.Haze
        end
    end
end
function u20.tweenLighting(p63, p64) --[[ Line: 170 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u4
        [3] = u5
    --]]
    if p64.Lighting then
        local v65 = {
            ["Ambient"] = u9.Ambient,
            ["Brightness"] = u9.Brightness,
            ["ColorShift_Bottom"] = u9.ColorShift_Bottom,
            ["ColorShift_Top"] = u9.ColorShift_Top,
            ["EnvironmentDiffuseScale"] = u9.EnvironmentDiffuseScale,
            ["EnvironmentSpecularScale"] = u9.EnvironmentSpecularScale,
            ["OutdoorAmbient"] = u9.OutdoorAmbient,
            ["ShadowSoftness"] = u9.ShadowSoftness,
            ["ExposureCompensation"] = u9.ExposureCompensation,
            ["ClockTime"] = u9.ClockTime
        }
        if not p63.lightingModifier then
            local v66 = u4.Controllers.LightingController.lightingModifier
            local v67 = {}
            for v68, v69 in v65 do
                v67[v68] = v69
            end
            p63.lightingModifier = v66:addModifier(10, v67)
        end
        local v70 = {}
        local v71 = p64.Lighting
        if v71 ~= nil then
            v71 = v71.Ambient
        end
        v70.Ambient = v71
        local v72 = p64.Lighting
        if v72 ~= nil then
            v72 = v72.Brightness
        end
        v70.Brightness = v72
        local v73 = p64.Lighting
        if v73 ~= nil then
            v73 = v73.ColorShift_Bottom
        end
        v70.ColorShift_Bottom = v73
        local v74 = p64.Lighting
        if v74 ~= nil then
            v74 = v74.ColorShift_Top
        end
        v70.ColorShift_Top = v74
        local v75 = p64.Lighting
        if v75 ~= nil then
            v75 = v75.EnvironmentDiffuseScale
        end
        v70.EnvironmentDiffuseScale = v75
        local v76 = p64.Lighting
        if v76 ~= nil then
            v76 = v76.EnvironmentSpecularScale
        end
        v70.EnvironmentSpecularScale = v76
        local v77 = p64.Lighting
        if v77 ~= nil then
            v77 = v77.OutdoorAmbient
        end
        v70.OutdoorAmbient = v77
        local v78 = p64.Lighting
        if v78 ~= nil then
            v78 = v78.ShadowSoftness
        end
        v70.ShadowSoftness = v78
        local v79 = p64.Lighting
        if v79 ~= nil then
            v79 = v79.ExposureCompensation
        end
        v70.ExposureCompensation = v79
        local v80 = p64.Lighting
        if v80 ~= nil then
            v80 = v80.ClockTime
        end
        v70.ClockTime = v80
        if p64.Lighting and p63.lightingModifier then
            local v81 = u5.deepCopy(v70)
            for _, v82 in u5.entries(v81) do
                local v83 = v82[1]
                local v84 = v82[2]
                if type(v84) == "number" then
                    v81[v83] = v84 - v65[v83] + v65[v83]
                end
                local _ = typeof(v84) == "Color3"
            end
            if p63.lightingModifier then
                p63.lightingModifier:setProperties(v81)
            end
        end
    end
end
function u20.tweenTime(u85, u86, p87) --[[ Line: 273 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u12
        [3] = u6
        [4] = u5
    --]]
    local u88 = u9.ClockTime
    local u89 = {
        ["Ambient"] = u9.Ambient,
        ["Brightness"] = u9.Brightness,
        ["ColorShift_Bottom"] = u9.ColorShift_Bottom,
        ["ColorShift_Top"] = u9.ColorShift_Top,
        ["EnvironmentDiffuseScale"] = u9.EnvironmentDiffuseScale,
        ["EnvironmentSpecularScale"] = u9.EnvironmentSpecularScale,
        ["OutdoorAmbient"] = u9.OutdoorAmbient,
        ["ShadowSoftness"] = u9.ShadowSoftness,
        ["ExposureCompensation"] = u9.ExposureCompensation,
        ["ClockTime"] = u86
    }
    u12(p87, u6, function(p90) --[[ Line: 296 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u89
            [3] = u86
            [4] = u88
            [5] = u85
        --]]
        local v91 = u5.deepCopy(u89)
        v91.ClockTime = (u86 - u88) * p90 + u88
        if u85.lightingModifier then
            u85.lightingModifier:setProperties(v91)
        end
    end)
end
function u20.tweenMoonSize(u92, u93, u94, p95) --[[ Line: 304 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u6
        [3] = u5
    --]]
    local v96 = u92.skyModifier
    if v96 ~= nil then
        v96 = v96:getProperties()
    end
    if v96 == nil then
        v96 = nil
    end
    local u97 = v96.MoonAngularSize
    if u97 == 0 or (u97 ~= u97 or not u97) then
        return nil
    end
    u12(p95, u6, function(p98) --[[ Line: 318 ]]
        --[[
        Upvalues:
            [1] = u93
            [2] = u5
            [3] = u94
            [4] = u97
            [5] = u92
        --]]
        if u93.Sky then
            local v99 = u5.deepCopy(u93.Sky)
            v99.MoonAngularSize = (u94 - u97) * p98 + u97
            if u92.skyModifier then
                u92.skyModifier:setProperties(v99)
            end
        end
    end, 0, 1)
end
u20.spawnFirefly = v1.async(function(_, p100) --[[ Line: 328 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u11
    --]]
    local v101 = u10.Assets.Effects.FireFly
    for _, v102 in p100 do
        local v103 = v101:Clone()
        v103.Parent = u11
        v103.Position = v102
    end
end)
function u20.onIntensityChanged(_, _) --[[ Line: 336 ]] end
function u20.onDynamicEventStarted(_) --[[ Line: 338 ]] end
function u20.onDynamicEventEnded(_) --[[ Line: 340 ]] end
v3.CreateController(u20.new())
return nil