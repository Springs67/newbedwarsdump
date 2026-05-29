local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ContentProvider
local u8 = v6.SoundService
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "AmbientSoundController"
    end,
    ["__index"] = u9
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
        [1] = u9
        [2] = u5
        [3] = u8
    --]]
    u9.constructor(p15)
    p15.Name = "AmbientSoundController"
    p15.ambienceGroup = u5("SoundGroup", {
        ["Name"] = "Ambience",
        ["Parent"] = u8
    })
    p15.activeTracks = {}
end
function u12.KnitStart(u16) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
        [3] = u11
    --]]
    u9.KnitStart(u16)
    local u17 = u10.WIND_AMBIENCE
    if u11.isLobbyServer() then
        u17 = u10.FOREST_AMBIENCE
    end
    if u11.isAfkServer() then
        u17 = nil
    end
    task.spawn(function() --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u16
        --]]
        if u17 ~= "" and u17 then
            u16:startAmbience(u17)
        end
    end)
end
function u12.startAmbience(u18, u19) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u5
        [3] = u2
        [4] = u4
    --]]
    u18:stopAmbience(u19)
    u7:PreloadAsync({ u5("Sound", {
            ["SoundId"] = u19
        }) })
    local u20 = u2:playSound(u19, {
        ["fadeInTime"] = 2,
        ["looped"] = true
    })
    u18.activeTracks[u19] = u20
    local v21 = u20:getInstance()
    if v21 then
        v21.Name = "AmbientSoundController"
    end
    local v22 = u4.new()
    v22:GiveTask(function() --[[ Line: 80 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u19
            [3] = u20
        --]]
        if u18.activeTracks[u19] == u20 then
            u18:stopAmbience(u19)
        end
    end)
    return v22
end
function u12.stopAmbience(p23, p24, p25) --[[ Line: 89 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v26 = p25 == nil and 2 or p25
    if p24 == nil then
        for v27, u28 in p23.activeTracks do
            p23.activeTracks[v27] = nil
            if v26 > 0 then
                u2:tweenSoundVolume(u28, 0, v26)
            end
            task.delay(v26, function() --[[ Line: 117 ]]
                --[[
                Upvalues:
                    [1] = u28
                --]]
                u28:Stop()
                u28:Destroy()
            end)
        end
    else
        local u29 = p23.activeTracks[p24]
        if u29 then
            p23.activeTracks[p24] = nil
            if v26 > 0 then
                u2:tweenSoundVolume(u29, 0, v26)
            end
            task.delay(v26, function() --[[ Line: 105 ]]
                --[[
                Upvalues:
                    [1] = u29
                --]]
                u29:Stop()
                u29:Destroy()
            end)
            return
        end
    end
end
v3.CreateController(u12.new())
return nil