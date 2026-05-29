local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.SoundManager
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.Workspace
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "BubblesKillEffect"
    end,
    ["__index"] = u10
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14, ...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p14, ...)
end
function u11.onKill(_, _, _, p15) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u3
        [4] = u8
        [5] = u4
        [6] = u9
        [7] = u1
    --]]
    local v16 = u5.new()
    local u17 = u7.Assets.Effects.BubbleParticle:Clone()
    u3:setQueryIgnored(u17, true)
    u17.Transparency = 1
    u17.CFrame = p15
    u17.Parent = u8
    v16:GiveTask(u17)
    local u18 = u17:WaitForChild("Attachment"):WaitForChild("Bubbles")
    u18.Enabled = false
    v16:GiveTask(u18)
    v16:GiveTask(u4:playSound(u9.BUBBLE_KILL_EFFECT, {
        ["position"] = p15.Position
    }))
    u1.Promise.defer(function() --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        local v19 = false
        local v20 = 0
        while true do
            if v19 then
                v20 = v20 + 1
            else
                v19 = true
            end
            if v20 >= 5 then
                return
            end
            u18:Emit(10)
        end
    end)
    u1.Promise.delay(4):andThen(function() --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        u17:Destroy()
    end)
    return v16
end
return u11