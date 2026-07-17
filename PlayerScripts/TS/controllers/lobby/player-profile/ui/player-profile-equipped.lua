-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local CurrentlyEquipped = RuntimeLib.import(script, script.Parent, "currently-equipped").CurrentlyEquipped;
local FavoriteKits = RuntimeLib.import(script, script.Parent, "favorite-kits").FavoriteKits;

return {
    PlayerProfileEquipped = v2.new(u1)(function(p3, p4) -- Line: 8
        -- upvalues: Theme (copy), u1 (copy), FavoriteKits (copy), CurrentlyEquipped (copy)
        local _ = p4.useState;
        local v5 = {
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Theme.backgroundPrimary
        };
        local FrameProps = p3.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v5[i] = v;
            end;
        end;

        local v6 = { u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }) };
        local v7 = #v6;
        local v8 = next(p3.ProfileData.favoriteKitData) ~= nil and u1.createElement(FavoriteKits, {
            LayoutOrder = 0,
            ProfileData = p3.ProfileData,
            Size = UDim2.fromScale(0.5, 0.95)
        });

        if v8 then
            v6[v7 + 1] = v8;
        end;

        v6[#v6 + 1] = u1.createElement(CurrentlyEquipped, {
            LayoutOrder = 1,
            ProfileData = p3.ProfileData,
            Size = UDim2.fromScale(0.5, 1)
        });

        return u1.createElement("Frame", v5, v6);
    end)
};