-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local AutoCompleteSearchbar = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar;
local ToggleButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "button-group", "toggle-button").ToggleButton;
local ToggleButtonGroup = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "button-group", "toggle-button-group").ToggleButtonGroup;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local HostPanelToggleValue = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto").HostPanelToggleValue;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u5 = {
    BedwarsKit.NONE,
    BedwarsKit.INFECTED,
    BedwarsKit.SUPER_INFECTED,
    BedwarsKit.INFECTED_TANK,
    BedwarsKit.INFECTED_RUSH,
    BedwarsKit.INFECTED_DISRUPTOR,
    BedwarsKit.INFECTED_PROWLER
};

local function _(p6) -- Line: 23
    -- upvalues: u5 (copy)
    return table.find(u5, p6) == nil;
end;

local v7 = 0;
local u8 = {};

for i, v in v2.values(BedwarsKit) do
    local _ = i - 1;

    if table.find(u5, v) == nil == true then
        v7 = v7 + 1;
        u8[v7] = v;
    end;
end;

table.sort(u8, function(p9, p10) -- Line: 37
    -- upvalues: getBedwarsKitMeta (copy)
    return getBedwarsKitMeta(p9).name < getBedwarsKitMeta(p10).name;
end);

local function _(p11) -- Line: 44
    -- upvalues: getBedwarsKitMeta (copy)
    return getBedwarsKitMeta(p11).name;
end;

local v12 = 0;
local u13 = {};

for i, v in u8 do
    local _ = i - 1;
    local name = getBedwarsKitMeta(v).name;

    if name ~= nil then
        v12 = v12 + 1;
        u13[v12] = name;
    end;
end;

