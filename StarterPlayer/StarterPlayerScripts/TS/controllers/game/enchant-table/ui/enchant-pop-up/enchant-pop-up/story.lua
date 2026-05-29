local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u5 = v1.import(script, script.Parent, "enchant-pop-up").EnchantPopUp
return function(p6) --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
        [3] = u3
        [4] = u4
    --]]
    local u7 = u2.mount(u2.createElement(u5, {
        ["EnchantName"] = "Static",
        ["EnchantImage"] = u3.STATIC_ENCHANT,
        ["EnchantTableType"] = u4.ENCHANT_TABLE
    }), p6)
    return function() --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u7
        --]]
        return u2.unmount(u7)
    end
end