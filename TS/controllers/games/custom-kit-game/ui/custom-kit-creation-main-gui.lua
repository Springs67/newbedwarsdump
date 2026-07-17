-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local DividerComponent = v1.DividerComponent;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Ripple = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "ripple").Ripple;
local CustomKitConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-constants").CustomKitConstants;
local CustomKitUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-util").CustomKitUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local CustomKitCreation_AbilityCustomizationGUI = RuntimeLib.import(script, script.Parent, "custom-kit-creation-ability-customization-gui").CustomKitCreation_AbilityCustomizationGUI;
local CustomKitCreation_KitSelectionGUI = RuntimeLib.import(script, script.Parent, "custom-kit-creation-kit-selection-gui").CustomKitCreation_KitSelectionGUI;
local CustomKitCreation_KitStatsGUI = RuntimeLib.import(script, script.Parent, "custom-kit-creation-kit-stats-gui").CustomKitCreation_KitStatsGUI;
local v5 = {};
local u6 = setmetatable({}, {
    __index = v5
});
u6.KitSelection = "kit-selection";
v5["kit-selection"] = "KitSelection";
u6.KitStats = "kit-stats";
v5["kit-stats"] = "KitStats";
u6.AbilityCustomization = "ability-customization";
v5["ability-customization"] = "AbilityCustomization";

