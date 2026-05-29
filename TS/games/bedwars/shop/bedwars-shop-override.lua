local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopOverride
local u4 = {}
return {
    ["getBedwarsShopOverrides"] = function() --[[ Name: getBedwarsShopOverrides, Line 6 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u2
            [3] = u1
            [4] = u3
        --]]
        if #u4 > 0 then
            return u4
        end
        for _, v5 in script.Parent:FindFirstChild("shop-overrides"):GetDescendants() do
            if v5:IsA("ModuleScript") then
                local v6 = require(v5)
                for _, v7 in u2.values(v6) do
                    if u1.instanceof(v7, u3) then
                        local v8 = u4
                        table.insert(v8, v7)
                    end
                end
            end
        end
        return u4
    end
}