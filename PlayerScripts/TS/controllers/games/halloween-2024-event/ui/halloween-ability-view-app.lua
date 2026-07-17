-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ColorUtil = v1.ColorUtil;
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local HalloweenUpgradeMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-upgrade-meta").HalloweenUpgradeMeta;
local HalloweenUpgradeUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-upgrade-util").HalloweenUpgradeUtil;
local v29 = v4.new(u3)(function(p6, p7) -- Line: 17
    -- upvalues: DeviceUtil (copy), u2 (copy), HalloweenUpgradeMeta (copy), HalloweenUpgradeUtil (copy), Players (copy), EntityUtil (copy), u3 (copy), DarkBackground (copy), ColorUtil (copy), Empty (copy), AutoCanvasScrollingFrame (copy)
    local _ = p7.useState;
    local _ = p7.useEffect;
    local u8 = {};

    if DeviceUtil.isHoarceKat() then
        local function _(p9) -- Line: 49
            -- upvalues: u8 (copy)
            table.insert(u8, {
                tier = 2,
                abilityType = p9[1]
            });
        end;

        for i, v in u2.entries(HalloweenUpgradeMeta) do
            local _ = i - 1;
            table.insert(u8, {
                tier = 2,
                abilityType = v[1]
            });
        end;
    else
        local v10 = u2.entries(HalloweenUpgradeMeta);

        local function v17(p11) -- Line: 23
            -- upvalues: HalloweenUpgradeUtil (ref), Players (ref), EntityUtil (ref), u8 (copy)
            local v12 = p11[1];
            local v13 = HalloweenUpgradeUtil:getAttributeName(v12);

            if Players.LocalPlayer:GetAttribute(v13) ~= nil then
                local v14 = EntityUtil:getEntity(Players.LocalPlayer);

                if v14 ~= nil then
                    v14 = v14:getInstance();
                end;

                local v15 = {
                    abilityType = v12
                };
                local v16 = Players.LocalPlayer:GetAttribute(v13);
                v15.tier = v16 == nil and 0 or v16;
                table.insert(u8, v15);
            end;
        end;

        for i, v in v10 do
            v17(v, i - 1, v10);
        end;
    end;

    local v18 = {
        DisplayOrder = 20,
        ResetOnSpawn = false,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    };
    local v19 = { u3.createElement(DarkBackground, {
            BackgroundTransparency = 0.9,
            AppId = p6.AppId
        }) };
    local v20 = {
        BorderSizePixel = 0,
        Size = UDim2.fromScale(0.6, 0.9),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = ColorUtil.WHITE
    };
    local v21 = {
        u3.createElement("UIGradient", {
            Rotation = -90,
            Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(125, 69, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)) }),
            Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.1), NumberSequenceKeypoint.new(1, 0.1) })
        }),
        u3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 10)
        }),
        u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10)
        }),
        u3.createElement(Empty, {
            LayoutOrder = 0,
            Size = UDim2.fromScale(1, 0.02)
        }),
        u3.createElement("TextLabel", {
            Text = "CURRENT UPGRADES",
            TextScaled = true,
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Font = Enum.Font.LuckiestGuy,
            Size = UDim2.fromScale(1, 0.05),
            TextColor3 = ColorUtil.WHITE
        })
    };
    local v22 = {
        ScrollingFrameProps = {
            Size = UDim2.new(0, 400, 0.9, 0) - UDim2.fromOffset(0, 10),
            Position = UDim2.fromScale(0, 0),
            AnchorPoint = Vector2.new(0, 0),
            LayoutOrder = 2,
            ScrollingDirection = Enum.ScrollingDirection.Y
        }
    };

    local function v25(p23, p24) -- Line: 122
        -- upvalues: u3 (ref), HalloweenUpgradeMeta (ref), ColorUtil (ref)
        return u3.createElement("TextLabel", {
            BackgroundTransparency = 1,
            RichText = true,
            Size = UDim2.new(1, 0, 0, 20),
            Text = "<b>" .. HalloweenUpgradeMeta[p23.abilityType].hudDescription .. "</b> x" .. tostring(p23.tier),
            LayoutOrder = p24,
            FontSize = Enum.FontSize.Size18,
            TextColor3 = ColorUtil.WHITE,
            Font = Enum.Font.Roboto
        });
    end;

    local v26 = table.create(#u8);

    for i, v in u8 do
        v26[i] = v25(v, i - 1, u8);
    end;

    local v27 = { u3.createElement("UIGridLayout", {
            HorizontalAlignment = "Center",
            VerticalAlignment = "Top",
            SortOrder = "LayoutOrder",
            FillDirectionMaxCells = 2,
            CellSize = UDim2.fromOffset(200, 30)
        }) };
    local v28 = #v27;

    for i, v in v26 do
        v27[v28 + i] = v;
    end;

    v21[#v21 + 1] = u3.createElement(AutoCanvasScrollingFrame, v22, v27);
    v19[#v19 + 1] = u3.createElement("Frame", v20, v21);

    return u3.createElement("ScreenGui", v18, v19);
end);

return {
    HalloweenAbilityViewApp = v5.connect(function(p30, p31) -- Line: 158
        local v32 = {};

        for i, v in p31 do
            v32[i] = v;
        end;

        return v32;
    end)(v29)
};