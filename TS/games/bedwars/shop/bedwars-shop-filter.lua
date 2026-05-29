local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopFilter
local u4 = {}
local function u16() --[[ Line: 6 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u1
        [4] = u3
    --]]
    if #u4 ~= 0 then
        return u4
    end
    local v5 = 0
    local v6 = {}
    for v7, v8 in script.Parent:FindFirstChild("shop-filters"):GetDescendants() do
        local _ = v7 - 1
        if v8:IsA("ModuleScript") == true then
            v5 = v5 + 1
            v6[v5] = v8
        end
    end
    local function v13(p9) --[[ Line: 24 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u1
            [3] = u3
            [4] = u4
        --]]
        local v10 = require(p9)
        for _, v11 in u2.values(v10) do
            if u1.instanceof(v11, u3) then
                local v12 = u4
                table.insert(v12, v11)
            end
        end
    end
    for v14, v15 in v6 do
        v13(v15, v14 - 1, v6)
    end
    return u4
end
return {
    ["getBedwarsShopFilters"] = u16,
    ["applyBedwarsShopFilters"] = function(p17, p18) --[[ Name: applyBedwarsShopFilters, Line 37 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        local v19 = p18
        local v20 = v19
        for v21, v22 in u16() do
            local _ = v21 - 1
            v19 = v22:apply(p17, v20)
            v20 = v19
        end
        return v20
    end
}