-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local AutoCompleteDropdown = RuntimeLib.import(script, script.Parent, "auto-complete-dropdown").AutoCompleteDropdown;

return function(p4) -- Line: 10
    -- upvalues: u3 (copy), u2 (copy), StoreProvider (copy), AutoCompleteDropdown (copy), u1 (copy), ItemType (copy), getItemMeta (copy)
    local v5 = u3.Store.new(u3.combineReducers({}), {});
    local u9 = u2.mount(u2.createElement(StoreProvider, {
        store = v5
    }, { u2.createElement(AutoCompleteDropdown, {
            AppId = "AutoCompleteDropdown",
            Items = u1.values(ItemType),

            DescribeItem = function(p6) -- Line: 18, Name: DescribeItem
                -- upvalues: getItemMeta (ref)
                local v7 = getItemMeta(p6);

                return {
                    actionDescription = "select",
                    displayName = v7.displayName,
                    aliases = { v7.displayName },
                    image = v7.image
                };
            end,

            OnSelect = function(p8) -- Line: 27, Name: OnSelect
                print(p8);
            end
        }) }), p4);

    return function() -- Line: 32
        -- upvalues: u2 (ref), u9 (copy)
        return u2.unmount(u9);
    end;
end;