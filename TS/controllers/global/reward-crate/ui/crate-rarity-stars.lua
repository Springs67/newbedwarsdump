-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local getCrateItemRarityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity-meta").getCrateItemRarityMeta;

return {
    CrateRarityStars = v2.new(u1)(function(p3, p4) -- Line: 7
        -- upvalues: getCrateItemRarityMeta (copy), u1 (copy), BedwarsImageId (copy)
        local _ = p4.useState;
        local v5 = getCrateItemRarityMeta(p3.Rarity);
        local v6 = false;
        local v7 = 0;
        local v8 = {};

        while true do
            if v6 then
                v7 = v7 + 1;
            else
                v6 = true;
            end;

            if v7 >= v5.stars then
                local v9 = {};
                local v10 = #v9;

                for i, v in v8 do
                    v9[v10 + i] = v;
                end;

                return u1.createFragment(v9);
            end;

            local v11 = u1.createElement("ImageLabel", {
                SizeConstraint = "RelativeYY",
                BackgroundTransparency = 1,
                ZIndex = 11,
                Size = UDim2.fromScale(1, 1),
                Image = BedwarsImageId.STAR_SOLID
            }, { u1.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) });
            table.insert(v8, v11);
        end;
    end)
};