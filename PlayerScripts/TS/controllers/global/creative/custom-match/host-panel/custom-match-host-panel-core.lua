-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local ScaleComponent = v1.ScaleComponent;
local SoundManager = v1.SoundManager;
local StringUtil = v1.StringUtil;
local WidgetComponent = v1.WidgetComponent;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local StudioQueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "studio-config-override").StudioQueueType;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local HostPanelTab = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-tab").HostPanelTab;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local ScriptEditorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "script-editor", "script-editor-util").ScriptEditorUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local HostPanelAuditLogTab = RuntimeLib.import(script, script.Parent, "audit-log-tab", "host-panel-audit-log-tab").HostPanelAuditLogTab;
local CustomMatchHostPanelTab = RuntimeLib.import(script, script.Parent, "custom-match-host-panel-tabs").CustomMatchHostPanelTab;
local HostPanelGeneralTab = RuntimeLib.import(script, script.Parent, "general-tab", "host-panel-general-tab").HostPanelGeneralTab;
local HostPanelOreGeneratorsTab = RuntimeLib.import(script, script.Parent, "generators-tab", "host-panel-ore-generators-tab").HostPanelOreGeneratorsTab;
local HostPanelItemsTab = RuntimeLib.import(script, script.Parent, "items-tab", "host-panel-items-tab").HostPanelItemsTab;
local HostPanelKitsTab = RuntimeLib.import(script, script.Parent, "kits-tab", "host-panel-kits-tab").HostPanelKitsTab;
local HostPanelMapTab = RuntimeLib.import(script, script.Parent, "map-tab", "host-panel-map-tab").HostPanelMapTab;
local HostPanelPlayersTab = RuntimeLib.import(script, script.Parent, "players-tab", "host-panel-players-tab").HostPanelPlayersTab;

