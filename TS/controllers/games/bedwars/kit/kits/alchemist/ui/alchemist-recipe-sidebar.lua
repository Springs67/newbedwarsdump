-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getAlchemistFlaskRecipes = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "alchemist", "alchemist-brew-util").getAlchemistFlaskRecipes;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u3 = UDim2.fromScale(0.012, 0.625);
local u4 = Color3.fromRGB(22, 24, 28);
local u5 = Color3.fromRGB(36, 44, 60);
local u6 = Color3.fromRGB(52, 60, 80);
local u7 = Color3.fromRGB(48, 42, 58);
local u8 = Color3.fromRGB(34, 38, 46);
local u9 = Color3.fromRGB(150, 158, 175);
local u10 = getAlchemistFlaskRecipes();

local function currentMixRowWidth() -- Line: 36
    return 106;
end;

local function recipeIngredientsBoxWidth() -- Line: 39
    return 114;
end;

local function recipeRowWidth() -- Line: 42
    return 114 + 5 + 17 + 5 + 32;
end;

local function panelContentWidth() -- Line: 45
    return math.max(106, 114 + 5 + 17 + 5 + 32);
end;

local function mixSlot(p11, p12, p13) -- Line: 48
    -- upvalues: getItemMeta (copy), u1 (copy), u6 (copy)
    local v14;

    if p11 == nil then
        v14 = nil;
    else
        v14 = getItemMeta(p11);
    end;

    local v15 = v14 ~= nil;

    if v15 then
        local v16 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.82, 0.82),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local image = v14.image;
        v16.Image = image == nil and "" or image;
        v16.ScaleType = Enum.ScaleType.Fit;
        v15 = u1.createFragment({
            ["MixIcon_" .. tostring(p12)] = u1.createElement("ImageLabel", v16)
        });
    end;

    local v17 = {
        BorderSizePixel = 0,
        LayoutOrder = p13,
        Size = UDim2.fromOffset(32, 32),
        BackgroundColor3 = u6,
        BackgroundTransparency = p11 == nil and 0.22 or 0.1
    };
    local v18 = { u1.createElement("UICorner", {
            CornerRadius = UDim.new(0, 5)
        }) };
    local v19 = #v18;

    if v15 then
        v18[v19 + 1] = v15;
    end;

    return u1.createFragment({
        ["MixSlot_" .. tostring(p12)] = u1.createElement("Frame", v17, v18)
    });
end;

local function recipeIngredientsBox(u20, p21) -- Line: 88
    -- upvalues: getItemMeta (copy), u1 (copy), u8 (copy)
    local u22 = {};

    local function v28(p23, p24) -- Line: 92
        -- upvalues: getItemMeta (ref), u1 (ref), u20 (copy), u22 (copy)
        local v25 = getItemMeta(p23);
        local v26 = {
            BackgroundTransparency = 1,
            LayoutOrder = p24,
            Size = UDim2.fromOffset(32, 32)
        };
        local image = v25.image;
        v26.Image = image == nil and "" or image;
        v26.ScaleType = Enum.ScaleType.Fit;
        local v27 = u1.createFragment({
            ["Rec_" .. tostring(u20) .. "_IngIcon_" .. tostring(p24)] = u1.createElement("ImageLabel", v26)
        });
        table.insert(u22, v27);
    end;

    for i, v in p21 do
        v28(v, i - 1, p21);
    end;

    local v29 = {
        LayoutOrder = 0,
        BackgroundTransparency = 0.28,
        BorderSizePixel = 0,
        Size = UDim2.fromOffset(114, 32),
        BackgroundColor3 = u8
    };
    local v30 = { u1.createElement("UICorner", {
            CornerRadius = UDim.new(0, 5)
        }), u1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 5),
            PaddingRight = UDim.new(0, 5),
            PaddingTop = UDim.new(0, 0),
            PaddingBottom = UDim.new(0, 0)
        }) };
    local v31 = #v30;

    for i, v in u22 do
        v30[v31 + i] = v;
    end;

    v30[#v30 + 1] = u1.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Padding = UDim.new(0, 4),
        SortOrder = Enum.SortOrder.LayoutOrder
    });

    return u1.createFragment({
        ["RecBox_" .. tostring(u20)] = u1.createElement("Frame", v29, v30)
    });
