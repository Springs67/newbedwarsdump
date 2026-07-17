-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local StringUtil = v1.StringUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local LeaderboardList = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lobby", "leaderboard", "leaderboard-list").LeaderboardList;
local StatRankElement = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lobby", "leaderboard", "ui", "stat-rank-element").StatRankElement;
local getLeaderboardMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "leaderboard-meta").getLeaderboardMeta;
local PlayfabLeaderboard = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "leaderboard-types").PlayfabLeaderboard;
local RobloxLeaderboard = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "roblox-leaderboards").RobloxLeaderboard;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

local function _(p3) -- Line: 14
    return string.gsub(string.reverse((string.gsub(string.reverse(p3), "%d%d%d", "%1,"))), "^,", "");
end;

local u4 = u2.Component:extend("SkullLeaderboardCore");

function u4.init(p5, p6) -- Line: 21
    -- upvalues: RobloxLeaderboard (copy), u2 (copy)
    p5.resetTimerActive = true;
    p5.defaultLeaderboard = RobloxLeaderboard.MARROWS_MADNESS;
    p5:handleSelectLeaderboard(p5.defaultLeaderboard);
    local v7, v8 = u2.createBinding("");
    p5.resetsInText = v7;
    p5.setResetsInText = v8;
end;

function u4.didMount(p9) -- Line: 27
    p9:setupResetTimer(p9.state.leaderboard);
end;

function u4.didUpdate(p10, p11, p12) -- Line: 30
    if p11.store.Leaderboard.leaderboards ~= p10.props.store.Leaderboard.leaderboards then
        p10:refreshLeaderboard();

        return true;
    end;

    if p12.leaderboard == p10.state.leaderboard then
        return nil;
    end;

    local leaderboardData = p10.state.leaderboardData;

    if leaderboardData ~= nil then
        leaderboardData = leaderboardData.nextReset;
    end;

    if leaderboardData ~= 0 and (leaderboardData == leaderboardData and leaderboardData) then
        p10:setupResetTimer(p10.state.leaderboard);
        p10.resetTimerActive = true;
    end;

    if leaderboardData == 0 or (leaderboardData ~= leaderboardData or not leaderboardData) then
        p10.resetTimerActive = false;
        p10.setResetsInText("");
    end;

    return true;
end;

function u4.setupResetTimer(u13, u14) -- Line: 55
    -- upvalues: RuntimeLib (copy), PlayfabLeaderboard (copy), RobloxLeaderboard (copy), StringUtil (copy)
    RuntimeLib.Promise.defer(function() -- Line: 56
        -- upvalues: PlayfabLeaderboard (ref), u14 (copy), u13 (copy), RobloxLeaderboard (ref), StringUtil (ref)
        local v15 = nil;

        if PlayfabLeaderboard[u14] == nil then
            if RobloxLeaderboard[u14] ~= nil then
                v15 = u13.props.store.Leaderboard.leaderboards[u14];
            end;
        else
            v15 = u13.props.store.Leaderboard.leaderboards[u14];
        end;

        if not v15 then
            return nil;
        end;

        while u13.resetTimerActive do
            local nextReset = v15.nextReset;

            if nextReset == 0 or (nextReset ~= nextReset or not nextReset) then
                return nil;
            end;

            local v16 = os.time();
            local v17 = math.max(0, v15.nextReset - v16);
            local v18 = StringUtil.formatCountdownTime(v17, {
                hours = true,
                days = true,
                seperator = ":"
            });
            u13.setResetsInText("Resets in: <font color=\"rgb(185, 188, 255)\">" .. v18 .. "</font>");
            task.wait(1);
        end;
    end);
end;

function u4.refreshLeaderboard(p19) -- Line: 94
    local leaderboard = p19.state.leaderboard;
    local v20 = p19.props.store.Leaderboard.leaderboards[leaderboard];

    if v20 then
        p19:setState({
            leaderboard = leaderboard,
            leaderboardData = v20
        });

        return;
    end;

    p19:setState({
        leaderboard = leaderboard
    });
end;

function u4.handleSelectLeaderboard(p21, p22) -- Line: 108
    local v23 = p21.props.store.Leaderboard.leaderboards[p22];

    if v23 then
        p21:setState({
            leaderboard = p22,
            leaderboardData = v23
        });

        return;
    end;

    p21:setState({
        leaderboard = p22
    });
end;

