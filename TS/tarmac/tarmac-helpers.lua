local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac")
return {
    ["GetTarmacAsset"] = function(p2, p3) --[[ Name: GetTarmacAsset, Line 8 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        if p3 == nil then
            p3 = u1
        end
        local v4 = p3[p2]
        if not v4 then
            error(string.format("No asset by name %s", p2))
        end
        if type(v4) == "string" then
            return {
                ["Image"] = v4
            }
        elseif type(v4) == "function" then
            return v4(2)
        else
            return v4
        end
    end,
    ["GetTarmacAssetFromPath"] = function(p5) --[[ Name: GetTarmacAssetFromPath, Line 27 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        local v6 = u1
        for _, v7 in p5 do
            v6 = v6[v7]
        end
        if v6 then
            if type(v6) == "table" then
                return v6
            else
                return type(v6) == "string" and {
                    ["Image"] = v6
                } or v6
            end
        else
            return nil
        end
    end
}