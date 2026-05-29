local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-color-meta").ArmorTrimColorMeta
return {
    ["migrateLegacySelectedArmorTrimColors"] = function(p4) --[[ Name: migrateLegacySelectedArmorTrimColors, Line 10 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u3
        --]]
        if p4 == nil then
            return false
        end
        local v5 = false
        for _, v6 in u2.entries(p4) do
            local v7 = v6[2]
            if v7 ~= nil then
                local v8 = v7.color
                if type(v8) == "number" and u3[v8] ~= nil then
                    local v9 = u3[v8]
                    v7.color = {
                        ["r"] = v9.color.R,
                        ["g"] = v9.color.G,
                        ["b"] = v9.color.B
                    }
                    v5 = true
                end
            end
        end
        return v5
    end
}