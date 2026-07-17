-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local ImageId = v1.ImageId;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local AfkPlaceUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-place", "afk-place-utils").AfkPlaceUtils;
local EmoteMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;

return {
    TournamentCreateTeamPage = v3.new(u2)(function(p4, p5) -- Line: 14
        -- upvalues: u2 (copy), TweenService (copy), AfkPlaceUtils (copy), KnitClient (copy), Empty (copy), ColorUtil (copy), ImageId (copy), EmoteMeta (copy), EmoteType (copy)
        local v6, u7 = p5.useState(false);
        local u8 = u2.createRef();
        local u9 = u2.createRef();

        local function u11(p10) -- Line: 19
            -- upvalues: TweenService (ref), AfkPlaceUtils (ref)
            if not p10 then
                return nil;
            end;

            TweenService:Create(p10, TweenInfo.new(AfkPlaceUtils.Tween.textFadeInTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ImageTransparency = 0
            }):Play();
        end;

        local function u13(p12) -- Line: 28
            -- upvalues: TweenService (ref), AfkPlaceUtils (ref)
            if not p12 then
                return nil;
            end;

            TweenService:Create(p12, TweenInfo.new(AfkPlaceUtils.Tween.textFadeInTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                TextTransparency = 0
            }):Play();
        end;

        local function u15(p14) -- Line: 37
            -- upvalues: TweenService (ref)
            if not p14 then
                return nil;
            end;

            TweenService:Create(p14, TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1), {
                Rotation = 360
            }):Play();
        end;

        return u2.createFragment({
            ["App Content - Create Team Page"] = u2.createElement("Frame", {
                LayoutOrder = 2,
                BackgroundTransparency = 0,
                BorderSizePixel = 1,
                Size = UDim2.fromScale(1, 0.9),
                BackgroundColor3 = Color3.fromHex("403E74")
            }, {
                Gradient = u2.createElement("UIGradient", {
                    Rotation = 60,
                    Transparency = NumberSequence.new(0.6, 1),
                    Color = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromHex("585497"))
                }),
                CreateTeamHeader = u2.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextScaled = true,
                    Text = "You aren’t in a team right now. Create a team or accept an invitation on the INVITES page.",
                    Size = UDim2.fromScale(0.7, 0.1),
                    AnchorPoint = Vector2.new(0.5, 0),
                    Position = UDim2.fromScale(0.5, 0.08),
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                }),
                CreateTeamButton = u2.createElement("TextButton", {
                    Text = "Create Team",
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Font = Enum.Font.ArialBold,
                    BackgroundColor3 = Color3.fromHex("30CE5C"),
                    Position = UDim2.fromScale(0.5, 0.35),
                    Size = UDim2.fromScale(0.3, 0.2),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextSize = 26,

                    [u2.Event.Activated] = function(p16) -- Line: 78
                        -- upvalues: u7 (copy), u11 (copy), u8 (copy), u15 (copy), u13 (copy), u9 (copy), KnitClient (ref)
                        u7(true);
                        task.spawn(function() -- Line: 80
                            -- upvalues: u11 (ref), u8 (ref), u15 (ref), u13 (ref), u9 (ref)
                            u11(u8:getValue());
                            u15(u8:getValue());
                            u13(u9:getValue());
                        end);

                        if not KnitClient.Controllers.TournamentTeamController:createTournamentTeam() then
                            u7(false);
                        end;
                    end,

                    ZIndex = 4
                }, { u2.createElement("UIGradient", {
                        Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255))
                    }), u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0.1, 0)
                    }) }),
                u2.createElement(Empty, {
                    Size = UDim2.fromScale(0.3, 0.3),
                    Position = UDim2.fromScale(0.5, 0.65),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                }, {
                    u2.createElement("UIListLayout", {
                        FillDirection = "Vertical",
                        HorizontalAlignment = "Center",
                        Padding = UDim.new(0.03, 0),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }),
                    u2.createElement("TextLabel", {
                        [u2.Ref] = u9,
                        Text = "<i>Creating a new team...</i>",
                        AnchorPoint = Vector2.new(0.5, 0),
                        Size = UDim2.fromScale(1, 0.12),
                        TextColor3 = ColorUtil.WHITE,
                        RichText = true,
                        TextScaled = true,
                        TextStrokeTransparency = 1,
                        TextTransparency = v6 and 0 or 1,
                        TextYAlignment = "Center",
                        Font = Enum.Font.Roboto,
                        BackgroundTransparency = 1,
                        ZIndex = 5,
                        LayoutOrder = 2
                    }),
                    LoadingSpinner = u2.createElement("ImageLabel", {
                        [u2.Ref] = u8,
                        Image = ImageId.LOADING_SPINNER,
                        BackgroundTransparency = 1,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Size = UDim2.fromScale(0.35, 0.35),
                        ImageTransparency = v6 and 0 or 1,
                        SizeConstraint = Enum.SizeConstraint.RelativeYY,
                        ZIndex = 5,
                        LayoutOrder = 1
                    })
                }),
                DecorativeBackgroundImage = u2.createElement("ImageLabel", {
                    ImageTransparency = 0.8,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ZIndex = 2,
                    Image = EmoteMeta[EmoteType.PENGUIN_SLEEP].image,
                    Size = UDim2.fromScale(0.5, 0.7),
                    ScaleType = Enum.ScaleType.Fit,
                    Position = UDim2.fromScale(1, 1),
                    AnchorPoint = Vector2.new(1, 1)
                })
            })
        });
    end)
};