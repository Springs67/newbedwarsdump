local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.GameQueryUtil
local u5 = v2.GroupModifierBehavior
local u6 = v2.ModifierGroup
local u7 = v2.SoundManager
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u10 = v9.InQuad
local u11 = v9.InQuart
local u12 = v9.Linear
local u13 = v9.OutQuad
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "plasma", "src")
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "plasma", "src", "Runtime").useEffect
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u18 = v17.Lighting
local u19 = v17.Workspace
local v20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lighting", "default-lighting-constants")
local u21 = v20.DefaultAtmosphereProperties
local u22 = v20.DefaultLightingProperties
local u23 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "rain")
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u26 = Random.new()
local u27 = nil
local u28 = nil
return {
    ["ManageAtmosphereBehavior"] = {
        ["name"] = "Manage Atmosphere",
        ["event"] = "Heartbeat",
        ["func"] = function(u29, p30, _) --[[ Name: func, Line 33 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u3
                [3] = u6
                [4] = u18
                [5] = u14
                [6] = u5
                [7] = u8
                [8] = u28
                [9] = u11
                [10] = u24
                [11] = u10
                [12] = u12
                [13] = u21
                [14] = u22
                [15] = u23
                [16] = u19
                [17] = u4
                [18] = u26
                [19] = u7
                [20] = u25
                [21] = u15
                [22] = u13
                [23] = u16
            --]]
            local u31
            if u29.chainInfo == nil then
                u31 = false
            else
                u31 = u29.chainInfo.stageInChain > 0
            end
            if not u27 then
                local v32
                if u3.isHoarceKat() then
                    v32 = u6.new(u18:FindFirstChildOfClass("Atmosphere") or u14("Atmosphere", {
                        ["Parent"] = u18
                    }), {
                        ["baseProperties"] = {
                            ["Density"] = 0.25,
                            ["Offset"] = 0,
                            ["Glare"] = 0,
                            ["Haze"] = 0,
                            ["Color"] = Color3.fromRGB(198, 198, 198),
                            ["Decay"] = Color3.fromRGB(104, 112, 124)
                        },
                        ["behavior"] = u5.Merge
                    })
                else
                    v32 = u8.Controllers.LightingController:getAtmosphereModifier()
                end
                u27 = v32
            end
            if not u28 then
                local v33
                if u3.isHoarceKat() then
                    v33 = u6.new(u18, {
                        ["baseProperties"] = {
                            ["Brightness"] = 2,
                            ["EnvironmentDiffuseScale"] = 0.1,
                            ["EnvironmentSpecularScale"] = 0.1,
                            ["GlobalShadows"] = true,
                            ["ShadowSoftness"] = 0.2,
                            ["ClockTime"] = 14,
                            ["GeographicLatitude"] = -7,
                            ["ExposureCompensation"] = 0.05,
                            ["Ambient"] = Color3.fromRGB(89, 60, 86),
                            ["ColorShift_Bottom"] = Color3.fromRGB(0, 0, 0),
                            ["ColorShift_Top"] = Color3.fromRGB(117, 57, 57),
                            ["OutdoorAmbient"] = Color3.fromRGB(216, 191, 161)
                        },
                        ["behavior"] = u5.Merge
                    })
                else
                    v33 = u8.Controllers.LightingController.lightingModifier
                end
                u28 = v33
            end
            local v34
            if u31 == true then
                v34 = 1
            else
                local v35 = u11(u29.elapsedEventTime, 0, 1, u29.totalLength) * 10000
                local v36 = math.floor(v35) / 10000
                v34 = math.clamp(v36, 0, 1)
            end
            if u31 and u29.elapsedEventTime > u24.HouseExplodes then
                if u29.elapsedEventTime < u24.CelebrationEnds + 0 then
                    local v37 = u10(u29.elapsedEventTime - u24.HouseExplodes, 1, -1, u24.CelebrationEnds - u24.HouseExplodes)
                    v34 = math.clamp(v37, 0, 1)
                else
                    local v38 = u10(u29.elapsedEventTime - u24.CelebrationEnds + 0, 0, 1, 2)
                    v34 = math.clamp(v38, 0, 1)
                end
            end
            if p30:get("atmosphereModifier") then
                if u31 == true or u29.elapsedEventTime > u29.totalLength * 0.5 then
                    p30:get("atmosphereModifier"):setProperties({
                        ["Density"] = u12(v34, u21.Density, 0.35 - u21.Density, 1),
                        ["Color"] = u21.Color:Lerp(Color3.fromRGB(52, 70, 66), v34),
                        ["Haze"] = u12(v34, u21.Haze, 10 - u21.Haze, 1)
                    })
                end
            else
                p30:set("atmosphereModifier", u27:addModifier(100, {}))
            end
            if p30:get("lightingModifier") then
                p30:get("lightingModifier"):setProperties({
                    ["Ambient"] = u22.Ambient:Lerp(Color3.fromRGB(47, 60, 85), v34),
                    ["ColorShift_Top"] = u22.ColorShift_Top:Lerp(Color3.fromRGB(0, 0, 0), v34),
                    ["OutdoorAmbient"] = u22.OutdoorAmbient:Lerp(Color3.fromRGB(88, 112, 117), v34),
                    ["ClockTime"] = u12(v34, u22.ClockTime, 10 - u22.ClockTime, 1),
                    ["Brightness"] = u12(v34, u22.Brightness, 1 - u22.Brightness, 1)
                })
            else
                p30:set("lightingModifier", u28:addModifier(100, {}))
            end
            local v39 = p30:get("rainEnabled")
            if u31 == true or u29.elapsedEventTime > u29.totalLength * 0.7 then
                if v39 ~= true then
                    u23:Enable()
                    u23:SetIntensityRatio(0.2)
                    u23:SetTransparency(0.8)
                    u23:SetStraightTexture("rbxassetid://8030734851")
                    u23:SetSplashTexture("rbxassetid://8030760338")
                    u23:SetDirection(Vector3.new(0.1, -1, 0))
                    u23:SetSoundId("")
                    u23:SetSize(1)
                    local v40 = u19.CurrentCamera:FindFirstChild("__RainEmitter")
                    if v40 then
                        u4:setQueryIgnored(v40, true)
                    end
                    p30:set("rainEnabled", true)
                    v39 = true
                end
            else
                p30:set("rainEnabled", nil)
                v39 = nil
            end
            if v39 == nil then
                u23:Disable()
            end
            if p30:get("thunderLightningModifier") then
                if u31 == true or u29.elapsedEventTime > u29.totalLength * 0.8 then
                    local v41 = p30:get("nextThunder")
                    if v41 == 0 or (v41 ~= v41 or not v41) then
                        p30:set("nextThunder", os.clock() + u26:NextNumber(7, 15))
                    elseif v41 < os.clock() and (u29.elapsedEventTime >= u24.CelebrationEnds or (u29.elapsedEventTime <= u24.CelebrationStarts or not u31)) then
                        p30:set("nextThunder", os.clock() + u26:NextNumber(7, 15))
                        local u42 = p30:get("thunderLightningModifier")
                        task.spawn(function() --[[ Line: 137 ]]
                            --[[
                            Upvalues:
                                [1] = u7
                                [2] = u25
                                [3] = u26
                                [4] = u42
                            --]]
                            u7:playSound(u25.PIRATE_EVENT_THUNDER)
                            local v43 = u26:NextInteger(1, 3)
                            local v44 = false
                            local v45 = 0
                            while true do
                                if v44 then
                                    v45 = v45 + 1
                                else
                                    v44 = true
                                end
                                if v45 >= v43 then
                                    return
                                end
                                task.wait(u26:NextNumber(0.05, 0.3))
                                local v46 = u42
                                if v46 ~= nil then
                                    v46:setProperties({
                                        ["Brightness"] = 4 + u26:NextNumber(0, 3)
                                    })
                                end
                                task.wait(u26:NextNumber(0.05, 0.3))
                                local v47 = u42
                                if v47 ~= nil then
                                    v47:setProperties({})
                                end
                            end
                        end)
                    end
                end
            else
                p30:set("thunderLightningModifier", u28:addModifier(200, {}))
            end
            u15.portal(u19.Terrain, function() --[[ Line: 169 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u31
                    [3] = u13
                    [4] = u29
                    [5] = u16
                --]]
                local u50 = u15.useInstance(function(p48) --[[ Line: 170 ]]
                    local v49 = Instance.new("Clouds")
                    p48.clouds = v49
                    return v49
                end)
                local u51
                if u31 == true then
                    u51 = 1
                else
                    local v52 = u13(u29.elapsedEventTime, 0, 1, u29.totalLength) * 100
                    u51 = math.floor(v52) / 100
                end
                u16(function() --[[ Line: 176 ]]
                    --[[
                    Upvalues:
                        [1] = u50
                        [2] = u51
                    --]]
                    u50.clouds.Cover = u51 * 0.8
                    u50.clouds.Density = u51
                    u50.clouds.Color = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(15, 25, 36), u51)
                end, u51)
            end)
        end
    }
}