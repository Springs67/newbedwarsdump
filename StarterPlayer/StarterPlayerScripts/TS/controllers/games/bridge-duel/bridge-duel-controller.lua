local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "BridgeDuelController"
    end,
    ["__index"] = u4
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
    --]]
    u4.constructor(p12, { u6.BRIDGE_DUEL })
    p12.Name = "BridgeDuelController"
end
function u9.KnitStart(p13) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
        [3] = u2
        [4] = u8
        [5] = u3
        [6] = u5
    --]]
    u4.KnitStart(p13)
    u7.Client:Get("BigHammerHitPlayer"):Connect(function(p14) --[[ Line: 30 ]]
        local v15 = p14.player
        if v15 ~= nil then
            v15 = v15.Character
            if v15 ~= nil then
                v15 = v15.PrimaryPart
            end
        end
        if not v15 then
            return nil
        end
        v15:ApplyImpulse(p14.impulse)
    end)
    u7.Client:Get("BridgeDuelTouchdownEffects"):Connect(function(p16) --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u8
            [3] = u3
            [4] = u5
        --]]
        u2:playSound(u8.BRIDGE_DUEL_CHEER)
        local v17 = false
        local v18 = 0
        while true do
            if v17 then
                v18 = v18 + 1
            else
                v17 = true
            end
            if v18 >= 5 then
                return
            end
            local v19 = (math.random() - 0.5) * 100
            local v20 = math.random() * 75 + 50
            local v21 = (math.random() - 0.5) * 100
            local v22 = p16.position.X + v19
            local v23 = p16.position.Y + v20
            local v24 = p16.position.Z + v21
            local v25 = Vector3.new(v22, v23, v24)
            local v26 = math.random(1, 4)
            u3.Controllers.FireworkController:playFireworkEffect(v25, u5.NORMAL, {
                ["volumeMultiplier"] = 0.6,
                ["popSoundPlaybackSpeedMultiplier"] = 1,
                ["sizeMultiplier"] = v26,
                ["color"] = p16.color
            })
            task.wait(1)
        end
    end)
end
function u9.onGameInit(_) --[[ Line: 78 ]] end
u3.CreateController(u9.new())
return nil