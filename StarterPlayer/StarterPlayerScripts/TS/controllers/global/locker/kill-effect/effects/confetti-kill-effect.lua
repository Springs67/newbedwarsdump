local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.SoundManager
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.ReplicatedStorage
local u9 = v7.Workspace
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "Anonymous"
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
function u12.constructor(p15, ...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p15, ...)
end
function u12.onKill(_, _, _, p16) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u9
        [4] = u3
        [5] = u8
        [6] = u4
        [7] = u10
        [8] = u1
    --]]
    local v17 = u5.new()
    local u18 = u6("Part", {
        ["Size"] = Vector3.new(1, 1, 1),
        ["Transparency"] = 1,
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["CFrame"] = p16,
        ["Parent"] = u9
    })
    v17:GiveTask(u18)
    u3:setQueryIgnored(u18, true)
    local u19 = u8:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("ConfettiParticle"):Clone()
    u19.Enabled = false
    u19.Parent = u18
    v17:GiveTask(u19)
    v17:GiveTask(u4:playSound(u10.CONFETTI, {
        ["position"] = p16.Position
    }))
    u1.Promise.defer(function() --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        local v20 = false
        local v21 = 0
        while true do
            if v20 then
                v21 = v21 + 1
            else
                v20 = true
            end
            if v21 >= 5 then
                return
            end
            u19:Emit(20)
        end
    end)
    u1.Promise.delay(4):andThen(function() --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        u18:Destroy()
    end)
    return v17
end
return u12