end;

local function ingredientOwnedCell(p32, p33, p34, p35) -- Line: 147
    -- upvalues: getItemMeta (copy), u1 (copy), ColorUtil (copy)
    local v36 = getItemMeta(p32);
    local v37 = {
        BackgroundTransparency = 1,
        LayoutOrder = p35,
        Size = UDim2.fromOffset(49, 22)
    };
    local v38 = {};
    local _ = #v38;
    local v39 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromOffset(18, 18),
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 0, 0.5, 0)
    };
    local image = v36.image;
    v39.Image = image == nil and "" or image;
    v39.ScaleType = Enum.ScaleType.Fit;
    v38[p34 .. "_Icon"] = u1.createElement("ImageLabel", v39);
    v38[p34 .. "_Count"] = u1.createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextSize = 12,
        Size = UDim2.new(0, 26, 1, 0),
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.fromScale(1, 0.5),
        Text = tostring(p33),
        Font = Enum.Font.GothamBold,
        TextColor3 = ColorUtil.WHITE,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center
    });

    return u1.createFragment({
        [p34] = u1.createElement("Frame", v37, v38)
    });
end;

local function recipeArrow(p40) -- Line: 185
    -- upvalues: u1 (copy), BedwarsImageId (copy), u9 (copy)
    return u1.createFragment({
        ["RecArrow_" .. tostring(p40)] = u1.createElement("Frame", {
            LayoutOrder = 1,
            BackgroundTransparency = 1,
            Size = UDim2.fromOffset(17, 32)
        }, {
            ["RecArrowImg_" .. tostring(p40)] = u1.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Size = UDim2.fromOffset(17, 12),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Image = BedwarsImageId.LONG_ARROW_RIGHT,
                ImageColor3 = u9,
                ScaleType = Enum.ScaleType.Fit
            })
        })
    });
end;

