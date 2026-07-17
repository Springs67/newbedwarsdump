-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local SlideIn = v1.SlideIn;
local SoundManager = v1.SoundManager;
local UILayers = v1.UILayers;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local FullScreenMenu = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu").FullScreenMenu;
local FullScreenMenuBackgroundPresets = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu-background-presets").FullScreenMenuBackgroundPresets;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeaponType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weapon-util").WeaponType;
local WeaponCard = RuntimeLib.import(script, script.Parent, "weapon-card").WeaponCard;
local v24 = v4.new(u3)(function(u6, p7) -- Line: 22
    -- upvalues: u3 (copy), Flamework (copy), UILayers (copy), u2 (copy), WeaponType (copy), WeaponCard (copy), DeviceUtil (copy), ClientStore (copy), default (copy), SoundManager (copy), GameSound (copy), FullScreenMenuBackgroundPresets (copy), FullScreenMenu (copy), SlideIn (copy), Empty (copy), ColorUtil (copy)
    local _ = p7.useEffect;
    local v8, _ = p7.useState(Vector2.new(584, 443));
    local v9 = math.floor(v8.X * 0.2568493150684932);
    u3.createRef();

    local function v10() -- Line: 29
        -- upvalues: Flamework (ref), UILayers (ref)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.MAIN);
    end;

    local function v21() -- Line: 32
        -- upvalues: u2 (ref), WeaponType (ref), u3 (ref), WeaponCard (ref), DeviceUtil (ref), ClientStore (ref), default (ref), SoundManager (ref), GameSound (ref), u6 (copy)
        local v11 = u2.values(WeaponType);

        local function v15(u12, p13) -- Line: 34
            -- upvalues: u3 (ref), WeaponCard (ref), DeviceUtil (ref), ClientStore (ref), default (ref), SoundManager (ref), GameSound (ref), u6 (ref)
            return u3.createElement(WeaponCard, {
                LayoutOrder = 0,
                Selected = false,
                weapon = u12,

                OnClick = function() -- Line: 39, Name: OnClick
                    -- upvalues: DeviceUtil (ref), ClientStore (ref), u12 (copy), default (ref), SoundManager (ref), GameSound (ref)
                    if DeviceUtil.isHoarceKat() then
                        ClientStore:dispatch({
                            type = "SetBedwarsWeapon",
                            weapon = u12
                        });

                        return nil;
                    end;

                    default.Client:Get("BedwarsSetWeapon"):CallServerAsync({
                        weapon = u12
                    }):andThen(function(p14) -- Line: 50
                        -- upvalues: SoundManager (ref), GameSound (ref), ClientStore (ref), u12 (ref)
                        if p14 then
                            SoundManager:playSound(GameSound.ARMOR_UNEQUIP);
                            ClientStore:dispatch({
                                type = "SetBedwarsWeapon",
                                weapon = u12
                            });
                        end;
                    end);
                end,

                store = u6.store
            });
        end;

        local v16 = 0;
        local v17 = {};

        for i, v in v11 do
            local v18 = v15(v, i - 1, v11);

            if v18 ~= nil then
                v16 = v16 + 1;
                v17[v16] = v18;
            end;
        end;

        local v19 = {};
        local v20 = #v19;

        for i, v in v17 do
            v19[v20 + i] = v;
        end;

        return u3.createFragment(v19);
    end;

    local v22 = {};
    local v23 = {};

    for i, v in FullScreenMenuBackgroundPresets.GENERIC_BW_IMAGE_PRESET do
        v22[i] = v;
    end;

    v22.OnClick = v10;
    v23.Background = v22;
    v23.ExitButton = {
        OnClick = v10
    };
    v23.EnableButtonBackgroundPanel = true;

    return u3.createElement(FullScreenMenu, v23, { u3.createElement(SlideIn, {}, {
            u3.createElement("UIPadding", {
                PaddingTop = UDim.new(DeviceUtil.isSmallScreen() and 0.15 or 0.025, 0)
            }),
            u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 24)
            }),
            Title = u3.createElement(Empty, {
                Size = UDim2.fromScale(1, 0.15)
            }, { u3.createElement("TextLabel", {
                    Text = "Select Starter Weapon",
                    TextScaled = true,
                    TextXAlignment = "Center",
                    BackgroundTransparency = 1,
                    TextTransparency = 0,
                    LayoutOrder = 2,
                    AnchorPoint = Vector2.new(0, 0),
                    Size = UDim2.fromScale(1, 1),
                    TextColor3 = ColorUtil.WHITE,
                    FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
                }) }),
            WeaponList = u3.createElement("ScrollingFrame", {
                AutomaticCanvasSize = "Y",
                ScrollingDirection = "Y",
                ScrollBarThickness = 6,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Selectable = false,
                LayoutOrder = 2,
                Size = UDim2.fromScale(1, 1),
                CanvasSize = UDim2.new(1, 0, 0, 0)
            }, {
                u3.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0, 24)
                }),
                u3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 3),
                    PaddingTop = UDim.new(0, 12),
                    PaddingBottom = UDim.new(0, 12)
                }),
                AvailableWeapons = u3.createElement(Empty, {
                    AutomaticSize = "Y",
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 0)
                }, { u3.createElement("UIGridLayout", {
                        HorizontalAlignment = "Left",
                        VerticalAlignment = "Top",
                        SortOrder = "LayoutOrder",
                        FillDirectionMaxCells = 5,
                        CellSize = UDim2.fromOffset(v9, v9 * 1.5),
                        CellPadding = UDim2.fromOffset(20, 20)
                    }), u3.createElement(v21) })
            })
        }) });
end);

return {
    WeaponSelectionApp = v5.connect(function(p25, p26) -- Line: 169
        local v27 = {
            store = p25
        };

        for i, v in p26 do
            v27[i] = v;
        end;

        return v27;
    end)(v24)
};