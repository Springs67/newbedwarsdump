local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "world", "world-id").WorldId
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "VoidWorldMusicController"
    end,
    ["__index"] = u5
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p11)
    p11.Name = "VoidWorldMusicController"
end
function u8.KnitStart(p12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u3
        [4] = u7
        [5] = u2
        [6] = u6
    --]]
    u5.KnitStart(p12)
    local u13 = u4.new()
    u3.Controllers.WorldController:watchLocalWorld(function(p14) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u2
            [3] = u6
            [4] = u13
        --]]
        if p14 ~= nil then
            p14 = p14.Name
        end
        if p14 == u7.VOID_WORLD then
            local u15 = u2:playSound(u6.VOID_THEME_SONG, {
                ["fadeInTime"] = 2
            })
            u13:GiveTask(function() --[[ Line: 39 ]]
                --[[
                Upvalues:
                    [1] = u15
                --]]
                local v16 = u15
                if v16 ~= nil then
                    v16:Stop()
                end
            end)
        else
            u13:DoCleaning()
        end
    end)
end
function u8.playVoidWorldMusic(_) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u6
    --]]
    return u2:playSound(u6.VOID_THEME_SONG, {
        ["fadeInTime"] = 2
    })
end
u3.CreateController(u8.new())
return nil