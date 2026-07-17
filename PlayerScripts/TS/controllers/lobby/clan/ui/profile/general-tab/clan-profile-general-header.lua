-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Countdown = v1.Countdown;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local ClanBorderMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-border-meta").ClanBorderMeta;
local ClanWarUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war").ClanWarUtils;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ClanWarMedalsDisplay = RuntimeLib.import(script, script.Parent.Parent, "war-tab", "clan-war-medals-display").ClanWarMedalsDisplay;

return {
    ClanProfileGeneralHeader = v3.new(u2)(function(p4, p5) -- Line: 14
        -- upvalues: ClientStore (copy), u2 (copy), Empty (copy), ColorUtil (copy), Theme (copy), ClanWarUtils (copy), ClanWarMedalsDisplay (copy), ClanBorderMeta (copy), Countdown (copy)
        local _ = p5.useState;
        local myClan = ClientStore:getState().Clans.myClan;

        local function v7(p6) -- Line: 17
            -- upvalues: u2 (ref), Empty (ref), ColorUtil (ref)
            local Stat = p6.Stat;
            local Value = p6.Value;

            return u2.createElement(Empty, {
                Size = UDim2.fromScale(1, 0.2)
            }, { u2.createElement("TextLabel", {
                    AutomaticSize = "Y",
                    SizeConstraint = "RelativeXX",
                    Font = "Roboto",
                    TextXAlignment = "Left",
                    TextScaled = true,
                    RichText = true,
                    TextTransparency = 0.3,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 0),
                    TextColor3 = ColorUtil.WHITE,
                    Text = Stat
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 16
                    }) }), u2.createElement("TextLabel", {
                    AutomaticSize = "Y",
                    SizeConstraint = "RelativeXX",
                    Font = "Roboto",
                    TextXAlignment = "Right",
                    TextScaled = true,
                    RichText = true,
                    BackgroundTransparency = 1,
                    AutoLocalize = false,
                    Size = UDim2.fromScale(1, 0),
                    Position = UDim2.fromScale(1, 0),
                    AnchorPoint = Vector2.new(1, 0),
                    TextColor3 = ColorUtil.WHITE,
                    Text = "<b>" .. Value .. "</b>"
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 16
                    }) }) });
        end;

        local v8 = {};

        for i, v in p4 do
            v8[i] = v;
        end;

        v8.GuestView = nil;
        v8.Clan = nil;
        local v9 = {};

        for i, v in v8 do
            v9[i] = v;
        end;

        local v10 = { u2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0.05, 0),
                PaddingRight = UDim.new(0.05, 0),
                PaddingBottom = UDim.new(0.1, 0),
                PaddingTop = UDim.new(0.1, 0)
            }), u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.1, 0)
            }) };
        local _ = #v10;
        local v11 = {
            Size = UDim2.fromScale(0.5, 1)
        };
        local v12 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Top",
                HorizontalAlignment = "Left",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }) };
        local v13 = {
            LayoutOrder = 1,
            Size = UDim2.fromOffset(120, 120)
        };
        local v14 = {};
        local _ = #v14;
        local v15 = {
            Size = UDim2.fromScale(0.8, 0.8),
            Image = p4.Clan.image,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Fit
        };
        local image = p4.Clan.image;
        v15.BackgroundTransparency = (image == "" or not image) and 0 or 1;
        v15.BackgroundColor3 = Theme.backgroundTertiary;
        v15.ZIndex = 5;
        local clanWar = p4.Clan.clanWar;

        if clanWar ~= nil then
            clanWar = clanWar.medals;
        end;

        if clanWar then
            local v16 = {};
            local clanWar2 = p4.Clan.clanWar;

            if clanWar2 ~= nil then
                clanWar2 = clanWar2.medals;
            end;

            v16.Medals = ClanWarUtils.convertToMedalCount(clanWar2);
            v16.FrameProps = {
                ZIndex = 15,
                Size = UDim2.fromScale(1, 0.25),
                Position = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(1, 1)
            };
            clanWar = u2.createElement(ClanWarMedalsDisplay, v16);
        end;

        local v17 = {};
        local v18 = #v17;

        if clanWar then
            v17[v18 + 1] = clanWar;
        end;

        v14.ClanEmblem = u2.createElement("ImageLabel", v15, v17);
        local v19 = {
            BackgroundTransparency = 1,
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.fromOffset(120, 120)
        };
        local selectedBorder = p4.Clan.selectedBorder;
        local v20;

        if selectedBorder == 0 or (selectedBorder ~= selectedBorder or not selectedBorder) then
            v20 = nil;
        else
            v20 = ClanBorderMeta[p4.Clan.selectedBorder].borderImage;
        end;

        v19.Image = v20;
        v19.ZIndex = 10;
        v14.ClanEmblemBorder = u2.createElement("ImageLabel", v19);
        v12[#v12 + 1] = u2.createElement(Empty, v13, v14);
        local v21 = not p4.GuestView;

        if v21 then
            local v22;

            if myClan == nil then
                v22 = myClan;
            else
                v22 = myClan.timeToDelete;
            end;

            v21 = v22 ~= nil and u2.createElement(Countdown, {
                PreText = "Clan deleting in:\n",
                OnCompleteText = "Clan is being deleted. (Please wait ~5min)",
                EndTime = myClan.timeToDelete,
                TextLabel = {
                    TextSize = 16,
                    LayoutOrder = 4,
                    Size = UDim2.new(1, 0, 0.4, 0),
                    TextXAlignment = Enum.TextXAlignment.Left
                }
            });
        end;

        local v23 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.7, 0.7)
        };
        local v24 = {
            u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                VerticalAlignment = "Top",
                HorizontalAlignment = "Left",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }),
            u2.createElement("TextLabel", {
                TextXAlignment = "Left",
                TextYAlignment = "Top",
                AutomaticSize = "Y",
                TextSize = 20,
                AutoLocalize = false,
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                Size = UDim2.fromScale(1, 0),
                TextColor3 = Theme.textPrimary,
                Text = p4.Clan.name,
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
            }),
            u2.createElement("TextLabel", {
                TextXAlignment = "Left",
                TextYAlignment = "Top",
                AutomaticSize = "Y",
                TextSize = 16,
                AutoLocalize = false,
                TextTransparency = 0.3,
                BackgroundTransparency = 1,
                LayoutOrder = 3,
                Size = UDim2.fromScale(1, 0),
                TextColor3 = ColorUtil.WHITE,
                Text = "[" .. p4.Clan.tag .. "]",
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
            }),
            u2.createElement("TextLabel", {
                TextXAlignment = "Left",
                TextYAlignment = "Bottom",
                AutomaticSize = "Y",
                TextSize = 16,
                BackgroundTransparency = 1,
                LayoutOrder = 3,
                Size = UDim2.fromScale(1, 0),
                TextColor3 = Theme.mcYellow,
                Text = "Lv. " .. tostring(p4.Clan.level),
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
            })
        };
        local v25 = #v24;

        if v21 then
            v24[v25 + 1] = v21;
        end;

        v12.ClanNamesContainer = u2.createElement(Empty, v23, v24);
        v10.Left = u2.createElement(Empty, v11, v12);
        local v26 = {
            Size = UDim2.fromScale(0.4, 1)
        };
        local v27 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                VerticalAlignment = "Top",
                HorizontalAlignment = "Left",
                Padding = UDim.new(0.05, 0)
            }) };
        local v28 = #v27;
        local v29 = 0;
        local v30 = {
            Stat = "Members"
        };

        for _ in p4.Clan.members do
            v29 = v29 + 1;
        end;

        v30.Value = tostring(v29) .. "/" .. tostring(p4.Clan.maxMembers);
        v27[v28 + 1] = u2.createElement(v7, v30);
        v27[v28 + 2] = u2.createElement(v7, {
            Stat = "Leader",
            Value = p4.Clan.leader.offlinePlayer.name
        });
        v10.Right = u2.createElement(Empty, v26, v27);

        return u2.createFragment({
            ClanHeader = u2.createElement("Frame", v9, v10)
        });
    end)
};