return {
    CustomMatchHostPanel = v4.new(u3)(function(u5, p6) -- Line: 32
        -- upvalues: HostPanelTab (copy), DeviceUtil (copy), getQueueMeta (copy), StudioQueueType (copy), KnitClient (copy), SoundManager (copy), GameSound (copy), Theme (copy), u3 (copy), ScaleComponent (copy), Flamework (copy), u2 (copy), ScriptEditorUtil (copy), Players (copy), StringUtil (copy), CustomMatchHostPanelTab (copy), ColorUtil (copy), default (copy), HostPanelGeneralTab (copy), HostPanelKitsTab (copy), HostPanelItemsTab (copy), HostPanelPlayersTab (copy), HostPanelOreGeneratorsTab (copy), HostPanelMapTab (copy), HostPanelAuditLogTab (copy), Empty (copy), WidgetComponent (copy)
        local useEffect = p6.useEffect;
        local u7, u8 = p6.useState(HostPanelTab.GENERAL);
        local v9;

        if DeviceUtil.isHoarceKat() then
            v9 = getQueueMeta(StudioQueueType);
        else
            local v10 = KnitClient.Controllers.MatchController:getCustomMatchConfig();
            local v11;

            if v10 == nil then
                v11 = v10;
            else
                v11 = v10.queueType;
            end;

            if v11 then
                v9 = getQueueMeta(v10.queueType);
            else
                v9 = nil;
            end;
        end;

        useEffect(function() -- Line: 47
            -- upvalues: SoundManager (ref), GameSound (ref)
            return function() -- Line: 48
                -- upvalues: SoundManager (ref), GameSound (ref)
                SoundManager:playSound(GameSound.UI_CLOSE_2);
            end;
        end, {});
        useEffect(function() -- Line: 52
            -- upvalues: u7 (copy), HostPanelTab (ref), KnitClient (ref)
            if u7 == HostPanelTab.SCRIPTS then
                KnitClient.Controllers.ScriptEditorController:openScriptEditor();
            end;
        end, { u7 });
        local v12 = {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = Theme.widgetSize
        };
        local v13 = { u3.createElement(ScaleComponent, {
                MaximumSize = Theme.widgetScaleComponentMaxSize,
                ScreenPadding = Theme.widgetScaleComponentScreenPadding
            }) };
        local v14 = {
            ClipsDescendents = false,
            AppId = u5.AppId,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1)
        };
        local customMatch = u5.store.Game.customMatch;

        if customMatch ~= nil then
            customMatch = customMatch.joinCode;
        end;

        v14.Title = "Host Panel: " .. tostring(customMatch);

        function v14.OnClose() -- Line: 82
            -- upvalues: Flamework (ref), u5 (copy)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u5.AppId);
        end;

        v14.ContentUIPadding = u3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 0),
            PaddingBottom = UDim.new(0, 0),
            PaddingLeft = UDim.new(0, 0),
            PaddingRight = UDim.new(0, 0)
        });
        local v15 = { u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder"
            }) };
        local v16 = #v15;
        local v17 = u2.entries(HostPanelTab);

        local function v25(p18) -- Line: 99
            -- upvalues: HostPanelTab (ref), ScriptEditorUtil (ref), Players (ref), StringUtil (ref), u7 (copy), u8 (copy), u3 (ref), CustomMatchHostPanelTab (ref)
            local v19 = p18[1];
            local v20 = p18[2];

            if v20 == HostPanelTab.SCRIPTS and not ScriptEditorUtil:hasScriptEditorPermission(Players.LocalPlayer) then
                return nil;
            end;

            local v21 = string.split(v19, "_");

            local function _(p22) -- Line: 107
                -- upvalues: StringUtil (ref)
                return StringUtil.capitalizeFirstLetter(p22);
            end;

            local v23 = table.create(#v21);
            local v24 = {};

            for i, v in v21 do
                local _ = i - 1;
                v23[i] = StringUtil.capitalizeFirstLetter(v);
            end;

            v24.Name = table.concat(v23, " ");
            v24.Tab = v20;
            v24.ActiveTab = u7;
            v24.SetTab = u8;
            v24.LayoutOrder = v20;

            return u3.createElement(CustomMatchHostPanelTab, v24);
        end;

        local v26 = 0;
        local v27 = {};

        for i, v in v17 do
            local v28 = v25(v, i - 1, v17);

            if v28 ~= nil then
                v26 = v26 + 1;
                v27[v26] = v28;
            end;
        end;

        local v29 = {
            LayoutOrder = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.15, 1),
            BackgroundColor3 = Theme.backgroundTertiary
        };
        local v30 = { u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                HorizontalAlignment = "Center",
                Padding = UDim.new(0, 10)
            }), u3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 15)
            }) };
        local v31 = #v30;

        for i, v in v27 do
            v30[v31 + i] = v;
        end;

        v30[#v30 + 1] = u3.createElement("TextButton", {
            Size = UDim2.new(0.8, 0, 0, 30),
            BackgroundColor3 = Color3.fromRGB(255, 0, 0),
            BackgroundTransparency = 0.9,
            Font = "Roboto",
            Text = "<b>Restart</b>",
            TextColor3 = ColorUtil.WHITE,
            TextScaled = true,
            RichText = true,
            TextTransparency = 0,
            TextXAlignment = "Center",
            TextYAlignment = "Center",

            [u3.Event.Activated] = function() -- Line: 168
                -- upvalues: SoundManager (ref), GameSound (ref), default (ref), Flamework (ref)
                SoundManager:playSound(GameSound.UI_CLICK);
                default.Client:GetNamespace("CustomMatches"):Get("RestartCustomMatch"):CallServerAsync():expect();
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    message = "Restarting match..."
                });
            end,

            LayoutOrder = 99
        }, { u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 5)
            }), u3.createElement("UIPadding", {
                PaddingTop = UDim.new(0.15, 0),
                PaddingBottom = UDim.new(0.15, 0),
                PaddingLeft = UDim.new(0.15, 0),
                PaddingRight = UDim.new(0.15, 0)
            }), u3.createElement("UITextSizeConstraint", {
                MaxTextSize = 18
            }) });
        v15[v16 + 1] = u3.createElement("Frame", v29, v30);
        local v32 = u7 == HostPanelTab.GENERAL;

        if v32 then
            local v33;

            if v9 == nil then
                v33 = v9;
            else
                v33 = v9.customMatchConfig;

                if v33 ~= nil then
                    v33 = v33.hostPanel;

                    if v33 ~= nil then
                        v33 = table.find(v33.disabledPanelTabs, HostPanelTab.GENERAL) ~= nil;
                    end;
                end;
            end;

            v32 = not v33 and u3.createElement(HostPanelGeneralTab, {
                store = u5.store
            });
        end;

        local v34 = {
            LayoutOrder = 2,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.8, 1)
        };
        local v35 = { u3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 5),
                PaddingLeft = UDim.new(0.075, 0),
                PaddingRight = UDim.new(0.075, 0)
            }) };
        local v36 = #v35;

        if v32 then
            v35[v36 + 1] = v32;
        end;

        local v37 = #v35;
        local v38 = u7 == HostPanelTab.KITS;

        if v38 then
            local v39;

            if v9 == nil then
                v39 = v9;
            else
                v39 = v9.customMatchConfig;

                if v39 ~= nil then
                    v39 = v39.hostPanel;

                    if v39 ~= nil then
                        v39 = table.find(v39.disabledPanelTabs, HostPanelTab.KITS) ~= nil;
                    end;
                end;
            end;

            v38 = not v39 and u3.createElement(HostPanelKitsTab, {
                store = u5.store
            });
        end;

        if v38 then
            v35[v37 + 1] = v38;
        end;

        local v40 = #v35;
        local v41 = u7 == HostPanelTab.ITEMS;

        if v41 then
            local v42;

            if v9 == nil then
                v42 = v9;
            else
                v42 = v9.customMatchConfig;

                if v42 ~= nil then
                    v42 = v42.hostPanel;

                    if v42 ~= nil then
                        v42 = table.find(v42.disabledPanelTabs, HostPanelTab.ITEMS) ~= nil;
                    end;
                end;
            end;

            v41 = not v42 and u3.createElement(HostPanelItemsTab, {
                store = u5.store
            });
        end;

        if v41 then
            v35[v40 + 1] = v41;
        end;

        local v43 = #v35;
        local v44 = u7 == HostPanelTab.PLAYERS;

        if v44 then
            local v45;

            if v9 == nil then
                v45 = v9;
            else
                v45 = v9.customMatchConfig;

                if v45 ~= nil then
                    v45 = v45.hostPanel;

                    if v45 ~= nil then
                        v45 = table.find(v45.disabledPanelTabs, HostPanelTab.PLAYERS) ~= nil;
                    end;
                end;
            end;

            v44 = not v45 and u3.createElement(HostPanelPlayersTab, {
                store = u5.store
            });
        end;

        if v44 then
            v35[v43 + 1] = v44;
        end;

        local v46 = #v35;
        local v47 = u7 == HostPanelTab.GENERATORS;

        if v47 then
            local v48;

            if v9 == nil then
                v48 = v9;
            else
                v48 = v9.customMatchConfig;

                if v48 ~= nil then
                    v48 = v48.hostPanel;

                    if v48 ~= nil then
                        v48 = table.find(v48.disabledPanelTabs, HostPanelTab.GENERATORS) ~= nil;
                    end;
                end;
            end;

            v47 = not v48 and u3.createElement(HostPanelOreGeneratorsTab, {
                store = u5.store
            });
        end;

        if v47 then
            v35[v46 + 1] = v47;
        end;

        local v49 = #v35;
        local v50 = u7 == HostPanelTab.MAP;

        if v50 then
            local v51;

            if v9 == nil then
                v51 = v9;
            else
                v51 = v9.customMatchConfig;

                if v51 ~= nil then
                    v51 = v51.hostPanel;

                    if v51 ~= nil then
                        v51 = table.find(v51.disabledPanelTabs, HostPanelTab.MAP) ~= nil;
                    end;
                end;
            end;

            v50 = not v51 and u3.createElement(HostPanelMapTab, {
                store = u5.store
            });
        end;

        if v50 then
            v35[v49 + 1] = v50;
        end;

        local v52 = #v35;
        local v53 = u7 == HostPanelTab.AUDIT_LOG;

        if v53 then
            if v9 ~= nil then
                v9 = v9.customMatchConfig;

                if v9 ~= nil then
                    v9 = v9.hostPanel;

                    if v9 ~= nil then
                        v9 = table.find(v9.disabledPanelTabs, HostPanelTab.AUDIT_LOG) ~= nil;
                    end;
                end;
            end;

            v53 = not v9 and u3.createElement(HostPanelAuditLogTab, {
                AppId = "HostPanelAuditLogTab"
            });
        end;

        if v53 then
            v35[v52 + 1] = v53;
        end;

        v15[v16 + 2] = u3.createElement(Empty, v34, v35);
        v13[#v13 + 1] = u3.createElement(WidgetComponent, v14, v15);

        return u3.createElement("Frame", v12, v13);
    end)
};