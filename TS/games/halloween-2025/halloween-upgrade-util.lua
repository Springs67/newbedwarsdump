local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-2025-kits").HalloweenKit
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-upgrade-meta").HalloweenUpgradeMeta
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-upgrade-type").HalloweenUpgradeType
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "HalloweenUpgradeUtil"
    end
})
u6.__index = u6
function u6.new(...) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(_) --[[ Line: 19 ]] end
function u6.getAttributeName(_, p9) --[[ Line: 21 ]]
    return "Halloween_" .. p9
end
function u6.getAbilityStacks(p10, p11, p12) --[[ Line: 24 ]]
    local v13 = p11:GetAttribute(p10:getAttributeName(p12))
    return v13 == nil and 0 or v13
end
function u6.getActiveAbilities(p14, p15) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
    --]]
    local v16 = {}
    for _, v17 in u2.values(u5) do
        local v18 = p15:GetAttribute(p14:getAttributeName(v17))
        if v18 ~= 0 and (v18 == v18 and (v18 ~= "" and v18)) then
            table.insert(v16, v17)
        end
    end
    return v16
end
function u6.isActive(p19, p20, p21) --[[ Line: 42 ]]
    return p20:GetAttribute(p19:getAttributeName(p21)) ~= nil
end
function u6.getAbilityPoolByKitAndTier(u22, u23, u24, u25) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
        [3] = u3
        [4] = u6
    --]]
    local v26 = u2.entries(u4)
    local function v32(p27) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u24
            [3] = u25
            [4] = u22
            [5] = u23
            [6] = u6
        --]]
        local v28 = p27[1]
        local v29 = p27[2]
        if v29.disabled then
            return false
        end
        local v30
        if v29.halloweenKit == u3.NONE or v29.halloweenKit == u24 then
            v30 = v29.upgradeTier == u25
        else
            v30 = false
        end
        local v31 = v29.unique
        if v31 then
            v31 = u22:isActive(u23, v28)
        end
        if v29.maxStacks ~= nil and u6:getAbilityStacks(u23, v28) >= v29.maxStacks then
            return false
        end
        if v30 then
            v30 = not v31
        end
        return v30
    end
    local v33 = 0
    local v34 = {}
    for v35, v36 in v26 do
        if v32(v36, v35 - 1, v26) == true then
            v33 = v33 + 1
            v34[v33] = v36
        end
    end
    local v37 = table.create(#v34)
    for v38, v39 in v34 do
        local _ = v38 - 1
        v37[v38] = v39[1]
    end
    return v37
end
function u6.isHalloweenKit(_, p40, p41) --[[ Line: 87 ]]
    return p40:GetAttribute("HalloweenKit") == p41
end
return {
    ["HalloweenUpgradeUtil"] = u6
}