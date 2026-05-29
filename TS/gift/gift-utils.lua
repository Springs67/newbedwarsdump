local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-type").BundleType
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-type").GiftType
local v14 = {
    ["isKitGift"] = function(p7) --[[ Name: isKitGift, Line 11 ]]
        --[[
        Upvalues:
            [1] = u5
        --]]
        return u5[p7] ~= nil
    end,
    ["isKitSkinGift"] = function(p8) --[[ Name: isKitSkinGift, Line 15 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        return u4[p8] ~= nil
    end,
    ["isBundleGift"] = function(p9) --[[ Name: isBundleGift, Line 19 ]]
        --[[
        Upvalues:
            [1] = u3
        --]]
        return u3[p9] ~= nil
    end,
    ["getKitKeyFromValue"] = function(p10) --[[ Name: getKitKeyFromValue, Line 24 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u5
        --]]
        local v11 = nil
        for v12, v13 in u2.entries(u5) do
            local _ = v12 - 1
            local _ = v13[1]
            if (v13[2] == p10 and true or nil) == true then
                v11 = v13
                break
            end
        end
        return v11[1]
    end
}
local u15 = u2.values(v6)
function v14.isAGiftType(p16) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    return table.find(u15, p16) ~= nil
end
function v14.getKitSkinKeyFromValue(p17) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
    --]]
    local v18 = nil
    for v19, v20 in u2.entries(u4) do
        local _ = v19 - 1
        local _ = v20[1]
        if (v20[2] == p17 and true or nil) == true then
            v18 = v20
            break
        end
    end
    return v18[1]
end
return {
    ["GiftUtils"] = v14
}