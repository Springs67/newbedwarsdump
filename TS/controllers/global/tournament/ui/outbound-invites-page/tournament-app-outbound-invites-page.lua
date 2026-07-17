-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ColorUtil = v1.ColorUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local TournamentInvitePlayerSearch = RuntimeLib.import(script, script.Parent, "tournament-invite-player-search").TournamentInvitePlayerSearch;
local TournamentOutgoingInvites = RuntimeLib.import(script, script.Parent, "tournament-outbound-invites").TournamentOutgoingInvites;
local TournamentOutboundRecommendations = RuntimeLib.import(script, script.Parent, "tournament-outbound-recommendations").TournamentOutboundRecommendations;

return {
    TournamentAppOutboundInvitePage = v3.new(u2)(function(p4, p5) -- Line: 12
        -- upvalues: u2 (copy), BedwarsImageId (copy), TournamentInvitePlayerSearch (copy), AutoCanvasScrollingFrame (copy), TournamentOutgoingInvites (copy), ColorUtil (copy), TournamentOutboundRecommendations (copy)
        return u2.createFragment({
            AppPageContainer = u2.createElement("Frame", {
                LayoutOrder = 2,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0.9)
            }, {
                DecorativeBackgroundImage = u2.createElement("ImageLabel", {
                    ImageTransparency = 0.8,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ZIndex = 2,
                    Image = BedwarsImageId.YAMINI_MAIL,
                    Size = UDim2.fromScale(0.4, 0.7),
                    ScaleType = Enum.ScaleType.Fit,
                    Position = UDim2.fromScale(0, 1),
                    AnchorPoint = Vector2.new(0, 1)
                }),
                OutboundInvitesContent = u2.createElement("Frame", {
                    BackgroundTransparency = 0,
                    BorderSizePixel = 1,
                    Size = UDim2.fromScale(1, 0.9),
                    BackgroundColor3 = Color3.fromHex("403E74"),
                    Position = UDim2.fromOffset(0, 0)
                }, {
                    Gradient = u2.createElement("UIGradient", {
                        Rotation = 60,
                        Transparency = NumberSequence.new(0.6, 1),
                        Color = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromHex("585497"))
                    }),
                    u2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        Padding = UDim.new(0, 0),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }),
                    u2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 20),
                        PaddingTop = UDim.new(0, 20)
                    }),
                    LeftContainer = u2.createElement("Frame", {
                        LayoutOrder = 1,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Size = UDim2.fromScale(0.6, 0.95),
                        AnchorPoint = Vector2.new(0, 0)
                    }, {
                        u2.createElement("UIListLayout", {
                            FillDirection = "Vertical",
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            HorizontalAlignment = Enum.HorizontalAlignment.Left,
                            VerticalAlignment = Enum.VerticalAlignment.Top,
                            Padding = UDim.new(0.03, 0)
                        }),
                        PlayerInviteSearch = u2.createElement(TournamentInvitePlayerSearch, {
                            LayoutOrder = 0,
                            Size = UDim2.new(0.9, 0, 0.15, 0)
                        }),
                        OutboundInvitesList = u2.createElement(AutoCanvasScrollingFrame, {
                            ScrollingFrameProps = {
                                BackgroundTransparency = 1,
                                LayoutOrder = 1,
                                Size = UDim2.fromScale(0.9, 0.8),
                                CanvasSize = UDim2.fromScale(1, 0.75),
                                AutomaticCanvasSize = Enum.AutomaticSize.Y
                            }
                        }, { u2.createElement(TournamentOutgoingInvites, {
                                LayoutOrder = 1,
                                OutboundInvites = p4.OutboundInvites
                            }) })
                    }),
                    RightContainer = u2.createElement("Frame", {
                        LayoutOrder = 2,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        ZIndex = 3,
                        Size = UDim2.fromScale(0.3, 0.95),
                        AnchorPoint = Vector2.new(0, 0)
                    }, {
                        u2.createElement("UIListLayout", {
                            FillDirection = "Vertical",
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            HorizontalAlignment = Enum.HorizontalAlignment.Left,
                            VerticalAlignment = Enum.VerticalAlignment.Top,
                            Padding = UDim.new(0, 0)
                        }),
                        u2.createElement("TextLabel", {
                            Text = "<b>Recommended Invites</b>",
                            TextTransparency = 0.3,
                            RichText = true,
                            TextScaled = true,
                            BackgroundTransparency = 1,
                            LayoutOrder = 1,
                            Size = UDim2.new(1, 0, 0, 40),
                            TextXAlignment = Enum.TextXAlignment.Left,
                            TextYAlignment = Enum.TextYAlignment.Top,
                            TextColor3 = ColorUtil.WHITE,
                            Font = Enum.Font.Roboto
                        }, { u2.createElement("UITextSizeConstraint", {
                                MaxTextSize = 36
                            }) }),
                        RecommendedInvites = u2.createElement(AutoCanvasScrollingFrame, {
                            ScrollingFrameProps = {
                                BackgroundTransparency = 1,
                                LayoutOrder = 2,
                                Size = UDim2.fromScale(0.9, 0.8),
                                CanvasSize = UDim2.fromScale(1, 0.75),
                                AutomaticCanvasSize = Enum.AutomaticSize.Y
                            }
                        }, { u2.createElement(TournamentOutboundRecommendations, {
                                LayoutOrder = 1
                            }) })
                    })
                })
            })
        });
    end)
};