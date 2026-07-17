-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local BedwarsShopCategoryMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-meta").BedwarsShopCategoryMeta;
local BedwarsShopCategory = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory;
local ShopCategoryUnlockable = RuntimeLib.import(script, script.Parent, "shop-category-unlockable").ShopCategoryUnlockable;

return {
    ShopCategoryUnlockableList = v3.new(u2)(function(u4, p5) -- Line: 12
        -- upvalues: u1 (copy), BedwarsShopCategory (copy), BedwarsShopCategoryMeta (copy), ClientStore (copy), getQueueMeta (copy), u2 (copy), ShopCategoryUnlockable (copy), Empty (copy)
        local _ = p5.useState;

        local function _(p6, p7) -- Line: 15
            -- upvalues: BedwarsShopCategoryMeta (ref), ClientStore (ref)
            local v8 = BedwarsShopCategoryMeta[p6];

            if v8.disabled then
                return nil;
            end;

            if not v8.unlockable and v8.UIDisplayType ~= "purchase" then
                return nil;
            end;

            local unlockable = v8.unlockable;

            if unlockable ~= nil then
                unlockable = unlockable.disableTillUnlocked;
            end;

            local v9 = unlockable == true;

            if v9 then
                local v10 = ClientStore:getState().Game.unlockedShopCategories[p6] ~= nil;
                v9 = not v10;
            end;

            if v9 then
                return nil;
            end;

            return p6;
        end;

        local v11 = 0;
        local u12 = {};

        for i, v in u1.values(BedwarsShopCategory) do
            local _ = i - 1;
            local v13 = BedwarsShopCategoryMeta[v];
            local v;

            if v13.disabled or not v13.unlockable and v13.UIDisplayType ~= "purchase" then
                v = nil;
            else
                local unlockable = v13.unlockable;

                if unlockable ~= nil then
                    unlockable = unlockable.disableTillUnlocked;
                end;

                local v14 = unlockable == true;

                if v14 then
                    local v15 = ClientStore:getState().Game.unlockedShopCategories[v] ~= nil;
                    v14 = not v15;
                end;

                if v14 then
                    v = nil;
                end;
            end;

            if v ~= nil then
                v11 = v11 + 1;
                u12[v11] = v;
            end;
        end;

        local u16 = math.ceil(#u12 / 2);

        local function v45() -- Line: 53
            -- upvalues: u16 (copy), u12 (copy), BedwarsShopCategoryMeta (ref), u4 (copy), getQueueMeta (ref), u2 (ref), ShopCategoryUnlockable (ref), Empty (ref)
            local v17 = false;
            local v18 = 0;
            local v19 = {};

            while true do
                if v17 then
                    v18 = v18 + 1;
                else
                    v17 = true;
                end;

                if v18 >= u16 then
                    return v19;
                end;

                local v20 = false;
                local v21 = 0;
                local v22 = {};

                while true do
                    if true then
                        if v20 then
                            v21 = v21 + 1;
                        else
                            v20 = true;
                        end;
                    end;

                    if v21 >= 2 then
                        break;
                    end;

                    local v23 = #u12;
                    local v24 = u12[v23];
                    u12[v23] = nil;

                    if v24 then
                        table.insert(v22, v24);
                    end;
                end;

                if #v22 ~= 0 then
                    local function v37(u25, p26) -- Line: 94
                        -- upvalues: BedwarsShopCategoryMeta (ref), u4 (ref), getQueueMeta (ref), u2 (ref), ShopCategoryUnlockable (ref)
                        local v27 = BedwarsShopCategoryMeta[u25];

                        local function _(p28) -- Line: 97
                            -- upvalues: u25 (copy)
                            return p28.category == u25;
                        end;

                        local v29 = 0;
                        local v30 = {};

                        for i, v in u4.ShopItems do
                            local _ = i - 1;

                            if v.category == u25 == true then
                                v29 = v29 + 1;
                                v30[v29] = v;
                            end;
                        end;

                        local QueueType = u4.QueueType;

                        if QueueType then
                            local function _(p31) -- Line: 114
                                -- upvalues: QueueType (copy)
                                local disabledInQueue = p31.disabledInQueue;

                                if disabledInQueue ~= nil then
                                    disabledInQueue = table.find(disabledInQueue, QueueType) ~= nil;
                                end;

                                return not disabledInQueue and not p31.disabled;
                            end;

                            local v32 = false;

                            for i, v in v30 do
                                local _ = i - 1;
                                local disabledInQueue = v.disabledInQueue;

                                if disabledInQueue ~= nil then
                                    disabledInQueue = table.find(disabledInQueue, QueueType) ~= nil;
                                end;

                                if not disabledInQueue and not v.disabled then
                                    v32 = true;
                                    break;
                                end;
                            end;

                            if not v32 then
                                return nil;
                            end;

                            local v33 = getQueueMeta(QueueType);

                            if v33.rankCategory or v33.disableLimitedTimeItems then
                                local function _(p34) -- Line: 142
                                    return not p34.limitedTimeItem;
                                end;

                                local v35 = false;

                                for i, v in v30 do
                                    local _ = i - 1;

                                    if not v.limitedTimeItem then
                                        v35 = true;
                                        break;
                                    end;
                                end;

                                if not v35 then
                                    return nil;
                                end;
                            end;
                        end;

                        local v36 = {
                            AppId = "ShopCategoryUnlockable_" .. u25,
                            Size = UDim2.new(0.5, -6, 0, 0),
                            Category = u25,
                            ShopItems = v30,
                            SelectedItem = u4.SelectedItem,
                            SetSelectedShopItem = u4.SetSelectedShopItem,
                            ShopID = u4.ShopID
                        };
                        local layoutOrder = v27.layoutOrder;

                        if layoutOrder ~= nil then
                            p26 = layoutOrder;
                        end;

                        v36.LayoutOrder = p26;
                        v36.ObservedInventory = u4.ObservedInventory;
                        v36.IsHomeBase = u4.IsHomeBase;

                        return u2.createElement(ShopCategoryUnlockable, v36);
                    end;

                    local v38 = 0;
                    local v39 = {};

                    for i, v in v22 do
                        local v40 = v37(v, i - 1, v22);

                        if v40 ~= nil then
                            v38 = v38 + 1;
                            v39[v38] = v40;
                        end;
                    end;

                    local v41 = {
                        AutomaticSize = "Y",
                        Size = UDim2.fromScale(1, 0),
                        LayoutOrder = v18
                    };
                    local v42 = { u2.createElement("UIListLayout", {
                            VerticalAlignment = "Top",
                            HorizontalAlignment = "Left",
                            FillDirection = "Horizontal",
                            SortOrder = "LayoutOrder",
                            Padding = UDim.new(0, 12)
                        }) };
                    local v43 = #v42;

                    for i, v in v39 do
                        v42[v43 + i] = v;
                    end;

                    local v44 = u2.createElement(Empty, v41, v42);
                    table.insert(v19, v44);
                end;
            end;
        end;

        local v46 = {
            AutomaticSize = "Y",
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0)
        };
        local v47 = { u2.createElement("UIListLayout", {
                VerticalAlignment = "Top",
                HorizontalAlignment = "Left",
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 18)
            }) };
        local v48 = #v47;

        for i, v in v45() do
            v47[v48 + i] = v;
        end;

        return u2.createFragment({
            ShopCategoryUnlockableList = u2.createElement(Empty, v46, v47)
        });
    end)
};