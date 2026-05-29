local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.RandomUtil
local u6 = v3.SoundManager
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "game", "stateful-entity", "ui", "stateful-entity-hp-bar-billboard").StatefulEntityHpBarBillboard
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "DogPersonController"
    end,
    ["__index"] = u14
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
        [1] = u14
    --]]
    u14.constructor(p21)
    p21.Name = "DogPersonController"
end
function u18.KnitStart(p22) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u9
        [3] = u17
        [4] = u15
    --]]
    u14.KnitStart(p22)
    u9.Controllers.PreloadController:runPreload({
        ["sounds"] = {
            u17.BHAA_GRUNT_1,
            u17.BHAA_GRUNT_2,
            u17.BHAA_SPAWN,
            u17.BHAA_SPIKE,
            u17.BHAA_SPIKE_WARMUP
        },
        ["animations"] = {
            u15.BHAA_ATTACK,
            u15.BHAA_DEATH,
            u15.BHAA_IDLE,
            u15.BHAA_MOVEMENT,
            u15.BHAA_SUMMON,
            u15.BHAA_ROCKSPIKE,
            u15.BHAA_ROCKWAVE,
            u15.BHAA_SPAWN
        }
    })
end
function u18.createClientModel(p23, p24) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u4
        [3] = u16
        [4] = u15
    --]]
    if not p24.PrimaryPart then
        return nil
    end
    local v25 = u11.Assets.Misc.Anubis:Clone()
    v25:PivotTo(p24.PrimaryPart.CFrame - Vector3.new(0, 6, 0))
    v25.Parent = p24
    p23.model = v25
    p23.track = u4:playAnimation(v25, u16:getAssetId(u15.ANUBIS_IDLE))
end
function u18.attackEffect(u26, p27) --[[ Line: 66 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u17
        [4] = u12
        [5] = u10
        [6] = u4
        [7] = u16
        [8] = u15
    --]]
    local v28 = u26.model
    if v28 ~= nil then
        v28 = v28.PrimaryPart
        if v28 ~= nil then
            v28 = v28.Position
        end
    end
    if not (u26.model and v28) then
        return nil
    end
    local v29 = v28.Y
    local v30 = Vector3.new(0, v29, 0)
    local v31 = p27 * Vector3.new(1, 0, 1) + v30
    u6:playSound(u5.fromList(u17.GUARDIAN_OF_DREAM_ATTACK_1, u17.GUARDIAN_OF_DREAM_ATTACK_2), {
        ["rollOffMaxDistance"] = 220,
        ["position"] = v28
    })
    u12(0.3, u10, function(p32) --[[ Line: 88 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        if u26.model then
            u26.model:PivotTo(p32)
        end
    end, u26.model.PrimaryPart.CFrame, CFrame.new(v28, v31))
    u26.track = u4:playAnimation(u26.model, u16:getAssetId(u15.ANUBIS_ATTACK))
    task.delay(0.7, function() --[[ Line: 94 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u4
            [3] = u16
            [4] = u15
        --]]
        if u26.model then
            u26.track = u4:playAnimation(u26.model, u16:getAssetId(u15.ANUBIS_IDLE))
        end
    end)
end
function u18.createEntityHealthbar(_, p33, p34) --[[ Line: 100 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u13
    --]]
    local v35 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
    local v36 = {
        ["app"] = u13
    }
    local v37 = p33:GetPivot().Position
    v36.appId = "StatefulEntityHpBarBillboard_" .. tostring(v37)
    v35:openApp(v36, {
        ["hpBarOffset"] = Vector3.new(0, 5.5, 0),
        ["gameEntity"] = p33,
        ["serverInstance"] = p33,
        ["barColor"] = p34
    }, nil, p33)
    if not p33:GetAttribute("ItemType") then
        return nil
    end
end
v8.CreateController(u18.new())
return nil