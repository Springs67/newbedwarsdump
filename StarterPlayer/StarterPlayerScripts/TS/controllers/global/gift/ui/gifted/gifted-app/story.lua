local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "misc", "kit-viewport").KitViewport
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil
local u7 = v1.import(script, script.Parent, "gifted-app").GiftedApp
return function(p8) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
        [3] = u2
        [4] = u3
        [5] = u5
        [6] = u6
    --]]
    local v9 = u4
    local v10 = u7
    local v11 = {
        ["giftName"] = "Grim Reaper",
        ["message"] = "Happy birthday buddy xd \240\159\142\130",
        ["giftCustomImage"] = u2.createElement(u3, {
            ["BackgroundTransparency"] = 1,
            ["SizeConstraint"] = "RelativeYY",
            ["Kit"] = u5.GRIM_REAPER,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }),
        ["fromPlayer"] = u6.Dummy.LongNameMan
    }
    local u12 = v9("GiftedApp", v10, v11, {}, {
        ["Parent"] = p8
    })
    return function() --[[ Line: 25 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u12
        --]]
        return u2.unmount(u12)
    end
end