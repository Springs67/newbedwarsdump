-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local BedPlatingUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-plating", "bed-plating-util").BedPlatingUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local tabListLayout = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-config").tabListLayout;
local TeamUpgradeDisplay = RuntimeLib.import(script, script.Parent, "team-upgrade-display").TeamUpgradeDisplay;
local v16 = v3.new(u2)(function(p5, p6) -- Line: 16
    -- upvalues: DeviceUtil (copy), u2 (copy), Empty (copy), tabListLayout (copy), ColorUtil (copy), BedPlatingUtil (copy), BedwarsImageId (copy), TeamUpgradeDisplay (copy)
    local _ = p6.useState;
    local v7 = DeviceUtil.isSmallScreen() and 13 or 16;
    local v8 = p5.Team.name .. " Team";
    local createElement = u2.createElement;
    local v9 = {
        AutomaticSize = "Y",
        Size = UDim2.new(1, 0, 0, 0)
    };
    local v10 = {};
    local v11 = u2.createElement("UISizeConstraint", {
        MaxSize = tabListLayout.maxRowSize,
        MinSize = Vector2.new(0, 0)
    });
    local createElement2 = u2.createElement;
    local v12 = {
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = p5.Team.color,
        BackgroundTransparency = tabListLayout.bgTransparency.cardHeader
    };
    local v13 = {
        u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8)
        }),
        u2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 0),
            PaddingBottom = UDim.new(0, 0),
            PaddingLeft = UDim.new(0, 10),
            PaddingRight = UDim.new(0, 10)
        }),
        TeamName = u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextXAlignment = "Left",
            RichText = true,
            LayoutOrder = 1,
            Size = UDim2.fromScale(0.42, 1),
            Text = "<b>" .. v8 .. "</b>",
            Font = Enum.Font.Roboto,
            TextSize = v7,
            TextColor3 = ColorUtil.WHITE
        })
    };
    local createElement3 = u2.createElement;
    local v14 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 61,
        LayoutOrder = 2,
        Size = UDim2.fromScale(0.07, 0.9),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5)
    };
    local v15;

    if p5.TeamBedStatus == BedPlatingUtil.BedStatus.BED_PLATING_ACTIVE then
        v15 = BedwarsImageId.BED_PLATING_ACTIVE_ICON;
    elseif p5.TeamBedStatus == BedPlatingUtil.BedStatus.BED_ALIVE then
        v15 = BedwarsImageId.BED_ALIVE_ICON;
    else
        v15 = BedwarsImageId.BED_BROKEN_ICON;
    end;

    v14.Image = v15;
    v14.ImageColor3 = ColorUtil.WHITE;
    v13.BedStatusIcon = createElement3("ImageLabel", v14);
    v13[3] = u2.createElement(Empty, {
    LayoutOrder = 3,
    Size = UDim2.fromScale(0.48, 1)
}, { u2.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder
    }), u2.createElement(TeamUpgradeDisplay, {
        Team = p5.Team,
        FrameProps = {
            LayoutOrder = 3,
            Size = UDim2.fromScale(0.8, 0.95)
        }
    }), u2.createElement("TextLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Text = "<b>Kills</b>",
        RichText = true,
        LayoutOrder = 4,
        Size = UDim2.fromScale(0.2, 0.95),
        TextXAlignment = Enum.TextXAlignment.Center,
        Font = Enum.Font.Roboto,
        TextSize = v7,
        TextColor3 = ColorUtil.WHITE
    }) });
    v10[1], v10[2] = v11, createElement2("Frame", v12, v13);

    return createElement(Empty, v9, v10);
end);

return {
    TabListTeamHeader = v4.connect(function(u17, p18) -- Line: 104
        -- upvalues: GameType (copy), getQueueMeta (copy)
        local v19 = {};
        local v20 = #v19;

        for i, v in p18.Team.members do
            v20 = v20 + 1;
            v19[v20] = { i, v };
        end;

        local function _(p21, p22) -- Line: 112
            -- upvalues: u17 (copy)
            local _ = p22[1];

            if u17.Bedwars.finalDeaths[p22[2].userId] then
                return p21;
            end;

            return p21 + 1;
        end;

        local v23 = 0;

        for i = 1, #v19 do
            local v24 = v19[i];
            local _ = i - 1;
            local _ = v24[1];

            if not u17.Bedwars.finalDeaths[v24[2].userId] then
                v23 = v23 + 1;
            end;
        end;

        local BEDWARS = GameType.BEDWARS;
        local queueType = u17.Game.queueType;

        if queueType then
            if not getQueueMeta(queueType).disableTablistStats then
                local function _(p25, p26) -- Line: 138
                    -- upvalues: u17 (copy)
                    local _ = p26[1];
                    local v27 = u17.Bedwars.kills[p26[2].userId];

                    if v27 ~= 0 and (v27 == v27 and v27) then
                        p25 = p25 + v27;
                    end;

                    return p25;
                end;

                local v28 = 0;

                for i = 1, #v19 do
                    local v29 = v19[i];
                    local _ = i - 1;
                    local _ = v29[1];
                    local v30 = u17.Bedwars.kills[v29[2].userId];

                    if v30 ~= 0 and (v30 == v30 and v30) then
                        v28 = v28 + v30;
                    end;
                end;
            end;

            BEDWARS = getQueueMeta(queueType).game;
        end;

        local v31 = {};

        for i, v in p18 do
            v31[i] = v;
        end;

        v31.NumActiveMembers = v23;
        v31.NumTeamKills = 0;
        v31.TeamLevel = 0;
        v31.TeamBedStatus = u17.Bedwars.teamBedStatus[p18.Team.id];
        v31.GameType = BEDWARS;

        return v31;
    end)(v16)
};