-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;

return {
    HotbarResourceDisplay = v2.new(u1)(function(u3, p4) -- Line: 8
        -- upvalues: ItemType (copy), u1 (copy), getItemMeta (copy), Empty (copy)
        local useState = p4.useState;
        local useEffect = p4.useEffect;
        local v5, u6 = useState(0);
        local v7, u8 = useState(0);
        local v9, u10 = useState(0);
        local v11, u12 = useState(0);

        local function u16(u13) -- Line: 15
            -- upvalues: u3 (copy)
            local function _(p14) -- Line: 17
                -- upvalues: u13 (copy)
                return u13 == p14.itemType;
            end;

            local v15 = nil;

            for i, v in u3.ObservedInventory.inventory.items do
                local _ = i - 1;

                if u13 == v.itemType == true then
                    v15 = v;
                    break;
                end;
            end;

            if v15 ~= nil then
                v15 = v15.amount;
            end;

            return v15 == nil and 0 or v15;
        end;

        useEffect(function() -- Line: 39
            -- upvalues: u6 (copy), u16 (copy), ItemType (ref), u8 (copy), u10 (copy), u12 (copy)
            u6((u16(ItemType.IRON)));
            u8((u16(ItemType.GOLD)));
            u10((u16(ItemType.DIAMOND)));
            u12((u16(ItemType.EMERALD)));
        end, { u3.ObservedInventory.inventory.items });

        local function v22(p17, p18) -- Line: 45
            -- upvalues: u1 (ref), getItemMeta (ref), Empty (ref)
            local v19 = {
                Size = UDim2.fromScale(1, 0.25)
            };
            local v20 = { u1.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    HorizontalAlignment = "Left",
                    VerticalAlignment = "Top",
                    SortOrder = Enum.SortOrder.LayoutOrder
                }) };
            local _ = #v20;
            local v21 = {
                Size = UDim2.fromScale(1.5, 1.5),
                SizeConstraint = Enum.SizeConstraint.RelativeYY
            };
            local image = getItemMeta(p17).image;
            v21.Image = image == nil and "" or image;
            v21.BackgroundTransparency = 1;
            v21.BorderSizePixel = 0;
            v21.LayoutOrder = 0;
            v20[p17 .. "Image"] = u1.createElement("ImageLabel", v21);
            v20[p17 .. " Count"] = u1.createElement("TextLabel", {
                TextScaled = true,
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.75, 1),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                Text = tostring(p18),
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                TextXAlignment = Enum.TextXAlignment.Left
            });

            return u1.createFragment({
                [p17 .. "Frame"] = u1.createElement(Empty, v19, v20)
            });
        end;

        local v23 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0, 0),
            Position = UDim2.fromScale(1.06, 0),
            Size = UDim2.fromScale(0.2, 1)
        };
        local v24 = { u1.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Left",
                VerticalAlignment = "Center",
                SortOrder = Enum.SortOrder.LayoutOrder
            }) };
        local v25 = #v24;
        local v26;

        if v5 > 0 then
            v26 = v22(ItemType.IRON, v5);
        else
            v26 = false;
        end;

        if v26 then
            v24[v25 + 1] = v26;
        end;

        local v27 = #v24;
        local v28;

        if v7 > 0 then
            v28 = v22(ItemType.GOLD, v7);
        else
            v28 = false;
        end;

        if v28 then
            v24[v27 + 1] = v28;
        end;

        local v29 = #v24;
        local v30;

        if v9 > 0 then
            v30 = v22(ItemType.DIAMOND, v9);
        else
            v30 = false;
        end;

        if v30 then
            v24[v29 + 1] = v30;
        end;

        local v31 = #v24;
        local v32;

        if v11 > 0 then
            v32 = v22(ItemType.EMERALD, v11);
        else
            v32 = false;
        end;

        if v32 then
            v24[v31 + 1] = v32;
        end;

        return u1.createFragment({
            HotbarResourceDisplay = u1.createElement("Frame", v23, v24)
        });
    end)
};