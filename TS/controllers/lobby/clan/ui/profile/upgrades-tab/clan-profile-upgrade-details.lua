-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local DividerComponent = v1.DividerComponent;
local Empty = v1.Empty;
local StringUtil = v1.StringUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-meta");
local ClanUpgradeMeta = v4.ClanUpgradeMeta;
local ClanUpgradeTypeMeta = v4.ClanUpgradeTypeMeta;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    ClanProfileUpgradeDetails = v3.new(u2)(function(u5, p6) -- Line: 15
        -- upvalues: ClanUpgradeMeta (copy), ClanUpgradeTypeMeta (copy), u2 (copy), Theme (copy), ColorUtil (copy), DividerComponent (copy), Empty (copy), ButtonComponent (copy), StringUtil (copy)
        local _ = p6.useState;
        local u7;

        if u5.SelectedUpgrade then
            u7 = ClanUpgradeMeta[u5.SelectedUpgrade];
        else
            u7 = nil;
        end;

        local u8;

        if u7 then
            local v9;

            if u7 == nil then
                v9 = u7;
            else
                v9 = u7.type;
            end;

            u8 = ClanUpgradeTypeMeta[v9];
        else
            u8 = nil;
        end;

        local v10;

        if u8 == nil then
            v10 = u8;
        else
            v10 = u8.disabled;
        end;

        if not v10 then
            if u8 == nil then
                v10 = u8;
            else
                v10 = u8.tempDisabled;
            end;
        end;

        local NoUpgradePermission = u5.NoUpgradePermission;
        local v11 = false;

        if u7 then
            local v12;

            if u7 == nil then
                v12 = u7;
            else
                v12 = u7.type;
            end;

            local v13 = u5.Clan.upgrades[v12];
            v11 = v13 and ClanUpgradeMeta[v13].level >= u7.level and true or v11;
        end;

        local v14;

        if u7 == nil then
            v14 = u7;
        else
            v14 = u7.currency;
        end;

        local v15;

        if v14 == "ClanWarCoin" then
            local clanWarCoins = u5.Clan.clanWarCoins;
            v15 = clanWarCoins == nil and 0 or clanWarCoins;
        else
            v15 = u5.Clan.coins;
        end;

        local u16 = u7 and v15 < u7.cost and true or false;

        if u7 then
            local prerequisites = u7.prerequisites;

            if prerequisites ~= nil then
                local function _(p17) -- Line: 79
                    -- upvalues: ClanUpgradeMeta (ref), u5 (copy)
                    local v18 = ClanUpgradeMeta[p17];
                    local v19 = u5.Clan.upgrades[v18.type];

                    if v19 then
                        return ClanUpgradeMeta[v19].level >= v18.level;
                    end;

                    return false;
                end;

                prerequisites = true;

                for i, v in prerequisites do
                    local _ = i - 1;
                    local v20 = ClanUpgradeMeta[v];
                    local v21 = u5.Clan.upgrades[v20.type];
                    local v22;

                    if v21 then
                        v22 = ClanUpgradeMeta[v21].level >= v20.level;
                    else
                        v22 = false;
                    end;

                    if not v22 then
                        prerequisites = false;
                        break;
                    end;
                end;
            end;

            if u7.prerequisites and not prerequisites then
                u16 = true;
            end;
        end;

        local function v24(p23) -- Line: 106
            -- upvalues: u8 (copy), u7 (copy), u2 (ref), Theme (ref), ColorUtil (ref), DividerComponent (ref)
            if u8 and u7 then
                return u2.createFragment({
                    Header = u2.createElement("Frame", {
                        BorderSizePixel = 0,
                        LayoutOrder = 1,
                        Size = p23.Size,
                        BackgroundColor3 = Theme.backgroundPrimary
                    }, {
                        u2.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0.06, 0),
                            PaddingRight = UDim.new(0.06, 0)
                        }),
                        u2.createElement("UIListLayout", {
                            FillDirection = "Vertical",
                            VerticalAlignment = "Center",
                            HorizontalAlignment = "Center",
                            SortOrder = "LayoutOrder",
                            Padding = UDim.new(0.05, 0)
                        }),
                        UpgradeName = u2.createElement("TextLabel", {
                            TextScaled = true,
                            RichText = true,
                            Font = "Roboto",
                            BackgroundTransparency = 1,
                            LayoutOrder = 1,
                            Size = UDim2.new(1, 0, 0, 24),
                            Text = "<b>" .. u8.name .. " <font color=\"" .. ColorUtil.richTextColor(Theme.mcYellow) .. "\">Lv." .. tostring(u7.level) .. "</font></b>",
                            TextColor3 = ColorUtil.WHITE
                        }, { u2.createElement("UITextSizeConstraint", {
                                MaxTextSize = 24
                            }) }),
                        u2.createElement(DividerComponent, {
                            LayoutOrder = 2,
                            LengthScale = 0.85,
                            Margin = 0
                        }),
                        UpgradeDescription = u2.createElement("TextLabel", {
                            TextScaled = true,
                            RichText = true,
                            Font = "Roboto",
                            BackgroundTransparency = 1,
                            LayoutOrder = 3,
                            Size = UDim2.new(1, 0, 0, 32),
                            Text = "<b>" .. u7.description .. "</b>",
                            TextColor3 = ColorUtil.WHITE
                        }, { u2.createElement("UITextSizeConstraint", {
                                MaxTextSize = 16
                            }) })
                    })
                });
            end;

            return u2.createFragment();
        end;

        local function v34(p25) -- Line: 164
            -- upvalues: u8 (copy), u7 (copy), u2 (ref), ColorUtil (ref), DividerComponent (ref), Empty (ref)
            if not (u8 and u7) then
                return u2.createFragment();
            end;

            local v26 = {
                LayoutOrder = 2,
                Size = p25.Size
            };
            local v27 = {
                u2.createElement(
                    "UIListLayout",
                    {
                        FillDirection = "Vertical",
                        VerticalAlignment = "Top",
                        HorizontalAlignment = "Left",
                        SortOrder = "LayoutOrder"
                    }
                ),
                RewardTitle = u2.createElement("TextLabel", {
                    AutomaticSize = "XY",
                    SizeConstraint = "RelativeXY",
                    Text = "<b>Rewards</b>",
                    TextScaled = true,
                    RichText = true,
                    Font = "Roboto",
                    TextXAlignment = "Left",
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0, 0),
                    TextColor3 = ColorUtil.WHITE
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 16
                    }) }),
                u2.createElement(DividerComponent, {
                    LayoutOrder = 2,
                    Margin = 0
                })
            };
            local rewards = u7.rewards;

            local function v29(p28) -- Line: 203
                -- upvalues: u2 (ref), ColorUtil (ref)
                return u2.createFragment({
                    Reward = u2.createElement("TextLabel", {
                        TextScaled = true,
                        RichText = true,
                        Font = "Roboto",
                        TextXAlignment = "Left",
                        TextTransparency = 0.2,
                        BackgroundTransparency = 1,
                        Size = UDim2.new(1, 0, 0, 16),
                        Text = "<b>• " .. p28 .. "</b>",
                        TextColor3 = ColorUtil.WHITE
                    }, { u2.createElement("UITextSizeConstraint", {
                            MaxTextSize = 16
                        }) })
                });
            end;

            local v30 = table.create(#rewards);

            for i, v in rewards do
                v30[i] = v29(v, i - 1, rewards);
            end;

            local v31 = {
                LayoutOrder = 3,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0.7, 0)
            };
            local v32 = { u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    VerticalAlignment = "Top",
                    Padding = UDim.new(0.05, 0)
                }) };
            local v33 = #v32;

            for i, v in v30 do
                v32[v33 + i] = v;
            end;

            v27[#v27 + 1] = u2.createElement(Empty, v31, v32);

            return u2.createFragment({
                Rewards = u2.createElement(Empty, v26, v27)
            });
        end;

        local function v52(p35) -- Line: 249
            -- upvalues: u8 (copy), u7 (copy), u2 (ref), ColorUtil (ref), DividerComponent (ref), ClanUpgradeMeta (ref), ClanUpgradeTypeMeta (ref), u5 (copy), Theme (ref), Empty (ref)
            if not (u8 and u7) then
                return u2.createFragment();
            end;

            local v36 = {
                LayoutOrder = 3,
                Size = p35.Size
            };
            local v37 = {
                u2.createElement(
                    "UIListLayout",
                    {
                        FillDirection = "Vertical",
                        VerticalAlignment = "Top",
                        HorizontalAlignment = "Left",
                        SortOrder = "LayoutOrder"
                    }
                ),
                PreReqTitle = u2.createElement("TextLabel", {
                    AutomaticSize = "XY",
                    SizeConstraint = "RelativeXY",
                    Text = "<b>Prerequisites</b>",
                    TextScaled = true,
                    RichText = true,
                    Font = "Roboto",
                    TextXAlignment = "Left",
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0, 0),
                    TextColor3 = ColorUtil.WHITE
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 16
                    }) }),
                u2.createElement(DividerComponent, {
                    LayoutOrder = 2,
                    Margin = 0
                })
            };
            local prerequisites = u7.prerequisites;
            local v38;

            if prerequisites == nil then
                v38 = prerequisites;
            else
                local function v48(p39) -- Line: 289
                    -- upvalues: ClanUpgradeMeta (ref), ClanUpgradeTypeMeta (ref), u5 (ref), u2 (ref), ColorUtil (ref), Theme (ref)
                    local v40 = ClanUpgradeMeta[p39];
                    local v41 = ClanUpgradeTypeMeta[v40.type];
                    local v42 = u5.Clan.upgrades[v40.type];
                    local v43;

                    if v42 then
                        v43 = ClanUpgradeMeta[v42].level >= v40.level;
                    else
                        v43 = false;
                    end;

                    local createFragment = u2.createFragment;
                    local v44 = {};
                    local createElement = u2.createElement;
                    local v45 = {
                        TextScaled = true,
                        RichText = true,
                        Font = "Roboto",
                        TextXAlignment = "Left",
                        BackgroundTransparency = 1,
                        Size = UDim2.new(1, 0, 0, 16)
                    };
                    local name = v41.name;
                    local v46 = tostring(v40.level);
                    local v47;

                    if v43 then
                        v47 = "<font color=\"" .. ColorUtil.richTextColor(Theme.mcGreen) .. "\">  (Completed)</font>";
                    else
                        v47 = "<font color=\"" .. ColorUtil.richTextColor(Theme.mcRed) .. "\">  (Not Completed)</font>";
                    end;

                    v45.Text = "<b>• " .. name .. " Lv." .. v46 .. "</b>" .. v47;
                    v45.TextColor3 = ColorUtil.WHITE;
                    v45.TextTransparency = v43 and 0 or 0.2;
                    v44.PreReqEntry = createElement("TextLabel", v45, { u2.createElement("UITextSizeConstraint", {
                            MaxTextSize = 16
                        }) });

                    return createFragment(v44);
                end;

                v38 = table.create(#prerequisites);

                for i, v in prerequisites do
                    v38[i] = v48(v, i - 1, prerequisites);
                end;
            end;

            local v49 = {
                LayoutOrder = 3,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0.7, 0)
            };
            local v50 = { u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    VerticalAlignment = "Top",
                    Padding = UDim.new(0.05, 0)
                }) };
            local v51 = #v50;

            if v38 then
                for i, v in v38 do
                    v50[v51 + i] = v;
                end;
            end;

            v37[#v37 + 1] = u2.createElement(Empty, v49, v50);

            return u2.createFragment({
                PreReqs = u2.createElement(Empty, v36, v37)
            });
        end;

        local v53;

        if u7 and u8 then
            local v54 = { u2.createElement(v24, {
                    Size = UDim2.fromScale(1, 0.3)
                }) };
            local _ = #v54;
            local v55 = {
                LayoutOrder = 2,
                AnchorPoint = Vector2.new(0, 0),
                Position = UDim2.fromScale(0, 0.3),
                Size = UDim2.fromScale(1, 0.7)
            };
            local v56 = { u2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0.05, 0),
                    PaddingBottom = UDim.new(0.05, 0),
                    PaddingLeft = UDim.new(0.06, 0),
                    PaddingRight = UDim.new(0.06, 0)
                }), u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    VerticalAlignment = "Center",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0.05, 0)
                }) };
            local v57 = {
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.8)
            };
            local v58 = {};
            local v59 = u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                VerticalAlignment = "Top",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            });
            local v60 = u7.rewards and u2.createElement(v34, {
                Size = UDim2.fromScale(1, 0.45)
            });
            v58[1], v58[2] = v59, v60;
            local v61 = #v58;
            local v62 = u7.prerequisites and u2.createElement(v52, {
                Size = UDim2.fromScale(1, 0.45)
            });

            if v62 then
                v58[v61 + 1] = v62;
            end;

            v56.Body = u2.createElement(Empty, v57, v58);
            local v63;

            if v11 then
                v63 = u2.createElement(ButtonComponent, {
                    Disabled = true,
                    LayoutOrder = 2,
                    AnchorPoint = Vector2.new(0.5, 1),
                    Position = UDim2.fromScale(0.5, 1),
                    Size = UDim2.fromScale(1, 0.15),
                    BackgroundColor3 = Theme.backgroundPrimary,
                    Text = "Purchased" .. (u7.nextUpgrade and "" or " - Max Level Reached"),

                    OnClick = function() -- Line: 424, Name: OnClick
                    end
                });
            else
                local createElement = u2.createElement;
                local v64 = {
                    LayoutOrder = 2,
                    AnchorPoint = Vector2.new(0.5, 1),
                    Position = UDim2.fromScale(0.5, 1),
                    Size = UDim2.fromScale(1, 0.15),
                    Text = (v10 and "(Temporarily Disabled)" or (NoUpgradePermission and "(Insufficient Permission)" or "")) .. " " .. StringUtil.formatNumberWithCommas(u7.cost) .. " " .. (u7.currency == "ClanCoin" and "coins" or "war crystals")
                };
                local v65;

                if u16 then
                    v65 = Theme.backgroundError;
                else
                    v65 = Theme.backgroundSuccess;
                end;

                v64.BackgroundColor3 = v65;

                function v64.OnClick() -- Line: 408
                    -- upvalues: u16 (ref), u5 (copy)
                    if u16 or u5.Loading then
                        return nil;
                    end;

                    u5.OnUpgrade();
                end;

                v64.Disabled = v10 or NoUpgradePermission;
                v64.Loading = u5.Loading;
                v63 = createElement(ButtonComponent, v64);
            end;

            v56[#v56 + 1] = v63;
            v54.Content = u2.createFragment({
                Content = u2.createElement(Empty, v55, v56)
            });
            v53 = u2.createFragment(v54);
        else
            v53 = u2.createElement("TextLabel", {
                Text = "<b><font transparency=\"0.3\" size=\"16\">Select an upgrade from the list on the left</font></b>",
                TextScaled = true,
                RichText = true,
                Font = "Roboto",
                TextXAlignment = "Center",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 1),
                TextColor3 = ColorUtil.WHITE
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 20
                }) });
        end;

        local v66 = {
            BorderSizePixel = 0,
            LayoutOrder = 2,
            Size = UDim2.new(0.6, 0, 1, 0),
            BackgroundColor3 = Theme.backgroundTertiary
        };
        local v67 = {
            [#v67 + 1] = v53
        };

        return u2.createFragment({
            UpgradeDetails = u2.createElement("Frame", v66, v67)
        });
    end)
};