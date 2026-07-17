-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local PiggyBankUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "piggy-bank", "piggy-bank-util").PiggyBankUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    PiggyBankTitle = v2.new(u1)(function(p3, p4) -- Line: 7
        -- upvalues: PiggyBankUtil (copy), u1 (copy), BedwarsImageId (copy)
        local _ = p4.useState;
        local v5 = PiggyBankUtil:getStageFromCoins(p3.coins);
        local v6 = false;
        local v7 = 0;
        local v8 = {};

        while true do
            if v6 then
                v7 = v7 + 1;
            else
                v6 = true;
            end;

            if v7 >= v5 then
                local v9 = {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 1),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                };
                local v10 = {};
                local v11 = #v10;
                local v12 = {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 0.5),
                    Position = UDim2.fromScale(0.5, 0),
                    AnchorPoint = Vector2.new(0.5, 0)
                };
                local v13 = { u1.createElement("UIGridLayout", {
                        FillDirection = "Horizontal",
                        HorizontalAlignment = "Center",
                        CellSize = UDim2.fromScale(0.18, 0.9),
                        CellPadding = UDim2.fromScale(0.02)
                    }) };
                local v14 = #v13;

                for i, v in v8 do
                    v13[v14 + i] = v;
                end;

                v10[v11 + 1] = u1.createElement("Frame", v12, v13);
                v10[v11 + 2] = u1.createElement("TextLabel", {
                    Font = "LuckiestGuy",
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    Text = tostring(p3.coins) .. " Candy",
                    TextColor3 = p3.color,
                    Size = UDim2.fromScale(0.95, 0.3),
                    Position = UDim2.fromScale(0.5, 0.8),
                    AnchorPoint = Vector2.new(0.5, 1)
                }, { u1.createElement("UIStroke", {
                        Thickness = 2
                    }) });

                return u1.createElement("Frame", v9, v10);
            end;

            local v15 = u1.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                Image = BedwarsImageId.STAR_SOLID
            }, { u1.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) });
            table.insert(v8, v15);
        end;
    end)
};