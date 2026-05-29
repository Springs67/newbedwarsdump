local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u8 = v1.import(script, script.Parent, "training-room-kit-selection-app").TrainingRoomKitSelectionApp
return function(p9) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u7
        [3] = u6
        [4] = u5
        [5] = u4
        [6] = u8
        [7] = u3
    --]]
    u5:dispatch({
        ["type"] = "SetEquippedKitSkins",
        ["equippedKitSkins"] = (function() --[[ Line: 11 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u7
                [3] = u6
            --]]
            local v10 = u2.values(u7)
            local v11 = table.create(#v10)
            for v12, v13 in v10 do
                local _ = v12 - 1
                v11[v12] = { v13, u6.DEFAULT }
            end
            return u2.fromEntries(v11)
        end)()
    })
    u5:dispatch({
        ["type"] = "AddOwnedKits",
        ["kits"] = { u7.FROSTY_HAMMER }
    })
    u5:dispatch({
        ["type"] = "BedwarsSetSome",
        ["data"] = {
            ["playerLevel"] = 20,
            ["freeKitLevel"] = 20
        }
    })
    local u14 = u4("TrainingRoomKitSelectionApp", u8, {}, {}, {
        ["Parent"] = p9
    })
    return function() --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u14
        --]]
        u3.unmount(u14)
    end
end