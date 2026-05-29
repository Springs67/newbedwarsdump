local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u4 = {}
local u5 = {}
return {
    ["getSoundAssetIdEncoding"] = function(p6) --[[ Name: getSoundAssetIdEncoding, Line 7 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u2
            [3] = u3
            [4] = u5
        --]]
        if next(u4) == nil then
            for v7, v8 in u2.values(u3) do
                local v9 = v7 - 1
                u4[v8] = v9
                u5[v9] = v8
            end
        end
        return u4[p6]
    end,
    ["getAssetIdFromEncoding"] = function(p10) --[[ Name: getAssetIdFromEncoding, Line 25 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u2
            [3] = u3
            [4] = u4
        --]]
        if next(u5) == nil then
            for v11, v12 in u2.values(u3) do
                local v13 = v11 - 1
                u4[v12] = v13
                u5[v13] = v12
            end
        end
        return u5[p10]
    end,
    ["assetIdEncodings"] = u4,
    ["assetIdEncodingReverseMap"] = u5
}