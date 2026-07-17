-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local UILayers = v1.UILayers;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local TweenService = v5.TweenService;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local EventMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local EventTeamSelectedContent = RuntimeLib.import(script, script.Parent, "event-team-selected-content").EventTeamSelectedContent;

return {
    EventTeams = v4.new(u3)(function(p6, p7) -- Line: 22
        -- upvalues: u3 (copy), EventMeta (copy), ClientStore (copy), u2 (copy), TweenService (copy), DeviceUtil (copy), ColorUtil (copy), Theme (copy), Empty (copy), EventTeamSelectedContent (copy), Flamework (copy), BedwarsAppIds (copy), default (copy), Players (copy), UILayers (copy), ButtonComponent (copy)
        local useState = p7.useState;
        local useEffect = p7.useEffect;
        local u8 = u3.createRef();
        local u9 = u3.createRef();
        local u10 = u3.createRef();
        local u11 = u3.createRef();
        local u12 = u3.createRef();
        local u13 = u3.createRef();
        local u14 = u3.createRef();
        local u15 = u3.createRef();
        local u16 = u3.createRef();
        local u17 = u3.createRef();
        local u18 = EventMeta[p6.EventType];
        local v19 = 0;
        local u20 = false;
        local u21 = Random.new():NextInteger(1, 2);
        local customPagesConfig = u18.customPagesConfig;

        if customPagesConfig ~= nil then
            customPagesConfig = customPagesConfig.setTeamPage;
        end;

        if customPagesConfig ~= nil then
            local v22 = ClientStore:getState().Event.profileData.events[p6.EventType];
            local v23;

            if v22 == nil then
                v23 = v22;
            else
                v23 = v22.globalTeamKey;
            end;

            if v23 then
                local v24;

                if v22 == nil then
                    v24 = v22;
                else
                    v24 = v22.globalTeamKey;
                end;

                u20 = v24 ~= nil;
                local totalGlobalTeamContribution = v22.totalGlobalTeamContribution;
                v19 = totalGlobalTeamContribution == nil and 0 or totalGlobalTeamContribution;

                if v23 == u18.customPagesConfig.setTeamPage.team1.globalTeamKey then
                    u21 = 1;
                elseif v23 == u18.customPagesConfig.setTeamPage.team2.globalTeamKey then
                    u21 = 2;
                end;
            end;
        end;

        local u25, u26 = useState(u21);
        useEffect(function() -- Line: 69
            -- upvalues: u20 (ref), u2 (ref), u21 (ref), u8 (copy), u10 (copy), TweenService (ref), u9 (copy), u11 (copy)
            if u20 then
                local u27 = u2.new();

                if u21 == 1 then
                    local v28 = u8:getValue();
                    local v29 = u10:getValue();

                    if not (v28 and v29) then
                        return nil;
                    end;

                    local u30 = TweenService:Create(v29, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                        Rotation = 5,
                        Size = UDim2.fromScale(1, 1)
                    });
                    local u31 = TweenService:Create(v29, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                        Rotation = -5
                    });
                    local u32 = TweenService:Create(v29, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                        Rotation = 0
                    });
                    u27:GiveTask(v28.Activated:Connect(function() -- Line: 89
                        -- upvalues: u30 (copy), u31 (copy), u32 (copy)
                        u30:Play();
                        u30.Completed:Connect(function() -- Line: 91
                            -- upvalues: u31 (ref), u32 (ref)
                            u31:Play();
                            u31.Completed:Connect(function() -- Line: 93
                                -- upvalues: u32 (ref)
                                u32:Play();
                            end);
                        end);
                    end));
                end;

                if u21 == 2 then
                    local v33 = u9:getValue();
                    local v34 = u11:getValue();

                    if not (v33 and v34) then
                        return nil;
                    end;

                    local u35 = TweenService:Create(v34, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                        Rotation = 5,
                        Size = UDim2.fromScale(1, 1)
                    });
                    local u36 = TweenService:Create(v34, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                        Rotation = -5
                    });
                    local u37 = TweenService:Create(v34, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                        Rotation = 0
                    });
                    u27:GiveTask(v33.Activated:Connect(function() -- Line: 116
                        -- upvalues: u35 (copy), u36 (copy), u37 (copy)
                        u35:Play();
                        u35.Completed:Connect(function() -- Line: 118
                            -- upvalues: u36 (ref), u37 (ref)
                            u36:Play();
                            u36.Completed:Connect(function() -- Line: 120
                                -- upvalues: u37 (ref)
                                u37:Play();
                            end);
                        end);
                    end));
                end;

                return function() -- Line: 126
                    -- upvalues: u27 (copy)
                    u27:DoCleaning();
                end;
            end;
        end, {});
        useEffect(function() -- Line: 131
            -- upvalues: u20 (ref), u8 (copy), u9 (copy), u10 (copy), u11 (copy), u12 (copy), u13 (copy), u14 (copy), u15 (copy), u16 (copy), u17 (copy), u2 (ref), TweenService (ref), DeviceUtil (ref)
            if not u20 then
                local v38 = u8:getValue();
                local v39 = u9:getValue();
                local v40 = u10:getValue();
                local v41 = u11:getValue();
                local v42 = u12:getValue();
                local v43 = u13:getValue();
                local v44 = u14:getValue();
                local v45 = u15:getValue();
                local v46 = u16:getValue();
                local v47 = u17:getValue();

                if not (v38 and (v39 and (v40 and (v41 and (v42 and (v43 and (v44 and (v45 and (v46 and v47))))))))) then
                    return nil;
                end;

                local u48 = u2.new();
                local u49 = TweenService:Create(v40, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Rotation = 5,
                    Size = UDim2.fromScale(1, 1)
                });
                local u50 = TweenService:Create(v40, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Rotation = -5
                });
                local u51 = TweenService:Create(v40, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Rotation = 0
                });
                local u52 = TweenService:Create(v40, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Rotation = 0,
                    Size = UDim2.fromScale(0.9, 0.9)
                });
                local u53 = TweenService:Create(v41, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Rotation = 5,
                    Size = UDim2.fromScale(1, 1)
                });
                local u54 = TweenService:Create(v41, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Rotation = -5
                });
                local u55 = TweenService:Create(v41, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Rotation = 0
                });
                local u56 = TweenService:Create(v41, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Rotation = 0,
                    Size = UDim2.fromScale(0.9, 0.9)
                });
                local u57 = TweenService:Create(v44, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    TextSize = DeviceUtil.isSmallScreen() and 24 or 45
                });
                local u58 = TweenService:Create(v44, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    TextSize = DeviceUtil.isSmallScreen() and 20 or 40
                });
                local u59 = TweenService:Create(v45, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    TextSize = DeviceUtil.isSmallScreen() and 24 or 45
                });
                local u60 = TweenService:Create(v45, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    TextSize = DeviceUtil.isSmallScreen() and 20 or 40
                });
                local u61 = TweenService:Create(v46, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    BackgroundTransparency = 1
                });
                local u62 = TweenService:Create(v46, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    BackgroundTransparency = 0.7
                });
                local u63 = TweenService:Create(v47, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    BackgroundTransparency = 1
                });
                local u64 = TweenService:Create(v47, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    BackgroundTransparency = 0.7
                });
                u48:GiveTask(v38.Activated:Connect(function() -- Line: 202
                    -- upvalues: u61 (copy), u64 (copy), u57 (copy), u60 (copy), u49 (copy), u50 (copy), u51 (copy), u56 (copy)
                    u61:Play();
                    u64:Play();
                    u57:Play();
                    u60:Play();
                    u49:Play();
                    u49.Completed:Connect(function() -- Line: 208
                        -- upvalues: u50 (ref), u51 (ref)
                        u50:Play();
                        u50.Completed:Connect(function() -- Line: 210
                            -- upvalues: u51 (ref)
                            u51:Play();
                        end);
                    end);
                    u56:Play();
                end));
                u48:GiveTask(v39.Activated:Connect(function() -- Line: 216
                    -- upvalues: u62 (copy), u63 (copy), u58 (copy), u59 (copy), u52 (copy), u53 (copy), u54 (copy), u55 (copy)
                    u62:Play();
                    u63:Play();
                    u58:Play();
                    u59:Play();
                    u52:Play();
                    u53:Play();
                    u53.Completed:Connect(function() -- Line: 223
                        -- upvalues: u54 (ref), u55 (ref)
                        u54:Play();
                        u54.Completed:Connect(function() -- Line: 225
                            -- upvalues: u55 (ref)
                            u55:Play();
                        end);
                    end);
                end));

                return function() -- Line: 230
                    -- upvalues: u48 (copy)
                    u48:DoCleaning();
                end;
            end;
        end, {});
        local v65 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v66 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder
            }) };
        local _ = #v66;
        local v67 = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.8)
        };
        local v68 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }) };
        local _ = #v68;
        local v69 = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(0.5, 1)
        };
        local v70 = { u3.createElement("Frame", {
                [u3.Ref] = u16,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                BackgroundTransparency = u20 and u25 == 2 and 0.7 or 1,
                BackgroundColor3 = ColorUtil.BLACK,
                ZIndex = 5
            }) };
        local _ = #v70;
        local v71 = {
            [u3.Ref] = u14
        };
        local customPagesConfig2 = u18.customPagesConfig;

        if customPagesConfig2 ~= nil then
            customPagesConfig2 = customPagesConfig2.setTeamPage;

            if customPagesConfig2 ~= nil then
                customPagesConfig2 = customPagesConfig2.team1.name;
            end;
        end;

        v71.Text = "TEAM " .. tostring(customPagesConfig2);
        v71.AnchorPoint = Vector2.new(0.5, 0.5);
        v71.Position = UDim2.fromScale(0.5, 0.2);
        v71.Size = UDim2.fromScale(1, 0.2);
        v71.BackgroundTransparency = 1;
        v71.Font = Enum.Font.LuckiestGuy;
        v71.TextColor3 = Color3.fromRGB(255, 255, 255);
        v71.TextWrapped = true;
        local v72;

        if u20 and u25 == 2 then
            v72 = DeviceUtil.isSmallScreen() and 20 or 40;
        else
            v72 = DeviceUtil.isSmallScreen() and 24 or 45;
        end;

        v71.TextSize = v72;
        v71.ZIndex = 4;
        local v73 = {};
        local v74 = #v73;
        local v75 = {
            Rotation = 90
        };
        local customPagesConfig3 = u18.customPagesConfig;

        if customPagesConfig3 ~= nil then
            customPagesConfig3 = customPagesConfig3.setTeamPage;

            if customPagesConfig3 ~= nil then
                customPagesConfig3 = customPagesConfig3.team1;
            end;
        end;

        local teamColor = customPagesConfig3.teamColor;

        if teamColor == nil then
            teamColor = ColorUtil.WHITE;
        end;

        local v76 = ColorSequenceKeypoint.new(0, ColorUtil.brighten(teamColor, 0.95));
        local customPagesConfig4 = u18.customPagesConfig;

        if customPagesConfig4 ~= nil then
            customPagesConfig4 = customPagesConfig4.setTeamPage;

            if customPagesConfig4 ~= nil then
                customPagesConfig4 = customPagesConfig4.team1;
            end;
        end;

        local teamColor2 = customPagesConfig4.teamColor;

        if teamColor2 == nil then
            teamColor2 = ColorUtil.WHITE;
        end;

        v75.Color = ColorSequence.new({ v76, ColorSequenceKeypoint.new(1, ColorUtil.darken(teamColor2, 0.95)) });
        v73[v74 + 1] = u3.createElement("UIGradient", v75);
        v73[v74 + 2] = u3.createElement("UIStroke", {
            Thickness = 2.5,
            Color = Color3.fromRGB(0, 0, 0)
        });
        v70.TeamName = u3.createElement("TextLabel", v71, v73);
        local v77 = {
            [u3.Ref] = u8
        };
        local customPagesConfig5 = u18.customPagesConfig;

        if customPagesConfig5 ~= nil then
            customPagesConfig5 = customPagesConfig5.setTeamPage;

            if customPagesConfig5 ~= nil then
                customPagesConfig5 = customPagesConfig5.team1.backgroundImage;
            end;
        end;

        v77.Image = customPagesConfig5;
        v77.Size = UDim2.fromScale(1, 1);
        v77.ImageTransparency = 0;
        v77.ScaleType = Enum.ScaleType.Stretch;
        v77.BorderSizePixel = 0;
        v77.BackgroundTransparency = 1;
        v77.BackgroundColor3 = Theme.backgroundTertiary;

        v77[u3.Event.Activated] = function(p78) -- Line: 349
            -- upvalues: u20 (ref), u26 (copy)
            if not u20 then
                u26(1);
            end;
        end;

        v70.BackgroundImage = u3.createElement("ImageButton", v77);
        local v79 = {
            [u3.Ref] = u10
        };
        local customPagesConfig6 = u18.customPagesConfig;

        if customPagesConfig6 ~= nil then
            customPagesConfig6 = customPagesConfig6.setTeamPage;

            if customPagesConfig6 ~= nil then
                customPagesConfig6 = customPagesConfig6.team1.iconImage;
            end;
        end;

        v79.Image = customPagesConfig6;
        v79.Position = UDim2.fromScale(0.5, 0.5);
        v79.AnchorPoint = Vector2.new(0.5, 0.5);
        local v80;

        if u20 and u25 == 2 then
            v80 = UDim2.fromScale(0.9, 0.9);
        else
            v80 = UDim2.fromScale(1, 1);
        end;

        v79.Size = v80;
        v79.ScaleType = Enum.ScaleType.Stretch;
        v79.BackgroundTransparency = 1;
        v79.ZIndex = 2;
        v70.TeamIconImage = u3.createElement("ImageLabel", v79);
        local v81 = {
            [u3.Ref] = u12
        };
        local customPagesConfig7 = u18.customPagesConfig;

        if customPagesConfig7 ~= nil then
            customPagesConfig7 = customPagesConfig7.setTeamPage;

            if customPagesConfig7 ~= nil then
                customPagesConfig7 = customPagesConfig7.team1.foregroundImage;
            end;
        end;

        v81.Image = customPagesConfig7;
        v81.Position = UDim2.fromScale(0.5, 0.5);
        v81.AnchorPoint = Vector2.new(0.5, 0.5);
        v81.Size = UDim2.fromScale(1, 1);
        v81.ScaleType = Enum.ScaleType.Stretch;
        v81.BackgroundTransparency = 1;
        v81.ZIndex = 3;
        v70.TeamForeground = u3.createElement("ImageLabel", v81);
        v68.Team1 = u3.createElement(Empty, v69, v70);
        local v82 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.5, 1)
        };
        local v83 = { u3.createElement("Frame", {
                [u3.Ref] = u17,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                BackgroundTransparency = u20 and u25 == 2 and 1 or 0.7,
                BackgroundColor3 = ColorUtil.BLACK,
                ZIndex = 5
            }) };
        local _ = #v83;
        local v84 = {
            [u3.Ref] = u15
        };
        local customPagesConfig8 = u18.customPagesConfig;

        if customPagesConfig8 ~= nil then
            customPagesConfig8 = customPagesConfig8.setTeamPage;

            if customPagesConfig8 ~= nil then
                customPagesConfig8 = customPagesConfig8.team2.name;
            end;
        end;

        v84.Text = "TEAM " .. tostring(customPagesConfig8);
        v84.AnchorPoint = Vector2.new(0.5, 0.5);
        v84.Position = UDim2.fromScale(0.5, 0.2);
        v84.Size = UDim2.fromScale(1, 0.2);
        v84.BackgroundTransparency = 1;
        v84.Font = Enum.Font.LuckiestGuy;
        v84.TextColor3 = Color3.fromRGB(255, 255, 255);
        v84.TextWrapped = true;
        local v85;

        if u20 and u25 == 2 then
            v85 = DeviceUtil.isSmallScreen() and 24 or 45;
        else
            v85 = DeviceUtil.isSmallScreen() and 20 or 40;
        end;

        v84.TextSize = v85;
        v84.ZIndex = 4;
        local v86 = {};
        local v87 = #v86;
        local v88 = {
            Rotation = 90
        };
        local customPagesConfig9 = u18.customPagesConfig;

        if customPagesConfig9 ~= nil then
            customPagesConfig9 = customPagesConfig9.setTeamPage;

            if customPagesConfig9 ~= nil then
                customPagesConfig9 = customPagesConfig9.team2;
            end;
        end;

        local teamColor3 = customPagesConfig9.teamColor;

        if teamColor3 == nil then
            teamColor3 = ColorUtil.WHITE;
        end;

        local v89 = ColorSequenceKeypoint.new(0, ColorUtil.brighten(teamColor3, 0.95));
        local customPagesConfig10 = u18.customPagesConfig;

        if customPagesConfig10 ~= nil then
            customPagesConfig10 = customPagesConfig10.setTeamPage;

            if customPagesConfig10 ~= nil then
                customPagesConfig10 = customPagesConfig10.team2;
            end;
        end;

        local teamColor4 = customPagesConfig10.teamColor;

        if teamColor4 == nil then
            teamColor4 = ColorUtil.WHITE;
        end;

        v88.Color = ColorSequence.new({ v89, ColorSequenceKeypoint.new(1, ColorUtil.darken(teamColor4, 0.95)) });
        v86[v87 + 1] = u3.createElement("UIGradient", v88);
        v86[v87 + 2] = u3.createElement("UIStroke", {
            Thickness = 2.5,
            Color = Color3.fromRGB(0, 0, 0)
        });
        v83.TeamName = u3.createElement("TextLabel", v84, v86);
        local v90 = {
            [u3.Ref] = u9
        };
        local customPagesConfig11 = u18.customPagesConfig;

        if customPagesConfig11 ~= nil then
            customPagesConfig11 = customPagesConfig11.setTeamPage;

            if customPagesConfig11 ~= nil then
                customPagesConfig11 = customPagesConfig11.team2.backgroundImage;
            end;
        end;

        v90.Image = customPagesConfig11;
        v90.Size = UDim2.fromScale(1, 1);
        v90.ImageTransparency = 0;
        v90.ScaleType = Enum.ScaleType.Stretch;
        v90.BorderSizePixel = 0;
        v90.BackgroundTransparency = 1;
        v90.BackgroundColor3 = Theme.backgroundTertiary;

        v90[u3.Event.Activated] = function(p91) -- Line: 482
            -- upvalues: u20 (ref), u26 (copy)
            if not u20 then
                u26(2);
            end;
        end;

        v83.BackgroundImage = u3.createElement("ImageButton", v90);
        local v92 = {
            [u3.Ref] = u11
        };
        local customPagesConfig12 = u18.customPagesConfig;

        if customPagesConfig12 ~= nil then
            customPagesConfig12 = customPagesConfig12.setTeamPage;

            if customPagesConfig12 ~= nil then
                customPagesConfig12 = customPagesConfig12.team2.iconImage;
            end;
        end;

        v92.Image = customPagesConfig12;
        v92.Position = UDim2.fromScale(0.5, 0.5);
        v92.AnchorPoint = Vector2.new(0.5, 0.5);
        local v93;

        if u20 and u25 == 2 then
            v93 = UDim2.fromScale(1, 1);
        else
            v93 = UDim2.fromScale(0.9, 0.9);
        end;

        v92.Size = v93;
        v92.ScaleType = Enum.ScaleType.Stretch;
        v92.BackgroundTransparency = 1;
        v92.ZIndex = 2;
        v83.TeamIconImage = u3.createElement("ImageLabel", v92);
        local v94 = {
            [u3.Ref] = u13
        };
        local customPagesConfig13 = u18.customPagesConfig;

        if customPagesConfig13 ~= nil then
            customPagesConfig13 = customPagesConfig13.setTeamPage;

            if customPagesConfig13 ~= nil then
                customPagesConfig13 = customPagesConfig13.team2.foregroundImage;
            end;
        end;

        v94.Image = customPagesConfig13;
        v94.Position = UDim2.fromScale(0.5, 0.5);
        v94.AnchorPoint = Vector2.new(0.5, 0.5);
        v94.Size = UDim2.fromScale(1, 1);
        v94.ScaleType = Enum.ScaleType.Stretch;
        v94.BackgroundTransparency = 1;
        v94.ZIndex = 3;
        v83.TeamForeground = u3.createElement("ImageLabel", v94);
        v68.Team2 = u3.createElement(Empty, v82, v83);
        v66.TeamImages = u3.createElement(Empty, v67, v68);
        local v95 = not u20;

        if v95 then
            local v96 = {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.25),
                Size = UDim2.fromScale(0.9, 0.4)
            };
            local v97 = {};
            local v98 = {};
            local customPagesConfig14 = u18.customPagesConfig;

            if customPagesConfig14 ~= nil then
                customPagesConfig14 = customPagesConfig14.setTeamPage;

                if customPagesConfig14 ~= nil then
                    customPagesConfig14 = customPagesConfig14.eventDescription;
                end;
            end;

            v98.Text = "<b>" .. tostring(customPagesConfig14) .. "</b>";
            v98.TextSize = u20 and 20 or 14;
            v98.AnchorPoint = Vector2.new(0.5, 0.5);
            v98.Position = UDim2.fromScale(0.5, 0.5);
            v98.Size = UDim2.fromScale(1, 1);
            v98.Font = Enum.Font.GothamBold;
            v98.BorderColor3 = Color3.new(1, 1, 1);
            v98.BorderMode = Enum.BorderMode.Inset;
            v98.TextColor3 = ColorUtil.WHITE;
            v98.RichText = true;
            v98.BackgroundTransparency = 1;
            v97[#v97 + 1] = u3.createElement("TextLabel", v98);
            v95 = u3.createFragment({
                EventDescription = u3.createElement("Frame", v96, v97)
            });
        end;

        local v99 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.25)
        };
        local v100 = {};
        local v101 = #v100;

        if v95 then
            v100[v101 + 1] = v95;
        end;

        local v102 = #v100;
        local v103 = u20;

        if v103 then
            local v104 = {
                CoinsCollected = v19
            };
            local customPagesConfig14 = u18.customPagesConfig;

            if customPagesConfig14 ~= nil then
                customPagesConfig14 = customPagesConfig14.setTeamPage;

                if customPagesConfig14 ~= nil then
                    customPagesConfig14 = customPagesConfig14.eventContributionCurrency;
                end;
            end;

            v104.ContributionCurrencyImage = customPagesConfig14 == nil and "" or customPagesConfig14;
            v104.AppId = "EventTeamSelectedContent";
            v103 = u3.createElement(EventTeamSelectedContent, v104);
        end;

        if v103 then
            v100[v102 + 1] = v103;
        end;

        local v105 = #v100;
        local v106 = not u20;

        if v106 then
            local v107 = {};
            local v108;

            if u25 == 1 then
                local customPagesConfig14 = u18.customPagesConfig;

                if customPagesConfig14 ~= nil then
                    customPagesConfig14 = customPagesConfig14.setTeamPage;

                    if customPagesConfig14 ~= nil then
                        customPagesConfig14 = customPagesConfig14.team1.name;
                    end;
                end;

                v108 = "JOIN TEAM " .. tostring(customPagesConfig14);
            else
                local customPagesConfig14 = u18.customPagesConfig;

                if customPagesConfig14 ~= nil then
                    customPagesConfig14 = customPagesConfig14.setTeamPage;

                    if customPagesConfig14 ~= nil then
                        customPagesConfig14 = customPagesConfig14.team2.name;
                    end;
                end;

                v108 = "JOIN TEAM " .. tostring(customPagesConfig14);
            end;

            v107.Text = v108;
            v107.Font = Enum.Font.GothamBold;
            v107.AnchorPoint = Vector2.new(0.5, 0.5);
            v107.Position = UDim2.fromScale(0.5, 0.6);
            v107.Size = UDim2.new(0.5, 0, 0, 32);

            function v107.OnClick() -- Line: 623
                -- upvalues: Flamework (ref), BedwarsAppIds (ref), u25 (copy), u18 (copy), ColorUtil (ref), Theme (ref), default (ref), Players (ref), UILayers (ref)
                local v109 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
                local CONFIRMATION_MODAL = BedwarsAppIds.CONFIRMATION_MODAL;
                local v110 = {};
                local v111;

                if u25 == 1 then
                    local customPagesConfig14 = u18.customPagesConfig;

                    if customPagesConfig14 ~= nil then
                        customPagesConfig14 = customPagesConfig14.setTeamPage;

                        if customPagesConfig14 ~= nil then
                            customPagesConfig14 = customPagesConfig14.team1.nameTagIcon;
                        end;
                    end;

                    v111 = "Join Team " .. tostring(customPagesConfig14);
                else
                    local customPagesConfig14 = u18.customPagesConfig;

                    if customPagesConfig14 ~= nil then
                        customPagesConfig14 = customPagesConfig14.setTeamPage;

                        if customPagesConfig14 ~= nil then
                            customPagesConfig14 = customPagesConfig14.team2.nameTagIcon;
                        end;
                    end;

                    v111 = "Join Team " .. tostring(customPagesConfig14);
                end;

                v110.Title = v111;
                local v112;

                if u25 == 1 then
                    local customPagesConfig14 = u18.customPagesConfig;

                    if customPagesConfig14 ~= nil then
                        customPagesConfig14 = customPagesConfig14.setTeamPage;

                        if customPagesConfig14 ~= nil then
                            customPagesConfig14 = customPagesConfig14.team1.teamColor;
                        end;
                    end;

                    if customPagesConfig14 == nil then
                        customPagesConfig14 = ColorUtil.WHITE;
                    end;

                    local v113 = ColorUtil.richTextColor(customPagesConfig14);
                    local customPagesConfig15 = u18.customPagesConfig;

                    if customPagesConfig15 ~= nil then
                        customPagesConfig15 = customPagesConfig15.setTeamPage;

                        if customPagesConfig15 ~= nil then
                            customPagesConfig15 = customPagesConfig15.team1.name;
                        end;
                    end;

                    v112 = "Are you sure you want to join team <font transparency=\"0\" color=\"" .. v113 .. "\"><b>" .. tostring(customPagesConfig15) .. "</b></font>?\n\nOnce selected you will be locked in for the event.";
                else
                    local customPagesConfig14 = u18.customPagesConfig;

                    if customPagesConfig14 ~= nil then
                        customPagesConfig14 = customPagesConfig14.setTeamPage;

                        if customPagesConfig14 ~= nil then
                            customPagesConfig14 = customPagesConfig14.team2.teamColor;
                        end;
                    end;

                    if customPagesConfig14 == nil then
                        customPagesConfig14 = ColorUtil.WHITE;
                    end;

                    local v114 = ColorUtil.richTextColor(customPagesConfig14);
                    local customPagesConfig15 = u18.customPagesConfig;

                    if customPagesConfig15 ~= nil then
                        customPagesConfig15 = customPagesConfig15.setTeamPage;

                        if customPagesConfig15 ~= nil then
                            customPagesConfig15 = customPagesConfig15.team2.name;
                        end;
                    end;

                    v112 = "Are you sure you want to join team <font transparency=\"0\" color=\"" .. v114 .. "\"><b>" .. tostring(customPagesConfig15) .. "</b></font>?\n\nOnce selected you will be locked in for the event.";
                end;

                v110.Body = v112;
                v110.PrimaryBtnProps = {
                    Text = "Confirm",
                    BackgroundColor3 = Theme.backgroundSuccess
                };
                v110.SecondaryBtnProps = {
                    Text = "Cancel",
                    BackgroundColor3 = Theme.backgroundError
                };

                function v110.OnPrimaryBtnClick(p115) -- Line: 705
                    -- upvalues: u18 (ref), u25 (ref), default (ref), Players (ref), Flamework (ref), BedwarsAppIds (ref)
                    local customPagesConfig14 = u18.customPagesConfig;

                    if customPagesConfig14 ~= nil then
                        customPagesConfig14 = customPagesConfig14.setTeamPage;

                        if customPagesConfig14 ~= nil then
                            customPagesConfig14 = customPagesConfig14.globalTeamEventKey;
                        end;
                    end;

                    local v116;

                    if u25 == 1 then
                        v116 = u18.customPagesConfig;

                        if v116 ~= nil then
                            v116 = v116.setTeamPage;

                            if v116 ~= nil then
                                v116 = v116.team1.globalTeamKey;
                            end;
                        end;
                    else
                        v116 = u18.customPagesConfig;

                        if v116 ~= nil then
                            v116 = v116.setTeamPage;

                            if v116 ~= nil then
                                v116 = v116.team2.globalTeamKey;
                            end;
                        end;
                    end;

                    if not (customPagesConfig14 and v116) then
                        return nil;
                    end;

                    default.Client:Get("GlobalTeamsSetTeam"):SendToServer({
                        player = Players.LocalPlayer,
                        globalTeamEventKey = customPagesConfig14,
                        globalTeamKey = v116
                    });
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.EVENT_APP);
                end;

                function v110.OnSecondaryBtnClick() -- Line: 745
                    -- upvalues: Flamework (ref), UILayers (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.OVERLAY);
                end;

                v109:openApp(CONFIRMATION_MODAL, v110);
            end;

            v107.CornerRadius = UDim.new(0, 5);
            v107.TextSize = 24;
            v107.BackgroundColor3 = Theme.backgroundSuccess;
            v107.LayoutOrder = 1;
            v107.Selectable = true;
            v106 = u3.createElement(ButtonComponent, v107);
        end;

        if v106 then
            v100[v105 + 1] = v106;
        end;

        v66.TeamInfo = u3.createElement(Empty, v99, v100);

        return u3.createFragment({
            EventTeams = u3.createElement(Empty, v65, v66)
        });
    end)
};