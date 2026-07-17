-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    GiftingRecipientInput = v2.new(u1)(function(u3, p4) -- Line: 10
        -- upvalues: u1 (copy), RuntimeLib (copy), Players (copy), ColorUtil (copy), Theme (copy)
        local useState = p4.useState;
        local useEffect = p4.useEffect;
        local u5, u6 = useState({
            user = nil,
            usernameFormatted = ""
        });
        local v7, u8 = useState("");
        local v9, u10 = useState(false);
        local u11 = u1.createRef();

        local function u16(u12) -- Line: 21
            -- upvalues: u3 (copy)
            local function _(p13) -- Line: 23
                -- upvalues: u12 (copy)
                local v14 = string.lower(p13.username);

                return string.sub(v14, 1, #u12) == string.lower(u12);
            end;

            for i, v in u3.Friends do
                local _ = i - 1;
                local v15 = string.lower(v.username);

                if string.sub(v15, 1, #u12) == string.lower(u12) == true then
                    return v;
                end;
            end;

            return nil;
        end;

        local u17 = nil;
        local u18 = nil;

        local function v25(p19) -- Line: 40
            -- upvalues: u6 (copy), u8 (copy), u16 (copy), u17 (ref), u5 (copy), u18 (ref), u3 (copy)
            if #p19.Text > 20 then
                p19.Text = string.sub(p19.Text, 0, 20);

                return nil;
            end;

            if #p19.Text == 0 then
                u6({
                    user = nil,
                    usernameFormatted = ""
                });
                u8("");

                return nil;
            end;

            local v20 = u16(p19.Text);

            if v20 then
                u17(v20.username, p19);
                local v21 = p19.Text .. string.sub(v20.username, #p19.Text + 1);
                local v22 = {};

                for i, v in u5 do
                    v22[i] = v;
                end;

                v22.user = {
                    username = v20.username,
                    userId = v20.userId
                };
                v22.usernameFormatted = v21;
                u6(v22);
                local user = u5.user;

                if user ~= nil then
                    user = user.userId;
                end;

                if user ~= v20.userId then
                    u18(v20.userId);
                end;
            else
                u6({
                    user = nil,
                    usernameFormatted = ""
                });
                u8("");
            end;

            local v23 = string.lower(p19.Text);
            local FriendsListUser = u3.FriendsListUser;

            if FriendsListUser ~= nil then
                FriendsListUser = string.lower(FriendsListUser.username);
            end;

            local FriendsListUser2 = u3.FriendsListUser;

            if FriendsListUser2 ~= nil then
                FriendsListUser2 = FriendsListUser2.userId;
            end;

            local SetRecipient = u3.SetRecipient;
            local v24 = {
                username = p19.Text
            };

            if not (v23 == FriendsListUser) then
                FriendsListUser2 = nil;
            end;

            v24.userId = FriendsListUser2;
            SetRecipient(v24);
        end;

        u18 = function(u26) -- Line: 104
            -- upvalues: RuntimeLib (ref), Players (ref), u8 (copy)
            RuntimeLib.Promise.defer(function() -- Line: 105
                -- upvalues: Players (ref), u26 (copy), u8 (ref)
                local v27, v28 = Players:GetUserThumbnailAsync(u26, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48);

                if v28 then
                    return u8(v27);
                end;
            end);
        end;

        local function u36(p29, u30) -- Line: 112
            -- upvalues: RuntimeLib (ref), Players (ref), u18 (ref)
            RuntimeLib.Promise.defer(function(p31, p32) -- Line: 113
                -- upvalues: Players (ref), u30 (copy)
                local v33 = Players:GetUserIdFromNameAsync(u30);

                if v33 == 0 or (v33 ~= v33 or not v33) then
                    p32();

                    return;
                end;

                p31(v33);
            end):andThen(function(p34) -- Line: 121
                -- upvalues: u18 (ref)
                u18(p34);
            end):catch(function(p35) -- Line: 124
                print("[Gifting Input]: loadUserAvatarFromName Error", p35);
            end);
        end;

        u17 = function(p37, p38) -- Line: 129
            -- upvalues: u10 (copy)
            if string.lower(p38.Text) == string.lower(p37) then
                u10(true);

                return;
            end;

            u10(false);
        end;

        useEffect(function() -- Line: 152
            -- upvalues: u3 (copy), u11 (copy), u18 (ref), u6 (copy), u10 (copy)
            if u3.FriendsListUser then
                u11:getValue().Text = u3.FriendsListUser.username;
                u18(u3.FriendsListUser.userId);
                u6({
                    user = u3.FriendsListUser,
                    usernameFormatted = u3.FriendsListUser.username
                });
                u10(true);
            end;
        end, { u3.FriendsListUser });

        return u1.createElement("Frame", {
            BackgroundTransparency = 1,
            Size = u3.Size,
            LayoutOrder = u3.LayoutOrder
        }, { u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 12)
            }), u1.createElement("TextLabel", {
                Text = "Recipient Username",
                TextTransparency = 0.3,
                TextSize = 20,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 14),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
                TextColor3 = ColorUtil.WHITE,
                Font = Enum.Font.Roboto
            }), u1.createElement("Frame", {
                BackgroundTransparency = 0,
                BorderSizePixel = 0,
                LayoutOrder = 1,
                Size = UDim2.new(1, 0, 1, -26),
                BackgroundColor3 = Theme.backgroundTertiary
            }, {
                u1.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 5)
                }),
                u1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 0)
                }),
                u1.createElement("Frame", {
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0.2, 1)
                }, {
                    u1.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Left,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Padding = UDim.new(0, 8)
                    }),
                    u1.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 5),
                        PaddingBottom = UDim.new(0, 5),
                        PaddingLeft = UDim.new(0, 10),
                        PaddingRight = UDim.new(0, 10)
                    }),
                    UserAvatar = u1.createElement("ImageLabel", {
                        ScaleType = "Fit",
                        SizeConstraint = "RelativeYY",
                        BackgroundTransparency = 0,
                        BorderSizePixel = 1,
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(1, 1),
                        Image = v7,
                        ImageTransparency = v9 and 0 or 0.6,
                        BackgroundColor3 = Theme.interactionPrimary,
                        BorderColor3 = Theme.textPrimary
                    }, { u1.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 5)
                        }) }),
                    u1.createElement("TextLabel", {
                        Text = "@",
                        TextTransparency = 0.6,
                        TextSize = 14,
                        BackgroundTransparency = 1,
                        LayoutOrder = 2,
                        Size = UDim2.new(0, 0, 0, 14),
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextColor3 = ColorUtil.WHITE,
                        FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
                    })
                }),
                u1.createElement("Frame", {
                    BackgroundTransparency = 1,
                    LayoutOrder = 3,
                    Size = UDim2.fromScale(0.8, 1)
                }, { u1.createElement("TextBox", {
                        Size = UDim2.fromScale(1, 1),
                        Text = "",
                        PlaceholderText = "username",
                        BackgroundTransparency = 1,
                        BackgroundColor3 = ColorUtil.WHITE,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center,
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        PlaceholderColor3 = Color3.fromRGB(107, 110, 136),
                        TextSize = 20,
                        Font = Enum.Font.Roboto,
                        ClearTextOnFocus = false,
                        [u1.Ref] = u11,
                        AutoLocalize = false,
                        [u1.Change.Text] = v25,

                        [u1.Event.FocusLost] = function(p39, p40, p41) -- Line: 136
                            -- upvalues: u5 (copy), u11 (copy), u6 (copy), u10 (copy), u36 (copy)
                            if not p40 or u5.usernameFormatted == "" then
                                u36(p39, p39.Text);
                                u10(true);

                                return;
                            end;

                            u11:getValue().Text = u5.user.username;
                            local v42 = {};

                            for i, v in u5 do
                                v42[i] = v;
                            end;

                            v42.usernameFormatted = u5.user.username;
                            u6(v42);
                            u10(true);
                        end
                    }), u1.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        TextSize = 20,
                        TextTransparency = 0.7,
                        RichText = true,
                        AutoLocalize = false,
                        Size = UDim2.fromScale(1, 1),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center,
                        Text = u5.usernameFormatted,
                        Font = Enum.Font.Roboto,
                        TextColor3 = Color3.fromRGB(255, 255, 255)
                    }) })
            }) });
    end)
};