local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u6 = v1.import(script, script.Parent, "clan-profile-general-daily-contribution").ClanProfileGeneralDailyContribution
local u7 = v1.import(script, script.Parent, "clan-profile-general-header").ClanProfileGeneralHeader
local u8 = v1.import(script, script.Parent, "clan-profile-general-kit-unlocks").ClanProfileGeneralKitUnlocks
local u9 = v1.import(script, script.Parent, "clan-profile-general-textbox").ClanProfileGeneralTextBox
return {
    ["ClanProfileGeneralTab"] = v4.new(u3)(function(p10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u7
            [3] = u5
            [4] = u9
            [5] = u8
            [6] = u2
            [7] = u6
        --]]
        local _ = p11.useState
        local v12 = p10.store.Clans.myClan
        if v12 ~= nil then
            v12 = 0
            for _ in v12.kitShop.unlocks do
                v12 = v12 + 1
            end
        end
        local v13 = (v12 == nil and 0 or v12) > 0
        local v14 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v15 = { u3.createElement("UIPadding", {
                ["PaddingBottom"] = UDim.new(0, 15)
            }) }
        local v16 = #v15
        local v17 = {
            ["Size"] = UDim2.fromScale(1, 0.85)
        }
        local v18 = { u3.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder"
            }), u3.createElement(u7, {
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(1, 0, 0, 150),
                ["BackgroundColor3"] = u5.backgroundTertiary,
                ["Clan"] = p10.Clan,
                ["GuestView"] = p10.GuestView
            }) }
        local v19 = #v18
        local v20 = p10.GuestView
        if v20 then
            v20 = u3.createElement(u9, {
                ["Title"] = "Introduction",
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 2,
                ["Text"] = p10.Clan.introduction,
                ["Size"] = UDim2.fromScale(1, 0.3),
                ["BackgroundColor3"] = u5.backgroundPrimary
            })
        end
        if v20 then
            v18[v19 + 1] = v20
        end
        local v21 = #v18
        local v22 = not p10.GuestView
        if v22 then
            local v23 = p10.store.Clans.myClan
            if v23 ~= nil then
                v23 = v23.announcement
            end
            v22 = v23 ~= nil
            if v22 then
                local v24 = {
                    ["Title"] = "Announcement",
                    ["Text"] = p10.store.Clans.myClan.announcement
                }
                local v25 = p10.store.Clans.myClan
                if v25 ~= nil then
                    v25 = 0
                    for _ in v25.kitShop.unlocks do
                        v25 = v25 + 1
                    end
                end
                v24.BorderBottom = v25 > 0
                v24.Size = UDim2.fromScale(1, 0.3)
                v24.BackgroundColor3 = u5.backgroundPrimary
                v24.BorderSizePixel = 0
                v24.LayoutOrder = 2
                v22 = u3.createElement(u9, v24)
            end
        end
        if v22 then
            v18[v21 + 1] = v22
        end
        local v26 = #v18
        local v27 = not p10.GuestView
        if v27 then
            if v13 then
                v13 = u3.createElement(u8, {
                    ["BorderSizePixel"] = 0,
                    ["LayoutOrder"] = 4,
                    ["Size"] = UDim2.fromScale(1, 0.3),
                    ["BackgroundColor3"] = u5.backgroundPrimary,
                    ["KitShopUnlocks"] = p10.store.Clans.myClan.kitShop.unlocks
                })
            end
        else
            v13 = v27
        end
        if v13 then
            v18[v26 + 1] = v13
        end
        v15[v16 + 1] = u3.createElement(u2, v17, v18)
        local v28 = not p10.GuestView
        if v28 then
            v28 = p10.store.Clans.myClanMember
        end
        if v28 then
            local v29 = {}
            local v30 = p10.store.Clans.myClan
            if v30 ~= nil then
                v30 = 0
                for _ in v30.members do
                    v30 = v30 + 1
                end
            end
            v29.MemberCount = v30
            local v31 = p10.store.Clans.myClan
            if v31 ~= nil then
                v31 = v31.clanContribution.dailyMemberContributions
            end
            v29.DailyMemberContributions = v31
            local v32 = p10.store.Clans.myClan
            if v32 ~= nil then
                v32 = v32.clanContribution.dailyClanContribution
            end
            v29.DailyClanContribution = v32
            v28 = u3.createElement(u6, v29)
        end
        if v28 then
            v15[v16 + 2] = v28
        end
        return u3.createElement(u2, v14, v15)
    end)
}