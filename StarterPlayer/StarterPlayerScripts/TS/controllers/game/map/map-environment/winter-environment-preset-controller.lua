local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchPlayerCharacter
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.ReplicatedStorage
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "footstep-sounds")
local u11 = v10.BlockFootstepSound
local u12 = v10.FootstepSounds
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "accessory-util").AccessoryUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "environments", "map-environment-types").EnvironmentPreset
local u17 = v1.import(script, script.Parent.Parent, "lighting-environments", "winter-environment").WinterEnvironment
local u18 = v1.import(script, script.Parent, "base-environment-preset-controller").BaseEnvironmentPresetController
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "WinterEnvironmentPresetController"
    end,
    ["__index"] = u18
})
u19.__index = u19
function u19.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u16
        [3] = u17
        [4] = u13
        [5] = u5
    --]]
    local v23 = u18.constructor
    local v24 = u16.Winter
    local v25 = u17
    local v26 = {
        {
            ["ambientSoundName"] = u13.AMBIENCE_SNOW
        }
    }
    local v27 = {
        ["sounds"] = {
            {
                ["volumeMultiplier"] = 0.4,
                ["soundId"] = u13.WINTER_EVENT_MINIGAME_MUSIC
            }
        }
    }
    v23(p22, v24, v25, v26, nil, v27)
    p22.Name = "WinterEnvironmentPresetController"
    p22.winterBlizzardMaid = u5.new()
end
function u19.KnitStart(p28) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    u18.KnitStart(p28)
end
function u19.onEnable(p29) --[[ Line: 49 ]]
    local v30 = p29.mapMeta
    if v30 ~= nil then
        v30 = v30.environment
        if v30 ~= nil then
            v30 = v30.winterSettings
        end
    end
    p29.winterSettings = v30
end
function u19.onIntensityChanged(p31, p32) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    if not p31.weatherIntensityInitialized then
        u3.Controllers.SnowWeatherParticleController:enable(p32)
        p31.maid:GiveTask(function() --[[ Line: 64 ]]
            --[[
            Upvalues:
                [1] = u3
            --]]
            u3.Controllers.SnowWeatherParticleController:disable()
        end)
    end
    u3.Controllers.SnowWeatherParticleController:setIntensity(p32)
end
function u19.onDynamicEventStarted(p33) --[[ Line: 70 ]]
    p33.winterBlizzardMaid:DoCleaning()
    p33.winterBlizzardMaid:GiveTask(p33:setWinterBlizzardEnvironment(true))
    p33:setupFrostedFeet()
end
function u19.onDynamicEventEnded(p34) --[[ Line: 76 ]]
    p34.winterBlizzardMaid:DoCleaning()
    p34.winterBlizzardMaid:GiveTask(p34:setWinterBlizzardEnvironment(false))
end
function u19.setWinterBlizzardEnvironment(u35, u36) --[[ Line: 81 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u9
        [4] = u4
    --]]
    local v37 = u5.new()
    local u38 = u3.Controllers.LightingController:getAtmosphere()
    if not u38 then
        return v37
    end
    if u36 then
        u35.lastAtmosphereDensity = u38.Density
    end
    local u43 = u9(3, u4, function(p39) --[[ Line: 90 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u35
            [3] = u38
        --]]
        if not u36 then
            p39 = 1 - p39
        end
        local v40 = math
        local v41 = u35.lastAtmosphereDensity
        local v42 = v41 == nil and 0 or v41
        u38.Density = v40.lerp(v42, 0.4, p39)
    end)
    v37:GiveTask(function() --[[ Line: 99 ]]
        --[[
        Upvalues:
            [1] = u43
        --]]
        if u43.Running then
            u43:Cancel()
        end
    end)
    return v37
end
function u19.setupFrostedFeet(u44) --[[ Line: 106 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u12
        [3] = u3
        [4] = u7
        [5] = u2
        [6] = u8
        [7] = u14
        [8] = u15
    --]]
    local v45 = u12[u11.ICE]
    if v45 then
        u44.winterBlizzardMaid:GiveTask(u3.Controllers.FootstepsController.footstepModifier:addModifier({
            ["localVolumeMultiplier"] = 2,
            ["localFootstepFrequency"] = 0.13513513513513511,
            ["soundConfig"] = v45
        }))
    end
    for v46, v47 in u7:GetPlayers() do
        local _ = v46 - 1
        u44.winterBlizzardMaid:GiveTask(u2(v47, function(u48, u49) --[[ Line: 118 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u14
                [3] = u44
                [4] = u15
            --]]
            task.defer(function() --[[ Line: 119 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u14
                    [3] = u48
                    [4] = u49
                    [5] = u44
                    [6] = u15
                --]]
                local v50 = u8.Assets.Armor:FindFirstChild("frost_boots")
                if v50 ~= nil then
                    local v51 = v50:GetChildren()
                    local function v54(p52) --[[ Line: 123 ]]
                        --[[
                        Upvalues:
                            [1] = u14
                            [2] = u48
                            [3] = u49
                            [4] = u44
                        --]]
                        if p52:IsA("Accessory") then
                            local u53 = p52:Clone()
                            u14:setAccessoryTransparency(u53, 1)
                            u14:addAccessory(u48, u53)
                            u49:GiveTask(u14:tweenAccessoryTransparency(u53, 0.5, 3))
                            u44.winterBlizzardMaid:GiveTask(function() --[[ Line: 129 ]]
                                --[[
                                Upvalues:
                                    [1] = u49
                                    [2] = u14
                                    [3] = u53
                                --]]
                                u49:GiveTask(u14:tweenAccessoryTransparency(u53, 1, 3))
                                task.delay(1, function() --[[ Line: 131 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u53
                                    --]]
                                    u53:Destroy()
                                end)
                            end)
                            u49:GiveTask(u53)
                        end
                    end
                    for v55, v56 in v51 do
                        v54(v56, v55 - 1, v51)
                    end
                end
                u15:weldCharacterAccessories(u48)
            end)
        end))
    end
end
u3.CreateController(u19.new())
return nil