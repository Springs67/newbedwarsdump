-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local CircularSpinner = v1.CircularSpinner;
local CodesUtil = v1.CodesUtil;
local ColorUtil = v1.ColorUtil;
local DividerComponent = v1.DividerComponent;
local Empty = v1.Empty;
local GetTarmacAsset = v1.GetTarmacAsset;
local Padding = v1.Padding;
local SoundManager = v1.SoundManager;
local StringUtil = v1.StringUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v61 = v3.new(u2)(function(u5, p6) -- Line: 22
    -- upvalues: ClientStore (copy), KnitClient (copy), SoundManager (copy), GameSound (copy), GetTarmacAsset (copy), u2 (copy), ColorUtil (copy), Padding (copy), Empty (copy), StringUtil (copy), Theme (copy), BedwarsImageId (copy), DividerComponent (copy), CodesUtil (copy), QueueType (copy), CircularSpinner (copy)
    local useBinding = p6.useBinding;
    local useState = p6.useState;
    local useEffect = p6.useEffect;
    local u7, u8 = useState(false);
    local v9, _ = useBinding(ClientStore:getState().Lobby.mapBrowserProfileData.ratings[u5.Map.mapId]);
    local u10, u11 = useState(ClientStore:getState().Lobby.mapBrowserProfileData.ratings[u5.Map.mapId]);
    local u12, u13 = useState("");
    local Map = u5.Map;
    local likes = Map.likes;

    if v9:getValue() and v9:getValue() == "like" or u10 ~= "like" then
        if v9:getValue() == "like" and (u10 == "dislike" or u10 == "unset") then
            likes = likes - 1;
        end;
    else
        likes = likes + 1;
    end;

    local function _(p14) -- Line: 43
        -- upvalues: KnitClient (ref), u11 (copy), u13 (copy)
        local v15 = KnitClient.Controllers.CustomMapBrowserController:userRateMap(p14);

        if v15.success then
            u11(p14.rating);

            return;
        end;

        u13(v15.errorMessage);
    end;

    useEffect(function() -- Line: 51
        -- upvalues: u12 (copy), SoundManager (ref), GameSound (ref), u13 (copy)
        local u16 = true;

        if u12 ~= "" then
            SoundManager:playSound(GameSound.ERROR_NOTIFICATION);
            task.delay(3, function() -- Line: 55
                -- upvalues: u16 (ref), u13 (ref)
                if u16 then
                    u13("");
                end;
            end);
        end;

        return function() -- Line: 61
            -- upvalues: u16 (ref)
            u16 = false;
        end;
    end, { u12 });
    local thumbnailImage = u5.Map.metadata.thumbnailImage;
    local v17;

    if thumbnailImage == "" or not thumbnailImage then
        v17 = GetTarmacAsset("NoImage").Image;
    else
        v17 = "rbxassetid://" .. string.gsub(u5.Map.metadata.thumbnailImage, "rbxassetid://", "");
    end;

    local v18 = u5.Map.featured == true;
    local v19 = {
        BorderSizePixel = 0,
        ZIndex = 1,
        Size = UDim2.new(0.98, 0, 0, 82),
        BackgroundColor3 = Color3.fromRGB(47, 49, 80),
        LayoutOrder = u5.LayoutOrder
    };
    local v20 = {
        u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 6)
        }),
        u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Left",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.03, 0)
        }),
        MapImage = u2.createElement("ImageLabel", {
            ScaleType = "Crop",
            BackgroundTransparency = 0.3,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 1),
            SizeConstraint = Enum.SizeConstraint.RelativeYY,
            Image = v17,
            BackgroundColor3 = ColorUtil.BLACK
        }, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }) })
    };
    local _ = #v20;
    local v21 = {
        LayoutOrder = 2,
        Size = UDim2.fromScale(0.6, 1)
    };
    local v22 = { u2.createElement(Padding, {
            Padding = {
                Vertical = 10
            }
        }), u2.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            VerticalAlignment = "Center",
            Padding = UDim.new(0.08, 0)
        }) };
    local _ = #v22;
    local v23 = {
        LayoutOrder = 1,
        Size = UDim2.fromScale(1, 0.6)
    };
    local v24 = {
        u2.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            VerticalAlignment = "Center",
            Padding = UDim.new(0.05, 0)
        }),
        MapName = u2.createElement("TextLabel", {
            TextXAlignment = "Left",
            TextScaled = true,
            AutoLocalize = false,
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.35),
            Text = Map.metadata.mapTitle,
            FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
            TextColor3 = ColorUtil.WHITE
        }),
        SubTitleRow = u2.createElement(Empty, {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.275)
        }, {
            Subtitle = u2.createElement("TextLabel", {
                TextXAlignment = "Left",
                AutomaticSize = "X",
                TextSize = 10,
                TextTransparency = 0.3,
                BackgroundTransparency = 1,
                AutoLocalize = false,
                Size = UDim2.fromScale(0, 1),
                Text = "By: @" .. Map.metadata.creator .. "  |  " .. StringUtil.formatNumberWithCommas(Map.joins) .. " joins  ",
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextColor3 = ColorUtil.WHITE
            })
        })
    };
    local _ = #v24;
    local tags = Map.metadata.tags;

    local function v26(p25) -- Line: 162
        -- upvalues: u2 (ref), ColorUtil (ref), Padding (ref)
        return u2.createFragment({
            TagPill = u2.createElement("Frame", {
                AutomaticSize = "X",
                BackgroundTransparency = 0.3,
                Size = UDim2.fromScale(0, 1),
                BackgroundColor3 = ColorUtil.BLACK
            }, {
                u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.5, 0)
                }),
                u2.createElement(Padding, {
                    Padding = {
                        Vertical = 3,
                        Horizontal = 6
                    }
                }),
                Tag = u2.createElement("TextLabel", {
                    AutomaticSize = "X",
                    TextSize = 7,
                    RichText = true,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0, 1),
                    Text = string.upper(p25),
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    TextColor3 = ColorUtil.WHITE
                })
            })
        });
    end;

    local v27 = table.create(#tags);

    for i, v in tags do
        v27[i] = v26(v, i - 1, tags);
    end;

    local v28 = {
        LayoutOrder = 3,
        BackgroundTransparency = 0,
        Size = UDim2.fromScale(1, 0.275)
    };
    local v29 = { u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Left",
            VerticalAlignment = "Center",
            Padding = UDim.new(0.005, 0)
        }) };
    local v30 = #v29;

    for i, v in v27 do
        v29[v30 + i] = v;
    end;

    v24.Tags = u2.createElement(Empty, v28, v29);
    v22.MapInfoHeader = u2.createElement(Empty, v23, v24);
    v22.MapDescription = u2.createElement("TextLabel", {
        Font = "Roboto",
        TextXAlignment = "Left",
        TextYAlignment = "Top",
        TextSize = 10,
        TextWrapped = true,
        TextTruncate = "AtEnd",
        AutoLocalize = false,
        TextTransparency = 0.3,
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        Size = UDim2.fromScale(1, 0.32),
        Text = Map.metadata.mapDescription,
        TextColor3 = ColorUtil.WHITE
    });
    v20.MapInfo = u2.createElement(Empty, v21, v22);
    local v31;

    if u12 == "" or not u12 then
        local v32 = {
            LayoutOrder = 1,
            BackgroundTransparency = 0,
            Size = UDim2.fromScale(1, 0.3),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        };
        local v33 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Right",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }) };
        local v34 = #v33;

        if v18 then
            v18 = u2.createFragment({
                FeaturedStar = u2.createElement("ImageLabel", {
                    Image = "rbxassetid://17351820249",
                    ScaleType = "Fit",
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0.85, 0.85),
                    SizeConstraint = Enum.SizeConstraint.RelativeYY,
                    ImageColor3 = Color3.fromRGB(255, 184, 38),
                    AnchorPoint = Vector2.new(0, 0)
                })
            });
        end;

        if v18 then
            v33[v34 + 1] = v18;
        end;

        local createElement = u2.createElement;
        local v35 = {
            Size = UDim2.fromScale(1, 0.8),
            SizeConstraint = "RelativeYY",
            Image = BedwarsImageId.THUMBS_UP
        };
        local v36;

        if u10 == "like" then
            v36 = Color3.fromRGB(113, 255, 110);
        else
            v36 = Color3.fromRGB(199, 199, 199);
        end;

        v35.ImageColor3 = v36;
        v35.BackgroundTransparency = 1;

        v35[u2.Event.Activated] = function() -- Line: 296
            -- upvalues: u10 (copy), Map (copy), KnitClient (ref), u11 (copy), u13 (copy)
            if u10 == "like" then
                local v37 = {
                    rating = "unset",
                    mapId = Map.mapId
                };
                local v38 = KnitClient.Controllers.CustomMapBrowserController:userRateMap(v37);

                if v38.success then
                    u11(v37.rating);

                    return;
                end;

                u13(v38.errorMessage);

                return;
            end;

            local v39 = {
                rating = "like",
                mapId = Map.mapId
            };
            local v40 = KnitClient.Controllers.CustomMapBrowserController:userRateMap(v39);

            if v40.success then
                u11(v39.rating);

                return;
            end;

            u13(v40.errorMessage);
        end;

        v35[u2.Event.MouseEnter] = function(p41) -- Line: 309
            -- upvalues: u10 (copy)
            local v42;

            if u10 == "like" then
                v42 = Color3.fromRGB(113, 255, 110);
            else
                v42 = Color3.fromRGB(255, 255, 255);
            end;

            p41.ImageColor3 = v42;
        end;

        v35[u2.Event.MouseLeave] = function(p43) -- Line: 312
            -- upvalues: u10 (copy)
            local v44;

            if u10 == "like" then
                v44 = Color3.fromRGB(113, 255, 110);
            else
                v44 = Color3.fromRGB(199, 199, 199);
            end;

            p43.ImageColor3 = v44;
        end;

        v35.LayoutOrder = 2;
        v33.ThumbsUp = createElement("ImageButton", v35, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
        v33.TotalLikes = u2.createElement("TextLabel", {
            AutomaticSize = "X",
            TextScaled = true,
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.fromScale(0, 0.9),
            FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
            Text = StringUtil.formatNumberWithCommas(likes),
            TextColor3 = ColorUtil.WHITE
        });
        v33[#v33 + 1] = u2.createElement(DividerComponent, {
            Direction = "Y",
            LayoutOrder = 3,
            Size = UDim2.new(0, 1, 0.8, 0)
        });
        local createElement2 = u2.createElement;
        local v45 = {
            Size = UDim2.fromScale(1, 0.8),
            SizeConstraint = "RelativeYY",
            Image = BedwarsImageId.THUMBS_DOWN
        };
        local v46;

        if u10 == "dislike" then
            v46 = Color3.fromRGB(255, 121, 136);
        else
            v46 = Color3.fromRGB(199, 199, 199);
        end;

        v45.ImageColor3 = v46;
        v45.BackgroundTransparency = 1;

        v45[u2.Event.Activated] = function() -- Line: 342
            -- upvalues: u10 (copy), Map (copy), KnitClient (ref), u11 (copy), u13 (copy)
            if u10 == "dislike" then
                local v47 = {
                    rating = "unset",
                    mapId = Map.mapId
                };
                local v48 = KnitClient.Controllers.CustomMapBrowserController:userRateMap(v47);

                if v48.success then
                    u11(v47.rating);

                    return;
                end;

                u13(v48.errorMessage);

                return;
            end;

            local v49 = {
                rating = "dislike",
                mapId = Map.mapId
            };
            local v50 = KnitClient.Controllers.CustomMapBrowserController:userRateMap(v49);

            if v50.success then
                u11(v49.rating);

                return;
            end;

            u13(v50.errorMessage);
        end;

        v45[u2.Event.MouseEnter] = function(p51) -- Line: 355
            -- upvalues: u10 (copy)
            local v52;

            if u10 == "dislike" then
                v52 = Color3.fromRGB(255, 121, 136);
            else
                v52 = Color3.fromRGB(255, 255, 255);
            end;

            p51.ImageColor3 = v52;
        end;

        v45[u2.Event.MouseLeave] = function(p53) -- Line: 358
            -- upvalues: u10 (copy)
            local v54;

            if u10 == "dislike" then
                v54 = Color3.fromRGB(255, 121, 136);
            else
                v54 = Color3.fromRGB(199, 199, 199);
            end;

            p53.ImageColor3 = v54;
        end;

        v45.LayoutOrder = 4;
        v33.ThumbsDown = createElement2("ImageButton", v45, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
        v31 = u2.createFragment({
            RatingsContainer = u2.createElement(Empty, v32, v33)
        });
    else
        v31 = u2.createFragment({
            RatingsContainer = u2.createElement(Empty, {
                LayoutOrder = 1,
                BackgroundTransparency = 0,
                Size = UDim2.fromScale(1, 0.3),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            }, { u2.createElement("TextLabel", {
                    TextXAlignment = "Right",
                    TextYAlignment = "Center",
                    TextScaled = true,
                    TextWrapped = true,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1.6, 0.8),
                    AnchorPoint = Vector2.new(1, 0),
                    Position = UDim2.fromScale(1, 0),
                    Text = u12,
                    TextColor3 = Theme.backgroundError,
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                }) })
        });
    end;

    local v55 = {
        LayoutOrder = 3,
        Size = UDim2.fromScale(0.2, 1)
    };
    local v56 = {
        u2.createElement(Padding, {
            Padding = {
                Vertical = 10,
                Right = 8
            }
        }),
        u2.createElement("UIListLayout", {
            FillDirection = "Vertical",
            VerticalAlignment = "Center",
            HorizontalAlignment = "Right",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.1, 0)
        }),
        [#v56 + 1] = v31
    };
    local _ = #v56;
    v56.MapJoinCode = u2.createElement("Frame", {
        BorderSizePixel = 0,
        LayoutOrder = 2,
        Size = UDim2.fromScale(1, 0.3),
        BackgroundColor3 = Color3.fromRGB(94, 98, 186)
    }, {
        u2.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        }),
        MapCode = u2.createElement("TextBox", {
            TextScaled = true,
            TextXAlignment = "Center",
            BackgroundTransparency = 1,
            ClearTextOnFocus = false,
            TextEditable = false,
            AutoLocalize = false,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.8, 0.7),
            Text = CodesUtil.displayCode(Map.joinCode, "-", 4),
            Font = Enum.Font.GothamBold,
            TextColor3 = Theme.textPrimary
        })
    });
    local createElement = u2.createElement;
    local v57 = {
        Size = UDim2.fromScale(1, 0.3),
        BackgroundColor3 = Color3.fromRGB(60, 156, 107),
        BackgroundTransparency = u7 and 0.3 or 0,
        BorderSizePixel = 0,
        LayoutOrder = 2,

        [u2.Event.Activated] = function() -- Line: 423
            -- upvalues: u7 (copy), u8 (copy), KnitClient (ref), QueueType (ref), u5 (copy)
            if u7 then
                return nil;
            end;

            u8(true);

            if not KnitClient.Controllers.LobbyCustomMatchesController:createMatch(QueueType.BEDWARS_TO4, u5.Map.joinCode, {
                isPublishedMap = true
            }) then
                u8(false);
            end;
        end
    };
    local v58 = {};
    local v59 = u2.createElement("UICorner", {
        CornerRadius = UDim.new(0.5, 0)
    });
    local v60;

    if u7 then
        v60 = u2.createElement(CircularSpinner, {
            Size = UDim2.fromScale(0.8, 0.8),
            Position = UDim2.new(0.5, 0, 0.5, 0),
            AnchorPoint = Vector2.new(0.5, 0.5)
        }, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
    else
        v60 = u2.createFragment({
            Button = u2.createElement("TextLabel", {
                Text = "CREATE",
                TextScaled = true,
                TextXAlignment = "Center",
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(0.8, 0.7),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextColor3 = Color3.fromRGB(99, 255, 143)
            })
        });
    end;

    v58[1], v58[2] = v59, v60;
    v56.HostMatchButton = createElement("ImageButton", v57, v58);
    v20.Actions = u2.createElement(Empty, v55, v56);

    return u2.createFragment({
        [u5.Map.mapId .. "_PublishedMapCard"] = u2.createElement("Frame", v19, v20)
    });
end);

return {
    PublishedMapCard = v4.connect(function(p62, p63) -- Line: 467
        local v64 = {};

        for i, v in p63 do
            v64[i] = v;
        end;

        return v64;
    end)(v61)
};