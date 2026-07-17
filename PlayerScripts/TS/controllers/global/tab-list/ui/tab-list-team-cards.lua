-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local tabListLayout = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-config").tabListLayout;
local TeamCard = RuntimeLib.import(script, script.Parent, "tab-list-card", "team-card").TeamCard;
local TabListColumnLayout = RuntimeLib.import(script, script.Parent, "tab-list-column-layout", "tab-list-column-layout").TabListColumnLayout;
local v17 = v2.new(u1)(function(u4, p5) -- Line: 9
    -- upvalues: tabListLayout (copy), u1 (copy), TeamCard (copy), TabListColumnLayout (copy)
    local _ = p5.useState;
    local _ = p5.useEffect;
    local teamCards = tabListLayout.visible.teamCards;

    if teamCards then
        local Teams = u4.Teams;

        local function v9(p6, p7) -- Line: 15
            -- upvalues: u4 (copy), u1 (ref), TeamCard (ref)
            local v8 = {};
            local MyTeam = u4.MyTeam;

            if MyTeam ~= nil then
                MyTeam = MyTeam.id;
            end;

            v8.LayoutOrder = p6.id == MyTeam and -1 or p7;
            v8.Team = p6;
            v8.CardDimensions = u4.CardDimensions;

            return u1.createElement(TeamCard, v8);
        end;

        local v10 = table.create(#Teams);

        for i, v in Teams do
            v10[i] = v9(v, i - 1, Teams);
        end;

        local v11 = {
            Columns = 2,
            Size = UDim2.fromScale(1, 1)
        };
        local v12 = {};
        local v13 = #v12;

        for i, v in v10 do
            v12[v13 + i] = v;
        end;

        teamCards = u1.createElement(TabListColumnLayout, v11, v12);
    end;

    local v14 = {
        AutomaticCanvasSize = "Y",
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        ScrollBarThickness = 0,
        Size = UDim2.fromScale(1, tabListLayout.rows.cards.height),
        CanvasSize = UDim2.fromScale(1, tabListLayout.rows.cards.height),
        ScrollingDirection = Enum.ScrollingDirection.Y
    };
    local v15 = {};
    local v16 = #v15;

    if teamCards then
        v15[v16 + 1] = teamCards;
    end;

    return u1.createElement("ScrollingFrame", v14, v15);
end);

return {
    TabListTeamCards = v3.connect(function(p18, p19) -- Line: 61
        local v20 = {};

        for i, v in p19 do
            v20[i] = v;
        end;

        v20.Teams = p18.Game.teams;
        v20.MyTeam = p18.Game.myTeam;

        return v20;
    end)(v17)
};