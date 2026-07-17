-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local OfflinePlayerUtil = v1.OfflinePlayerUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local AutoCompleteSearchbar = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar;
local ToggleButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "button-group", "toggle-button").ToggleButton;
local ToggleButtonGroup = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "button-group", "toggle-button-group").ToggleButtonGroup;
local ClanMemberRank = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank;
local ClanProfilePageLayout = RuntimeLib.import(script, script.Parent.Parent, "clan-profile-page-layout").ClanProfilePageLayout;
local ClanMemberDisplay = RuntimeLib.import(script, script.Parent, "clan-member-display").ClanMemberDisplay;
local ClanProfileMembersRow = RuntimeLib.import(script, script.Parent, "clan-profile-members-row").ClanProfileMembersRow;

return {
    ClanProfileMembersTab = v4.new(u3)(function(u5, p6) -- Line: 19
        -- upvalues: ClanMemberDisplay (copy), OfflinePlayerUtil (copy), u2 (copy), MapUtil (copy), ClanMemberRank (copy), u3 (copy), AutoCompleteSearchbar (copy), ToggleButton (copy), ToggleButtonGroup (copy), Empty (copy), ColorUtil (copy), ClanProfileMembersRow (copy), AutoCanvasScrollingFrame (copy), ClanProfilePageLayout (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local u7, u8 = useState({});
        local v9, u10 = useState({});
        local u11, u12 = useState({});
        local u13, u14 = useState({ {
                text = "Player",
                width = 0.275
            }, {
                text = "Rank",
                width = 0.125
            }, {
                text = "Level",
                width = 0.15
            }, {
                text = "Season Rank",
                width = 0.15
            }, {
                text = "Total Wins",
                width = 0.15
            }, {
                text = "",
                width = 0.15
            } });
        local u15, u16 = useState(ClanMemberDisplay.STATS);
        local u17 = (#u13 - 1) * 0.05 / #u13;
        useEffect(function() -- Line: 47
            -- upvalues: u13 (copy), u15 (copy), ClanMemberDisplay (ref), u14 (copy)
            local v18 = u13;

            if u15 == ClanMemberDisplay.STATS then
                v18[3].text = "Level";
                v18[3].width = 0.15;
                v18[4].text = "Season Rank";
                v18[4].width = 0.15;
                v18[5].text = "Total Wins";
                v18[5].width = 0.15;
            elseif u15 == ClanMemberDisplay.CLAN_WAR then
                v18[3].text = "Missions Completed";
                v18[3].width = 0.45;
                v18[4].text = "";
                v18[5].text = "";
                v18[4].width = 0;
                v18[5].width = 0;
            else
                v18[3].text = "Contribution";
                v18[3].width = 0.15;
                v18[4].text = "Daily Cont.";
                v18[4].width = 0.15;
                v18[5].text = "Weekly Cont.";
                v18[5].width = 0.15;
            end;

            u14(v18);
        end, { u15 });
        useEffect(function() -- Line: 73
            -- upvalues: u5 (copy), OfflinePlayerUtil (ref), u2 (ref), MapUtil (ref), u8 (copy), u10 (copy), u12 (copy)
            local v19 = {};
            local v20 = #v19;

            for i, v in u5.Members do
                v20 = v20 + 1;
                v19[v20] = { i, v };
            end;

            local u21 = {};

            for _, v in v19 do
                u21[v[1]] = v[2];
            end;

            local v22 = u2.values(u21);

            local function _(p23) -- Line: 89
                return p23.offlinePlayer.userId;
            end;

            local v24 = table.create(#v22);
            local u25 = {};

            for i, v in v22 do
                local _ = i - 1;
                v24[i] = v.offlinePlayer.userId;
            end;

            OfflinePlayerUtil.getOfflinePlayersByUserIds(v24):andThen(function(p26) -- Line: 99
                -- upvalues: u21 (copy)
                local function _(p27) -- Line: 101
                    -- upvalues: u21 (ref)
                    local v28 = u21[tostring(p27.userId)];

                    if v28 then
                        local v29 = tostring(p27.userId);
                        local v30 = {};

                        for i, v in v28 do
                            v30[i] = v;
                        end;

                        v30.offlinePlayer = p27;
                        u21[v29] = v30;
                    end;
                end;

                for i, v in p26 do
                    local _ = i - 1;
                    local v31 = u21[tostring(v.userId)];

                    if v31 then
                        local v32 = tostring(v.userId);
                        local v33 = {};

                        for i2, v2 in v31 do
                            v33[i2] = v2;
                        end;

                        v33.offlinePlayer = v;
                        u21[v32] = v33;
                    end;
                end;
            end);

            local function v42(p34, u35) -- Line: 119
                -- upvalues: MapUtil (ref), u5 (ref), u25 (copy)
                local activeClanWar = u5.store.Clans.activeClanWar;

                if activeClanWar ~= nil then
                    activeClanWar = activeClanWar.missionsCompleted;
                end;

                local v36 = MapUtil.keys(activeClanWar == nil and {} or activeClanWar);

                local function _(p37) -- Line: 130
                    return string.split(p37, "-")[1];
                end;

                local v38 = table.create(#v36);

                for i, v in v36 do
                    local _ = i - 1;
                    v38[i] = string.split(v, "-")[1];
                end;

                local function _(p39) -- Line: 139
                    -- upvalues: u35 (copy)
                    return p39 == u35;
                end;

                local v40 = 0;
                local v41 = {};

                for i, v in v38 do
                    local _ = i - 1;

                    if v == u35 == true then
                        v40 = v40 + 1;
                        v41[v40] = v;
                    end;
                end;

                u25[u35] = #v41;
            end;

            for i, v in u21 do
                v42(v, i, u21);
            end;

            local v43 = u2.values(u21);
            table.sort(v43, function(p44, p45) -- Line: 160
                return string.lower(p44.offlinePlayer.displayName) < string.lower(p45.offlinePlayer.displayName);
            end);
            u8(v43);
            u10(v43);
            u12(u25);
        end, { u5.Members });
        local u46 = u5.store.Clans.myClanId == u5.ClanId and u5.store.Clans.myClanMember and u5.store.Clans.myClanMember.rank >= ClanMemberRank.ADMIN;

        if u46 == nil then
            u46 = false;
        end;

        local v47 = { u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Left",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 10)
            }) };
        local v48 = #v47;
        local v49 = {
            Size = UDim2.new(0.95, 0, 0.08, 0)
        };

        local function v52(p50, p51) -- Line: 221
            table.insert(p50, {
                key = p51.offlinePlayer.displayName,
                aliases = { p51.offlinePlayer.name }
            });

            return p50;
        end;

        local v53 = {};

        local function v59(p54, u55) -- Line: 177
            -- upvalues: u10 (copy), u7 (copy)
            if p54 == "" then
                u10(u7);

                return nil;
            end;

            local function _(p56) -- Line: 182
                -- upvalues: u55 (copy)
                return table.find(u55, p56.offlinePlayer.displayName) ~= nil or table.find(u55, p56.offlinePlayer.name) ~= nil;
            end;

            local v57 = 0;
            local v58 = {};

            for i, v in u7 do
                local _ = i - 1;

                if (table.find(u55, v.offlinePlayer.displayName) ~= nil or table.find(u55, v.offlinePlayer.name) ~= nil) == true then
                    v57 = v57 + 1;
                    v58[v57] = v;
                end;
            end;

            u10(v58);
        end;

        local v60 = {
            Title = "MEMBERS"
        };

        for i = 1, #u7 do
            v53 = v52(v53, u7[i], i - 1, u7);
        end;

        v49.Items = v53;
        v49.InputText = "";
        v49.OnTextChange = v59;
        v49.PlaceHolderText = "Search Member";
        v49.LayoutOrder = 2;
        v47[v48 + 1] = u3.createElement(AutoCompleteSearchbar, v49);
        local v61 = {
            LayoutOrder = 3,
            Size = UDim2.new(0.95, 0, 0.08, 0)
        };
        local v62 = {};
        local v63 = u2.values(ClanMemberDisplay);

        local function v65(p64) -- Line: 250
            -- upvalues: u3 (ref), ToggleButton (ref)
            return u3.createElement(ToggleButton, {
                Value = p64,
                Text = string.upper(table.concat(string.split(p64, "_"), " "))
            });
        end;

        local v66 = table.create(#v63);

        for i, v in v63 do
            v66[i] = v65(v, i - 1, v63);
        end;

        local v67 = {};
        local v68 = #v67;
        local v70 = {
            Value = u15,

            OnChange = function(p69) -- Line: 264, Name: OnChange
                -- upvalues: u16 (copy)
                return u16(p69);
            end
        };

        for i, v in v66 do
            v67[v68 + i] = v;
        end;

        v62[#v62 + 1] = u3.createElement(ToggleButtonGroup, v70, v67);
        v47.ToggleMemberDisplayValues = u3.createElement(Empty, v61, v62);
        local v71 = {
            LayoutOrder = 4,
            Size = UDim2.new(0.95, 0, 0, 20)
        };
        local v72 = { u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 12)
            }), u3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0.03, 0),
                PaddingRight = UDim.new(0.03, 0)
            }) };

        local function v75(p73) -- Line: 292
            -- upvalues: u17 (copy), ColorUtil (ref), u3 (ref)
            local v74 = {
                Size = UDim2.new(p73.width - u17, 0, 1, 0)
            };
            local text = p73.text;
            v74.Text = (text == "" or not text) and "" or "<b>" .. p73.text .. "</b>";
            v74.TextScaled = true;
            v74.RichText = true;
            v74.Font = "Roboto";
            v74.TextColor3 = ColorUtil.WHITE;
            v74.TextXAlignment = "Left";
            v74.TextYAlignment = "Bottom";
            v74.BackgroundTransparency = 1;
            v74.LayoutOrder = 1;

            return u3.createElement("TextLabel", v74, { u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = 18
                }) });
        end;

        local v76 = table.create(#u13);

        for i, v in u13 do
            v76[i] = v75(v, i - 1, u13);
        end;

        local v77 = {
            LayoutOrder = 2,
            Size = UDim2.new(1, 0, 1, 0)
        };
        local v78 = { u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Left",
                VerticalAlignment = "Bottom",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }) };
        local v79 = #v78;

        for i, v in v76 do
            v78[v79 + i] = v;
        end;

        v72[#v72 + 1] = u3.createElement(Empty, v77, v78);
        v47.TableColumnHeaders = u3.createElement(Empty, v71, v72);

        local function v84(p80, p81) -- Line: 337
            -- upvalues: u13 (copy), u46 (copy), u5 (copy), u15 (copy), u11 (copy), u3 (ref), ClanProfileMembersRow (ref)
            local v82 = {
                Columns = u13,
                ClanMember = p80,
                AdminView = u46
            };
            local myClanMember = u5.store.Clans.myClanMember;

            if myClanMember ~= nil then
                myClanMember = myClanMember.offlinePlayer.userId;
            end;

            v82.IsMyClanMemberRow = p80.offlinePlayer.userId == myClanMember;
            v82.Index = p81;
            v82.DisplayDataType = u15;
            v82.store = u5.store;
            local v83 = u11[tostring(p80.offlinePlayer.userId)];
            v82.missionProgressCount = v83 == nil and 0 or v83;

            return u3.createElement(ClanProfileMembersRow, v82);
        end;

        local v85 = table.create(#v9);

        for i, v in v9 do
            v85[i] = v84(v, i - 1, v9);
        end;

        local v86 = {
            AdditionalSpace = 120,
            ScrollingFrameProps = {
                LayoutOrder = 5,
                Size = UDim2.new(1, 0, 0.84, -40)
            }
        };
        local v87 = { u3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 2),
                PaddingLeft = UDim.new(0, 2)
            }), u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Left",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 4)
            }) };
        local v88 = #v87;

        for i, v in v85 do
            v87[v88 + i] = v;
        end;

        v47[v48 + 2] = u3.createElement(AutoCanvasScrollingFrame, v86, v87);

        return u3.createElement(ClanProfilePageLayout, v60, v47);
    end)
};