return {
    AlchemistRecipeSidebar = v2.new(u1)(function(p41, p42) -- Line: 204
        -- upvalues: u10 (copy), getItemMeta (copy), recipeIngredientsBox (copy), recipeArrow (copy), u7 (copy), u1 (copy), u3 (copy), u4 (copy), u5 (copy), mixSlot (copy), ingredientOwnedCell (copy), ItemType (copy)
        local stagedIngredients = p41.stagedIngredients;
        local v43 = math.max(106, 114 + 5 + 17 + 5 + 32) + 14;
        local v44 = #u10;
        local v45 = v44 <= 0 and 0 or v44 * 32 + math.max(0, v44 - 1) * 4;
        local u46 = {};

        local function v58(p47, p48) -- Line: 213
            -- upvalues: getItemMeta (ref), recipeIngredientsBox (ref), recipeArrow (ref), u7 (ref), u1 (ref), u46 (copy)
            if p47.result == nil then
                return nil;
            end;

            local v49 = getItemMeta(p47.result);
            local v50 = {
                BackgroundTransparency = 1,
                LayoutOrder = p48,
                Size = UDim2.new(1, 0, 0, 32)
            };
            local v51 = {};
            local _ = #v51;
            local v52 = {
                BackgroundTransparency = 1,
                Size = UDim2.fromOffset(114 + 5 + 17 + 5 + 32, 32),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5)
            };
            local v53 = { recipeIngredientsBox(p48, p47.ingredients), recipeArrow(p48) };
            local v54 = {
                LayoutOrder = 2,
                BackgroundTransparency = 0.08,
                BorderSizePixel = 0,
                Size = UDim2.fromOffset(32, 32),
                BackgroundColor3 = u7
            };
            local v55 = { u1.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 5)
                }) };
            local _ = #v55;
            local v56 = {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.82, 0.82),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5)
            };
            local image = v49.image;
            v56.Image = image == nil and "" or image;
            v56.ScaleType = Enum.ScaleType.Fit;
            v55["RecipeRow_" .. tostring(p48) .. "_ResultIcon"] = u1.createElement("ImageLabel", v56);
            v53["RecipeRow_" .. tostring(p48) .. "_Result"] = u1.createElement("Frame", v54, v55);
            v53[#v53 + 1] = u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0, 5),
                SortOrder = Enum.SortOrder.LayoutOrder
            });
            v51["RecipeRowInner_" .. tostring(p48)] = u1.createElement("Frame", v52, v53);
            local v57 = u1.createFragment({
                ["RecipeRow_" .. tostring(p48)] = u1.createElement("Frame", v50, v51)
            });
            table.insert(u46, v57);
        end;

        for i, v in u10 do
            v58(v, i - 1, u10);
        end;

        local v59 = {
            ResetOnSpawn = false,
            IgnoreGuiInset = true,
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        };
        local v60 = {};
        local _ = #v60;
        local v61 = v44 > 0;

        if v61 then
            local v62 = {
                LayoutOrder = 1,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, v45)
            };
            local v63 = {};
            local v64 = #v63;

            for i, v in u46 do
                v63[v64 + i] = v;
            end;

            v63[#v63 + 1] = u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 4)
            });
            v61 = u1.createFragment({
                RecipeList = u1.createElement("Frame", v62, v63)
            });
        end;

        local v65 = {
            BackgroundTransparency = 0.08,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = u3,
            Size = UDim2.fromOffset(v43, (v44 <= 0 and 0 or v45 + 7) + 56 + 7 + 22),
            BackgroundColor3 = u4
        };
        local v66 = {
            u1.createElement("UICorner", {
                CornerRadius = UDim.new(0, 7)
            }),
            u1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 7),
                PaddingBottom = UDim.new(0, 7),
                PaddingLeft = UDim.new(0, 7),
                PaddingRight = UDim.new(0, 7)
            }),
            CurrentMixPanel = u1.createElement("Frame", {
                LayoutOrder = 0,
                BackgroundTransparency = 0.04,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 42),
                BackgroundColor3 = u5
            }, {
                u1.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 7)
                }),
                u1.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 5),
                    PaddingBottom = UDim.new(0, 5),
                    PaddingLeft = UDim.new(0, 5),
                    PaddingRight = UDim.new(0, 5)
                }),
                CurrentMixRowHolder = u1.createElement("Frame", {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 1)
                }, {
                    CurrentMixRow = u1.createElement("Frame", {
                        BackgroundTransparency = 1,
                        Size = UDim2.fromOffset(106, 32),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5)
                    }, {
                        mixSlot(stagedIngredients[1], 0, 0),
                        mixSlot(stagedIngredients[2], 1, 1),
                        mixSlot(stagedIngredients[3], 2, 2),
                        u1.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal,
                            HorizontalAlignment = Enum.HorizontalAlignment.Left,
                            VerticalAlignment = Enum.VerticalAlignment.Center,
                            Padding = UDim.new(0, 5),
                            SortOrder = Enum.SortOrder.LayoutOrder
                        })
                    }),
                    u1.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })
                })
            })
        };
        local v67 = #v66;

        if v61 then
            v66[v67 + 1] = v61;
        end;

        v66.OwnedIngredients = u1.createElement("Frame", {
            BackgroundTransparency = 1,
            LayoutOrder = v44 > 0 and 2 or 1,
            Size = UDim2.new(1, 0, 0, 22)
        }, {
            ingredientOwnedCell(ItemType.WILD_FLOWER, p41.wildFlowerCount, "OwnFlower", 0),
            ingredientOwnedCell(ItemType.MUSHROOMS, p41.mushroomsCount, "OwnMush", 1),
            ingredientOwnedCell(ItemType.THORNS, p41.thornsCount, "OwnThorn", 2),
            u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0, 12),
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        });
        v66[#v66 + 1] = u1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 7)
        });
        v60.AlchemistRecipeRoot = u1.createElement("Frame", v65, v66);

        return u1.createElement("ScreenGui", v59, v60);
    end)
};