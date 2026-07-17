-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local TopBarCard = v1.TopBarCard;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local v38 = v3.new(u2)(function(u5, p6) -- Line: 10
    -- upvalues: ColorUtil (copy), BedwarsImageId (copy), u2 (copy), TopBarCard (copy)
    local _ = p6.useState;
    local TeamScores = u5.TeamScores;

    local function v34(u7, p8) -- Line: 15
        -- upvalues: u5 (copy), ColorUtil (ref), BedwarsImageId (ref), u2 (ref), TopBarCard (ref)
        local function _(p9) -- Line: 17
            -- upvalues: u7 (copy)
            return p9.id == u7.teamId;
        end;

        local v10 = nil;

        for i, v in u5.Teams do
            local _ = i - 1;

            if v.id == u7.teamId == true then
                v10 = v;
            end;
        end;

        local MyTeam = u5.MyTeam;

        if MyTeam ~= nil then
            MyTeam = MyTeam.id;
        end;

        local v11;

        if v10 == nil then
            v11 = v10;
        else
            v11 = v10.id;
        end;

        local v12 = MyTeam == v11;
        local v13;

        if v10 == nil then
            v13 = v10;
        else
            v13 = v10.color;
        end;

        if v13 == nil then
            v13 = ColorUtil.WHITE;
        end;

        local v14 = false;
        local v15 = 1;
        local v16 = {};

        while true do
            if v14 then
                v15 = v15 + 1;
            else
                v14 = true;
            end;

            if v15 > 5 then
                local v17 = {
                    BackgroundTransparency = 0.4,
                    LayoutOrder = u5.LayoutOrder,
                    BackgroundColor3 = ColorUtil.BLACK
                };
                local v18 = {};
                local _ = #v18;
                local v19 = {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.new(0, 0, 1, 0),
                    AutomaticSize = Enum.AutomaticSize.X
                };
                local v20 = {};
                local v21 = {
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromOffset(18, 18),
                    LayoutOrder = u5.LayoutOrder
                };
                local v22 = {};
                local v23 = u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 3)
                });
                local createElement = u2.createElement;
                local v24 = {
                    Thickness = 2
                };
                local v25;

                if v12 then
                    v25 = ColorUtil.WHITE;
                else
                    v25 = ColorUtil.darken(v13, 0.7);
                end;

                v24.Color = v25;
                v22[1], v22[2] = v23, createElement("UIStroke", v24);
                local v26 = #v22;
                local v27 = {
                    Size = UDim2.fromScale(1, 1)
                };
                local v28;

                if v10 == nil then
                    v28 = v10;
                else
                    v28 = v10.color;
                end;

                v27.BackgroundColor3 = v28;
                v27.BackgroundTransparency = 0;
                v27.BorderSizePixel = 0;
                v27.ZIndex = 99;
                local v29 = {};
                local v30 = {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                };

                if v10 ~= nil then
                    v10 = string.split(v10.name, "")[1];
                end;

                v30.Text = tostring(v10);
                v30.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
                v30.TextSize = 16;
                v30.TextColor3 = Color3.fromRGB(255, 255, 255);
                v30.TextStrokeColor3 = ColorUtil.BLACK;
                v30.TextStrokeTransparency = 0;
                v30.ZIndex = 100;
                v29.NumTeamMembers = u2.createElement("TextLabel", v30);
                v29[#v29 + 1] = u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 3)
                });
                v22[v26 + 1] = u2.createElement("Frame", v27, v29);
                v22[v26 + 2] = u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 8)
                });

                for i, v in v16 do
                    v22[v26 + 2 + i] = v;
                end;

                v20[#v20 + 1] = u2.createElement("Frame", v21, v22);
                v18.HudTeaScoreWrapper = u2.createElement("Frame", v19, v20);

                return u2.createElement(TopBarCard, v17, v18);
            end;

            local v31 = {
                ScaleType = "Fit",
                SizeConstraint = "RelativeYY",
                Size = UDim2.fromScale(1, 1),
                Image = BedwarsImageId.CIRCLE_SOLID
            };
            local v32;

            if v15 <= u7.score then
                if v10 == nil then
                    v32 = v10;
                else
                    v32 = v10.color;
                end;
            else
                v32 = ColorUtil.WHITE;
            end;

            v31.ImageColor3 = v32;
            v31.ImageTransparency = 0.4;
            v31.BackgroundTransparency = 1;
            local v33 = u2.createFragment({
                [v15] = u2.createElement("ImageLabel", v31)
            });
            table.insert(v16, v33);
        end;
    end;

    local v35 = table.create(#TeamScores);

    for i, v in TeamScores do
        v35[i] = v34(v, i - 1, TeamScores);
    end;

    local v36 = {};
    local v37 = #v36;

    for i, v in v35 do
        v36[v37 + i] = v;
    end;

    return u2.createFragment(v36);
end);

return {
    HudTeamBridgeDuelScores = v4.connect(function(p39, p40) -- Line: 180
        local v41 = {};

        for i, v in p40 do
            v41[i] = v;
        end;

        v41.Teams = p39.Game.teams;
        v41.TeamScores = p39.Game.teamScores;
        v41.MyTeam = p39.Game.myTeam;

        return v41;
    end)(v38)
};