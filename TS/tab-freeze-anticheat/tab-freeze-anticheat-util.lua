return {
    ["isTimeFrameWithinTabFreezeAnticheatReport"] = function(p1, p2, p3) --[[ Name: isTimeFrameWithinTabFreezeAnticheatReport, Line 3 ]]
        local v4 = p3.endServerTime - p3.frozenSeconds
        local v5 = p3.endServerTime
        return v4 <= p2 and p1 <= v5
    end
}