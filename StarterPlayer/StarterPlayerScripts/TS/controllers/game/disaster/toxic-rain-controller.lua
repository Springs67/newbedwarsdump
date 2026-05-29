local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Lighting
local u10 = v8.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "rain")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "disaster", "disaster-type").DisasterType
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "ToxicRainController"
    end,
    ["__index"] = u12
})
u15.__index = u15
function u15.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p18)
    p18.Name = "ToxicRainController"
end
function u15.KnitStart(p19) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u10
        [3] = u2
        [4] = u11
        [5] = u6
        [6] = u14
        [7] = u13
        [8] = u7
        [9] = u9
        [10] = u5
    --]]
    u12.KnitStart(p19)
    u10.CurrentCamera.ChildAdded:Connect(function(p20) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        if p20.Name == "__RainEmitter" and p20:IsA("BasePart") then
            u2:setQueryIgnored(p20, true)
        end
    end)
    u11.DisasterBegan:connect(function(p21) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u14
            [3] = u13
            [4] = u10
            [5] = u2
            [6] = u7
            [7] = u9
            [8] = u5
        --]]
        u6.Debug("Received on the client")
        if p21.disasterType == u14.TOXIC_RAIN then
            u13:Enable()
            u13:SetColor(Color3.fromRGB(0, 255, 0))
            u13:SetIntensityRatio(0.5)
            u13:SetSoundId("rbxassetid://9112794264")
            local v22 = u10.CurrentCamera:FindFirstChild("__RainEmitter")
            if v22 then
                u2:setQueryIgnored(v22, true)
            end
            local u23 = u7("Clouds", {
                ["Cover"] = 0.9,
                ["Density"] = 1,
                ["Color"] = Color3.fromRGB(50, 32, 32),
                ["Parent"] = u10.Terrain
            })
            local u24 = u7("ColorCorrectionEffect", {
                ["Brightness"] = -0.02,
                ["TintColor"] = Color3.fromRGB(224, 221, 255),
                ["Parent"] = u9
            })
            local u25 = u5.Controllers.LightingController.lightingModifier:addModifier(60, {
                ["Ambient"] = Color3.fromRGB(81, 68, 149),
                ["OutdoorAmbient"] = Color3.fromRGB(110, 138, 198)
            })
            local u26 = u5.Controllers.LightingController:getAtmosphereModifier():addModifier(60, {
                ["Density"] = 0.52,
                ["Offset"] = 0,
                ["Glare"] = 0,
                ["Haze"] = 10,
                ["Color"] = Color3.fromRGB(71, 216, 95),
                ["Decay"] = Color3.fromRGB(0, 0, 0)
            })
            task.delay(p21.endTime - u10:GetServerTimeNow(), function() --[[ Line: 75 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u24
                    [3] = u23
                    [4] = u25
                    [5] = u26
                --]]
                u13:Disable()
                u24:Destroy()
                u23:Destroy()
                u25:destroy()
                u26:destroy()
            end)
        end
    end)
end
v4.CreateController(u15.new())
return nil