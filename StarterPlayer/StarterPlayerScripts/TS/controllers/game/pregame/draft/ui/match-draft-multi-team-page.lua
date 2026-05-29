local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ButtonComponent
local u5 = v3.ColorUtil
local u6 = v3.DeviceUtil
local u7 = v3.Empty
local u8 = v3.Padding
local u9 = v3.SoundManager
local u10 = v3.TimedProgressBar
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutCubic
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u18 = v17.Players
local u19 = v17.TweenService
local u20 = v17.Workspace
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u22 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "kit-shop", "ui", "lobby-kit-shop", "kit-shop-item-list").KitShopItemList
local u23 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "circle-countdown").CircleCountdown
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "draft", "match-draft-config").MatchDraftConfig
local v25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta")
local u26 = v25.BedwarsKitMeta
local u27 = v25.getBedwarsKitMeta
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "draft", "match-draft-phase").MatchDraftPhase
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "draft", "match-draft-selector-options").MatchDraftSelectorOption
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u34 = v1.import(script, script.Parent, "match-draft-ban-icon").MatchDraftBanIcon
local u35 = v1.import(script, script.Parent, "match-draft-player-row").MatchDraftPlayerRow
local u36 = v1.import(script, script.Parent, "match-draft-team-card-row").MatchDraftTeamCardRow
local u37 = nil
local function v302(u38, p39) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u20
        [3] = u29
        [4] = u13
        [5] = u19
        [6] = u14
        [7] = u28
        [8] = u11
        [9] = u24
        [10] = u6
        [11] = u18
        [12] = u30
        [13] = u9
        [14] = u32
        [15] = u21
        [16] = u12
        [17] = u31
        [18] = u2
        [19] = u33
        [20] = u26
        [21] = u27
        [22] = u7
        [23] = u10
        [24] = u23
        [25] = u5
        [26] = u35
        [27] = u36
        [28] = u22
        [29] = u4
        [30] = u8
        [31] = u37
        [32] = u34
    --]]
    local v40 = p39.useEffect
    local v41 = p39.useState
    local _ = p39.useValue
    local v42 = p39.useMemo
    local u43 = u38.store.Game.myTeam
    if not u43 then
        return u15.createFragment()
    end
    local u44, u45 = v41(nil)
    local u46, u47 = v41({})
    local u48, u49 = v41({})
    local v50, u51 = v41({})
    local v52, u53 = v41("LOADING")
    local u54, u55 = v41(u20:GetServerTimeNow())
    local u56 = u15.createRef()
    local u57 = u15.createRef()
    local u58 = {}
    local function v94() --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u57
            [2] = u38
            [3] = u29
            [4] = u13
            [5] = u19
            [6] = u58
            [7] = u43
            [8] = u14
            [9] = u28
            [10] = u11
            [11] = u24
            [12] = u51
        --]]
        local v59 = u57:getValue()
        if not v59 then
            return nil
        end
        local v60 = u38.store.Draft.sharedData
        if v60 ~= nil then
            v60 = v60.matchDraftPhase
        end
        local v61 = v60 == u29.BANNING_TRANSITION
        local u62 = u13.new()
        local u63 = u19:Create(v59, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            ["Position"] = UDim2.fromScale(0.5, v61 and 1.2 or 0)
        })
        u63:Play()
        u62:GiveTask(function() --[[ Line: 72 ]]
            --[[
            Upvalues:
                [1] = u63
            --]]
            u63:Cancel()
            u63:Destroy()
        end)
        if v61 then
            local v64 = 0
            for _, v65 in u58 do
                local u66 = v65.kit
                local v67 = v65.imageLabelRef
                local v68 = v65.containerRef
                local u69 = v67:getValue()
                local u70 = v68:getValue()
                if u69 and u70 then
                    local u71 = 1 / #u58
                    local u72 = v64 * u71
                    task.delay(u72, function() --[[ Line: 92 ]]
                        --[[
                        Upvalues:
                            [1] = u19
                            [2] = u69
                            [3] = u71
                            [4] = u62
                            [5] = u38
                            [6] = u43
                            [7] = u66
                            [8] = u72
                            [9] = u14
                            [10] = u28
                            [11] = u70
                        --]]
                        local u73 = u19:Create(u69, TweenInfo.new(u71), {
                            ["ImageTransparency"] = 0,
                            ["BackgroundTransparency"] = 0.3,
                            ["Position"] = UDim2.fromScale(0.5, 0)
                        })
                        u73:Play()
                        u62:GiveTask(function() --[[ Line: 99 ]]
                            --[[
                            Upvalues:
                                [1] = u73
                            --]]
                            u73:Cancel()
                            u73:Destroy()
                        end)
                        local v74 = u38.store.Draft.sharedData
                        if v74 ~= nil then
                            v74 = v74.kitBans[u43.id]
                            if v74 ~= nil then
                                v74 = table.find(v74, u66) ~= nil
                            end
                        end
                        if v74 then
                            local u75 = u14("ImageLabel", {
                                ["BorderSizePixel"] = 0,
                                ["ImageTransparency"] = 1,
                                ["BackgroundTransparency"] = 1,
                                ["Parent"] = u69,
                                ["Image"] = u28.BLOCK_ICON,
                                ["ScaleType"] = Enum.ScaleType.Crop,
                                ["Size"] = UDim2.fromScale(2, 2),
                                ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                                ["AnchorPoint"] = Vector2.new(1, 1),
                                ["Position"] = UDim2.fromScale(1, 1)
                            })
                            u62:GiveTask(task.delay(1 - u72 + 1, function() --[[ Line: 138 ]]
                                --[[
                                Upvalues:
                                    [1] = u19
                                    [2] = u69
                                    [3] = u62
                                    [4] = u70
                                    [5] = u75
                                --]]
                                local u76 = u19:Create(u69, TweenInfo.new(1), {
                                    ["BackgroundColor3"] = Color3.fromRGB(159, 49, 49)
                                })
                                u76:Play()
                                u62:GiveTask(function() --[[ Line: 143 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u76
                                    --]]
                                    u76:Cancel()
                                    u76:Destroy()
                                end)
                                local u77 = u19:Create(u70, TweenInfo.new(1), {
                                    ["Position"] = UDim2.fromScale(0, 0)
                                })
                                u77:Play()
                                u62:GiveTask(function() --[[ Line: 151 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u77
                                    --]]
                                    u77:Cancel()
                                    u77:Destroy()
                                end)
                                local u78 = u19:Create(u75, TweenInfo.new(0.5), {
                                    ["ImageTransparency"] = 0,
                                    ["Size"] = UDim2.fromScale(0.5, 0.5)
                                })
                                u78:Play()
                                u62:GiveTask(function() --[[ Line: 160 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u78
                                    --]]
                                    u78:Cancel()
                                    u78:Destroy()
                                end)
                            end))
                            u62:GiveTask(task.delay(1 - u72 + 3, function() --[[ Line: 165 ]]
                                --[[
                                Upvalues:
                                    [1] = u19
                                    [2] = u69
                                    [3] = u62
                                    [4] = u75
                                --]]
                                local u79 = u19:Create(u69, TweenInfo.new(1), {
                                    ["ImageTransparency"] = 1,
                                    ["BackgroundTransparency"] = 1,
                                    ["Position"] = UDim2.fromScale(0.5, -0.5)
                                })
                                u79:Play()
                                u62:GiveTask(function() --[[ Line: 172 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u79
                                    --]]
                                    u79:Cancel()
                                    u79:Destroy()
                                end)
                                local u80 = u19:Create(u75, TweenInfo.new(1), {
                                    ["ImageTransparency"] = 1
                                })
                                u80:Play()
                                u62:GiveTask(function() --[[ Line: 180 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u80
                                    --]]
                                    u80:Cancel()
                                    u80:Destroy()
                                end)
                            end))
                        else
                            u62:GiveTask(task.delay(1 - u72 + 1, function() --[[ Line: 113 ]]
                                --[[
                                Upvalues:
                                    [1] = u19
                                    [2] = u69
                                    [3] = u71
                                    [4] = u62
                                --]]
                                local u81 = u19:Create(u69, TweenInfo.new(u71), {
                                    ["ImageTransparency"] = 1,
                                    ["BackgroundTransparency"] = 1,
                                    ["Position"] = UDim2.fromScale(0.5, 0.5)
                                })
                                u81:Play()
                                u62:GiveTask(function() --[[ Line: 120 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u81
                                    --]]
                                    u81:Cancel()
                                    u81:Destroy()
                                end)
                            end))
                        end
                    end)
                    v64 = v64 + 1
                end
            end
            local u82 = {}
            local v83 = { u43.id }
            local v84 = #v83
            local v85 = u11.keys(u38.store.Draft.enemyTeamData)
            table.move(v85, 1, #v85, v84 + 1, v83)
            local function v91(p86) --[[ Line: 195 ]]
                --[[
                Upvalues:
                    [1] = u38
                    [2] = u82
                --]]
                local v87 = u38.store.Draft.sharedData
                if v87 ~= nil then
                    v87 = v87.kitBans[p86] ~= nil
                end
                local v88
                if v87 then
                    v88 = {}
                    local v89 = #v88
                    local v90 = u38.store.Draft.sharedData.kitBans[p86]
                    table.move(v90, 1, #v90, v89 + 1, v88)
                else
                    v88 = {}
                end
                u82[p86] = v88
            end
            for v92, v93 in v83 do
                v91(v93, v92 - 1, v83)
            end
            u62:GiveTask(task.delay(u24.BANNING_TRANSITION_TIME_SECONDS - 1, function() --[[ Line: 221 ]]
                --[[
                Upvalues:
                    [1] = u51
                    [2] = u82
                --]]
                u51(u82)
            end))
        end
        return function() --[[ Line: 225 ]]
            --[[
            Upvalues:
                [1] = u62
            --]]
            u62:Destroy()
        end
    end
    local v95 = u38.store.Draft.sharedData
    if v95 ~= nil then
        v95 = v95.matchDraftPhase
    end
    v40(v94, { v95 })
    v40(function() --[[ Line: 234 ]]
        --[[
        Upvalues:
            [1] = u46
            [2] = u11
            [3] = u38
            [4] = u47
            [5] = u6
            [6] = u18
            [7] = u30
            [8] = u29
            [9] = u45
        --]]
        table.clear(u46)
        local v96 = u11.entries(u38.store.Draft.teamData.kitSelection)
        local function v102(p97) --[[ Line: 237 ]]
            --[[
            Upvalues:
                [1] = u46
                [2] = u47
                [3] = u6
                [4] = u18
                [5] = u30
                [6] = u38
                [7] = u29
                [8] = u45
            --]]
            local v98 = p97[1]
            local v99 = p97[2]
            u46[tonumber(v98)] = v99
            u47(u46)
            local v100 = not u6.isHoarceKat()
            if v100 then
                if tonumber(v98) == u18.LocalPlayer.UserId then
                    v100 = v99.selectorOption == u30.HOVER
                else
                    v100 = false
                end
            end
            if v100 then
                local v101 = u38.store.Draft.sharedData
                if v101 ~= nil then
                    v101 = v101.matchDraftPhase
                end
                v100 = v101 == u29.KIT_SELECT
            end
            if v100 then
                u45(v99.kit)
            end
        end
        for v103, v104 in v96 do
            v102(v104, v103 - 1, v96)
        end
    end, { u38.store.Draft.teamData.kitSelection })
    v40(function() --[[ Line: 259 ]]
        --[[
        Upvalues:
            [1] = u48
            [2] = u11
            [3] = u38
            [4] = u49
        --]]
        table.clear(u48)
        for v105, v106 in u11.entries(u38.store.Draft.teamData.votedKitBans) do
            local _ = v105 - 1
            local v107 = v106[1]
            local v108 = v106[2]
            u48[tonumber(v107)] = v108
            u49(u48)
        end
    end, { u38.store.Draft.teamData.votedKitBans })
    local function v114() --[[ Line: 273 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u29
            [3] = u45
            [4] = u9
            [5] = u32
            [6] = u55
            [7] = u20
            [8] = u56
            [9] = u21
            [10] = u12
        --]]
        local v109 = u38.store.Draft.sharedData
        if v109 ~= nil then
            v109 = v109.matchDraftPhase
        end
        if v109 ~= u29.KIT_SELECT then
            u45(nil)
        end
        local v110 = u38.store.Draft.sharedData
        if v110 ~= nil then
            local _ = v110.matchDraftPhase
        end
        u9:playSound(u32.SKULL_DROP_SKULL_DEPOSIT_04)
        local v111 = u38.store.Draft.sharedData
        if v111 ~= nil then
            v111 = v111.matchDraftPhaseEndTime
        end
        if v111 ~= 0 and (v111 == v111 and v111) then
            u55(u20:GetServerTimeNow())
        end
        local u112 = u56:getValue()
        if u112 then
            u21(0.2, u12, function(p113) --[[ Line: 301 ]]
                --[[
                Upvalues:
                    [1] = u112
                --]]
                u112.Position = p113
            end, UDim2.fromScale(0.5, -0.4), UDim2.fromScale(0.5, 0))
        end
    end
    local v115 = u38.store.Draft.sharedData
    if v115 ~= nil then
        v115 = v115.matchDraftPhaseEndTime
    end
    v40(v114, { v115 })
    local function v139() --[[ Line: 311 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u38
            [3] = u29
            [4] = u53
            [5] = u24
        --]]
        local u116 = u13.new()
        local function v122(p117) --[[ Line: 313 ]]
            --[[
            Upvalues:
                [1] = u38
            --]]
            local v118 = 0
            local v119 = {}
            for v120, v121 in u38.store.Draft.sharedData.completedPhases do
                local _ = v120 - 1
                if v121 == p117 == true then
                    v118 = v118 + 1
                    v119[v118] = v121
                end
            end
            return #v119 + 1
        end
        local v123 = u38.store.Draft.sharedData
        if v123 ~= nil then
            v123 = v123.matchDraftPhase
        end
        if v123 == u29.BANNING then
            local v124 = v122(u29.BANNING)
            local v125 = u53
            local v126 = "BAN A KIT"
            local v127
            if u24.BANNING_ROUNDS > 1 then
                local v128 = tostring(v124)
                local v129 = u24.BANNING_ROUNDS
                v127 = "\n(" .. v128 .. "/" .. tostring(v129) .. ")"
            else
                v127 = ""
            end
            v125(v126 .. v127)
        elseif v123 == u29.BANNING_TRANSITION then
            local v130 = v122(u29.BANNING_TRANSITION)
            local v131 = u53
            local v132 = "BANNING A KIT"
            local v133
            if u24.BANNING_ROUNDS > 1 then
                local v134 = tostring(v130)
                local v135 = u24.BANNING_ROUNDS
                v133 = "\n(" .. v134 .. "/" .. tostring(v135) .. ")"
            else
                v133 = ""
            end
            v131(v132 .. v133)
        elseif v123 == u29.KIT_SELECT then
            u53("SELECT YOUR KIT")
        elseif v123 == u29.KIT_SELECT_POST then
            u53("STARTING MATCH...")
        elseif v123 == u29.START_MATCH then
            u53("STARTING")
        elseif v123 == u29.LOADING then
            local u136 = true
            u116:GiveTask(task.spawn(function() --[[ Line: 359 ]]
                --[[
                Upvalues:
                    [1] = u136
                    [2] = u53
                --]]
                local v137 = 0
                while u136 do
                    local v138 = v137 > 3 and 0 or v137
                    u53("WAITING FOR PLAYERS\n" .. string.rep(".", v138))
                    v137 = v138 + 1
                    task.wait(0.5)
                end
            end))
            u116:GiveTask(function() --[[ Line: 371 ]]
                --[[
                Upvalues:
                    [1] = u136
                --]]
                u136 = false
            end)
        else
            u53("LOADING")
        end
        return function() --[[ Line: 379 ]]
            --[[
            Upvalues:
                [1] = u116
            --]]
            u116:DoCleaning()
        end
    end
    local v140 = u38.store.Draft.sharedData
    if v140 ~= nil then
        v140 = v140.matchDraftPhase
    end
    v40(v139, { v140 })
    local function u148(p141, p142) --[[ Line: 388 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u38
            [3] = u29
            [4] = u6
            [5] = u45
            [6] = u31
            [7] = u2
        --]]
        if p142 == nil then
            p142 = u30.HOVER
        end
        if not p141 then
            return false
        end
        local v143 = u38.store.Draft.sharedData
        if v143 ~= nil then
            v143 = v143.matchDraftPhase
        end
        if v143 == u29.BANNING then
            if u6.isHoarceKat() then
                u45(p141)
                return true
            end
            local v144 = u31.Client:Get("BanKit"):CallServer(p141, p142)
            if v144.success then
                u45(p141)
                return true
            end
            local v145 = v144.message
            if v145 ~= "" and v145 then
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    ["message"] = v144.message
                })
            end
        elseif v143 == u29.KIT_SELECT then
            if u6.isHoarceKat() then
                u45(p141)
                return true
            end
            local v146 = u31.Client:Get("SelectKit"):CallServer(p141, p142)
            if v146.success then
                u45(p141)
                return true
            end
            local v147 = v146.message
            if v147 ~= "" and v147 then
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    ["message"] = v146.message
                })
            end
        end
        return false
    end
    local function v149() --[[ Line: 441 ]]
        --[[
        Upvalues:
            [1] = u44
            [2] = u2
            [3] = u9
            [4] = u32
            [5] = u148
            [6] = u30
        --]]
        if not u44 then
            u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                ["message"] = "No Kit Selected"
            })
            return nil
        end
        u9:playSound(u32.SHIELD_CHARGE_START, {
            ["volumeMultiplier"] = 0.75
        })
        u148(u44, u30.SELECT)
    end
    local v161 = (function() --[[ Line: 453 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u29
            [3] = u6
            [4] = u18
            [5] = u48
            [6] = u30
            [7] = u33
            [8] = u46
        --]]
        local v150 = u38.store.Draft.sharedData
        if v150 ~= nil then
            v150 = v150.matchDraftPhase
        end
        if v150 == u29.BANNING then
            local v151 = {
                ["text"] = "Ban"
            }
            local v152
            if u6.isHoarceKat() then
                v152 = u33.mcRed
            else
                local v153 = u48[u18.LocalPlayer.UserId]
                if v153 ~= nil then
                    v153 = v153.selectorOption
                end
                if v153 == u30.SELECT then
                    v152 = u33.mcDarkGray
                else
                    v152 = u33.mcRed
                end
            end
            v151.backgroundColor = v152
            local v154
            if u6.isHoarceKat() then
                v154 = false
            else
                local v155 = u48[u18.LocalPlayer.UserId]
                if v155 ~= nil then
                    v155 = v155.selectorOption
                end
                v154 = v155 == u30.SELECT
            end
            v151.disabled = v154
            return v151
        end
        if v150 ~= u29.KIT_SELECT then
            return v150 == u29.KIT_SELECT_POST and {
                ["text"] = "SELECTED",
                ["disabled"] = true,
                ["backgroundColor"] = u33.Gray
            } or (v150 == u29.START_MATCH and {
                ["text"] = "SELECTED",
                ["disabled"] = true,
                ["backgroundColor"] = u33.Gray
            } or (v150 == u29.LOADING and {
                ["text"] = "SELECT",
                ["disabled"] = true,
                ["backgroundColor"] = u33.Gray
            } or {
                ["text"] = "SELECT",
                ["disabled"] = true,
                ["backgroundColor"] = u33.Gray
            }))
        end
        local v156 = {
            ["text"] = "SELECT KIT"
        }
        local v157
        if u6.isHoarceKat() then
            v157 = u33.backgroundSuccess
        else
            local v158 = u48[u18.LocalPlayer.UserId]
            if v158 ~= nil then
                v158 = v158.selectorOption
            end
            if v158 == u30.SELECT then
                v157 = u33.mcDarkGray
            else
                v157 = u33.backgroundSuccess
            end
        end
        v156.backgroundColor = v157
        local v159
        if u6.isHoarceKat() then
            v159 = false
        else
            local v160 = u46[u18.LocalPlayer.UserId]
            if v160 ~= nil then
                v160 = v160.selectorOption
            end
            v159 = v160 == u30.SELECT
        end
        v156.disabled = v159
        return v156
    end)()
    local function u169(p162) --[[ Line: 552 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u29
            [3] = u48
            [4] = u30
            [5] = u26
            [6] = u46
            [7] = u27
        --]]
        local v163 = u38.store.Draft.sharedData
        if v163 ~= nil then
            v163 = v163.matchDraftPhase
        end
        if v163 == u29.BANNING then
            local v164 = u48[p162]
            local v165
            if v164 == nil then
                v165 = v164
            else
                v165 = v164.kit
            end
            if v165 then
                v165 = v164.selectorOption == u30.SELECT
            end
            return not v165 and "" or "VOTED " .. u26[v164.kit].name
        end
        local v166 = u38.store.Draft.sharedData
        if v166 ~= nil then
            v166 = v166.matchDraftPhase
        end
        if v166 ~= u29.KIT_SELECT then
            return ""
        end
        local v167 = u46[p162]
        local v168
        if v167 == nil then
            v168 = v167
        else
            v168 = v167.kit
        end
        if v168 then
            v168 = v167.selectorOption == u30.SELECT
        end
        return not v168 and "" or u27(v167.kit).name
    end
    local function u175(p170) --[[ Line: 600 ]]
        --[[
        Upvalues:
            [1] = u48
        --]]
        local v171 = 0
        local v172 = v171
        for _, v173 in u48 do
            if v173.kit == p170 then
                v171 = v172 + 1
                v172 = v171
            end
        end
        if next(u48) == nil then
            return 0
        end
        local v174 = 0
        for _ in u48 do
            v174 = v174 + 1
        end
        return v172 / v174
    end
    local v176 = {
        ["Size"] = UDim2.fromScale(1, 1),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5)
    }
    local v177 = {}
    local _ = #v177
    local v178 = {
        ["Size"] = UDim2.fromScale(1, 0.25),
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        ["Position"] = UDim2.fromScale(0.5, 0)
    }
    local v179 = {}
    local v180 = #v179
    local function v185() --[[ Line: 636 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u15
            [3] = u7
            [4] = u10
            [5] = u54
            [6] = u23
            [7] = u32
        --]]
        local v181 = math
        local v182 = u38.store.Draft.sharedData
        if v182 ~= nil then
            v182 = v182.matchDraftPhaseEndTime
        end
        local v183 = v182 == nil and 0 or v182
        local v184 = v181.max(v183, 0)
        return u15.createFragment({
            ["CountdownSection"] = u15.createElement(u7, {
                ["Size"] = UDim2.fromScale(1, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.68)
            }, { u15.createElement(u7, {
                    ["Size"] = UDim2.new(0.45, 0, 0.15, 0),
                    ["AnchorPoint"] = Vector2.new(0, 0.5),
                    ["Position"] = UDim2.fromScale(0, 0.5)
                }, { u15.createElement("UIPadding", {
                        ["PaddingRight"] = UDim.new(0.1, 0),
                        ["PaddingLeft"] = UDim.new(0.1, 0)
                    }), u15.createElement(u10, {
                        ["Rotation"] = 180,
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["StartTime"] = u54,
                        ["EndTime"] = v184,
                        ["BackgroundColor3"] = Color3.fromRGB(64, 5, 5),
                        ["ProgressBarConfig"] = {
                            ["GradientRotation"] = 180,
                            ["Flip"] = true,
                            ["BarGradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(66, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 56, 56)) })
                        }
                    }) }), u15.createElement(u23, {
                    ["OnlyPlaySoundLastNSec"] = 10,
                    ["EndTime"] = v184,
                    ["FrameProps"] = {
                        ["ZIndex"] = 3,
                        ["Size"] = UDim2.fromScale(0.2, 0.9),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                    },
                    ["PlayCustomSoundAtTime"] = {
                        ["timeLeftSec"] = 3,
                        ["sound"] = u32.LTM_GOAL_MOVING_SOUND
                    }
                }), u15.createElement(u7, {
                    ["Size"] = UDim2.new(0.45, 0, 0.15, 0),
                    ["AnchorPoint"] = Vector2.new(1, 0.5),
                    ["Position"] = UDim2.fromScale(1, 0.5)
                }, { u15.createElement("UIPadding", {
                        ["PaddingRight"] = UDim.new(0.1, 0),
                        ["PaddingLeft"] = UDim.new(0.1, 0)
                    }), u15.createElement(u10, {
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["StartTime"] = u54,
                        ["EndTime"] = v184,
                        ["BackgroundColor3"] = Color3.fromRGB(64, 5, 5),
                        ["ProgressBarConfig"] = {
                            ["GradientRotation"] = 180,
                            ["Flip"] = true,
                            ["BarGradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(66, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 56, 56)) })
                        }
                    }) }) })
        })
    end
    local v186 = u38.store.Draft.sharedData
    if v186 ~= nil then
        v186 = v186.matchDraftPhaseEndTime
    end
    local v187 = {
        ["Size"] = UDim2.fromScale(0.5, 1),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v188 = {
        ["PhaseTitleContainer"] = u15.createElement(u7, {
            ["Size"] = UDim2.fromScale(1, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Position"] = UDim2.fromScale(0.5, 0),
            [u15.Ref] = u56
        }, { u15.createElement("TextLabel", {
                ["RichText"] = true,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextStrokeTransparency"] = 1,
                ["TextWrapped"] = true,
                ["TextScaled"] = true,
                ["Text"] = v52,
                ["Size"] = UDim2.fromScale(0.3, 0.7),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold),
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["TextYAlignment"] = Enum.TextYAlignment.Center,
                ["TextColor3"] = u5.WHITE
            }) }),
        [#v188 + 1] = v42(v185, { v186, u54 })
    }
    v179[v180 + 1] = u15.createElement(u7, v187, v188)
    v177.HeaderContainer = u15.createElement(u7, v178, v179)
    local v189 = {
        ["Size"] = UDim2.fromScale(1, 0.75),
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        ["Position"] = UDim2.fromScale(0.5, 0.25)
    }
    local v190 = { u15.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 0),
            ["PaddingBottom"] = UDim.new(0.04, 0),
            ["PaddingLeft"] = UDim.new(0.04, 0),
            ["PaddingRight"] = UDim.new(0.04, 0)
        }) }
    local _ = #v190
    local v191 = u11
    local v192
    if u43 == nil then
        v192 = u43
    else
        v192 = u43.members
    end
    local v193 = v191.values(v192)
    local function v214(p194) --[[ Line: 771 ]]
        --[[
        Upvalues:
            [1] = u48
            [2] = u6
            [3] = u18
            [4] = u38
            [5] = u29
            [6] = u30
            [7] = u46
            [8] = u169
            [9] = u43
            [10] = u175
            [11] = u15
            [12] = u35
        --]]
        local v195 = u48[p194.userId]
        if v195 ~= nil then
            v195 = v195.kit
        end
        local v196 = u6.isHoarceKat() and true or p194.userId == u18.LocalPlayer.UserId
        local v197 = false
        local v198 = u38.store.Draft.sharedData
        if v198 ~= nil then
            v198 = v198.matchDraftPhase
        end
        local v199
        if v198 == u29.BANNING then
            if u6.isHoarceKat() then
                v199 = false
            else
                local v200 = u48[p194.userId]
                if v200 ~= nil then
                    v200 = v200.selectorOption
                end
                v199 = v200 == u30.SELECT
            end
        else
            local v201 = u38.store.Draft.sharedData
            if v201 ~= nil then
                v201 = v201.matchDraftPhase
            end
            if v201 == u29.KIT_SELECT then
                if u6.isHoarceKat() then
                    v199 = false
                else
                    local v202 = u38.store.Draft.teamData.kitSelection
                    local v203 = p194.userId
                    local v204 = v202[tostring(v203)]
                    if v204 ~= nil then
                        v204 = v204.selectorOption
                    end
                    v199 = v204 == u30.SELECT
                end
            else
                local v205 = u38.store.Draft.sharedData
                if v205 ~= nil then
                    v205 = v205.matchDraftPhase
                end
                v199 = v205 == u29.BANNING_TRANSITION and true or v197
            end
        end
        local v206 = {}
        local v207 = u38.store.Draft.sharedData
        if v207 ~= nil then
            v207 = v207.matchDraftPhase
        end
        v206.HideBanBox = v207 ~= u29.BANNING
        local v208 = {
            ["Player"] = p194
        }
        local v209 = u46[p194.userId]
        if v209 ~= nil then
            v209 = v209.kit
        end
        v208.Kit = v209
        local v210 = u46[p194.userId]
        if v210 ~= nil then
            v210 = v210.selectorOption
        end
        v208.KitLockedIn = v210 == u30.SELECT
        v208.ActionText = u169(p194.userId)
        local v211 = u43
        if v211 ~= nil then
            v211 = v211.color
        end
        v208.TeamColor = v211
        v206.CardData = v208
        v206.BanData = {
            ["Kit"] = v195,
            ["Probability"] = not v195 and 0 or u175(v195),
            ["LockedIn"] = v199
        }
        v206.LayoutOrder = v196 and 0 or 1
        local v212 = {}
        local v213
        if v199 then
            v213 = Color3.fromRGB(128, 255, 133)
        elseif v196 then
            v213 = Color3.fromRGB(255, 217, 128)
        else
            v213 = nil
        end
        v212.Color = v213
        v212.DisableAnimation = v199
        v206.HighlightConfig = v212
        return u15.createElement(u35, v206)
    end
    local v215 = table.create(#v193)
    for v216, v217 in v193 do
        v215[v216] = v214(v217, v216 - 1, v193)
    end
    local v218 = {
        ["Size"] = UDim2.fromScale(0.22, 1),
        ["Position"] = UDim2.fromScale(0, 0),
        ["AnchorPoint"] = Vector2.new(0, 0)
    }
    local v219 = { u15.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["Padding"] = UDim.new(0.02, 0),
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }) }
    local v220 = #v219
    for v221, v222 in v215 do
        v219[v220 + v221] = v222
    end
    v190.Team1Column = u15.createElement(u7, v218, v219)
    local v223 = u38.store.Game.teams
    local v224 = table.create(#v223)
    for v225, v226 in v223 do
        v224[v225] = {
            ["team"] = v226,
            ["index"] = v225 - 1
        }
    end
    table.sort(v224, function(p227, p228) --[[ Line: 905 ]]
        --[[
        Upvalues:
            [1] = u43
        --]]
        local v229 = p227.team.id == u43.id
        if v229 == (p228.team.id == u43.id) then
            return p227.index < p228.index
        else
            return v229
        end
    end)
    local function v257(p230) --[[ Line: 914 ]]
        --[[
        Upvalues:
            [1] = u43
            [2] = u38
            [3] = u29
            [4] = u11
            [5] = u30
            [6] = u15
            [7] = u36
        --]]
        local v231 = p230.team
        local v232 = v231.id == u43.id
        local v233 = false
        local v234 = u38.store.Draft
        local v235 = v234.sharedData
        if v235 ~= nil then
            v235 = v235.matchDraftPhase
        end
        local v236 = v235 ~= u29.BANNING
        if v236 then
            local v237 = v234.sharedData
            if v237 ~= nil then
                v237 = v237.matchDraftPhase
            end
            v236 = v237 ~= u29.KIT_SELECT
        end
        local v238 = v234.sharedData
        if v238 ~= nil then
            v238 = v238.matchDraftPhase
        end
        if v232 then
            local v239 = u38.store.Game.myTeam
            if v239 ~= nil then
                v239 = 0
                for _ in v239.members do
                    v239 = v239 + 1
                end
            end
            local v240 = v239 == nil and 0 or v239
            if v238 == u29.BANNING then
                v233 = true
                for v241, v242 in u11.values(v234.teamData.votedKitBans) do
                    local _ = v241 - 1
                    if v242.selectorOption ~= u30.SELECT then
                        v233 = false
                        break
                    end
                end
                if v233 then
                    v233 = #u11.values(v234.teamData.votedKitBans) == v240
                end
            elseif v238 == u29.KIT_SELECT then
                v233 = true
                for v243, v244 in u11.values(v234.teamData.kitSelection) do
                    local _ = v243 - 1
                    if v244.selectorOption ~= u30.SELECT then
                        v233 = false
                        break
                    end
                end
                if v233 then
                    v233 = #u11.values(v234.teamData.kitSelection) == v240
                end
            end
        else
            local v245 = v234.enemyTeamData[v231.id]
            local v246 = nil
            for v247, v248 in u38.store.Game.teams do
                local _ = v247 - 1
                if v248.id == v231.id == true then
                    v246 = v248
                    break
                end
            end
            if v246 ~= nil then
                v246 = 0
                for _ in v246.members do
                    v246 = v246 + 1
                end
            end
            if v238 == u29.BANNING then
                if v245 ~= nil then
                    v245 = 0
                    for _ in v245.playersVoted do
                        v245 = v245 + 1
                    end
                end
                local v249 = nil
                for v250, v251 in u38.store.Game.teams do
                    local _ = v250 - 1
                    if v251.id == v231.id == true then
                        v249 = v251
                        break
                    end
                end
                if v249 ~= nil then
                    v249 = 0
                    for _ in v249.members do
                        v249 = v249 + 1
                    end
                end
                v233 = v245 == v249
            elseif v238 == u29.KIT_SELECT then
                if v245 ~= nil then
                    v245 = 0
                    for _ in v245.kitSelection do
                        v245 = v245 + 1
                    end
                end
                if v245 == v246 then
                    v233 = true
                else
                    v233 = false
                end
            end
        end
        local v252 = u15.createElement
        local v253 = u36
        local v254 = {}
        local v255 = {}
        local v256
        if v233 or v236 then
            v256 = Color3.fromRGB(128, 255, 133)
        else
            v256 = nil
        end
        v255.Color = v256
        v255.DisableAnimation = v233 or v236
        v254.HighlightConfig = v255
        v254.Size = UDim2.fromScale(1, 0.18)
        v254.CardData = {
            ["store"] = u38.store,
            ["Team"] = v231,
            ["IsTeamLockedIn"] = v233 or v236
        }
        return v252(v253, v254)
    end
    local v258 = table.create(#v224)
    for v259, v260 in v224 do
        v258[v259] = v257(v260, v259 - 1, v224)
    end
    local v261 = {
        ["Size"] = UDim2.fromScale(0.22, 1),
        ["Position"] = UDim2.fromScale(1, 0),
        ["AnchorPoint"] = Vector2.new(1, 0)
    }
    local v262 = { u15.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["Padding"] = UDim.new(0.02, 0),
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }) }
    local v263 = #v262
    for v264, v265 in v258 do
        v262[v263 + v264] = v265
    end
    v190.TeamsColumn = u15.createElement(u7, v261, v262)
    local v266 = {
        ["Size"] = UDim2.fromScale(0.5, 1),
        ["Position"] = UDim2.fromScale(0.5, 0),
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        [u15.Ref] = u57
    }
    local v267 = { u15.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Top",
            ["Padding"] = UDim.new(0.01, 0)
        }) }
    local v268 = #v267
    local v269 = {
        ["SelectionMode"] = "SELECTION_ONLY",
        ["Size"] = UDim2.fromScale(1, 0.9),
        ["store"] = u38.store,
        ["SelectedKit"] = u44,
        ["SetSelectedKit"] = u148
    }
    local v270 = u38.store.Draft.sharedData
    if v270 ~= nil then
        v270 = v270.matchDraftPhase
    end
    v269.ShowAllKits = v270 == u29.BANNING
    local v271 = u38.store.Draft.sharedData
    if v271 ~= nil then
        v271 = v271.matchDraftPhase
    end
    v269.ExcludeNonShopKits = v271 == u29.BANNING
    local v272 = u11.values(v50)
    local function v277(p273, p274) --[[ Line: 1140 ]]
        for v275, v276 in p274 do
            local _ = v275 - 1
            table.insert(p273, v276)
        end
        return p273
    end
    local v278 = {}
    for v279 = 1, #v272 do
        v278 = v277(v278, v272[v279], v279 - 1, v272)
    end
    v269.BannedKits = v278
    v267[v268 + 1] = u15.createElement(u22, v269)
    v267[v268 + 2] = u15.createElement(u4, {
        ["TextScaled"] = true,
        ["Size"] = UDim2.fromScale(0.4, 0.1),
        ["Text"] = string.upper(v161.text),
        ["BackgroundColor3"] = v161.backgroundColor,
        ["OnClick"] = v149,
        ["Disabled"] = v161.disabled
    }, { u15.createElement(u8, {
            ["Padding"] = UDim.new(0.15, 0)
        }) })
    v190.KitSelection = u15.createElement(u7, v266, v267)
    local v280 = {
        ["Size"] = UDim2.fromScale(0.5, 1),
        ["Position"] = UDim2.fromScale(0.5, 0),
        ["AnchorPoint"] = Vector2.new(0.5, 0)
    }
    local v281 = {}
    local v282 = #v281
    local v283 = u38.store.Draft.teamData
    if v283 ~= nil then
        v283 = v283.votedKitBans
    end
    if v283 then
        local v284 = u11.values(u38.store.Draft.teamData.votedKitBans)
        local function v294(p285, p286) --[[ Line: 1188 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u58
                [3] = u38
                [4] = u37
                [5] = u34
            --]]
            local v287 = u15.createRef()
            local v288 = u15.createRef()
            local v289 = {
                ["kit"] = p285.kit,
                ["imageLabelRef"] = v287,
                ["containerRef"] = v288
            }
            local v290 = u58
            table.insert(v290, v289)
            local v291 = {
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0)
            }
            local v292 = UDim2
            local v293 = 0
            for _ in u38.store.Draft.teamData.votedKitBans do
                v293 = v293 + 1
            end
            v291.Position = v292.fromScale(u37(v293)[p286 + 1], 0)
            v291.Kit = p285.kit
            v291[u15.Ref] = v288
            v291.imageLabelRef = v287
            return u15.createElement(u34, v291)
        end
        v283 = table.create(#v284)
        for v295, v296 in v284 do
            v283[v295] = v294(v296, v295 - 1, v284)
        end
    end
    local v297 = {
        ["Size"] = UDim2.fromScale(0.8, 0.25),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v298 = {}
    local v299 = #v298
    for v300, v301 in v283 do
        v298[v299 + v300] = v301
    end
    v281[v282 + 1] = u15.createElement(u7, v297, v298)
    v190.KitSelectionOverlay = u15.createElement(u7, v280, v281)
    v177.BodyContainer = u15.createElement(u7, v189, v190)
    return u15.createElement(u7, v176, v177)
end
u37 = function(p303) --[[ Name: spaceEvenly, Line 1237 ]]
    if p303 <= 0 then
        return {}
    end
    if p303 == 1 then
        return { 0.5 }
    end
    local v304 = 1 / (p303 - 1)
    local v305 = false
    local v306 = 0
    local v307 = {}
    while true do
        if v305 then
            v306 = v306 + 1
        else
            v305 = true
        end
        if v306 >= p303 then
            return v307
        end
        local v308 = v306 * v304
        table.insert(v307, v308)
    end
end
return {
    ["MatchDraftMultiTeamPage"] = v16.new(u15)(v302)
}