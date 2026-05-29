return {
    ["BedwarsShopOverride"] = {
        ["constructor"] = function(p1, p2) --[[ Name: constructor, Line 5 ]]
            p1.config = p2
        end,
        ["getKit"] = function(p3) --[[ Name: getKit, Line 8 ]]
            local v4 = p3.config
            if v4 ~= nil then
                v4 = v4.kit
            end
            return v4
        end
    },
    ["BedwarsShopFilter"] = {
        ["constructor"] = function(_) --[[ Name: constructor, Line 19 ]] end
    }
}