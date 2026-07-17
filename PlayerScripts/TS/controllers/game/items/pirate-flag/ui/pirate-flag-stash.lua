-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;

return {
    PirateFlagStash = v4.new(u3)(function(p5, p6) -- Line: 10
        -- upvalues: u2 (copy), getItemMeta (copy), u3 (copy), Empty (copy), ColorUtil (copy)
        local _ = p6.useState;
        local _ = p6.useEffect;
        local v7 = {
            StudsOffsetWorldSpace = Vector3.new(0, 8, 0),
            ResetOnSpawn = false,
            MaxDistance = 200,
            Adornee = p5.Flag,
            Size = UDim2.fromScale(2, 2)
        };
        local v8 = {};
        local _ = #v8;
        local v9 = u2.entries(p5.ItemsCollected);

        local function v15(p10, p11) -- Line: 23
            -- upvalues: getItemMeta (ref), u3 (ref), Empty (ref), ColorUtil (ref)
            local v12 = p10[1];
            local v13 = p10[2];
            local v14 = getItemMeta(v12);

            return u3.createFragment({
                ["StashItem_" .. v12] = u3.createElement(Empty, {
                    Size = UDim2.fromScale(1, 0.2),
                    LayoutOrder = p11 + 5
                }, {
                    u3.createElement("UIListLayout", {
                        FillDirection = "Horizontal",
                        VerticalAlignment = "Center",
                        HorizontalAlignment = "Center",
                        Padding = UDim.new(0, 3),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }),
                    ItemImage = u3.createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(1, 1),
                        SizeConstraint = Enum.SizeConstraint.RelativeYY,
                        ScaleType = Enum.ScaleType.Fit,
                        Image = v14.image
                    }),
                    ItemAmount = u3.createElement("TextLabel", {
                        AutomaticSize = "X",
                        Font = "Roboto",
                        RichText = true,
                        TextScaled = true,
                        BackgroundTransparency = 1,
                        LayoutOrder = 2,
                        Size = UDim2.fromScale(0, 1),
                        Text = "<b>" .. tostring(v13) .. "</b>",
                        TextColor3 = v14.displayNameColor or ColorUtil.WHITE
                    })
                })
            });
        end;

        local v16 = table.create(#v9);

        for i, v in v9 do
            v16[i] = v15(v, i - 1, v9);
        end;

        local v17 = {
            BackgroundTransparency = 0.3,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = ColorUtil.BLACK
        };
        local v18 = {
            u3.createElement("UICorner", {
                CornerRadius = UDim.new(0.1, 0)
            }),
            u3.createElement("UIStroke", {
                Thickness = 2,
                Color = ColorUtil.WHITE
            }),
            StashList = u3.createElement(
                "UIListLayout",
                {
                    FillDirection = "Vertical",
                    VerticalAlignment = "Center",
                    HorizontalAlignment = "Center",
                    SortOrder = "LayoutOrder"
                }
            ),
            Title = u3.createElement("TextLabel", {
                Text = "<b>Items Stolen</b>",
                Font = "Roboto",
                RichText = true,
                TextScaled = true,
                TextXAlignment = "Center",
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.8, 0.2),
                TextColor3 = ColorUtil.WHITE
            })
        };
        local v19 = #v18;

        for i, v in v16 do
            v18[v19 + i] = v;
        end;

        v8.PirateFlagStashContainer = u3.createElement("Frame", v17, v18);

        return u3.createFragment({
            PirateFlagStashGUI = u3.createElement("BillboardGui", v7, v8)
        });
    end)
};