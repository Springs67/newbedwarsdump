local u1 = {
    ["RECOMMENDED"] = {
        ["sizeXScale"] = 0.6,
        ["backgroundColor3"] = Color3.fromRGB(51, 115, 255)
    },
    ["NEW"] = {
        ["sizeXScale"] = 0.325,
        ["backgroundColor3"] = Color3.fromRGB(100, 255, 100)
    },
    ["FUN"] = {
        ["sizeXScale"] = 0.325,
        ["backgroundColor3"] = Color3.fromRGB(255, 138, 41)
    },
    ["FAST"] = {
        ["sizeXScale"] = 0.37,
        ["backgroundColor3"] = Color3.fromRGB(255, 41, 41)
    }
}
return {
    ["getPlayMenuCardTagMeta"] = function(p2) --[[ Name: getPlayMenuCardTagMeta, Line 20 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        return u1[p2]
    end,
    ["PlayMenuCardTags"] = u1
}