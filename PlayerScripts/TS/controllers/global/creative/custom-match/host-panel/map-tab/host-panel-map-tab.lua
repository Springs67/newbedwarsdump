-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local Workspace = v5.Workspace;
local ToggleButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "button-group", "toggle-button").ToggleButton;
local ToggleButtonGroup = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "button-group", "toggle-button-group").ToggleButtonGroup;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto");
local HostPanelToggle = v6.HostPanelToggle;
local HostPanelToggleValue = v6.HostPanelToggleValue;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local MapSaveUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "map-save-util").MapSaveUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local HostPanelSetting = RuntimeLib.import(script, script.Parent.Parent, "components", "host-panel-setting").HostPanelSetting;
local MapSaveCard = RuntimeLib.import(script, script.Parent, "map-save-card").MapSaveCard;

return {
    HostPanelMapTab = v4.new(u3)(function(p7, p8) -- Line: 26
        -- upvalues: MapSaveUtil (copy), Players (copy), u2 (copy), Workspace (copy), KnitClient (copy), Flamework (copy), ColorUtil (copy), Theme (copy), u3 (copy), Empty (copy), MapSaveCard (copy), SoundManager (copy), GameSound (copy), BedwarsImageId (copy), HostPanelSetting (copy), ToggleButtonGroup (copy), HostPanelToggle (copy), ToggleButton (copy), HostPanelToggleValue (copy)
        local useState = p8.useState;
        local useEffect = p8.useEffect;
        local u9, u10 = useState(false);
        local v11, u12 = useState(not p7.store.CustomMatch.mapSaves);
        local v13, u14 = useState(0);
        local mapSaveData = p7.store.CustomMatch.mapSaveData;

        if mapSaveData then
            local mapSaveData2 = p7.store.CustomMatch.mapSaveData;

            if mapSaveData2 ~= nil then
                mapSaveData2 = mapSaveData2.creatorUserId;
            end;

            mapSaveData = MapSaveUtil:canBypassCopylock(Players.LocalPlayer, mapSaveData2);
        end;

        useEffect(function() -- Line: 43
            -- upvalues: u2 (ref), Workspace (ref), u14 (copy), KnitClient (ref), u12 (copy)
            local u15 = u2.new();
            local Map = Workspace:FindFirstChild("Map");

            if Map ~= nil then
                Map = Map:FindFirstChild("Worlds");

                if Map ~= nil then
                    Map = Map:FindFirstChildWhichIsA("Folder");
                end;
            end;

            if Map == nil then
                u15:GiveTask(Workspace.ChildAdded:Connect(function(p16) -- Line: 58
                    -- upvalues: Workspace (ref), u14 (ref)
                    if p16.Name == "Map" then
                        local Map2 = Workspace:FindFirstChild("Map");

                        if Map2 ~= nil then
                            Map2 = Map2:FindFirstChild("Worlds");

                            if Map2 ~= nil then
                                Map2 = Map2:FindFirstChildWhichIsA("Folder");
                            end;
                        end;

                        if not Map2 then
                            return nil;
                        end;

                        u14(#Map2.Blocks:GetChildren() + #Map2.BreakableBlocks:GetChildren());
                    end;
                end));
            else
                u14(#Map.Blocks:GetChildren() + #Map.BreakableBlocks:GetChildren());
            end;

            local u17 = KnitClient.Controllers.CustomMatchController:getMySavedMaps();
            u17:andThen(function() -- Line: 78
                -- upvalues: u12 (ref)
                u12(false);
            end);

            return function() -- Line: 82
                -- upvalues: u15 (copy), u17 (copy)
                u15:DoCleaning();
                u17:cancel();
            end;
        end, {});

        local function _() -- Line: 87
            -- upvalues: u10 (copy), KnitClient (ref), Flamework (ref)
            u10(true);
            KnitClient.Controllers.CustomMatchController:saveMap():andThen(function(p18) -- Line: 90
                -- upvalues: u10 (ref), Flamework (ref)
                u10(false);

                if not p18 then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                        message = "Error: Could not save the map."
                    });
                end;
            end);
        end;

        local mapSaveData2 = p7.store.CustomMatch.mapSaveData;

        if mapSaveData2 ~= nil then
            mapSaveData2 = mapSaveData2.copylocked;
        end;

        local v19;

        if mapSaveData2 == true and not mapSaveData then
            local v20 = {
                Size = UDim2.fromScale(1, 0.6)
            };
            local v21 = {};
            local v22 = {
                Size = UDim2.fromScale(1, 1)
            };
            local v23 = ColorUtil.richTextColor(ColorUtil.WHITE);
            local mapSaveData3 = p7.store.CustomMatch.mapSaveData;

            if mapSaveData3 ~= nil then
                mapSaveData3 = mapSaveData3.mapTitle;
            end;

            v22.Text = "<b>Copying this map<font color=\"" .. v23 .. "\">(" .. mapSaveData3 .. ")</font> has been disabled by the creator (" .. tostring(p7.store.CustomMatch.mapSaveData.creatorUserId) .. ")</b>";
            v22.TextScaled = true;
            v22.RichText = true;
            v22.Font = "Roboto";
            v22.TextColor3 = Theme.backgroundError;
            v22.TextXAlignment = "Center";
            v22.TextYAlignment = "Center";
            v22.BackgroundTransparency = 1;
            v22.LayoutOrder = 0;
            v21[#v21 + 1] = u3.createElement("TextLabel", v22, { u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = 20
                }) });
            v19 = u3.createElement(Empty, v20, v21);
        else
            local v24 = {};
            local v25 = #v24;
            local v26 = {
                AutomaticSize = "Y",
                SizeConstraint = "RelativeXX",
                Size = UDim2.fromScale(1, 0)
            };
            local mapSaves = p7.store.CustomMatch.mapSaves;
            local v27 = mapSaves ~= nil and #mapSaves or mapSaves;
            v26.Text = "<b>MAP (" .. tostring(v27 == nil and 0 or v27) .. "/" .. tostring(MapSaveUtil.MAX_MAP_SAVES) .. ")</b>";
            v26.TextScaled = true;
            v26.RichText = true;
            v26.Font = "Roboto";
            v26.TextColor3 = Theme.textPrimary;
            v26.TextXAlignment = "Left";
            v26.TextYAlignment = "Bottom";
            v26.BackgroundTransparency = 1;
            v26.LayoutOrder = 0;
            v24[v25 + 1] = u3.createElement("TextLabel", v26, { u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = 20
                }) });
            local v28;

            if v11 then
                v28 = u3.createElement("TextLabel", {
                    Text = "LOADING MAP SAVES",
                    TextScaled = true,
                    TextXAlignment = "Center",
                    TextYAlignment = "Center",
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 0.75),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    TextColor3 = Theme.textPrimary
                }, { u3.createElement("UITextSizeConstraint", {
                        MaxTextSize = 20
                    }) });
            else
                local mapSaves2 = p7.store.CustomMatch.mapSaves;
                local v29;

                if mapSaves2 == nil then
                    v29 = mapSaves2;
                else
                    local function v32(p30, p31) -- Line: 189
                        -- upvalues: u3 (ref), MapSaveCard (ref)
                        return u3.createFragment({
                            [p30.code] = u3.createElement(MapSaveCard, {
                                MapSave = p30,
                                ContainerProps = {
                                    LayoutOrder = p31
                                }
                            })
                        });
                    end;

                    v29 = table.create(#mapSaves2);

                    for i, v in mapSaves2 do
                        v29[i] = v32(v, i - 1, mapSaves2);
                    end;
                end;

                local v33 = {};
                local v34 = #v33;

                if v29 then
                    for i, v in v29 do
                        v33[v34 + i] = v;
                    end;
                end;

                local v35 = #v33;
                local mapSaves3 = p7.store.CustomMatch.mapSaves;
                local v36 = mapSaves3 ~= nil and #mapSaves3 or mapSaves3;
                local v37 = (v36 == nil and 0 or v36) < MapSaveUtil.MAX_MAP_SAVES;

                if v37 then
                    local createFragment = u3.createFragment;
                    local v38 = {};
                    local createElement = u3.createElement;
                    local v40 = {
                        Size = UDim2.fromScale(0.3, 1),
                        BackgroundColor3 = Theme.backgroundTertiary,
                        BorderSizePixel = 0,
                        LayoutOrder = MapSaveUtil.MAX_MAP_SAVES,

                        [u3.Event.Activated] = function() -- Line: 231
                            -- upvalues: u9 (copy), SoundManager (ref), GameSound (ref), u10 (copy), KnitClient (ref), Flamework (ref)
                            if u9 then
                                return nil;
                            end;

                            SoundManager:playSound(GameSound.UI_CLICK);
                            u10(true);
                            KnitClient.Controllers.CustomMatchController:saveMap():andThen(function(p39) -- Line: 90
                                -- upvalues: u10 (ref), Flamework (ref)
                                u10(false);

                                if not p39 then
                                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                                        message = "Error: Could not save the map."
                                    });
                                end;
                            end);
                        end,

                        AutoButtonColor = not u9
                    };
                    local v41 = {};
                    local v42 = u3.createElement("UIListLayout", {
                        FillDirection = "Vertical",
                        VerticalAlignment = "Center",
                        HorizontalAlignment = "Center",
                        SortOrder = "LayoutOrder",
                        Padding = UDim.new(0.075, 0)
                    });
                    local v43;

                    if u9 then
                        v43 = u3.createElement("TextLabel", {
                            Text = "<b>SAVING...</b>",
                            RichText = true,
                            TextScaled = true,
                            TextTransparency = 0.5,
                            BackgroundTransparency = 1,
                            LayoutOrder = 2,
                            Size = UDim2.fromScale(0.75, 0.25),
                            TextColor3 = ColorUtil.hexColor(9541119)
                        });
                    else
                        v43 = u3.createFragment({ u3.createElement("ImageLabel", {
                                ScaleType = "Fit",
                                BackgroundTransparency = 1,
                                LayoutOrder = 1,
                                Size = UDim2.fromScale(0.25, 0.25),
                                Image = BedwarsImageId.PLUS
                            }), u3.createElement("TextLabel", {
                                Text = "<b>SAVE MAP</b>",
                                RichText = true,
                                TextScaled = true,
                                TextTransparency = 0.5,
                                BackgroundTransparency = 1,
                                LayoutOrder = 2,
                                Size = UDim2.fromScale(0.75, 0.25),
                                TextColor3 = ColorUtil.hexColor(9541119)
                            }) });
                    end;

                    v41[1], v41[2] = v42, v43;
                    v38.SaveMap = createElement("ImageButton", v40, v41);
                    v37 = createFragment(v38);
                end;

                if v37 then
                    v33[v35 + 1] = v37;
                end;

                v28 = u3.createFragment(v33);
            end;

            local v44 = {
                ScrollBarThickness = 6,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 0.6),
                CanvasSize = UDim2.fromScale(0, 0),
                AutomaticCanvasSize = Enum.AutomaticSize.X,
                ScrollingDirection = Enum.ScrollingDirection.X
            };
            local v45 = {
                u3.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0.03, 0)
                }),
                [#v45 + 1] = v28
            };
            v24[v25 + 2] = u3.createElement("ScrollingFrame", v44, v45);
            v19 = u3.createFragment(v24);
        end;

        local v46 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v47 = {
            u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                HorizontalAlignment = "Left",
                Padding = UDim.new(0, 10)
            }),
            [#v47 + 1] = v19
        };
        local v48 = #v47;
        v47[v48 + 1] = u3.createElement("TextLabel", {
            AutomaticSize = "Y",
            SizeConstraint = "RelativeXX",
            TextScaled = true,
            RichText = true,
            Font = "Roboto",
            TextXAlignment = "Left",
            TextYAlignment = "Bottom",
            BackgroundTransparency = 1,
            LayoutOrder = 0,
            Size = UDim2.fromScale(1, 0),
            Text = "<b>" .. tostring(v13) .. " blocks in the map</b>",
            TextColor3 = Theme.textPrimary
        }, { u3.createElement("UITextSizeConstraint", {
                MaxTextSize = 20
            }) });
        v47[v48 + 2] = u3.createElement(HostPanelSetting, {
            Name = "Ignore Build Restricted Regions",
            Hint = "(ex. Allows block placing near spawn points and outside the map)",
            Size = UDim2.new(0.95, 0, 0, 50)
        }, { u3.createElement(ToggleButtonGroup, {
                Value = p7.store.CustomMatch.generalToggles[HostPanelToggle.IgnoreBuildRestrictedRegions],

                OnChange = function(p49) -- Line: 343, Name: OnChange
                    -- upvalues: KnitClient (ref), HostPanelToggle (ref)
                    KnitClient.Controllers.CustomMatchController:setToggle(HostPanelToggle.IgnoreBuildRestrictedRegions, p49);
                end
            }, { u3.createElement(ToggleButton, {
                    Text = "On",
                    Value = HostPanelToggleValue.ON
                }), u3.createElement(ToggleButton, {
                    Text = "Off",
                    Value = HostPanelToggleValue.OFF,
                    ActiveColor = Theme.backgroundError
                }), u3.createElement(ToggleButton, {
                    Text = "Host Only",
                    Value = HostPanelToggleValue.HOST_ONLY
                }) }) });
        v47[v48 + 3] = u3.createElement(HostPanelSetting, {
            Name = "Out of bounds damage",
            Hint = "Apply damage when players go outside of the map borders",
            Size = UDim2.new(0.95, 0, 0, 50)
        }, { u3.createElement(ToggleButtonGroup, {
                Value = p7.store.CustomMatch.generalToggles[HostPanelToggle.MapBorderDamage],

                OnChange = function(p50) -- Line: 369, Name: OnChange
                    -- upvalues: KnitClient (ref), HostPanelToggle (ref)
                    KnitClient.Controllers.CustomMatchController:setToggle(HostPanelToggle.MapBorderDamage, p50);
                end
            }, { u3.createElement(ToggleButton, {
                    Text = "On",
                    Value = HostPanelToggleValue.ON
                }), u3.createElement(ToggleButton, {
                    Text = "Off",
                    Value = HostPanelToggleValue.OFF,
                    ActiveColor = Theme.backgroundError
                }) }) });

        return u3.createElement(Empty, v46, v47);
    end)
};