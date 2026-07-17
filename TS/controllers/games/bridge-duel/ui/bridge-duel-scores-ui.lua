-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local TopBarCard = v1.TopBarCard;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v41 = v3.new(u2)(function(u5, p6) -- Line: 11
    -- upvalues: ColorUtil (copy), BedwarsImageId (copy), u2 (copy), Theme (copy), TopBarCard (copy)
    local _ = p6.useState;
    local v7 = {};
    local _ = #v7;
    local TeamScores = u5.TeamScores;

    local function v35(u8, p9) -- Line: 23
        -- upvalues: u5 (copy), ColorUtil (ref), BedwarsImageId (ref), u2 (ref), Theme (ref), TopBarCard (ref)
        local function _(p10) -- Line: 25
            -- upvalues: u8 (copy)
            return p10.id == u8.teamId;
        end;

        local v11 = nil;

        for i, v in u5.Teams do
            local _ = i - 1;

            if v.id == u8.teamId == true then
                v11 = v;
            end;
        end;

        local v12;

        if v11 == nil then
            v12 = v11;
        else
            v12 = v11.color;
        end;

        if v12 == nil then
            v12 = ColorUtil.WHITE;
        end;

        local MyTeam = u5.MyTeam;

        if MyTeam ~= nil then
            MyTeam = MyTeam.id;
        end;

        local v13;

        if v11 == nil then
            v13 = v11;
        else
            v13 = v11.id;
        end;

        local v14 = MyTeam == v13;
        local v15 = false;
        local v16 = 1;
        local v17 = {};

        while true do
            if v15 then
                v16 = v16 + 1;
            else
                v15 = true;
            end;

            if v16 > 5 then
                local v18 = {
                    BackgroundTransparency = 0.4,
                    Size = UDim2.new(0, 0, 0, 24),
                    BackgroundColor3 = ColorUtil.BLACK,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(p9 % 2 == 0 and 0.4 or 0.6, 0, 0, Theme.topBarGuiSpacing)
                };
                local v19 = {};
                local _ = #v19;
                local v20 = {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.new(0, 0, 1, 0),
                    AutomaticSize = Enum.AutomaticSize.X,
                    AnchorPoint = Vector2.new(0.5, 0.5)
                };
                local v21 = {};
                local v22 = {
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromOffset(12, 12)
                };
                local v23 = {};
                local v24 = u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 3)
                });
                local createElement = u2.createElement;
                local v25 = {
                    Thickness = 2
                };
                local v26;

                if v14 then
                    v26 = ColorUtil.WHITE;
                else
                    v26 = ColorUtil.darken(v12, 0.7);
                end;

                v25.Color = v26;
                v23[1], v23[2] = v24, createElement("UIStroke", v25);
                local v27 = #v23;
                local v28 = {
                    Size = UDim2.fromScale(1, 1)
                };
                local v29;

                if v11 == nil then
                    v29 = v11;
                else
                    v29 = v11.color;
                end;

                v28.BackgroundColor3 = v29;
                v28.BackgroundTransparency = 0;
                v28.BorderSizePixel = 0;
                v28.ZIndex = 99;
                local v30 = {};
                local v31 = {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                };

                if v11 ~= nil then
                    v11 = string.split(v11.name, "")[1];
                end;

                v31.Text = "<b>" .. tostring(v11) .. "</b>";
                v31.Font = "Roboto";
                v31.TextSize = 12;
                v31.RichText = true;
                v31.TextColor3 = Color3.fromRGB(255, 255, 255);
                v31.TextStrokeColor3 = ColorUtil.BLACK;
                v31.TextStrokeTransparency = 0;
                v31.ZIndex = 100;
                v30.NumTeamMembers = u2.createElement("TextLabel", v31);
                v30[#v30 + 1] = u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 3)
                });
                v23[v27 + 1] = u2.createElement("Frame", v28, v30);
                v23[v27 + 2] = u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 4)
                });

                for i, v in v17 do
                    v23[v27 + 2 + i] = v;
                end;

                v21[#v21 + 1] = u2.createElement("Frame", v22, v23);
                v19.BridgeDuelScoreWrapper = u2.createElement("Frame", v20, v21);

                return u2.createElement(TopBarCard, v18, v19);
            end;

            local v32 = {
                ScaleType = "Fit",
                SizeConstraint = "RelativeYY",
                Size = UDim2.fromScale(1, 1),
                Image = BedwarsImageId.CIRCLE_SOLID
            };
            local v33;

            if v16 <= u8.score then
                if v11 == nil then
                    v33 = v11;
                else
                    v33 = v11.color;
                end;
            else
                v33 = ColorUtil.WHITE;
            end;

            v32.ImageColor3 = v33;
            v32.ImageTransparency = 0.4;
            v32.BackgroundTransparency = 1;
            local v34 = u2.createFragment({
                [v16] = u2.createElement("ImageLabel", v32)
            });
            table.insert(v17, v34);
        end;
    end;

    local v36 = table.create(#TeamScores);
    local v37 = {
        DisplayOrder = 20,
        IgnoreGuiInset = true,
        ResetOnSpawn = false
    };

    for i, v in TeamScores do
        v36[i] = v35(v, i - 1, TeamScores);
    end;

    local v38 = {
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 0.1),
        AnchorPoint = Vector2.new(0.5, 0),
        AutomaticSize = Enum.AutomaticSize.X,
        Position = UDim2.new(0.5, 0, 0, Theme.topBarTopOffset * 11)
    };
    local v39 = {};
    local v40 = #v39;

    for i, v in v36 do
        v39[v40 + i] = v;
    end;

    v7.BridgeDuelScores = u2.createElement("Frame", v38, v39);

    return u2.createFragment({
        BridgeDuelScoresGui = u2.createElement("ScreenGui", v37, v7)
    });
end);

return {
    BridgeDuelScoresGui = v4.connect(function(p42, p43) -- Line: 203
        local v44 = {};

        for i, v in p43 do
            v44[i] = v;
        end;

        v44.Teams = p42.Game.teams;
        v44.TeamScores = p42.Game.teamScores;
        v44.MyTeam = p42.Game.myTeam;

        return v44;
    end)(v41)
};