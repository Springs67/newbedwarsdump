local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-meta")
local u14 = v13.ClanUpgradeMeta
local u15 = v13.ClanUpgradeTypeMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-type").ClanUpgradeType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = v1.import(script, script.Parent.Parent, "clan-profile-page-layout").ClanProfilePageLayout
local u20 = v1.import(script, script.Parent.Parent, "war-tab", "pill-counter").PillCounter
local u21 = v1.import(script, script.Parent, "clan-profile-upgrade-card").ClanProfileUpgradeCard
local u22 = v1.import(script, script.Parent, "clan-profile-upgrade-details").ClanProfileUpgradeDetails
return {
    ["ClanProfileUpgradesTab"] = v10.new(u9)(function(u23, p24) --[[ Line: 24 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u12
            [3] = u11
            [4] = u15
            [5] = u14
            [6] = u7
            [7] = u6
            [8] = u18
            [9] = u9
            [10] = u20
            [11] = u17
            [12] = u5
            [13] = u8
            [14] = u16
            [15] = u21
            [16] = u3
            [17] = u22
            [18] = u19
        --]]
        local v25 = p24.useState
        local v26, u27 = v25(false)
        local u28, u29 = v25(nil)
        local u30
        if u23.store.Clans.myClanMember and not u4.isHoarceKat() then
            u30 = u12.hasClanRank(u23.store.Clans.myClanMember, u11.ADMIN)
        else
            u30 = false
        end
        local function v34() --[[ Line: 32 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u30
                [3] = u15
                [4] = u14
                [5] = u27
                [6] = u7
                [7] = u23
                [8] = u6
                [9] = u18
                [10] = u29
            --]]
            if u28 and u30 then
                local v31 = u15[u14[u28].type]
                if v31.disabled or v31.tempDisabled then
                    return nil
                end
                u27(true)
                local u32 = u14[u28]
                u7.Controllers.ClanController:upgrade(u32.type, u23.store.Clans.myClanId):andThen(function(p33) --[[ Line: 42 ]]
                    --[[
                    Upvalues:
                        [1] = u27
                        [2] = u32
                        [3] = u6
                        [4] = u18
                        [5] = u29
                    --]]
                    u27(false)
                    if p33 and u32.nextUpgrade then
                        u6:playSound(u18.BEDWARS_UPGRADE_SUCCESS)
                        u29(u32.nextUpgrade)
                    end
                end)
            end
        end
        local v35 = {
            ["Title"] = "AVAILABLE UPGRADES",
            ["PaddingBottom"] = true
        }
        local v36 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v37 = { u9.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Right",
                ["Padding"] = UDim.new(0.05, 0)
            }), u9.createElement(u20, {
                ["Tooltip"] = "Clan Coins",
                ["Icon"] = u17.COIN,
                ["Amount"] = u23.Clan.coins,
                ["FrameProps"] = {
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.new(0.42, 0, 1, 0)
                }
            }) }
        local v38 = #v37
        local v39 = {
            ["Icon"] = u17.CLAN_CRYSTAL
        }
        local v40 = u23.Clan.clanWarCoins
        v39.Amount = v40 == nil and 0 or v40
        v39.Tooltip = "Clan War Crystals"
        v39.FrameProps = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(0.42, 0, 1, 0)
        }
        v37[v38 + 1] = u9.createElement(u20, v39)
        v35.RightTitleElement = u9.createElement(u5, v36, v37)
        local v41 = { u9.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local v42 = #v41
        local v43 = u8.values(u16)
        table.sort(v43)
        local function v47(p44) --[[ Line: 104 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u23
                [3] = u14
                [4] = u9
                [5] = u21
                [6] = u28
                [7] = u29
            --]]
            if u15[p44].disabled then
                return nil
            end
            local v45 = u23.store.Clans.myClan.upgrades[p44]
            local v46
            if v45 then
                v46 = u14[v45].nextUpgrade or v45
            else
                v46 = u15[p44].firstUpgrade
            end
            return u9.createElement(u21, {
                ["UpgradeType"] = p44,
                ["UpgradeTier"] = v46,
                ["SelectedUpgrade"] = u28,
                ["OnClick"] = u29,
                ["store"] = u23.store
            })
        end
        local v48 = 0
        local v49 = {}
        for v50, v51 in v43 do
            local v52 = v47(v51, v50 - 1, v43)
            if v52 ~= nil then
                v48 = v48 + 1
                v49[v48] = v52
            end
        end
        local v53 = {
            ["ScrollingFrameProps"] = {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(0.35, 0, 1, 0)
            }
        }
        local v54 = { u9.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Top",
                ["Padding"] = UDim.new(0, 6)
            }) }
        local v55 = #v54
        for v56, v57 in v49 do
            v54[v55 + v56] = v57
        end
        v41.UpgradesList = u9.createElement(u3, v53, v54)
        v41[v42 + 1] = u9.createElement(u22, {
            ["SelectedUpgrade"] = u28,
            ["Clan"] = u23.Clan,
            ["OnUpgrade"] = v34,
            ["NoUpgradePermission"] = not u30,
            ["Loading"] = v26
        })
        return u9.createElement(u19, v35, v41)
    end)
}