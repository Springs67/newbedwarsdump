return {
    ["TimerUtil"] = {
        ["getTimeString"] = function(p1) --[[ Name: getTimeString, Line 5 ]]
            local v2 = p1 / 60
            local v3 = math.floor(v2)
            local v4 = p1 - v3 * 60
            return string.format("%02i", v3) .. ":" .. string.format("%02i", v4)
        end
    }
}