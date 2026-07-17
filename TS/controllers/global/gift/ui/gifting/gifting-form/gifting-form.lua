-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local DividerComponent = v1.DividerComponent;
local ImageId = v1.ImageId;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local v4 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar");
local AutoCompleteSearchbar = v4.AutoCompleteSearchbar;
local SearchbarShowImageFunc = v4.SearchbarShowImageFunc;
local GiftMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-meta").GiftMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local MarketplaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "marketplace-util").MarketplaceUtil;
local GiftingMessageInput = RuntimeLib.import(script, script.Parent, "gifting-message-input").GiftingMessageInput;
local u5 = default.Client:GetNamespace("Gift");

local function getUserId(u6) -- Line: 23
    -- upvalues: RuntimeLib (copy), Players (copy)
    local v8, v9 = RuntimeLib.try(function() -- Line: 24
        -- upvalues: RuntimeLib (ref), Players (ref), u6 (copy)
        return RuntimeLib.TRY_RETURN, { Players:GetUserIdFromNameAsync(u6) };
    end, function(p7) -- Line: 26
        -- upvalues: RuntimeLib (ref)
        warn(p7);

        return RuntimeLib.TRY_RETURN, { nil };
    end);

    if v8 then
        return unpack(v9);
    end;
end;

return {
    GiftingForm = v3.new(u2)(function(u10, p11) -- Line: 34
        -- upvalues: u2 (copy), GiftingMessageInput (copy), GiftMeta (copy), u5 (copy), RuntimeLib (copy), Players (copy), SoundManager (copy), GameSound (copy), DeviceUtil (copy), MarketplaceUtil (copy), ColorUtil (copy), DividerComponent (copy), Theme (copy), SearchbarShowImageFunc (copy), AutoCompleteSearchbar (copy), ButtonComponent (copy), ImageId (copy)
        local useState = p11.useState;
        local useEffect = p11.useEffect;
        local useMemo = p11.useMemo;
        local v12, u13 = useState("");
        local v14, u15 = useState("");
        local v16, u17 = useState(0);
        local u18, u19 = useState(u10.SelectedUser);
        local u20, u21 = useState("");
        local v22 = useMemo(function() -- Line: 45
            -- upvalues: u2 (ref), GiftingMessageInput (ref), u21 (copy)
            return u2.createElement(GiftingMessageInput, {
                LayoutOrder = 4,
                Size = UDim2.fromScale(1, 0.35),
                SetMessage = u21
            });
        end, {});
        local u23 = GiftMeta[u10.GiftType];

        local function u31(p24, p25, u26) -- Line: 53
            -- upvalues: u10 (copy), u19 (copy)
            local v27;

            if u26 == nil then
                v27 = u26;
            else
                v27 = u26.item;
            end;

            if v27 then
                v27 = u26.exactMatch;
            end;

            if not v27 then
                if p25 then
                    local v28 = {};

                    if p25 ~= nil then
                        p25 = p25.Text;
                    end;

                    v28.name = p25;
                    u19(v28);
                end;

                return;
            end;

            local function _(p29) -- Line: 64
                -- upvalues: u26 (copy)
                local item = u26.item;

                if item ~= nil then
                    item = item.key;
                end;

                return p29.name == item;
            end;

            local v30 = nil;

            for i, v in u10.Players do
                local _ = i - 1;
                local item = u26.item;

                if item ~= nil then
                    item = item.key;
                end;

                if v.name == item == true then
                    v30 = v;
                    break;
                end;
            end;

            u19(v30);
        end;

        local function _() -- Line: 94
            -- upvalues: u18 (copy), u5 (ref), RuntimeLib (ref), Players (ref), SoundManager (ref), GameSound (ref), u13 (copy), u15 (copy), u20 (copy), u10 (copy), u23 (copy)
            if not u18 then
                return nil;
            end;

            u5:WaitFor("SendGift"):andThen(function(p32) -- Line: 99
                -- upvalues: u18 (ref), RuntimeLib (ref), Players (ref), SoundManager (ref), GameSound (ref), u13 (ref), u15 (ref), u20 (ref), u10 (ref), u23 (ref)
                local userId = u18.userId;

                if userId == nil then
                    local name = u18.name;
                    local v34, v35 = RuntimeLib.try(function() -- Line: 24
                        -- upvalues: RuntimeLib (ref), Players (ref), name (copy)
                        return RuntimeLib.TRY_RETURN, { Players:GetUserIdFromNameAsync(name) };
                    end, function(p33) -- Line: 26
                        -- upvalues: RuntimeLib (ref)
                        warn(p33);

                        return RuntimeLib.TRY_RETURN, { nil };
                    end);

                    if v34 then
                        userId = unpack(v35);
                    else
                        userId = nil;
                    end;
                end;

                if userId == nil then
                    SoundManager:playSound(GameSound.ERROR_NOTIFICATION);
                    u13("");
                    u15("Could not find user ID for <font color=\"#FFFFFF\"><b>" .. u18.name .. "</b></font>. Please confirm the username is correct or try again later.");

                    return nil;
                end;

                local v36 = p32:CallServer({
                    username = u18.name,
                    userId = userId,
                    message = u20,
                    giftType = u10.GiftType
                });
                local errorMessage = v36.errorMessage;

                if v36.success then
                    u15("");
                    u13("Confirm the purchase to gift the <font color=\"#FFFFFF\"><b>" .. u23.name .. "</b></font> to <font color=\"#FFFFFF\"><b>" .. u18.name .. "</b></font>");
                end;

                if errorMessage ~= "" and errorMessage then
                    SoundManager:playSound(GameSound.ERROR_NOTIFICATION);
                    u13("");
                    u15(errorMessage);
                end;
            end);
        end;

        useEffect(function() -- Line: 133
            -- upvalues: u19 (copy), u10 (copy)
            u19(u10.SelectedUser);
        end, { u10.SelectedUser });
        useEffect(function() -- Line: 136
            -- upvalues: DeviceUtil (ref), RuntimeLib (ref), Players (ref), u5 (ref), SoundManager (ref), GameSound (ref), u15 (copy), u13 (copy), MarketplaceUtil (ref), u23 (copy), u17 (copy)
            if DeviceUtil.isHoarceKat() then
                return nil;
            end;

            local function _(u37) -- Line: 140
                -- upvalues: RuntimeLib (ref), Players (ref)
                return RuntimeLib.Promise.defer(function(p38, p39) -- Line: 141
                    -- upvalues: Players (ref), u37 (copy)
                    p38(Players:GetNameFromUserIdAsync(u37));
                end);
            end;

            local u45 = u5:WaitFor("GiftSent"):andThen(function(p40) -- Line: 146
                -- upvalues: RuntimeLib (ref), Players (ref), SoundManager (ref), GameSound (ref), u15 (ref), u13 (ref)
                return p40:Connect(function(u41) -- Line: 147
                    -- upvalues: RuntimeLib (ref), Players (ref), SoundManager (ref), GameSound (ref), u15 (ref), u13 (ref)
                    local giftedPlayerUserId = u41.giftedPlayerUserId;
                    RuntimeLib.Promise.defer(function(p42, p43) -- Line: 141
                        -- upvalues: Players (ref), giftedPlayerUserId (copy)
                        p42(Players:GetNameFromUserIdAsync(giftedPlayerUserId));
                    end):andThen(function(p44) -- Line: 149
                        -- upvalues: SoundManager (ref), GameSound (ref), u15 (ref), u13 (ref), u41 (copy)
                        SoundManager:playSound(GameSound.BEDWARS_UPGRADE_SUCCESS);
                        u15("");
                        u13("Your gift of the <font color=\"#FFFFFF\"><b>" .. u41.gift.name .. "</b></font> has been sent to <font color=\"#FFFFFF\"><b>" .. p44 .. "</b></font>!");
                    end);
                end);
            end);
            MarketplaceUtil.getDevProductInfoAsync(u23.devProductId):andThen(function(p46) -- Line: 160
                -- upvalues: u17 (ref)
                local v47;

                if p46 == nil then
                    v47 = p46;
                else
                    v47 = p46.PriceInRobux;
                end;

                if v47 == nil then
                    return nil;
                end;

                u17(p46.PriceInRobux);
            end):catch(function(p48) -- Line: 170
                -- upvalues: u23 (ref)
                print("[GIFT FORM] Could not retrieve product info for ", u23.name, u23.devProductId);
            end);

            return function() -- Line: 173
                -- upvalues: u45 (copy)
                u45:andThen(function(p49) -- Line: 174
                    p49:Disconnect();
                end);
            end;
        end, {});
        local v50 = {
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = u10.Size
        };
        local v51 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 14)
            }) };
        local v52 = #v51;
        local v53 = {
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.13)
        };
        local v54 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 10)
            }) };
        local v55 = #v54;
        local v56;

        if u23.imageId == nil then
            v56 = false;
        else
            v56 = u2.createFragment({
                GiftImage = u2.createElement("ImageLabel", {
                    SizeConstraint = "RelativeXY",
                    ScaleType = "Fit",
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.2, 1),
                    Image = u23.imageId
                })
            });
        end;

        if v56 then
            v54[v55 + 1] = v56;
        end;

        local v57 = #v54;
        local v58 = u10.CustomImage and u2.createFragment({
            GiftImageCustom = u2.createElement("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.2, 1)
            }, { u10.CustomImage })
        });

        if v58 then
            v54[v57 + 1] = v58;
        end;

        v54[#v54 + 1] = u2.createElement("Frame", {
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.fromScale(0.75, 0.9)
        }, { u2.createElement("TextLabel", {
                TextSize = 24,
                BackgroundTransparency = 1,
                RichText = true,
                Text = "<b>" .. u23.name .. "</b>",
                AnchorPoint = Vector2.new(0, 0),
                Position = UDim2.fromScale(0, 0),
                Size = UDim2.new(0, 0, 0, 19),
                AutomaticSize = Enum.AutomaticSize.X,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
                TextColor3 = ColorUtil.WHITE,
                Font = Enum.Font.Roboto
            }), u2.createElement("TextLabel", {
                TextTransparency = 0.5,
                TextSize = 21,
                BackgroundTransparency = 1,
                Text = tostring(v16) .. " Robux",
                AnchorPoint = Vector2.new(0, 1),
                Position = UDim2.fromScale(0, 1),
                Size = UDim2.new(0, 0, 0, 16),
                AutomaticSize = Enum.AutomaticSize.X,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Bottom,
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
            }) });
        v51.GiftingItemHeader = u2.createElement("Frame", v53, v54);
        v51[v52 + 1] = u2.createElement(DividerComponent, {
            Margin = 0,
            Thickness = 1.5,
            LayoutOrder = 2
        });
        v51[v52 + 2] = u2.createElement("Frame", {
            BackgroundTransparency = 1,
            LayoutOrder = 3,
            Size = UDim2.fromScale(1, 0.15)
        }, { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 12)
            }), u2.createElement("TextLabel", {
                Text = "Recipient Username",
                TextTransparency = 0.3,
                TextSize = 20,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 14),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
                TextColor3 = ColorUtil.WHITE,
                Font = Enum.Font.Roboto
            }), u2.createElement("Frame", {
                BackgroundTransparency = 0,
                BorderSizePixel = 0,
                LayoutOrder = 1,
                Size = UDim2.new(1, 0, 1, -26),
                BackgroundColor3 = Theme.backgroundTertiary
            }, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 5)
                }), useMemo(function() -- Line: 308
                    -- upvalues: u10 (copy), u31 (copy), SearchbarShowImageFunc (ref), u2 (ref), AutoCompleteSearchbar (ref)
                    local Players2 = u10.Players;

                    local function _(p59) -- Line: 311
                        return {
                            key = p59.name,
                            aliases = { p59.name }
                        };
                    end;

                    local v60 = table.create(#Players2);
                    local v61 = {};

                    for i, v in Players2 do
                        local _ = i - 1;
                        v60[i] = {
                            key = v.name,
                            aliases = { v.name }
                        };
                    end;

                    v61.Items = v60;
                    v61.Size = UDim2.new(1, 0, 1, 0);
                    v61.Position = UDim2.fromScale(0, 0.5);
                    v61.AnchorPoint = Vector2.new(0, 0.5);
                    v61.BackgroundTransparency = 1;
                    v61.InputText = not u10.SelectedUser and "" or u10.SelectedUser.name;
                    v61.PlaceHolderText = "Username";
                    v61.LayoutOrder = 2;
                    v61.AutoLocalize = false;

                    function v61.OnTextChange() -- Line: 332
                    end;

                    v61.OnFocusLost = u31;
                    v61.ShowImage = SearchbarShowImageFunc.ROBLOX_AVATAR;

                    return u2.createElement(AutoCompleteSearchbar, v61);
                end, { u10.SelectedUser }) }) });
        v51[v52 + 3] = v22;
        local v62 = #v51;
        v51.FormSubmit = u2.createElement(ButtonComponent, {
            TextSize = 18,
            LayoutOrder = 5,
            Text = "Gift " .. u23.name,

            OnClick = function() -- Line: 343, Name: OnClick
                -- upvalues: u18 (copy), u5 (ref), RuntimeLib (ref), Players (ref), SoundManager (ref), GameSound (ref), u13 (copy), u15 (copy), u20 (copy), u10 (copy), u23 (copy)
                if not u18 then
                    return;
                end;

                u5:WaitFor("SendGift"):andThen(function(p63) -- Line: 99
                    -- upvalues: u18 (ref), RuntimeLib (ref), Players (ref), SoundManager (ref), GameSound (ref), u13 (ref), u15 (ref), u20 (ref), u10 (ref), u23 (ref)
                    local userId = u18.userId;

                    if userId == nil then
                        local name = u18.name;
                        local v65, v66 = RuntimeLib.try(function() -- Line: 24
                            -- upvalues: RuntimeLib (ref), Players (ref), name (copy)
                            return RuntimeLib.TRY_RETURN, { Players:GetUserIdFromNameAsync(name) };
                        end, function(p64) -- Line: 26
                            -- upvalues: RuntimeLib (ref)
                            warn(p64);

                            return RuntimeLib.TRY_RETURN, { nil };
                        end);

                        if v65 then
                            userId = unpack(v66);
                        else
                            userId = nil;
                        end;
                    end;

                    if userId == nil then
                        SoundManager:playSound(GameSound.ERROR_NOTIFICATION);
                        u13("");
                        u15("Could not find user ID for <font color=\"#FFFFFF\"><b>" .. u18.name .. "</b></font>. Please confirm the username is correct or try again later.");

                        return nil;
                    end;

                    local v67 = p63:CallServer({
                        username = u18.name,
                        userId = userId,
                        message = u20,
                        giftType = u10.GiftType
                    });
                    local errorMessage = v67.errorMessage;

                    if v67.success then
                        u15("");
                        u13("Confirm the purchase to gift the <font color=\"#FFFFFF\"><b>" .. u23.name .. "</b></font> to <font color=\"#FFFFFF\"><b>" .. u18.name .. "</b></font>");
                    end;

                    if errorMessage ~= "" and errorMessage then
                        SoundManager:playSound(GameSound.ERROR_NOTIFICATION);
                        u13("");
                        u15(errorMessage);
                    end;
                end);
            end,

            Size = UDim2.new(1, 0, 0, 32)
        });
        local v68;

        if v14 == "" then
            v68 = false;
        else
            v68 = u2.createFragment({
                ErrorMsgWrapper = u2.createElement("Frame", {
                    BackgroundTransparency = 1,
                    LayoutOrder = 6,
                    Size = UDim2.fromScale(1, 0.15)
                }, {
                    u2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        VerticalAlignment = Enum.VerticalAlignment.Top,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Padding = UDim.new(0, 16)
                    }),
                    ErrorIcon = u2.createElement("ImageLabel", {
                        ScaleType = "Fit",
                        SizeConstraint = "RelativeYY",
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(0.6, 0.6),
                        Image = ImageId.EXCLAMATION_TRIANGLE,
                        ImageColor3 = Color3.fromRGB(255, 153, 0)
                    }),
                    ErrorMsg = u2.createElement("TextLabel", {
                        TextWrapped = true,
                        TextScaled = true,
                        RichText = true,
                        BackgroundTransparency = 1,
                        LayoutOrder = 2,
                        AutoLocalize = false,
                        Text = v14,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        Size = UDim2.new(0.8, 0, 0, 40),
                        TextColor3 = Color3.fromRGB(255, 105, 105),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        Font = Enum.Font.Roboto
                    })
                })
            });
        end;

        if v68 then
            v51[v62 + 1] = v68;
        end;

        local v69 = #v51;
        local v70;

        if v12 == "" then
            v70 = false;
        else
            v70 = u2.createFragment({
                SuccessMsgWrapper = u2.createElement("Frame", {
                    BackgroundTransparency = 1,
                    LayoutOrder = 6,
                    Size = UDim2.fromScale(1, 0.15)
                }, {
                    u2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        VerticalAlignment = Enum.VerticalAlignment.Top,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Padding = UDim.new(0, 16)
                    }),
                    SuccessIcon = u2.createElement("ImageLabel", {
                        ScaleType = "Fit",
                        SizeConstraint = "RelativeYY",
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(0.6, 0.6),
                        Image = ImageId.GIFTS_SOLID,
                        ImageColor3 = Color3.fromRGB(255, 255, 255)
                    }),
                    SuccessMsg = u2.createElement("TextLabel", {
                        TextScaled = true,
                        RichText = true,
                        BackgroundTransparency = 1,
                        LayoutOrder = 2,
                        AutoLocalize = false,
                        Text = v12,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        Size = UDim2.new(0.8, 0, 0, 40),
                        TextColor3 = Theme.backgroundSuccess,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        Font = Enum.Font.Roboto
                    })
                })
            });
        end;

        if v70 then
            v51[v69 + 1] = v70;
        end;

        return u2.createElement("Frame", v50, v51);
    end)
};