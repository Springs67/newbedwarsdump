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
local HalloweenAbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-ability-meta").HalloweenAbilityMeta;
local HalloweenAbilityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-ability-util").HalloweenAbilityUtil;
local v28 = v4.new(u3)(function(p6, p7) -- Line: 17
    -- upvalues: DeviceUtil (copy), u2 (copy), HalloweenAbilityMeta (copy), HalloweenAbilityUtil (copy), Players (copy), EntityUtil (copy), u3 (copy), DarkBackground (copy), ColorUtil (copy), Empty (copy), AutoCanvasScrollingFrame (copy)
    local _ = p7.useState;
    local _ = p7.useEffect;
    local u8 = {};

    if DeviceUtil.isHoarceKat() then
        local function _(p9) -- Line: 53
            -- upvalues: u8 (copy)
            table.insert(u8, {
                tier = 2,
                abilityType = p9[1]
            });
        end;

        for i, v in u2.entries(HalloweenAbilityMeta) do
            local _ = i - 1;
            table.insert(u8, {
                tier = 2,
                abilityType = v[1]
            });
        end;
    else
        local v10 = u2.entries(HalloweenAbilityMeta);

        local function v16(p11) -- Line: 23
            -- upvalues: HalloweenAbilityUtil (ref), Players (ref), EntityUtil (ref), u8 (copy)
            local v12 = p11[1];
            local v13 = HalloweenAbilityUtil:getAttributeName(v12);

            if Players.LocalPlayer:GetAttribute(v13) == true then
                local v14 = EntityUtil:getEntity(Players.LocalPlayer);

                if v14 ~= nil then
                    v14 = v14:getInstance();
                end;

                local v15 = {
                    abilityType = v12
                };

                if v14 ~= nil then
                    v14 = v14:GetAttribute(v13);
                end;

                v15.tier = v14 == nil and 0 or v14;
                table.insert(u8, v15);
            end;
        end;

        for i, v in v10 do
            v16(v, i - 1, v10);
        end;
    end;

    local v17 = {
        DisplayOrder = 20,
        ResetOnSpawn = false,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    };
    local v18 = { u3.createElement(DarkBackground, {
            BackgroundTransparency = 0.9,
            AppId = p6.AppId
        }) };
    local v19 = {
        BorderSizePixel = 0,
        Size = UDim2.fromScale(0.6, 0.9),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = ColorUtil.WHITE
    };
    local v20 = {
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
    local v21 = {
        ScrollingFrameProps = {
            Size = UDim2.new(0, 400, 0.9, 0) - UDim2.fromOffset(0, 10),
            Position = UDim2.fromScale(0, 0),
            AnchorPoint = Vector2.new(0, 0),
            LayoutOrder = 2,
            ScrollingDirection = Enum.ScrollingDirection.Y
        }
    };

    local function v24(p22, p23) -- Line: 126
        -- upvalues: u3 (ref), HalloweenAbilityMeta (ref), ColorUtil (ref)
        return u3.createElement("TextLabel", {
            BackgroundTransparency = 1,
            RichText = true,
            Size = UDim2.new(1, 0, 0, 20),
            Text = "<b>" .. HalloweenAbilityMeta[p22.abilityType].hudDescription .. "</b> x" .. tostring(p22.tier),
            LayoutOrder = p23,
            FontSize = Enum.FontSize.Size18,
            TextColor3 = ColorUtil.WHITE,
            Font = Enum.Font.Roboto
        });
    end;

    local v25 = table.create(#u8);

    for i, v in u8 do
        v25[i] = v24(v, i - 1, u8);
    end;

    local v26 = { u3.createElement("UIGridLayout", {
            HorizontalAlignment = "Center",
            VerticalAlignment = "Top",
            SortOrder = "LayoutOrder",
            FillDirectionMaxCells = 2,
            CellSize = UDim2.fromOffset(200, 30)
        }) };
    local v27 = #v26;

    for i, v in v25 do
        v26[v27 + i] = v;
    end;

    v20[#v20 + 1] = u3.createElement(AutoCanvasScrollingFrame, v21, v26);
    v18[#v18 + 1] = u3.createElement("Frame", v19, v20);

    return u3.createElement("ScreenGui", v17, v18);
end);

return {
    HalloweenAbilityViewApp = v5.connect(function(p29, p30) -- Line: 162
        local v31 = {};

        for i, v in p30 do
            v31[i] = v;
        end;

        return v31;
    end)(v28)
};