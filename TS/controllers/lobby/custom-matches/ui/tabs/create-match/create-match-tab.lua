-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local GetTarmacAsset = v1.GetTarmacAsset;
local Padding = v1.Padding;
local TabComponentVariant = v1.TabComponentVariant;
local TabsComponent = v1.TabsComponent;
local Promise = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").Promise;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local Ripple = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "ripple").Ripple;
local QueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local ServerBrowserConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "server-browser", "server-browser-constants").ServerBrowserConstants;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local CreateMatchGameSettings = RuntimeLib.import(script, script.Parent, "create-match-game-settings").CreateMatchGameSettings;
local CustomMatchesClassicMaps = RuntimeLib.import(script, script.Parent, "custom-matches-classic-maps").CustomMatchesClassicMaps;
local CustomMatchesMapSaves = RuntimeLib.import(script, script.Parent, "custom-matches-map-saves").CustomMatchesMapSaves;
local v5 = {};
local u6 = setmetatable({}, {
    __index = v5
});
u6.OFFICIAL_MAPS = "official_maps";
v5.official_maps = "OFFICIAL_MAPS";
u6.MY_MAPS = "my_maps";
v5.my_maps = "MY_MAPS";
local u7 = {
    {
        text = "OFFICIAL MAPS",
        layoutOrder = 1,
        value = u6.OFFICIAL_MAPS
    },
    {
        text = "MY MAPS",
        layoutOrder = 2,
        value = u6.MY_MAPS
    }
};
local u8 = GetTarmacAsset("NoImage");
local BEDWARS_TO4 = QueueType.BEDWARS_TO4;
local u9 = QueueMeta[BEDWARS_TO4];

