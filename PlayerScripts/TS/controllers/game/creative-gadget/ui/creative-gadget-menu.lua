-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local DeviceUtil = v1.DeviceUtil;
local DropdownComponent = v1.DropdownComponent;
local Empty = v1.Empty;
local SlideIn = v1.SlideIn;
local SoundManager = v1.SoundManager;
local WidgetComponent = v1.WidgetComponent;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local HostPanelSetting = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "creative", "custom-match", "host-panel", "components", "host-panel-setting").HostPanelSetting;
local HostPanelTextBox = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "creative", "custom-match", "host-panel", "components", "host-panel-textbox").HostPanelTextBox;
local AutoCompleteSearchbar = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "creative-gadget", "creative-gadget-util");
local GadgetConfigOptions = v7.GadgetConfigOptions;
local getCreativeGadgetMeta = v7.getCreativeGadgetMeta;
local items = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").items;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local v8 = v2.entries(items);

local function _(p9, p10) -- Line: 29
    local _ = p10[1];
    local v11 = p10[2];

    if v11.removeFromCustoms then
        return p9;
    end;

    local v12 = string.lower(v11.displayName);
    table.insert(p9, v12);

    return p9;
end;

local u13 = {};

for i = 1, #v8 do
    local v14 = v8[i];
    local _ = i - 1;
    local _ = v14[1];
    local v15 = v14[2];

    if not v15.removeFromCustoms then
        local v16 = string.lower(v15.displayName);
        table.insert(u13, v16);
    end;
end;

local u17 = UDim2.new(1, 0, 0.2, 0);
local u18 = nil;

