-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClanUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil;

return {
    ClanSearchListingCard = v3.new(u2)(function(p4, p5) -- Line: 10
        -- upvalues: ClanUtil (copy), u2 (copy), ColorUtil (copy), Padding (copy), Empty (copy)
        local _ = p5.useState;
        local v6;

        if p4.Clan.extraData.emblem == "" or p4.Clan.extraData.emblem == nil then
            v6 = ClanUtil.FALLBACK_CLAN_ICON;
        else
            v6 = p4.Clan.extraData.emblem;
        end;

        local v7 = {
            Size = UDim2.new(0.96, 0, 0, 60)
        };
        local v8;

        if p4.Selected then
            v8 = Color3.fromRGB(64, 69, 112);
        else
            v8 = Color3.fromRGB(47, 49, 80);
        end;

        v7.BackgroundColor3 = v8;
        local FrameProps = p4.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v7[i] = v;
            end;
        end;

        v7[u2.Event.Activated] = p4.OnClick;
        local v9 = {};
        local v10 = #v9;
        local v11 = p4.Selected and u2.createElement("UIStroke", {
            Thickness = 2,
            Color = ColorUtil.WHITE
        });

        if v11 then
            v9[v10 + 1] = v11;
        end;

        local v12 = #v9;
        v9[v12 + 1] = u2.createElement(Padding, {
            Padding = {
                Vertical = 4,
                Horizontal = 8
            }
        });
        v9[v12 + 2] = u2.createElement("UICorner", {
            CornerRadius = UDim.new(0.1, 0)
        });
        v9[v12 + 3] = u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            VerticalAlignment = "Center",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.03, 0)
        });
        v9.ClanIcon = u2.createElement("ImageLabel", {
            SizeConstraint = "RelativeYY",
            ScaleType = "Fit",
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.fromOffset(54, 54),
            Image = v6
        });
        v9.ClanIdentity = u2.createElement(Empty, {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.35, 1)
        }, {
            u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                VerticalAlignment = "Center",
                HorizontalAlignment = "Left",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.1, 0)
            }),
            ClanName = u2.createElement("TextLabel", {
                TextXAlignment = "Left",
                TextSize = 18,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.new(1, 0, 0, 18),
                Text = p4.Clan.name,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
            }),
            ClanTag = u2.createElement("TextLabel", {
                TextXAlignment = "Left",
                TextSize = 14,
                TextTransparency = 0.3,
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                Size = UDim2.new(1, 0, 0, 14),
                Text = "[" .. p4.Clan.tag .. "]",
                TextColor3 = Color3.fromRGB(255, 255, 255),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular)
            })
        });
        v9.ClanStats = u2.createElement(Empty, {
            LayoutOrder = 3,
            Size = UDim2.fromScale(0.5, 1)
        }, {
            u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                HorizontalAlignment = "Right",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.03, 0)
            }),
            ClanLevel = u2.createElement("TextLabel", {
                TextXAlignment = "Left",
                TextSize = 14,
                TextTransparency = 0.3,
                BackgroundTransparency = 1,
                LayoutOrder = 3,
                Size = UDim2.fromScale(0.33, 1),
                Text = "Lv. " .. tostring(p4.Clan.extraData.clanLevel),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular)
            }),
            ClanMembersCount = u2.createElement("TextLabel", {
                TextXAlignment = "Left",
                TextSize = 14,
                TextTransparency = 0.3,
                BackgroundTransparency = 1,
                LayoutOrder = 4,
                Size = UDim2.fromScale(0.33, 1),
                Text = tostring(#p4.Clan.members) .. "/" .. tostring(p4.Clan.maxMembers),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular)
            })
        });

        return u2.createFragment({
            ClanSearchListingCard = u2.createElement("ImageButton", v7, v9)
        });
    end)
};