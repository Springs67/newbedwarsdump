-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local StringUtil = v1.StringUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClanUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil;
local mcYellow = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme.mcYellow;

return {
    ClanProfileGeneralDailyContribution = v3.new(u2)(function(u4, p5) -- Line: 13
        -- upvalues: ClanUtil (copy), Players (copy), StringUtil (copy), u2 (copy), ColorUtil (copy), mcYellow (copy), Empty (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local v6, u7 = useState(0);
        local v8, u9 = useState(0);
        local v10, u11 = useState(0);
        useEffect(function() -- Line: 19
            -- upvalues: u4 (copy), ClanUtil (ref), Players (ref), u7 (copy)
            if u4.DailyMemberContributions then
                local v12 = u4.DailyMemberContributions[ClanUtil.getContributionDayId()];

                if v12 ~= nil then
                    v12 = v12[tostring(Players.LocalPlayer.UserId)];
                end;

                if v12 ~= 0 and (v12 == v12 and v12) then
                    u7(v12);
                end;
            end;
        end, {});
        useEffect(function() -- Line: 35
            -- upvalues: u4 (copy), ClanUtil (ref), u9 (copy)
            local v13 = u4.DailyMemberContributions and u4.DailyMemberContributions[ClanUtil.getContributionDayId()];

            if v13 then
                local u14 = 0;

                local function _(p15) -- Line: 42
                    -- upvalues: u14 (ref)
                    u14 = u14 + p15;
                end;

                for _, v in v13 do
                    u14 = u14 + v;
                end;

                u9(u14);
            end;
        end, { u4.DailyMemberContributions });
        useEffect(function() -- Line: 52
            -- upvalues: u4 (copy), ClanUtil (ref), u11 (copy)
            local v16 = u4.DailyClanContribution and u4.DailyClanContribution[ClanUtil.getContributionDayId()];

            if v16 then
                u11(v16.gainedCoins);
            end;
        end, { u4.DailyClanContribution });
        local MemberCount = u4.MemberCount;
        local v17 = MemberCount == nil and 1 or MemberCount;
        local v18 = ClanUtil.calcClanMaxDailyCoins(v17);
        local v19 = StringUtil.formatNumberWithCommas((math.floor(v6)));
        local v20 = StringUtil.formatNumberWithCommas(ClanUtil.MAX_DAILY_CONTRIBUTION);
        local v21 = StringUtil.formatNumberWithCommas((math.floor(v8)));
        local v22 = StringUtil.formatNumberWithCommas(v17 * 1000);
        local v23 = StringUtil.formatNumberWithCommas((math.floor(v10)));
        local v24 = StringUtil.formatNumberWithCommas((math.floor(v18)));
        local v25 = {
            LayoutOrder = 4,
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.fromScale(0, 1),
            Size = UDim2.fromScale(1, 0.175)
        };
        local v26 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                VerticalAlignment = "Bottom",
                Padding = UDim.new(0.03, 0)
            }), u2.createElement("TextLabel", {
                Font = "Roboto",
                Text = "Play matches to earn coins for your clan.\nYou\'ll earn coins at 10% the rate after reaching your daily contribution limit or the clan\'s daily total limit.",
                TextXAlignment = "Left",
                TextScaled = true,
                RichText = true,
                TextTransparency = 0.3,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0.3),
                TextColor3 = ColorUtil.WHITE
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 16
                }) }) };
        local v27 = {
            Size = UDim2.fromScale(1, 0.67)
        };
        local v28 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                VerticalAlignment = "Bottom",
                Padding = UDim.new(0.03, 0)
            }), u2.createElement("TextLabel", {
                Font = "Roboto",
                TextXAlignment = "Left",
                TextScaled = true,
                RichText = true,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0.3),
                TextColor3 = ColorUtil.WHITE,
                Text = "<b>Your Daily Contribution:</b> <font color=\"" .. ColorUtil.richTextColor(mcYellow) .. "\">" .. v19 .. " / " .. v20 .. " (" .. StringUtil.formatPercentage(v6, ClanUtil.MAX_DAILY_CONTRIBUTION) .. ")</font>"
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 16
                }) }) };
        local v29 = #v28;
        local v30;

        if u4.MemberCount == nil then
            v30 = false;
        else
            v30 = u2.createElement("TextLabel", {
                Font = "Roboto",
                TextXAlignment = "Left",
                TextScaled = true,
                RichText = true,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0.3),
                TextColor3 = ColorUtil.WHITE,
                Text = "<b>Clan\'s Daily Total Contribution:</b> <font color=\"" .. ColorUtil.richTextColor(mcYellow) .. "\">" .. v21 .. " / " .. v22 .. " (" .. StringUtil.formatPercentage(v8, v17 * 1000) .. ")</font>"
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 16
                }) });
        end;

        if v30 then
            v28[v29 + 1] = v30;
        end;

        local v31 = #v28;
        local v32;

        if u4.MemberCount == nil then
            v32 = false;
        else
            v32 = u2.createElement("TextLabel", {
                Font = "Roboto",
                TextXAlignment = "Left",
                TextScaled = true,
                RichText = true,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0.3),
                TextColor3 = ColorUtil.WHITE,
                Text = "<b>Clan\'s Daily Total Coins:</b> <font color=\"" .. ColorUtil.richTextColor(mcYellow) .. "\">" .. v23 .. " / " .. v24 .. " (" .. StringUtil.formatPercentage(v10, v18) .. ")</font>"
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 16
                }) });
        end;

        if v32 then
            v28[v31 + 1] = v32;
        end;

        v26[#v26 + 1] = u2.createElement(Empty, v27, v28);

        return u2.createFragment({
            YourContribution = u2.createElement(Empty, v25, v26)
        });
    end)
};