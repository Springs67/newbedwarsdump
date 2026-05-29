return {
    ["ArrayUtil"] = {
        ["getNextIndexWithLooping"] = function(p1, p2) --[[ Name: getNextIndexWithLooping, Line 5 ]]
            return #p1 - 1 <= p2 and 0 or p2 + 1
        end,
        ["getPreviousIndexWithLooping"] = function(p3, p4) --[[ Name: getPreviousIndexWithLooping, Line 12 ]]
            if p4 <= 0 then
                return #p3 - 1
            else
                return p4 - 1
            end
        end,
        ["removeFromArray"] = function(p5, p6) --[[ Name: removeFromArray, Line 19 ]]
            local v7 = (table.find(p5, p6) or 0) - 1
            if v7 == -1 then
                return false
            end
            table.remove(p5, v7 + 1)
            return true
        end
    }
}