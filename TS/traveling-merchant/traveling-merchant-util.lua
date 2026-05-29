local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WeightedSelect
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "markup", "markup-util").MarkupUtil
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "traveling-merchant", "traveling-merchant-meta")
local u6 = v5.MerchantItemCategory
local u7 = v5.RARITY_TO_COLOR
local u8 = v5.RARITY_TO_PURCHASE_SOUND
local u9 = v5.RARITY_TO_STAR_COUNT
local u10 = v5.TRAVELING_MERCHANT_ITEM_POOL
local u11 = v5.TRAVELING_MERCHANT_SPAWN_CHANCE
local u12 = v5.TRAVELING_MERCHANT_SPAWN_RANGE
local u13 = v5.TRAVELING_MERCHANT_STUDIO_SPAWN_TIME
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "TravelingMerchantUtil"
    end
})
u14.__index = u14
function u14.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(_) --[[ Line: 28 ]] end
function u14.shouldSpawnMerchant(_) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u11
    --]]
    local v17 = math.random(0, 100)
    return u3:IsStudio() or v17 < u11
end
function u14.selectTimeUntilMerchantSpawn(_) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u3
        [3] = u13
    --]]
    local v18 = u12
    if u3:IsStudio() then
        return u13
    else
        return math.random(v18[1], v18[2])
    end
end
function u14.selectShopItems(_, _, p19) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u10
        [3] = u2
        [4] = u6
    --]]
    local _ = p19 == nil
    return u1.Promise.new(function(u20) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u2
            [3] = u6
        --]]
        task.spawn(function() --[[ Line: 43 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u2
                [3] = u6
                [4] = u20
            --]]
            local v21 = u2.new({})
            local v22 = u2.new({})
            local v23 = u2.new({})
            local v24 = {}
            local v25 = {}
            local v26 = {}
            for v27, v28 in u10:getObjects() do
                local _ = v27 - 1
                if v28.category == u6.DISCOUNT then
                    table.insert(v24, v28)
                end
                if v28.category == u6.BUFF then
                    table.insert(v25, v28)
                end
                if v28.category == u6.ITEM then
                    table.insert(v26, v28)
                end
            end
            v21:setObjects(v24)
            v22:setObjects(v25)
            v23:setObjects(v26)
            local v29 = {}
            local v30 = v21:selectRandom()
            table.insert(v29, v30)
            local v31 = v22:selectRandom()
            table.insert(v29, v31)
            local v32 = v23:selectRandom()
            table.insert(v29, v32)
            u20(v29)
        end)
    end)
end
function u14.getShopItemByItemType(_, p33) --[[ Line: 89 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v34 = nil
    for v35, v36 in u10:getObjects() do
        local _ = v35 - 1
        if v36.item == p33 == true then
            return v36
        end
    end
    return v34
end
function u14.getStarCountByRarity(_, p37) --[[ Line: 105 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    return u9[p37]
end
function u14.getRarityColor(_, p38) --[[ Line: 108 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    return u7[p38]
end
function u14.getPurchaseSoundForRarity(_, p39) --[[ Line: 111 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    return u8[p39]
end
function u14.getShopItemBuffDescription(_, p40) --[[ Line: 114 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u4
    --]]
    local v41 = nil
    for v42, v43 in u10:getObjects() do
        local _ = v42 - 1
        if v43.item == p40 == true then
            v41 = v43
            break
        end
    end
    local v44 = not v41
    if not v44 then
        local v45 = v41.buffDescription
        if v45 == "" then
            v45 = false
        end
        v44 = not v45
    end
    if v44 then
        return nil
    else
        return u4:transformMarkup(v41.buffDescription)
    end
end
u14.TRAVELING_MERCHANT_ENABLED = false
return {
    ["TravelingMerchantUtil"] = u14
}