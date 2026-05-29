return {
    ["VIPUtil"] = {
        ["isPlayerVIP"] = function(p1) --[[ Line: 5 ]]
            return p1:GetAttribute("VIP") == true
        end
    }
}