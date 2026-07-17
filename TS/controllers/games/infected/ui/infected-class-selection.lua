-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local ScaleComponent = v1.ScaleComponent;
local SlideIn = v1.SlideIn;
local WidgetComponent = v1.WidgetComponent;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local InfectedVariantMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "infected", "infected-variant-meta").InfectedVariantMeta;
local InfectedClassSelectButton = RuntimeLib.import(script, script.Parent, "infected-class-select-button").InfectedClassSelectButton;
local v26 = v4.new(u3)(function(u6, p7) -- Line: 19
    -- upvalues: DeviceUtil (copy), u3 (copy), DarkBackground (copy), Workspace (copy), ScaleComponent (copy), Flamework (copy), ColorUtil (copy), u2 (copy), InfectedVariantMeta (copy), InfectedClassSelectButton (copy), Empty (copy), WidgetComponent (copy), SlideIn (copy)
    local _ = p7.useState;
    local v8 = {
        DisplayOrder = 20,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    };
    local v9 = { u3.createElement(DarkBackground, {
            BackgroundTransparency = 0.4,
            AppId = u6.AppId
        }) };
    local v10 = {};
    local _ = #v10;
    local v11 = {
        LayoutOrder = 1,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Size = UDim2.fromOffset(1102, 805),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5)
    };
    local v12 = {};
    local v13 = #v12;
    local v14 = {
        MaximumSize = Vector2.new(1102, 805)
    };
    local ViewportSize = Workspace.CurrentCamera.ViewportSize;
    local v15 = Vector2.new(1, 0);
    local v16 = Vector2.new(20, 20);
    v14.ScreenPadding = ViewportSize * v15 / 2 + v16;
    v12[v13 + 1] = u3.createElement(ScaleComponent, v14);
    local v17 = {
        ClipsDescendents = false,
        Title = "Class Selection",
        AppId = u6.AppId,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),

        OnClose = function() -- Line: 59, Name: OnClose
            -- upvalues: Flamework (ref), u6 (copy)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u6.AppId);
        end,

        ContentUIPadding = u3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 0),
            PaddingBottom = UDim.new(0, 0),
            PaddingLeft = UDim.new(0, 5),
            PaddingRight = UDim.new(0, 5)
        })
    };
    local v18 = {
        u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Center",
            Padding = UDim.new(0.01, 0),
            SortOrder = Enum.SortOrder.LayoutOrder
        }),
        Title = u3.createElement("TextLabel", {
            Text = "Select a Variant",
            TextScaled = true,
            TextYAlignment = "Center",
            TextStrokeTransparency = 1,
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.fromScale(0.8, 0.1),
            FontFace = Font.fromName("GothamBold", Enum.FontWeight.Bold),
            TextColor3 = ColorUtil.WHITE
        })
    };
    local _ = #v18;
    local v19 = u2.entries(InfectedVariantMeta);

    local function _(p20, p21) -- Line: 91
        -- upvalues: u3 (ref), InfectedClassSelectButton (ref)
        return u3.createElement(InfectedClassSelectButton, {
            VariantType = p20[1],
            Metadata = p20[2],
            LayoutOrder = p21
        });
    end;

    local v22 = table.create(#v19);

    for i, v in v19 do
        v22[i] = u3.createElement(InfectedClassSelectButton, {
            VariantType = v[1],
            Metadata = v[2],
            LayoutOrder = i - 1
        });
    end;

    local v23 = {
        LayoutOrder = 2,
        Size = UDim2.fromScale(1, 0.8)
    };
    local v24 = { u3.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Center",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.03, 0)
        }) };
    local v25 = #v24;

    for i, v in v22 do
        v24[v25 + i] = v;
    end;

    v18.SelectionButons = u3.createElement(Empty, v23, v24);
    v12[v13 + 2] = u3.createElement(WidgetComponent, v17, v18);
    v10[u6.AppId] = u3.createElement("Frame", v11, v12);
    v9[#v9 + 1] = u3.createElement(SlideIn, {}, v10);

    return u3.createFragment({
        InfectedClassSelectionGUI = u3.createElement("ScreenGui", v8, v9)
    });
end);

return {
    InfectedClassSelection = v5.connect(function(p27, p28) -- Line: 132
        local v29 = {};

        for i, v in p28 do
            v29[i] = v;
        end;

        return v29;
    end)(v26)
};