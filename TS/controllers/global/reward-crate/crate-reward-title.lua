-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local getCrateItemRarityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity-meta").getCrateItemRarityMeta;

return {
    CrateRewardTitle = v2.new(u1)(function(p3, p4) -- Line: 7
        -- upvalues: getCrateItemRarityMeta (copy), u1 (copy), BedwarsImageId (copy)
        local _ = p4.useState;
        local colorTop = getCrateItemRarityMeta(p3.itemRarity).gradient.colorTop;
        local v5 = false;
        local v6 = 0;
        local v7 = {};

        while true do
            if v5 then
                v6 = v6 + 1;
            else
                v5 = true;
            end;

            if v6 >= getCrateItemRarityMeta(p3.itemRarity).stars then
                local v8 = {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 1),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                };
                local v9 = {};
                local v10 = {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 0.5),
                    Position = UDim2.fromScale(0.5, 0),
                    AnchorPoint = Vector2.new(0.5, 0)
                };
                local v11 = { u1.createElement("UIGridLayout", {
                        FillDirection = "Horizontal",
                        HorizontalAlignment = "Center",
                        CellSize = UDim2.fromScale(0.18, 0.9),
                        CellPadding = UDim2.fromScale(0.02)
                    }) };
                local v12 = #v11;

                for i, v in v7 do
                    v11[v12 + i] = v;
                end;

                v9.StarsList = u1.createElement("Frame", v10, v11);
                v9[#v9 + 1] = u1.createElement("TextLabel", {
                    Font = "LuckiestGuy",
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    Text = p3.itemDisplayName,
                    TextColor3 = colorTop,
                    Size = UDim2.fromScale(0.95, 0.48),
                    Position = UDim2.fromScale(0.5, 1),
                    AnchorPoint = Vector2.new(0.5, 1)
                }, { u1.createElement("UIStroke", {
                        Thickness = 2
                    }) });

                return u1.createElement("Frame", v8, v9);
            end;

            local v13 = u1.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                Image = BedwarsImageId.STAR_SOLID
            }, { u1.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) });
            table.insert(v7, v13);
        end;
    end)
};