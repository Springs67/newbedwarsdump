local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").SetUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u5 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 9 ]]
        return "ItemUpgradeUtil"
    end
})
u5.__index = u5
function u5.new(...) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v6 = u5
    local v7 = setmetatable({}, v6)
    return v7:constructor(...) or v7
end
function u5.constructor(_) --[[ Line: 18 ]] end
function u5.buildUpgrades(u8, p9, u10) --[[ Line: 20 ]]
    local v11 = u10[p9]
    local v12 = v11 == nil and {} or v11
    local v13 = {}
    local v14 = #v13
    table.move(v12, 1, #v12, v14 + 1, v13)
    local function v22(p15, p16) --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u10
        --]]
        local v17 = {}
        local v18 = #v17
        local v19 = #p15
        table.move(p15, 1, v19, v18 + 1, v17)
        local v20 = v18 + v19
        local v21 = u8:buildUpgrades(p16, u10)
        table.move(v21, 1, #v21, v20 + 1, v17)
        return v17
    end
    for v23 = 1, #v12 do
        v13 = v22(v13, v12[v23], v23 - 1, v12)
    end
    return v13
end
function u5.buildDowngrades(p24, p25, p26) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
    --]]
    local v27 = {}
    for _, v28 in u3.entries(p26) do
        local v29 = v28[1]
        local v30 = v28[2]
        if table.find(v30, p25) ~= nil then
            table.insert(v27, v29)
        end
    end
    local v31 = u2
    local v32 = { p25 }
    local v33 = #v32
    table.move(v27, 1, #v27, v33 + 1, v32)
    local v34 = {}
    for v35 = 1, #v27 do
        local v36 = v27[v35]
        local _ = v35 - 1
        for _, v37 in p24:buildDowngrades(v36, p26) do
            table.insert(v32, v37)
        end
    end
    for _, v38 in v32 do
        v34[v38] = true
    end
    return v31.values(v34)
end
function u5.buildFullList(_, p39) --[[ Line: 86 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
    --]]
    local u40 = {}
    local v41 = u3.entries(p39)
    local function v47(p42) --[[ Line: 89 ]]
        --[[
        Upvalues:
            [1] = u40
        --]]
        local v43 = p42[1]
        local v44 = p42[2]
        u40[v43] = true
        for v45, v46 in v44 do
            local _ = v45 - 1
            u40[v46] = true
        end
    end
    for v48, v49 in v41 do
        v47(v49, v48 - 1, v41)
    end
    return u2.values(u40)
end
function u5.isUpgrade(_, p50, p51, p52) --[[ Line: 107 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v53 = u5:buildUpgrades(p50, p52)
    return table.find(v53, p51) ~= nil
end
function u5.getCurrentUpgrade(_, p54, p55) --[[ Line: 112 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
    --]]
    local v56 = nil
    for _, v57 in u5:buildFullList(p55) do
        if u4.getToolFromInventory(p54, v57) and (not v56 or u5:isUpgrade(v56, v57, p55)) then
            v56 = v57
        end
    end
    return v56
end
return {
    ["ItemUpgradeUtil"] = u5
}