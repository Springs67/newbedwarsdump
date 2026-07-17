-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local StringUtil = v1.StringUtil;
local UILayers = v1.UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local MenuComponent = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "menu", "menu-component").MenuComponent;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local ClanMemberRank = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank;
local ClanUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil;
local ClanWarMissionPoolFactory = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "missions", "clan-war-mission-pool-factory").ClanWarMissionPoolFactory;
local RankMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ClanMemberDisplay = RuntimeLib.import(script, script.Parent, "clan-member-display").ClanMemberDisplay;

return {
    ClanProfileMembersRow = v4.new(u3)(function(u5, p6) -- Line: 21
        -- upvalues: ClanUtil (copy), u2 (copy), ClanMemberRank (copy), KnitClient (copy), Flamework (copy), BedwarsAppIds (copy), ColorUtil (copy), Theme (copy), UILayers (copy), u3 (copy), ClanMemberDisplay (copy), RankMeta (copy), Empty (copy), StringUtil (copy), ClanWarMissionPoolFactory (copy), MenuComponent (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local v7 = (#u5.Columns - 1) * 0.05 / #u5.Columns;
        local v8, u9 = useState(0);
        local v10, u11 = useState(0);
        local v12, u13 = useState("--");
        local v14, u15 = useState(nil);
        local v16, u17 = useState("--");
        useEffect(function() -- Line: 31
            -- upvalues: u5 (copy), ClanUtil (ref), u9 (copy), u2 (ref), u11 (copy)
            local myClan = u5.store.Clans.myClan;

            if myClan ~= nil then
                myClan = myClan.clanContribution;
            end;

            if not myClan then
                return nil;
            end;

            local u18 = ClanUtil.getContributionDayId();
            local v19 = myClan.dailyMemberContributions[u18];

            if v19 ~= nil then
                v19 = v19[tostring(u5.ClanMember.offlinePlayer.userId)];
            end;

            if v19 ~= 0 and (v19 == v19 and v19) then
                u9(v19);
            end;

            local u20 = 0;

            local function _(p21) -- Line: 55
                -- upvalues: u18 (copy), u5 (ref), u20 (ref)
                if u18 < p21[1] then
                    return nil;
                end;

                local v22 = p21[2][tostring(u5.ClanMember.offlinePlayer.userId)];

                if v22 ~= 0 and (v22 == v22 and v22) then
                    u20 = u20 + v22;
                end;
            end;

            for i, v in u2.entries(myClan.dailyMemberContributions) do
                local _ = i - 1;
                local v23 = v[2];

                if u18 >= v[1] then
                    local v24 = v23[tostring(u5.ClanMember.offlinePlayer.userId)];

                    if v24 ~= 0 and (v24 == v24 and v24) then
                        u20 = u20 + v24;
                    end;
                end;
            end;

            u11(u20);
        end, { u5.ClanMember.contribution });
        useEffect(function() -- Line: 72
            -- upvalues: u5 (copy), u13 (copy), u15 (copy), u17 (copy)
            if not u5.ClanMember.stats then
                return nil;
            end;

            u13((tostring(u5.ClanMember.stats.level)));
            u15(u5.ClanMember.stats.seasonRank);
            u17((tostring(u5.ClanMember.stats.totalWins)));
        end, { u5.ClanMember.stats });
        local v25 = {};
        local myClanMember = u5.store.Clans.myClanMember;

        if u5.AdminView and (myClanMember and myClanMember.rank > u5.ClanMember.rank) then
            if u5.ClanMember.rank < ClanMemberRank.ADMIN then
                table.insert(v25, {
                    text = "Promote",

                    callback = function(u26) -- Line: 89, Name: callback
                        -- upvalues: u5 (copy), KnitClient (ref)
                        local myClanId = u5.store.Clans.myClanId;

                        if myClanId == "" or not myClanId then
                            return nil;
                        end;

                        u26(true);
                        KnitClient.Controllers.ClanController:promoteMember(u5.ClanMember, u5.store.Clans.myClanId):andThen(function(p27) -- Line: 96
                            -- upvalues: u26 (copy)
                            u26(false);

                            return p27;
                        end);
                    end
                });
            end;

            if u5.ClanMember.rank > ClanMemberRank.MEMBER then
                table.insert(v25, {
                    text = "Demote",

                    callback = function(u28) -- Line: 109, Name: callback
                        -- upvalues: u5 (copy), KnitClient (ref)
                        local myClanId = u5.store.Clans.myClanId;

                        if myClanId == "" or not myClanId then
                            return nil;
                        end;

                        u28(true);
                        KnitClient.Controllers.ClanController:demoteMember(u5.ClanMember, u5.store.Clans.myClanId):andThen(function(p29) -- Line: 116
                            -- upvalues: u28 (copy)
                            u28(false);

                            return p29;
                        end);
                    end
                });
            end;

            table.insert(v25, {
                text = "Kick",

                callback = function(u30) -- Line: 128, Name: callback
                    -- upvalues: u5 (copy), KnitClient (ref)
                    local myClanId = u5.store.Clans.myClanId;

                    if myClanId == "" or not myClanId then
                        return nil;
                    end;

                    u30(true);
                    KnitClient.Controllers.ClanController:kickPlayer(u5.ClanMember, u5.store.Clans.myClanId):andThen(function(p31) -- Line: 135
                        -- upvalues: u30 (copy)
                        u30(false);

                        return p31;
                    end);
                end
            });

            if myClanMember.rank == ClanMemberRank.LEADER then
                table.insert(v25, {
                    text = "Transfer Leadership",
                    dangerous = true,

                    callback = function(p32) -- Line: 146, Name: callback
                        -- upvalues: Flamework (ref), BedwarsAppIds (ref), ColorUtil (ref), Theme (ref), u5 (copy), KnitClient (ref), UILayers (ref)
                        p32(true);
                        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CONFIRMATION_MODAL, {
                            Title = "Transfer Leadership?",
                            Body = "Are you sure you want to transfer the leadership of this clan to <font transparency=\"0\" color=\"" .. ColorUtil.richTextColor(Theme.mcAqua) .. "\"><b>[" .. u5.ClanMember.offlinePlayer.displayName .. "]</b></font>?",
                            PrimaryBtnProps = {
                                Text = "Transfer",
                                BackgroundColor3 = Theme.backgroundError
                            },
                            SecondaryBtnProps = {
                                Text = "Cancel"
                            },

                            OnPrimaryBtnClick = function(u33) -- Line: 158, Name: OnPrimaryBtnClick
                                -- upvalues: u5 (ref), KnitClient (ref)
                                local myClanId = u5.store.Clans.myClanId;

                                if myClanId == "" or not myClanId then
                                    return nil;
                                end;

                                KnitClient.Controllers.ClanController:transferLeadership(u5.ClanMember, u5.store.Clans.myClanId):andThen(function(p34) -- Line: 164
                                    -- upvalues: u33 (copy)
                                    u33(false);

                                    return p34;
                                end);
                            end,

                            OnSecondaryBtnClick = function() -- Line: 170, Name: OnSecondaryBtnClick
                                -- upvalues: Flamework (ref), UILayers (ref)
                                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.OVERLAY);
                            end
                        });
                    end
                });
            end;
        end;

        local v35 = {
            BorderSizePixel = 0,
            Size = UDim2.new(0.95, 0, 0, 40),
            BackgroundColor3 = Theme.backgroundPrimary,
            LayoutOrder = u5.Index
        };
        local v36 = {};
        local v37 = #v36;
        local v38 = u5.IsMyClanMemberRow and u3.createElement("UIStroke", {
            Thickness = 1,
            Color = Theme.textPrimary
        });

        if v38 then
            v36[v37 + 1] = v38;
        end;

        local v39 = #v36;
        v36[v39 + 1] = u3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 6)
        });
        local v40 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v41 = { u3.createElement("UIPadding", {
                PaddingTop = UDim.new(0.15, 0),
                PaddingBottom = UDim.new(0.15, 0),
                PaddingLeft = UDim.new(0.03, 0),
                PaddingRight = UDim.new(0.03, 0)
            }), u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 12)
            }) };
        local v42;

        if u5.DisplayDataType == ClanMemberDisplay.STATS then
            local v43 = {
                LayoutOrder = 3,
                Size = UDim2.new(u5.Columns[4].width - v7, 0, 1, 0)
            };
            local v44 = { u3.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0.03, 0)
                }) };
            local v45 = #v44;
            local v46;

            if v14 == 0 then
                v46 = false;
            elseif v14 == v14 then
                v46 = v14;
            else
                v46 = false;
            end;

            local v47 = (v46 and true or false) and u3.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                LayoutOrder = 0,
                Size = UDim2.new(0.45, 0, 1, 0),
                SizeConstraint = Enum.SizeConstraint.RelativeXY,
                Image = RankMeta[v14].image,
                ScaleType = Enum.ScaleType.Fit
            });

            if v47 then
                v44[v45 + 1] = v47;
            end;

            local v48 = {
                Size = UDim2.new(0.45, 0, 1, 0)
            };
            local v49;

            if v14 == 0 or (v14 ~= v14 or not v14) then
                v49 = "--";
            else
                local shortName = RankMeta[v14].shortName;
                v49 = shortName == nil and "--" or shortName;
            end;

            v48.Text = v49;
            v48.TextScaled = true;
            v48.RichText = true;
            v48.Font = "Roboto";
            v48.TextColor3 = ColorUtil.WHITE;
            v48.TextXAlignment = "Left";
            v48.TextYAlignment = "Center";
            v48.TextTransparency = 0.3;
            v48.BackgroundTransparency = 1;
            v48.LayoutOrder = 1;
            v44[#v44 + 1] = u3.createElement("TextLabel", v48, { u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = 16
                }) });
            v42 = u3.createElement(Empty, v43, v44);
        elseif u5.DisplayDataType == ClanMemberDisplay.CONTRIBUTION then
            v42 = u3.createElement("TextLabel", {
                TextScaled = true,
                RichText = true,
                Font = "Roboto",
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                TextTransparency = 0.3,
                BackgroundTransparency = 1,
                LayoutOrder = 3,
                Size = UDim2.new(u5.Columns[4].width - v7, 0, 1, 0),
                Text = StringUtil.formatNumberWithCommas((math.floor(v8))),
                TextColor3 = ColorUtil.WHITE
            }, { u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = 16
                }) });
        else
            v42 = nil;
        end;

        local v50 = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 1)
        };
        local v51 = {};
        local v52 = u3.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            VerticalAlignment = "Center",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.05, 0)
        });
        local v53 = u3.createElement(Empty, {
            LayoutOrder = 2,
            Size = UDim2.new(u5.Columns[1].width - v7, 0, 1, 0)
        }, { u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }), u3.createElement("TextLabel", {
                TextScaled = true,
                RichText = true,
                Font = "Roboto",
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                AutoLocalize = false,
                Size = UDim2.fromScale(1, 0.55),
                Text = "<b>" .. u5.ClanMember.offlinePlayer.displayName .. "</b>",
                TextColor3 = ColorUtil.WHITE
            }, { u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = 18
                }) }), u3.createElement("TextLabel", {
                TextScaled = true,
                RichText = true,
                Font = "Roboto",
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                TextTransparency = 0.3,
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                AutoLocalize = false,
                Size = UDim2.fromScale(1, 0.4),
                Text = "@" .. u5.ClanMember.offlinePlayer.name,
                TextColor3 = ColorUtil.WHITE
            }, { u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = 16
                }) }) });
        local v54 = u3.createElement("TextLabel", {
            TextScaled = true,
            RichText = true,
            Font = "Roboto",
            TextXAlignment = "Left",
            TextYAlignment = "Center",
            TextTransparency = 0.3,
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            Size = UDim2.new(u5.Columns[2].width - v7, 0, 1, 0),
            Text = StringUtil.capitalizeFirstLetter(string.lower((tostring(ClanMemberRank[u5.ClanMember.rank])))),
            TextColor3 = ColorUtil.WHITE
        }, { u3.createElement("UITextSizeConstraint", {
                MaxTextSize = 16
            }) });
        local createElement = u3.createElement;
        local v55 = {
            TextScaled = true,
            RichText = true,
            Font = "Roboto",
            TextXAlignment = "Left",
            TextYAlignment = "Center",
            TextTransparency = 0.3,
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            Size = UDim2.new(u5.Columns[3].width - v7, 0, 1, 0)
        };

        if u5.DisplayDataType ~= ClanMemberDisplay.STATS then
            if u5.DisplayDataType == ClanMemberDisplay.CLAN_WAR then
                v12 = tostring(u5.missionProgressCount) .. " / " .. tostring(ClanWarMissionPoolFactory.TWO_MEMBER_MISSION_COUNT + ClanWarMissionPoolFactory.MANY_MEMBER_MISSION_COUNT);
            else
                v12 = StringUtil.formatNumberWithCommas((math.floor(u5.ClanMember.contribution)));
            end;
        end;

        v55.Text = v12;
        v55.TextColor3 = ColorUtil.WHITE;
        v51[1], v51[2], v51[3], v51[4] = v52, v53, v54, createElement("TextLabel", v55, { u3.createElement("UITextSizeConstraint", {
        MaxTextSize = 16
    }) });
        local v56 = #v51;

        if v42 then
            v51[v56 + 1] = v42;
        end;

        local v57 = #v51;
        local createElement2 = u3.createElement;
        local v58 = {
            TextScaled = true,
            RichText = true,
            Font = "Roboto",
            TextXAlignment = "Left",
            TextYAlignment = "Center",
            TextTransparency = 0.3,
            BackgroundTransparency = 1,
            LayoutOrder = 4,
            Size = UDim2.new(u5.Columns[5].width - v7, 0, 1, 0)
        };

        if u5.DisplayDataType ~= ClanMemberDisplay.STATS then
            v16 = u5.DisplayDataType ~= ClanMemberDisplay.CONTRIBUTION and "" or StringUtil.formatNumberWithCommas((math.floor(v10)));
        end;

        v58.Text = v16;
        v58.TextColor3 = ColorUtil.WHITE;
        v51[v57 + 1] = createElement2("TextLabel", v58, { u3.createElement("UITextSizeConstraint", {
                MaxTextSize = 16
            }) });
        local AdminView = u5.AdminView;

        if AdminView then
            if #v25 > 0 then
                AdminView = u3.createElement(MenuComponent, {
                    ButtonText = "Actions",
                    LayoutOrder = 5,
                    Items = v25,
                    Size = UDim2.new(u5.Columns[6].width - v7, 0, 1, 0)
                });
            else
                AdminView = false;
            end;
        end;

        if AdminView then
            v51[v57 + 2] = AdminView;
        end;

        v41[#v41 + 1] = u3.createElement(Empty, v50, v51);
        v36[v39 + 2] = u3.createElement(Empty, v40, v41);

        return u3.createElement("Frame", v35, v36);
    end)
};