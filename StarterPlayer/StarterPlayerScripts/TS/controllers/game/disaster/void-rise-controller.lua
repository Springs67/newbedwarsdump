local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.SoundManager
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v6 = v5.KnitClient
local u7 = v5.KnitClient
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u9 = v8.InQuad
local u10 = v8.Linear
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.Lighting
local u14 = v12.RunService
local u15 = v12.Workspace
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "VoidRiseController"
    end,
    ["__index"] = u17
})
u20.__index = u20
function u20.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17.constructor(p23)
    p23.Name = "VoidRiseController"
end
function u20.KnitStart(p24) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u18
        [3] = u4
        [4] = u19
        [5] = u7
        [6] = u16
        [7] = u9
        [8] = u11
        [9] = u15
        [10] = u3
        [11] = u10
        [12] = u13
        [13] = u14
    --]]
    u17.KnitStart(p24)
    u18.Client:GetNamespace("Disaster"):OnEvent("VoidRise", function(p25) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u19
            [3] = u7
            [4] = u16
            [5] = u9
            [6] = u11
            [7] = u15
            [8] = u3
            [9] = u10
            [10] = u13
            [11] = u14
        --]]
        local u26 = u4:playSound(u19.RAVEN_SPACE_AMBIENT, {
            ["volumeMultiplier"] = 0,
            ["looped"] = true
        })
        u4:tweenSoundVolume(u26, 0.3, 1)
        local u27 = u7.Controllers.LightingController:getAtmosphereModifier():addModifier(30, {
            ["Density"] = 0,
            ["Haze"] = 0,
            ["Color"] = Color3.fromRGB(0, 0, 0)
        })
        u16(2, u9, function(p28) --[[ Line: 52 ]]
            --[[
            Upvalues:
                [1] = u27
            --]]
            local v29 = u27
            local v30 = {}
            for v31, v32 in u27:getProperties() do
                v30[v31] = v32
            end
            v30.Haze = p28 * 2
            v29:setProperties(v30)
        end, 0, 1)
        local v33 = u11
        local v34 = {
            ["Anchored"] = true,
            ["Size"] = Vector3.new(2000, 2, 2000),
            ["CanCollide"] = false,
            ["Reflectance"] = -1,
            ["CastShadow"] = false
        }
        local v35 = p25.startingLevel
        v34.Position = Vector3.new(0, v35, 0)
        v34.Color = Color3.fromRGB(0, 0, 0)
        v34.TopSurface = Enum.SurfaceType.Smooth
        v34.BottomSurface = Enum.SurfaceType.Smooth
        v34.Parent = u15
        local u36 = v33("Part", v34)
        u3:setQueryIgnored(u36, true)
        local u38 = u16((p25.endTime - u15:GetServerTimeNow()) * 0.9, u10, function(p37) --[[ Line: 74 ]]
            --[[
            Upvalues:
                [1] = u36
            --]]
            u36.Position = Vector3.new(0, p37, 0)
        end, p25.startingLevel, p25.endLevel)
        local u39 = u11("ColorCorrectionEffect", {
            ["Parent"] = u13
        })
        local u48 = u14.Heartbeat:Connect(function() --[[ Line: 80 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u36
                [3] = u39
                [4] = u27
            --]]
            if u15.CurrentCamera.CFrame.Position.Y < u36.Position.Y then
                u39.Saturation = -0.8
                u39.TintColor = Color3.fromRGB(83, 83, 83)
                local v40 = u27
                local v41 = {}
                for v42, v43 in u27:getProperties() do
                    v41[v42] = v43
                end
                v41.Density = 0.9
                v40:setProperties(v41)
            else
                u39.Saturation = 0
                u39.TintColor = Color3.fromRGB(255, 255, 255)
                local v44 = u27
                local v45 = {}
                for v46, v47 in u27:getProperties() do
                    v45[v46] = v47
                end
                v45.Density = 0.1
                v44:setProperties(v45)
            end
        end)
        task.delay(p25.endTime - u15:GetServerTimeNow(), function() --[[ Line: 103 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u38
                [3] = u36
                [4] = u26
                [5] = u48
                [6] = u39
            --]]
            u27:destroy()
            u38:Cancel()
            u36:Destroy()
            u26:Destroy()
            u48:Disconnect()
            u39:Destroy()
        end)
    end)
end
v6.CreateController(u20.new())
return nil