function u4.render(p24) -- Line: 124
    -- upvalues: getLeaderboardMeta (copy), StringUtil (copy), Theme (copy), ColorUtil (copy), u2 (copy), Empty (copy), LeaderboardList (copy), StatRankElement (copy)
    local v25 = getLeaderboardMeta(p24.state.leaderboard);
    local leaderboardData = p24.state.leaderboardData;
    local v26;

    if leaderboardData == nil then
        v26 = leaderboardData;
    else
        v26 = leaderboardData.localStatRank;
    end;

    local v27;

    if v26 then
        v27 = leaderboardData.localStatRank.rankStatValue;
    elseif leaderboardData == nil then
        v27 = leaderboardData;
    else
        v27 = leaderboardData.localStatValue;
    end;

    local v28 = tostring(v27);
    local v29;

    if v25 == nil then
        v29 = v25;
    else
        v29 = v25.statsType;
    end;

    local v30 = v29 == "time";

    if v30 then
        if leaderboardData == nil then
            v30 = leaderboardData;
        else
            v30 = leaderboardData.localStatValue;
        end;
    end;

    if v30 ~= 0 and (v30 == v30 and v30) then
        v28 = StringUtil.formatCountdownTime(leaderboardData.localStatValue);
    end;

    local v31 = {
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Theme.backgroundPrimary
    };
    local v32 = {};
    local v33 = #v32;
    local v34 = {
        Image = "rbxassetid://7106394844",
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0.125, 0),
        BackgroundColor3 = ColorUtil.hexColor(3092550)
    };
    local v35 = { u2.createElement("UIPadding", {
            PaddingTop = UDim.new(0.2, 0),
            PaddingBottom = UDim.new(0.2, 0),
            PaddingLeft = UDim.new(0.075, 0),
            PaddingRight = UDim.new(0.075, 0)
        }) };
    local v36 = #v35;
    local v37 = {};
    local v38;

    if v25 == nil then
        v38 = v25;
    else
        v38 = v25.displayName;
    end;

    v37.Text = "Leaderboard: " .. tostring(v38);
    v37.Size = UDim2.fromScale(1, 0.5);
    v37.Position = UDim2.fromScale(0, 0);
    v37.AnchorPoint = Vector2.new(0, 0);
    v37.BackgroundTransparency = 1;
    v37.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
    v37.TextScaled = true;
    v37.TextXAlignment = Enum.TextXAlignment.Left;
    v37.TextYAlignment = Enum.TextYAlignment.Top;
    v37.TextColor3 = Color3.fromRGB(255, 255, 255);
    v37.AutoLocalize = false;
    v35[v36 + 1] = u2.createElement("TextLabel", v37);
    local v39 = {};
    local v40;

    if v25 == nil then
        v40 = v25;
    else
        v40 = v25.description;
    end;

    v39.Text = tostring(v40);
    v39.Size = UDim2.fromScale(1, 0.4);
    v39.Position = UDim2.fromScale(0, 1);
    v39.AnchorPoint = Vector2.new(0, 1);
    v39.BackgroundTransparency = 1;
    v39.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
    v39.TextScaled = true;
    v39.TextXAlignment = Enum.TextXAlignment.Left;
    v39.TextYAlignment = Enum.TextYAlignment.Bottom;
    v39.TextColor3 = Theme.textPrimary;
    v35[v36 + 2] = u2.createElement("TextLabel", v39);
    v32[v33 + 1] = u2.createElement("ImageLabel", v34, v35);
    local v41 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.fromScale(0, 1),
        Size = UDim2.new(1, 0, 0.875, -0)
    };
    local v42 = { u2.createElement("UIPadding", {
            PaddingTop = UDim.new(0.02, 0),
            PaddingBottom = UDim.new(0.03, 0),
            PaddingLeft = UDim.new(0.075, 0),
            PaddingRight = UDim.new(0.075, 0)
        }), (u2.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.03, 0)
        })) };
    local createElement = u2.createElement;
    local v43 = {
        LayoutOrder = 1,
        Size = UDim2.fromScale(1, 0.06)
    };
    local v44 = {};
    local v45 = p24.resetsInText and u2.createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        RichText = true,
        TextTransparency = 0.2,
        Text = p24.resetsInText,
        Size = UDim2.new(0.5, 0, 0.75, 0),
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.fromScale(1, 0.5),
        FontFace = Font.new("RobotoMono", Enum.FontWeight.Bold),
        TextXAlignment = Enum.TextXAlignment.Right,
        TextYAlignment = Enum.TextYAlignment.Center,
        TextColor3 = Color3.fromRGB(255, 255, 255)
    });
    v44[1] = v45;
    v42.Header = createElement(Empty, v43, v44);
    local v46;

    if leaderboardData then
        v46 = u2.createElement(LeaderboardList, {
            LeaderboardType = p24.state.leaderboard,
            LeaderboardData = leaderboardData,
            FrameProps = {
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                Size = UDim2.new(1, 0, 0.8200000000000001, 0),
                Position = UDim2.fromScale(0, 0.08)
            }
        });
    else
        v46 = leaderboardData;
    end;

    v42[3] = v46;
    local _ = #v42;
    local v47;

    if leaderboardData == nil then
        v47 = leaderboardData;
    else
        v47 = leaderboardData.leaderboardPosition;
    end;

    local v48 = v47 ~= nil;

    if v48 then
        local v49 = {};
        local v50;

        if leaderboardData == nil then
            v50 = leaderboardData;
        else
            v50 = leaderboardData.leaderboardPosition;
        end;

        local v51;

        if v50 == 0 or (v50 ~= v50 or not v50) then
            v51 = "Not Placed";
        else
            local v52 = tostring(leaderboardData.leaderboardPosition);
            v51 = string.gsub(string.reverse((string.gsub(string.reverse(v52), "%d%d%d", "%1,"))), "^,", "");
        end;

        v49.Text = "<b>YOUR POSITION:</b> <font color=\"rgb(185, 188, 255)\">" .. v51 .. "</font>";
        v49.Size = UDim2.new(1, 0, 0.5, -2);
        v49.BackgroundTransparency = 1;
        v49.Font = Enum.Font.RobotoMono;
        v49.TextScaled = true;
        v49.RichText = true;
        v49.TextXAlignment = Enum.TextXAlignment.Left;
        v49.TextColor3 = Color3.fromRGB(255, 255, 255);
        v49.LayoutOrder = 1;
        v48 = u2.createElement("TextLabel", v49);
    end;

    local v53 = {
        BackgroundTransparency = 1,
        LayoutOrder = 3,
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.fromScale(0, 1),
        Size = UDim2.fromScale(1, 0.07)
    };
    local v54 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 2)
        }) };
    local v55 = #v54;

    if v48 then
        v54[v55 + 1] = v48;
    end;

    local v56 = {
        LayoutOrder = 2,
        Size = UDim2.new(1, 0, 0.5, -2)
    };
    local v57 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10)
        }) };
    local v58 = #v57;
    local v59 = {};
    local v60;

    if v25 == nil then
        v60 = v25;
    else
        v60 = string.upper(v25.statName);
    end;

    v59.Text = "YOUR " .. tostring(v60) .. ":";
    v59.Size = UDim2.new(0, 0, 1, 0);
    v59.AutomaticSize = "X";
    v59.BackgroundTransparency = 1;
    v59.FontFace = Font.new("RobotoMono", Enum.FontWeight.Bold);
    v59.TextScaled = true;
    v59.TextXAlignment = Enum.TextXAlignment.Left;
    v59.TextColor3 = Color3.fromRGB(255, 255, 255);
    v59.LayoutOrder = 1;
    v57[v58 + 1] = u2.createElement("TextLabel", v59);
    local v61;

    if leaderboardData == nil then
        v61 = leaderboardData;
    else
        v61 = leaderboardData.localStatRank;
    end;

    if v61 then
        v61 = u2.createElement(StatRankElement, {
            LayoutOrder = 2,
            StatRank = leaderboardData.localStatRank
        });
    end;

    if v61 then
        v57[v58 + 2] = v61;
    end;

    local v62 = {};
    local v63 = string.gsub(string.reverse((string.gsub(string.reverse(v28), "%d%d%d", "%1,"))), "^,", "");

    if leaderboardData ~= nil then
        leaderboardData = leaderboardData.localStatRank;
    end;

    if leaderboardData then
        leaderboardData = v25;
    end;

    v62.Text = "<font color=\"rgb(185, 188, 255)\">" .. v63 .. " " .. (not leaderboardData and "" or v25.metric) .. "</font>";
    v62.Size = UDim2.new(0, 0, 1, 0);
    v62.AutomaticSize = "X";
    v62.BackgroundTransparency = 1;
    v62.Font = Enum.Font.RobotoMono;
    v62.TextScaled = true;
    v62.RichText = true;
    v62.TextXAlignment = Enum.TextXAlignment.Left;
    v62.TextColor3 = Color3.fromRGB(255, 255, 255);
    v62.LayoutOrder = 3;
    v57[#v57 + 1] = u2.createElement("TextLabel", v62);
    v54[#v54 + 1] = u2.createElement(Empty, v56, v57);
    v42.LeaderboardExtraInfo = u2.createElement("Frame", v53, v54);
    v32[v33 + 2] = u2.createElement("Frame", v41, v42);

    return u2.createElement("Frame", v31, v32);
end;

function u4.willUnmount(p64) -- Line: 377
    p64.resetTimerActive = false;
end;

return {
    SkullLeaderboardUIWrapper = function(p65) -- Line: 381, Name: SkullLeaderboardUIWrapper
        -- upvalues: u2 (copy), u4 (ref)
        local v66 = {
            LightInfluence = 0.25,
            Face = Enum.NormalId.Front,
            SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
        };
        local v67 = {};
        local v68 = {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, -30, 1, -30)
        };
        local v69 = {};
        local v70 = {};

        for i, v in p65 do
            v70[i] = v;
        end;

        v69[#v69 + 1] = u2.createElement(u4, v70);
        v67[#v67 + 1] = u2.createElement("Frame", v68, v69);

        return u2.createElement("SurfaceGui", v66, v67);
    end,

    SkullLeaderboardCore = u4
};