local function v82(u7, p8) -- Line: 34
    -- upvalues: u6 (ref), u2 (copy), CustomKitConstants (copy), CustomKitUtil (copy), default (copy), ColorUtil (copy), Flamework (copy), u3 (copy), Button (copy), DeviceUtil (copy), Ripple (copy), Empty (copy), Theme (copy), DividerComponent (copy), CustomKitCreation_KitSelectionGUI (copy), CustomKitCreation_KitStatsGUI (copy), CustomKitCreation_AbilityCustomizationGUI (copy)
    local useState = p8.useState;
    local useEffect = p8.useEffect;
    local u9, u10 = useState(u6.KitSelection);
    local u11, u12 = useState(nil);
    local u13, u14 = useState(nil);
    local v15, u16 = useState(nil);
    local v17, u18 = useState("Custom Kit Creation");
    local v19, u20 = useState("");
    local v21, u22 = useState(false);
    local v23, u24 = useState(false);
    local u25, u26 = useState(false);
    local u27 = u2.new();
    useEffect(function() -- Line: 49
        -- upvalues: u27 (copy)
        return function() -- Line: 50
            -- upvalues: u27 (ref)
            u27:DoCleaning();
        end;
    end, {});
    local u28 = nil;
    local u29 = nil;

    local function v31(p30) -- Line: 55
        -- upvalues: u28 (ref), u7 (copy), u29 (ref)
        u28(u7.CustomKits[p30 + 1]);
        u29(p30);
    end;

    local u32 = nil;

    local function v34() -- Line: 60
        -- upvalues: u7 (copy), CustomKitConstants (ref), CustomKitUtil (ref), u14 (copy), u12 (copy), u18 (copy), u10 (copy), u6 (ref), u22 (copy), u32 (ref), u24 (copy), default (ref)
        if #u7.CustomKits >= CustomKitConstants.MaxKits then
            return nil;
        end;

        local v33 = CustomKitUtil.getNewKit();
        table.insert(u7.CustomKits, v33);
        u14(v33);
        u12(v33);
        u18(v33.name);
        u10(u6.KitStats);
        u22(true);
        u32(v33);
        u24(true);
        default.Client:Get("CustomKitCreation_SetKit"):SendToServer({
            customKit = v33
        });
    end;

    local function v36(p35) -- Line: 79
        -- upvalues: u7 (copy), u24 (copy)
        table.remove(u7.CustomKits, p35 + 1);
        u24(true);
    end;

    u29 = function(p37) -- Line: 85
        -- upvalues: u18 (copy), u7 (copy), u14 (copy), u32 (ref), u10 (copy), u6 (ref), u22 (copy)
        u18(u7.CustomKits[p37 + 1].name);
        u14(u7.CustomKits[p37 + 1]);
        u32(u7.CustomKits[p37 + 1]);
        u10(u6.KitStats);
        u22(true);
    end;

    u32 = function(p38) -- Line: 92
        -- upvalues: u13 (copy), CustomKitUtil (ref), u20 (copy), ColorUtil (ref), CustomKitConstants (ref)
        if not (p38 or u13) then
            return nil;
        end;

        local v39 = CustomKitUtil.getTotalKitCost(p38 or u13);
        u20("Points used: <font color=\"" .. ColorUtil.richTextColor(Color3.fromRGB(255, 230, 69)) .. "\"><b>" .. tostring(v39) .. " / " .. tostring(CustomKitConstants.MaxKitPoints) .. "</b></font>");
    end;

    local function v43(p40) -- Line: 99
        -- upvalues: CustomKitUtil (ref), u13 (copy), CustomKitConstants (ref), u16 (copy), u10 (copy), u6 (ref), u22 (copy), u18 (copy)
        local v41 = CustomKitUtil.getAbilityInSlot(u13, p40);

        if not v41 then
            local v42 = u13;

            if v42 ~= nil then
                v42 = v42.abilities;
            end;

            if v42 == nil then
                return nil;
            end;

            if #u13.abilities >= CustomKitConstants.MaxAbilities then
                return nil;
            end;

            v41 = CustomKitUtil.getNewAbility();
            u13.abilities[p40 + 1] = v41;
        end;

        u16(v41);
        u10(u6.AbilityCustomization);
        u22(true);
        u18(u13.name .. " > " .. v41.name);
    end;

    local function v45(p44) -- Line: 121
    end;

    local function u47() -- Line: 122
        -- upvalues: u9 (copy), u6 (ref), u10 (copy), u16 (copy), u13 (copy), u18 (copy), u14 (copy), u22 (copy)
        if u9 ~= u6.AbilityCustomization then
            if u9 == u6.KitStats then
                u10(u6.KitSelection);
                u14(nil);
                u18("Custom Kit Creation");
                u22(false);
            end;

            return;
        end;

        u10(u6.KitStats);
        u16(nil);
        local v46 = u13;

        if v46 ~= nil then
            v46 = v46.name;
        end;

        u18((tostring(v46)));
    end;

    local function v49(p48) -- Line: 138
        -- upvalues: u18 (copy)
        u18(p48.name);
    end;

    local function _() -- Line: 141
        -- upvalues: u7 (copy), u24 (copy), u13 (copy), u28 (ref), u11 (copy), Flamework (ref)
        task.spawn(function() -- Line: 142
            -- upvalues: u7 (ref), u24 (ref), u13 (ref), u28 (ref), u11 (ref), Flamework (ref)
            if u7.OnSave() then
                u24(false);

                if u13 ~= nil then
                    u28(u11);
                end;
            else
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    message = "Couldn\'t save your kit changes. Make sure all of your kits are under the point limit."
                });
            end;
        end);
    end;

    local function v50() -- Line: 156
        -- upvalues: u24 (copy)
        u24(true);
    end;

    u28 = function(p51) -- Line: 159
        -- upvalues: u12 (copy), u11 (copy), default (ref)
        u12(p51);

        if u11 == nil then
            return nil;
        end;

        default.Client:Get("CustomKitCreation_SetKit"):SendToServer({
            customKit = u11
        });
    end;

    local v52 = {
        DisplayOrder = 19,
        ResetOnSpawn = false
    };
    local v53 = {};
    local _ = #v53;
    local v54 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(0.3, 0.9),
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 10, 0.5, 0),
        BackgroundColor3 = ColorUtil.BLACK,
        Visible = not u25
    };
    local v55 = {};
    local v56 = #v55;

    if v23 then
        v23 = u3.createFragment({
            CustomKitCreation_Main_SaveButton = u3.createElement(Button, {
                Text = "Save Changes",
                Selectable = true,
                ZIndex = 60,
                Size = UDim2.new(0.4, 0, 0, DeviceUtil.isSmallScreen() and 25 or 40),
                Position = UDim2.new(1, 0, 0, 10),
                AnchorPoint = Vector2.new(1, 1),
                BackgroundColor3 = Color3.fromRGB(0, 170, 0),

                OnClick = function() -- Line: 193, Name: OnClick
                    -- upvalues: u7 (copy), u24 (copy), u13 (copy), u28 (ref), u11 (copy), Flamework (ref)
                    task.spawn(function() -- Line: 142
                        -- upvalues: u7 (ref), u24 (ref), u13 (ref), u28 (ref), u11 (ref), Flamework (ref)
                        if u7.OnSave() then
                            u24(false);

                            if u13 ~= nil then
                                u28(u11);
                            end;
                        else
                            Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                                message = "Couldn\'t save your kit changes. Make sure all of your kits are under the point limit."
                            });
                        end;
                    end);
                end,

                TextLabel = {
                    ZIndex = 61,
                    Size = UDim2.fromScale(0.8, 0.55)
                }
            }, { u3.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(150, 9999)
                }), u3.createElement(Ripple) })
        });
    end;

    if v23 then
        v55[v56 + 1] = v23;
    end;

    v55[#v55 + 1] = u3.createElement("UISizeConstraint", {
        MinSize = Vector2.new(300, 0)
    });
    v53.SaveButton_Container = u3.createElement(Empty, v54, v55);
    v53.MinimizeButton_Container = u3.createElement(Empty, {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(0.3, 0.9),
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 10, 0.5, 0),
        BackgroundColor3 = ColorUtil.BLACK
    }, {
        CustomKitCreation_Main_MinimizeButton = u3.createElement(Button, {
            Selectable = true,
            ZIndex = 60,
            Size = UDim2.new(0.4, 0, 0, DeviceUtil.isSmallScreen() and 25 or 40),
            Position = UDim2.new(0, 0, 0, 10),
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = Theme.backgroundPrimary,
            Text = u25 and "SHOW" or "HIDE",

            OnClick = function() -- Line: 231, Name: OnClick
                -- upvalues: u26 (copy), u25 (copy)
                u26(not u25);
            end,

            TextLabel = {
                ZIndex = 61,
                Size = UDim2.fromScale(0.8, 0.55),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
            }
        }, { u3.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(150, 9999)
            }) }),
        u3.createElement("UISizeConstraint", {
            MinSize = Vector2.new(300, 0)
        })
    });
    local v57 = {
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Size = UDim2.fromScale(0.3, 0.85),
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 10, 0.5, 10),
        BackgroundColor3 = ColorUtil.BLACK,
        Visible = not u25
    };
    local v58 = {
        u3.createElement("UISizeConstraint", {
            MinSize = Vector2.new(300, 0)
        }),
        u3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }),
        u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            HorizontalAlignment = "Center",
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8)
        }),
        u3.createElement("UIPadding", {
            PaddingTop = UDim.new(0.02, 0)
        })
    };
    local v59 = #v58;
    local v60 = {
        LayoutOrder = 0,
        Size = UDim2.fromScale(1, 0.07)
    };
    local v61 = {};
    local createElement = u3.createElement;
    local v62 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(0.95, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5)
    };
    local v63 = {};
    local createElement2 = u3.createElement;
    local v64 = {
        TextTransparency = 0,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Text = v17,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
    };
    local v65;

    if DeviceUtil.isSmallScreen() then
        v65 = Enum.FontSize.Size18;
    else
        v65 = Enum.FontSize.Size28;
    end;

    v64.FontSize = v65;
    v64.TextXAlignment = Enum.TextXAlignment.Left;
    v63.CustomKitCreation_Main_Header_Text = createElement2("TextLabel", v64);
    v61.CustomKitCreation_Main_Header_Frame = createElement("Frame", v62, v63);
    local v66 = #v61;
    local v67;

    if v21 then
        v67 = u3.createElement(Button, {
            Text = "Back",
            Selectable = true,
            ZIndex = 60,
            Size = UDim2.fromScale(0.2, 0.8),
            Position = UDim2.fromScale(0.99, 0.5),
            AnchorPoint = Vector2.new(1, 0.5),
            BackgroundColor3 = Theme.mcDarkGray,

            OnClick = function() -- Line: 312, Name: OnClick
                -- upvalues: u47 (copy)
                u47();
            end,

            TextLabel = {
                ZIndex = 61,
                Size = UDim2.fromScale(0.8, 0.55)
            }
        });
    else
        v67 = v21;
    end;

    if v67 then
        v61[v66 + 1] = v67;
    end;

    v58.CustomKitCreation_Main_Header = u3.createElement(Empty, v60, v61);

    if v21 then
        local createFragment = u3.createFragment;
        local v68 = {};
        local createElement3 = u3.createElement;
        local v69 = {
            LayoutOrder = 10,
            Size = UDim2.fromScale(1, 0.06)
        };
        local v70 = {};
        local createElement4 = u3.createElement;
        local v71 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.95, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local v72 = {};
        local createElement5 = u3.createElement;
        local v73 = {
            AutomaticSize = "X",
            TextTransparency = 0,
            RichText = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Text = v19,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Font = Enum.Font.Roboto
        };
        local v74;

        if DeviceUtil.isSmallScreen() then
            v74 = Enum.FontSize.Size18;
        else
            v74 = Enum.FontSize.Size24;
        end;

        v73.FontSize = v74;
        v73.TextXAlignment = Enum.TextXAlignment.Left;
        v72.CustomKitCreation_Sub_Header_Text = createElement5("TextLabel", v73);
        v70.CustomKitCreation_Sub_Header_Frame = createElement4("Frame", v71, v72);
        v68.CustomKitCreation_Sub_Header = createElement3(Empty, v69, v70);
        v21 = createFragment(v68);
    end;

    if v21 then
        v58[v59 + 1] = v21;
    end;

    v58[#v58 + 1] = u3.createElement(DividerComponent, {
        LayoutOrder = 20,
        Size = UDim2.new(0.95, 0, 0, 10)
    });
    local v75 = {
        LayoutOrder = 100,
        Size = UDim2.fromScale(1, 0.9)
    };
    local v76 = {};
    local v77 = #v76;
    local v78;

    if u9 == u6.KitSelection then
        v78 = u3.createElement(CustomKitCreation_KitSelectionGUI, {
            CustomKits = u7.CustomKits,
            CurrentKit = u11,
            OnKitSlotClicked = v31,
            OnAddKitSlotClicked = v34,
            OnEditKitSlotClicked = u29,
            OnDeleteKitSlotClicked = v36
        });
    else
        v78 = false;
    end;

    if v78 then
        v76[v77 + 1] = v78;
    end;

    local v79 = #v76;
    local v80;

    if u9 == u6.KitStats then
        if u13 then
            v80 = u3.createElement(CustomKitCreation_KitStatsGUI, {
                CurrentKit = u13,
                OnAbilityClicked = v43,
                OnDeleteAbilityClicked = v45,
                OnPointsChanged = u32,
                OnNameChanged = v49,
                OnChangesMade = v50
            });
        else
            v80 = u13;
        end;
    else
        v80 = false;
    end;

    if v80 then
        v76[v79 + 1] = v80;
    end;

    local v81 = #v76;

    if u9 == u6.AbilityCustomization then
        if u13 then
            if v15 then
                v15 = u3.createElement(CustomKitCreation_AbilityCustomizationGUI, {
                    CustomKit = u13,
                    Ability = v15,
                    UpdateCurrentAbility = u16,
                    OnPointsChanged = u32,
                    OnChangesMade = v50
                });
            end;
        else
            v15 = u13;
        end;
    else
        v15 = false;
    end;

    if v15 then
        v76[v81 + 1] = v15;
    end;

    v58.CustomKitCreation_Main_Content = u3.createElement(Empty, v75, v76);
    v53.CustomKitCreation_Main_Frame = u3.createElement("Frame", v57, v58);

    return u3.createFragment({
        CustomKitCreation_MainGui = u3.createElement("ScreenGui", v52, v53)
    });
end;

return {
    CustomKitCreation_MainGUI = v4.new(u3)(v82)
};