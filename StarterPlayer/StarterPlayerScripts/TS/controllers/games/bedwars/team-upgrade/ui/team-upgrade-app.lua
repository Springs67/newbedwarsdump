local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DarkBackground
local u5 = v3.DeviceUtil
local u6 = v3.Empty
local u7 = v3.EmptyButton
local u8 = v3.SlideIn
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-team-upgrade", "bed-team-upgrade-type").BedTeamUpgrade
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-meta").getSortedTeamUpgrades
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-type").TeamUpgrade
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-util").TeamUpgradeUtil
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u22 = u1.import(script, script.Parent, "bed-team-upgrade-card").BedTeamUpgradeCard
local u23 = u1.import(script, script.Parent, "team-upgrade-card").TeamUpgradeCard
local u24 = u1.import(script, script.Parent, "team-upgrade-currency-count").TeamUpgradeCurrencyCount
local v128 = v12.new(u11)(function(u25, p26) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u16
        [3] = u5
        [4] = u20
        [5] = u14
        [6] = u17
        [7] = u11
        [8] = u15
        [9] = u10
        [10] = u1
        [11] = u2
        [12] = u21
        [13] = u4
        [14] = u6
        [15] = u24
        [16] = u19
        [17] = u23
        [18] = u9
        [19] = u22
        [20] = u7
        [21] = u8
    --]]
    local v27 = p26.useState
    local v28 = p26.useEffect
    local v29 = u25.TeamUpgradesPurchased[u18.DAMAGE]
    local u30, u31 = v27(v29 == nil and 0 or v29)
    local v32 = u25.TeamUpgradesPurchased[u18.ARMOR]
    local u33, u34 = v27(v32 == nil and 0 or v32)
    local v35 = u25.TeamUpgradesPurchased[u18.TEAM_GENERATOR]
    local u36, u37 = v27(v35 == nil and 0 or v35)
    local v38 = u25.TeamUpgradesPurchased[u18.DIAMOND_GENERATOR]
    local u39, u40 = v27(v38 == nil and 0 or v38)
    local v41 = u25.TeamUpgradesPurchased[u18.BREAK_SPEED]
    local u42, u43 = v27(v41 == nil and 0 or v41)
    local u44, u45 = v27(u25.BedTeamUpgradesPurchased[u16.BED_ALARM] == true)
    local u46, u47 = v27(u25.BedTeamUpgradesPurchased[u16.BED_SHIELD] == true)
    local v48 = u25.TeamUpgradesPurchased[u18.SURVIVAL_BED_UPGRADE]
    local u49, u50 = v27(v48 == nil and 0 or v48)
    local v51 = u25.TeamUpgradesPurchased[u18.SURVIVAL_PLUNDER_UPGRADE]
    local u52, u53 = v27(v51 == nil and 0 or v51)
    local u54 = u5.isHoarceKat() and 0 or u20.getGamePlayer(u14.LocalPlayer):getTeamId()
    local v55 = u17()
    if not u25.QueueType then
        return u11.createFragment()
    end
    local v56 = u15(u25.QueueType)
    local v57 = 0
    local v58 = {}
    for v59, v60 in u10.values(u16) do
        local _ = v59 - 1
        local v61
        if v56.disabledBedTeamUpgrades == nil then
            v61 = true
        else
            local v62 = v56.disabledBedTeamUpgrades
            local v63 = table.find(v62, v60) ~= nil
            v61 = not v63
        end
        if v61 == true then
            v57 = v57 + 1
            v58[v57] = v60
        end
    end
    local v64
    if u25.QueueType then
        local v65 = u15(u25.QueueType).disabledFeatures
        if v65 ~= nil then
            v65 = v65.disableBedTeamUpgrades
        end
        v64 = v65 == true
    else
        v64 = false
    end
    local function u67(p66) --[[ Line: 131 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u30
            [3] = u33
            [4] = u36
            [5] = u39
            [6] = u42
            [7] = u49
            [8] = u52
        --]]
        if p66 == u18.DAMAGE then
            return u30
        end
        if p66 == u18.ARMOR then
            return u33
        end
        if p66 == u18.TEAM_GENERATOR then
            return u36
        end
        if p66 == u18.DIAMOND_GENERATOR then
            return u39
        end
        if p66 == u18.BREAK_SPEED then
            return u42
        end
        if p66 == u18.SURVIVAL_BED_UPGRADE then
            return u49
        end
        if p66 == u18.SURVIVAL_PLUNDER_UPGRADE then
            return u52
        end
    end
    local function u70(p68, p69) --[[ Line: 156 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u31
            [3] = u34
            [4] = u37
            [5] = u40
            [6] = u43
            [7] = u50
            [8] = u53
        --]]
        if p68 == u18.DAMAGE then
            u31(p69)
            return
        elseif p68 == u18.ARMOR then
            u34(p69)
            return
        elseif p68 == u18.TEAM_GENERATOR then
            u37(p69)
            return
        elseif p68 == u18.DIAMOND_GENERATOR then
            u40(p69)
            return
        elseif p68 == u18.BREAK_SPEED then
            u43(p69)
            return
        elseif p68 == u18.SURVIVAL_BED_UPGRADE then
            u50(p69)
            return
        elseif p68 == u18.SURVIVAL_PLUNDER_UPGRADE then
            u53(p69)
        end
    end
    local function u73(p71, p72) --[[ Line: 188 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u45
            [3] = u47
        --]]
        if p71 == u16.BED_ALARM then
            u45(p72)
            return
        elseif p71 == u16.BED_SHIELD then
            u47(p72)
        end
    end
    v28(function() --[[ Line: 200 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u14
            [3] = u1
            [4] = u2
            [5] = u21
            [6] = u54
            [7] = u70
            [8] = u73
        --]]
        local u74 = true
        if u5.isHoarceKat() then
            return nil
        end
        local v75 = u14.LocalPlayer
        if v75 ~= nil then
            v75 = v75.Character
        end
        if v75 then
            local u76 = u14.LocalPlayer.Character:GetPivot().Position
            u1.Promise.defer(function() --[[ Line: 212 ]]
                --[[
                Upvalues:
                    [1] = u74
                    [2] = u14
                    [3] = u76
                    [4] = u2
                --]]
                while true do
                    local v77 = task.wait(0.2)
                    if v77 ~= 0 and (v77 == v77 and v77) then
                        v77 = u74
                    end
                    if v77 == 0 or (v77 ~= v77 or not v77) then
                        return
                    end
                    local v78 = u14.LocalPlayer.Character
                    if v78 ~= nil then
                        v78 = v78:GetPivot().Position
                    end
                    if v78 == nil then
                        v78 = Vector3.new()
                    end
                    if (v78 - u76).Magnitude > 6 then
                        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("TeamUpgradeApp")
                    end
                end
            end)
        end
        local u83 = u21.Client:Get("TeamUpgradePurchased"):Connect(function(p79, p80) --[[ Line: 237 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u70
            --]]
            if u54 == p79 then
                for v81, v82 in p80 do
                    u70(v81, v82)
                end
            end
        end)
        local u88 = u21.Client:Get("BedTeamUpgradeChanged"):Connect(function(p84, p85) --[[ Line: 249 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u73
            --]]
            if u54 == p84 then
                for v86, v87 in p85 do
                    u73(v86, v87)
                end
            end
        end)
        return function() --[[ Line: 260 ]]
            --[[
            Upvalues:
                [1] = u83
                [2] = u88
                [3] = u74
            --]]
            u83:Disconnect()
            u88:Disconnect()
            u74 = false
        end
    end, {})
    local v89 = {
        ["DisplayOrder"] = 20
    }
    local v90 = { u11.createElement(u4, {
            ["AppId"] = "TeamUpgradeApp"
        }) }
    local v91 = #v90
    local v92 = {}
    local _ = #v92
    local v93 = {
        ["Modal"] = true
    }
    local v94 = UDim2.fromScale
    local v95 = u5.isSmallScreen() and 0.9 or 0.75
    u5.isSmallScreen()
    local v96 = 0.75
    v93.Size = v94(v95, v96)
    v93.Position = UDim2.fromScale(0.5, u5.isSmallScreen() and 0.03 or 0.05)
    v93.AnchorPoint = Vector2.new(0.5, 0)
    local v97 = {
        ["CurrencyWrapper"] = u11.createElement(u6, {
            ["Size"] = UDim2.fromScale(0.33, 0.08),
            ["Position"] = UDim2.fromScale(0, 0),
            ["AnchorPoint"] = Vector2.new(0, 0)
        }, { u11.createElement(u24, {
                ["ObservedInventory"] = u25.ObservedInventory,
                ["Currency"] = u19.TEAM_UPGRADE_RESOURCE,
                ["IsHomeBase"] = u25.IsHomeBase,
                ["FrameProps"] = {
                    ["Size"] = UDim2.fromScale(1, 1)
                },
                ["ListProps"] = {
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left
                }
            }) })
    }
    local _ = #v97
    local v98 = {
        ["Size"] = UDim2.fromScale(1, 0.925),
        ["Position"] = UDim2.fromScale(0, 0.1)
    }
    local v99 = { u11.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.015, 0)
        }) }
    local _ = #v99
    local function v103(p100, p101) --[[ Line: 317 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u23
            [3] = u10
            [4] = u18
            [5] = u25
            [6] = u67
            [7] = u9
        --]]
        return u11.createElement(u23, {
            ["FrameProps"] = {
                ["Size"] = UDim2.new(1 / #u10.values(u18) - (#u10.values(u18) - 1) * 0.015 / #u10.values(u18), 0, 1, 0),
                ["LayoutOrder"] = p101
            },
            ["ObservedInventory"] = u25.ObservedInventory,
            ["TeamUpgrade"] = p100,
            ["CurrentTier"] = u67(p100),
            ["Selected"] = function(p102) --[[ Name: Selected, Line 326 ]]
                --[[
                Upvalues:
                    [1] = u9
                --]]
                u9.Controllers.TeamUpgradeController:requestPurchaseTeamUpgrade(p102)
            end,
            ["IsHomeBase"] = u25.IsHomeBase,
            ["GamepadShouldAutoSelect"] = p101 == 0
        })
    end
    local v104 = table.create(#v55)
    for v105, v106 in v55 do
        v104[v105] = v103(v106, v105 - 1, v55)
    end
    local v107 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.79),
        ["AnchorPoint"] = Vector2.new(0.5, 0)
    }
    local v108 = { u11.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Center",
            ["HorizontalFlex"] = "Fill",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.015, 0)
        }) }
    local v109 = #v108
    for v110, v111 in v104 do
        v108[v109 + v110] = v111
    end
    v99.TieredUpgradesWrapper = u11.createElement("Frame", v107, v108)
    local v112 = not v64
    if v112 then
        local function v120(p113, p114) --[[ Line: 363 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u22
                [3] = u10
                [4] = u16
                [5] = u25
                [6] = u44
                [7] = u46
                [8] = u9
            --]]
            local v115 = u11.createElement
            local v116 = u22
            local v117 = {
                ["FrameProps"] = {
                    ["Size"] = UDim2.new(1 / (#u10.values(u16) + 1), 0, 1, 0),
                    ["LayoutOrder"] = p114
                },
                ["ObservedInventory"] = u25.ObservedInventory,
                ["BedTeamUpgrade"] = p113
            }
            local v118
            if p113 == u16.BED_ALARM then
                v118 = u44
            elseif p113 == u16.BED_SHIELD then
                v118 = u46
            else
                v118 = nil
            end
            v117.Purchased = v118 == true
            function v117.AttemptPurchase(p119) --[[ Line: 372 ]]
                --[[
                Upvalues:
                    [1] = u9
                --]]
                u9.Controllers.BedTeamUpgradeController:requestPurchaseBedTeamUpgrade(p119)
            end
            v117.IsHomeBase = u25.IsHomeBase
            v117.BedStatus = u25.BedStatus
            return v115(v116, v117)
        end
        v112 = table.create(#v58)
        for v121, v122 in v58 do
            v112[v121] = v120(v122, v121 - 1, v58)
        end
    end
    local v123 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(0.8, 0.21),
        ["AnchorPoint"] = Vector2.new(0.5, 0)
    }
    local v124 = { u11.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["HorizontalFlex"] = "Fill",
            ["Padding"] = UDim.new(0.015, 0)
        }) }
    local v125 = #v124
    if v112 then
        for v126, v127 in v112 do
            v124[v125 + v126] = v127
        end
    end
    v99.BedUpgradesWrapper = u11.createElement("Frame", v123, v124)
    v97.UpgradesContainer = u11.createElement(u6, v98, v99)
    v92.TeamUpgradeAppContainer = u11.createElement(u7, v93, v97)
    v90[v91 + 1] = u11.createElement(u8, {}, v92)
    return u11.createFragment({
        ["TeamUpgradeApp"] = u11.createElement("ScreenGui", v89, v90)
    })
end)
return {
    ["TeamUpgradeApp"] = v13.connect(function(p129, p130) --[[ Line: 419 ]]
        local v131 = {}
        for v132, v133 in p130 do
            v131[v132] = v133
        end
        v131.TeamUpgradesPurchased = p129.Bedwars.myTeamUpgrades
        v131.BedTeamUpgradesPurchased = p129.Bedwars.myBedTeamUpgrades
        v131.QueueType = p129.Game.queueType
        v131.ObservedInventory = p129.Inventory.observedInventory
        v131.BedStatus = p129.Bedwars.teamBedStatus[p130.TeamId]
        return v131
    end)(v128)
}