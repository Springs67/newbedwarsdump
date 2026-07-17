-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local v3 = u2.Component:extend("ItemToolTip");

function v3.init(p4, p5) -- Line: 11
end;

function v3.render(p6) -- Line: 13
    -- upvalues: getItemMeta (copy), u2 (copy), AutoSizedText (copy), TooltipContainer (copy)
    local item = p6.props.item;

    if item == nil then
        return nil;
    end;

    local v7 = getItemMeta(item);
    local v8;

    if v7 == nil then
        v8 = v7;
    else
        v8 = v7.description;
    end;

    local v9 = v8 ~= nil and u2.createElement(AutoSizedText, {
        TextSize = 14,
        Text = v7.description,
        Font = Enum.Font.SourceSansSemibold,
        Limits = Vector2.new(300, 500)
    });
    local v10 = { u2.createElement(AutoSizedText, {
            TextSize = 16,
            Text = v7.displayName,
            Font = Enum.Font.SourceSansBold,
            Limits = Vector2.new(300, 60)
        }) };
    local v11 = #v10;

    if v9 then
        v10[v11 + 1] = v9;
    end;

    local v12 = #v10;
    local v13 = p6.props.showTechnicalName and u2.createElement(AutoSizedText, {
        TextSize = 12,
        TextTransparency = 0.3,
        Text = item,
        Font = Enum.Font.SourceSansSemibold,
        Limits = Vector2.new(300, 500)
    });

    if v13 then
        v10[v12 + 1] = v13;
    end;

    return u2.createElement(TooltipContainer, {}, v10);
end;

return {
    ItemToolTip = v3
};