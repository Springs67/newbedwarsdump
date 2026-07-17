-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ClanProfileGeneralDailyContribution = RuntimeLib.import(script, script.Parent, "clan-profile-general-daily-contribution").ClanProfileGeneralDailyContribution;
local ClanProfileGeneralHeader = RuntimeLib.import(script, script.Parent, "clan-profile-general-header").ClanProfileGeneralHeader;
local ClanProfileGeneralKitUnlocks = RuntimeLib.import(script, script.Parent, "clan-profile-general-kit-unlocks").ClanProfileGeneralKitUnlocks;
local ClanProfileGeneralTextBox = RuntimeLib.import(script, script.Parent, "clan-profile-general-textbox").ClanProfileGeneralTextBox;

return {
    ClanProfileGeneralTab = v2.new(u1)(function(p3, p4) -- Line: 11
        -- upvalues: u1 (copy), ClanProfileGeneralHeader (copy), Theme (copy), ClanProfileGeneralTextBox (copy), ClanProfileGeneralKitUnlocks (copy), Empty (copy), ClanProfileGeneralDailyContribution (copy)
        local _ = p4.useState;
        local myClan = p3.store.Clans.myClan;

        if myClan ~= nil then
            myClan = 0;

            for _ in myClan.kitShop.unlocks do
                myClan = myClan + 1;
            end;
        end;

        local v5 = (myClan == nil and 0 or myClan) > 0;
        local v6 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v7 = { u1.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 15)
            }) };
        local v8 = #v7;
        local v9 = {
            Size = UDim2.fromScale(1, 0.85)
        };
        local v10 = { u1.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder"
            }), u1.createElement(ClanProfileGeneralHeader, {
                BorderSizePixel = 0,
                LayoutOrder = 1,
                Size = UDim2.new(1, 0, 0, 150),
                BackgroundColor3 = Theme.backgroundTertiary,
                Clan = p3.Clan,
                GuestView = p3.GuestView
            }) };
        local v11 = #v10;
        local v12 = p3.GuestView and u1.createElement(ClanProfileGeneralTextBox, {
            Title = "Introduction",
            BorderSizePixel = 0,
            LayoutOrder = 2,
            Text = p3.Clan.introduction,
            Size = UDim2.fromScale(1, 0.3),
            BackgroundColor3 = Theme.backgroundPrimary
        });

        if v12 then
            v10[v11 + 1] = v12;
        end;

        local v13 = #v10;
        local v14 = not p3.GuestView;

        if v14 then
            local myClan2 = p3.store.Clans.myClan;

            if myClan2 ~= nil then
                myClan2 = myClan2.announcement;
            end;

            v14 = myClan2 ~= nil;

            if v14 then
                local v15 = {
                    Title = "Announcement",
                    Text = p3.store.Clans.myClan.announcement
                };
                local myClan3 = p3.store.Clans.myClan;

                if myClan3 ~= nil then
                    myClan3 = 0;

                    for _ in myClan3.kitShop.unlocks do
                        myClan3 = myClan3 + 1;
                    end;
                end;

                v15.BorderBottom = myClan3 > 0;
                v15.Size = UDim2.fromScale(1, 0.3);
                v15.BackgroundColor3 = Theme.backgroundPrimary;
                v15.BorderSizePixel = 0;
                v15.LayoutOrder = 2;
                v14 = u1.createElement(ClanProfileGeneralTextBox, v15);
            end;
        end;

        if v14 then
            v10[v13 + 1] = v14;
        end;

        local v16 = #v10;
        local v17 = not p3.GuestView;

        if v17 then
            if v5 then
                v5 = u1.createElement(ClanProfileGeneralKitUnlocks, {
                    BorderSizePixel = 0,
                    LayoutOrder = 4,
                    Size = UDim2.fromScale(1, 0.3),
                    BackgroundColor3 = Theme.backgroundPrimary,
                    KitShopUnlocks = p3.store.Clans.myClan.kitShop.unlocks
                });
            end;
        else
            v5 = v17;
        end;

        if v5 then
            v10[v16 + 1] = v5;
        end;

        v7[v8 + 1] = u1.createElement(Empty, v9, v10);
        local v18 = not p3.GuestView and p3.store.Clans.myClanMember;

        if v18 then
            local v19 = {};
            local myClan2 = p3.store.Clans.myClan;

            if myClan2 ~= nil then
                myClan2 = 0;

                for _ in myClan2.members do
                    myClan2 = myClan2 + 1;
                end;
            end;

            v19.MemberCount = myClan2;
            local myClan3 = p3.store.Clans.myClan;

            if myClan3 ~= nil then
                myClan3 = myClan3.clanContribution.dailyMemberContributions;
            end;

            v19.DailyMemberContributions = myClan3;
            local myClan4 = p3.store.Clans.myClan;

            if myClan4 ~= nil then
                myClan4 = myClan4.clanContribution.dailyClanContribution;
            end;

            v19.DailyClanContribution = myClan4;
            v18 = u1.createElement(ClanProfileGeneralDailyContribution, v19);
        end;

        if v18 then
            v7[v8 + 2] = v18;
        end;

        return u1.createElement(Empty, v6, v7);
    end)
};