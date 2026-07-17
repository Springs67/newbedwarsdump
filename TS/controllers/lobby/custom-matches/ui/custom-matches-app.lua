-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local SlideIn = v1.SlideIn;
local SoundManager = v1.SoundManager;
local UILayers = v1.UILayers;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local FullScreenMenu = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu").FullScreenMenu;
local FullScreenMenuBackgroundPresets = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu-background-presets").FullScreenMenuBackgroundPresets;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local CustomMatchTabButton = RuntimeLib.import(script, script.Parent, "custom-match-tab-button").CustomMatchTabButton;
local CustomMatchAppTab = RuntimeLib.import(script, script.Parent, "custom-match-tabs").CustomMatchAppTab;
local CreateMatchTab = RuntimeLib.import(script, script.Parent, "tabs", "create-match", "create-match-tab").CreateMatchTab;
local CustomMatchesHomeTab = RuntimeLib.import(script, script.Parent, "tabs", "home", "custom-matches-home-tab").CustomMatchesHomeTab;
local CustomMapsBrowser = RuntimeLib.import(script, script.Parent, "tabs", "map-browser", "custom-maps-browser").CustomMapsBrowser;
local ServerBrowser = RuntimeLib.import(script, script.Parent, "tabs", "server-browser", "server-browser").ServerBrowser;
local u5 = {
    {
        text = "HOME",
        layoutOrder = 1,
        value = CustomMatchAppTab.HOME
    },
    {
        text = "LIVE GAMES",
        layoutOrder = 2,
        value = CustomMatchAppTab.GAME_BROWSER
    },
    {
        text = "BROWSE MAPS",
        layoutOrder = 3,
        value = CustomMatchAppTab.MAP_BROWSER
    }
};
local v47 = v3.new(u2)(function(u6, p7) -- Line: 36
    -- upvalues: CustomMatchAppTab (copy), Flamework (copy), BedwarsAppIds (copy), SoundManager (copy), GameSound (copy), FullScreenMenuBackgroundPresets (copy), UILayers (copy), u2 (copy), u5 (copy), ColorUtil (copy), CustomMatchTabButton (copy), Empty (copy), CustomMatchesHomeTab (copy), CustomMapsBrowser (copy), ServerBrowser (copy), CreateMatchTab (copy), SlideIn (copy), FullScreenMenu (copy)
    local useState = p7.useState;
    local _ = p7.useEffect;
    local u8, u9 = useState(CustomMatchAppTab.HOME);
    local v10, u11 = useState(false);

    local function v12() -- Line: 41
        -- upvalues: Flamework (ref), BedwarsAppIds (ref), SoundManager (ref), GameSound (ref)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.CUSTOM_MATCHES);
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.LOBBY_PLAY_MENU_APP, {});
        SoundManager:playSound(GameSound.UI_CLOSE_2);
    end;

    local v13 = {};
    local v14 = {};

    for i, v in FullScreenMenuBackgroundPresets.BACKGROUND_BLUR_PRESET do
        v13[i] = v;
    end;

    v13.OnClick = v12;
    v14.Background = v13;
    v14.BackButton = {
        OnClick = v12
    };
    v14.ExitButton = {
        OnClick = function() -- Line: 57, Name: OnClick
            -- upvalues: Flamework (ref), UILayers (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.MAIN);
        end
    };
    local v15 = {};
    local v16 = {};
    local _ = #v16;
    local v17 = {
        Size = UDim2.fromScale(1, 0.125),
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.075),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    };
    local v18 = {};
    local _ = #v18;
    local v19 = {
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0)
    };
    local v20 = { u2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0.05, 0),
            PaddingRight = UDim.new(0.05, 0)
        }) };
    local v21 = #v20;
    local v22 = {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 0, 0.5, 0),
        Size = UDim2.fromScale(0.225, 0.5)
    };
    local v23;

    if u8 == CustomMatchAppTab.HOME then
        v23 = "CUSTOM MATCH";
    else
        local function _(p24) -- Line: 94
            -- upvalues: u8 (copy)
            return p24.value == u8;
        end;

        local v25 = nil;

        for i, v in u5 do
            local _ = i - 1;

            if v.value == u8 == true then
                v25 = v;
                break;
            end;
        end;

        if v25 ~= nil then
            v25 = v25.text;
        end;

        v23 = v25 == nil and "CREATE A GAME" or v25;
    end;

    v22.Text = v23;
    v22.TextColor3 = ColorUtil.WHITE;
    v22.TextXAlignment = Enum.TextXAlignment.Left;
    v22.TextYAlignment = Enum.TextYAlignment.Center;
    v22.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
    v22.TextScaled = true;
    v22.BackgroundTransparency = 1;
    v22.TextTransparency = 0;
    v20.HeaderTitle = u2.createElement("TextLabel", v22, { u2.createElement("UIGradient", {
            Rotation = 90,
            Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 0.75) })
        }) });
    local v26 = {
        Size = UDim2.fromScale(0.5, 0.8),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    };
    local v27 = { u2.createElement("Frame", {
            BorderSizePixel = 0,
            Size = UDim2.new(0, 3, 0.9, 0),
            Position = UDim2.fromScale(0, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = ColorUtil.WHITE
        }, { u2.createElement("UIGradient", {
                Rotation = 90,
                Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0.6), NumberSequenceKeypoint.new(1, 1) })
            }) }) };
    local v28 = #v27;

    local function v30(u29) -- Line: 150
        -- upvalues: u2 (ref), CustomMatchTabButton (ref), u5 (ref), ColorUtil (ref), u8 (copy), SoundManager (ref), GameSound (ref), u9 (copy), u11 (copy)
        return u2.createElement(CustomMatchTabButton, {
            Size = UDim2.fromScale(1 / (#u5 / 3) * 0.265, 0.6),
            Text = u29.text,
            TextColor3 = ColorUtil.WHITE,
            BackgroundColor3 = ColorUtil.BLACK,
            Selected = u29.value == u8,
            LayoutOrder = u29.layoutOrder,

            OnClick = function() -- Line: 158, Name: OnClick
                -- upvalues: SoundManager (ref), GameSound (ref), u9 (ref), u29 (copy), u11 (ref)
                SoundManager:playSound(GameSound.UI_CLICK);
                u9(u29.value);
                u11(false);
            end
        });
    end;

    local v31 = table.create(#u5);

    for i, v in u5 do
        v31[i] = v30(v, i - 1, u5);
    end;

    local v32 = {
        Size = UDim2.fromScale(1, 1)
    };
    local v33 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            HorizontalFlex = Enum.UIFlexAlignment.SpaceEvenly
        }) };
    local v34 = #v33;

    for i, v in v31 do
        v33[v34 + i] = v;
    end;

    v27[v28 + 1] = u2.createElement(Empty, v32, v33);
    v27[v28 + 2] = u2.createElement("Frame", {
        BorderSizePixel = 0,
        Size = UDim2.new(0, 3, 0.9, 0),
        Position = UDim2.fromScale(1, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = ColorUtil.WHITE
    }, { u2.createElement("UIGradient", {
            Rotation = 90,
            Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0.6), NumberSequenceKeypoint.new(1, 1) })
        }) });
    v20[v21 + 1] = u2.createElement(Empty, v26, v27);
    v20[v21 + 2] = u2.createElement(Empty, {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -25, 0.5, 0),
        Size = UDim2.fromScale(0.2, 0.8)
    }, { u2.createElement(CustomMatchTabButton, {
            Text = "CREATE A GAME",
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 0.65),
            BackgroundColor3 = Color3.fromRGB(99, 255, 143),
            TextColor3 = Color3.fromRGB(99, 255, 143),

            OnClick = function() -- Line: 213, Name: OnClick
                -- upvalues: SoundManager (ref), GameSound (ref), u11 (copy), u9 (copy)
                SoundManager:playSound(GameSound.UI_CLICK);
                u11(true);
                u9(nil);
            end
        }) });
    v18.HeaderContainer = u2.createElement(Empty, v19, v20);
    v16.Header = u2.createElement(Empty, v17, v18);
    local v35 = not v10;

    if v35 then
        local v36 = {};
        local v37 = #v36;
        local v38;

        if u8 == CustomMatchAppTab.HOME then
            v38 = u2.createElement(CustomMatchesHomeTab, {
                SetTab = u9,

                OnCreateMatch = function(...) -- Line: 228, Name: OnCreateMatch
                    -- upvalues: u6 (copy)
                    return u6.OnCreateMatch(unpack({ ... }));
                end,

                OnJoinMatch = u6.OnJoinMatch
            });
        else
            v38 = false;
        end;

        if v38 then
            v36[v37 + 1] = v38;
        end;

        local v39 = #v36;
        local v40;

        if u8 == CustomMatchAppTab.MAP_BROWSER then
            v40 = u2.createElement(CustomMapsBrowser);
        else
            v40 = false;
        end;

        if v40 then
            v36[v39 + 1] = v40;
        end;

        local v41 = #v36;
        local v42;

        if u8 == CustomMatchAppTab.GAME_BROWSER then
            v42 = u2.createElement(ServerBrowser);
        else
            v42 = false;
        end;

        if v42 then
            v36[v41 + 1] = v42;
        end;

        v35 = u2.createFragment(v36);
    end;

    local v43 = {
        Size = UDim2.fromScale(0.9, 0.73),
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.195)
    };
    local v44 = {};
    local v45 = #v44;

    if v35 then
        v44[v45 + 1] = v35;
    end;

    local v46 = #v44;

    if v10 then
        v10 = u2.createElement(CreateMatchTab, {
            OnCreateMatch = function(...) -- Line: 261, Name: OnCreateMatch
                -- upvalues: u6 (copy)
                return u6.OnCreateMatch(unpack({ ... }));
            end,

            MapSaves = u6.mapSaves
        });
    end;

    if v10 then
        v44[v46 + 1] = v10;
    end;

    v16.Body = u2.createElement(Empty, v43, v44);
    v15[#v15 + 1] = u2.createElement(SlideIn, {}, v16);

    return u2.createElement(FullScreenMenu, v14, v15);
end);

return {
    CustomMatchesApp = v4.connect(function(p48, p49) -- Line: 275
        local v50 = {};

        for i, v in p49 do
            v50[i] = v;
        end;

        v50.mapSaves = p48.CustomMatch.mapSaves;

        return v50;
    end)(v47)
};