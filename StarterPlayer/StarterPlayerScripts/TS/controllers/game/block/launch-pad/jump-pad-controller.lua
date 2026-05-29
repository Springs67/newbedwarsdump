local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "JumpPadController"
    end,
    ["__index"] = u7
})
u10.__index = u10
function u10.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p13)
    p13.Name = "JumpPadController"
end
function u10.KnitStart(p14) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u5
        [3] = u8
        [4] = u9
        [5] = u6
        [6] = u2
    --]]
    u7.KnitStart(p14)
    u5.Controllers.PreloadController:preloadForItemType(u8.JUMP_PAD, {
        ["sounds"] = { u9.LAUNCH_PAD_ACTIVATE }
    })
    u6.LaunchPadUsed:connect(function(p15) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u2
            [3] = u9
        --]]
        if p15.launchpad.Name == u8.JUMP_PAD then
            u2:playSound(u9.LAUNCH_PAD_ACTIVATE, {
                ["position"] = p15.launchpad.Position
            })
        end
    end)
end
v4.CreateController(u10.new())
return nil