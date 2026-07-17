-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local StringUtil = v1.StringUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local CustomMatchAppTab = RuntimeLib.import(script, script.Parent.Parent.Parent, "custom-match-tabs").CustomMatchAppTab;
local CustomMatchesCodeInputs = RuntimeLib.import(script, script.Parent.Parent.Parent, "custom-matches-code-inputs").CustomMatchesCodeInputs;
local VerticalListMapListing = RuntimeLib.import(script, script.Parent.Parent, "vertical-list-map-listing").VerticalListMapListing;

return {
    CustomMatchesHomeTab = v3.new(u2)(function(u4, p5) -- Line: 19
        -- upvalues: DeviceUtil (copy), BedwarsImageId (copy), RuntimeLib (copy), StringUtil (copy), KnitClient (copy), QueueType (copy), u2 (copy), CustomMatchesCodeInputs (copy), ColorUtil (copy), Padding (copy), Theme (copy), CustomMatchAppTab (copy), Empty (copy), VerticalListMapListing (copy), AutoCanvasScrollingFrame (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local v6, u7 = useState(nil);
        local v8, u9 = useState(nil);
        local _, u10 = useState(0);
        local u11, u12 = useState(false);
        useEffect(function() -- Line: 26
            -- upvalues: DeviceUtil (ref), BedwarsImageId (ref), RuntimeLib (ref), u12 (copy), StringUtil (ref), u7 (copy), u9 (copy), KnitClient (ref), u4 (copy), QueueType (ref), u10 (copy)
            if not DeviceUtil.isHoarceKat() then
                KnitClient.Controllers.LiveGamesBrowserController:searchServers({
                    skip = 0,
                    limit = 8
                }):andThen(function(p13) -- Line: 83
                    -- upvalues: BedwarsImageId (ref), u12 (ref), KnitClient (ref), u7 (ref)
                    local documents = p13.documents;

                    local function v18(u14) -- Line: 85
                        -- upvalues: BedwarsImageId (ref), u12 (ref), KnitClient (ref)
                        local v15 = {};
                        local thumbnailImage = u14.blobData.thumbnailImage;
                        v15.ThumbnailAssetId = thumbnailImage == nil and "" or thumbnailImage;
                        v15.Title = u14.blobData.mapTitle;
                        v15.Creator = u14.blobData.creator;
                        v15.ServerHealthState = u14.blobData.healthState;
                        v15.ExtraTextInfo = { " " };
                        v15.Tags = {};
                        v15.Stat = {
                            Value = tostring(u14.players),
                            Icon = BedwarsImageId.USERS_SOLID
                        };
                        v15.ActionButton = {
                            Icon = BedwarsImageId.ENTER_FILLED_ICON,

                            OnClick = function() -- Line: 104, Name: OnClick
                                -- upvalues: u12 (ref), KnitClient (ref), u14 (copy)
                                u12(true);
                                local v16 = KnitClient.Controllers.LiveGamesBrowserController:joinServer(u14.blobData.joinCode);
                                v16:andThen(function(p17) -- Line: 107
                                    -- upvalues: u12 (ref)
                                    u12(false);
                                end);

                                return v16;
                            end
                        };

                        return v15;
                    end;

                    local v19 = table.create(#documents);

                    for i, v in documents do
                        v19[i] = v18(v, i - 1, documents);
                    end;

                    u7({
                        totalListings = p13.sizeHint,
                        listings = v19
                    });
                end);
                KnitClient.Controllers.CustomMapBrowserController:getFeaturedList():andThen(function(p20) -- Line: 132
                    -- upvalues: StringUtil (ref), BedwarsImageId (ref), u12 (ref), u4 (ref), QueueType (ref), u9 (ref)
                    local documents = p20.documents;
                    local sizeHint = p20.sizeHint;

                    local function v25(u21) -- Line: 135
                        -- upvalues: StringUtil (ref), BedwarsImageId (ref), u12 (ref), u4 (ref), QueueType (ref)
                        local v22 = {};
                        local thumbnailImage = u21.metadata.thumbnailImage;
                        v22.ThumbnailAssetId = thumbnailImage == nil and "" or thumbnailImage;
                        v22.Title = u21.metadata.mapTitle;
                        v22.Creator = u21.metadata.creator;
                        v22.Tags = u21.metadata.tags;
                        v22.Stat = {
                            Value = StringUtil.formatNumberWithCommas(u21.likes),
                            Icon = BedwarsImageId.THUMBS_UP
                        };
                        v22.ActionButton = {
                            Icon = BedwarsImageId.EDIT_FILLED_ICON,

                            OnClick = function() -- Line: 152, Name: OnClick
                                -- upvalues: u12 (ref), u4 (ref), QueueType (ref), u21 (copy)
                                u12(true);
                                local v23 = u4.OnCreateMatch(QueueType.BEDWARS_TO4, u21.joinCode, {
                                    isPublishedMap = true,
                                    mapName = u21.metadata.mapTitle,
                                    mapThumbnail = u21.metadata.thumbnailImage
                                });
                                v23:andThen(function(p24) -- Line: 159
                                    -- upvalues: u12 (ref)
                                    u12(false);
                                end);

                                return v23;
                            end
                        };

                        return v22;
                    end;

                    local v26 = table.create(#documents);

                    for i, v in documents do
                        v26[i] = v25(v, i - 1, documents);
                    end;

                    u9({
                        totalListings = sizeHint,
                        listings = v26
                    });
                end);
                KnitClient.Controllers.CustomMapBrowserController:getPublishedMapCount():andThen(function(p27) -- Line: 183
                    -- upvalues: u10 (ref)
                    u10(p27);
                end);

                return;
            end;

            local v29 = {
                Title = "5v5 Castlegrounds! FFA. PRO’S ONLY",
                Creator = "Sprux",
                ThumbnailAssetId = BedwarsImageId.JUGGERNAUT_ARMOR_RENDER,
                Tags = {},
                Stat = {
                    Value = "16/200",
                    Icon = BedwarsImageId.USERS_SOLID
                },
                ExtraTextInfo = { " " },
                ActionButton = {
                    Icon = BedwarsImageId.ENTER_FILLED_ICON,
                    OnClick = RuntimeLib.async(function() -- Line: 40
                        -- upvalues: u12 (ref), RuntimeLib (ref)
                        u12(true);
                        RuntimeLib.await(task.wait(5));
                        u12(false);

                        return RuntimeLib.Promise.new(function(p28) -- Line: 44
                            return p28(true);
                        end);
                    end)
                }
            };
            local v30 = {};

            for i, v in v29 do
                v30[i] = v;
            end;

            v30.Stat = {
                Value = StringUtil.formatNumberWithCommas(1434),
                Icon = BedwarsImageId.THUMBS_UP
            };
            v30.ActionButton = {
                Icon = BedwarsImageId.EDIT_FILLED_ICON,
                OnClick = RuntimeLib.async(function() -- Line: 60
                    -- upvalues: u12 (ref), RuntimeLib (ref)
                    u12(true);
                    RuntimeLib.await(task.wait(5));
                    u12(false);

                    return RuntimeLib.Promise.new(function(p31) -- Line: 64
                        return p31(true);
                    end);
                end)
            };
            u7({
                totalListings = 134,
                listings = {
                    v29,
                    v29,
                    v29,
                    v29,
                    v29,
                    v29,
                    v29,
                    v29,
                    v29,
                    v29
                }
            });
            u9({
                totalListings = 1364,
                listings = {
                    v30,
                    v30,
                    v30,
                    v30,
                    v30,
                    v30,
                    v30,
                    v30,
                    v30,
                    v30
                }
            });
        end, {});
        local v32 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v33 = { u2.createElement(CustomMatchesCodeInputs, {
                LayoutOrder = 1,
                OnJoinMatch = u4.OnJoinMatch,

                OnCreateMatch = function(...) -- Line: 195, Name: OnCreateMatch
                    -- upvalues: KnitClient (ref)
                    return KnitClient.Controllers.LobbyCustomMatchesController:createMatch(unpack({ ... }));
                end,

                FrameProps = {
                    BackgroundTransparency = 0.65,
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(1, 0.18),
                    AutomaticSize = Enum.AutomaticSize.None,
                    BackgroundColor3 = ColorUtil.BLACK
                }
            }) };
        local _ = #v33;
        local v34 = {
            BackgroundTransparency = 0.65,
            BorderSizePixel = 0,
            LayoutOrder = 2,
            Position = UDim2.fromScale(0, 0.18),
            Size = UDim2.fromScale(1, 0.8025),
            BackgroundColor3 = ColorUtil.BLACK
        };
        local v35 = { u2.createElement(Padding, {
                Padding = {
                    Vertical = 18
                }
            }) };
        local _ = #v35;
        local v36 = {
            ScrollingFrameProps = {
                ScrollBarThickness = 0,
                ScrollBarImageTransparency = 1,
                Size = UDim2.fromScale(0.5, 1)
            }
        };
        local v37 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Center",
                Padding = UDim.new(0, 6)
            }), u2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0.05, 0),
                PaddingRight = UDim.new(0.05, 0)
            }) };
        local v38 = #v37;
        local v39 = {
            Size = UDim2.new(1, 0, 0, 14)
        };
        local v40 = { u2.createElement(
                "UIListLayout",
                {
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center",
                    SortOrder = "LayoutOrder"
                }
            ) };
        local v41 = {
            TextSize = 14,
            Size = UDim2.fromScale(0.5, 1)
        };
        local v42 = ColorUtil.richTextColor(Theme.textPrimary);
        local v43;

        if v6 == nil then
            v43 = v6;
        else
            v43 = v6.totalListings;
        end;

        local v44 = (v43 == 0 or (v43 ~= v43 or not v43)) and 0 or StringUtil.formatNumberWithCommas(v6.totalListings);
        v41.Text = "<font color=\"" .. v42 .. "\">" .. tostring(v44) .. " LIVE SERVERS</font> you can join";
        v41.TextColor3 = ColorUtil.WHITE;
        v41.RichText = true;
        v41.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold);
        v41.BackgroundTransparency = 1;
        v41.TextXAlignment = "Left";
        v41.LayoutOrder = 1;
        v40.Title = u2.createElement("TextLabel", v41);
        v40[#v40 + 1] = u2.createElement("ImageButton", {
            Size = UDim2.fromScale(0.5, 1),
            BackgroundTransparency = 1,

            [u2.Event.Activated] = function() -- Line: 276
                -- upvalues: u4 (copy), CustomMatchAppTab (ref)
                u4.SetTab(CustomMatchAppTab.GAME_BROWSER);
            end,

            LayoutOrder = 2
        }, {
            ["VIEW MORE"] = u2.createElement("TextLabel", {
                Size = UDim2.fromScale(1, 1),
                TextSize = 12,
                Text = "VIEW MORE",
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                BackgroundTransparency = 1,
                TextXAlignment = "Right",
                TextYAlignment = "Center",
                LayoutOrder = 1,

                [u2.Event.MouseEnter] = function(p45) -- Line: 291
                    -- upvalues: Theme (ref)
                    p45.TextColor3 = Theme.textPrimary;
                end,

                [u2.Event.MouseLeave] = function(p46) -- Line: 294
                    -- upvalues: ColorUtil (ref)
                    p46.TextColor3 = ColorUtil.WHITE;
                end
            })
        });
        v37.Header = u2.createElement(Empty, v39, v40);

        if v6 ~= nil then
            local listings = v6.listings;

            local function v49(p47) -- Line: 303
                -- upvalues: u11 (copy), u2 (ref), VerticalListMapListing (ref)
                local v48 = {};

                for i, v in p47 do
                    v48[i] = v;
                end;

                v48.Disabled = u11;
                v48.FrameProps = {
                    Size = UDim2.new(1, 0, 0, 42)
                };

                return u2.createElement(VerticalListMapListing, v48);
            end;

            v6 = table.create(#listings);

            for i, v in listings do
                v6[i] = v49(v, i - 1, listings);
            end;
        end;

        if v6 then
            for i, v in v6 do
                v37[v38 + i] = v;
            end;
        end;

        v35.GameBrowserList = u2.createElement(AutoCanvasScrollingFrame, v36, v37);
        local v50 = {
            ScrollingFrameProps = {
                ScrollBarThickness = 0,
                ScrollBarImageTransparency = 1,
                Position = UDim2.fromScale(0.5, 0),
                Size = UDim2.fromScale(0.5, 1)
            }
        };
        local v51 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Center",
                Padding = UDim.new(0, 6)
            }), u2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0.05, 0),
                PaddingRight = UDim.new(0.05, 0)
            }) };
        local v52 = #v51;
        local v53 = {
            Size = UDim2.new(1, 0, 0, 14)
        };
        local v54 = { u2.createElement(
                "UIListLayout",
                {
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center",
                    SortOrder = "LayoutOrder"
                }
            ) };
        local v55 = {
            TextSize = 14,
            Size = UDim2.fromScale(0.5, 1)
        };
        local v56 = ColorUtil.richTextColor(Theme.textPrimary);
        local v57;

        if v8 == nil then
            v57 = v8;
        else
            v57 = v8.totalListings;
        end;

        local v58 = (v57 == 0 or (v57 ~= v57 or not v57)) and 0 or StringUtil.formatNumberWithCommas(v8.totalListings);
        v55.Text = "<font color=\"" .. v56 .. "\">" .. tostring(v58) .. " PUBLISHED MAPS</font> from the community";
        v55.TextColor3 = ColorUtil.WHITE;
        v55.RichText = true;
        v55.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold);
        v55.BackgroundTransparency = 1;
        v55.TextXAlignment = "Left";
        v55.LayoutOrder = 1;
        v54.Title = u2.createElement("TextLabel", v55);
        v54[#v54 + 1] = u2.createElement("ImageButton", {
            Size = UDim2.fromScale(0.5, 1),
            BackgroundTransparency = 1,

            [u2.Event.Activated] = function() -- Line: 379
                -- upvalues: u4 (copy), CustomMatchAppTab (ref)
                u4.SetTab(CustomMatchAppTab.MAP_BROWSER);
            end,

            LayoutOrder = 2
        }, {
            ["VIEW MORE"] = u2.createElement("TextLabel", {
                Size = UDim2.fromScale(1, 1),
                TextSize = 12,
                Text = "VIEW MORE",
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                BackgroundTransparency = 1,
                TextXAlignment = "Right",
                TextYAlignment = "Center",
                LayoutOrder = 1,

                [u2.Event.MouseEnter] = function(p59) -- Line: 394
                    -- upvalues: Theme (ref)
                    p59.TextColor3 = Theme.textPrimary;
                end,

                [u2.Event.MouseLeave] = function(p60) -- Line: 397
                    -- upvalues: ColorUtil (ref)
                    p60.TextColor3 = ColorUtil.WHITE;
                end
            })
        });
        v51.Header = u2.createElement(Empty, v53, v54);

        if v8 ~= nil then
            local listings = v8.listings;

            local function v63(p61) -- Line: 406
                -- upvalues: u11 (copy), u2 (ref), VerticalListMapListing (ref)
                local v62 = {};

                for i, v in p61 do
                    v62[i] = v;
                end;

                v62.Disabled = u11;
                v62.FrameProps = {
                    Size = UDim2.new(1, 0, 0, 42)
                };

                return u2.createElement(VerticalListMapListing, v62);
            end;

            v8 = table.create(#listings);

            for i, v in listings do
                v8[i] = v63(v, i - 1, listings);
            end;
        end;

        if v8 then
            for i, v in v8 do
                v51[v52 + i] = v;
            end;
        end;

        v35.MapBrowserList = u2.createElement(AutoCanvasScrollingFrame, v50, v51);
        v33.ListingsContainer = u2.createElement("Frame", v34, v35);

        return u2.createElement(Empty, v32, v33);
    end)
};