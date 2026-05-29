local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local v3 = v2.ColorUtil
local u4 = v2.SoundManager
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = {
    Color3.fromRGB(255, 171, 0),
    Color3.fromRGB(245, 163, 38),
    Color3.fromRGB(224, 171, 46),
    Color3.fromRGB(237, 186, 71)
}
local u13 = {
    v3.hexColor(65280),
    v3.hexColor(59391),
    v3.hexColor(65313),
    v3.hexColor(9573)
}
local u14 = {
    v3.hexColor(14021119),
    v3.hexColor(2498925),
    v3.hexColor(11206655),
    v3.hexColor(2502500)
}
local u15 = v3.hexColor(45122)
local u16 = v3.hexColor(7704721)
local u17 = {
    0,
    0.442,
    0.692,
    1
}
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "PoisonFogEffectController"
    end,
    ["__index"] = u9
})
u18.__index = u18
function u18.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u7
    --]]
    u9.constructor(p21)
    p21.Name = "PoisonFogEffectController"
    p21.maid = u7.new()
    p21.poisonCountdownMaid = u7.new()
end
function u18.KnitStart(u22) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
        [3] = u4
        [4] = u11
        [5] = u12
    --]]
    u9.KnitStart(u22)
    u10.Client:Get("HalloweenPoisonWarning"):Connect(function() --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u11
            [3] = u22
            [4] = u12
        --]]
        u4:playSound(u11.COUNTDOWN_GAMESTART, {
            ["volumeMultiplier"] = 1
        })
        u22:changeColors({
            ["layer1"] = u12,
            ["layer3"] = Color3.fromRGB(227, 145, 26)
        }, {
            ["layer1"] = u12,
            ["layer3"] = Color3.fromRGB(227, 145, 26)
        })
    end)
    u10.Client:Get("SetHalloweenPoisonEnabled"):Connect(function(p23) --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        if p23 then
            u22:enablePoison()
        else
            u22:disablePoisonEffect()
        end
    end)
end
function u18.enablePoisonCountdownSound(p24, p25) --[[ Line: 61 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u11
    --]]
    local u26 = p25 == nil and 1 or p25
    p24.poisonCountdownMaid:DoCleaning()
    local u27 = true
    p24.poisonCountdownMaid:GiveTask(function() --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27 = false
    end)
    task.spawn(function() --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u11
            [3] = u26
            [4] = u27
        --]]
        while true do
            u4:playSound(u11.COUNTDOWN_TICK)
            local v28 = task.wait(u26)
            if v28 ~= 0 and (v28 == v28 and v28) then
                v28 = u27
            end
            if v28 == 0 or (v28 ~= v28 or not v28) then
                return
            end
        end
    end)
end
function u18.enablePoison(p29) --[[ Line: 82 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u11
        [3] = u13
        [4] = u15
    --]]
    p29.poisonCountdownMaid:DoCleaning()
    u4:playSound(u11.LUNAR_VENOM_INFECTION)
    p29.poisonSound = u4:playSound(u11.HALLOWEEN_BOSS_FOG_LOOP, {
        ["looped"] = true
    })
    p29:changeColors({
        ["layer1"] = u13,
        ["layer3"] = u15
    }, {
        ["layer1"] = u13,
        ["layer3"] = u15
    })
end
function u18.disablePoisonEffect(u30) --[[ Line: 96 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u13
        [3] = u15
        [4] = u14
        [5] = u16
    --]]
    local u31 = u30.poisonSound
    if u31 then
        u4:tweenSoundVolume(u31, 0, 0.5)
        task.delay(0.5, function() --[[ Line: 101 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u31
            --]]
            if u30.poisonSound ~= u31 then
                return nil
            end
            local v32 = u30.poisonSound
            if v32 ~= nil then
                v32:Stop()
            end
            local v33 = u30.poisonSound
            if v33 ~= nil then
                v33:Destroy()
            end
            u30.poisonSound = nil
        end)
    end
    u30:changeColors({
        ["layer1"] = u13,
        ["layer3"] = u15
    }, {
        ["layer1"] = u14,
        ["layer3"] = u16
    })
end
function u18.changeColors(p34, u35, u36) --[[ Line: 124 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u6
        [3] = u17
    --]]
    local v37 = game.Workspace:FindFirstChild("skeleton_boss") or game.Workspace:FindFirstChild("halloween_boss")
    if v37 ~= nil then
        v37 = v37:FindFirstChild("Assets")
        if v37 ~= nil then
            v37 = v37:FindFirstChild("Scenery")
            if v37 ~= nil then
                v37 = v37:FindFirstChild("BossMist")
            end
        end
    end
    if not v37 then
        warn("Couldn\'t find mist.")
        return nil
    end
    p34.maid:DoCleaning()
    local u38 = v37:FindFirstChild("MistLayer1")
    if u38 ~= nil then
        u38 = u38:FindFirstChild("Mist1")
        if u38 ~= nil then
            u38 = u38:FindFirstChild("Beam")
        end
    end
    local u39 = v37:FindFirstChild("MistLayer3")
    if u39 ~= nil then
        u39 = u39:FindFirstChild("Mist1")
        if u39 ~= nil then
            u39 = u39:FindFirstChild("Beam")
        end
    end
    local u48 = u8(0.5, u6, function(p40) --[[ Line: 157 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u35
            [3] = u17
            [4] = u36
            [5] = u39
        --]]
        local v41 = u38
        if v41 ~= nil then
            v41 = v41.Parent
        end
        if v41 then
            local v42 = u35.layer1
            local v43 = table.create(#v42)
            for v44, v45 in v42 do
                local v46 = v44 - 1
                v43[v44] = ColorSequenceKeypoint.new(u17[v46 + 1], v45:Lerp(u36.layer1[v46 + 1], p40))
            end
            u38.Color = ColorSequence.new(v43)
        end
        local v47 = u39
        if v47 ~= nil then
            v47 = v47.Parent
        end
        if v47 then
            u39.Color = ColorSequence.new(u35.layer3:Lerp(u36.layer3, p40))
        end
    end)
    p34.maid:GiveTask(function() --[[ Line: 183 ]]
        --[[
        Upvalues:
            [1] = u48
        --]]
        return u48:Cancel()
    end)
end
v5.CreateController(u18.new())
return nil