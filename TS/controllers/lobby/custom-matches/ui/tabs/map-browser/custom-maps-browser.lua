-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local CircularSpinner = v1.CircularSpinner;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local MapBrowser = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "map-browser", "map-browser-constants").MapBrowser;
local CustomMapsBrowserSearch = RuntimeLib.import(script, script.Parent, "custom-maps-browser-search").CustomMapsBrowserSearch;
local Pagination = RuntimeLib.import(script, script.Parent, "pagination", "pagination").Pagination;
local PublishedMapCard = RuntimeLib.import(script, script.Parent, "published-map-card").PublishedMapCard;

return {
    CustomMapsBrowser = v3.new(u2)(function(p4, p5) -- Line: 17
        -- upvalues: DeviceUtil (copy), KnitClient (copy), u2 (copy), Empty (copy), CircularSpinner (copy), ColorUtil (copy), PublishedMapCard (copy), AutoCanvasScrollingFrame (copy), MapBrowser (copy), Pagination (copy), Padding (copy), CustomMapsBrowserSearch (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local _ = p5.useBinding;
        local v6, v7 = useState(false);
        local v8, u9 = useState(nil);
        local v10, u11 = useState(1);
        useEffect(function() -- Line: 24
            -- upvalues: DeviceUtil (ref), u9 (copy), KnitClient (ref)
            if not DeviceUtil.isHoarceKat() then
                KnitClient.Controllers.CustomMapBrowserController:getExistingLocalRatings();

                return;
            end;

            local v12 = {
                mapEntityId = "",
                mapId = "",
                joinCode = "D9S3BG95LPZ0",
                likes = 43,
                dislikes = 6,
                hidden = false,
                joins = 3,
                featured = true,
                metadata = {
                    mapTitle = "5v5 Castlegrounds",
                    mapDescription = "In the Blox Fruits hide-and-seek map, players explore a lush tropical paradise, blending in as pirates.",
                    creator = "Sprux",
                    thumbnailImage = "rbxassetid://13915009106",
                    tags = { "bedwars", "pvp" }
                }
            };
            u9({
                sizeHint = 1,
                documents = {
                    v12,
                    v12,
                    v12,
                    v12,
                    v12,
                    v12,
                    v12,
                    v12,
                    v12,
                    v12
                }
            });
        end, {});
        local v13;

        if v6 then
            v13 = u2.createElement(Empty, {
                LayoutOrder = 3,
                ZIndex = 1,
                Size = UDim2.new(1, 0, 0.88, 0)
            }, { u2.createElement(CircularSpinner, {
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(0.15, 0.15),
                    Position = UDim2.new(0.5, 0, 0.375, 0),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                }, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) }) });
        else
            local v14;

            if v8 == nil then
                v14 = v8;
            else
                v14 = #v8.documents == 0;
            end;

            if v14 then
                v13 = u2.createFragment({
                    NoResultsFoundContainer = u2.createElement(Empty, {
                        LayoutOrder = 3,
                        ZIndex = 1,
                        Size = UDim2.new(1, 0, 0.88, 0)
                    }, { u2.createElement("TextLabel", {
                            Text = "No results found",
                            TextScaled = true,
                            BackgroundTransparency = 1,
                            Size = UDim2.fromScale(0.75, 0.1),
                            Position = UDim2.new(0.5, 0, 0.375, 0),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            TextColor3 = ColorUtil.WHITE,
                            FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                        }) })
                });
            else
                local v15 = {};
                local v16 = #v15;
                local v17;

                if v8 == nil then
                    v17 = v8;
                else
                    local documents = v8.documents;

                    local function _(p18, p19) -- Line: 101
                        -- upvalues: u2 (ref), PublishedMapCard (ref)
                        return u2.createElement(PublishedMapCard, {
                            LayoutOrder = p19,
                            AppId = p18.mapId,
                            Map = p18
                        });
                    end;

                    v17 = table.create(#documents);

                    for i, v in documents do
                        v17[i] = u2.createElement(PublishedMapCard, {
                            LayoutOrder = i - 1,
                            AppId = v.mapId,
                            Map = v
                        });
                    end;
                end;

                local v20 = {
                    ScrollingFrameProps = {
                        LayoutOrder = 3,
                        ZIndex = 1,
                        Size = UDim2.new(1, 0, 0.7525, 0)
                    }
                };
                local v21 = { u2.createElement("UIListLayout", {
                        FillDirection = "Vertical",
                        HorizontalAlignment = "Left",
                        VerticalAlignment = "Top",
                        SortOrder = "LayoutOrder",
                        Padding = UDim.new(0, 6)
                    }) };
                local v22 = #v21;

                if v17 then
                    for i, v in v17 do
                        v21[v22 + i] = v;
                    end;
                end;

                v15[v16 + 1] = u2.createElement(AutoCanvasScrollingFrame, v20, v21);

                if v8 then
                    local v23 = {
                        Page = v10
                    };

                    if v8 ~= nil then
                        v8 = v8.sizeHint;
                    end;

                    v23.TotalPages = math.ceil(v8 / MapBrowser.MAPS_PER_PAGE);
                    v23.FrameProps = {
                        LayoutOrder = 5,
                        Size = UDim2.fromScale(1, 0.07)
                    };

                    function v23.OnPageChage(p24) -- Line: 154
                        -- upvalues: u11 (copy)
                        u11(p24);
                    end;

                    v8 = u2.createElement(Pagination, v23);
                end;

                if v8 then
                    v15[v16 + 2] = v8;
                end;

                v13 = u2.createFragment(v15);
            end;
        end;

        local v25 = {
            LayoutOrder = 4,
            BackgroundTransparency = 0.65,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = ColorUtil.BLACK
        };
        local v28 = {
            u2.createElement(Padding, {
                Padding = {
                    Horizontal = 18,
                    Vertical = 18
                }
            }),
            u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Center",
                VerticalAlignment = "Top",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 10)
            }),
            u2.createElement(CustomMapsBrowserSearch, {
                Size = UDim2.fromScale(1, 0.13),
                SetLoading = v7,

                onSearchComplete = function(p26, p27) -- Line: 189, Name: onSearchComplete
                    -- upvalues: u9 (copy)
                    u9(p27);
                end,

                Page = v10
            }),
            [#v28 + 1] = v13
        };

        return u2.createFragment({
            CustomMapsBrowser = u2.createElement("Frame", v25, v28)
        });
    end)
};