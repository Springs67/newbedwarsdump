local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u2 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 7 ]]
        return "PiggyBankUtil"
    end
})
u2.__index = u2
function u2.new(...) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v3 = u2
    local v4 = setmetatable({}, v3)
    return v4:constructor(...) or v4
end
function u2.constructor(_) --[[ Line: 16 ]] end
function u2.getRewardsFromCoins(p5, p6) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v7 = {}
    local v8 = p6 / 4
    local v9 = math.floor(v8)
    local v10 = 0
    local v11 = 0
    local v12 = p5:getStageFromCoins(p6)
    if v12 >= 1 then
        local v13 = p6 / 4
        v9 = v9 + math.floor(v13)
        v10 = v10 + 1
    end
    if v12 >= 2 then
        local v14 = p6 / 50
        v10 = v10 + math.floor(v14)
        local v15 = p6 / 60
        v11 = v11 + math.floor(v15)
    end
    if v12 >= 3 then
        local v16 = (p6 - 400) / 85
        v11 = v11 + math.floor(v16)
    end
    local v17 = {
        ["itemType"] = u1.IRON,
        ["amount"] = v9
    }
    table.insert(v7, v17)
    if v11 > 0 then
        local v18 = {
            ["itemType"] = u1.EMERALD,
            ["amount"] = v11
        }
        table.insert(v7, v18)
    end
    if v10 > 0 then
        local v19 = {
            ["itemType"] = u1.DIAMOND,
            ["amount"] = v10
        }
        table.insert(v7, v19)
    end
    for v20, v21 in v7 do
        local _ = v20 - 1
        local v22 = v21.amount * 1.3
        v21.amount = math.ceil(v22)
        local _ = v21.amount
    end
    return v7
end
function u2.getStageFromCoins(_, p23) --[[ Line: 66 ]]
    return p23 < 50 and 0 or (p23 < 200 and 1 or (p23 < 400 and 2 or 3))
end
return {
    ["PiggyBankUtil"] = u2
}