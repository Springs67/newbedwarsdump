local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u7 = v1.import(script, script.Parent, "bountyhunter-poster").BountyHunterPoster
return function(p8) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u6
        [4] = u4
        [5] = u7
        [6] = u2
    --]]
    u5:dispatch({
        ["type"] = "KitBountyHunterSetTarget",
        ["bountyHunterTarget"] = u3.LocalPlayer or {
            ["UserId"] = 1,
            ["Name"] = "Vulcan"
        }
    })
    u5:dispatch({
        ["type"] = "BedwarsSetKits",
        ["userId"] = 1,
        ["kit"] = u6.VULCAN
    })
    local u9 = u4("BountyHunterPoster", u7, {}, {}, {
        ["Parent"] = p8
    })
    return function() --[[ Line: 26 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u9
        --]]
        return u2.unmount(u9)
    end
end