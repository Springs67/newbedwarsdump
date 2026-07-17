-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local DarkBackground = v1.DarkBackground;
local Empty = v1.Empty;
local SlideIn = v1.SlideIn;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local AutoCompleteSearchbar = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v47 = v3.new(u2)(function(u5, p6) -- Line: 14
    -- upvalues: u2 (copy), DarkBackground (copy), Theme (copy), AutoCompleteSearchbar (copy), AnimationUtil (copy), Players (copy), Empty (copy), SlideIn (copy)
    local useState = p6.useState;
    local useEffect = p6.useEffect;
    local v7, u8 = useState({});
    local u9, u10 = useState("");
    local v11 = u2.createRef();
    local u12 = "";
    useEffect(function() -- Line: 21
        -- upvalues: u9 (copy), u8 (copy), u5 (copy)
        if u9 == "" then
            u8(u5.AnimationMap);
        end;
    end, {});

    local function v14(p13) -- Line: 53
        -- upvalues: u12 (ref)
        u12 = p13.Text;
    end;

    local v15 = { u2.createElement(DarkBackground, {
            BackgroundTransparency = 1,
            AppId = u5.AppId,
            BackgroundColor = Theme.backgroundSecondary
        }) };
    local v16 = {};
    local _ = #v16;
    local v17 = {
        Size = UDim2.fromScale(1, 0.8),
        Position = UDim2.fromScale(0, 0.5),
        AnchorPoint = Vector2.new(0, 0.5)
    };
    local v18 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            Padding = UDim.new(0, 1),
            SortOrder = Enum.SortOrder.LayoutOrder
        }) };
    local v19 = #v18;
    local v20 = {
        LayoutOrder = 10,
        Size = UDim2.fromScale(0.3, 0.05)
    };
    local AnimationMap = u5.AnimationMap;

    local function _(p21, p22) -- Line: 91
        table.insert(p21, {
            key = p22.Key
        });

        return p21;
    end;

    local v23 = {};

    local function u36(u24, p25) -- Line: 26
        -- upvalues: u5 (copy)
        local v26 = {};

        if u24 == "" then
            return v26;
        end;

        local function _(p27) -- Line: 31
            -- upvalues: u24 (copy)
            local v28 = string.lower(p27.Key);
            local v29 = string.lower(u24);
            local v30 = string.find(v28, v29);

            if v30 ~= 0 and (v30 == v30 and v30) then
                return true;
            end;
        end;

        local v31 = 0;
        local v32 = {};

        for i, v in u5.AnimationMap do
            local _ = i - 1;
            local v33 = string.lower(v.Key);
            local v34 = string.lower(u24);
            local v35 = string.find(v33, v34);

            if (v35 ~= 0 and (v35 == v35 and v35) and true or nil) == true then
                v31 = v31 + 1;
                v32[v31] = v;
            end;
        end;

        return v32;
    end;

    local v37 = {
        DisplayOrder = 20,
        IgnoreGuiInset = true,
        ResetOnSpawn = false
    };

    for i = 1, #AnimationMap do
        local _ = i - 1;
        table.insert(v23, {
            key = AnimationMap[i].Key
        });
    end;

    v20.Items = v23;
    v20.InputText = "";

    function v20.OnTextChange(p38, p39) -- Line: 108
        -- upvalues: u10 (copy), u8 (copy), u36 (copy)
        u10(p38);
        u8((u36(p38, p39)));
    end;

    v20.PlaceHolderText = "Search Animations";
    v18[v19 + 1] = u2.createElement(AutoCompleteSearchbar, v20);
    v18[v19 + 2] = u2.createElement("Frame", {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        LayoutOrder = 20,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromScale(0.3, 0.05),
        BackgroundColor3 = Theme.backgroundPrimary
    }, { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            SortOrder = Enum.SortOrder.LayoutOrder
        }), u2.createElement("TextBox", {
            [u2.Ref] = v11,
            RichText = true,
            ClearTextOnFocus = false,
            TextEditable = true,
            Text = u12,
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.8, 1),
            TextSize = 12,
            BackgroundTransparency = 0.5,
            BackgroundColor3 = Color3.fromRGB(83, 83, 83),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            ClipsDescendants = true,
            [u2.Change.Text] = v14,
            LayoutOrder = 1
        }), u2.createElement("TextButton", {
            Text = "Play",
            BackgroundTransparency = 0,
            BackgroundColor3 = Theme.backgroundPrimary,
            Font = Enum.Font.Arial,
            TextXAlignment = Enum.TextXAlignment.Left,
            Size = UDim2.fromScale(0.19, 1),
            TextSize = 16,
            LayoutOrder = 2,
            BorderSizePixel = 0,
            TextColor3 = Color3.fromRGB(255, 255, 255),

            [u2.Event.MouseButton1Click] = function() -- Line: 156
                -- upvalues: AnimationUtil (ref), Players (ref), u12 (ref)
                AnimationUtil:playAnimation(Players.LocalPlayer, u12);
            end
        }) });

    local function v42(u40, p41) -- Line: 164
        -- upvalues: u2 (ref), Theme (ref), AnimationUtil (ref), Players (ref)
        return u2.createElement("TextButton", {
            Text = u40.Key,
            BackgroundTransparency = 0,
            BackgroundColor3 = Theme.backgroundPrimary,
            Font = Enum.Font.Arial,
            TextXAlignment = Enum.TextXAlignment.Left,
            Size = UDim2.fromScale(1, 0.05),
            TextSize = 18,
            LayoutOrder = p41,
            BorderSizePixel = 0,
            TextColor3 = Color3.fromRGB(255, 255, 255),

            [u2.Event.MouseButton1Click] = function() -- Line: 176
                -- upvalues: AnimationUtil (ref), Players (ref), u40 (copy)
                AnimationUtil:playAnimation(Players.LocalPlayer, u40.AssetId, {
                    looped = false
                });
            end
        });
    end;

    local v43 = table.create(#v7);

    for i, v in v7 do
        v43[i] = v42(v, i - 1, v7);
    end;

    local v44 = {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        ScrollBarThickness = 4,
        ScrollBarImageTransparency = 0.3,
        LayoutOrder = 30,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.3, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.XY,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
    };
    local v45 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            Padding = UDim.new(0, 1),
            SortOrder = Enum.SortOrder.LayoutOrder
        }) };
    local v46 = #v45;

    for i, v in v43 do
        v45[v46 + i] = v;
    end;

    v18[v19 + 3] = u2.createElement("ScrollingFrame", v44, v45);
    v16.Container = u2.createElement(Empty, v17, v18);
    v15[#v15 + 1] = u2.createElement(SlideIn, {}, v16);

    return u2.createFragment({
        AnimationTestScreenGUI = u2.createElement("ScreenGui", v37, v15)
    });
end);

return {
    AnimationTestApp = v4.connect(function(p48, p49) -- Line: 224
        local v50 = {};

        for i, v in p49 do
            v50[i] = v;
        end;

        return v50;
    end)(v47)
};