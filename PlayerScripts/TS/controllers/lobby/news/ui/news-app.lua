-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local IconButton = v1.IconButton;
local Padding = v1.Padding;
local ScaleComponent = v1.ScaleComponent;
local SlideIn = v1.SlideIn;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "news", "news-types");
local News = v6.News;
local NewsMeta = v6.NewsMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local NewsReader = RuntimeLib.import(script, script.Parent, "news-reader").NewsReader;
local Issue1Reader = RuntimeLib.import(script, script.Parent, "special", "issue-1-reader").Issue1Reader;
local Issue2Reader = RuntimeLib.import(script, script.Parent, "special", "issue-2-reader").Issue2Reader;
local v30 = v4.new(u3)(function(u7, p8) -- Line: 26
    -- upvalues: SoundManager (copy), GameSound (copy), DeviceUtil (copy), u3 (copy), DarkBackground (copy), News (copy), Issue1Reader (copy), Issue2Reader (copy), NewsReader (copy), u2 (copy), NewsMeta (copy), AutoCanvasScrollingFrame (copy), ScaleComponent (copy), Padding (copy), Empty (copy), IconButton (copy), BedwarsImageId (copy), Flamework (copy), SlideIn (copy)
    local useEffect = p8.useEffect;
    local v9, u10 = p8.useState(nil);
    local v11 = UDim2.fromOffset(1024, 760);
    useEffect(function() -- Line: 31
        -- upvalues: SoundManager (ref), GameSound (ref), u7 (copy), u10 (copy)
        SoundManager:playSound(GameSound.UI_OPEN_2);

        if u7.selectedNews then
            u10(u7.selectedNews);
        end;
    end, {});
    local v12 = {
        DisplayOrder = 20,
        ResetOnSpawn = false,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    };
    local v13 = { u3.createElement(DarkBackground, {
            AppId = u7.AppId,
            ImageButtonProps = {
                ZIndex = 0
            },

            OnClick = function() -- Line: 48, Name: OnClick
                -- upvalues: SoundManager (ref), GameSound (ref)
                SoundManager:playSound(GameSound.UI_CLOSE_2);

                return true;
            end
        }) };
    local v14;

    if v9 == News.NEWSPAPER_ISSUE_1 then
        v14 = u3.createElement(Issue1Reader, {
            SelectedNews = v9,
            SetSelectedNews = u10
        });
    elseif v9 == News.NEWSPAPER_ISSUE_2 then
        v14 = u3.createElement(Issue2Reader, {
            SelectedNews = v9,
            SetSelectedNews = u10
        });
    else
        local v15;

        if v9 then
            v15 = u3.createElement(NewsReader, {
                SelectedNews = v9,
                SetSelectedNews = u10
            });
        else
            local v16 = u2.entries(NewsMeta);

            local function v20(p17) -- Line: 77
                -- upvalues: u3 (ref), u10 (copy), SoundManager (ref), GameSound (ref)
                local u18 = p17[1];
                local v19 = p17[2];

                if v19.disabled then
                    return nil;
                end;

                return u3.createFragment({
                    NewsCard = u3.createElement("ImageButton", {
                        SizeConstraint = Enum.SizeConstraint.RelativeXX,
                        BackgroundTransparency = 1,

                        [u3.Event.Activated] = function() -- Line: 87
                            -- upvalues: u10 (ref), u18 (copy), SoundManager (ref), GameSound (ref)
                            u10(u18);
                            SoundManager:playSound(GameSound.UI_CLICK_2);
                        end
                    }, {
                        u3.createElement("UIListLayout", {
                            FillDirection = "Vertical",
                            SortOrder = "LayoutOrder",
                            Padding = UDim.new(0.04, 0)
                        }),
                        NewsCoverArt = u3.createElement("ImageLabel", {
                            BorderSizePixel = 0,
                            LayoutOrder = 1,
                            Size = UDim2.fromScale(1, 0.75),
                            Image = v19.coverArt,
                            ScaleType = Enum.ScaleType.Crop,
                            BackgroundColor3 = Color3.fromRGB(77, 77, 77)
                        }, { u3.createElement("UICorner", {
                                CornerRadius = UDim.new(0.07, 0)
                            }) }),
                        NewsTitle = u3.createElement("TextLabel", {
                            TextYAlignment = "Center",
                            TextXAlignment = "Left",
                            TextScaled = true,
                            Font = "GothamBold",
                            BackgroundTransparency = 1,
                            LayoutOrder = 2,
                            Size = UDim2.fromScale(1, 0.1),
                            Text = v19.title,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            TextTruncate = Enum.TextTruncate.AtEnd
                        }),
                        NewsPages = u3.createElement("TextLabel", {
                            TextYAlignment = "Center",
                            TextXAlignment = "Left",
                            TextScaled = true,
                            Font = "GothamBold",
                            TextTransparency = 0.3,
                            BackgroundTransparency = 1,
                            LayoutOrder = 3,
                            Size = UDim2.fromScale(1, 0.075),
                            Text = tostring(#v19.pageAssetIds) .. " Pages",
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            TextTruncate = Enum.TextTruncate.AtEnd
                        })
                    })
                });
            end;

            local v21 = 0;
            local v22 = {};

            for i, v in v16 do
                local v23 = v20(v, i - 1, v16);

                if v23 ~= nil then
                    v21 = v21 + 1;
                    v22[v21] = v23;
                end;
            end;

            local v24 = {
                ScrollingFrameProps = {
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(1, 0.9)
                }
            };
            local v25 = { u3.createElement("UIGridLayout", {
                    FillDirectionMaxCells = 4,
                    VerticalAlignment = "Top",
                    HorizontalAlignment = "Left",
                    CellSize = UDim2.fromScale(0.25, 0.33),
                    CellPadding = UDim2.new(0.05, 0, 0.05, 0)
                }) };
            local v26 = #v25;

            for i, v in v22 do
                v25[v26 + i] = v;
            end;

            v15 = u3.createFragment({
                NewsList = u3.createElement(AutoCanvasScrollingFrame, v24, v25)
            });
        end;

        local v27 = {
            BorderSizePixel = 0,
            AutoButtonColor = false,
            Modal = true,
            Size = v11,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            BackgroundColor3 = Color3.fromHex("#333333")
        };
        local v28 = {
            u3.createElement(ScaleComponent, {
                PowerRelationshipPastMaximum = 0.6,
                MaximumSize = Vector2.new(v11.X.Offset * 1.2, v11.Y.Offset * 1.2),
                ScreenPadding = Vector2.new(30, 30)
            }),
            u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 10)
            }),
            u3.createElement(Padding, {
                Padding = UDim.new(0, 28)
            }),
            u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                VerticalAlignment = "Center",
                HorizontalAlignment = "Left",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 16)
            }),
            Header = u3.createElement(Empty, {
                LayoutOrder = 1,
                Size = UDim2.new(1, 0, 0, 28)
            }, {
                NewsTitle = u3.createElement("TextLabel", {
                    Text = "BedWars News",
                    TextYAlignment = "Center",
                    TextXAlignment = "Left",
                    TextScaled = true,
                    Font = "GothamBold",
                    BackgroundTransparency = 1,
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(1, 1),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextTruncate = Enum.TextTruncate.AtEnd
                }),
                u3.createElement(IconButton, {
                    Size = UDim2.new(0, 28, 0, 28),
                    Image = BedwarsImageId.X,
                    Position = UDim2.fromScale(1, 0.5),
                    AnchorPoint = Vector2.new(1, 0.5),

                    OnClick = function() -- Line: 220, Name: OnClick
                        -- upvalues: Flamework (ref), u7 (copy), SoundManager (ref), GameSound (ref)
                        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u7.AppId);
                        SoundManager:playSound(GameSound.UI_CLOSE_2);
                    end
                })
            }),
            [#v28 + 1] = v15
        };
        v14 = u3.createFragment({
            NewsAppContainer = u3.createElement("ImageButton", v27, v28)
        });
    end;

    local v29 = {
        [#v29 + 1] = v14
    };
    v13[#v13 + 1] = u3.createElement(SlideIn, {}, v29);

    return u3.createFragment({
        NewsApp = u3.createElement("ScreenGui", v12, v13)
    });
end);

return {
    NewsApp = v5.connect(function(p31, p32) -- Line: 244
        local v33 = {};

        for i, v in p32 do
            v33[i] = v;
        end;

        return v33;
    end)(v30)
};