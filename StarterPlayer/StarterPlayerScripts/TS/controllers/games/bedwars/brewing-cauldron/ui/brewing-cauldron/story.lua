local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "crafting-entity", "crafting-entity-types").CraftingStatus
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u5 = v1.import(script, script.Parent, "brewing-cauldron").BrewingCauldron
return function(p6) --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u5
        [4] = u3
    --]]
    local v7 = { u4.WOOL_PINK, u4.WOOL_PINK }
    local u8 = u2.mount(u2.createElement(u5, {
        ["Text"] = "Ingredients",
        ["timeToCraft"] = 3,
        ["Inventory"] = v7,
        ["CraftingStatus"] = u3.crafting
    }), p6)
    return function() --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u8
        --]]
        return u2.unmount(u8)
    end
end