local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking").TrackType
local u6 = v1.import(script, script.Parent, "player-highlights").PlayerHighlightsWrapper
return function(p7) --[[ Line: 8 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u5
        [4] = u2
        [5] = u3
    --]]
    local v8 = u4
    local v9 = u6
    local v10 = {
        ["cards"] = {
            {
                ["amount"] = 33,
                ["trackType"] = u5.BLOCKBREAKS,
                ["player"] = u2.Dummy.Asen
            },
            {
                ["amount"] = 420,
                ["trackType"] = u5.DAMAGE,
                ["player"] = u2.Dummy.oiogy
            },
            {
                ["amount"] = 7,
                ["trackType"] = u5.KILLS,
                ["player"] = u2.Dummy.Bryan3838
            }
        }
    }
    local u11 = v8("PlayerHighlights", v9, v10, {}, {
        ["Parent"] = p7
    })
    return function() --[[ Line: 26 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u11
        --]]
        return u3.unmount(u11)
    end
end