-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local CalcTotalUIScale = v1.CalcTotalUIScale;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local GetUIScaleAncestors = v1.GetUIScaleAncestors;
local PlayerRender = v1.PlayerRender;
local TextInputComponent = v1.TextInputComponent;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local ClanMemberRank = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank;
local ClanUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ClanProfilePageLayout = RuntimeLib.import(script, script.Parent.Parent, "clan-profile-page-layout").ClanProfilePageLayout;
local ClanChatHoarcekatMessages = RuntimeLib.import(script, script.Parent, "clan-chat-hoarcekat-messages").ClanChatHoarcekatMessages;

return {
    ClanProfileChatTab = v3.new(u2)(function(p4, p5) -- Line: 21
        -- upvalues: u2 (copy), DeviceUtil (copy), ClanChatHoarcekatMessages (copy), Flamework (copy), GetUIScaleAncestors (copy), CalcTotalUIScale (copy), ClientStore (copy), PlayerRender (copy), Empty (copy), ColorUtil (copy), ClanMemberRank (copy), ClanUtil (copy), AutoCanvasScrollingFrame (copy), TextInputComponent (copy), Theme (copy), ClanProfilePageLayout (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local u6, u7 = useState(true);
        local v8, u9 = useState({});
        local u10, u11 = useState("");
        local u12 = u2.createRef();
        local u13 = u2.createRef();
        useEffect(function() -- Line: 29
            -- upvalues: DeviceUtil (ref), u9 (copy), ClanChatHoarcekatMessages (ref), u12 (copy), u13 (copy), Flamework (ref), GetUIScaleAncestors (ref), CalcTotalUIScale (ref), u7 (copy)
            if DeviceUtil.isHoarceKat() then
                u9(ClanChatHoarcekatMessages);

                return nil;
            end;

            local u14 = u12:getValue();

            if not (u14 and u13:getValue()) then
                return nil;
            end;

            task.spawn(function() -- Line: 41
                -- upvalues: Flamework (ref), u9 (ref)
                local v15 = Flamework.resolveDependency("client/controllers/lobby/clan/ui/profile/chat-tab/clan-chat-controller@ClanChatController"):getClanChatMessages();

                if v15 then
                    u9(v15);
                end;
            end);

            local function u17() -- Line: 47
                -- upvalues: GetUIScaleAncestors (ref), u14 (copy), CalcTotalUIScale (ref), u7 (ref)
                local v16 = CalcTotalUIScale((GetUIScaleAncestors(u14)));

                if math.abs((u14.AbsoluteCanvasSize.Y - u14.AbsoluteSize.Y) / v16 - u14.CanvasPosition.Y / v16) < 1 then
                    u7(true);

                    return;
                end;

                u7(false);
            end;

            local u19 = Flamework.resolveDependency("client/controllers/lobby/clan/ui/profile/chat-tab/clan-chat-controller@ClanChatController"):clanChatFetchedEvent():Connect(function(p18) -- Line: 62
                -- upvalues: u17 (copy), u9 (ref)
                if not p18 or #p18 == 0 then
                    return nil;
                end;

                u17();
                u9(p18);
            end);
            local u22 = Flamework.resolveDependency("client/controllers/lobby/clan/ui/profile/chat-tab/clan-chat-controller@ClanChatController"):clanChatNewMessageEvent():Connect(function(p20) -- Line: 70
                -- upvalues: u17 (copy), u9 (ref)
                u17();
                u9(function(p21) -- Line: 73
                    return p21;
                end);
            end);

            return function() -- Line: 77
                -- upvalues: u19 (copy), u22 (copy)
                u19:Disconnect();
                u22:Disconnect();
            end;
        end, {});

        local function _(p23) -- Line: 82
            -- upvalues: Flamework (ref), u11 (copy), u10 (copy)
            local v24 = Flamework.resolveDependency("client/controllers/lobby/clan/ui/profile/chat-tab/clan-chat-controller@ClanChatController"):sendMessage(p23);

            if v24.success then
                if v24.success and u10 ~= "" then
                    u11("");
                end;

                return;
            end;

            u11(v24.errorMessage);
        end;

        local v25 = {
            Title = "CLAN CHAT",
            PaddingBottom = true
        };
        local v26 = {};
        local v27 = #v26;
        local v28 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v29 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 10)
            }) };
        local v30 = #v29;
        local v31;

        if v8 == nil then
            v31 = v8;
        else
            local function v41(p32) -- Line: 109
                -- upvalues: ClientStore (ref), u2 (ref), PlayerRender (ref), Empty (ref), ColorUtil (ref), ClanMemberRank (ref), ClanUtil (ref)
                local v33 = not p32;

                if not v33 then
                    local v34;

                    if p32 == nil then
                        v34 = p32;
                    else
                        v34 = p32.message;
                    end;

                    if v34 == "" then
                        v34 = false;
                    end;

                    v33 = not v34;
                end;

                if v33 then
                    return nil;
                end;

                local myClan = ClientStore:getState().Clans.myClan;

                if myClan ~= nil then
                    myClan = myClan.members[tostring(p32.userId)];

                    if myClan ~= nil then
                        myClan = myClan.rank;
                    end;
                end;

                local v35 = {
                    AutomaticSize = "Y",
                    Size = UDim2.new(1, 0, 0, 32)
                };
                local v36 = {
                    u2.createElement("UIListLayout", {
                        FillDirection = "Horizontal",
                        HorizontalAlignment = "Left",
                        VerticalAlignment = "Top",
                        SortOrder = "LayoutOrder",
                        Padding = UDim.new(0, 10)
                    }),
                    MessageUserAvatar = u2.createElement(PlayerRender, {
                        LayoutOrder = 1,
                        BackgroundTransparency = 1,
                        Size = UDim2.new(0, 24, 0, 24),
                        PlayerUserId = p32.userId
                    }, { u2.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        }) })
                };
                local _ = #v36;
                local v37 = {
                    AutomaticSize = "Y",
                    LayoutOrder = 2,
                    Size = UDim2.new(0.8, 0, 0, 32)
                };
                local v38 = {
                    u2.createElement(
                        "UIListLayout",
                        {
                            FillDirection = "Vertical",
                            HorizontalAlignment = "Left",
                            VerticalAlignment = "Top",
                            SortOrder = "LayoutOrder"
                        }
                    ),
                    MessageHeader = u2.createElement(Empty, {
                        LayoutOrder = 1,
                        Size = UDim2.new(1, 0, 0, 16)
                    }, {
                        u2.createElement("UIListLayout", {
                            FillDirection = "Horizontal",
                            HorizontalAlignment = "Left",
                            VerticalAlignment = "Bottom",
                            SortOrder = "LayoutOrder",
                            Padding = UDim.new(0, 3)
                        }),
                        SenderName = u2.createElement("TextLabel", {
                            AutomaticSize = "X",
                            TextXAlignment = "Left",
                            TextScaled = true,
                            BackgroundTransparency = 1,
                            LayoutOrder = 1,
                            Size = UDim2.fromScale(0, 1),
                            Text = p32.displayName,
                            TextColor3 = ColorUtil.WHITE,
                            FontFace = Font.fromName("Roboto", Enum.FontWeight.ExtraBold)
                        }, { u2.createElement("UITextSizeConstraint", {
                                MaxTextSize = 16
                            }) }),
                        TimeSent = u2.createElement("TextLabel", {
                            TextXAlignment = "Left",
                            TextScaled = true,
                            TextTransparency = 0.3,
                            BackgroundTransparency = 1,
                            LayoutOrder = 3,
                            Size = UDim2.fromScale(0.5, 1),
                            Text = DateTime.fromUnixTimestamp(p32.time):FormatLocalTime("L LT", "en-us"),
                            TextColor3 = ColorUtil.WHITE,
                            FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular)
                        }, { u2.createElement("UITextSizeConstraint", {
                                MaxTextSize = 14
                            }) })
                    })
                };
                local v39 = #v38;
                local v40;

                if myClan == nil then
                    v40 = false;
                else
                    v40 = u2.createFragment({
                        ClanRank = u2.createElement("TextLabel", {
                            AutomaticSize = "Y",
                            TextXAlignment = "Left",
                            TextYAlignment = "Top",
                            TextScaled = true,
                            TextTransparency = 0.3,
                            BackgroundTransparency = 1,
                            LayoutOrder = 2,
                            Size = UDim2.fromScale(1, 0),
                            Text = string.upper((tostring(ClanMemberRank[myClan]))),
                            TextColor3 = ClanUtil.getClanMemberRankColor(myClan) or ColorUtil.WHITE,
                            FontFace = Font.fromName("Roboto", Enum.FontWeight.ExtraBold)
                        }, { u2.createElement("UITextSizeConstraint", {
                                MaxTextSize = 12
                            }) })
                    });
                end;

                if v40 then
                    v38[v39 + 1] = v40;
                end;

                local _ = #v38;
                v38.MessageText = u2.createElement("TextLabel", {
                    AutomaticSize = "Y",
                    Font = "Roboto",
                    TextXAlignment = "Left",
                    TextYAlignment = "Center",
                    TextScaled = true,
                    RichText = true,
                    BackgroundTransparency = 1,
                    LayoutOrder = 3,
                    Size = UDim2.fromScale(1, 0),
                    Text = p32.message,
                    TextColor3 = ColorUtil.WHITE
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 16
                    }) });
                v36.MessageWrapper = u2.createElement(Empty, v37, v38);

                return u2.createFragment({
                    MessageContainer = u2.createElement(Empty, v35, v36)
                });
            end;

            local v42 = 0;
            v31 = {};

            for i, v in v8 do
                local v43 = v41(v, i - 1, v8);

                if v43 ~= nil then
                    v42 = v42 + 1;
                    v31[v42] = v43;
                end;
            end;
        end;

        local v45 = {
            AdditionalSpace = 6,
            ScrollingFrameRef = u12,
            ScrollingFrameProps = {
                LayoutOrder = 1,
                Size = UDim2.new(1, 0, 0.9, -10)
            },

            OnCalc = function(p44) -- Line: 276, Name: OnCalc
                -- upvalues: u6 (copy)
                if u6 then
                    p44.CanvasPosition = Vector2.new(0, p44.AbsoluteCanvasSize.Y);
                end;
            end
        };
        local v46 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                Padding = UDim.new(0, 6),
                [u2.Ref] = u13
            }) };
        local v47 = #v46;

        for i, v in v31 do
            v46[v47 + i] = v;
        end;

        v29[v30 + 1] = u2.createElement(AutoCanvasScrollingFrame, v45, v46);
        v29[v30 + 2] = u2.createElement(TextInputComponent, {
            ClearTextOnEnter = true,
            MaxCharacters = 60,

            OnEnter = function(p48) -- Line: 295, Name: OnEnter
                -- upvalues: Flamework (ref), u11 (copy), u10 (copy)
                local v49 = Flamework.resolveDependency("client/controllers/lobby/clan/ui/profile/chat-tab/clan-chat-controller@ClanChatController"):sendMessage(p48);

                if v49.success then
                    if v49.success and u10 ~= "" then
                        u11("");
                    end;

                    return;
                end;

                u11(v49.errorMessage);
            end,

            TextBox = {
                PlaceholderText = "Send a message",
                LayoutOrder = 2,
                ClearTextOnFocus = false,
                Size = UDim2.fromScale(1, 0.1),
                TextXAlignment = Enum.TextXAlignment.Left
            }
        }, { u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0.05, 0),
                PaddingBottom = UDim.new(0.05, 0),
                PaddingLeft = UDim.new(0.05, 0),
                PaddingRight = UDim.new(0.05, 0)
            }) });
        v26[v27 + 1] = u2.createElement(Empty, v28, v29);
        local v50;

        if u10 == "" then
            v50 = false;
        else
            v50 = u2.createFragment({
                ErrorMessage = u2.createElement("TextLabel", {
                    Font = "Roboto",
                    TextXAlignment = "Left",
                    TextScaled = true,
                    RichText = true,
                    BackgroundTransparency = 1,
                    LayoutOrder = 3,
                    Position = UDim2.fromScale(0, 1.01),
                    Size = UDim2.new(1, 0, 0, 16),
                    Text = u10,
                    TextColor3 = Theme.mcRed
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 16
                    }) })
            });
        end;

        if v50 then
            v26[v27 + 2] = v50;
        end;

        return u2.createElement(ClanProfilePageLayout, v25, v26);
    end)
};