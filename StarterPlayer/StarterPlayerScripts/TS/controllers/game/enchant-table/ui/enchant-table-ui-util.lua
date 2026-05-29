local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
return {
    ["EnchantTableUIUtil"] = {
        ["getThemeColor"] = function(p2) --[[ Line: 7 ]]
            --[[
            Upvalues:
                [1] = u1
            --]]
            local v3 = Color3.fromRGB(255, 173, 69)
            if p2 == u1.ENCHANT_TABLE_GLITCHED then
                v3 = Color3.fromRGB(64, 255, 255)
            end
            return v3
        end,
        ["convertToRoman"] = function(p4) --[[ Line: 15 ]]
            local v5 = {
                ["M"] = 1000,
                ["CM"] = 900,
                ["D"] = 500,
                ["CD"] = 400,
                ["C"] = 100,
                ["XC"] = 90,
                ["L"] = 50,
                ["XL"] = 40,
                ["X"] = 10,
                ["IX"] = 9,
                ["V"] = 5,
                ["IV"] = 4,
                ["I"] = 1
            }
            local v6 = ""
            for _, v7 in {
                "M",
                "CM",
                "D",
                "CD",
                "C",
                "XC",
                "L",
                "XL",
                "X",
                "IX",
                "V",
                "IV",
                "I"
            } do
                local v8 = p4 / v5[v7]
                local v9 = math.floor(v8)
                p4 = p4 - v9 * v5[v7]
                v6 = v6 .. string.rep(v7, v9)
            end
            return v6
        end
    }
}