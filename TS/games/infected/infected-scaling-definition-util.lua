return {
    ["InfectedScalingDefinitionUtil"] = {
        ["scalingRequirementsFromDefinition"] = function(p1, p2) --[[ Name: scalingRequirementsFromDefinition, Line 5 ]]
            local v3 = p2[p1].scalingTiers
            local v4 = table.create(#v3)
            for v5, v6 in v3 do
                local _ = v5 - 1
                v4[v5] = v6.minPointsRequired
            end
            table.sort(v4)
            return v4
        end
    }
}