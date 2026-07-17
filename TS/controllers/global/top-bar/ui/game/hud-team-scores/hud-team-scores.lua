-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local TopBarCard = v1.TopBarCard;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local v21 = v3.new(u2)(function(u5, p6) -- Line: 9
    -- upvalues: ColorUtil (copy), u2 (copy), TopBarCard (copy)
    local _ = p6.useState;
    local TeamScores = u5.TeamScores;

    local function v17(u7, p8) -- Line: 12
        -- upvalues: u5 (copy), ColorUtil (ref), u2 (ref), TopBarCard (ref)
        local function _(p9) -- Line: 14
            -- upvalues: u7 (copy)
            return p9.id == u7.teamId;
        end;

        local v10 = nil;

        for i, v in u5.Teams do
            local _ = i - 1;

            if v.id == u7.teamId == true then
                v10 = v;
                break;
            end;
        end;

        local v11 = {};
        local v12;

        if v10 == nil then
            v12 = v10;
        else
            v12 = v10.color;
        end;

        if v12 == nil then
            v12 = ColorUtil.BLACK;
        end;

        v11.BackgroundColor3 = v12;
        v11.LayoutOrder = u5.LayoutOrder;
        local v13 = {};
        local _ = #v13;
        local v14 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.new(0, 0, 1, 0),
            AutomaticSize = Enum.AutomaticSize.X
        };
        local v15 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 8)
            }) };
        local v16 = {};

        if v10 ~= nil then
            v10 = v10.name;
        end;

        v16.Text = tostring(v10) .. ": " .. tostring(u7.score);
        v16.BackgroundTransparency = 1;
        v16.BorderSizePixel = 0;
        v16.AutomaticSize = Enum.AutomaticSize.X;
        v16.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
        v16.TextSize = 16;
        v16.TextXAlignment = Enum.TextXAlignment.Left;
        v16.TextColor3 = ColorUtil.WHITE;
        v15[#v15 + 1] = u2.createElement("TextLabel", v16);
        v13.HudTeaScoreWrapper = u2.createElement("Frame", v14, v15);

        return u2.createElement(TopBarCard, v11, v13);
    end;

    local v18 = table.create(#TeamScores);

    for i, v in TeamScores do
        v18[i] = v17(v, i - 1, TeamScores);
    end;

    local v19 = {};
    local v20 = #v19;

    for i, v in v18 do
        v19[v20 + i] = v;
    end;

    return u2.createFragment(v19);
end);

return {
    HudTeamScores = v4.connect(function(p22, p23) -- Line: 87
        local v24 = {};

        for i, v in p23 do
            v24[i] = v;
        end;

        v24.Teams = p22.Game.teams;
        v24.TeamScores = p22.Game.teamScores;

        return v24;
    end)(v21)
};