local function v36(u19, p20) -- Line: 50
    -- upvalues: u18 (ref), DeviceUtil (copy), u3 (copy), Players (copy), Flamework (copy), BedwarsAppIds (copy), u4 (copy), Empty (copy), Button (copy), KnitClient (copy), SoundManager (copy), GameSound (copy), getCreativeGadgetMeta (copy), WidgetComponent (copy), SlideIn (copy)
    local _ = p20.useState;
    local useEffect = p20.useEffect;
    local v21 = u18(u19.CreativeGadgetBlockInstance.Name, u19);
    useEffect(function() -- Line: 54
        -- upvalues: DeviceUtil (ref), u3 (ref), Players (ref), Flamework (ref), BedwarsAppIds (ref)
        if DeviceUtil.isHoarceKat() then
            return nil;
        end;

        local u22 = u3.new();
        local u23 = true;
        u22:GiveTask(function() -- Line: 60
            -- upvalues: u23 (ref)
            u23 = false;

            return u23;
        end);
        local Character = Players.LocalPlayer.Character;
        task.delay(0.1, function() -- Line: 66
            -- upvalues: Character (copy), u23 (ref), u22 (copy), Flamework (ref), BedwarsAppIds (ref)
            local v24 = Character;

            if v24 ~= nil then
                v24 = v24:FindFirstChildWhichIsA("Humanoid");
            end;

            if u23 and v24 then
                u22:GiveTask(v24:GetPropertyChangedSignal("MoveDirection"):Connect(function() -- Line: 73
                    -- upvalues: Flamework (ref), BedwarsAppIds (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.CREATIVE_GADGET_MENU);
                end));
            end;
        end);
        task.delay(0.1, function() -- Line: 79
            -- upvalues: Character (copy), u23 (ref), Flamework (ref), BedwarsAppIds (ref)
            local v25 = Character;

            if v25 ~= nil then
                v25 = v25.PrimaryPart;

                if v25 ~= nil then
                    v25 = v25.Position;
                end;
            end;

            if not v25 then
                return nil;
            end;

            while true do
                local v26 = task.wait(0.05);

                if v26 ~= 0 and (v26 == v26 and v26) then
                    v26 = u23;
                end;

                if v26 == 0 or (v26 ~= v26 or not v26) then
                    return;
                end;

                local PrimaryPart = Character.PrimaryPart;

                if PrimaryPart ~= nil then
                    PrimaryPart = PrimaryPart.Position;
                end;

                if not PrimaryPart then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.CREATIVE_GADGET_MENU);

                    return nil;
                end;

                if ((PrimaryPart - v25) * Vector3.new(1, 0.3, 1)).Magnitude > 1 then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.CREATIVE_GADGET_MENU);

                    return nil;
                end;
            end;
        end);

        return function() -- Line: 116
            -- upvalues: u22 (copy)
            u22:DoCleaning();
        end;
    end);
    local v27 = {
        DisplayOrder = 20,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    };
    local v28 = {};
    local v29 = {};
    local _ = #v29;
    local v30 = {
        LayoutOrder = 1,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.18, 0.4),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.7, 0.5)
    };
    local v31 = {};
    local v32 = {
        ClipsDescendents = false,
        Title = "Gadget Config",
        AppId = u19.AppId,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),

        OnClose = function() -- Line: 145, Name: OnClose
            -- upvalues: Flamework (ref), u19 (copy)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u19.AppId);
        end,

        ContentUIPadding = u4.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 0),
            PaddingBottom = UDim.new(0, 0),
            PaddingLeft = UDim.new(0, 5),
            PaddingRight = UDim.new(0, 5)
        })
    };
    local v33 = { u4.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            HorizontalAlignment = "Left",
            Padding = UDim.new(0, 10)
        }), u4.createElement(Empty) };
    local v34 = #v33;

    for i, v in v21 do
        v33[v34 + i] = v;
    end;

    v33[#v33 + 1] = u4.createElement(Empty, {
        Size = UDim2.fromScale(1, 0.15),
        Position = UDim2.fromScale(0, 0)
    }, {
        u4.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            SortOrder = "LayoutOrder",
            HorizontalAlignment = "Center",
            Padding = UDim.new(0, 10)
        }),
        GadgetRemoveButton = u4.createElement(Button, {
            Text = "Remove",
            ZIndex = 2,
            CornerRadius = UDim.new(0.1, 0),
            Size = UDim2.fromScale(0.45, 1),
            TextLabel = {
                ZIndex = 2,
                Font = Enum.Font.ArialBold,
                Size = UDim2.fromScale(0.95, 0.65)
            },
            BackgroundColor3 = Color3.fromRGB(181, 51, 51),

            OnClick = function() -- Line: 189, Name: OnClick
                -- upvalues: KnitClient (ref), u19 (copy), Flamework (ref), BedwarsAppIds (ref)
                KnitClient.Controllers.CreativeGadgetController:requestGadgetRemoval(u19.CreativeGadgetBlockInstance);
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.CREATIVE_GADGET_MENU);
            end
        }),
        GadgetApplyButton = u4.createElement(Button, {
            Text = "Apply",
            ZIndex = 2,
            CornerRadius = UDim.new(0.1, 0),
            Size = UDim2.fromScale(0.45, 1),
            TextLabel = {
                ZIndex = 2,
                Font = Enum.Font.ArialBold,
                Size = UDim2.fromScale(0.95, 0.65)
            },
            BackgroundColor3 = Color3.fromRGB(44, 184, 96),

            OnClick = function() -- Line: 205, Name: OnClick
                -- upvalues: KnitClient (ref), u19 (copy), SoundManager (ref), GameSound (ref), getCreativeGadgetMeta (ref), Flamework (ref), BedwarsAppIds (ref)
                KnitClient.Controllers.CreativeGadgetController:requestGadgetCreation(u19.CreativeGadgetBlockInstance):andThen(function(p35) -- Line: 206
                    -- upvalues: SoundManager (ref), GameSound (ref), getCreativeGadgetMeta (ref), u19 (ref), Flamework (ref), BedwarsAppIds (ref)
                    if p35 then
                        SoundManager:playSound(GameSound.BEDWARS_UPGRADE_SUCCESS);

                        if getCreativeGadgetMeta(u19.CreativeGadgetBlockInstance.Name).removeOnConfig then
                            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.CREATIVE_GADGET_MENU);
                        end;
                    else
                        SoundManager:playSound(GameSound.ERROR_NOTIFICATION);
                    end;
                end);
            end
        })
    });
    v31[#v31 + 1] = u4.createElement(WidgetComponent, v32, v33);
    v29[u19.AppId] = u4.createElement("Frame", v30, v31);
    v28[#v28 + 1] = u4.createElement(SlideIn, {}, v29);

    return u4.createElement("ScreenGui", v27, v28);
end;

local u37 = nil;
local u38 = nil;
local u39 = nil;

u18 = function(p40, u41) -- Line: 226, Name: getConfigEntries
    -- upvalues: getCreativeGadgetMeta (copy), GadgetConfigOptions (copy), u37 (ref), u38 (ref), u39 (ref)
    local u42 = {};
    local config = getCreativeGadgetMeta(p40).config;

    local function v48(p43, p44) -- Line: 230
        -- upvalues: GadgetConfigOptions (ref), u37 (ref), u41 (copy), u42 (copy), u38 (ref), u39 (ref)
        if p43 == GadgetConfigOptions.Field then
            local v45 = u37(p44, u41);
            table.insert(u42, v45);

            return;
        end;

        if p43 == GadgetConfigOptions.Team then
            local v46 = u38(p44, u41);
            table.insert(u42, v46);

            return;
        end;

        if p43 ~= GadgetConfigOptions.Item then
            return;
        end;

        local v47 = u39(p44, u41);
        table.insert(u42, v47);
    end;

    for i, v in config do
        v48(v, i, config);
    end;

    return u42;
end;

u37 = function(u49, u50) -- Line: 254, Name: createFieldSetting
    -- upvalues: KnitClient (copy), u17 (copy), u4 (copy), HostPanelTextBox (copy), HostPanelSetting (copy)
    local v51 = KnitClient.Controllers.CreativeGadgetController:getSavedDataForGadget(u50.CreativeGadgetBlockInstance, u49);
    local v52 = {
        Name = u49,
        Size = u17
    };
    local v54 = {
        [#v54 + 1] = u4.createElement(HostPanelTextBox, {
            Text = v51 == nil and "" or v51,
            PlaceholderText = v51 == nil and "" or v51,
            NumbersOnly = true,

            OnFocusLost = function(p53) -- Line: 274
                -- upvalues: KnitClient (ref), u50 (copy), u49 (copy)
                KnitClient.Controllers.CreativeGadgetController:saveDataToGadget(u50.CreativeGadgetBlockInstance, u49, p53);
            end
        })
    };

    return u4.createElement(HostPanelSetting, v52, v54);
end;

u38 = function(u55, u56) -- Line: 280, Name: createTeamSetting
    -- upvalues: KnitClient (copy), u4 (copy), DropdownComponent (copy), u17 (copy), HostPanelSetting (copy)
    local u57 = KnitClient.Controllers.CreativeGadgetController:getSavedDataForGadget(u56.CreativeGadgetBlockInstance, u55);
    local v58 = KnitClient.Controllers.TeamController:getTeamDropdown(false);
    local v59 = v58.map[u56.store.Game.teams[1].name];

    if u57 ~= "" and u57 then
        local function _(p60) -- Line: 288
            -- upvalues: u57 (copy)
            return p60.id == u57;
        end;

        local v61 = nil;

        for i, v in u56.store.Game.teams do
            local _ = i - 1;

            if v.id == u57 == true then
                v61 = v;
                break;
            end;
        end;

        if v61 then
            v59 = v58.map[v61.name];
        end;
    end;

    if v58 then
        local v62 = {
            Size = UDim2.fromScale(1, 1),
            DefaultItem = v59
        };

        if v59 ~= nil then
            v59 = v59.text;
        end;

        v62.PlaceholderText = v59;
        v62.Items = v58.dropDownItems;

        function v62.OnItemSelected(p63) -- Line: 319
            -- upvalues: KnitClient (ref), u56 (copy), u55 (copy)
            KnitClient.Controllers.CreativeGadgetController:saveDataToGadget(u56.CreativeGadgetBlockInstance, u55, p63);
        end;

        v62.LayoutOrder = 1;
        v58 = u4.createElement(DropdownComponent, v62);
    end;

    local v64 = {
        Name = u55,
        Size = u17
    };
    local v65 = {
        [#v65 + 1] = v58
    };

    return u4.createElement(HostPanelSetting, v64, v65);
end;

local u66 = nil;

u39 = function(u67, u68) -- Line: 335, Name: createItemSetting
    -- upvalues: KnitClient (copy), u17 (copy), u13 (copy), u66 (ref), u4 (copy), AutoCompleteSearchbar (copy), HostPanelSetting (copy)
    local v69 = KnitClient.Controllers.CreativeGadgetController:getSavedDataForGadget(u68.CreativeGadgetBlockInstance, u67);
    local v70 = {
        Name = u67,
        Size = u17
    };
    local v71 = {};
    local v72 = {
        HideSearchIcon = true,
        Size = UDim2.new(1, 0, 1, 0)
    };

    local function _(p73) -- Line: 347
        return {
            key = p73
        };
    end;

    local v74 = table.create(#u13);

    for i, v in u13 do
        local _ = i - 1;
        v74[i] = {
            key = v
        };
    end;

    v72.Items = v74;
    v72.InputText = v69 == nil and "" or v69;

    function v72.OnTextChange(p75) -- Line: 364
        -- upvalues: u66 (ref), u68 (copy), u67 (copy)
        u66(u68.CreativeGadgetBlockInstance, u67, p75);
    end;

    v72.PlaceHolderText = "Search Items";
    v72.LayoutOrder = 2;
    v71[#v71 + 1] = u4.createElement(AutoCompleteSearchbar, v72);

    return u4.createElement(HostPanelSetting, v70, v71);
end;

u66 = function(p76, p77, p78) -- Line: 372, Name: filterListWithSearch
    -- upvalues: KnitClient (copy)
    KnitClient.Controllers.CreativeGadgetController:saveDataToGadget(p76, p77, p78);
end;

local v79 = v5.new(u4)(v36);

return {
    CreativeGadgetMenu = v6.connect(function(p80, p81) -- Line: 376
        local v82 = {
            store = p80
        };

        for i, v in p81 do
            v82[i] = v;
        end;

        return v82;
    end)(v79)
};