-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local ImageId = v1.ImageId;
local StringUtil = v1.StringUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils");
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v6 = {};
local u7 = setmetatable({}, {
    __index = v6
});
u7.ROBLOX_AVATAR = 0;
v6[0] = "ROBLOX_AVATAR";
u7.MANUAL = 1;
v6[1] = "MANUAL";

local function v83(u8, p9) -- Line: 25
    -- upvalues: u3 (copy), u7 (ref), OfflinePlayerUtil (copy), StringUtil (copy), u5 (copy), u2 (copy), Theme (copy), ColorUtil (copy), DeviceUtil (copy), ImageId (copy)
    local useState = p9.useState;
    local useEffect = p9.useEffect;
    local useValue = p9.useValue;
    local u10, u11 = useState("");
    local v12, u13 = useState("");
    local v14, u15 = useState("");
    local v16, u17 = useState(false);
    local v18 = {};

    for i, v in u8 do
        v18[i] = v;
    end;

    local MaxCharLength = v18.MaxCharLength;
    local u19 = MaxCharLength == nil and 20 or MaxCharLength;
    local u20 = useValue(u3.createRef());
    local u21 = useValue({});
    local u22 = useValue({});
    local u23 = useValue({});
    useEffect(function() -- Line: 47
        -- upvalues: u23 (copy), u22 (copy), u21 (copy), u8 (copy)
        table.clear(u23.value);
        table.clear(u22.value);
        table.clear(u21.value);

        for _, v in u8.Items do
            u23.value[v.key] = v;
            u22.value[v.key] = v.key;
            table.insert(u21.value, v.key);

            if v.aliases then
                for _, v2 in v.aliases do
                    u22.value[v2] = v.key;
                    table.insert(u21.value, v2);
                end;
            end;
        end;

        table.sort(u21.value);
    end, { u8.Items });
    useEffect(function() -- Line: 74
        -- upvalues: u8 (copy), u20 (copy)
        if not u8.AutoFocus then
            return nil;
        end;

        task.delay(0, function() -- Line: 78
            -- upvalues: u20 (ref)
            local v24 = u20.value:getValue();

            if v24 ~= nil then
                v24:CaptureFocus();
            end;
        end);
    end, {});

    local function u32(u25) -- Line: 86
        -- upvalues: u21 (copy), u22 (copy)
        local function _(p26) -- Line: 88
            -- upvalues: u25 (copy)
            local v27 = string.lower(p26);

            return string.sub(v27, 1, #u25) == string.lower(u25);
        end;

        local v28 = nil;

        for i, v in u21.value do
            local _ = i - 1;
            local v29 = string.lower(v);

            if string.sub(v29, 1, #u25) == string.lower(u25) == true then
                v28 = v;
                break;
            end;
        end;

        if v28 == "" or not v28 then
            return nil;
        end;

        local v30 = {};
        local v31 = u22.value[v28];

        if v31 == nil then
            v31 = v28;
        end;

        v30.itemKey = v31;
        v30.usedAlias = v28;

        return v30;
    end;

    local function _(p33) -- Line: 119
        -- upvalues: u23 (copy)
        return u23.value[p33];
    end;

    local u34 = nil;

    local function u42(p35, p36) -- Line: 125
        -- upvalues: u34 (ref), u11 (copy), u13 (copy), u8 (copy), u7 (ref), u32 (copy), u23 (copy), u15 (copy), u10 (copy), OfflinePlayerUtil (ref)
        local v37 = p35.Text .. string.sub(p36, #p35.Text + 1);
        u34(p36, p35);
        u11(p36);
        u13(v37);

        if u8.ShowImage == u7.MANUAL then
            local v38 = u32(p36);

            if v38 then
                local v39 = u23.value[v38.itemKey];
                local v40;

                if v39 == nil then
                    v40 = v39;
                else
                    v40 = v39.image;
                end;

                if v40 ~= "" and v40 then
                    u15(v39.image);
                end;
            end;
        elseif u8.ShowImage == u7.ROBLOX_AVATAR and u10 ~= p36 then
            OfflinePlayerUtil.loadUserAvatarFromName(p36):andThen(function(p41) -- Line: 149
                -- upvalues: u15 (ref)
                u15(p41);
            end);
        end;
    end;

    local function _() -- Line: 156
        -- upvalues: u11 (copy), u15 (copy), u13 (copy)
        u11("");
        u15("");
        u13("");
    end;

    local function v55(u43) -- Line: 161
        -- upvalues: u19 (ref), u32 (copy), u42 (copy), u11 (copy), u15 (copy), u13 (copy), StringUtil (ref), u21 (copy), u22 (copy), u8 (copy)
        if u19 < #u43.Text then
            u43.Text = string.sub(u43.Text, 0, 20);

            return nil;
        end;

        if #u43.Text > 0 then
            local v44 = u32(u43.Text);

            if v44 then
                u42(u43, v44.usedAlias);
            else
                u11("");
                u15("");
                u13("");
            end;

            StringUtil.fuzzySearch(u43.Text, u21.value):andThen(function(p45) -- Line: 176
                -- upvalues: u22 (ref), u8 (ref), u43 (copy)
                if p45 then
                    local v46 = 0;
                    local v47 = false;
                    local v48 = {};

                    while true do
                        if true then
                            if v47 then
                                v46 = v46 + 1;
                            else
                                v47 = true;
                            end;
                        end;

                        if v46 >= #p45 then
                            break;
                        end;

                        local v49 = p45[v46 + 1];
                        local v50 = u22.value[v49];
                        local v51;

                        if v50 == "" or not v50 then
                            v51 = v50;
                        else
                            v51 = v48[v50] ~= nil;
                        end;

                        if v51 == "" or not v51 then
                            local v52;

                            if v50 == "" or not v50 then
                                v52 = v50;
                            else
                                v52 = v50 ~= v49;
                            end;

                            if v52 ~= "" and v52 then
                                p45[v46 + 1] = v50;
                            end;

                            if v50 ~= nil then
                                v49 = v50;
                            end;

                            v48[v49] = true;
                        else
                            table.remove(p45, v46 + 1);
                            v46 = v46 - 1;
                        end;
                    end;

                    u8.OnTextChange(u43.Text, p45);
                end;
            end);

            return;
        end;

        u11("");
        u15("");
        u13("");
        local Text = u43.Text;
        local Items = u8.Items;

        local function _(p53) -- Line: 231
            return p53.key;
        end;

        local v54 = table.create(#Items);

        for i, v in Items do
            local _ = i - 1;
            v54[i] = v.key;
        end;

        u8.OnTextChange(Text, v54);
    end;

    u34 = function(p56, p57) -- Line: 244
        -- upvalues: u17 (copy)
        if string.lower(p57.Text) == string.lower(p56) then
            u17(true);

            return;
        end;

        u17(false);
    end;

    local function v63(u58, u59, p60) -- Line: 251
        -- upvalues: u20 (copy), u10 (copy), u11 (copy), u8 (copy), u7 (ref), OfflinePlayerUtil (ref), u15 (copy), u23 (copy), u17 (copy)
        if not u20.value:getValue() then
            return nil;
        end;

        if u59 and u10 ~= "" then
            u20.value:getValue().Text = u10;
            u11(u10);
        elseif u58.Text ~= "" and u8.ShowImage == u7.ROBLOX_AVATAR then
            OfflinePlayerUtil.loadUserAvatarFromName(u58.Text):andThen(function(p61) -- Line: 263
                -- upvalues: u15 (ref)
                u15(p61);
            end);
        end;

        task.spawn(function() -- Line: 269
            -- upvalues: u10 (ref), u23 (ref), u8 (ref), u59 (copy), u58 (copy), u20 (ref)
            local v62;

            if u10 == "" then
                v62 = nil;
            else
                v62 = u23.value[u10];
            end;

            local OnFocusLost = u8.OnFocusLost;

            if OnFocusLost ~= nil then
                OnFocusLost(u59, u58, {
                    item = v62,
                    exactMatch = string.lower(u20.value:getValue().Text) == string.lower(u10)
                });
            end;
        end);
        u17(true);
    end;

    useEffect(function() -- Line: 284
        -- upvalues: u20 (copy), u8 (copy), u11 (copy), u17 (copy)
        local Text = u20.value:getValue().Text;

        if u8.InputText ~= nil and Text ~= u8.InputText then
            u20.value:getValue().Text = u8.InputText;
            u11(u8.InputText);
            u17(true);
        end;
    end, { u8.InputText });
    useEffect(function() -- Line: 292
        -- upvalues: u8 (copy), u20 (copy), u5 (ref), u42 (copy), u15 (copy), u13 (copy)
        local PredictionTarget = u8.PredictionTarget;

        if PredictionTarget == "" or not PredictionTarget then
            return nil;
        end;

        local v64 = u20.value:getValue();

        if not v64 then
            return nil;
        end;

        if u5.startsWith(u8.PredictionTarget, v64.Text) then
            u42(v64, u8.PredictionTarget);

            return;
        end;

        u15("");
        u13("");
    end, { u8.PredictionTarget });
    u3.createRef();
    local v65 = {};

    for i, v in u8 do
        v65[i] = v;
    end;

    v65.MaxCharLength = nil;
    v65.Items = nil;
    v65.InputText = nil;
    v65.OnTextChange = nil;
    v65.ShowImage = nil;
    v65.PlaceHolderText = nil;
    v65.HideSearchIcon = nil;
    v65.PredictionTarget = nil;
    v65.OnFocusLost = nil;
    v65.OnFocused = nil;
    v65.AutoFocus = nil;
    v65.PlaceHolderColor3 = nil;
    v65.TextColor3 = nil;
    v65.CustomSearchIcon = nil;
    v65.BarColor = nil;
    v65.BarTransparency = nil;
    v65.CornerRadius = nil;
    v65[u3.Children] = nil;
    local v66;

    if u8[u3.Children] then
        v66 = u2.values(u8[u3.Children]);
    else
        v66 = nil;
    end;

    local v67 = {
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 1, -26),
        BackgroundColor3 = u8.BarColor or Theme.backgroundTertiary
    };
    local BarTransparency = u8.BarTransparency;
    v67.Transparency = BarTransparency == nil and 0 or BarTransparency;
    v67.LayoutOrder = 1;

    for i, v in v65 do
        v67[i] = v;
    end;

    if v66 ~= nil then
        local function _(p68) -- Line: 349
            return string.lower(p68.component) == "uipadding";
        end;

        v66 = nil;

        for i, v in v66 do
            local _ = i - 1;

            if string.lower(v.component) == "uipadding" == true then
                v66 = v;
                break;
            end;
        end;
    end;

    local v69 = not v66 and u3.createElement("UIPadding", {
        PaddingTop = UDim.new(0, 5),
        PaddingBottom = UDim.new(0, 5),
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10)
    });
    local v70 = { u3.createElement("UICorner", {
            CornerRadius = u8.CornerRadius or UDim.new(0, 5)
        }), u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8)
        }) };
    local v71 = #v70;

    if v69 then
        v70[v71 + 1] = v69;
    end;

    local v72 = #v70;
    local v73;

    if u8.ShowImage == nil then
        v73 = false;
    else
        local createFragment = u3.createFragment;
        local v74 = {};
        local createElement = u3.createElement;
        local v75 = {
            ScaleType = "Fit",
            SizeConstraint = "RelativeYY",
            BackgroundTransparency = 0,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 1),
            Image = v14,
            ImageTransparency = v16 and 0 or 0.6
        };
        local v76;

        if u8.BackgroundColor3 then
            v76 = ColorUtil.darken(u8.BackgroundColor3, 0.2);
        else
            v76 = Theme.interactionPrimary;
        end;

        v75.BackgroundColor3 = v76;
        v74.UserAvatar = createElement("ImageLabel", v75, { u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 5)
            }) });
        v73 = createFragment(v74);
    end;

    if v73 then
        v70[v72 + 1] = v73;
    end;

    local v77 = #v70;
    local v78 = u8.HideSearchIcon ~= true;

    if v78 then
        local v79 = {
            Size = UDim2.fromScale(1, DeviceUtil.isSmallScreen() and 0.85 or 0.75)
        };
        local CustomSearchIcon = u8.CustomSearchIcon;

        if CustomSearchIcon == nil then
            CustomSearchIcon = ImageId.SEARCH_SOLID;
        end;

        v79.Image = CustomSearchIcon;
        v79.ScaleType = "Fit";
        v79.SizeConstraint = "RelativeYY";
        v79.ImageTransparency = 0.1;
        v79.BackgroundTransparency = 1;
        v79.LayoutOrder = 2;
        v78 = u3.createElement("ImageLabel", v79);
    end;

    if v78 then
        v70[v77 + 1] = v78;
    end;

    local v80 = #v70;
    local v81 = {};
    local ShowImage = u8.ShowImage;
    v81.Size = UDim2.fromScale(0.95 - (u8.HideSearchIcon and -0.05 or 0) - ((ShowImage == 0 or (ShowImage ~= ShowImage or not ShowImage)) and 0 or -0.05), 1);
    v81.BackgroundTransparency = 1;
    v81.LayoutOrder = 3;
    v70[v80 + 1] = u3.createElement("Frame", v81, { u3.createElement("TextBox", {
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0, 0.5),
            Size = UDim2.fromScale(1, 1),
            Text = "",
            PlaceholderText = u8.PlaceHolderText,
            BackgroundTransparency = 1,
            BackgroundColor3 = ColorUtil.WHITE,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            PlaceholderColor3 = Color3.fromRGB(161, 161, 161),
            TextScaled = true,
            Font = Enum.Font.Roboto,
            ClearTextOnFocus = false,
            [u3.Ref] = u20.value,
            AutoLocalize = false,
            [u3.Change.Text] = v55,
            [u3.Event.FocusLost] = v63,
            [u3.Event.Focused] = u8.OnFocused
        }), u3.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            TextTransparency = 0.7,
            RichText = true,
            AutoLocalize = false,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0, 0.5),
            Size = UDim2.fromScale(1, 1),
            Text = v12,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
            Font = Enum.Font.Roboto,
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }) });
    local v82 = u8[u3.Children];

    if v82 then
        for i, v in v82 do
            if type(i) == "number" then
                v70[v80 + 1 + i] = v;
            else
                v70[i] = v;
            end;
        end;
    end;

    return u3.createFragment({
        AutoCompleteSearchbar = u3.createElement("Frame", v67, v70)
    });
end;

return {
    SearchbarShowImageFunc = u7,
    AutoCompleteSearchbar = v4.new(u3)(v83)
};