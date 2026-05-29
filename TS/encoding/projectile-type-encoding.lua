local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-meta").ProjectileMeta
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "guided-projectile", "guided-projectile-meta").GuidedProjectileMeta
local u5 = {}
local u6 = {}
local u7 = {}
local u8 = {}
return {
    ["getProjectileTypeEncoding"] = function(p9) --[[ Name: getProjectileTypeEncoding, Line 10 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u2
            [3] = u3
            [4] = u6
        --]]
        if next(u5) == nil then
            for v10, v11 in u2.keys(u3) do
                local v12 = v10 - 1
                u5[v11] = v12
                u6[v12] = v11
            end
        end
        return u5[p9]
    end,
    ["getProjectileTypeByEncoding"] = function(p13) --[[ Name: getProjectileTypeByEncoding, Line 28 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u2
            [3] = u3
            [4] = u6
        --]]
        if next(u5) == nil then
            for v14, v15 in u2.keys(u3) do
                local v16 = v14 - 1
                u5[v15] = v16
                u6[v16] = v15
            end
        end
        return u6[p13]
    end,
    ["getGuidedProjectileTypeEncoding"] = function(p17) --[[ Name: getGuidedProjectileTypeEncoding, Line 46 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u2
            [3] = u4
        --]]
        if next(u7) == nil then
            for v18, v19 in u2.keys(u4) do
                u7[v19] = v18 - 1
            end
        end
        return u7[p17]
    end,
    ["getGuidedProjectileTypeByEncoding"] = function(p20) --[[ Name: getGuidedProjectileTypeByEncoding, Line 61 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u2
            [3] = u4
            [4] = u8
        --]]
        if next(u7) == nil then
            for v21, v22 in u2.keys(u4) do
                u7[v22] = v21 - 1
            end
        end
        return u8[p20]
    end,
    ["projectileTypeEncodings"] = u5,
    ["projectileTypeByEncoding"] = u6,
    ["guidedProjectileTypeEncodings"] = u7,
    ["guidedProjectileTypeByEncoding"] = u8
}