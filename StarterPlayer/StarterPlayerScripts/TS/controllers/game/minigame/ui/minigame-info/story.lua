local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "minigame", "minigame-meta")
local u4 = v3.getMinigameMeta
local u5 = v3.MinigameType
local u6 = v1.import(script, script.Parent, "minigame-info").MinigameInfo
return function(p7) --[[ Line: 8 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u6
        [3] = u4
        [4] = u5
    --]]
    local u8 = u2.mount(u2.createElement(u6, {
        ["minigame"] = u4(u5.SNOWBALL_DODGEBALL),
        ["startTime"] = os.time() + 10
    }), p7)
    return function() --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u8
        --]]
        return u2.unmount(u8)
    end
end