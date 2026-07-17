-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local UserInputService = v6.UserInputService;
local Workspace = v6.Workspace;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local AutoCompleteSearchbar = RuntimeLib.import(script, script.Parent.Parent, "auto-complete-searchbar").AutoCompleteSearchbar;
local v64 = v4.new(u3)(function(u7, p8) -- Line: 18
    -- upvalues: u2 (copy), Workspace (copy), KnitClient (copy), UserInputService (copy), DeviceUtil (copy), Theme (copy), u3 (copy), Empty (copy), BedwarsImageId (copy), AutoCompleteSearchbar (copy), ColorUtil (copy)
    local useState = p8.useState;
    local useEffect = p8.useEffect;
    local u9, u10 = useState({});
    local u11, u12 = useState(0);
    local u13, u14 = useState(0);
    local u15 = u2.new();
    local u16 = nil;
    local CurrentCamera = Workspace.CurrentCamera;

    if CurrentCamera ~= nil then
        CurrentCamera = CurrentCamera.ViewportSize.Y;
    end;

    local u17 = CurrentCamera == nil and 1500 or CurrentCamera;

    local function _(p18) -- Line: 35
        -- upvalues: KnitClient (ref), u7 (copy)
        KnitClient.Controllers.AutoCompleteDropdownController:closeAutoCompleteDropdownMenu();
        u7.OnSelect(p18);
    end;

    useEffect(function() -- Line: 39
        -- upvalues: u15 (copy), UserInputService (ref), u12 (copy), u9 (copy), u11 (copy)
        u15:GiveTask(UserInputService.InputBegan:Connect(function(p19) -- Line: 40
            -- upvalues: u12 (ref), u9 (ref), u11 (ref)
            if p19.KeyCode == Enum.KeyCode.Down then
                u12((math.min(#u9 - 1, u11 + 1)));
            end;

            if p19.KeyCode == Enum.KeyCode.Up then
                u12((math.max(0, u11 - 1)));
            end;
        end));

        return function() -- Line: 48
            -- upvalues: u15 (ref)
            u15:DoCleaning();
        end;
    end);
    local v20 = {
        DisplayOrder = 30,
        ResetOnSpawn = false,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    };
    local v21 = {};
    local v22 = {
        BackgroundTransparency = 1,
        ImageTransparency = 1,
        Modal = true,
        Size = UDim2.fromScale(1, 1)
    };
    local v23 = {};
    local v24 = #v23;
    local AdditionalElements = u7.AdditionalElements;

    if AdditionalElements then
        v23[v24 + 1] = AdditionalElements;
    end;

    local v25 = {
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        BackgroundColor3 = Theme.backgroundPrimary,
        Size = UDim2.fromScale(0.3363119415109667, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Position = UDim2.fromScale(0.5, 0.25),
        AnchorPoint = Vector2.new(0.5, 0)
    };
    local v26 = {
        u3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 5)
        }),
        u3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Vertical,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0, 12 * (u17 / 1537))
        }),
        u3.createElement(Empty, {
            LayoutOrder = 0
        }),
        u3.createElement(Empty, {
            LayoutOrder = 10000
        })
    };
    local v27 = #v26;
    local v28 = {
        LayoutOrder = 1,
        Transparency = 0.5,
        BorderSizePixel = 0,
        BackgroundColor3 = Theme.backgroundSecondary,
        Size = UDim2.new(0.9830917874396136, 0, 0, 0.06506180871828236 * u17)
    };
    local v29 = {
        u3.createElement("UICorner", {
            CornerRadius = UDim.new(0.25, 0)
        }),
        u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            Padding = UDim.new(0.02, 0)
        }),
        u3.createElement(Empty, {
            LayoutOrder = 0
        }),
        u3.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            ImageTransparency = 0.5,
            LayoutOrder = 1,
            Image = BedwarsImageId.SEARCH_SOLID,
            Size = UDim2.fromScale(0.08108108108108109, 0.66)
        }, { u3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) })
    };
    local v30 = #v29;
    local v31 = {
        LayoutOrder = 2,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(0.773955773955774, 0.8)
    };
    local v32 = {};
    local v33 = {
        BackgroundTransparency = 1,
        HideSearchIcon = true,
        AutoFocus = true
    };
    local v34;

    if #u9 > 0 then
        v34 = u9[u11 + 1];
    else
        v34 = nil;
    end;

    v33.PredictionTarget = v34;
    v33.Size = UDim2.new(1, 0, 1, 0);
    v33.Position = UDim2.fromScale(0.5, 0.5);
    v33.AnchorPoint = Vector2.new(0.5, 0.5);
    local Items = u7.Items;

    local function _(p35) -- Line: 152
        -- upvalues: u7 (copy)
        local v36 = u7.DescribeItem(p35);
        local v37 = {
            key = p35
        };

        if v36 ~= nil then
            v36 = v36.aliases;
        end;

        v37.aliases = v36;

        return v37;
    end;

    local v38 = table.create(#Items);

    for i, v in Items do
        local _ = i - 1;
        local v39 = u7.DescribeItem(v);
        local v40 = {
            key = v
        };

        if v39 ~= nil then
            v39 = v39.aliases;
        end;

        v40.aliases = v39;
        v38[i] = v40;
    end;

    v33.Items = v38;
    v33.InputText = "";

    function v33.OnTextChange(p41, p42) -- Line: 173
        -- upvalues: u10 (copy), u12 (copy), u14 (copy)
        u10(p42);
        u12(0);
        u14(#p41);
    end;

    v33.PlaceHolderText = "Name";

    function v33.OnFocused() -- Line: 179
        -- upvalues: u16 (ref)
        local v43 = u16;

        if v43 ~= nil then
            v43:Disconnect();
        end;
    end;

    function v33.OnFocusLost(p44, u45) -- Line: 185
        -- upvalues: u13 (copy), KnitClient (ref), u7 (copy), u16 (ref), UserInputService (ref), u15 (copy), u9 (copy), u11 (copy)
        if u13 == 0 then
            KnitClient.Controllers.AutoCompleteDropdownController:closeAutoCompleteDropdownMenu();
            u7.OnSelect(nil);
        end;

        if not p44 then
            if u16 and u16.Connected then
                return nil;
            end;

            local u46 = false;
            u16 = UserInputService.InputBegan:Connect(function(p47) -- Line: 194
                -- upvalues: u46 (ref), KnitClient (ref), u7 (ref), u16 (ref)
                if not u46 then
                    u46 = true;

                    return nil;
                end;

                if p47.KeyCode == Enum.KeyCode.KeypadEnter or p47.UserInputType == Enum.UserInputType.MouseButton1 then
                    KnitClient.Controllers.AutoCompleteDropdownController:closeAutoCompleteDropdownMenu();
                    u7.OnSelect(nil);
                    local v48 = u16;

                    if v48 ~= nil then
                        v48:Disconnect();
                    end;
                end;
            end);
            u15:GiveTask(u16);

            return nil;
        end;

        if u13 > 0 and #u9 > 0 then
            local v49 = u9[math.min(#u9 - 1, u11) + 1];
            KnitClient.Controllers.AutoCompleteDropdownController:closeAutoCompleteDropdownMenu();
            u7.OnSelect(v49);
        end;

        task.delay(0, function() -- Line: 213
            -- upvalues: u45 (copy)
            local v50 = u45;

            if v50 ~= nil then
                v50:CaptureFocus();
            end;
        end);
    end;

    v32[#v32 + 1] = u3.createElement(AutoCompleteSearchbar, v33);
    v29[v30 + 1] = u3.createElement("Frame", v31, v32);
    local v51;

    if #u9 > 0 then
        v51 = u11 >= 0;
    else
        v51 = false;
    end;

    if v51 then
        local v52 = {};
        local v53;

        if u11 < #u9 then
            v53 = u7.DescribeItem(u9[u11 + 1]);

            if v53 ~= nil then
                v53 = v53.image;
            end;
        else
            v53 = nil;
        end;

        v52.Image = v53;
        v52.BackgroundTransparency = 1;
        v52.LayoutOrder = 3;
        v52.Size = UDim2.fromScale(0.08108108108108109, 0.66);
        v51 = u3.createElement("ImageLabel", v52, { u3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
    end;

    if v51 then
        v29[v30 + 2] = v51;
    end;

    v26.Searchbar = u3.createElement("Frame", v28, v29);

    local function _(p54, p55) -- Line: 249
        return p55 <= 15;
    end;

    local v56 = 0;
    local v57 = {};

    for i, v in u9 do
        if i - 1 <= 15 == true then
            v56 = v56 + 1;
            v57[v56] = v;
        end;
    end;

    local function v62(p58, u59) -- Line: 262
        -- upvalues: u7 (copy), u3 (ref), u11 (copy), ColorUtil (ref), u17 (copy), u9 (copy), KnitClient (ref)
        local v60 = u7.DescribeItem(p58);

        if not v60 then
            return u3.createFragment();
        end;

        return u3.createFragment({
            DropdownElement = u3.createElement("Frame", {
                LayoutOrder = 2 + u59,
                BackgroundColor3 = ColorUtil.hexColor(848127),
                BackgroundTransparency = u59 == u11 and 0.8 or 1,
                Size = UDim2.new(0.9830917874396136, 0, 0, 0.048796356538711776 * u17)
            }, { u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0.25, 0)
                }), u3.createElement("ImageButton", {
                    Size = UDim2.fromScale(1, 1),
                    ImageTransparency = 1,
                    BackgroundTransparency = 1,

                    [u3.Event.Activated] = function() -- Line: 282
                        -- upvalues: u9 (ref), u59 (copy), KnitClient (ref), u7 (ref)
                        local v61 = u9[u59 + 1];
                        KnitClient.Controllers.AutoCompleteDropdownController:closeAutoCompleteDropdownMenu();
                        u7.OnSelect(v61);
                    end
                }, { u3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        HorizontalAlignment = Enum.HorizontalAlignment.Left,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        Padding = UDim.new(0.03, 0)
                    }), u3.createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Image = v60.image,
                        Size = UDim2.fromScale(0.08108108108108109, 0.9538461538461539)
                    }, { u3.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1
                        }) }), u3.createElement("TextLabel", {
                        LayoutOrder = 2,
                        BackgroundTransparency = 1,
                        TextScaled = true,
                        Text = v60.displayName,
                        Size = UDim2.fromScale(0.8464373464373465, 0.6153846153846154),
                        TextColor3 = ColorUtil.WHITE,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        FontFace = Font.new("Roboto")
                    }) }) })
        });
    end;

    local v63 = table.create(#v57);

    for i, v in v57 do
        v63[i] = v62(v, i - 1, v57);
    end;

    for i, v in v63 do
        v26[v27 + i] = v;
    end;

    v23[#v23 + 1] = u3.createElement("Frame", v25, v26);
    v21[#v21 + 1] = u3.createElement("ImageButton", v22, v23);

    return u3.createElement("ScreenGui", v20, v21);
end);

return {
    AutoCompleteDropdown = v5.connect(function(p65, p66) -- Line: 331
        local v67 = {};

        for i, v in p66 do
            v67[i] = v;
        end;

        return v67;
    end)(v64)
};