local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").MathExtras
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutBack
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Lighting
local u8 = v6.Players
local u9 = v6.RunService
local u10 = v6.Workspace
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "LobbyLightingChangeSectionController"
    end,
    ["__index"] = u12
})
u14.__index = u14
function u14.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u7
    --]]
    u12.constructor(p17)
    p17.Name = "LobbyLightingChangeSectionController"
    p17.environmentChangeSections = {}
    p17.isTouchingEnvironmentChangeSection = false
    p17.initialClockTime = u7.ClockTime
    p17.sunRayRef = u7:FindFirstChildOfClass("SunRaysEffect")
    local v18 = u7:FindFirstChildOfClass("SunRaysEffect")
    if v18 ~= nil then
        v18 = v18.Intensity
    end
    p17.initialSunRayIntensity = v18
    p17.darkColorCorrectionProperties = {
        ["TintColor"] = Color3.fromRGB(227, 196, 173)
    }
    p17.transitionTime = 10
    p17.nightClockTime = 18.6
end
function u14.KnitStart(_) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u9
        [3] = u8
    --]]
    u13.isLobbyServer()
    return nil
end
function u14.setupEnvironmentChangeSections(u19) --[[ Line: 106 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u8
    --]]
    local v20 = u10:WaitForChild("Lobby"):WaitForChild("LightingChangeSections"):GetChildren()
    local function v25(p21) --[[ Line: 109 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u8
        --]]
        if not p21:IsA("Part") then
            return nil
        end
        if not p21 then
            return nil
        end
        p21.Transparency = 1
        local v22 = u19.environmentChangeSections
        table.insert(v22, p21)
        p21.Touched:Connect(function(p23) --[[ Line: 122 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u19
            --]]
            local v24 = u8.LocalPlayer.Character
            if v24 ~= nil then
                v24 = v24.PrimaryPart
            end
            if not v24 then
                return nil
            end
            if p23 ~= v24 then
                return nil
            end
            if not u19.isTouchingEnvironmentChangeSection then
                u19:setCurrentLightingSection(true)
            end
        end)
    end
    for v26, v27 in v20 do
        v25(v27, v26 - 1, v20)
    end
end
function u14.setCurrentLightingSection(u28, p29) --[[ Line: 143 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u11
        [3] = u4
        [4] = u2
    --]]
    u28.isTouchingEnvironmentChangeSection = p29
    if u28.currentColorCorrectionTween then
        u28.currentColorCorrectionTween:Cancel()
    end
    u28:getColorCorrectionProperties()
    local u30 = u7.ClockTime
    if p29 then
        local _ = u28.darkColorCorrectionProperties
        local u31 = u28.nightClockTime
        u28.currentColorCorrectionTween = u11(u28.transitionTime, u4, function(p32) --[[ Line: 158 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u2
                [3] = u30
                [4] = u31
                [5] = u28
            --]]
            u7.ClockTime = u2:lerp(u30, u31, p32)
            local v33 = u28.sunRayRef
            if v33 then
                v33 = u28.initialSunRayIntensity
            end
            if v33 ~= 0 and (v33 == v33 and v33) then
                u28.sunRayRef.Intensity = u2:lerp(u28.initialSunRayIntensity, 0, p32)
            end
        end, 0, 1)
    else
        local _ = u28.initialColorCorrectionProperties
        local u34 = u28.initialClockTime
        u28.currentColorCorrectionTween = u11(u28.transitionTime, u4, function(p35) --[[ Line: 190 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u2
                [3] = u30
                [4] = u34
                [5] = u28
            --]]
            u7.ClockTime = u2:lerp(u30, u34, p35)
            local v36 = u28.sunRayRef
            if v36 then
                v36 = u28.initialSunRayIntensity
            end
            if v36 ~= 0 and (v36 == v36 and v36) then
                u28.sunRayRef.Intensity = u2:lerp(0, u28.initialSunRayIntensity, p35)
            end
        end, 0, 1)
    end
end
function u14.getColorCorrectionRef(_) --[[ Line: 218 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u5
    --]]
    return u7:FindFirstChildOfClass("ColorCorrectionEffect") or u5("ColorCorrectionEffect", {
        ["Brightness"] = 0.05,
        ["Contrast"] = 0.1,
        ["Enabled"] = true,
        ["Saturation"] = 0.2,
        ["TintColor"] = Color3.fromRGB(255, 255, 255)
    })
end
function u14.getColorCorrectionProperties(p37) --[[ Line: 227 ]]
    local v38 = p37:getColorCorrectionRef()
    return {
        ["Brightness"] = v38.Brightness,
        ["Contrast"] = v38.Contrast,
        ["Enabled"] = v38.Enabled,
        ["Saturation"] = v38.Saturation,
        ["TintColor"] = v38.TintColor
    }
end
function u14.setColorCorrectionProperties(p39, p40) --[[ Line: 237 ]]
    local v41 = p39:getColorCorrectionRef()
    local v42 = p40.Brightness
    if v42 ~= 0 and (v42 == v42 and v42) then
        v41.Brightness = p40.Brightness
    end
    local v43 = p40.Contrast
    if v43 ~= 0 and (v43 == v43 and v43) then
        v41.Contrast = p40.Contrast
    end
    if p40.Enabled then
        v41.Enabled = p40.Enabled
    end
    local v44 = p40.Saturation
    if v44 ~= 0 and (v44 == v44 and v44) then
        v41.Saturation = p40.Saturation
    end
    if p40.TintColor then
        v41.TintColor = p40.TintColor
    end
end
v3.CreateController(u14.new())
return nil