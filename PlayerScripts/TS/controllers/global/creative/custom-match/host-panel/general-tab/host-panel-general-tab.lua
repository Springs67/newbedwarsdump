-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local DeviceUtil = v1.DeviceUtil;
local DropdownComponent = v1.DropdownComponent;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ToggleButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "button-group", "toggle-button").ToggleButton;
local ToggleButtonGroup = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "button-group", "toggle-button-group").ToggleButtonGroup;
local StudioQueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "studio-config-override").StudioQueueType;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto");
local HostPanelDropdown = v4.HostPanelDropdown;
local HostPanelToggle = v4.HostPanelToggle;
local HostPanelToggleValue = v4.HostPanelToggleValue;
local LiveServerVisibilityMode = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "server-browser", "server-browser-types").LiveServerVisibilityMode;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local HostPanelSetting = RuntimeLib.import(script, script.Parent.Parent, "components", "host-panel-setting").HostPanelSetting;
local HostPanelTextBox = RuntimeLib.import(script, script.Parent.Parent, "components", "host-panel-textbox").HostPanelTextBox;
local u5 = UDim2.new(0.95, 0, 0, 50);

return {
    HostPanelGeneralTab = v3.new(u2)(function(p6, p7) -- Line: 23
        -- upvalues: DeviceUtil (copy), getQueueMeta (copy), StudioQueueType (copy), KnitClient (copy), HostPanelToggle (copy), u2 (copy), HostPanelSetting (copy), u5 (copy), ToggleButtonGroup (copy), ToggleButton (copy), HostPanelToggleValue (copy), LiveServerVisibilityMode (copy), Theme (copy), HostPanelTextBox (copy), DropdownComponent (copy), HostPanelDropdown (copy), AutoCanvasScrollingFrame (copy)
        local _ = p7.useState;
        local _ = p7.useEffect;
        local v8;

        if DeviceUtil.isHoarceKat() then
            v8 = getQueueMeta(StudioQueueType);
        else
            local v9 = KnitClient.Controllers.MatchController:getCustomMatchConfig();
            local v10;

            if v9 == nil then
                v10 = v9;
            else
                v10 = v9.queueType;
            end;

            if v10 then
                v8 = getQueueMeta(v9.queueType);
            else
                v8 = nil;
            end;
        end;

        local v11;

        if v8 == nil then
            v11 = v8;
        else
            v11 = v8.customMatchConfig;

            if v11 ~= nil then
                v11 = v11.hostPanel;

                if v11 ~= nil then
                    v11 = table.find(v11.disabledToggles, HostPanelToggle.GameVisibilityMode) ~= nil;
                end;
            end;
        end;

        local v13 = not v11 and u2.createElement(HostPanelSetting, {
            Name = "Visibility Mode",
            Hint = "(Let others find your game)",
            Size = u5
        }, { u2.createElement(ToggleButtonGroup, {
                Value = p6.store.CustomMatch.generalToggles[HostPanelToggle.GameVisibilityMode],

                OnChange = function(p12) -- Line: 58, Name: OnChange
                    -- upvalues: KnitClient (ref), HostPanelToggle (ref)
                    KnitClient.Controllers.CustomMatchController:setToggle(HostPanelToggle.GameVisibilityMode, p12);
                end
            }, { u2.createElement(ToggleButton, {
                    Value = HostPanelToggleValue.ON,
                    Text = string.upper(LiveServerVisibilityMode.PUBLIC)
                }), u2.createElement(ToggleButton, {
                    Value = HostPanelToggleValue.OFF,
                    Text = string.upper(LiveServerVisibilityMode.PRIVATE),
                    ActiveColor = Theme.backgroundError
                }) }) });
        local v14 = {
            AdditionalSpace = 150,
            ScrollingFrameProps = {
                Size = UDim2.new(1, 0, 1, 0)
            }
        };
        local v15 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                HorizontalAlignment = "Left",
                Padding = UDim.new(0, 10)
            }), u2.createElement("TextLabel", {
                AutomaticSize = "Y",
                SizeConstraint = "RelativeXX",
                Text = "<b>SERVER SETTINGS</b>",
                TextScaled = true,
                RichText = true,
                Font = "Roboto",
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0),
                TextColor3 = Theme.textPrimary
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 20
                }) }) };
        local v16 = #v15;

        if v13 then
            v15[v16 + 1] = v13;
        end;

        local v17 = #v15;
        local v18;

        if v8 == nil then
            v18 = v8;
        else
            v18 = v8.customMatchConfig;

            if v18 ~= nil then
                v18 = v18.hostPanel;

                if v18 ~= nil then
                    v18 = table.find(v18.disabledToggles, HostPanelToggle.LockServer) ~= nil;
                end;
            end;
        end;

        local v20 = not v18 and u2.createElement(HostPanelSetting, {
            Name = "Lock Server",
            Hint = "(Blocks player joins)",
            Size = u5
        }, { u2.createElement(ToggleButtonGroup, {
                Value = p6.store.CustomMatch.generalToggles[HostPanelToggle.LockServer],

                OnChange = function(p19) -- Line: 131, Name: OnChange
                    -- upvalues: KnitClient (ref), HostPanelToggle (ref)
                    KnitClient.Controllers.CustomMatchController:setToggle(HostPanelToggle.LockServer, p19);
                end
            }, { u2.createElement(ToggleButton, {
                    Text = "On",
                    Value = HostPanelToggleValue.ON
                }), u2.createElement(ToggleButton, {
                    Text = "Off",
                    Value = HostPanelToggleValue.OFF,
                    ActiveColor = Theme.backgroundError
                }) }) });

        if v20 then
            v15[v17 + 1] = v20;
        end;

        local v21 = #v15;
        v15[v21 + 1] = u2.createElement(HostPanelSetting, {
            Name = "Server Max Players",
            Size = u5
        }, { u2.createElement(HostPanelTextBox, {
                NumbersOnly = true,
                Text = tostring(p6.store.CustomMatch.serverMaxPlayers),
                PlaceholderText = tostring(p6.store.CustomMatch.serverMaxPlayers),

                OnFocusLost = function(p22) -- Line: 159, Name: OnFocusLost
                    -- upvalues: KnitClient (ref)
                    local v23 = tonumber(p22);

                    if v23 ~= 0 and (v23 == v23 and v23) then
                        KnitClient.Controllers.CustomMatchController:setSeverMaxPlayers(v23);
                    end;
                end
            }) });
        local v24;

        if v8 == nil then
            v24 = v8;
        else
            v24 = v8.customMatchConfig;

            if v24 ~= nil then
                v24 = v24.hostPanel;

                if v24 ~= nil then
                    v24 = table.find(v24.disabledToggles, HostPanelToggle.TeamOverflow) ~= nil;
                end;
            end;
        end;

        local v26 = not v24 and u2.createElement(HostPanelSetting, {
            Name = "Team Overflow",
            Size = u5
        }, { u2.createElement(ToggleButtonGroup, {
                Value = p6.store.CustomMatch.generalToggles[HostPanelToggle.TeamOverflow],

                OnChange = function(p25) -- Line: 187, Name: OnChange
                    -- upvalues: KnitClient (ref), HostPanelToggle (ref)
                    KnitClient.Controllers.CustomMatchController:setToggle(HostPanelToggle.TeamOverflow, p25);
                end
            }, { u2.createElement(ToggleButton, {
                    Text = "On",
                    Value = HostPanelToggleValue.ON
                }), u2.createElement(ToggleButton, {
                    Text = "Off",
                    Value = HostPanelToggleValue.OFF,
                    ActiveColor = Theme.backgroundError
                }) }) });

        if v26 then
            v15[v21 + 2] = v26;
        end;

        local v27 = #v15;
        local v28;

        if v8 == nil then
            v28 = v8;
        else
            v28 = v8.customMatchConfig;

            if v28 ~= nil then
                v28 = v28.hostPanel;

                if v28 ~= nil then
                    v28 = table.find(v28.disabledToggles, HostPanelToggle.TeamSwitching) ~= nil;
                end;
            end;
        end;

        local v30 = not v28 and u2.createElement(HostPanelSetting, {
            Name = "Team Switching",
            Size = u5
        }, { u2.createElement(ToggleButtonGroup, {
                Value = p6.store.CustomMatch.generalToggles[HostPanelToggle.TeamSwitching],

                OnChange = function(p29) -- Line: 227, Name: OnChange
                    -- upvalues: KnitClient (ref), HostPanelToggle (ref)
                    KnitClient.Controllers.CustomMatchController:setToggle(HostPanelToggle.TeamSwitching, p29);
                end
            }, { u2.createElement(ToggleButton, {
                    Text = "On",
                    Value = HostPanelToggleValue.ON
                }), u2.createElement(ToggleButton, {
                    Text = "Off",
                    Value = HostPanelToggleValue.OFF,
                    ActiveColor = Theme.backgroundError
                }) }) });

        if v30 then
            v15[v27 + 1] = v30;
        end;

        local v31 = #v15;
        local v32;

        if v8 == nil then
            v32 = v8;
        else
            v32 = v8.customMatchConfig;

            if v32 ~= nil then
                v32 = v32.hostPanel;

                if v32 ~= nil then
                    v32 = table.find(v32.disabledToggles, HostPanelToggle.LateJoining) ~= nil;
                end;
            end;
        end;

        local v34 = not v32 and u2.createElement(HostPanelSetting, {
            Name = "Late Joining",
            Hint = "(Allow players to join while the match is running)",
            Size = u5
        }, { u2.createElement(ToggleButtonGroup, {
                Value = p6.store.CustomMatch.generalToggles[HostPanelToggle.LateJoining],

                OnChange = function(p33) -- Line: 268, Name: OnChange
                    -- upvalues: KnitClient (ref), HostPanelToggle (ref)
                    KnitClient.Controllers.CustomMatchController:setToggle(HostPanelToggle.LateJoining, p33);
                end
            }, { u2.createElement(ToggleButton, {
                    Text = "On",
                    Value = HostPanelToggleValue.ON
                }), u2.createElement(ToggleButton, {
                    Text = "Off",
                    Value = HostPanelToggleValue.OFF,
                    ActiveColor = Theme.backgroundError
                }) }) });

        if v34 then
            v15[v31 + 1] = v34;
        end;

        local v35 = #v15;
        local v36;

        if v8 == nil then
            v36 = v8;
        else
            v36 = v8.customMatchConfig;

            if v36 ~= nil then
                v36 = v36.hostPanel;

                if v36 ~= nil then
                    v36 = table.find(v36.disabledToggles, HostPanelToggle.LateJoining) ~= nil;
                end;
            end;
        end;

        local v38 = not v36 and u2.createElement(HostPanelSetting, {
            Name = "Late Joiner Team",
            Hint = "(Team assignment for late joiners)",
            Size = u5
        }, { u2.createElement(DropdownComponent, {
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 1),
                DefaultItem = {
                    text = p6.store.CustomMatch.dropdowns[HostPanelDropdown.LateJoinTeam],
                    value = p6.store.CustomMatch.dropdowns[HostPanelDropdown.LateJoinTeam]
                },
                PlaceholderText = DeviceUtil.isHoarceKat() and "hi" or KnitClient.Controllers.CustomMatchController:generateDropdownItems(HostPanelDropdown.LateJoinTeam)[1].text,
                Items = DeviceUtil.isHoarceKat() and { {
                        text = "hi",
                        value = "hi"
                    } } or KnitClient.Controllers.CustomMatchController:generateDropdownItems(HostPanelDropdown.LateJoinTeam),

                OnItemSelected = function(p37) -- Line: 318, Name: OnItemSelected
                    -- upvalues: DeviceUtil (ref), KnitClient (ref), HostPanelDropdown (ref)
                    if DeviceUtil.isHoarceKat() then
                        return;
                    end;

                    KnitClient.Controllers.CustomMatchController:setDropdown(HostPanelDropdown.LateJoinTeam, p37);
                end
            }) });

        if v38 then
            v15[v35 + 1] = v38;
        end;

        local v39 = #v15;
        local v40;

        if v8 == nil then
            v40 = v8;
        else
            v40 = v8.customMatchConfig;

            if v40 ~= nil then
                v40 = v40.hostPanel;

                if v40 ~= nil then
                    v40 = table.find(v40.disabledToggles, HostPanelToggle.AutoRestartGame) ~= nil;
                end;
            end;
        end;

        local v42 = not v40 and u2.createElement(HostPanelSetting, {
            Name = "Auto Restart Game",
            Size = u5
        }, { u2.createElement(ToggleButtonGroup, {
                Value = p6.store.CustomMatch.generalToggles[HostPanelToggle.AutoRestartGame],

                OnChange = function(p41) -- Line: 353, Name: OnChange
                    -- upvalues: KnitClient (ref), HostPanelToggle (ref)
                    KnitClient.Controllers.CustomMatchController:setToggle(HostPanelToggle.AutoRestartGame, p41);
                end
            }, { u2.createElement(ToggleButton, {
                    Text = "On",
                    Value = HostPanelToggleValue.ON
                }), u2.createElement(ToggleButton, {
                    Text = "Off",
                    Value = HostPanelToggleValue.OFF,
                    ActiveColor = Theme.backgroundError
                }) }) });

        if v42 then
            v15[v39 + 1] = v42;
        end;

        local v43 = #v15;
        v15[v43 + 1] = u2.createElement("TextLabel", {
            AutomaticSize = "Y",
            SizeConstraint = "RelativeXX",
            Text = "<b>GAME SETTINGS</b>",
            TextScaled = true,
            RichText = true,
            Font = "Roboto",
            TextXAlignment = "Left",
            TextYAlignment = "Center",
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0),
            TextColor3 = Theme.textPrimary
        }, { u2.createElement("UITextSizeConstraint", {
                MaxTextSize = 20
            }) });
        v15[v43 + 2] = u2.createElement(HostPanelSetting, {
            Name = "Deathmatch Time",
            Hint = "(Seconds into the match that the bed will automatically break)",
            Size = u5
        }, { u2.createElement(HostPanelTextBox, {
                NumbersOnly = true,
                Text = tostring(p6.store.CustomMatch.deathmatchTime),
                PlaceholderText = tostring(p6.store.CustomMatch.deathmatchTime),

                OnFocusLost = function(p44) -- Line: 399, Name: OnFocusLost
                    -- upvalues: KnitClient (ref)
                    local v45 = tonumber(p44);

                    if v45 ~= 0 and (v45 == v45 and v45) then
                        KnitClient.Controllers.CustomMatchController:setDeathmatchTime(v45);
                    end;
                end
            }) });
        local v46;

        if v8 == nil then
            v46 = v8;
        else
            v46 = v8.customMatchConfig;

            if v46 ~= nil then
                v46 = v46.hostPanel;

                if v46 ~= nil then
                    v46 = table.find(v46.disabledToggles, HostPanelToggle.Emotes) ~= nil;
                end;
            end;
        end;

        local v48 = not v46 and u2.createElement(HostPanelSetting, {
            Name = "Emote Effects",
            Hint = "Toggles emote effects",
            Size = u5
        }, { u2.createElement(ToggleButtonGroup, {
                Value = p6.store.CustomMatch.generalToggles[HostPanelToggle.Emotes],

                OnChange = function(p47) -- Line: 428, Name: OnChange
                    -- upvalues: KnitClient (ref), HostPanelToggle (ref)
                    KnitClient.Controllers.CustomMatchController:setToggle(HostPanelToggle.Emotes, p47);
                end
            }, { u2.createElement(ToggleButton, {
                    Text = "On",
                    Value = HostPanelToggleValue.ON
                }), u2.createElement(ToggleButton, {
                    Text = "Off",
                    Value = HostPanelToggleValue.OFF,
                    ActiveColor = Theme.backgroundError
                }) }) });

        if v48 then
            v15[v43 + 3] = v48;
        end;

        local v49 = #v15;
        local v50;

        if v8 == nil then
            v50 = v8;
        else
            v50 = v8.customMatchConfig;

            if v50 ~= nil then
                v50 = v50.hostPanel;

                if v50 ~= nil then
                    v50 = table.find(v50.disabledToggles, HostPanelToggle.BypassPlacementLimits) ~= nil;
                end;
            end;
        end;

        local v52 = not v50 and u2.createElement(HostPanelSetting, {
            Name = "Bypass Placement Limits",
            Hint = "(Ex. Removes tesla placement limit)",
            Size = u5
        }, { u2.createElement(ToggleButtonGroup, {
                Value = p6.store.CustomMatch.generalToggles[HostPanelToggle.BypassPlacementLimits],

                OnChange = function(p51) -- Line: 469, Name: OnChange
                    -- upvalues: KnitClient (ref), HostPanelToggle (ref)
                    KnitClient.Controllers.CustomMatchController:setToggle(HostPanelToggle.BypassPlacementLimits, p51);
                end
            }, { u2.createElement(ToggleButton, {
                    Text = "On",
                    Value = HostPanelToggleValue.ON
                }), u2.createElement(ToggleButton, {
                    Text = "Off",
                    Value = HostPanelToggleValue.OFF,
                    ActiveColor = Theme.backgroundError
                }) }) });

        if v52 then
            v15[v49 + 1] = v52;
        end;

        local v53 = #v15;
        local v54;

        if v8 == nil then
            v54 = v8;
        else
            v54 = v8.customMatchConfig;

            if v54 ~= nil then
                v54 = v54.hostPanel;

                if v54 ~= nil then
                    v54 = table.find(v54.disabledToggles, HostPanelToggle.PvP) ~= nil;
                end;
            end;
        end;

        local v56 = not v54 and u2.createElement(HostPanelSetting, {
            Name = "PvP",
            Size = u5
        }, { u2.createElement(ToggleButtonGroup, {
                Value = p6.store.CustomMatch.generalToggles[HostPanelToggle.PvP],

                OnChange = function(p55) -- Line: 509, Name: OnChange
                    -- upvalues: KnitClient (ref), HostPanelToggle (ref)
                    KnitClient.Controllers.CustomMatchController:setToggle(HostPanelToggle.PvP, p55);
                end
            }, { u2.createElement(ToggleButton, {
                    Text = "On",
                    Value = HostPanelToggleValue.ON
                }), u2.createElement(ToggleButton, {
                    Text = "Off",
                    Value = HostPanelToggleValue.OFF,
                    ActiveColor = Theme.backgroundError
                }), u2.createElement(ToggleButton, {
                    Text = "Host Only",
                    Value = HostPanelToggleValue.HOST_ONLY
                }) }) });

        if v56 then
            v15[v53 + 1] = v56;
        end;

        local v57 = #v15;
        local v58;

        if v8 == nil then
            v58 = v8;
        else
            v58 = v8.customMatchConfig;

            if v58 ~= nil then
                v58 = v58.hostPanel;

                if v58 ~= nil then
                    v58 = table.find(v58.disabledToggles, HostPanelToggle.BedBreaking) ~= nil;
                end;
            end;
        end;

        local v60 = not v58 and u2.createElement(HostPanelSetting, {
            Name = "Bed Breaking",
            Size = u5
        }, { u2.createElement(ToggleButtonGroup, {
                Value = p6.store.CustomMatch.generalToggles[HostPanelToggle.BedBreaking],

                OnChange = function(p59) -- Line: 553, Name: OnChange
                    -- upvalues: KnitClient (ref), HostPanelToggle (ref)
                    KnitClient.Controllers.CustomMatchController:setToggle(HostPanelToggle.BedBreaking, p59);
                end
            }, { u2.createElement(ToggleButton, {
                    Text = "On",
                    Value = HostPanelToggleValue.ON
                }), u2.createElement(ToggleButton, {
                    Text = "Off",
                    Value = HostPanelToggleValue.OFF,
                    ActiveColor = Theme.backgroundError
                }), u2.createElement(ToggleButton, {
                    Text = "Host Only",
                    Value = HostPanelToggleValue.HOST_ONLY
                }) }) });

        if v60 then
            v15[v57 + 1] = v60;
        end;

        local v61 = #v15;
        local v62;

        if v8 == nil then
            v62 = v8;
        else
            v62 = v8.customMatchConfig;

            if v62 ~= nil then
                v62 = v62.hostPanel;

                if v62 ~= nil then
                    v62 = table.find(v62.disabledToggles, HostPanelToggle.BlockBreaking) ~= nil;
                end;
            end;
        end;

        local v64 = not v62 and u2.createElement(HostPanelSetting, {
            Name = "Block Breaking",
            Size = u5
        }, { u2.createElement(ToggleButtonGroup, {
                Value = p6.store.CustomMatch.generalToggles[HostPanelToggle.BlockBreaking],

                OnChange = function(p63) -- Line: 597, Name: OnChange
                    -- upvalues: KnitClient (ref), HostPanelToggle (ref)
                    KnitClient.Controllers.CustomMatchController:setToggle(HostPanelToggle.BlockBreaking, p63);
                end
            }, { u2.createElement(ToggleButton, {
                    Text = "On",
                    Value = HostPanelToggleValue.ON
                }), u2.createElement(ToggleButton, {
                    Text = "Off",
                    Value = HostPanelToggleValue.OFF,
                    ActiveColor = Theme.backgroundError
                }), u2.createElement(ToggleButton, {
                    Text = "Host Only",
                    Value = HostPanelToggleValue.HOST_ONLY
                }) }) });

        if v64 then
            v15[v61 + 1] = v64;
        end;

        local v65 = #v15;
        local v66;

        if v8 == nil then
            v66 = v8;
        else
            v66 = v8.customMatchConfig;

            if v66 ~= nil then
                v66 = v66.hostPanel;

                if v66 ~= nil then
                    v66 = table.find(v66.disabledToggles, HostPanelToggle.BlockPlacing) ~= nil;
                end;
            end;
        end;

        local v68 = not v66 and u2.createElement(HostPanelSetting, {
            Name = "Block Placing",
            Size = u5
        }, { u2.createElement(ToggleButtonGroup, {
                Value = p6.store.CustomMatch.generalToggles[HostPanelToggle.BlockPlacing],

                OnChange = function(p67) -- Line: 641, Name: OnChange
                    -- upvalues: KnitClient (ref), HostPanelToggle (ref)
                    KnitClient.Controllers.CustomMatchController:setToggle(HostPanelToggle.BlockPlacing, p67);
                end
            }, { u2.createElement(ToggleButton, {
                    Text = "On",
                    Value = HostPanelToggleValue.ON
                }), u2.createElement(ToggleButton, {
                    Text = "Off",
                    Value = HostPanelToggleValue.OFF,
                    ActiveColor = Theme.backgroundError
                }), u2.createElement(ToggleButton, {
                    Text = "Host Only",
                    Value = HostPanelToggleValue.HOST_ONLY
                }) }) });

        if v68 then
            v15[v65 + 1] = v68;
        end;

        local v69 = #v15;
        local v70;

        if v8 == nil then
            v70 = v8;
        else
            v70 = v8.customMatchConfig;

            if v70 ~= nil then
                v70 = v70.hostPanel;

                if v70 ~= nil then
                    v70 = table.find(v70.disabledToggles, HostPanelToggle.HideAllNametags) ~= nil;
                end;
            end;
        end;

        local v72 = not v70 and u2.createElement(HostPanelSetting, {
            Name = "Hide All Nametags",
            Size = u5
        }, { u2.createElement(ToggleButtonGroup, {
                Value = p6.store.CustomMatch.generalToggles[HostPanelToggle.HideAllNametags],

                OnChange = function(p71) -- Line: 685, Name: OnChange
                    -- upvalues: KnitClient (ref), HostPanelToggle (ref)
                    KnitClient.Controllers.CustomMatchController:setToggle(HostPanelToggle.HideAllNametags, p71);
                end
            }, { u2.createElement(ToggleButton, {
                    Text = "On",
                    Value = HostPanelToggleValue.ON
                }), u2.createElement(ToggleButton, {
                    Text = "Off",
                    Value = HostPanelToggleValue.OFF,
                    ActiveColor = Theme.backgroundError
                }), u2.createElement(ToggleButton, {
                    Text = "Host Only",
                    Value = HostPanelToggleValue.HOST_ONLY
                }) }) });

        if v72 then
            v15[v69 + 1] = v72;
        end;

        local v73 = #v15;
        local v74;

        if v8 == nil then
            v74 = v8;
        else
            v74 = v8.customMatchConfig;

            if v74 ~= nil then
                v74 = v74.hostPanel;

                if v74 ~= nil then
                    v74 = table.find(v74.disabledToggles, HostPanelToggle.KeepInventoryOnDeath) ~= nil;
                end;
            end;
        end;

        local v76 = not v74 and u2.createElement(HostPanelSetting, {
            Name = "Keep Inventory on Death",
            Size = u5
        }, { u2.createElement(ToggleButtonGroup, {
                Value = p6.store.CustomMatch.generalToggles[HostPanelToggle.KeepInventoryOnDeath],

                OnChange = function(p75) -- Line: 729, Name: OnChange
                    -- upvalues: KnitClient (ref), HostPanelToggle (ref)
                    KnitClient.Controllers.CustomMatchController:setToggle(HostPanelToggle.KeepInventoryOnDeath, p75);
                end
            }, { u2.createElement(ToggleButton, {
                    Text = "On",
                    Value = HostPanelToggleValue.ON
                }), u2.createElement(ToggleButton, {
                    Text = "Off",
                    Value = HostPanelToggleValue.OFF,
                    ActiveColor = Theme.backgroundError
                }) }) });

        if v76 then
            v15[v73 + 1] = v76;
        end;

        local v77 = #v15;
        local v78;

        if v8 == nil then
            v78 = v8;
        else
            v78 = v8.customMatchConfig;

            if v78 ~= nil then
                v78 = v78.hostPanel;

                if v78 ~= nil then
                    v78 = table.find(v78.disabledToggles, HostPanelToggle.AllowRandomlySelectedShopItems) ~= nil;
                end;
            end;
        end;

        local v80 = not v78 and u2.createElement(HostPanelSetting, {
            Name = "Allow Randomly Selected Shop Items",
            Size = u5
        }, { u2.createElement(ToggleButtonGroup, {
                Value = p6.store.CustomMatch.generalToggles[HostPanelToggle.AllowRandomlySelectedShopItems],

                OnChange = function(p79) -- Line: 769, Name: OnChange
                    -- upvalues: KnitClient (ref), HostPanelToggle (ref)
                    KnitClient.Controllers.CustomMatchController:setToggle(HostPanelToggle.AllowRandomlySelectedShopItems, p79);
                end
            }, { u2.createElement(ToggleButton, {
                    Text = "On",
                    Value = HostPanelToggleValue.ON
                }), u2.createElement(ToggleButton, {
                    Text = "Off",
                    Value = HostPanelToggleValue.OFF,
                    ActiveColor = Theme.backgroundError
                }) }) });

        if v80 then
            v15[v77 + 1] = v80;
        end;

        local v81 = #v15;
        local v82;

        if v8 == nil then
            v82 = v8;
        else
            v82 = v8.customMatchConfig;

            if v82 ~= nil then
                v82 = v82.hostPanel;

                if v82 ~= nil then
                    v82 = table.find(v82.disabledToggles, HostPanelToggle.AllowRandomlySelectedShopItems) ~= nil;
                end;
            end;
        end;

        local v83 = not v82;

        if v83 then
            local v84 = {
                Name = "Randomly Selected Shop Item Count",
                Hint = "",
                Size = u5
            };
            local v85 = {};
            local v86 = {};
            local randomlySelectedShopItemCount = p6.store.CustomMatch.randomlySelectedShopItemCount;
            v86.Text = tostring(randomlySelectedShopItemCount == nil and 0 or randomlySelectedShopItemCount);
            local randomlySelectedShopItemCount2 = p6.store.CustomMatch.randomlySelectedShopItemCount;
            v86.PlaceholderText = tostring(randomlySelectedShopItemCount2 == nil and 0 or randomlySelectedShopItemCount2);
            v86.NumbersOnly = true;

            function v86.OnFocusLost(p87) -- Line: 822
                -- upvalues: KnitClient (ref)
                local v88 = tonumber(p87);

                if v88 ~= 0 and (v88 == v88 and v88) then
                    KnitClient.Controllers.CustomMatchController:setRandomlySelectedShopItemCount(v88);
                end;
            end;

            v85[#v85 + 1] = u2.createElement(HostPanelTextBox, v86);
            v83 = u2.createElement(HostPanelSetting, v84, v85);
        end;

        if v83 then
            v15[v81 + 1] = v83;
        end;

        local v89 = #v15;
        v15[v89 + 1] = u2.createElement("TextLabel", {
            AutomaticSize = "Y",
            SizeConstraint = "RelativeXX",
            Text = "<b>FEATURE SETTINGS</b>",
            TextScaled = true,
            RichText = true,
            Font = "Roboto",
            TextXAlignment = "Left",
            TextYAlignment = "Center",
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0),
            TextColor3 = Theme.textPrimary
        }, { u2.createElement("UITextSizeConstraint", {
                MaxTextSize = 20
            }) });
        local v90;

        if v8 == nil then
            v90 = v8;
        else
            v90 = v8.customMatchConfig;

            if v90 ~= nil then
                v90 = v90.hostPanel;

                if v90 ~= nil then
                    v90 = table.find(v90.disabledToggles, HostPanelToggle.SpawnOres) ~= nil;
                end;
            end;
        end;

        local v92 = not v90 and u2.createElement(HostPanelSetting, {
            Name = "Spawn Ores",
            Size = u5
        }, { u2.createElement(ToggleButtonGroup, {
                Value = p6.store.CustomMatch.generalToggles[HostPanelToggle.SpawnOres],

                OnChange = function(p91) -- Line: 872, Name: OnChange
                    -- upvalues: KnitClient (ref), HostPanelToggle (ref)
                    KnitClient.Controllers.CustomMatchController:setToggle(HostPanelToggle.SpawnOres, p91);
                end
            }, { u2.createElement(ToggleButton, {
                    Text = "On",
                    Value = HostPanelToggleValue.ON
                }), u2.createElement(ToggleButton, {
                    Text = "Off",
                    Value = HostPanelToggleValue.OFF,
                    ActiveColor = Theme.backgroundError
                }) }) });

        if v92 then
            v15[v89 + 2] = v92;
        end;

        local v93 = #v15;
        local v94;

        if v8 == nil then
            v94 = v8;
        else
            v94 = v8.customMatchConfig;

            if v94 ~= nil then
                v94 = v94.hostPanel;

                if v94 ~= nil then
                    v94 = table.find(v94.disabledToggles, HostPanelToggle.SpawnGuardians) ~= nil;
                end;
            end;
        end;

        local v96 = not v94 and u2.createElement(HostPanelSetting, {
            Name = "Spawn Diamond Guardians",
            Size = u5
        }, { u2.createElement(ToggleButtonGroup, {
                Value = p6.store.CustomMatch.generalToggles[HostPanelToggle.SpawnGuardians],

                OnChange = function(p95) -- Line: 912, Name: OnChange
                    -- upvalues: KnitClient (ref), HostPanelToggle (ref)
                    KnitClient.Controllers.CustomMatchController:setToggle(HostPanelToggle.SpawnGuardians, p95);
                end
            }, { u2.createElement(ToggleButton, {
                    Text = "On",
                    Value = HostPanelToggleValue.ON
                }), u2.createElement(ToggleButton, {
                    Text = "Off",
                    Value = HostPanelToggleValue.OFF,
                    ActiveColor = Theme.backgroundError
                }) }) });

        if v96 then
            v15[v93 + 1] = v96;
        end;

        local v97 = #v15;
        local v98;

        if v8 == nil then
            v98 = v8;
        else
            v98 = v8.customMatchConfig;

            if v98 ~= nil then
                v98 = v98.hostPanel;

                if v98 ~= nil then
                    v98 = table.find(v98.disabledToggles, HostPanelToggle.SpawnTitan) ~= nil;
                end;
            end;
        end;

        local v100 = not v98 and u2.createElement(HostPanelSetting, {
            Name = "Spawn Titan",
            Size = u5
        }, { u2.createElement(ToggleButtonGroup, {
                Value = p6.store.CustomMatch.generalToggles[HostPanelToggle.SpawnTitan],

                OnChange = function(p99) -- Line: 952, Name: OnChange
                    -- upvalues: KnitClient (ref), HostPanelToggle (ref)
                    KnitClient.Controllers.CustomMatchController:setToggle(HostPanelToggle.SpawnTitan, p99);
                end
            }, { u2.createElement(ToggleButton, {
                    Text = "On",
                    Value = HostPanelToggleValue.ON
                }), u2.createElement(ToggleButton, {
                    Text = "Off",
                    Value = HostPanelToggleValue.OFF,
                    ActiveColor = Theme.backgroundError
                }) }) });

        if v100 then
            v15[v97 + 1] = v100;
        end;

        local v101 = #v15;
        local v102;

        if v8 == nil then
            v102 = v8;
        else
            v102 = v8.customMatchConfig;

            if v102 ~= nil then
                v102 = v102.hostPanel;

                if v102 ~= nil then
                    v102 = table.find(v102.disabledToggles, HostPanelToggle.Recalling) ~= nil;
                end;
            end;
        end;

        local v104 = not v102 and u2.createElement(HostPanelSetting, {
            Name = "Base Recalling",
            Size = u5
        }, { u2.createElement(ToggleButtonGroup, {
                Value = p6.store.CustomMatch.generalToggles[HostPanelToggle.Recalling],

                OnChange = function(p103) -- Line: 992, Name: OnChange
                    -- upvalues: KnitClient (ref), HostPanelToggle (ref)
                    KnitClient.Controllers.CustomMatchController:setToggle(HostPanelToggle.Recalling, p103);
                end
            }, { u2.createElement(ToggleButton, {
                    Text = "On",
                    Value = HostPanelToggleValue.ON
                }), u2.createElement(ToggleButton, {
                    Text = "Off",
                    Value = HostPanelToggleValue.OFF,
                    ActiveColor = Theme.backgroundError
                }) }) });

        if v104 then
            v15[v101 + 1] = v104;
        end;

        local v105 = #v15;
        local v106;

        if v8 == nil then
            v106 = v8;
        else
            v106 = v8.customMatchConfig;

            if v106 ~= nil then
                v106 = v106.hostPanel;

                if v106 ~= nil then
                    v106 = table.find(v106.disabledToggles, HostPanelToggle.LateJoining) ~= nil;
                end;
            end;
        end;

        local v108 = not v106 and u2.createElement(HostPanelSetting, {
            Name = "Weather Type",
            Hint = "",
            Size = u5
        }, { u2.createElement(DropdownComponent, {
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 1),
                DefaultItem = {
                    text = p6.store.CustomMatch.dropdowns[HostPanelDropdown.Weather],
                    value = p6.store.CustomMatch.dropdowns[HostPanelDropdown.Weather]
                },
                PlaceholderText = DeviceUtil.isHoarceKat() and "hi" or KnitClient.Controllers.CustomMatchController:generateDropdownItems(HostPanelDropdown.Weather)[1].text,
                Items = DeviceUtil.isHoarceKat() and { {
                        text = "hi",
                        value = "hi"
                    } } or KnitClient.Controllers.CustomMatchController:generateDropdownItems(HostPanelDropdown.Weather),

                OnItemSelected = function(p107) -- Line: 1042, Name: OnItemSelected
                    -- upvalues: DeviceUtil (ref), KnitClient (ref), HostPanelDropdown (ref)
                    if DeviceUtil.isHoarceKat() then
                        return;
                    end;

                    KnitClient.Controllers.CustomMatchController:setDropdown(HostPanelDropdown.Weather, p107);
                end
            }) });

        if v108 then
            v15[v105 + 1] = v108;
        end;

        local v109 = #v15;
        local v110;

        if v8 == nil then
            v110 = v8;
        else
            v110 = v8.customMatchConfig;

            if v110 ~= nil then
                v110 = v110.hostPanel;

                if v110 ~= nil then
                    v110 = table.find(v110.disabledToggles, HostPanelToggle.PassiveWeatherEffectsEnabled) ~= nil;
                end;
            end;
        end;

        local v112 = not v110 and u2.createElement(HostPanelSetting, {
            Name = "Passive Weather Effects",
            Size = u5
        }, { u2.createElement(ToggleButtonGroup, {
                Value = p6.store.CustomMatch.generalToggles[HostPanelToggle.PassiveWeatherEffectsEnabled],

                OnChange = function(p111) -- Line: 1077, Name: OnChange
                    -- upvalues: KnitClient (ref), HostPanelToggle (ref)
                    KnitClient.Controllers.CustomMatchController:setToggle(HostPanelToggle.PassiveWeatherEffectsEnabled, p111);
                end
            }, { u2.createElement(ToggleButton, {
                    Text = "On",
                    Value = HostPanelToggleValue.ON
                }), u2.createElement(ToggleButton, {
                    Text = "Off",
                    Value = HostPanelToggleValue.OFF,
                    ActiveColor = Theme.backgroundError
                }) }) });

        if v112 then
            v15[v109 + 1] = v112;
        end;

        local v113 = #v15;

        if v8 ~= nil then
            v8 = v8.customMatchConfig;

            if v8 ~= nil then
                v8 = v8.hostPanel;

                if v8 ~= nil then
                    v8 = table.find(v8.disabledToggles, HostPanelToggle.WeatherEventsEnabled) ~= nil;
                end;
            end;
        end;

        local v115 = not v8 and u2.createElement(HostPanelSetting, {
            Name = "Major Weather Events",
            Size = u5
        }, { u2.createElement(ToggleButtonGroup, {
                Value = p6.store.CustomMatch.generalToggles[HostPanelToggle.WeatherEventsEnabled],

                OnChange = function(p114) -- Line: 1117, Name: OnChange
                    -- upvalues: KnitClient (ref), HostPanelToggle (ref)
                    KnitClient.Controllers.CustomMatchController:setToggle(HostPanelToggle.WeatherEventsEnabled, p114);
                end
            }, { u2.createElement(ToggleButton, {
                    Text = "On",
                    Value = HostPanelToggleValue.ON
                }), u2.createElement(ToggleButton, {
                    Text = "Off",
                    Value = HostPanelToggleValue.OFF,
                    ActiveColor = Theme.backgroundError
                }) }) });

        if v115 then
            v15[v113 + 1] = v115;
        end;

        return u2.createElement(AutoCanvasScrollingFrame, v14, v15);
    end)
};