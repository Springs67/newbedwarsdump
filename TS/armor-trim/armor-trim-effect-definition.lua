return {
    ["getArmorTrimEffect"] = function(p1, p2) --[[ Name: getArmorTrimEffect, Line 10 ]]
        local v3 = p1.condition
        if v3 == "None" then
            return p1.effectType
        elseif v3 == "TrimColor" then
            if p2 == nil then
                return p1.default
            else
                return p1.effectType(p2)
            end
        else
            if v3 == "Select" then
                return p1.default
            end
            return
        end
    end
}