return {
    HostPanelKitsTab = v4.new(u3)(function(u14, p15) -- Line: 59
        -- upvalues: u8 (copy), DeviceUtil (copy), KnitClient (copy), SoundManager (copy), GameSound (copy), u3 (copy), Theme (copy), u13 (copy), getBedwarsKitMeta (copy), AutoCompleteSearchbar (copy), ColorUtil (copy), Empty (copy), ToggleButtonGroup (copy), ToggleButton (copy), HostPanelToggleValue (copy), AutoCanvasScrollingFrame (copy)
        local useState = p15.useState;
        local u16, u17 = useState(true);
        local v18, u19 = useState(u8);

        local function _(p20, p21) -- Line: 63
            -- upvalues: DeviceUtil (ref), KnitClient (ref), SoundManager (ref), GameSound (ref)
            if not DeviceUtil.isHoarceKat() then
                KnitClient.Controllers.CustomMatchController:setKitDisabled(p20, p21);
            end;

            SoundManager:playSound(GameSound.UI_CLICK);
        end;

        local function _(p22) -- Line: 69
            -- upvalues: DeviceUtil (ref), KnitClient (ref), SoundManager (ref), GameSound (ref)
            if not DeviceUtil.isHoarceKat() then
                KnitClient.Controllers.CustomMatchController:setAllKitsDisabled(p22);
            end;

            SoundManager:playSound(GameSound.UI_CLICK);
        end;

        local v23 = { u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                Padding = UDim.new(0, 10)
            }), u3.createElement("TextLabel", {
                AutomaticSize = "Y",
                SizeConstraint = "RelativeXX",
                Text = "<b>ALLOWED KITS</b>",
                TextScaled = true,
                RichText = true,
                Font = "Roboto",
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0),
                TextColor3 = Theme.textPrimary
            }, { u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = 20
                }) }) };
        local v24 = #v23;
        local v25 = {
            Size = UDim2.fromScale(1, 0.075)
        };

        local function _(p26) -- Line: 102
            return {
                key = p26
            };
        end;

        local v27 = table.create(#u13);

        for i, v in u13 do
            local _ = i - 1;
            v27[i] = {
                key = v
            };
        end;

        v25.Items = v27;
        v25.InputText = "";

        function v25.OnTextChange(p28, u29) -- Line: 115
            -- upvalues: getBedwarsKitMeta (ref), u8 (ref), u19 (copy)
            local function _(p30) -- Line: 116
                -- upvalues: u29 (copy), getBedwarsKitMeta (ref)
                local name = getBedwarsKitMeta(p30).name;

                return table.find(u29, name) ~= nil;
            end;

            local v31 = 0;
            local v32 = {};

            for i, v in u8 do
                local _ = i - 1;
                local name = getBedwarsKitMeta(v).name;

                if table.find(u29, name) ~= nil == true then
                    v31 = v31 + 1;
                    v32[v31] = v;
                end;
            end;

            u19(v32);
        end;

        v25.PlaceHolderText = "Kit Name";
        v23[v24 + 1] = u3.createElement(AutoCompleteSearchbar, v25);

        local function v47(u33) -- Line: 135
            -- upvalues: getBedwarsKitMeta (ref), Theme (ref), u3 (ref), u14 (copy), DeviceUtil (ref), KnitClient (ref), SoundManager (ref), GameSound (ref), ColorUtil (ref), Empty (ref), ToggleButtonGroup (ref), ToggleButton (ref), HostPanelToggleValue (ref)
            local v34 = getBedwarsKitMeta(u33);
            local v38 = {
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = Theme.backgroundPrimary,
                BorderSizePixel = 0,
                Text = "",

                [u3.Event.Activated] = function() -- Line: 142
                    -- upvalues: u14 (ref), u33 (copy), DeviceUtil (ref), KnitClient (ref), SoundManager (ref), GameSound (ref)
                    local v35 = u14.store.CustomMatch.disabledKits[u33];

                    if v35 == nil then
                        v35 = false;
                    end;

                    local v36 = u33;
                    local v37 = not v35;

                    if not DeviceUtil.isHoarceKat() then
                        KnitClient.Controllers.CustomMatchController:setKitDisabled(v36, v37);
                    end;

                    SoundManager:playSound(GameSound.UI_CLICK);
                end
            };
            local v39 = {};
            local v40 = {
                Size = UDim2.fromScale(0.9, 0.6),
                Position = UDim2.fromScale(0.5, 0),
                AnchorPoint = Vector2.new(0.5, 0)
            };
            local v41 = { u3.createElement(
                    "UIListLayout",
                    {
                        FillDirection = "Horizontal",
                        VerticalAlignment = "Center",
                        HorizontalAlignment = "Center",
                        SortOrder = "LayoutOrder"
                    }
                ), u3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0.025, 0),
                    PaddingBottom = UDim.new(0.025, 0)
                }) };
            local v42 = #v41;
            local v43;

            if v34.renderImage == nil then
                v43 = false;
            else
                v43 = u3.createFragment({
                    KitImage = u3.createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(1, 0.75),
                        Position = UDim2.fromScale(0, 0.05),
                        SizeConstraint = Enum.SizeConstraint.RelativeYY,
                        Image = v34.renderImage,
                        ScaleType = Enum.ScaleType.Fit
                    }, { u3.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1
                        }) })
                });
            end;

            if v43 then
                v41[v42 + 1] = v43;
            end;

            v41[#v41 + 1] = u3.createElement("TextLabel", {
                TextScaled = true,
                TextXAlignment = "Center",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                Size = UDim2.fromScale(0.75, 1),
                Text = v34.name,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextColor3 = ColorUtil.WHITE
            }, { u3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0.15, 0),
                    PaddingBottom = UDim.new(0.15, 0),
                    PaddingLeft = UDim.new(0.1, 0),
                    PaddingRight = UDim.new(0.1, 0)
                }), u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = 18
                }) });
            v39.TopSection = u3.createElement(Empty, v40, v41);
            v39[#v39 + 1] = u3.createElement(ToggleButtonGroup, {
                Value = u14.store.CustomMatch.disabledKits[u33] and "off" or "on",

                OnChange = function(p44) -- Line: 214, Name: OnChange
                    -- upvalues: u33 (copy), DeviceUtil (ref), KnitClient (ref), SoundManager (ref), GameSound (ref)
                    local v45 = u33;
                    local v46 = p44 == "off";

                    if not DeviceUtil.isHoarceKat() then
                        KnitClient.Controllers.CustomMatchController:setKitDisabled(v45, v46);
                    end;

                    SoundManager:playSound(GameSound.UI_CLICK);
                end,

                FrameProps = {
                    Size = UDim2.fromScale(1, 0.4),
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.fromScale(0, 0.6)
                }
            }, { u3.createElement(ToggleButton, {
                    Text = "On",
                    Value = HostPanelToggleValue.ON
                }), u3.createElement(ToggleButton, {
                    Text = "Off",
                    Value = HostPanelToggleValue.OFF,
                    ActiveColor = Theme.backgroundError
                }) });

            return u3.createElement("TextButton", v38, v39);
        end;

        local v48 = table.create(#v18);

        for i, v in v18 do
            v48[i] = v47(v, i - 1, v18);
        end;

        local v49 = {
            AdditionalSpace = 40,
            ScrollingFrameProps = {
                Size = UDim2.new(1, 0, 0.825, 0)
            }
        };
        local v51 = { u3.createElement("UIGridLayout", {
                HorizontalAlignment = "Left",
                VerticalAlignment = "Top",
                SortOrder = "LayoutOrder",
                FillDirectionMaxCells = 6,
                CellSize = UDim2.fromOffset(90, 70)
            }), u3.createElement("TextButton", {
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = Theme.backgroundTertiary,
                BorderSizePixel = 0,
                Text = "",

                [u3.Event.Activated] = function() -- Line: 260
                    -- upvalues: u16 (copy), DeviceUtil (ref), KnitClient (ref), SoundManager (ref), GameSound (ref), u17 (copy)
                    local v50 = u16;

                    if not DeviceUtil.isHoarceKat() then
                        KnitClient.Controllers.CustomMatchController:setAllKitsDisabled(v50);
                    end;

                    SoundManager:playSound(GameSound.UI_CLICK);
                    u17(not u16);
                end
            }, { u3.createElement("TextLabel", {
                    TextScaled = true,
                    RichText = true,
                    Font = "Roboto",
                    TextXAlignment = "Center",
                    TextYAlignment = "Center",
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 1),
                    Text = u16 and "<b>Disable All</b>" or "<b>Enable All</b>",
                    TextColor3 = ColorUtil.WHITE
                }, { u3.createElement("UIPadding", {
                        PaddingTop = UDim.new(0.15, 0),
                        PaddingBottom = UDim.new(0.15, 0),
                        PaddingLeft = UDim.new(0.1, 0),
                        PaddingRight = UDim.new(0.1, 0)
                    }), u3.createElement("UITextSizeConstraint", {
                        MaxTextSize = 18
                    }) }) }) };
        local v52 = #v51;

        for i, v in v48 do
            v51[v52 + i] = v;
        end;

        v23[v24 + 2] = u3.createElement(AutoCanvasScrollingFrame, v49, v51);

        return u3.createFragment(v23);
    end)
};