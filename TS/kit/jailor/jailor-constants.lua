return {
    ["JailorConstants"] = {
        ["getBlockDamage"] = function(p1, p2) --[[ Name: getBlockDamage, Line 17 ]]
            local v3 = math
            local v4 = 1 + (p2 == nil and 0 or p2) * 0.1
            return p1 * v3.min(1.25, v4)
        end
    }
}