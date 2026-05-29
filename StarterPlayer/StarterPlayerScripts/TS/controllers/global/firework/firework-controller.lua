local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.RandomUtil
local u5 = v2.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.ReplicatedStorage
local u11 = v9.Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "FireworkController"
    end,
    ["__index"] = u12
})
u16.__index = u16
function u16.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u8
        [3] = u11
    --]]
    u12.constructor(p19)
    p19.Name = "FireworkController"
    p19.fireworksFolder = u8("Folder", {
        ["Name"] = "Fireworks",
        ["Parent"] = u11
    })
end
function u16.KnitStart(p20) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.KnitStart(p20)
end
function u16.playFireworkEffect(p21, u22, p23, u24) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u10
        [3] = u13
        [4] = u4
        [5] = u3
        [6] = u15
        [7] = u14
        [8] = u5
    --]]
    local u25 = u7.new()
    local v26 = u10.Assets.Effects.Fireworks
    local v27 = nil
    if p23 == u13.NORMAL then
        v27 = u4.fromList(v26.Firework_1, v26.Firework_2, v26.Firework_3)
    elseif p23 == u13.SPARKS then
        v27 = u4.fromList(v26.Firework_4)
    elseif p23 == u13.HEART then
        v27 = u4.fromList(v26.FireworkHearts_1)
    elseif p23 == u13.DV then
        v27 = u4.fromList(v26.Firework_Dv_1)
    elseif p23 == u13.NEW_YEARS then
        v27 = v26.FireworkNewYears
    elseif p23 == u13.GOOSE then
        v27 = v26.Goose
    elseif p23 == u13.FIREWORK_CRATE then
        v27 = v26.FireworkCrate
    elseif p23 == u13.METEOR then
        v27 = v26.Meteor
    elseif p23 == u13.RAINBOW_METEOR then
        v27 = v26.RainbowMeteor
    elseif p23 == u13.CONFETTI then
        v27 = v26.Confetti
    else
        error("Unknown firework type:", p23)
    end
    local u28 = v27:Clone()
    local v29
    if u24 == nil then
        v29 = u24
    else
        v29 = u24.color
    end
    if v29 then
        local v30 = u28:GetDescendants()
        local function v32(p31) --[[ Line: 76 ]]
            --[[
            Upvalues:
                [1] = u24
            --]]
            if p31:IsA("ParticleEmitter") and u24.color ~= nil then
                p31.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, u24.color), ColorSequenceKeypoint.new(1, u24.color) })
            end
        end
        for v33, v34 in v30 do
            v32(v34, v33 - 1, v30)
        end
    end
    u25:GiveTask(u28)
    u28.CanCollide = false
    u28.CanQuery = false
    u28.Anchored = true
    u28.Transparency = 1
    u3:setQueryIgnored(u28, true)
    u28.Parent = p21.fireworksFolder
    u28.CFrame = CFrame.new(u22)
    local v35 = u15
    local v36 = u28:GetChildren()
    local v37 = {}
    local v38
    if u24 == nil then
        v38 = u24
    else
        v38 = u24.sizeMultiplier
    end
    v37.sizeMultiplier = v38
    v35:playEffects(v36, nil, v37)
    local v39 = u4.fromList(u14.FIREWORK_EXPLODE_1, u14.FIREWORK_EXPLODE_2, u14.FIREWORK_EXPLODE_3)
    local v40
    if u24 == nil then
        v40 = u24
    else
        v40 = u24.noSound
    end
    if not v40 then
        local v41 = u5
        local v42 = {
            ["rollOffMaxDistance"] = 1000,
            ["rollOffMinDistance"] = 200,
            ["position"] = u22
        }
        local v43
        if u24 == nil then
            v43 = u24
        else
            v43 = u24.volumeMultiplier
        end
        v42.volumeMultiplier = v43
        local v44
        if u24 == nil then
            v44 = u24
        else
            v44 = u24.popSoundPlaybackSpeedMultiplier
        end
        v42.playbackSpeedMultiplier = v44
        u25:GiveTask(v41:playSound(v39, v42))
    end
    local u45 = u4.fromList(u14.FIREWORK_CRACKLE_1, u14.FIREWORK_CRACKLE_2, u14.FIREWORK_CRACKLE_3)
    task.delay(0.4, function() --[[ Line: 134 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u25
            [3] = u5
            [4] = u22
            [5] = u45
        --]]
        local v46 = u24
        if v46 ~= nil then
            v46 = v46.noSound
        end
        if not v46 then
            local v47 = u25
            local v48 = u5
            local v49 = {
                ["rollOffMaxDistance"] = 1000,
                ["position"] = u22
            }
            local v50 = u24
            if v50 ~= nil then
                v50 = v50.volumeMultiplier
            end
            v49.volumeMultiplier = v50
            v47:GiveTask(v48:playSound(u45, v49))
        end
    end)
    task.delay(8, function() --[[ Line: 155 ]]
        --[[
        Upvalues:
            [1] = u28
        --]]
        u28:Destroy()
    end)
    return u25
end
v6.CreateController(u16.new())
return nil