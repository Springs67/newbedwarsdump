-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local LineButton = v1.LineButton;
local LineFrame = v1.LineFrame;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local getFlamethrowerUpgradeMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "pyro", "flamethrower-upgrade").getFlamethrowerUpgradeMeta;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;

return {
    FlamethrowerTierCard = v3.new(u2)(function(u4, p5) -- Line: 14
        -- upvalues: getFlamethrowerUpgradeMeta (copy), InventoryUtil (copy), Players (copy), u2 (copy), ColorUtil (copy), LineFrame (copy), LineButton (copy), default (copy), KnitClient (copy)
        local _ = p5.useState;
        local v6 = u4.UpgradeMap[u4.Upgrade];
        local v7 = (v6 == nil and -1 or v6) + 1;
        local v8 = getFlamethrowerUpgradeMeta(u4.Upgrade);
        local v9;

        if v7 < #v8.tiers then
            v9 = v8.tiers[v7 + 1];
        else
            v9 = nil;
        end;

        local v10;

        if v9 then
            local v11;

            if v9 == nil then
                v11 = v9;
            else
                v11 = v9.currency;
            end;

            local v12;

            if v9 == nil then
                v12 = v9;
            else
                v12 = v9.price;
            end;

            v10 = InventoryUtil.hasEnough(Players.LocalPlayer, v11, v12);
        else
            v10 = v9;
        end;

        local v13 = v10 and true or false;
        local v14 = u4.Locked and v7 + 1 == 4 and true or false;
        local createElement = u2.createElement;
        local v15 = {
            BackgroundTransparency = 1,
            Size = u4.Size,
            Position = u4.Position,
            AnchorPoint = u4.AnchorPoint
        };
        local v16 = {};
        local v17 = u2.createElement(
            "UIListLayout",
            {
                FillDirection = "Vertical",
                HorizontalAlignment = "Center",
                SortOrder = "LayoutOrder"
            }
        );
        local v18 = u2.createElement("Frame", {
            BackgroundTransparency = 1,
            LayoutOrder = 0,
            Size = UDim2.fromScale(1, 0.18867924528301888)
        }, { u2.createElement("TextLabel", {
                Font = "RobotoCondensed",
                RichText = true,
                TextScaled = true,
                TextXAlignment = "Left",
                TextYAlignment = "Bottom",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.6, 0.9),
                Position = UDim2.fromScale(0, 0),
                Text = "<b>" .. v8.name .. ":</b>  Tier " .. tostring(v7),
                TextColor3 = ColorUtil.WHITE
            }) });
        local createElement2 = u2.createElement;
        local v19 = {
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.9270440251572327),
            BackgroundColor3 = ColorUtil.hexColor(0)
        };
        local v20 = {};
        local createElement3 = u2.createElement;
        local v21 = {
            BorderWidthPixels = 2,
            BorderTransparency = 1,
            BorderColor3 = ColorUtil.WHITE,
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5)
        };
        local v22 = {};
        local v23 = u2.createElement(
            "UIListLayout",
            {
                SortOrder = "LayoutOrder",
                FillDirection = "Vertical",
                HorizontalAlignment = "Center"
            }
        );
        local v24 = u2.createElement("Frame", {
            BackgroundTransparency = 1,
            LayoutOrder = 0,
            Size = UDim2.fromScale(1, 0.5)
        }, { u2.createElement("TextLabel", {
                Font = "RobotoCondensed",
                TextXAlignment = "Center",
                TextYAlignment = "Center",
                TextScaled = true,
                BackgroundTransparency = 1,
                Text = not v9 and "" or v9.name,
                Size = UDim2.fromScale(0.95, 0.45),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                TextColor3 = ColorUtil.WHITE
            }) });
        local createElement4 = u2.createElement;
        local v25 = {
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.5)
        };
        local v26 = {};
        local createElement5 = u2.createElement;
        local v28 = {
            Size = UDim2.fromScale(0.95, 0.8),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Color3 = ColorUtil.hexColor(16727624),
            Text = not v9 and "MAXED" or (v14 and "LOCKED" or tostring(v9.price) .. " " .. string.upper(v9.currency) .. (v9.price == 1 and "" or "S")),

            OnClick = function() -- Line: 126, Name: OnClick
                -- upvalues: default (ref), u4 (copy), KnitClient (ref)
                default.Client:Get("UpgradeFlamethrower"):CallServerAsync(u4.Upgrade):andThen(function(p27) -- Line: 128
                    -- upvalues: KnitClient (ref), u4 (ref)
                    if p27 then
                        KnitClient.Controllers.FlamethrowerController:upgrade();
                        u4.SetUpgrades(p27);
                    end;
                end);
            end
        };

        if v13 then
            if v9 == nil then
                v13 = false;
            else
                v13 = not v14;
            end;
        end;

        v28.Enabled = v13;
        v26[1] = createElement5(LineButton, v28);
        v22[1], v22[2], v22[3] = v23, v24, createElement4("Frame", v25, v26);
        v20[1] = createElement3(LineFrame, v21, v22);
        v16[1], v16[2], v16[3] = v17, v18, createElement2("Frame", v19, v20);

        return createElement("Frame", v15, v16);
    end)
};