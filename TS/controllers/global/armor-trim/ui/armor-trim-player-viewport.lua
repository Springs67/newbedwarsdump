-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = {};
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ArmorTrimColorButton = RuntimeLib.import(script, script.Parent, "armor-trim-color-button").ArmorTrimColorButton;
local ArmorTrimEffectButton = RuntimeLib.import(script, script.Parent, "armor-trim-effect-button").ArmorTrimEffectButton;
local ArmorTrimPlayerViewportBase = RuntimeLib.import(script, script.Parent, "armor-trim-player-viewport-base").ArmorTrimPlayerViewportBase;
v1.DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION = RuntimeLib.import(script, script.Parent, "armor-trim-player-viewport-base").DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION;
v1.ArmorTrimPlayerViewport = v3.new(u2)(function(p4) -- Line: 10
    -- upvalues: u2 (copy), ArmorTrimColorButton (copy), ArmorTrimEffectButton (copy), ArmorTrimPlayerViewportBase (copy)
    local v5 = {};

    for i, v in p4 do
        v5[i] = v;
    end;

    function v5.renderArmorTrimColorControl(p6) -- Line: 15
        -- upvalues: u2 (ref), ArmorTrimColorButton (ref), ArmorTrimEffectButton (ref)
        return { u2.createFragment({
                SwitchArmorTrimColorButton = u2.createElement(ArmorTrimColorButton, {
                    BackgroundTransparency = 1,
                    Selectable = true,
                    Position = UDim2.new(1, -6, 0, 6),
                    AnchorPoint = Vector2.new(1, 0),
                    Size = UDim2.fromScale(0.23, 0.23),
                    SelectedKit = p6.selectedKit,
                    ArmorTrimType = p6.armorTrimType,
                    ArmorTrimEffectRank = p6.armorTrimEffectRank,
                    DefaultColor = p6.armorTrimColor,
                    OnColorSelected = p6.onColorSelected
                })
            }), u2.createFragment({
                SwitchArmorTrimEffectButton = u2.createElement(ArmorTrimEffectButton, {
                    BackgroundTransparency = 1,
                    Position = UDim2.new(1, -6, 1, -16),
                    AnchorPoint = Vector2.new(1, 1),
                    Size = UDim2.fromScale(0.23, 0.23),
                    SelectedKit = p6.selectedKit,
                    ArmorTrimType = p6.armorTrimType,
                    ArmorTrimEffectRank = p6.armorTrimEffectRank,
                    DefaultColor = p6.armorTrimColor
                })
            }) };
    end;

    return u2.createElement(ArmorTrimPlayerViewportBase, v5);
end);

return v1;