local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers").GetTarmacAssetFromPath
return {
    ["getMapAsset"] = function(p2) --[[ Name: getMapAsset, Line 4 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        return u1({ "maps", p2 })
    end
}