local function v48(u10, p11) -- Line: 49
    -- upvalues: u6 (ref), DeviceUtil (copy), Players (copy), u8 (copy), ServerBrowserConstants (copy), BEDWARS_TO4 (copy), u9 (copy), ColorUtil (copy), u3 (copy), TabsComponent (copy), u7 (copy), TabComponentVariant (copy), Padding (copy), CreateMatchGameSettings (copy), CustomMatchesClassicMaps (copy), CustomMatchesMapSaves (copy), Empty (copy), AutoSizedText (copy), u2 (copy), QueueMeta (copy), QueueType (copy), Promise (copy), Theme (copy), ButtonComponent (copy), Ripple (copy)
    local useState = p11.useState;
    local u12, u13 = useState(u6.OFFICIAL_MAPS);
    local u14, v15 = useState({
        title = (DeviceUtil.isHoarceKat() and "My" or Players.LocalPlayer.DisplayName .. "\'s") .. " Game",
        thumbnail = u8.Image,
        visibilityMode = ServerBrowserConstants.DEFAULT_VISIBILITY_MODE
    });
    local u16, u17 = useState(nil);
    local u18, u19 = useState(false);
    local v20, v21 = useState({
        queueType = BEDWARS_TO4,
        metadata = u9
    });

    local function v23(p22) -- Line: 63
        -- upvalues: u18 (copy), u17 (copy)
        if u18 then
            return nil;
        end;

        u17(p22);
    end;

    local v24 = {
        BackgroundTransparency = 0.65,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = ColorUtil.BLACK
    };
    local v26 = {
        u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            HorizontalAlignment = "Center",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 4)
        }),
        TabsWrapper = u3.createElement("Frame", {
            BorderSizePixel = 0,
            LayoutOrder = 1,
            Size = UDim2.new(1, 0, 0, 36),
            BackgroundColor3 = Color3.fromRGB(52, 54, 86)
        }, { u3.createElement(TabsComponent, {
                Value = u12,
                Tabs = u7,

                OnChange = function(p25) -- Line: 90, Name: OnChange
                    -- upvalues: u13 (copy)
                    u13(p25.value);
                end,

                Variant = TabComponentVariant.UNDERLINE,
                UIListLayout = {
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    Padding = UDim.new(0.025, 0)
                },
                ButtonProps = {
                    Size = UDim2.fromScale(0.2, 1)
                },
                FrameProps = {
                    BorderSizePixel = 0,
                    LayoutOrder = 3,
                    Size = UDim2.fromScale(1, 1)
                }
            }) })
    };
    local _ = #v26;
    local v27 = {
        LayoutOrder = 2,
        Size = UDim2.new(1, 0, 1, -48),
        Position = UDim2.new(0, 0, 0, 40)
    };
    local v28 = {
        u3.createElement(Padding, {
            Padding = {
                Horizontal = 18,
                Vertical = 18
            }
        }),
        u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 16)
        }),
        SettingsSection = u3.createElement(CreateMatchGameSettings, {
            SubTab = u12,
            GameInfo = u14,
            SetGameInfo = v15,
            SelectedGamemode = v20,
            SetSelectedGamemode = v21,
            FrameProps = {
                LayoutOrder = 1
            }
        })
    };
    local _ = #v28;
    local v29 = {
        LayoutOrder = 2,
        Size = UDim2.new(1, 0, 1, -78)
    };
    local v30 = {};
    local v31 = #v30;
    local v32;

    if u12 == u6.OFFICIAL_MAPS then
        v32 = u3.createElement(CustomMatchesClassicMaps, {
            setMapInfo = v23,
            SelectedGamemode = v20,
            SetSelectedGamemode = v21
        });
    else
        v32 = false;
    end;

    if v32 then
        v30[v31 + 1] = v32;
    end;

    local v33 = #v30;
    local v34;

    if u12 == u6.MY_MAPS then
        v34 = u3.createElement(CustomMatchesMapSaves, {
            setMapInfo = v23,
            MapSaves = u10.MapSaves
        });
    else
        v34 = false;
    end;

    if v34 then
        v30[v33 + 1] = v34;
    end;

    v28.MapSection = u3.createElement(Empty, v29, v30);
    local v35 = {
        LayoutOrder = 3,
        Size = UDim2.new(1, 0, 0, 32)
    };
    local v36 = { u3.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Right",
            VerticalAlignment = "Center",
            Padding = UDim.new(0, 4)
        }) };
    local v37 = #v36;
    local v38 = {};
    local v39;

    if u16 == nil then
        v39 = u16;
    else
        v39 = u16.selectedMap;

        if v39 ~= nil then
            v39 = v39.name;
        end;
    end;

    v38.Text = v39 == nil and "" or v39;
    v38.TextSize = 14;
    v38.Font = Enum.Font.GothamBold;
    v36[v37 + 1] = u3.createElement(AutoSizedText, v38);
    local v40 = {};
    local v41;

    if u16 == nil then
        v41 = u16;
    else
        v41 = u16.selectedMap;
    end;

    v40.Text = v41 == nil and "Select a Map" or (u18 and "Creating Match..." or "Create Match");

    function v40.OnClick() -- Line: 199
        -- upvalues: u18 (copy), u16 (copy), u19 (copy), u2 (ref), QueueMeta (ref), QueueType (ref), u10 (copy), u14 (copy), u12 (copy), u6 (ref), Promise (ref)
        if u18 then
            return nil;
        end;

        local v42 = u16;

        if v42 ~= nil then
            v42 = v42.selectedMap;
        end;

        if not v42 then
            return nil;
        end;

        u19(true);

        local function _(p43) -- Line: 214
            -- upvalues: u16 (ref)
            return p43 == u16.queueType;
        end;

        local v44 = nil;

        for i, v in u2.keys(QueueMeta) do
            local _ = i - 1;

            if v == u16.queueType == true then
                v44 = v;
                break;
            end;
        end;

        if v44 == nil then
            v44 = QueueType.BEDWARS_TO4;
        end;

        u19(true);
        u10.OnCreateMatch(v44, u16.selectedMap.id, {
            mapName = u16.selectedMap.name,
            mapThumbnail = u16.selectedMap.thumbnail,
            liveServerInfo = u14,
            isMapSave = u12 == u6.MY_MAPS
        }):andThen(function(p45) -- Line: 239
            -- upvalues: u19 (ref)
            u19(false);
        end);
        Promise.delay(5):andThen(function() -- Line: 244
            -- upvalues: u19 (ref)
            return u19(false);
        end);
    end;

    local v46;

    if u16 == nil then
        v46 = u16;
    else
        v46 = u16.selectedMap;
    end;

    local v47;

    if v46 == nil then
        v47 = Theme.backgroundError;
    else
        v47 = Theme.backgroundSuccess;
    end;

    v40.BackgroundColor3 = v47;

    if u16 ~= nil then
        u16 = u16.selectedMap;
    end;

    v40.Disabled = u16 == nil or u18;
    v36[v37 + 2] = u3.createElement(ButtonComponent, v40, { u3.createElement(Ripple, {}, { u3.createElement("UICorner", {
                CornerRadius = UDim.new(0.1, 0)
            }) }) });
    v28.CreateSection = u3.createElement(Empty, v35, v36);
    v26.Content = u3.createElement(Empty, v27, v28);

    return u3.createFragment({
        CreateMatchPage = u3.createElement("Frame", v24, v26)
    });
end;

return {
    CreateMatchTab = v4.new(u3)(v48)
};