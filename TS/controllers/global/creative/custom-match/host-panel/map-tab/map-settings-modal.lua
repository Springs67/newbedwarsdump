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
local ToggleButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "button-group", "toggle-button").ToggleButton;
local ToggleButtonGroup = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "button-group", "toggle-button-group").ToggleButtonGroup;
local MapSaveUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "map-save-util").MapSaveUtil;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v44 = v3.new(u2)(function(u5, p6) -- Line: 23
    -- upvalues: KnitClient (copy), Flamework (copy), u2 (copy), DarkBackground (copy), ScaleComponent (copy), ColorUtil (copy), Theme (copy), Empty (copy), TextInputComponent (copy), MapSaveUtil (copy), MapBrowserTagsGrid (copy), ToggleButtonGroup (copy), ToggleButton (copy), DividerComponent (copy), ButtonComponent (copy), WidgetComponent (copy), SlideIn (copy)
    local useState = p6.useState;
    local v7, u8 = useState(false);
    local v9 = {};

    for i, v in u5.MapSaveDisplayInfo do
        v9[i] = v;
    end;

    local u10, u11 = useState(v9);

    local function v13() -- Line: 31
        -- upvalues: u8 (copy), KnitClient (ref), u5 (copy), u10 (copy), Flamework (ref)
        u8(true);
        KnitClient.Controllers.CustomMatchController:updateMapSaveSettings(u5.MapSaveDisplayInfo.code, u10):andThen(function(p12) -- Line: 34
            -- upvalues: u8 (ref), Flamework (ref)
            u8(false);

            if p12.success then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                    message = "Succesfully saved map settings"
                });

                return;
            end;

            Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                message = "Failed to save map settings"
            });
        end);
    end;

    local v14 = u10.image == nil and true or u10.image == "";
    local v15 = {
        ResetOnSpawn = false,
        DisplayOrder = 1000
    };
    local v16 = { u2.createElement(DarkBackground, {
            AppId = "MapSettingsModal"
        }) };
    local v17 = {};
    local v18 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(500, 0)
    };
    local v19 = { u2.createElement(ScaleComponent, {
            MaximumSize = Vector2.new(700, 840),
            ScreenPadding = Vector2.new(12, 12)
        }) };
    local v20 = {
        AppId = "MapSettingsModal",
        AutomaticContainerSize = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        Title = "Map Settings: <font color=\"" .. ColorUtil.richTextColor(Theme.mcAqua) .. "\">" .. u5.MapSaveDisplayInfo.name .. "</font>",

        OnClose = function() -- Line: 81, Name: OnClose
            -- upvalues: Flamework (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("MapSettingsModal");
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

                OnFocusLost = function(p21) -- Line: 115, Name: OnFocusLost
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
    local v24 = #v23;
    local v25 = {
        AutomaticSize = "Y",
        LayoutOrder = 2,
        Size = UDim2.fromScale(1, 0)
    };
    local v26 = {};
    local v27 = #v26;
    local v28 = {
        Size = UDim2.new(0.5, 0, 0, 36)
    };
    local v29 = { u2.createElement("TextLabel", {
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
    local v30 = {};
    local v31 = {
        Position = UDim2.fromOffset(0, 22),
        Size = UDim2.fromOffset(140, 28)
    };
    local image = u10.image;

    if image ~= nil then
        image = string.gsub(image, "rbxassetid://", "");
    end;

    v31.Text = image;
    v31.PlaceholderText = "14181700012";
    v31.ClearTextOnFocus = false;
    v31.TextXAlignment = Enum.TextXAlignment.Left;
    v30.TextBox = v31;

    function v30.OnFocusLost(p32) -- Line: 174
        -- upvalues: u10 (copy), u11 (copy)
        local v33 = {};

        for i, v in u10 do
            v33[i] = v;
        end;

        v33.image = p32;

        return u11(v33);
    end;

    v30.MaxCharacters = 20;
    v29[#v29 + 1] = u2.createElement(TextInputComponent, v30, { u2.createElement("UIPadding", {
            PaddingTop = UDim.new(0.05, 0),
            PaddingBottom = UDim.new(0.05, 0),
            PaddingLeft = UDim.new(0.05, 0),
            PaddingRight = UDim.new(0.05, 0)
        }) });
    v26[v27 + 1] = u2.createElement(Empty, v28, v29);
    local v34 = {
        Size = UDim2.new(0.5, 0, 0, 42),
        Position = UDim2.new(0, 150, 1, 0),
        AnchorPoint = Vector2.new(0, 1)
    };
    local v35;

    if v14 then
        v35 = "";
    else
        local image2 = u10.image;

        if image2 ~= nil then
            image2 = string.gsub(image2, "rbxassetid://", "");
        end;

        v35 = "rbxassetid://" .. tostring(image2);
    end;

    v34.Image = v35;
    v34.BackgroundColor3 = Theme.backgroundTertiary;
    v34.BackgroundTransparency = 0;
    v34.BorderSizePixel = 0;
    v26[v27 + 2] = u2.createElement("ImageLabel", v34, { u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 3)
        }), u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1
        }) });
    v23.MapThumbnailField = u2.createElement(Empty, v25, v26);
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
                ClearTextOnFocus = false,
                TextWrapped = true,
                Position = UDim2.fromOffset(0, 22),
                Size = UDim2.new(0.8, 0, 0, 60),
                Text = u5.MapSaveDisplayInfo.description,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top
            },

            OnFocusLost = function(p36) -- Line: 247, Name: OnFocusLost
                -- upvalues: u10 (copy), u11 (copy)
                local v37 = {};

                for i, v in u10 do
                    v37[i] = v;
                end;

                v37.description = p36;

                return u11(v37);
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
                Text = "<b>Tags</b> <font transparency=\".3\">(Max " .. tostring(MapSaveUtil.MAP_MAX_TAGS) .. ")</font>",
                TextXAlignment = Enum.TextXAlignment.Left,
                TextColor3 = Color3.new(1, 1, 1),
                Font = Enum.Font.Roboto
            }) }), u2.createElement(MapBrowserTagsGrid, {
            DefaultTags = u10.tags or {},

            OnChange = function(p38, p39, p40) -- Line: 287, Name: OnChange
                -- upvalues: u10 (copy), u11 (copy)
                local v41 = {};

                for i, v in u10 do
                    v41[i] = v;
                end;

                v41.tags = p40;
                u11(v41);
            end,

            FrameProps = {
                Size = UDim2.new(1, 0, 0, 24),
                Position = UDim2.new(0, 0, 0, 20)
            }
        }) });
    v23[v24 + 1] = u2.createElement(Empty, {
        AutomaticSize = "Y",
        LayoutOrder = 5,
        Size = UDim2.fromScale(1, 0)
    }, { u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            Text = "<b>Copylock Map</b> <font transparency=\".3\">(Locking the map will prevent players from copying the map)</font>",
            RichText = true,
            TextWrapped = true,
            TextTransparency = 0.1,
            TextSize = 14,
            Size = UDim2.new(1, 0, 0, 14),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextColor3 = Color3.new(1, 1, 1),
            Font = Enum.Font.Roboto
        }), u2.createElement(ToggleButtonGroup, {
            Value = u10.copylock and "locked" or "copyable",

            OnChange = function(p42) -- Line: 320, Name: OnChange
                -- upvalues: u10 (copy), u11 (copy)
                local v43 = {};

                for i, v in u10 do
                    v43[i] = v;
                end;

                v43.copylock = p42 == "locked";
                u11(v43);
            end,

            FrameProps = {
                Size = UDim2.fromOffset(130, 28),
                Position = UDim2.fromOffset(0, 22)
            }
        }, { u2.createElement(ToggleButton, {
                Value = "copyable",
                Text = "Copyable"
            }), u2.createElement(ToggleButton, {
                Value = "locked",
                Text = "Locked"
            }) }) });
    v23[v24 + 2] = u2.createElement(DividerComponent, {
        LayoutOrder = 6
    });
    v23.ActionsList = u2.createElement(Empty, {
        AutomaticSize = "Y",
        LayoutOrder = 7,
        Size = UDim2.new(1, 0, 0, 0)
    }, { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8)
        }), u2.createElement(ButtonComponent, {
            Text = "Save Settings",
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.new(1, 0, 0, 22),
            OnClick = v13,
            Loading = v7
        }) });
    v19[#v19 + 1] = u2.createElement(WidgetComponent, v20, v23);
    v17[#v17 + 1] = u2.createElement("Frame", v18, v19);
    v16[#v16 + 1] = u2.createElement(SlideIn, {}, v17);

    return u2.createElement("ScreenGui", v15, v16);
end);

return {
    MapSettingsModal = v4.connect(function(p45, p46) -- Line: 372
        local v47 = {};

        for i, v in p46 do
            v47[i] = v;
        end;

        return v47;
    end)(v44)
};