return {
    ["AfkProfileUtil"] = {
        ["makeStarterAfkData"] = function() --[[ Line: 5 ]]
            local v1 = {
                ["dailyAfkTime"] = 0,
                ["afkCurrency"] = {
                    ["currAmount"] = 0,
                    ["amountSpent"] = 0,
                    ["amountEarned"] = 0,
                    ["itemsPurchased"] = {}
                }
            }
            return v1
        end
    }
}