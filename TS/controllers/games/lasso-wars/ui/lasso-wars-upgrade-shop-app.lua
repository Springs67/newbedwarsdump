-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local SlideIn = v1.SlideIn;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local LassoWarsUpgrades = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "lasso-wars", "lasso-wars-upgrade-meta").LassoWarsUpgrades;
local LassoWarsUpgradeCard = RuntimeLib.import(script, script.Parent, "lasso-wars-upgrade-card").LassoWarsUpgradeCard;
local v32 = v4.new(u3)(function(p6, p7) -- Line: 17
    -- upvalues: u2 (copy), LassoWarsUpgrades (copy), DeviceUtil (copy), Players (copy), RuntimeLib (copy), Flamework (copy), BedwarsAppIds (copy), u3 (copy), DarkBackground (copy), ColorUtil (copy), LassoWarsUpgradeCard (copy), SlideIn (copy)
    local _ = p7.useState;
    local useEffect = p7.useEffect;
    local v8 = #u2.keys(LassoWarsUpgrades);
    local u9 = UDim2.new(1 / v8, 0, 1, 0);
    local v10 = DeviceUtil.isSmallScreen();
    useEffect(function() -- Line: 24
        -- upvalues: Players (ref), RuntimeLib (ref), Flamework (ref), BedwarsAppIds (ref)
        local u11 = true;
        local LocalPlayer = Players.LocalPlayer;

        if LocalPlayer ~= nil then
            LocalPlayer = LocalPlayer.Character;
        end;

        if LocalPlayer then
            local Position = Players.LocalPlayer.Character:GetPrimaryPartCFrame().Position;
            RuntimeLib.Promise.defer(function() -- Line: 32
                -- upvalues: u11 (ref), Players (ref), Position (copy), Flamework (ref), BedwarsAppIds (ref)
                while true do
                    local v12 = task.wait(0.2);

                    if v12 ~= 0 and (v12 == v12 and v12) then
                        v12 = u11;
                    end;

                    if v12 == 0 or (v12 ~= v12 or not v12) then
                        return;
                    end;

                    local Character = Players.LocalPlayer.Character;

                    if Character ~= nil then
                        Character = Character:GetPrimaryPartCFrame().Position;
                    end;

                    if Character == nil then
                        Character = Vector3.new();
                    end;

                    if (Character - Position).Magnitude > 6 then
                        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.LASSO_WARS_UPGRADE_SHOP_APP);
                    end;
                end;
            end);
        end;

        return function() -- Line: 56
            -- upvalues: u11 (ref)
            u11 = false;
        end;
    end, {});
    local v13 = {
        DisplayOrder = 20,
        ResetOnSpawn = false
    };
    local v14 = { u3.createElement(DarkBackground, {
            BackgroundTransparency = 0.4,
            AppId = p6.AppId
        }) };
    local v15 = {};
    local v16 = {
        BackgroundTransparency = 1,
        Modal = true
    };
    local v17;

    if v10 then
        v17 = UDim2.fromScale(0.9, 0.7);
    else
        v17 = UDim2.fromScale(0.8, 0.5);
    end;

    v16.Size = v17;
    v16.Position = UDim2.fromScale(0.5, 0.45);
    v16.AnchorPoint = Vector2.new(0.5, 0.5);
    local v18 = {};
    local _ = #v18;
    local v19 = {
        BackgroundTransparency = 0,
        LayoutOrder = 1,
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromHex("#AC714A"),
        Size = UDim2.fromScale(1, 1)
    };
    local v20 = { u3.createElement("UIStroke", {
            Thickness = 3,
            Color = Color3.fromHex("#3A160E")
        }), u3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 10)
        }) };
    local _ = #v20;
    local v21 = {
        LayoutOrder = 1,
        BorderSizePixel = 0,
        BackgroundTransparency = 0,
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromHex("#C3976A"),
        Size = UDim2.fromScale(0.95, 0.88)
    };
    local v22 = { u3.createElement("UIStroke", {
            Thickness = 3,
            Color = Color3.fromHex("#924A36")
        }), u3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 10)
        }), u3.createElement("TextLabel", {
            BackgroundTransparency = 1,
            Text = "Lasso Upgrades",
            TextScaled = true,
            TextStrokeTransparency = 0.2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.1),
            Size = UDim2.fromScale(1, 0.2),
            TextColor3 = ColorUtil.WHITE,
            Font = Enum.Font.SourceSansBold,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center
        }) };
    local _ = #v22;

    local function _(p23) -- Line: 134
        -- upvalues: LassoWarsUpgrades (ref), u3 (ref), LassoWarsUpgradeCard (ref), u9 (copy)
        local v24 = LassoWarsUpgrades[p23];

        return u3.createElement(LassoWarsUpgradeCard, {
            cardSize = u9,
            upgradeMeta = v24,
            upgradeType = p23,
            LayoutOrder = v24.layoutOrder
        });
    end;

    local v25 = 0;
    local v26 = {};

    for i, v in u2.keys(LassoWarsUpgrades) do
        local _ = i - 1;
        local v27 = LassoWarsUpgrades[v];
        local v28 = u3.createElement(LassoWarsUpgradeCard, {
            cardSize = u9,
            upgradeMeta = v27,
            upgradeType = v,
            LayoutOrder = v27.layoutOrder
        });

        if v28 ~= nil then
            v25 = v25 + 1;
            v26[v25] = v28;
        end;
    end;

    local v29 = {
        LayoutOrder = 1,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.58),
        Size = UDim2.fromScale(0.95, 0.7)
    };
    local v30 = { u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder
        }) };
    local v31 = #v30;

    for i, v in v26 do
        v30[v31 + i] = v;
    end;

    v22.UpgradeArea = u3.createElement("Frame", v29, v30);
    v20.InnerBackground = u3.createElement("Frame", v21, v22);
    v18.OuterBackground = u3.createElement("Frame", v19, v20);
    v15[#v15 + 1] = u3.createElement("ImageButton", v16, v18);
    v14[#v14 + 1] = u3.createElement(SlideIn, {}, v15);

    return u3.createFragment({
        LassoWarsUpgradeShopApp = u3.createElement("ScreenGui", v13, v14)
    });
end);

return {
    LassoWarsUpgradeShopApp = v5.connect(function(p33, p34) -- Line: 184
        local v35 = {};

        for i, v in p34 do
            v35[i] = v;
        end;

        return v35;
    end)(v32)
};