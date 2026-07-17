-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local v22 = v3.new(u2)(function(u5, p6) -- Line: 14
    -- upvalues: ColorUtil (copy), Players (copy), u2 (copy), Button (copy), SoundManager (copy), GameSound (copy), default (copy), Empty (copy)
    local _ = p6.useState;
    local v7;

    if u5.Team == nil then
        v7 = nil;
    else
        local function _(p8) -- Line: 19
            -- upvalues: u5 (copy)
            return p8.id == u5.Team.id;
        end;

        v7 = nil;

        for i, v in u5.QueueMeta.teams do
            local _ = i - 1;

            if v.id == u5.Team.id == true then
                v7 = v;
                break;
            end;
        end;
    end;

    local v9;

    if v7 == nil then
        v9 = v7;
    else
        v9 = v7.maxPlayers;
    end;

    local Team = u5.Team;

    if Team then
        local MyTeam = u5.MyTeam;

        if MyTeam ~= nil then
            MyTeam = MyTeam.id;
        end;

        local Team2 = u5.Team;

        if Team2 ~= nil then
            Team2 = Team2.id;
        end;

        Team = MyTeam == Team2;
    end;

    local v10 = Team and true or (u5.Team == nil and u5.MyTeam == nil and true or false);
    local v11;

    if v7 then
        v11 = ColorUtil.hexColor(v7.colorHex);
    else
        v11 = nil;
    end;

    local v12 = not v7 and "Spectate" or v7.displayName;
    local v13;

    if u5.Team then
        v13 = 0;

        for _ in u5.Team.members do
            v13 = v13 + 1;
        end;
    else
        local function _(p14) -- Line: 79
            return p14.Team == nil and true or p14.Team.Name == "Spectators";
        end;

        local v15 = 0;
        local v16 = {};

        for i, v in Players:GetPlayers() do
            local _ = i - 1;

            if (v.Team == nil and true or v.Team.Name == "Spectators") == true then
                v15 = v15 + 1;
                v16[v15] = v;
            end;
        end;

        v13 = #v16;
    end;

    local v17 = {
        Size = UDim2.fromScale(1, 1),
        LayoutOrder = u5.LayoutOrder
    };
    local v20 = { u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 3,
            DominantAxis = "Height"
        }), u2.createElement(Button, {
            Text = "<b><font color=\"" .. ColorUtil.richTextColor(v11 or Color3.fromRGB(255, 255, 255)) .. "\">" .. v12 .. "</font>" .. (not v7 and "" or "  (" .. tostring(v13) .. "/" .. tostring(v9 == nil and 20 or v9) .. ")") .. "</b>",
            Size = UDim2.fromScale(1, 1),

            OnClick = function() -- Line: 106, Name: OnClick
                -- upvalues: SoundManager (ref), GameSound (ref), default (ref), u5 (copy)
                SoundManager:playSound(GameSound.UI_CLICK);
                local v18 = default.Client:GetNamespace("CustomMatches"):Get("SelectTeam");
                local Team2 = u5.Team;

                if Team2 ~= nil then
                    Team2 = Team2.name;
                end;

                v18:CallServerAsync(Team2 == nil and "spectators" or Team2):andThen(function(p19) -- Line: 118
                end);
            end
        }) };
    local v21 = #v20;

    if v10 then
        v10 = u2.createElement("Frame", {
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0.05, 0),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, -0.05),
            AnchorPoint = Vector2.new(0.5, 1)
        });
    end;

    if v10 then
        v20[v21 + 1] = v10;
    end;

    return u2.createElement(Empty, v17, v20);
end);

return {
    CustomMatchTeamButton = v4.connect(function(p23, p24) -- Line: 137
        local v25 = {};

        for i, v in p24 do
            v25[i] = v;
        end;

        v25.MyTeam = p23.Game.myTeam;

        return v25;
    end)(v22)
};