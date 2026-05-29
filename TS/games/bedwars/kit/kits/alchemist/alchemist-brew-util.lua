local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "recipe", "recipe-meta").recipes
local u4 = {
    v2.SLEEP_SPLASH_POTION,
    v2.BIG_SHIELD,
    v2.POISON_SPLASH_POTION,
    v2.HEAL_SPLASH_POTION
}
local function u9(p5) --[[ Line: 6 ]]
    local v6 = {}
    for _, v7 in p5 do
        local v8 = v6[v7]
        v6[v7] = (v8 == nil and 0 or v8) + 1
    end
    return v6
end
local function u13() --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
    --]]
    local v10 = {}
    for _, v11 in u4 do
        local v12 = u3[v11]
        if v12 and #v12.ingredients == 3 then
            table.insert(v10, v12)
        end
    end
    return v10
end
return {
    ["getAlchemistFlaskRecipes"] = u13,
    ["findAlchemistRecipeResult"] = function(p14) --[[ Name: findAlchemistRecipeResult, Line 51 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u13
        --]]
        if #p14 ~= 3 then
            return nil
        end
        local v15 = u9(p14)
        for _, v16 in u13() do
            if v16.result ~= nil then
                local v17 = u9(v16.ingredients)
                local v18 = 0
                for _ in v15 do
                    v18 = v18 + 1
                end
                local v19 = 0
                for _ in v17 do
                    v19 = v19 + 1
                end
                if v18 == v19 then
                    for v20, v21 in v15 do
                        if v17[v20] ~= v21 then
                            v22 = false
                            goto l14
                        end
                    end
                    v22 = true
                    goto l14
                end
                local v22 = false
                ::l14::
                if v22 then
                    return v16.result
                end
            end
        end
        return nil
    end
}