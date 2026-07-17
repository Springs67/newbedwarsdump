-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local TopBarCard = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").TopBarCard;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local HudTeamBox = RuntimeLib.import(script, script.Parent, "hud-team-box").HudTeamBox;
local v16 = v2.new(u1)(function(u4, p5) -- Line: 9
    -- upvalues: KnitClient (copy), u1 (copy), HudTeamBox (copy), TopBarCard (copy)
    local _ = p5.useState;
    p5.useEffect(function() -- Line: 12
        -- upvalues: KnitClient (ref)
        KnitClient.Controllers.TopBarController:preloadBedsTopbarHud();
    end, {});
    local v6 = {
        LayoutOrder = u4.LayoutOrder
    };
    local v7 = {};
    local Teams = u4.Teams;

    local function _(p8, p9) -- Line: 21
        -- upvalues: u4 (copy), u1 (ref), HudTeamBox (ref)
        local MyTeam = u4.MyTeam;

        if MyTeam ~= nil then
            MyTeam = MyTeam.id;
        end;

        local v10 = MyTeam == p8.id;

        return u1.createElement(HudTeamBox, {
            Team = p8,
            IsLocalTeam = v10,
            LayoutOrder = v10 and -1 or p9
        });
    end;

    local v11 = table.create(#Teams);

    for i, v in Teams do
        local MyTeam = u4.MyTeam;

        if MyTeam ~= nil then
            MyTeam = MyTeam.id;
        end;

        local v12 = MyTeam == v.id;
        v11[i] = u1.createElement(HudTeamBox, {
            Team = v,
            IsLocalTeam = v12,
            LayoutOrder = v12 and -1 or i - 1
        });
    end;

    local v13 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.new(0, 0, 1, 0),
        AutomaticSize = Enum.AutomaticSize.X
    };
    local v14 = { u1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8)
        }) };
    local v15 = #v14;

    for i, v in v11 do
        v14[v15 + i] = v;
    end;

    v7[#v7 + 1] = u1.createElement("Frame", v13, v14);

    return u1.createElement(TopBarCard, v6, v7);
end);

return {
    HudTeamBeds = v3.connect(function(p17, p18) -- Line: 62
        local v19 = {};

        for i, v in p18 do
            v19[i] = v;
        end;

        v19.MyTeam = p17.Game.myTeam;

        return v19;
    end)(v16)
};