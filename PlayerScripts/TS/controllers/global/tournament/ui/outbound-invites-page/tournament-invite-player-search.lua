-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local ExpireList = v1.ExpireList;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u4 = ExpireList.new(5);

return {
    TournamentInvitePlayerSearch = v3.new(u2)(function(u5, p6) -- Line: 17
        -- upvalues: u4 (copy), Players (copy), ClientStore (copy), KnitClient (copy), RuntimeLib (copy), u2 (copy), ColorUtil (copy), Empty (copy), Theme (copy), ButtonComponent (copy), SoundManager (copy), GameSound (copy)
        local useState = p6.useState;
        local v7, u8 = useState("");
        local v9, u10 = useState(false);
        local v11, u12 = useState("");

        local function u15(p13) -- Line: 22
            -- upvalues: u4 (ref), Players (ref), u10 (copy), u12 (copy), ClientStore (ref), KnitClient (ref)
            if u4:has(Players.LocalPlayer.UserId) then
                return nil;
            end;

            u4:add(Players.LocalPlayer.UserId);
            u10(true);
            u12("Loading");
            local myTeamId = ClientStore:getState().Tournament.myTeamId;

            if myTeamId == "" or not myTeamId then
                return nil;
            end;

            KnitClient.Controllers.TournamentTeamController:requestSendTournamentTeamInvitation(myTeamId, p13):andThen(function(p14) -- Line: 34
                -- upvalues: u10 (ref), u12 (ref)
                u10(false);

                if p14 then
                    u12("Invite Sent!");

                    return;
                end;

                u12("Could not invite player.");
            end);
        end;

        local function _(u16) -- Line: 43
            -- upvalues: RuntimeLib (ref), Players (ref), u8 (copy)
            RuntimeLib.Promise.defer(function() -- Line: 44
                -- upvalues: Players (ref), u16 (copy), u8 (ref)
                local v17, v18 = Players:GetUserThumbnailAsync(u16, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48);

                if v18 then
                    return u8(v17);
                end;
            end);
        end;

        local u20 = RuntimeLib.async(function(p19) -- Line: 51
            -- upvalues: Players (ref)
            return Players:GetUserIdFromNameAsync(p19);
        end);
        local u21 = u2.createRef();

        local function v26(p22) -- Line: 62
            -- upvalues: u20 (copy), RuntimeLib (ref), Players (ref), u8 (copy)
            u20(p22.Text):andThen(function(u23) -- Line: 64
                -- upvalues: RuntimeLib (ref), Players (ref), u8 (ref)
                RuntimeLib.Promise.defer(function() -- Line: 44
                    -- upvalues: Players (ref), u23 (copy), u8 (ref)
                    local v24, v25 = Players:GetUserThumbnailAsync(u23, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48);

                    if v25 then
                        return u8(v24);
                    end;
                end);
            end);
        end;

        return u2.createElement("Frame", {
            BackgroundTransparency = 1,
            Size = u5.Size,
            LayoutOrder = u5.LayoutOrder
        }, { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 6)
            }), u2.createElement("TextLabel", {
                Text = "<b>Send Invite to User</b>",
                TextTransparency = 0.3,
                RichText = true,
                TextScaled = true,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.new(1, 0, 0.3, 0),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
                TextColor3 = ColorUtil.WHITE,
                Font = Enum.Font.Roboto
            }), u2.createElement(Empty, {
                LayoutOrder = 2,
                Size = UDim2.new(1, 0, 0.65, 0)
            }, {
                u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 6)
                }),
                InputBoxContainer = u2.createElement("Frame", {
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    LayoutOrder = 1,
                    Size = UDim2.new(0.6, -12, 1, 0),
                    BackgroundColor3 = Theme.backgroundTertiary
                }, {
                    u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 5)
                    }),
                    u2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Left,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Padding = UDim.new(0, 0)
                    }),
                    PrefixContainer = u2.createElement("Frame", {
                        AutomaticSize = "X",
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(0, 1)
                    }, {
                        u2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal,
                            HorizontalAlignment = Enum.HorizontalAlignment.Left,
                            VerticalAlignment = Enum.VerticalAlignment.Center,
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            Padding = UDim.new(0, 8)
                        }),
                        u2.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, 5),
                            PaddingBottom = UDim.new(0, 5),
                            PaddingLeft = UDim.new(0, 10),
                            PaddingRight = UDim.new(0, 0)
                        }),
                        UserAvatar = u2.createElement("ImageLabel", {
                            ScaleType = "Fit",
                            SizeConstraint = "RelativeYY",
                            ImageTransparency = 0,
                            BackgroundTransparency = 0,
                            BorderSizePixel = 1,
                            LayoutOrder = 1,
                            Size = UDim2.fromScale(1, 1),
                            Image = v7,
                            BackgroundColor3 = Theme.interactionPrimary,
                            BorderColor3 = Theme.textPrimary
                        }, { u2.createElement("UICorner", {
                                CornerRadius = UDim.new(0, 5)
                            }) }),
                        u2.createElement("TextLabel", {
                            Text = "<b>@</b>",
                            TextTransparency = 0.6,
                            RichText = true,
                            TextSize = 14,
                            TextScaled = true,
                            BackgroundTransparency = 1,
                            LayoutOrder = 2,
                            Size = UDim2.new(0, 0, 1, 0),
                            AutomaticSize = Enum.AutomaticSize.X,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            TextColor3 = ColorUtil.WHITE
                        })
                    }),
                    InputTextBox = u2.createElement("TextBox", {
                        Size = UDim2.fromScale(0.85, 0.55),
                        Text = "",
                        PlaceholderText = "username",
                        BackgroundTransparency = 1,
                        BackgroundColor3 = ColorUtil.WHITE,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center,
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        PlaceholderColor3 = Color3.fromRGB(107, 110, 136),
                        TextScaled = true,
                        Font = Enum.Font.Roboto,
                        ClearTextOnFocus = false,
                        [u2.Ref] = u21,
                        AutoLocalize = false,

                        [u2.Change.Text] = function(p27) -- Line: 55
                            -- upvalues: u5 (copy)
                            if u5.MaxCharacters ~= nil and #p27.Text > u5.MaxCharacters then
                                p27.Text = string.sub(p27.Text, 0, 20);

                                return nil;
                            end;
                        end,

                        [u2.Event.FocusLost] = v26,
                        LayoutOrder = 3
                    })
                }),
                u2.createElement(ButtonComponent, {
                    Text = "<b>Invite User</b>",
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(0.2, 1),
                    BackgroundColor3 = Theme.backgroundSuccess,

                    OnClick = function() -- Line: 193, Name: OnClick
                        -- upvalues: SoundManager (ref), GameSound (ref), u21 (copy), u20 (copy), RuntimeLib (ref), Players (ref), u8 (copy), u15 (copy)
                        SoundManager:playSound(GameSound.UI_CLICK_2);
                        local v28 = u21:getValue();

                        if not v28 then
                            return nil;
                        end;

                        u20(v28.Text):andThen(function(u29) -- Line: 200
                            -- upvalues: RuntimeLib (ref), Players (ref), u8 (ref), u15 (ref)
                            RuntimeLib.Promise.defer(function() -- Line: 44
                                -- upvalues: Players (ref), u29 (copy), u8 (ref)
                                local v30, v31 = Players:GetUserThumbnailAsync(u29, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48);

                                if v31 then
                                    return u8(v30);
                                end;
                            end);
                            u15(u29);
                        end);
                    end,

                    CornerRadius = UDim.new(0, 3),
                    Disabled = v9,
                    Loading = v9
                }),
                u2.createElement("TextLabel", {
                    TextTransparency = 0.6,
                    RichText = true,
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    LayoutOrder = 3,
                    Text = v11,
                    Size = UDim2.new(0.1, 0, 1, 0),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextColor3 = ColorUtil.WHITE
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 14
                    }) })
            }) });
    end)
};