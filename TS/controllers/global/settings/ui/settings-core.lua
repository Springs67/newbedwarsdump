-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ButtonComponent = v1.ButtonComponent;
local DeviceUtil = v1.DeviceUtil;
local TabsComponent = v1.TabsComponent;
local UIUtil = v1.UIUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v6.Players;
local RunService = v6.RunService;
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "custom-match", "custom-match-role");
local CustomMatchRole = v7.CustomMatchRole;
local CustomMatchRoleAttribute = v7.CustomMatchRoleAttribute;
local SettingMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-meta").SettingMeta;
local v8 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types");
local SettingSection = v8.SettingSection;
local SettingsTab = v8.SettingsTab;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local SettingsKeyboardControlPage = RuntimeLib.import(script, script.Parent, "keyboard-controls", "settings-keyboard-controls-page").SettingsKeyboardControlPage;
local MobileLayoutCustomizationApp = RuntimeLib.import(script, script.Parent, "mobile-controls", "mobile-layout-customization-app").MobileLayoutCustomizationApp;
local SettingsTabPage = RuntimeLib.import(script, script.Parent, "settings-tab-page").SettingsTabPage;

return {
    SettingsCore = v5.new(u4)(function(u9, p10) -- Line: 29
        -- upvalues: u4 (copy), SettingsTab (copy), RunService (copy), u3 (copy), DeviceUtil (copy), KnitClient (copy), Players (copy), CustomMatchRoleAttribute (copy), CustomMatchRole (copy), UIUtil (copy), u2 (copy), TabsComponent (copy), SettingMeta (copy), SettingsTabPage (copy), SettingSection (copy), SettingsKeyboardControlPage (copy), ButtonComponent (copy), Theme (copy), Flamework (copy), MobileLayoutCustomizationApp (copy), AutoCanvasScrollingFrame (copy)
        local useState = p10.useState;
        local useEffect = p10.useEffect;
        local u11 = u4.createRef();
        local u12, u13 = useState(SettingsTab.GENERAL);
        local u14, u15 = useState(RunService:IsStudio() and true or false);
        local u16 = u3.new();
        local u17 = RunService:IsStudio() and true or DeviceUtil.isMobileControls();
        useEffect(function() -- Line: 37
            -- upvalues: DeviceUtil (ref), KnitClient (ref), Players (ref), CustomMatchRoleAttribute (ref), CustomMatchRole (ref), u15 (copy)
            if DeviceUtil.isHoarceKat() then
                return nil;
            end;

            if KnitClient.Controllers.PermissionController:hasPermission("freecam") or Players.LocalPlayer:GetAttribute(CustomMatchRoleAttribute) == CustomMatchRole.COHOST then
                u15(true);
            end;
        end, {});
        useEffect(function() -- Line: 46
            -- upvalues: DeviceUtil (ref), u11 (copy), UIUtil (ref)
            if DeviceUtil.isHoarceKat() then
                return nil;
            end;

            if DeviceUtil.isGamepadControls() then
                UIUtil:selectGui((u11:getValue()));
            end;
        end, {});
        local v18 = {
            AdditionalSpace = 10,
            ScrollingFrameProps = {
                ScrollBarThickness = 6,
                BorderSizePixel = 0,
                LayoutOrder = 1,
                Size = UDim2.new(1, 0, 1, 0),
                ScrollingDirection = Enum.ScrollingDirection.Y
            },
            ScrollingFrameRef = u11
        };
        local v19 = { u4.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Left",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 8)
            }) };
        local v20 = #v19;

        local function _(p21) -- Line: 79
            return true;
        end;

        local v22 = 0;
        local v23 = {};
        local v24 = {
            Value = u12
        };

        for i, v in u2.values(SettingsTab) do
            local _ = i - 1;

            if true == true then
                v22 = v22 + 1;
                v23[v22] = v;
            end;
        end;

        local function _(p25) -- Line: 97
            return {
                value = p25,
                text = p25
            };
        end;

        local v26 = 0;
        local v27 = {};

        for i, v in v23 do
            local _ = i - 1;
            local v28 = {
                value = v,
                text = v
            };

            if v28 ~= nil then
                v26 = v26 + 1;
                v27[v26] = v28;
            end;
        end;

        v24.Tabs = v27;

        function v24.OnChange(p29) -- Line: 115
            -- upvalues: u13 (copy)
            u13(p29.value);
        end;

        v24.UIListLayout = {
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        };
        v24.FrameProps = {
            LayoutOrder = 1,
            Size = UDim2.new(0, 1, 0, (DeviceUtil.isSmallScreen() and 1.9 or 1.8) * 24)
        };
        v24.ButtonUIConfig = {
            Padding = {
                PaddingTop = UDim.new(0, 4),
                PaddingBottom = UDim.new(0, 4),
                PaddingLeft = UDim.new(0, 14),
                PaddingRight = UDim.new(0, 14)
            }
        };
        v19[v20 + 1] = u4.createElement(TabsComponent, v24);
        local v30 = u2.values(SettingsTab);

        local function v41(u31) -- Line: 135
            -- upvalues: u12 (copy), SettingsTab (ref), u17 (copy), u2 (ref), SettingMeta (ref), u4 (ref), SettingsTabPage (ref), u9 (copy), SettingSection (ref), u14 (copy), KnitClient (ref)
            if u12 == SettingsTab.PC and u17 then
                return nil;
            end;

            if u12 == SettingsTab.MOBILE and not u17 then
                return nil;
            end;

            if u31 == SettingsTab.MOBILE_CONTROLS then
                return nil;
            end;

            local v32 = u2.entries(SettingMeta);
            table.sort(v32, function(p33, p34) -- Line: 148
                local _ = p33[1];
                local _ = p34[1];

                return p33[2].name < p34[2].name;
            end);

            local function _(p35) -- Line: 156
                -- upvalues: u31 (copy)
                local v36 = p35[1];

                if p35[2].tab == u31 then
                    return v36;
                end;
            end;

            local v37 = 0;
            local v38 = {};

            for i, v in v32 do
                local _ = i - 1;
                local v39 = v[1];

                if v[2].tab ~= u31 then
                    v39 = nil;
                end;

                if v39 ~= nil then
                    v37 = v37 + 1;
                    v38[v37] = v39;
                end;
            end;

            if #v38 == 0 then
                return nil;
            end;

            if u12 == u31 then
                return u4.createFragment({
                    [u31] = u4.createElement(SettingsTabPage, {
                        Tab = u31,
                        Settings = v38,
                        PlayerSettings = u9.Settings,

                        ExtraSettings = function(p40) -- Line: 188, Name: ExtraSettings
                            -- upvalues: u31 (copy), SettingsTab (ref), SettingSection (ref), u14 (ref), u4 (ref), KnitClient (ref)
                            if u31 == SettingsTab.GENERAL and (p40 == SettingSection.GAME and u14) then
                                return u4.createFragment({
                                    EnableFreecamButton = u4.createElement("ImageButton", {
                                        Size = UDim2.new(0.98, 0, 0, 25),
                                        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                                        BackgroundTransparency = 0.4,
                                        BorderSizePixel = 0,

                                        [u4.Event.Activated] = function() -- Line: 196
                                            -- upvalues: KnitClient (ref)
                                            KnitClient.Controllers.FreecamController:enableFreecamController();
                                        end
                                    }, { u4.createElement("TextLabel", {
                                            Text = "Enable Freecam",
                                            TextScaled = true,
                                            BackgroundTransparency = 1,
                                            AnchorPoint = Vector2.new(0.5, 0.5),
                                            Position = UDim2.fromScale(0.5, 0.5),
                                            Size = UDim2.fromScale(0.8, 0.6),
                                            TextColor3 = Color3.fromRGB(255, 255, 255),
                                            Font = Enum.Font.GothamMedium
                                        }) })
                                });
                            end;
                        end
                    })
                });
            end;

            return u4.createFragment();
        end;

        local v42 = 0;
        local v43 = {};

        for i, v in v30 do
            local v44 = v41(v, i - 1, v30);

            if v44 ~= nil then
                v42 = v42 + 1;
                v43[v42] = v44;
            end;
        end;

        for i, v in v43 do
            v19[v20 + 1 + i] = v;
        end;

        local v45 = #v19;
        local v46;

        if u12 == SettingsTab.KEYBINDS then
            v46 = not u17 and u4.createElement(SettingsKeyboardControlPage);
        else
            v46 = false;
        end;

        if v46 then
            v19[v45 + 1] = v46;
        end;

        local v47 = #v19;

        if u12 == SettingsTab.MOBILE_CONTROLS then
            if u17 then
                u17 = u4.createFragment({
                    CustomizeMobileLayoutButton = u4.createFragment({
                        CustomizeMobileLayoutButton = u4.createElement(ButtonComponent, {
                            Text = "Customize Mobile Button Layout",
                            LayoutOrder = 10,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Position = UDim2.fromScale(0.5, 0.5),
                            Size = UDim2.new(0.98, 0, 0, 45),
                            BackgroundColor3 = Theme.backgroundSuccess,

                            OnClick = function() -- Line: 246, Name: OnClick
                                -- upvalues: Flamework (ref), MobileLayoutCustomizationApp (ref), u16 (copy)
                                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
                                    appId = "MobileCustomizationApp",
                                    app = MobileLayoutCustomizationApp
                                }, {});
                                u16:DoCleaning();
                                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("SettingsApp");
                            end
                        }, { u4.createElement("UICorner", {
                                CornerRadius = UDim.new(0, 6)
                            }), u4.createElement("UISizeConstraint", {
                                MaxSize = Vector2.new(180, 45)
                            }) })
                    })
                });
            end;
        else
            u17 = false;
        end;

        if u17 then
            v19[v47 + 1] = u17;
        end;

        return u4.createFragment({
            SettingsList = u4.createElement(AutoCanvasScrollingFrame, v18, v19)
        });
    end)
};