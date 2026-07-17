-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DropdownComponent = v1.DropdownComponent;
local Empty = v1.Empty;
local StringUtil = v1.StringUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "leaderboard-meta");
local getLeaderboardMeta = v4.getLeaderboardMeta;
local LeaderboardMeta = v4.LeaderboardMeta;
local PlayfabLeaderboard = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "leaderboard-types").PlayfabLeaderboard;
local RobloxLeaderboard = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "roblox-leaderboards").RobloxLeaderboard;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local LeaderboardList = RuntimeLib.import(script, script.Parent.Parent, "leaderboard-list").LeaderboardList;
local StatRankElement = RuntimeLib.import(script, script.Parent, "stat-rank-element").StatRankElement;

local function _(p5) -- Line: 18
    return string.gsub(string.reverse((string.gsub(string.reverse(p5), "%d%d%d", "%1,"))), "^,", "");
end;

local u6 = u3.Component:extend("LeaderboardCore");

function u6.init(p7, p8) -- Line: 25
    -- upvalues: u2 (copy), LeaderboardMeta (copy), u3 (copy)
    p7.resetTimerActive = true;
    local v9 = {};
    local v10 = u2.entries(LeaderboardMeta);
    table.move(v10, 1, #v10, #v9 + 1, v9);

    local function _(p11) -- Line: 31
        local _ = p11[1];

        return p11[2].displayInLobby;
    end;

    local v12 = 0;
    local v13 = {};

    for i, v in v9 do
        local _ = i - 1;
        local _ = v[1];

        if v[2].displayInLobby == true then
            v12 = v12 + 1;
            v13[v12] = v;
        end;
    end;

    table.sort(v13, function(p14, p15) -- Line: 46
        return p14[2].displayName < p15[2].displayName;
    end);

    local function v21(p16, p17) -- Line: 50
        local displayName = p17[2].displayName;
        local v18 = {};
        local v19 = #v18;
        local v20 = #p16;
        table.move(p16, 1, v20, v19 + 1, v18);
        v18[v19 + v20 + 1] = {
            text = displayName,
            value = displayName
        };

        return v18;
    end;

    local v22 = {};

    for i = 1, #v13 do
        v22 = v21(v22, v13[i], i - 1, v13);
    end;

    p7.dropdownItems = v22;
    local DefaultLeaderboard = p7.props.DefaultLeaderboard;

    if DefaultLeaderboard == nil then
        local function _(p23) -- Line: 75
            local _ = p23[1];

            return p23[2].displayInLobby;
        end;

        local v24 = 0;
        local v25 = {};

        for i, v in u2.entries(LeaderboardMeta) do
            local _ = i - 1;
            local _ = v[1];

            if v[2].displayInLobby == true then
                v24 = v24 + 1;
                v25[v24] = v;
            end;
        end;

        DefaultLeaderboard = v25[1][1];
    end;

    p7.defaultLeaderboard = DefaultLeaderboard;
    p7:handleSelectLeaderboard(p7.defaultLeaderboard);
    local v26, v27 = u3.createBinding("");
    p7.resetsInText = v26;
    p7.setResetsInText = v27;
end;

function u6.didMount(p28) -- Line: 96
    p28:setupResetTimer(p28.state.leaderboard);
end;

function u6.didUpdate(p29, p30, p31) -- Line: 99
    if p30.store.Leaderboard.leaderboards ~= p29.props.store.Leaderboard.leaderboards then
        p29:refreshLeaderboard();

        return true;
    end;

    if p31.leaderboard == p29.state.leaderboard then
        return nil;
    end;

    local leaderboardData = p29.state.leaderboardData;

    if leaderboardData ~= nil then
        leaderboardData = leaderboardData.nextReset;
    end;

    if leaderboardData ~= 0 and (leaderboardData == leaderboardData and leaderboardData) then
        p29:setupResetTimer(p29.state.leaderboard);
        p29.resetTimerActive = true;
    end;

    if leaderboardData == 0 or (leaderboardData ~= leaderboardData or not leaderboardData) then
        p29.resetTimerActive = false;
        p29.setResetsInText("");
    end;

    return true;
end;

function u6.setupResetTimer(u32, u33) -- Line: 124
    -- upvalues: RuntimeLib (copy), PlayfabLeaderboard (copy), RobloxLeaderboard (copy), StringUtil (copy)
    RuntimeLib.Promise.defer(function() -- Line: 125
        -- upvalues: PlayfabLeaderboard (ref), u33 (copy), u32 (copy), RobloxLeaderboard (ref), StringUtil (ref)
        local v34 = nil;

        if PlayfabLeaderboard[u33] == nil then
            if RobloxLeaderboard[u33] ~= nil then
                v34 = u32.props.store.Leaderboard.leaderboards[u33];
            end;
        else
            v34 = u32.props.store.Leaderboard.leaderboards[u33];
        end;

        if not v34 then
            return nil;
        end;

        while u32.resetTimerActive do
            local nextReset = v34.nextReset;

            if nextReset == 0 or (nextReset ~= nextReset or not nextReset) then
                return nil;
            end;

            local v35 = os.time();
            local v36 = math.max(0, v34.nextReset - v35);
            local v37 = StringUtil.formatCountdownTime(v36, {
                hours = true,
                days = true,
                seperator = ":"
            });
            u32.setResetsInText("Resets in: <font color=\"rgb(185, 188, 255)\">" .. v37 .. "</font>");
            task.wait(1);
        end;
    end);
end;

function u6.refreshLeaderboard(p38) -- Line: 163
    local leaderboard = p38.state.leaderboard;
    local v39 = p38.props.store.Leaderboard.leaderboards[leaderboard];

    if v39 then
        p38:setState({
            leaderboard = leaderboard,
            leaderboardData = v39
        });

        return;
    end;

    p38:setState({
        leaderboard = leaderboard
    });
end;

function u6.handleSelectLeaderboard(p40, p41) -- Line: 177
    local v42 = p40.props.store.Leaderboard.leaderboards[p41];

    if v42 then
        p40:setState({
            leaderboard = p41,
            leaderboardData = v42
        });

        return;
    end;

    p40:setState({
        leaderboard = p41
    });
end;

function u6.render(u43) -- Line: 193
    -- upvalues: getLeaderboardMeta (copy), Theme (copy), ColorUtil (copy), u3 (copy), u2 (copy), LeaderboardMeta (copy), DropdownComponent (copy), Empty (copy), LeaderboardList (copy), StatRankElement (copy)
    local v44 = getLeaderboardMeta(u43.state.leaderboard);
    local leaderboardData = u43.state.leaderboardData;
    local v45 = {
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Theme.backgroundPrimary
    };
    local v46 = {};
    local v47 = #v46;
    local v48 = {
        Image = "rbxassetid://7106394844",
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0.125, 0),
        BackgroundColor3 = ColorUtil.hexColor(3092550)
    };
    local v49 = { u3.createElement("UIPadding", {
            PaddingTop = UDim.new(0.2, 0),
            PaddingBottom = UDim.new(0.2, 0),
            PaddingLeft = UDim.new(0.075, 0),
            PaddingRight = UDim.new(0.075, 0)
        }) };
    local v50 = #v49;
    local v51 = {};
    local v52;

    if v44 == nil then
        v52 = v44;
    else
        v52 = v44.displayName;
    end;

    v51.Text = "Leaderboard: " .. tostring(v52);
    v51.Size = UDim2.fromScale(1, 0.5);
    v51.Position = UDim2.fromScale(0, 0);
    v51.AnchorPoint = Vector2.new(0, 0);
    v51.BackgroundTransparency = 1;
    v51.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
    v51.TextScaled = true;
    v51.TextXAlignment = Enum.TextXAlignment.Left;
    v51.TextYAlignment = Enum.TextYAlignment.Top;
    v51.TextColor3 = Color3.fromRGB(255, 255, 255);
    v51.AutoLocalize = false;
    v49[v50 + 1] = u3.createElement("TextLabel", v51);
    local v53 = {};
    local v54;

    if v44 == nil then
        v54 = v44;
    else
        v54 = v44.description;
    end;

    v53.Text = tostring(v54);
    v53.Size = UDim2.fromScale(1, 0.4);
    v53.Position = UDim2.fromScale(0, 1);
    v53.AnchorPoint = Vector2.new(0, 1);
    v53.BackgroundTransparency = 1;
    v53.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
    v53.TextScaled = true;
    v53.TextXAlignment = Enum.TextXAlignment.Left;
    v53.TextYAlignment = Enum.TextYAlignment.Bottom;
    v53.TextColor3 = Theme.textPrimary;
    v49[v50 + 2] = u3.createElement("TextLabel", v53);
    v46[v47 + 1] = u3.createElement("ImageLabel", v48, v49);
    local v55 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.fromScale(0, 1),
        Size = UDim2.new(1, 0, 0.875, -0)
    };
    local v56 = { u3.createElement("UIPadding", {
            PaddingTop = UDim.new(0.02, 0),
            PaddingBottom = UDim.new(0.03, 0),
            PaddingLeft = UDim.new(0.075, 0),
            PaddingRight = UDim.new(0.075, 0)
        }), u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.03, 0)
        }) };
    local v57 = {
        LayoutOrder = 1,
        Size = UDim2.fromScale(1, 0.06)
    };
    local v58 = {};
    local v59 = #v58;
    local v60 = {
        OnSurfaceGui = true,
        Size = UDim2.new(0.425, 0, 1, 0),
        DefaultItem = {
            text = getLeaderboardMeta(u43.defaultLeaderboard).displayName,
            value = getLeaderboardMeta(u43.defaultLeaderboard).displayName
        }
    };
    local v61 = getLeaderboardMeta(u43.defaultLeaderboard);

    if v61 ~= nil then
        v61 = v61.displayName;
    end;

    v60.PlaceholderText = v61;
    v60.Items = u43.dropdownItems;

    function v60.OnItemSelected(u62) -- Line: 294
        -- upvalues: u2 (ref), LeaderboardMeta (ref), u43 (copy)
        local v63 = {};
        local v64 = u2.entries(LeaderboardMeta);
        table.move(v64, 1, #v64, #v63 + 1, v63);

        local function _(p65) -- Line: 299
            -- upvalues: u62 (copy)
            local _ = p65[1];

            return p65[2].displayName == u62;
        end;

        local v66 = 0;
        local v67 = {};

        for i, v in v63 do
            local _ = i - 1;
            local _ = v[1];

            if v[2].displayName == u62 == true then
                v66 = v66 + 1;
                v67[v66] = v;
            end;
        end;

        local function _(p68) -- Line: 314
            local _ = p68[2];

            return p68[1];
        end;

        local v69 = table.create(#v67);

        for i, v in v67 do
            local _ = i - 1;
            local _ = v[2];
            v69[i] = v[1];
        end;

        u43:handleSelectLeaderboard(v69[1]);
    end;

    v58[v59 + 1] = u3.createElement(DropdownComponent, v60);
    local v70 = u43.resetsInText and u3.createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        RichText = true,
        TextTransparency = 0.2,
        Text = u43.resetsInText,
        Size = UDim2.new(0.5, 0, 0.75, 0),
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.fromScale(1, 0.5),
        FontFace = Font.new("RobotoMono", Enum.FontWeight.Bold),
        TextXAlignment = Enum.TextXAlignment.Right,
        TextYAlignment = Enum.TextYAlignment.Center,
        TextColor3 = Color3.fromRGB(255, 255, 255)
    });
    v58[v59 + 2] = v70;
    v56.Header = u3.createElement(Empty, v57, v58);
    local v71;

    if leaderboardData then
        v71 = u3.createElement(LeaderboardList, {
            LeaderboardType = u43.state.leaderboard,
            LeaderboardData = leaderboardData,
            FrameProps = {
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                Size = UDim2.new(1, 0, 0.8200000000000001, 0),
                Position = UDim2.fromScale(0, 0.08)
            }
        });
    else
        v71 = leaderboardData;
    end;

    v56[#v56 + 1] = v71;
    local _ = #v56;
    local v72;

    if leaderboardData == nil then
        v72 = leaderboardData;
    else
        v72 = leaderboardData.leaderboardPosition;
    end;

    local v73 = v72 ~= nil;

    if v73 then
        local v74 = {};
        local v75;

        if leaderboardData == nil then
            v75 = leaderboardData;
        else
            v75 = leaderboardData.leaderboardPosition;
        end;

        local v76;

        if v75 == 0 or (v75 ~= v75 or not v75) then
            v76 = "Not Placed";
        else
            local v77 = tostring(leaderboardData.leaderboardPosition);
            v76 = string.gsub(string.reverse((string.gsub(string.reverse(v77), "%d%d%d", "%1,"))), "^,", "");
        end;

        v74.Text = "<b>YOUR POSITION:</b> <font color=\"rgb(185, 188, 255)\">" .. v76 .. "</font>";
        v74.Size = UDim2.new(1, 0, 0.5, -2);
        v74.BackgroundTransparency = 1;
        v74.Font = Enum.Font.RobotoMono;
        v74.TextScaled = true;
        v74.RichText = true;
        v74.TextXAlignment = Enum.TextXAlignment.Left;
        v74.TextColor3 = Color3.fromRGB(255, 255, 255);
        v74.LayoutOrder = 1;
        v73 = u3.createElement("TextLabel", v74);
    end;

    local v78 = {
        BackgroundTransparency = 1,
        LayoutOrder = 3,
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.fromScale(0, 1),
        Size = UDim2.fromScale(1, 0.07)
    };
    local v79 = { u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 2)
        }) };
    local v80 = #v79;

    if v73 then
        v79[v80 + 1] = v73;
    end;

    local v81 = {
        LayoutOrder = 2,
        Size = UDim2.new(1, 0, 0.5, -2)
    };
    local v82 = { u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10)
        }) };
    local v83 = #v82;
    local v84 = {};
    local v85;

    if v44 == nil then
        v85 = v44;
    else
        v85 = string.upper(v44.statName);
    end;

    v84.Text = "YOUR " .. tostring(v85) .. ":";
    v84.Size = UDim2.new(0, 0, 1, 0);
    v84.AutomaticSize = "X";
    v84.BackgroundTransparency = 1;
    v84.FontFace = Font.new("RobotoMono", Enum.FontWeight.Bold);
    v84.TextScaled = true;
    v84.TextXAlignment = Enum.TextXAlignment.Left;
    v84.TextColor3 = Color3.fromRGB(255, 255, 255);
    v84.LayoutOrder = 1;
    v82[v83 + 1] = u3.createElement("TextLabel", v84);
    local v86;

    if leaderboardData == nil then
        v86 = leaderboardData;
    else
        v86 = leaderboardData.localStatRank;
    end;

    if v86 then
        v86 = u3.createElement(StatRankElement, {
            LayoutOrder = 2,
            StatRank = leaderboardData.localStatRank
        });
    end;

    if v86 then
        v82[v83 + 2] = v86;
    end;

    local v87 = {};
    local v88;

    if leaderboardData == nil then
        v88 = leaderboardData;
    else
        v88 = leaderboardData.localStatRank;
    end;

    local v89;

    if v88 then
        v89 = leaderboardData.localStatRank.rankStatValue;
    elseif leaderboardData == nil then
        v89 = leaderboardData;
    else
        v89 = leaderboardData.localStatValue;
    end;

    local v90 = tostring(v89);
    local v91 = string.gsub(string.reverse((string.gsub(string.reverse(v90), "%d%d%d", "%1,"))), "^,", "");

    if leaderboardData ~= nil then
        leaderboardData = leaderboardData.localStatRank;
    end;

    if leaderboardData then
        leaderboardData = v44;
    end;

    v87.Text = "<font color=\"rgb(185, 188, 255)\">" .. v91 .. " " .. (not leaderboardData and "" or v44.metric) .. "</font>";
    v87.Size = UDim2.new(0, 0, 1, 0);
    v87.AutomaticSize = "X";
    v87.BackgroundTransparency = 1;
    v87.Font = Enum.Font.RobotoMono;
    v87.TextScaled = true;
    v87.RichText = true;
    v87.TextXAlignment = Enum.TextXAlignment.Left;
    v87.TextColor3 = Color3.fromRGB(255, 255, 255);
    v87.LayoutOrder = 3;
    v82[#v82 + 1] = u3.createElement("TextLabel", v87);
    v79[#v79 + 1] = u3.createElement(Empty, v81, v82);
    v56.LeaderboardExtraInfo = u3.createElement("Frame", v78, v79);
    v46[v47 + 2] = u3.createElement("Frame", v55, v56);

    return u3.createElement("Frame", v45, v46);
end;

function u6.willUnmount(p92) -- Line: 482
    p92.resetTimerActive = false;
end;

return {
    LeaderboardUIWrapper = function(p93) -- Line: 486, Name: LeaderboardUIWrapper
        -- upvalues: u3 (copy), u6 (ref)
        local v94 = {
            LightInfluence = 0.25,
            Face = Enum.NormalId.Front,
            SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
        };
        local v95 = {};
        local v96 = {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, -30, 1, -30)
        };
        local v97 = {};
        local v98 = {};

        for i, v in p93 do
            v98[i] = v;
        end;

        v97[#v97 + 1] = u3.createElement(u6, v98);
        v95[#v95 + 1] = u3.createElement("Frame", v96, v97);

        return u3.createElement("SurfaceGui", v94, v95);
    end,

    LeaderboardCore = u6
};