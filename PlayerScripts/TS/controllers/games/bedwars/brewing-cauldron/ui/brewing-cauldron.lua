-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local TimedProgressBar = v1.TimedProgressBar;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local CraftingStatus = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "crafting-entity", "crafting-entity-types").CraftingStatus;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local IngredientBox = RuntimeLib.import(script, script.Parent, "ingredient-box").IngredientBox;

return {
    BrewingCauldron = v4.new(u3)(function(u5, p6) -- Line: 15
        -- upvalues: u3 (copy), IngredientBox (copy), CraftingStatus (copy), Workspace (copy), TimedProgressBar (copy), ColorUtil (copy), u2 (copy), getItemMeta (copy), Empty (copy)
        local useEffect = p6.useEffect;
        local v7, u8 = p6.useState(0);
        local MaxNumIngredients = u5.MaxNumIngredients;
        local v9 = (MaxNumIngredients == nil and 3 or MaxNumIngredients) - #u5.Inventory;
        local v10 = false;
        local v11 = 0;
        local v12 = {};

        while true do
            if v10 then
                v11 = v11 + 1;
            else
                v10 = true;
            end;

            if v11 >= v9 then
                local Text = u5.Text;
                useEffect(function() -- Line: 42
                    -- upvalues: u5 (copy), CraftingStatus (ref), u8 (copy), Workspace (ref)
                    if u5.CraftingStatus == CraftingStatus.crafting then
                        local timeToCraft = u5.timeToCraft;
                        u8(Workspace:GetServerTimeNow() + timeToCraft);
                    end;
                end, { u5.CraftingStatus });
                local v13 = {
                    MaxDistance = 35,
                    ExtentsOffsetWorldSpace = Vector3.new(0, 1, 0),
                    AlwaysOnTop = true,
                    ResetOnSpawn = false,
                    Size = UDim2.fromScale(7, 3),
                    SizeOffset = Vector2.new(0, 1)
                };
                local v14 = {};
                local v15 = #v14;
                local v16;

                if u5.CraftingStatus == CraftingStatus.crafting and v7 > 0 then
                    v16 = u3.createElement(TimedProgressBar, {
                        HideOnComplete = true,
                        EndTime = v7,
                        ProgressBarConfig = {
                            BarColor = ColorUtil.WHITE
                        },
                        AnchorPoint = Vector2.new(0, 0),
                        Position = UDim2.fromScale(0, 0),
                        Size = UDim2.fromScale(1, 0.1)
                    }, { u3.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        }) });
                else
                    v16 = false;
                end;

                if v16 then
                    v14[v15 + 1] = v16;
                end;

                local _ = #v14;
                local v17 = {
                    BackgroundTransparency = 0.3,
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.fromScale(0, 0.13),
                    Size = UDim2.fromScale(1, 0.87),
                    BackgroundColor3 = ColorUtil.BLACK
                };
                local v18 = {
                    u3.createElement("UICorner", {
                        CornerRadius = UDim.new(0.1, 0)
                    }),
                    u3.createElement("UIPadding", {
                        PaddingTop = UDim.new(0.1, 0),
                        PaddingBottom = UDim.new(0.1, 0),
                        PaddingRight = UDim.new(0.05, 0),
                        PaddingLeft = UDim.new(0.05, 0)
                    }),
                    u3.createElement("UIListLayout", {
                        FillDirection = "Vertical",
                        VerticalAlignment = "Center",
                        HorizontalAlignment = "Center",
                        SortOrder = "LayoutOrder",
                        Padding = UDim.new(0.05, 0)
                    }),
                    Title = u3.createElement("TextLabel", {
                        SizeConstraint = "RelativeYY",
                        TextScaled = true,
                        RichText = true,
                        BackgroundTransparency = 1,
                        TextXAlignment = "Center",
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(1, 0.15),
                        Text = Text,
                        TextColor3 = ColorUtil.WHITE
                    })
                };
                local _ = #v18;
                local v19 = u2.entries(u5.Inventory);

                local function _(p20) -- Line: 114
                    -- upvalues: getItemMeta (ref), u3 (ref), IngredientBox (ref)
                    local _ = p20[1];
                    local v21 = getItemMeta(p20[2]);

                    return u3.createElement(IngredientBox, {
                        Amount = 1,
                        Image = v21.image
                    });
                end;

                local v22 = table.create(#v19);

                for i, v in v19 do
                    local _ = i - 1;
                    local _ = v[1];
                    local v23 = getItemMeta(v[2]);
                    v22[i] = u3.createElement(IngredientBox, {
                        Amount = 1,
                        Image = v23.image
                    });
                end;

                local v24 = {
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(1, 0.75)
                };
                local v25 = { u3.createElement("UIListLayout", {
                        FillDirection = "Horizontal",
                        VerticalAlignment = "Center",
                        HorizontalAlignment = "Center",
                        Padding = UDim.new(0.05, 0)
                    }) };
                local v26 = #v25;

                for i, v in v22 do
                    v25[v26 + i] = v;
                end;

                local v27 = #v25;

                for i, v in v12 do
                    v25[v27 + i] = v;
                end;

                v18.IngredientList = u3.createElement(Empty, v24, v25);
                v14.Container = u3.createElement("Frame", v17, v18);

                return u3.createFragment({
                    BrewingCauldronBillboard = u3.createElement("BillboardGui", v13, v14)
                });
            end;

            local v28 = u3.createElement(IngredientBox);
            table.insert(v12, v28);
        end;
    end)
};