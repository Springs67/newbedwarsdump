local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = {}
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, script.Parent, "armor-trim-color-button").ArmorTrimColorButton
local u6 = v1.import(script, script.Parent, "armor-trim-effect-button").ArmorTrimEffectButton
local u7 = v1.import(script, script.Parent, "armor-trim-player-viewport-base").ArmorTrimPlayerViewportBase
v2.DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION = v1.import(script, script.Parent, "armor-trim-player-viewport-base").DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION
v2.ArmorTrimPlayerViewport = v4.new(u3)(function(p8) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u6
        [4] = u7
    --]]
    local v9 = {}
    for v10, v11 in p8 do
        v9[v10] = v11
    end
    function v9.renderArmorTrimColorControl(p12) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u6
        --]]
        local v13 = {}
        local v14 = u3.createFragment
        local v15 = {
            ["SwitchArmorTrimColorButton"] = u3.createElement(u5, {
                ["BackgroundTransparency"] = 1,
                ["Selectable"] = true,
                ["Position"] = UDim2.new(1, -6, 0, 6),
                ["AnchorPoint"] = Vector2.new(1, 0),
                ["Size"] = UDim2.fromScale(0.23, 0.23),
                ["SelectedKit"] = p12.selectedKit,
                ["ArmorTrimType"] = p12.armorTrimType,
                ["ArmorTrimEffectRank"] = p12.armorTrimEffectRank,
                ["DefaultColor"] = p12.armorTrimColor,
                ["OnColorSelected"] = p12.onColorSelected
            })
        }
        local v16 = v14(v15)
        local v17 = u3.createFragment
        local v18 = {
            ["SwitchArmorTrimEffectButton"] = u3.createElement(u6, {
                ["BackgroundTransparency"] = 1,
                ["Position"] = UDim2.new(1, -6, 1, -16),
                ["AnchorPoint"] = Vector2.new(1, 1),
                ["Size"] = UDim2.fromScale(0.23, 0.23),
                ["SelectedKit"] = p12.selectedKit,
                ["ArmorTrimType"] = p12.armorTrimType,
                ["ArmorTrimEffectRank"] = p12.armorTrimEffectRank,
                ["DefaultColor"] = p12.armorTrimColor
            })
        }
        __set_list(v13, 1, {v16, v17(v18)})
        return v13
    end
    return u3.createElement(u7, v9)
end)
return v2