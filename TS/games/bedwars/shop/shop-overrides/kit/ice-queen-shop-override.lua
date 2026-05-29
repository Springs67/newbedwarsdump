local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopOverride
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "IceQueenShopOverride"
    end,
    ["__index"] = u5
})
u6.__index = u6
function u6.new(...) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
    --]]
    u5.constructor(p9, {
        ["kit"] = u2.ICE_QUEEN
    })
end
function u6.shouldApply(p10, p11) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v12 = u4(p11, p10.config.kit)
    if v12 then
        local v13 = p10.config
        if v13 ~= nil then
            v13 = v13.enabled
        end
        v12 = v13 == nil and true or v13
    end
    return v12
end
function u6.getOverride(_) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return {
        {
            ["itemType"] = u3.IRON_SWORD,
            ["nextTier"] = u3.ICE_SWORD
        }
    }
end
return {
    ["default"] = u6.new()
}