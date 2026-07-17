-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;

return {
    HotbarItemNameDisplay = v2.new(u1)(function(p3) -- Line: 6
        -- upvalues: u1 (copy), getItemMeta (copy), RuntimeLib (copy)
        local u4 = u1.createRef();
        local item = p3.store.Inventory.observedInventory.hotbar[p3.store.Inventory.observedInventory.hotbarSlot + 1].item;

        if item ~= nil then
            item = item.itemType;
        end;

        if nil == item then
            return u1.createFragment();
        end;

        local displayName = getItemMeta(item).displayName;

        if item == nil then
            return u1.createFragment();
        end;

        task.delay(1.5, function() -- Line: 21
            -- upvalues: RuntimeLib (ref), u4 (copy)
            RuntimeLib.try(function() -- Line: 22
                -- upvalues: u4 (ref)
                u4:getValue().Text = "";
            end, function() -- Line: 24
            end);
        end);

        return u1.createFragment({ u1.createElement("TextLabel", {
                [u1.Ref] = u4,
                Text = displayName,
                Size = UDim2.fromScale(0.37, 0.37),
                Position = UDim2.fromScale(0.5, -0.7),
                BackgroundTransparency = 100,
                BorderSizePixel = 0,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                TextScaled = true,
                AnchorPoint = Vector2.new(0.5, 0.5)
            }, { u1.createElement("UICorner", {
                    CornerRadius = UDim.new(0.1, 0)
                }), u1.createElement("UIPadding", {
                    PaddingTop = UDim.new(0.15, 0),
                    PaddingBottom = UDim.new(0.15, 0)
                }) }) });
    end)
};