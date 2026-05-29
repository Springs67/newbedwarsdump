local u1 = {
    ["allKitProgress"] = {},
    ["effectUnlocks"] = {},
    ["allKitXpPotential"] = {},
    ["selectedArmorTrimConfigs"] = {}
}
return {
    ["ArmorTrimReducer"] = function(p2, p3) --[[ Name: ArmorTrimReducer, Line 8 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        if p2 == nil then
            p2 = u1
        end
        if p3.type ~= "SetArmorTrimData" then
            return p2
        end
        local v4 = {}
        for v5, v6 in p2 do
            v4[v5] = v6
        end
        v4.allKitProgress = p3.allKitProgress
        v4.effectUnlocks = p3.effectUnlocks
        v4.allKitXpPotential = p3.allKitXpPotential
        v4.selectedArmorTrimConfigs = p3.selectedArmorTrimConfigs
        return v4
    end
}