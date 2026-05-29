local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
return {
    ["TripleShotUtil"] = {
        ["isTripleShot"] = function(p6, p7) --[[ Name: isTripleShot, Line 10 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u3
                [3] = u4
                [4] = u5
            --]]
            local v8 = u2(p6).projectileSource
            if v8 ~= nil then
                v8 = v8.multiShot
            end
            local v9 = v8 == true
            if not v9 then
                if p6 == u3.WOOD_BOW or (p6 == u3.WOOD_CROSSBOW or (p6 == u3.HEADHUNTER or (p6 == u3.FLOWER_BOW or (p6 == u3.FLOWER_CROSSBOW or (p6 == u3.FLOWER_HEADHUNTER or (p6 == u3.TACTICAL_CROSSBOW or p6 == u3.TACTICAL_HEADHUNTER)))))) then
                    v9 = u4(p7, u5.TRIPLE_SHOT) or p7:GetAttribute("EnableTripleShot") == true
                else
                    v9 = false
                end
            end
            return v9
        end
    }
}