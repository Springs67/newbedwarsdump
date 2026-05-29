local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil
local u6 = v1.import(script, script.Parent, "spectate-selector").SpectateSelector
return function(p7) --[[ Line: 8 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
        [3] = u4
        [4] = u5
        [5] = u2
    --]]
    local u8 = u3("spectate-selector", u6, {}, {}, {
        ["Parent"] = p7
    })
    u4:dispatch({
        ["type"] = "GameSetSpectator",
        ["spectating"] = true,
        ["spectatingPlayer"] = u5.Dummy.SnickTrix
    })
    return function() --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u8
        --]]
        return u2.unmount(u8)
    end
end