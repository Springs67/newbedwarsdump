-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local DarkBackground = v1.DarkBackground;
local DividerComponent = v1.DividerComponent;
local Empty = v1.Empty;
local ScaleComponent = v1.ScaleComponent;
local SlideIn = v1.SlideIn;
local TextInputComponent = v1.TextInputComponent;
local WidgetComponent = v1.WidgetComponent;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local MapBrowserTagsGrid = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lobby", "custom-matches", "ui", "tabs", "map-browser", "map-browser-tags-grid").MapBrowserTagsGrid;
local MapSaveUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "map-save-util").MapSaveUtil;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v41 = v3.new(u2)(function(u5, p6) -- Line: 21
    -- upvalues: KnitClient (copy), Flamework (copy), u2 (copy), DarkBackground (copy), ScaleComponent (copy), ColorUtil (copy), Theme (copy), Empty (copy), TextInputComponent (copy), MapSaveUtil (copy), MapBrowserTagsGrid (copy), DividerComponent (copy), ButtonComponent (copy), WidgetComponent (copy), SlideIn (copy)
    local useState = p6.useState;
    local v7, u8 = useState(false);
    local v9 = {};

    for i, v in u5.MapSaveDisplayInfo do
        v9[i] = v;
    end;

    local u10, u11 = useState(v9);

    local function v13() -- Line: 29
        -- upvalues: u8 (copy), KnitClient (ref), u5 (copy), u10 (copy), Flamework (ref)
        u8(true);
        KnitClient.Controllers.CustomMapBrowserController:publishMap(u5.MapSaveDisplayInfo.code, {
            mapTitle = u10.name,
            mapDescription = u10.description,
            thumbnailImage = u10.image,
            tags = u10.tags
        }):andThen(function(p12) -- Line: 37
            -- upvalues: u8 (ref), Flamework (ref)
            u8(false);

            if p12 then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                    message = "Succesfully published map"
                });

                return;
            end;

            Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                message = "Failed to publish map"
            });
        end);
    end;

    local v14 = u10.image == nil and true or u10.image == "";
    local v15 = {
        ResetOnSpawn = false,
        DisplayOrder = 1000
    };
    local v16 = { u2.createElement(DarkBackground, {
            AppId = "PublishMapModal"
        }) };
    local v17 = {};
    local v18 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(900, 600)
    };
    local v19 = { u2.createElement(ScaleComponent, {
            MaximumSize = Vector2.new(700, 640),
            ScreenPadding = Vector2.new(24, 24)
        }) };
    local v20 = {
        AppId = "PublishMapModal",
        AutomaticContainerSize = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        Title = "Publish Map: <font color=\"" .. ColorUtil.richTextColor(Theme.mcAqua) .. "\">" .. u5.MapSaveDisplayInfo.name .. "</font>",

        OnClose = function() -- Line: 84, Name: OnClose
            -- upvalues: Flamework (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("PublishMapModal");
        end
    };
    local v23 = {
        u2.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 12)
        }),
        MapNameField = u2.createElement(Empty, {
            AutomaticSize = "Y",
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0)
        }, { u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                Text = "<b>Map Name</b>",
                RichText = true,
                TextTransparency = 0.1,
                TextSize = 14,
                Size = UDim2.new(1, 0, 0, 14),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextColor3 = Color3.new(1, 1, 1),
                Font = Enum.Font.Roboto
            }), u2.createElement(TextInputComponent, {
                TextBox = {
                    ClearTextOnFocus = false,
                    Position = UDim2.fromOffset(0, 17),
                    Size = UDim2.fromOffset(140, 28),
                    Text = u10.name,
                    TextXAlignment = Enum.TextXAlignment.Left
                },

                OnFocusLost = function(p21) -- Line: 118, Name: OnFocusLost
                    -- upvalues: u10 (copy), u11 (copy)
                    local v22 = {};

                    for i, v in u10 do
                        v22[i] = v;
                    end;

                    v22.name = p21;

                    return u11(v22);
                end,

                MaxCharacters = MapSaveUtil.MAP_NAME_MAX_CHARS
            }, { u2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0.05, 0),
                    PaddingBottom = UDim.new(0.05, 0),
                    PaddingLeft = UDim.new(0.05, 0),
                    PaddingRight = UDim.new(0.05, 0)
                }) }) })
    };
    local v24 = {
        AutomaticSize = "Y",
        LayoutOrder = 2,
        Size = UDim2.fromScale(1, 0)
    };
    local v25 = {};
    local v26 = #v25;
    local v27 = {
        Size = UDim2.new(0.5, 0, 0, 36)
    };
    local v28 = { u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            Text = "<b>Thumbnail Asset Id</b>",
            RichText = true,
            TextTransparency = 0.1,
            TextSize = 14,
            Size = UDim2.new(1, 0, 0, 14),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextColor3 = Color3.new(1, 1, 1),
            Font = Enum.Font.Roboto
        }) };
    local v29 = {};
    local v30 = {
        Position = UDim2.fromOffset(0, 22),
        Size = UDim2.fromOffset(140, 28)
    };
    local image = u10.image;

    if image ~= nil then
        image = string.gsub(image, "rbxassetid://", "");
    end;

    v30.Text = image;
    v30.PlaceholderText = "14181700012";
    v30.ClearTextOnFocus = false;
    v30.TextXAlignment = Enum.TextXAlignment.Left;
    v29.TextBox = v30;

    function v29.OnFocusLost(p31) -- Line: 177
        -- upvalues: u10 (copy), u11 (copy)
        local v32 = {};

        for i, v in u10 do
            v32[i] = v;
        end;

        v32.image = p31;

        return u11(v32);
    end;

    v29.MaxCharacters = 20;
    v28[#v28 + 1] = u2.createElement(TextInputComponent, v29, { u2.createElement("UIPadding", {
            PaddingTop = UDim.new(0.05, 0),
            PaddingBottom = UDim.new(0.05, 0),
            PaddingLeft = UDim.new(0.05, 0),
            PaddingRight = UDim.new(0.05, 0)
        }) });
    v25[v26 + 1] = u2.createElement(Empty, v27, v28);
    local v33 = {
        Size = UDim2.new(0.5, 0, 0, 42),
        Position = UDim2.new(0, 150, 1, 0),
        AnchorPoint = Vector2.new(0, 1)
    };
    local v34;

    if v14 then
        v34 = "";
    else
        local image2 = u10.image;

        if image2 ~= nil then
            image2 = string.gsub(image2, "rbxassetid://", "");
        end;

        v34 = "rbxassetid://" .. tostring(image2);
    end;

    v33.Image = v34;
    v33.BackgroundColor3 = Theme.backgroundTertiary;
    v33.BackgroundTransparency = 0;
    v33.BorderSizePixel = 0;
    v25[v26 + 2] = u2.createElement("ImageLabel", v33, { u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 3)
        }), u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1
        }) });
    v23.MapThumbnailField = u2.createElement(Empty, v24, v25);
    v23.MapDescriptionField = u2.createElement(Empty, {
        AutomaticSize = "Y",
        LayoutOrder = 3,
        Size = UDim2.fromScale(1, 0)
    }, { u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            Text = "<b>Description</b>",
            RichText = true,
            TextTransparency = 0.1,
            TextSize = 14,
            Size = UDim2.new(1, 0, 0, 14),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextColor3 = Color3.new(1, 1, 1),
            Font = Enum.Font.Roboto
        }), u2.createElement(TextInputComponent, {
            TextBox = {
                PlaceholderText = "Introduce your map to the public!",
                TextWrapped = true,
                Position = UDim2.fromOffset(0, 22),
                Size = UDim2.new(0.8, 0, 0, 60),
                Text = u5.MapSaveDisplayInfo.description,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top
            },

            OnFocusLost = function(p35) -- Line: 249, Name: OnFocusLost
                -- upvalues: u10 (copy), u11 (copy)
                local v36 = {};

                for i, v in u10 do
                    v36[i] = v;
                end;

                v36.description = p35;

                return u11(v36);
            end,

            MaxCharacters = MapSaveUtil.MAP_DESCRIPTION_MAX_CHARS
        }, { u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0.1, 0),
                PaddingBottom = UDim.new(0.1, 0),
                PaddingLeft = UDim.new(0.02, 0),
                PaddingRight = UDim.new(0.02, 0)
            }) }) });
    v23.MapTags = u2.createElement(Empty, {
        AutomaticSize = "Y",
        LayoutOrder = 4,
        Size = UDim2.fromScale(1, 0)
    }, { u2.createElement(Empty, {
            Size = UDim2.new(0.5, 0, 0, 36)
        }, { u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                RichText = true,
                TextTransparency = 0.1,
                TextSize = 14,
                Size = UDim2.new(1, 0, 0, 14),
                Text = "<b>Tags (Max " .. tostring(MapSaveUtil.MAP_MAX_TAGS) .. ")</b>",
                TextXAlignment = Enum.TextXAlignment.Left,
                TextColor3 = Color3.new(1, 1, 1),
                Font = Enum.Font.Roboto
            }) }), u2.createElement(MapBrowserTagsGrid, {
            DefaultTags = u10.tags or {},

            OnChange = function(p37, p38, p39) -- Line: 289, Name: OnChange
                -- upvalues: u10 (copy), u11 (copy)
                local v40 = {};

                for i, v in u10 do
                    v40[i] = v;
                end;

                v40.tags = p39;
                u11(v40);
            end,

            FrameProps = {
                Size = UDim2.new(1, 0, 0, 24),
                Position = UDim2.new(0, 0, 0, 20)
            }
        }) });
    v23[#v23 + 1] = u2.createElement(DividerComponent, {
        LayoutOrder = 5
    });
    v23.ActionsList = u2.createElement(Empty, {
        LayoutOrder = 6,
        Size = UDim2.new(1, 0, 0, 50)
    }, { u2.createElement("TextLabel", {
            Text = "Publishing a map will let other players search and play your map! Published maps are a different copy of your map save.",
            TextTransparency = 0.3,
            TextWrapped = true,
            TextSize = 14,
            BackgroundTransparency = 1,
            Size = UDim2.new(0.7, 0, 0, 44),
            TextXAlignment = Enum.TextXAlignment.Center,
            TextColor3 = Color3.new(1, 1, 1),
            FontFace = Font.fromName("Roboto", Enum.FontWeight.Medium)
        }), u2.createElement(ButtonComponent, {
            Text = "Publish Map",
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, 0, 0.5, 0),
            OnClick = v13,
            BackgroundColor3 = Theme.backgroundSuccess,
            Loading = v7
        }) });
    v19[#v19 + 1] = u2.createElement(WidgetComponent, v20, v23);
    v17[#v17 + 1] = u2.createElement("Frame", v18, v19);
    v16[#v16 + 1] = u2.createElement(SlideIn, {}, v17);

    return u2.createElement("ScreenGui", v15, v16);
end);

return {
    MapPublishForm = v4.connect(function(p42, p43) -- Line: 336
        local v44 = {};

        for i, v in p43 do
            v44[i] = v;
        end;

        return v44;
    end)(v41)
};