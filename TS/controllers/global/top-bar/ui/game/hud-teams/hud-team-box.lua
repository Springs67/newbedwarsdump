-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local TooltipContainer = v1.TooltipContainer;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local BedPlatingUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-plating", "bed-plating-util").BedPlatingUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local v17 = v3.new(u2)(function(u5, p6) -- Line: 14
    -- upvalues: ColorUtil (copy), u2 (copy), TooltipContainer (copy), AutoSizedText (copy), BedwarsImageId (copy)
    local _ = p6.useState;
    local _ = p6.useEffect;
    local u7 = ColorUtil.hexColor(u5.Team.colorHex);

    local function _() -- Line: 69
        -- upvalues: BedwarsImageId (ref), u7 (copy), u5 (copy), u2 (ref), ColorUtil (ref)
        local v8 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromOffset(20, 20),
            Image = BedwarsImageId.HUD_BED_DESTROYED,
            ImageColor3 = u7,
            LayoutOrder = u5.LayoutOrder
        };
        local v9 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 3)
            }) };
        local v10 = #v9;
        local v11;

        if u5.ActiveTeamMembers > 0 then
            v11 = u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextSize = 16,
                TextStrokeTransparency = 0,
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Text = tostring(u5.ActiveTeamMembers),
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextStrokeColor3 = ColorUtil.BLACK
            });
        else
            v11 = false;
        end;

        if v11 then
            v9[v10 + 1] = v11;
        end;

        return u2.createElement("ImageLabel", v8, v9);
    end;

    return u2.createElement(function() -- Line: 20
        -- upvalues: u2 (ref), u5 (copy), ColorUtil (ref), u7 (copy), TooltipContainer (ref), AutoSizedText (ref)
        local createElement = u2.createElement;
        local v12 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Size = UDim2.fromOffset(18, 18),
            LayoutOrder = u5.LayoutOrder
        };
        local v13 = {};
        local v14 = u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 3)
        });
        local createElement2 = u2.createElement;
        local v15 = {
            Thickness = 2
        };
        local v16;

        if u5.IsLocalTeam then
            v16 = ColorUtil.WHITE;
        else
            v16 = ColorUtil.darken(u7, 0.7);
        end;

        v15.Color = v16;
        v13[1], v13[2] = v14, createElement2("UIStroke", v15);
        v13.NumTeamMembers = u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextSize = 16,
            TextStrokeTransparency = 0,
            ZIndex = 100,
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Text = tostring(u5.ActiveTeamMembers),
            FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextStrokeColor3 = ColorUtil.BLACK
        });
        v13[3], v13[4] = u2.createElement("Frame", {
    BorderSizePixel = 0,
    ZIndex = 99,
    Size = UDim2.fromScale(1, 1),
    BackgroundColor3 = u7,
    BackgroundTransparency = u5.IsBedAlive and 0 or 0.9
}, { u2.createElement("UICorner", {
        CornerRadius = UDim.new(0, 3)
    }) }), u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
        TextSize = 14,
        Text = string.upper(u5.Team.displayName) .. " BED",
        Font = Enum.Font.SourceSansBold,
        TextColor3 = u7,
        Limits = Vector2.new(300, 60)
    }) });

        return createElement("Frame", v12, v13);
    end);
end);

return {
    HudTeamBox = v4.connect(function(u18, p19) -- Line: 104
        -- upvalues: BedPlatingUtil (copy), KnitClient (copy), Players (copy)
        local v20 = table.find({ BedPlatingUtil.BedStatus.BED_PLATING_ACTIVE, BedPlatingUtil.BedStatus.BED_ALIVE }, u18.Bedwars.teamBedStatus[p19.Team.id]) ~= nil;
        local v21 = KnitClient.Controllers.TeamController:getTeam(p19.Team.id);

        if v21 ~= nil then
            v21 = v21.members;
        end;

        local v22;

        if v21 then
            local v23 = {};
            local v24 = #v23;

            for i, v in v21 do
                v24 = v24 + 1;
                v23[v24] = { i, v };
            end;

            local function _(p25, p26) -- Line: 122
                -- upvalues: u18 (copy), Players (ref)
                local v27 = p26[1];
                local _ = p26[2];

                if u18.Bedwars.finalDeaths[v27] or not Players:GetPlayerByUserId(v27) then
                    return p25;
                end;

                return p25 + 1;
            end;

            v22 = 0;

            for i = 1, #v23 do
                local v28 = v23[i];
                local _ = i - 1;
                local v29 = v28[1];
                local _ = v28[2];

                if not u18.Bedwars.finalDeaths[v29] and Players:GetPlayerByUserId(v29) then
                    v22 = v22 + 1;
                end;
            end;
        else
            v22 = 0;
        end;

        local v30 = {};

        for i, v in p19 do
            v30[i] = v;
        end;

        v30.IsBedAlive = v20;
        v30.ActiveTeamMembers = v22;

        return v30;
    end)(v17)
};