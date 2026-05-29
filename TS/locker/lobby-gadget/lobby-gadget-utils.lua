local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-meta").LobbyGadgetMeta
return {
    ["getLobbyGadgetImage"] = function(p4) --[[ Line: 5 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
        --]]
        local v5 = u3[p4]
        local v6 = v5.image
        if v6 ~= "" and v6 then
            return v5.image
        end
        if v5.items then
            return u2(v5.items[1].itemType).image
        end
    end
}