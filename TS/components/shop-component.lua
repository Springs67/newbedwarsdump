local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameComponent
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "components", "out").Component
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local v8 = {}
local v9 = setmetatable({}, {
    ["__index"] = v8
})
v9.ITEM_SHOP = "item_shop"
v8.item_shop = "ITEM_SHOP"
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "ShopComponent"
    end,
    ["__index"] = u4
})
u10.__index = u10
function u10.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13, ...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p13, ...)
    p13.shopItems = nil
end
function u10.onStart(_) --[[ Line: 37 ]] end
function u10.getTag(_) --[[ Line: 39 ]]
    return "ShopComponent"
end
function u10.setShopItems(p14, p15) --[[ Line: 42 ]]
    p14.shopItems = p15
    p14:sendShopItemsUpdate()
end
function u10.getShopItems(p16) --[[ Line: 46 ]]
    return p16.shopItems
end
function u10.getShopItem(p17, p18) --[[ Line: 49 ]]
    local v19 = p17.shopItems
    if v19 ~= nil then
        v19 = nil
        for v20, v21 in v19 do
            local _ = v20 - 1
            if v21.itemType == p18 == true then
                v19 = v21
                break
            end
        end
    end
    return v19
end
function u10.waitForShopModel(p22) --[[ Line: 68 ]]
    local v23 = p22.instance:FindFirstChildWhichIsA("Model")
    while not v23 do
        p22.instance.DescendantAdded:Wait()
        v23 = p22.instance:FindFirstChildWhichIsA("Model")
    end
    return v23
end
function u10.sendShopItemsUpdate(p24) --[[ Line: 76 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
    --]]
    if u6:IsServer() then
        u7.Server:Get("BedwarsShopItemsUpdate"):SendToAllPlayers({
            ["shopId"] = p24.attributes.Id,
            ["shopItems"] = p24.shopItems or {}
        })
    end
end
v2.defineMetadata(u10, "identifier", "shared/components/shop-component@ShopComponent")
v2.defineMetadata(u10, "flamework:implements", { "$:flamework@OnStart" })
local v25 = {
    ["tag"] = "ShopComponent",
    ["defaults"] = {
        ["Id"] = "",
        ["TeamId"] = "global",
        ["DisableShopOverrides"] = false,
        ["BlockPosition"] = Vector3.new()
    },
    ["attributes"] = {
        ["Id"] = v3.string,
        ["BlockPosition"] = v3.Vector3,
        ["TeamId"] = v3.string,
        ["ShopType"] = v3.optional(v3.string),
        ["DisableShopOverrides"] = v3.optional(v3.boolean),
        ["ShopOwner"] = v3.optional(v3.number)
    },
    ["instanceGuard"] = v3.instanceIsA("Part")
}
v2.decorate(u10, "$c:init@Component", v5, { v25 })
return {
    ["BedwarsShopType"] = v9,
    ["default"] = u10
}