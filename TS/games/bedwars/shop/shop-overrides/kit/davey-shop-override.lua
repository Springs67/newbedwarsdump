local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopOverride
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "DaveyShopOverride"
    end,
    ["__index"] = u5
})
u7.__index = u7
function u7.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
    --]]
    u5.constructor(p10, {
        ["kit"] = u4.DAVEY
    })
end
function u7.shouldApply(p11, p12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v13 = u3(p12, p11.config.kit)
    if v13 then
        local v14 = p11.config
        if v14 ~= nil then
            v14 = v14.enabled
        end
        v13 = v14 == nil and true or v14
    end
    return v13
end
function u7.getOverride(_) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
        [3] = u6
    --]]
    return {
        {
            ["price"] = 30,
            ["itemType"] = u2.TNT
        },
        {
            ["amount"] = 1,
            ["price"] = 50,
            ["itemType"] = u2.CANNON,
            ["currency"] = u2.IRON,
            ["requiresKit"] = { u4.DAVEY },
            ["category"] = u6.Combat
        }
    }
end
return {
    ["default"] = u7.new()
}