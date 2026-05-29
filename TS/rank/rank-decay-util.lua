return {
    ["getRankDecayData"] = function(p1) --[[ Name: getRankDecayData, Line 2 ]]
        if p1.decay == nil then
            p1.decay = {
                ["lastCheckTime"] = 0,
                ["warningLastCloseTime"] = 0
            }
        end
        return p1.decay
    end
}