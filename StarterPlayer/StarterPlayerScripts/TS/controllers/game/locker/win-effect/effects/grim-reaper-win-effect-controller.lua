local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Lighting
local u8 = v6.Players
local u9 = v6.TweenService
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType
local u11 = v1.import(script, script.Parent.Parent, "win-effect").WinEffect
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "GrimReaperWinEffectController"
    end,
    ["__index"] = u11
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u10
        [3] = u5
    --]]
    u11.constructor(p15, u10.GRIM_REAPER)
    p15.Name = "GrimReaperWinEffectController"
    p15.lightingMaid = u5.new()
    p15.changedEnvironment = false
end
function u12.KnitStart(p16) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.KnitStart(p16)
end
function u12.onWin(u17, _) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u7
        [3] = u8
        [4] = u4
    --]]
    if not u17.changedEnvironment then
        u17.changedEnvironment = true
        local v18 = u9:Create(u7, TweenInfo.new(1), {
            ["Brightness"] = 10,
            ["Ambient"] = Color3.fromRGB(189, 112, 217)
        })
        v18:Play()
        local v19 = u7:FindFirstChildOfClass("Atmosphere")
        if v19 then
            u9:Create(v19, TweenInfo.new(1), {
                ["Glare"] = 0.3,
                ["Haze"] = 10,
                ["Color"] = Color3.fromRGB(231, 195, 197),
                ["Decay"] = Color3.fromRGB(135, 70, 156)
            }):Play()
            u17.lightingMaid:GiveTask(v19)
        end
        local v20 = u8.LocalPlayer.Character
        if v20 ~= nil then
            v20 = v20:GetPivot().Position
        end
        if v20 then
            u4.Controllers.ScreenShakeController:shake(v20, Vector3.new(0, -1, 0), {
                ["zMagnitude"] = 1,
                ["magnitude"] = 1,
                ["cycles"] = 30,
                ["duration"] = 2
            })
        end
        v18.Completed:Connect(function() --[[ Line: 68 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u7
                [3] = u17
                [4] = u4
            --]]
            u9:Create(u7, TweenInfo.new(1), {
                ["Brightness"] = 2,
                ["Ambient"] = Color3.fromRGB(112, 20, 232)
            }):Play()
            local v21 = u7:FindFirstChildOfClass("Atmosphere")
            if v21 then
                u9:Create(v21, TweenInfo.new(1), {
                    ["Glare"] = 1,
                    ["Haze"] = 2,
                    ["Color"] = Color3.fromRGB(231, 195, 197),
                    ["Decay"] = Color3.fromRGB(135, 70, 156)
                }):Play()
                u17.lightingMaid:GiveTask(v21)
            end
            local v22 = u4.Controllers.LightingController.skyModifier:addModifier(20, {
                ["SkyboxBk"] = "rbxassetid://9851144466",
                ["SkyboxDn"] = "rbxassetid://9851144249",
                ["SkyboxFt"] = "rbxassetid://9851144099",
                ["SkyboxLf"] = "rbxassetid://9851143942",
                ["SkyboxRt"] = "rbxassetid://9851143761",
                ["SkyboxUp"] = "rbxassetid://9851143257",
                ["CelestialBodiesShown"] = false,
                ["StarCount"] = 3000
            })
            u17.lightingMaid:GiveTask(v22)
        end)
    end
end
v3.CreateController(u12.new())
return nil