local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lobby", "player-profile", "dummy-player-profile-data").DummyProfileData
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u7 = v1.import(script, script.Parent, "achievements-app").AchievementsApp
return function(p8) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u4
        [4] = u6
        [5] = u7
        [6] = u2
    --]]
    u5:dispatch({
        ["type"] = "LobbySetProfileData",
        ["profileData"] = u3
    })
    local u9 = u4(u6.Achievements, u7, {}, {}, {
        ["Parent"] = p8
    })
    return function() --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u9
        --]]
        u2.unmount(u9)
    end
end