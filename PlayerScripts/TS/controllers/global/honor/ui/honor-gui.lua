-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local HonorTeamGUI = RuntimeLib.import(script, script.Parent, "honor-team-gui").HonorTeamGUI;
local v43 = v2.new(u1)(function(u4, p5) -- Line: 9
    -- upvalues: DeviceUtil (copy), Players (copy), u1 (copy), HonorTeamGUI (copy)
    local useState = p5.useState;
    local useEffect = p5.useEffect;
    local v6 = DeviceUtil.isSmallScreen() and 50 or 65;
    local u7, u8 = useState(0);
    local u9, u10 = useState(0);

    local function _() -- Line: 15
        -- upvalues: Players (ref)
        local v11 = Players.LocalPlayer:GetAttribute("HonorPointsLeftToGiveToAllies");

        return v11 == nil and 0 or v11;
    end;

    local function _() -- Line: 22
        -- upvalues: Players (ref)
        local v12 = Players.LocalPlayer:GetAttribute("HonorPointsLeftToGiveToOpponents");

        return v12 == nil and 0 or v12;
    end;

    useEffect(function() -- Line: 29
        -- upvalues: DeviceUtil (ref), u8 (copy), Players (ref), u10 (copy)
        if DeviceUtil.isHoarceKat() then
            u8(1);

            return nil;
        end;

        local u14 = Players.LocalPlayer:GetAttributeChangedSignal("HonorPointsLeftToGiveToAllies"):Connect(function() -- Line: 35
            -- upvalues: u8 (ref), Players (ref)
            local v13 = Players.LocalPlayer:GetAttribute("HonorPointsLeftToGiveToAllies");
            u8(v13 == nil and 0 or v13);
        end);
        local u16 = Players.LocalPlayer:GetAttributeChangedSignal("HonorPointsLeftToGiveToOpponents"):Connect(function() -- Line: 38
            -- upvalues: u10 (ref), Players (ref)
            local v15 = Players.LocalPlayer:GetAttribute("HonorPointsLeftToGiveToOpponents");
            u10(v15 == nil and 0 or v15);
        end);
        local v17 = Players.LocalPlayer:GetAttribute("HonorPointsLeftToGiveToAllies");
        u8(v17 == nil and 0 or v17);
        local v18 = Players.LocalPlayer:GetAttribute("HonorPointsLeftToGiveToOpponents");
        u10(v18 == nil and 0 or v18);

        return function() -- Line: 44
            -- upvalues: u14 (copy), u16 (copy)
            local v19 = u14;

            if v19 ~= nil then
                v19:Disconnect();
            end;

            local v20 = u16;

            if v20 ~= nil then
                v20:Disconnect();
            end;
        end;
    end, {});
    local v21 = {};
    local _ = #v21;
    local v22 = {
        Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(0, v6),
        Position = UDim2.fromScale(0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundTransparency = 0.2,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    };
    local v23 = { u1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10)
        }), u1.createElement("Frame", {
            BorderSizePixel = 4,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0.1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5)
        }, {
            u1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 10),
                PaddingBottom = UDim.new(0, 10),
                PaddingLeft = UDim.new(0, 10),
                PaddingRight = UDim.new(0, 10)
            }),
            MainHonorHeader = u1.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextSize = 28,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 1),
                Text = tostring(u7) .. " Honor Points Remaining for Allies, " .. tostring(u9) .. " for Opponents",
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextColor3 = Color3.fromRGB(255, 255, 255)
            })
        }) };
    local v24 = {};
    local Teams = u4.Teams;
    table.move(Teams, 1, #Teams, #v24 + 1, v24);
    table.sort(v24, function(p25, p26) -- Line: 107
        -- upvalues: u4 (copy)
        local MyTeam = u4.MyTeam;

        if MyTeam ~= nil then
            MyTeam = MyTeam.id;
        end;

        return p25.id == MyTeam;
    end);

    local function v37(u27, p28) -- Line: 116
        -- upvalues: u4 (copy), u7 (copy), u9 (copy), u1 (ref), HonorTeamGUI (ref)
        local MyTeam = u4.MyTeam;

        if MyTeam ~= nil then
            MyTeam = MyTeam.id;
        end;

        local v29 = false;
        local v30;

        if u27.id == MyTeam then
            v30 = u7 == 0 and true or v29;
        else
            v30 = u9 == 0 and true or v29;
        end;

        local function _(p31) -- Line: 138
            -- upvalues: u27 (copy)
            return p31.teamId == u27.id;
        end;

        local v32 = 0;
        local v33 = {};
        local v34 = {
            Team = u27,
            LayoutOrder = p28
        };

        for i, v in u4.PlayerDatas do
            local _ = i - 1;

            if v.teamId == u27.id == true then
                v32 = v32 + 1;
                v33[v32] = v;
            end;
        end;

        local function _(p35) -- Line: 151
            return p35.playerInfo;
        end;

        local v36 = table.create(#v33);

        for i, v in v33 do
            local _ = i - 1;
            v36[i] = v.playerInfo;
        end;

        v34.Players = v36;
        v34.HonoredPlayers = u4.HonoredPlayers;
        v34.Disabled = v30;

        return u1.createElement(HonorTeamGUI, v34);
    end;

    local v38 = table.create(#v24);
    local v39 = {
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        DisplayOrder = 1000
    };

    for i, v in v24 do
        v38[i] = v37(v, i - 1, v24);
    end;

    local v40 = {
        AutomaticCanvasSize = "Y",
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        ScrollBarThickness = 0,
        LayoutOrder = 3,
        Size = UDim2.fromScale(0.8, 0.8),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        ScrollingDirection = Enum.ScrollingDirection.Y
    };
    local v41 = { u1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 16)
        }) };
    local v42 = #v41;

    for i, v in v38 do
        v41[v42 + i] = v;
    end;

    v23[#v23 + 1] = u1.createElement("ScrollingFrame", v40, v41);
    v21.HonorMatchEndGUI = u1.createElement("Frame", v22, v23);

    return u1.createElement("ScreenGui", v39, v21);
end);

return {
    HonorGUI = v3.connect(function(p44, p45) -- Line: 200
        local v46 = {};

        for i, v in p45 do
            v46[i] = v;
        end;

        v46.HonoredPlayers = p44.Game.honoredPlayers;
        v46.Teams = p44.Game.teams;
        v46.MyTeam = p44.Game.myTeam;

        return v46;
    end)(v43)
};