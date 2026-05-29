local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-melees")
local u6 = v5.BaseMelee
local u7 = v5.EmberCustomUpgradePath
local u8 = v5.getUpgradePathFromMelee
local u9 = v5.IceQueenCustomUpgradePath
local u10 = v5.LumenCustomUpgradePath
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopFilter
local u13 = nil
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "WeaponShopFilter"
    end,
    ["__index"] = u12
})
u14.__index = u14
function u14.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17, ...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p17, ...)
end
function u14.apply(_, p18, p19) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u13
        [3] = u8
        [4] = u3
        [5] = u2
    --]]
    local v20 = {}
    local v21 = #v20
    table.move(u6, 1, #u6, v21 + 1, v20)
    for _, v25 in u6 do
        local v23 = u13(p18) or u8(v25)
        for _, v24 in v23 do
            if u3.getAmount(u2.LocalPlayer, v24) ~= 0 then
                local v25 = v24
            end
        end
        local v26 = (table.find(v23, v25) or 0) - 1
        local v27 = v23[v26 + 1 + 1]
        local v28 = v26 == #v23 - 1
        local v29 = false
        local v30 = 0
        while true do
            if true then
                if v29 then
                    v30 = v30 + 1
                else
                    v29 = true
                end
            end
            if v30 >= #v23 then
                break
            end
            local v31 = nil
            for v32, v33 in p19 do
                local _ = v32 - 1
                if v33.itemType == v27 == true then
                    v31 = v33
                    break
                end
            end
            if v31 ~= nil then
                v31 = v31.nextTier
            end
            if v31 ~= nil and (v23[v30 + 1] ~= v27 and (not v28 or v30 ~= #v23 - 1)) then
                local v34 = v23[v30 + 1]
                table.insert(v20, v34)
            end
        end
    end
    local v35 = 0
    local v36 = {}
    for v37, v38 in p19 do
        local _ = v37 - 1
        local v39 = v38.itemType
        if table.find(v20, v39) == nil == true then
            v35 = v35 + 1
            v36[v35] = v38
        end
    end
    return v36
end
u13 = function(p40) --[[ Name: getCustomMeleePath, Line 114 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u11
        [3] = u9
        [4] = u10
        [5] = u7
    --]]
    if u4(p40, u11.ICE_QUEEN) then
        return u9
    elseif u4(p40, u11.LUMEN) then
        return u10
    elseif u4(p40, u11.EMBER) then
        return u7
    else
        return nil
    end
end
return {
    ["WeaponShopFilter"] = u14,
    ["default"] = u14.new()
}