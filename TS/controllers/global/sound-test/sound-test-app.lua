-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DarkBackground = v1.DarkBackground;
local SlideIn = v1.SlideIn;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local AutoCompleteSearchbar = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v41 = v3.new(u2)(function(u5, p6) -- Line: 13
    -- upvalues: u2 (copy), DarkBackground (copy), Theme (copy), AutoCompleteSearchbar (copy), KnitClient (copy), SoundManager (copy), SlideIn (copy)
    local useState = p6.useState;
    local useEffect = p6.useEffect;
    local v7, u8 = useState({});
    local u9, u10 = useState("");
    useEffect(function() -- Line: 19
        -- upvalues: u9 (copy), u8 (copy), u5 (copy)
        if u9 == "" then
            u8(u5.SoundMap);
        end;
    end, {});
    local v11 = { u2.createElement(DarkBackground, {
            BackgroundTransparency = 1,
            AppId = u5.AppId,
            BackgroundColor = Theme.backgroundSecondary
        }) };
    local v12 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            Padding = UDim.new(0, 1),
            SortOrder = Enum.SortOrder.LayoutOrder
        }) };
    local v13 = #v12;
    local v14 = {
        LayoutOrder = 1,
        Size = UDim2.fromScale(0.8, 0.05)
    };
    local SoundMap = u5.SoundMap;

    local function _(p15, p16) -- Line: 79
        table.insert(p15, {
            key = p16.Key
        });

        return p15;
    end;

    local v17 = {};

    local function u30(u18, p19) -- Line: 24
        -- upvalues: u5 (copy)
        local v20 = {};

        if u18 == "" then
            return v20;
        end;

        local function _(p21) -- Line: 29
            -- upvalues: u18 (copy)
            local v22 = string.lower(p21.Key);
            local v23 = string.lower(u18);
            local v24 = string.find(v22, v23);

            if v24 ~= 0 and (v24 == v24 and v24) then
                return true;
            end;
        end;

        local v25 = 0;
        local v26 = {};

        for i, v in u5.SoundMap do
            local _ = i - 1;
            local v27 = string.lower(v.Key);
            local v28 = string.lower(u18);
            local v29 = string.find(v27, v28);

            if (v29 ~= 0 and (v29 == v29 and v29) and true or nil) == true then
                v25 = v25 + 1;
                v26[v25] = v;
            end;
        end;

        return v26;
    end;

    local v31 = {
        DisplayOrder = 20,
        IgnoreGuiInset = true,
        ResetOnSpawn = false
    };

    for i = 1, #SoundMap do
        local _ = i - 1;
        table.insert(v17, {
            key = SoundMap[i].Key
        });
    end;

    v14.Items = v17;
    v14.InputText = "";

    function v14.OnTextChange(p32, p33) -- Line: 96
        -- upvalues: u10 (copy), u8 (copy), u30 (copy)
        u10(p32);
        u8((u30(p32, p33)));
    end;

    v14.PlaceHolderText = "Search Sounds";
    v12[v13 + 1] = u2.createElement(AutoCompleteSearchbar, v14);

    local function v36(u34, p35) -- Line: 102
        -- upvalues: u2 (ref), Theme (ref), KnitClient (ref), SoundManager (ref)
        return u2.createElement("TextButton", {
            Text = u34.Key,
            BackgroundTransparency = 0,
            BackgroundColor3 = Theme.backgroundPrimary,
            Font = Enum.Font.Arial,
            TextXAlignment = Enum.TextXAlignment.Left,
            Size = UDim2.fromScale(1, 0.05),
            TextSize = 18,
            LayoutOrder = p35,
            BorderSizePixel = 0,
            TextColor3 = Color3.fromRGB(255, 255, 255),

            [u2.Event.MouseButton1Click] = function() -- Line: 114
                -- upvalues: KnitClient (ref), SoundManager (ref), u34 (copy)
                if KnitClient.Controllers.SoundTestController.playingSound then
                    KnitClient.Controllers.SoundTestController.playingSound:Stop();
                    KnitClient.Controllers.SoundTestController.playingSound:Destroy();
                end;

                KnitClient.Controllers.SoundTestController.playingSound = SoundManager:playSound(u34.AssetId);
            end
        });
    end;

    local v37 = table.create(#v7);

    for i, v in v7 do
        v37[i] = v36(v, i - 1, v7);
    end;

    local v38 = {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        ScrollBarThickness = 4,
        ScrollBarImageTransparency = 0.3,
        LayoutOrder = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.8, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.XY,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
    };
    local v39 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            Padding = UDim.new(0, 1),
            SortOrder = Enum.SortOrder.LayoutOrder
        }) };
    local v40 = #v39;

    for i, v in v37 do
        v39[v40 + i] = v;
    end;

    v12[v13 + 2] = u2.createElement("ScrollingFrame", v38, v39);
    v11[#v11 + 1] = u2.createElement(SlideIn, {}, v12);

    return u2.createFragment({
        SoundTestScreenGUI = u2.createElement("ScreenGui", v31, v11)
    });
end);

return {
    SoundTestApp = v4.connect(function(p42, p43) -- Line: 163
        local v44 = {};

        for i, v in p43 do
            v44[i] = v;
        end;

        return v44;
    end)(v41)
};