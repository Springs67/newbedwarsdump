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
local u34 = v1.import(script, script.Parent, "match-draft-ban-box").MatchDraftBanBox
local u35 = v1.import(script, script.Parent, "match-draft-ban-icon").MatchDraftBanIcon
local u36 = v1.import(script, script.Parent, "match-draft-player-row").MatchDraftPlayerRow
local u37 = nil
local function v328(u38, p39) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u20
        [3] = u29
        [4] = u13
        [5] = u19
        [6] = u14
        [7] = u28
        [8] = u24
        [9] = u11
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
        [26] = u34
        [27] = u36
        [28] = u22
        [29] = u4
        [30] = u8
        [31] = u37
        [32] = u35
    --]]
    local v40 = p39.useEffect
    local v41 = p39.useState
    local _ = p39.useValue
    local v42 = p39.useMemo
    local u43 = u38.store.Game.myTeam
    local u44 = nil
    for v45, v46 in u38.store.Game.teams do
        local _ = v45 - 1
        local v47 = v46.id
        local v48
        if u43 == nil then
            v48 = u43
        else
            v48 = u43.id
        end
        if v47 ~= v48 == true then
            u44 = v46
            break
        end
    end
    if not (u43 and u44) then
        return u15.createFragment()
    end
    local u49, u50 = v41(nil)
    local u51, u52 = v41({})
    local u53, u54 = v41({})
    local v55, u56 = v41({})
    local v57, u58 = v41("LOADING")
    local u59, u60 = v41(u20:GetServerTimeNow())
    local u61 = u15.createRef()
    local u62 = u15.createRef()
    local u63 = u15.createRef()
    local v64 = u15.createRef()
    local u65 = {}
    local function v105() --[[ Line: 78 ]]
        --[[
        Upvalues:
            [1] = u62
            [2] = u38
            [3] = u29
            [4] = u13
            [5] = u19
            [6] = u65
            [7] = u63
            [8] = u43
            [9] = u14
            [10] = u28
            [11] = u44
            [12] = u24
            [13] = u56
        --]]
        local v66 = u62:getValue()
        if not v66 then
            return nil
        end
        local v67 = u38.store.Draft.sharedData
        if v67 ~= nil then
            v67 = v67.matchDraftPhase
        end
        local v68 = v67 == u29.BANNING_TRANSITION
        local u69 = u13.new()
        local u70 = u19:Create(v66, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            ["Position"] = UDim2.fromScale(0.5, v68 and 1.2 or 0)
        })
        u70:Play()
        u69:GiveTask(function() --[[ Line: 93 ]]
            --[[
            Upvalues:
                [1] = u70
            --]]
            u70:Cancel()
            u70:Destroy()
        end)
        if v68 then
            local v71 = 0
            for _, v72 in u65 do
                local u73 = v72.kit
                local v74 = v72.imageLabelRef
                local v75 = v72.containerRef
                local u76 = v74:getValue()
                local u77 = v75:getValue()
                local u78 = u63:getValue()
                if u76 and u77 then
                    local u79 = 1 / #u65
                    local u80 = v71 * u79
                    task.delay(u80, function() --[[ Line: 114 ]]
                        --[[
                        Upvalues:
                            [1] = u19
                            [2] = u76
                            [3] = u79
                            [4] = u69
                            [5] = u38
                            [6] = u43
                            [7] = u73
                            [8] = u80
                            [9] = u14
                            [10] = u28
                            [11] = u78
                            [12] = u77
                        --]]
                        local u81 = u19:Create(u76, TweenInfo.new(u79), {
                            ["ImageTransparency"] = 0,
                            ["BackgroundTransparency"] = 0.3,
                            ["Position"] = UDim2.fromScale(0.5, 0)
                        })
                        u81:Play()
                        u69:GiveTask(function() --[[ Line: 121 ]]
                            --[[
                            Upvalues:
                                [1] = u81
                            --]]
                            u81:Cancel()
                            u81:Destroy()
                        end)
                        local v82 = u38.store.Draft.sharedData
                        if v82 ~= nil then
                            v82 = v82.kitBans[u43.id]
                            if v82 ~= nil then
                                v82 = table.find(v82, u73) ~= nil
                            end
                        end
                        if v82 then
                            local u83 = u14("ImageLabel", {
                                ["BorderSizePixel"] = 0,
                                ["ImageTransparency"] = 1,
                                ["BackgroundTransparency"] = 1,
                                ["Parent"] = u76,
                                ["Image"] = u28.BLOCK_ICON,
                                ["ScaleType"] = Enum.ScaleType.Crop,
                                ["Size"] = UDim2.fromScale(2, 2),
                                ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                                ["AnchorPoint"] = Vector2.new(1, 1),
                                ["Position"] = UDim2.fromScale(1, 1)
                            })
                            local u84
                            if u78 then
                                u84 = u14("ImageLabel", {
                                    ["BorderSizePixel"] = 0,
                                    ["ImageTransparency"] = 1,
                                    ["BackgroundTransparency"] = 1,
                                    ["Parent"] = u78,
                                    ["Image"] = u28.BLOCK_ICON,
                                    ["ScaleType"] = Enum.ScaleType.Crop,
                                    ["Size"] = UDim2.fromScale(2, 2),
                                    ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                                    ["AnchorPoint"] = Vector2.new(1, 1),
                                    ["Position"] = UDim2.fromScale(1, 1)
                                })
                            else
                                u84 = nil
                            end
                            u69:GiveTask(task.delay(1 - u80 + 1, function() --[[ Line: 175 ]]
                                --[[
                                Upvalues:
                                    [1] = u19
                                    [2] = u76
                                    [3] = u69
                                    [4] = u77
                                    [5] = u83
                                    [6] = u78
                                    [7] = u84
                                --]]
                                local u85 = u19:Create(u76, TweenInfo.new(1), {
                                    ["BackgroundColor3"] = Color3.fromRGB(159, 49, 49)
                                })
                                u85:Play()
                                u69:GiveTask(function() --[[ Line: 180 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u85
                                    --]]
                                    u85:Cancel()
                                    u85:Destroy()
                                end)
                                local u86 = u19:Create(u77, TweenInfo.new(1), {
                                    ["Position"] = UDim2.fromScale(0, 0)
                                })
                                u86:Play()
                                u69:GiveTask(function() --[[ Line: 188 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u86
                                    --]]
                                    u86:Cancel()
                                    u86:Destroy()
                                end)
                                local u87 = u19:Create(u83, TweenInfo.new(0.5), {
                                    ["ImageTransparency"] = 0,
                                    ["Size"] = UDim2.fromScale(0.5, 0.5)
                                })
                                u87:Play()
                                u69:GiveTask(function() --[[ Line: 197 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u87
                                    --]]
                                    u87:Cancel()
                                    u87:Destroy()
                                end)
                                if u78 then
                                    local u88 = u19:Create(u78, TweenInfo.new(1), {
                                        ["ImageTransparency"] = 0,
                                        ["BackgroundTransparency"] = 0,
                                        ["BackgroundColor3"] = Color3.fromRGB(159, 49, 49)
                                    })
                                    u88:Play()
                                    u69:GiveTask(function() --[[ Line: 208 ]]
                                        --[[
                                        Upvalues:
                                            [1] = u88
                                        --]]
                                        u88:Cancel()
                                        u88:Destroy()
                                    end)
                                end
                                if u84 then
                                    local u89 = u19:Create(u84, TweenInfo.new(0.5), {
                                        ["ImageTransparency"] = 0,
                                        ["Size"] = UDim2.fromScale(0.5, 0.5)
                                    })
                                    u89:Play()
                                    u69:GiveTask(function() --[[ Line: 219 ]]
                                        --[[
                                        Upvalues:
                                            [1] = u89
                                        --]]
                                        u89:Cancel()
                                        u89:Destroy()
                                    end)
                                end
                            end))
                            u69:GiveTask(task.delay(1 - u80 + 3, function() --[[ Line: 225 ]]
                                --[[
                                Upvalues:
                                    [1] = u19
                                    [2] = u76
                                    [3] = u69
                                    [4] = u83
                                    [5] = u78
                                    [6] = u84
                                --]]
                                local u90 = u19:Create(u76, TweenInfo.new(1), {
                                    ["ImageTransparency"] = 1,
                                    ["BackgroundTransparency"] = 1,
                                    ["Position"] = UDim2.fromScale(0.5, -0.5)
                                })
                                u90:Play()
                                u69:GiveTask(function() --[[ Line: 232 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u90
                                    --]]
                                    u90:Cancel()
                                    u90:Destroy()
                                end)
                                local u91 = u19:Create(u83, TweenInfo.new(1), {
                                    ["ImageTransparency"] = 1
                                })
                                u91:Play()
                                u69:GiveTask(function() --[[ Line: 240 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u91
                                    --]]
                                    u91:Cancel()
                                    u91:Destroy()
                                end)
                                if u78 then
                                    local u92 = u19:Create(u78, TweenInfo.new(1), {
                                        ["ImageTransparency"] = 1,
                                        ["BackgroundTransparency"] = 1,
                                        ["Position"] = UDim2.fromScale(0.5, -1.5)
                                    })
                                    u92:Play()
                                    u69:GiveTask(function() --[[ Line: 251 ]]
                                        --[[
                                        Upvalues:
                                            [1] = u92
                                        --]]
                                        u92:Cancel()
                                        u92:Destroy()
                                    end)
                                end
                                if u84 then
                                    local u93 = u19:Create(u84, TweenInfo.new(1), {
                                        ["ImageTransparency"] = 1
                                    })
                                    u93:Play()
                                    u69:GiveTask(function() --[[ Line: 261 ]]
                                        --[[
                                        Upvalues:
                                            [1] = u93
                                        --]]
                                        u93:Cancel()
                                        u93:Destroy()
                                    end)
                                end
                            end))
                        else
                            u69:GiveTask(task.delay(1 - u80 + 1, function() --[[ Line: 135 ]]
                                --[[
                                Upvalues:
                                    [1] = u19
                                    [2] = u76
                                    [3] = u79
                                    [4] = u69
                                --]]
                                local u94 = u19:Create(u76, TweenInfo.new(u79), {
                                    ["ImageTransparency"] = 1,
                                    ["BackgroundTransparency"] = 1,
                                    ["Position"] = UDim2.fromScale(0.5, 0.5)
                                })
                                u94:Play()
                                u69:GiveTask(function() --[[ Line: 142 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u94
                                    --]]
                                    u94:Cancel()
                                    u94:Destroy()
                                end)
                            end))
                        end
                    end)
                    v71 = v71 + 1
                end
            end
            local u95 = {}
            local v96 = { u43.id, u44.id }
            local function v102(p97) --[[ Line: 273 ]]
                --[[
                Upvalues:
                    [1] = u38
                    [2] = u95
                --]]
                local v98 = u38.store.Draft.sharedData
                if v98 ~= nil then
                    v98 = v98.kitBans[p97] ~= nil
                end
                local v99
                if v98 then
                    v99 = {}
                    local v100 = #v99
                    local v101 = u38.store.Draft.sharedData.kitBans[p97]
                    table.move(v101, 1, #v101, v100 + 1, v99)
                else
                    v99 = {}
                end
                u95[p97] = v99
            end
            for v103, v104 in v96 do
                v102(v104, v103 - 1, v96)
            end
            u69:GiveTask(task.delay(u24.BANNING_TRANSITION_TIME_SECONDS - 1, function() --[[ Line: 299 ]]
                --[[
                Upvalues:
                    [1] = u56
                    [2] = u95
                --]]
                u56(u95)
            end))
        end
        return function() --[[ Line: 303 ]]
            --[[
            Upvalues:
                [1] = u69
            --]]
            u69:Destroy()
        end
    end
    local v106 = u38.store.Draft.sharedData
    if v106 ~= nil then
        v106 = v106.matchDraftPhase
    end
    v40(v105, { v106 })
    v40(function() --[[ Line: 312 ]]
        --[[
        Upvalues:
            [1] = u51
            [2] = u11
            [3] = u38
            [4] = u52
            [5] = u6
            [6] = u18
            [7] = u30
            [8] = u29
            [9] = u50
        --]]
        table.clear(u51)
        local v107 = u11.entries(u38.store.Draft.teamData.kitSelection)
        local function v113(p108) --[[ Line: 315 ]]
            --[[
            Upvalues:
                [1] = u51
                [2] = u52
                [3] = u6
                [4] = u18
                [5] = u30
                [6] = u38
                [7] = u29
                [8] = u50
            --]]
            local v109 = p108[1]
            local v110 = p108[2]
            u51[tonumber(v109)] = v110
            u52(u51)
            local v111 = not u6.isHoarceKat()
            if v111 then
                if tonumber(v109) == u18.LocalPlayer.UserId then
                    v111 = v110.selectorOption == u30.HOVER
                else
                    v111 = false
                end
            end
            if v111 then
                local v112 = u38.store.Draft.sharedData
                if v112 ~= nil then
                    v112 = v112.matchDraftPhase
                end
                v111 = v112 == u29.KIT_SELECT
            end
            if v111 then
                u50(v110.kit)
            end
        end
        for v114, v115 in v107 do
            v113(v115, v114 - 1, v107)
        end
    end, { u38.store.Draft.teamData.kitSelection })
    v40(function() --[[ Line: 337 ]]
        --[[
        Upvalues:
            [1] = u53
            [2] = u11
            [3] = u38
            [4] = u54
        --]]
        table.clear(u53)
        for v116, v117 in u11.entries(u38.store.Draft.teamData.votedKitBans) do
            local _ = v116 - 1
            local v118 = v117[1]
            local v119 = v117[2]
            u53[tonumber(v118)] = v119
            u54(u53)
        end
    end, { u38.store.Draft.teamData.votedKitBans })
    local function v125() --[[ Line: 351 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u29
            [3] = u50
            [4] = u9
            [5] = u32
            [6] = u60
            [7] = u20
            [8] = u61
            [9] = u21
            [10] = u12
        --]]
        local v120 = u38.store.Draft.sharedData
        if v120 ~= nil then
            v120 = v120.matchDraftPhase
        end
        if v120 ~= u29.KIT_SELECT then
            u50(nil)
        end
        local v121 = u38.store.Draft.sharedData
        if v121 ~= nil then
            local _ = v121.matchDraftPhase
        end
        u9:playSound(u32.SKULL_DROP_SKULL_DEPOSIT_04)
        local v122 = u38.store.Draft.sharedData
        if v122 ~= nil then
            v122 = v122.matchDraftPhaseEndTime
        end
        if v122 ~= 0 and (v122 == v122 and v122) then
            u60(u20:GetServerTimeNow())
        end
        local u123 = u61:getValue()
        if u123 then
            u21(0.2, u12, function(p124) --[[ Line: 378 ]]
                --[[
                Upvalues:
                    [1] = u123
                --]]
                u123.Position = p124
            end, UDim2.fromScale(0.5, -0.4), UDim2.fromScale(0.5, 0))
        end
    end
    local v126 = u38.store.Draft.sharedData
    if v126 ~= nil then
        v126 = v126.matchDraftPhaseEndTime
    end
    v40(v125, { v126 })
    local function v150() --[[ Line: 388 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u38
            [3] = u29
            [4] = u58
            [5] = u24
        --]]
        local u127 = u13.new()
        local function v133(p128) --[[ Line: 390 ]]
            --[[
            Upvalues:
                [1] = u38
            --]]
            local v129 = 0
            local v130 = {}
            for v131, v132 in u38.store.Draft.sharedData.completedPhases do
                local _ = v131 - 1
                if v132 == p128 == true then
                    v129 = v129 + 1
                    v130[v129] = v132
                end
            end
            return #v130 + 1
        end
        local v134 = u38.store.Draft.sharedData
        if v134 ~= nil then
            v134 = v134.matchDraftPhase
        end
        if v134 == u29.BANNING then
            local v135 = v133(u29.BANNING)
            local v136 = u58
            local v137 = "BAN A KIT"
            local v138
            if u24.BANNING_ROUNDS > 1 then
                local v139 = tostring(v135)
                local v140 = u24.BANNING_ROUNDS
                v138 = "\n(" .. v139 .. "/" .. tostring(v140) .. ")"
            else
                v138 = ""
            end
            v136(v137 .. v138)
        elseif v134 == u29.BANNING_TRANSITION then
            local v141 = v133(u29.BANNING_TRANSITION)
            local v142 = u58
            local v143 = "BANNING A KIT"
            local v144
            if u24.BANNING_ROUNDS > 1 then
                local v145 = tostring(v141)
                local v146 = u24.BANNING_ROUNDS
                v144 = "\n(" .. v145 .. "/" .. tostring(v146) .. ")"
            else
                v144 = ""
            end
            v142(v143 .. v144)
        elseif v134 == u29.KIT_SELECT then
            u58("SELECT YOUR KIT")
        elseif v134 == u29.KIT_SELECT_POST then
            u58("STARTING MATCH...")
        elseif v134 == u29.START_MATCH then
            u58("STARTING")
        elseif v134 == u29.LOADING then
            local u147 = true
            u127:GiveTask(task.spawn(function() --[[ Line: 436 ]]
                --[[
                Upvalues:
                    [1] = u147
                    [2] = u58
                --]]
                local v148 = 0
                while u147 do
                    local v149 = v148 > 3 and 0 or v148
                    u58("WAITING FOR PLAYERS\n" .. string.rep(".", v149))
                    v148 = v149 + 1
                    task.wait(0.5)
                end
            end))
            u127:GiveTask(function() --[[ Line: 448 ]]
                --[[
                Upvalues:
                    [1] = u147
                --]]
                u147 = false
            end)
        else
            u58("LOADING")
        end
        return function() --[[ Line: 456 ]]
            --[[
            Upvalues:
                [1] = u127
            --]]
            u127:DoCleaning()
        end
    end
    local v151 = u38.store.Draft.sharedData
    if v151 ~= nil then
        v151 = v151.matchDraftPhase
    end
    v40(v150, { v151 })
    local function u159(p152, p153) --[[ Line: 465 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u38
            [3] = u29
            [4] = u6
            [5] = u50
            [6] = u31
            [7] = u2
        --]]
        if p153 == nil then
            p153 = u30.HOVER
        end
        if not p152 then
            return false
        end
        local v154 = u38.store.Draft.sharedData
        if v154 ~= nil then
            v154 = v154.matchDraftPhase
        end
        if v154 == u29.BANNING then
            if u6.isHoarceKat() then
                u50(p152)
                return true
            end
            local v155 = u31.Client:Get("BanKit"):CallServer(p152, p153)
            if v155.success then
                u50(p152)
                return true
            end
            local v156 = v155.message
            if v156 ~= "" and v156 then
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    ["message"] = v155.message
                })
            end
        elseif v154 == u29.KIT_SELECT then
            if u6.isHoarceKat() then
                u50(p152)
                return true
            end
            local v157 = u31.Client:Get("SelectKit"):CallServer(p152, p153)
            if v157.success then
                u50(p152)
                return true
            end
            local v158 = v157.message
            if v158 ~= "" and v158 then
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    ["message"] = v157.message
                })
            end
        end
        return false
    end
    local function v160() --[[ Line: 518 ]]
        --[[
        Upvalues:
            [1] = u49
            [2] = u2
            [3] = u9
            [4] = u32
            [5] = u159
            [6] = u30
        --]]
        if not u49 then
            u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                ["message"] = "No Kit Selected"
            })
            return nil
        end
        u9:playSound(u32.SHIELD_CHARGE_START, {
            ["volumeMultiplier"] = 0.75
        })
        u159(u49, u30.SELECT)
    end
    local v172 = (function() --[[ Line: 530 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u29
            [3] = u6
            [4] = u18
            [5] = u53
            [6] = u30
            [7] = u33
            [8] = u51
        --]]
        local v161 = u38.store.Draft.sharedData
        if v161 ~= nil then
            v161 = v161.matchDraftPhase
        end
        if v161 == u29.BANNING then
            local v162 = {
                ["text"] = "Ban"
            }
            local v163
            if u6.isHoarceKat() then
                v163 = u33.mcRed
            else
                local v164 = u53[u18.LocalPlayer.UserId]
                if v164 ~= nil then
                    v164 = v164.selectorOption
                end
                if v164 == u30.SELECT then
                    v163 = u33.mcDarkGray
                else
                    v163 = u33.mcRed
                end
            end
            v162.backgroundColor = v163
            local v165
            if u6.isHoarceKat() then
                v165 = false
            else
                local v166 = u53[u18.LocalPlayer.UserId]
                if v166 ~= nil then
                    v166 = v166.selectorOption
                end
                v165 = v166 == u30.SELECT
            end
            v162.disabled = v165
            return v162
        end
        if v161 ~= u29.KIT_SELECT then
            return v161 == u29.KIT_SELECT_POST and {
                ["text"] = "SELECTED",
                ["disabled"] = true,
                ["backgroundColor"] = u33.Gray
            } or (v161 == u29.START_MATCH and {
                ["text"] = "SELECTED",
                ["disabled"] = true,
                ["backgroundColor"] = u33.Gray
            } or (v161 == u29.LOADING and {
                ["text"] = "SELECT",
                ["disabled"] = true,
                ["backgroundColor"] = u33.Gray
            } or {
                ["text"] = "SELECT",
                ["disabled"] = true,
                ["backgroundColor"] = u33.Gray
            }))
        end
        local v167 = {
            ["text"] = "SELECT KIT"
        }
        local v168
        if u6.isHoarceKat() then
            v168 = u33.backgroundSuccess
        else
            local v169 = u53[u18.LocalPlayer.UserId]
            if v169 ~= nil then
                v169 = v169.selectorOption
            end
            if v169 == u30.SELECT then
                v168 = u33.mcDarkGray
            else
                v168 = u33.backgroundSuccess
            end
        end
        v167.backgroundColor = v168
        local v170
        if u6.isHoarceKat() then
            v170 = false
        else
            local v171 = u51[u18.LocalPlayer.UserId]
            if v171 ~= nil then
                v171 = v171.selectorOption
            end
            v170 = v171 == u30.SELECT
        end
        v167.disabled = v170
        return v167
    end)()
    local function u183(p173) --[[ Line: 629 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u29
            [3] = u53
            [4] = u30
            [5] = u26
            [6] = u6
            [7] = u44
            [8] = u51
            [9] = u27
        --]]
        local v174 = u38.store.Draft.sharedData
        if v174 ~= nil then
            v174 = v174.matchDraftPhase
        end
        if v174 == u29.BANNING then
            local v175 = u53[p173]
            local v176
            if v175 == nil then
                v176 = v175
            else
                v176 = v175.kit
            end
            if v176 then
                v176 = v175.selectorOption == u30.SELECT
            end
            if v176 then
                return "VOTED " .. u26[v175.kit].name
            end
            local v177 = not u6.isHoarceKat()
            if v177 then
                local v178 = u38.store.Draft.enemyTeamData[u44.id]
                if v178 ~= nil then
                    v178 = v178.playersVoted
                end
                v177 = v178[tostring(p173)] ~= nil
            end
            return v177 and "" or "VOTING..."
        end
        local v179 = u38.store.Draft.sharedData
        if v179 ~= nil then
            v179 = v179.matchDraftPhase
        end
        if v179 ~= u29.KIT_SELECT then
            return ""
        end
        local v180 = u51[p173]
        local v181
        if v180 == nil then
            v181 = v180
        else
            v181 = v180.kit
        end
        if v181 then
            v181 = v180.selectorOption == u30.SELECT
        end
        if v181 then
            return u27(v180.kit).name
        end
        local v182 = u38.store.Draft.enemyTeamData[u44.id]
        if v182 ~= nil then
            v182 = v182.playersVoted
        end
        return v182[tostring(p173)] == nil and "SELECTING KIT..." or ""
    end
    local function u189(p184) --[[ Line: 702 ]]
        --[[
        Upvalues:
            [1] = u53
        --]]
        local v185 = 0
        local v186 = v185
        for _, v187 in u53 do
            if v187.kit == p184 then
                v185 = v186 + 1
                v186 = v185
            end
        end
        if next(u53) == nil then
            return 0
        end
        local v188 = 0
        for _ in u53 do
            v188 = v188 + 1
        end
        return v186 / v188
    end
    local v190 = {
        ["Size"] = UDim2.fromScale(1, 1),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5)
    }
    local v191 = {}
    local _ = #v191
    local v192 = {
        ["Size"] = UDim2.fromScale(1, 0.25),
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        ["Position"] = UDim2.fromScale(0.5, 0)
    }
    local v193 = {}
    local v194 = #v193
    local function v199() --[[ Line: 738 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u15
            [3] = u7
            [4] = u10
            [5] = u59
            [6] = u23
            [7] = u32
        --]]
        local v195 = math
        local v196 = u38.store.Draft.sharedData
        if v196 ~= nil then
            v196 = v196.matchDraftPhaseEndTime
        end
        local v197 = v196 == nil and 0 or v196
        local v198 = v195.max(v197, 0)
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
                        ["StartTime"] = u59,
                        ["EndTime"] = v198,
                        ["BackgroundColor3"] = Color3.fromRGB(64, 5, 5),
                        ["ProgressBarConfig"] = {
                            ["GradientRotation"] = 180,
                            ["Flip"] = true,
                            ["BarGradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(66, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 56, 56)) })
                        }
                    }) }), u15.createElement(u23, {
                    ["OnlyPlaySoundLastNSec"] = 10,
                    ["EndTime"] = v198,
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
                        ["StartTime"] = u59,
                        ["EndTime"] = v198,
                        ["BackgroundColor3"] = Color3.fromRGB(64, 5, 5),
                        ["ProgressBarConfig"] = {
                            ["GradientRotation"] = 180,
                            ["Flip"] = true,
                            ["BarGradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(66, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 56, 56)) })
                        }
                    }) }) })
        })
    end
    local v200 = u38.store.Draft.sharedData
    if v200 ~= nil then
        v200 = v200.matchDraftPhaseEndTime
    end
    local v201 = {
        ["Size"] = UDim2.fromScale(0.5, 1),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v202 = {
        ["PhaseTitleContainer"] = u15.createElement(u7, {
            ["Size"] = UDim2.fromScale(1, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Position"] = UDim2.fromScale(0.5, 0),
            [u15.Ref] = u61
        }, { u15.createElement("TextLabel", {
                ["RichText"] = true,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextStrokeTransparency"] = 1,
                ["TextWrapped"] = true,
                ["TextScaled"] = true,
                ["Text"] = v57,
                ["Size"] = UDim2.fromScale(0.3, 0.7),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold),
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["TextYAlignment"] = Enum.TextYAlignment.Center,
                ["TextColor3"] = u5.WHITE
            }) }),
        [#v202 + 1] = v42(v199, { v200, u59 })
    }
    v193[v194 + 1] = u15.createElement(u7, v201, v202)
    local v203 = {
        ["Size"] = UDim2.fromScale(0.25, 1),
        ["Position"] = UDim2.fromScale(0, 0.5),
        ["AnchorPoint"] = Vector2.new(0, 0.5)
    }
    local v204 = {}
    local _ = #v204
    local v205 = {
        ["Size"] = UDim2.fromScale(1, 0.35),
        ["Position"] = UDim2.fromScale(1, 0.8),
        ["AnchorPoint"] = Vector2.new(1, 1)
    }
    local v206 = { u15.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Right",
            ["VerticalAlignment"] = "Center",
            ["Padding"] = UDim.new(0, 30)
        }) }
    local v207 = #v206
    local v208 = {
        ["Size"] = UDim2.fromScale(0.25, 1)
    }
    local v209
    if v55[u43.id] == nil then
        v209 = nil
    else
        v209 = v55[u43.id][1]
    end
    v208.BanData = v209 and {
        ["Kit"] = v55[u43.id][1],
        ["LockedIn"] = true
    } or nil
    v206[v207 + 1] = u15.createElement(u34, v208)
    local v210 = {
        ["Size"] = UDim2.fromScale(0.25, 1)
    }
    local v211
    if v55[u43.id] == nil then
        v211 = nil
    else
        v211 = v55[u43.id][2]
    end
    v210.BanData = v211 and {
        ["Kit"] = v55[u43.id][2],
        ["LockedIn"] = true
    } or nil
    v206[v207 + 2] = u15.createElement(u34, v210)
    v204.Team1Bans = u15.createElement(u7, v205, v206)
    v193[v194 + 2] = u15.createElement(u7, v203, v204)
    local v212 = {
        ["Size"] = UDim2.fromScale(0.25, 1),
        ["Position"] = UDim2.fromScale(1, 0.5),
        ["AnchorPoint"] = Vector2.new(1, 0.5)
    }
    local v213 = {}
    local _ = #v213
    local v214 = {
        ["Size"] = UDim2.fromScale(1, 0.35),
        ["Position"] = UDim2.fromScale(1, 0.8),
        ["AnchorPoint"] = Vector2.new(1, 1)
    }
    local v215 = { u15.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Left",
            ["VerticalAlignment"] = "Center",
            ["Padding"] = UDim.new(0, 30)
        }) }
    local v216 = #v215
    local v217 = {
        ["Size"] = UDim2.fromScale(0.25, 1)
    }
    local v218 = {}
    local v219
    if v55[u44.id] == nil then
        v219 = nil
    else
        v219 = v55[u44.id][1]
    end
    v218.Kit = v219
    v218.LockedIn = true
    v217.BanData = v218
    v215[v216 + 1] = u15.createElement(u34, v217)
    local v220 = {
        ["Size"] = UDim2.fromScale(0.25, 1)
    }
    local v221 = {}
    local v222
    if v55[u44.id] == nil then
        v222 = nil
    else
        v222 = v55[u44.id][2]
    end
    v221.Kit = v222
    v221.LockedIn = true
    v220.BanData = v221
    v215[v216 + 2] = u15.createElement(u34, v220)
    v213.Team2Bans = u15.createElement(u7, v214, v215)
    v193[v194 + 3] = u15.createElement(u7, v212, v213)
    v191.HeaderContainer = u15.createElement(u7, v192, v193)
    local v223 = {
        ["Size"] = UDim2.fromScale(1, 0.75),
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        ["Position"] = UDim2.fromScale(0.5, 0.25)
    }
    local v224 = { u15.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 0),
            ["PaddingBottom"] = UDim.new(0.04, 0),
            ["PaddingLeft"] = UDim.new(0.04, 0),
            ["PaddingRight"] = UDim.new(0.04, 0)
        }) }
    local _ = #v224
    local v225 = u11
    local v226
    if u43 == nil then
        v226 = u43
    else
        v226 = u43.members
    end
    local v227 = v225.values(v226)
    local function v248(p228) --[[ Line: 1001 ]]
        --[[
        Upvalues:
            [1] = u53
            [2] = u6
            [3] = u18
            [4] = u38
            [5] = u29
            [6] = u30
            [7] = u51
            [8] = u183
            [9] = u43
            [10] = u189
            [11] = u15
            [12] = u36
        --]]
        local v229 = u53[p228.userId]
        if v229 ~= nil then
            v229 = v229.kit
        end
        local v230 = u6.isHoarceKat() and true or p228.userId == u18.LocalPlayer.UserId
        local v231 = false
        local v232 = u38.store.Draft.sharedData
        if v232 ~= nil then
            v232 = v232.matchDraftPhase
        end
        local v233
        if v232 == u29.BANNING then
            if u6.isHoarceKat() then
                v233 = false
            else
                local v234 = u53[p228.userId]
                if v234 ~= nil then
                    v234 = v234.selectorOption
                end
                v233 = v234 == u30.SELECT
            end
        else
            local v235 = u38.store.Draft.sharedData
            if v235 ~= nil then
                v235 = v235.matchDraftPhase
            end
            if v235 == u29.KIT_SELECT then
                if u6.isHoarceKat() then
                    v233 = false
                else
                    local v236 = u38.store.Draft.teamData.kitSelection
                    local v237 = p228.userId
                    local v238 = v236[tostring(v237)]
                    if v238 ~= nil then
                        v238 = v238.selectorOption
                    end
                    v233 = v238 == u30.SELECT
                end
            else
                local v239 = u38.store.Draft.sharedData
                if v239 ~= nil then
                    v239 = v239.matchDraftPhase
                end
                v233 = v239 == u29.BANNING_TRANSITION and true or v231
            end
        end
        local v240 = {}
        local v241 = u38.store.Draft.sharedData
        if v241 ~= nil then
            v241 = v241.matchDraftPhase
        end
        v240.HideBanBox = v241 ~= u29.BANNING
        local v242 = {
            ["Player"] = p228
        }
        local v243 = u51[p228.userId]
        if v243 ~= nil then
            v243 = v243.kit
        end
        v242.Kit = v243
        local v244 = u51[p228.userId]
        if v244 ~= nil then
            v244 = v244.selectorOption
        end
        v242.KitLockedIn = v244 == u30.SELECT
        v242.ActionText = u183(p228.userId)
        local v245 = u43
        if v245 ~= nil then
            v245 = v245.color
        end
        v242.TeamColor = v245
        v240.CardData = v242
        v240.BanData = {
            ["Kit"] = v229,
            ["Probability"] = not v229 and 0 or u189(v229),
            ["LockedIn"] = v233
        }
        v240.LayoutOrder = v230 and 0 or 1
        local v246 = {}
        local v247
        if v233 then
            v247 = Color3.fromRGB(128, 255, 133)
        elseif v230 then
            v247 = Color3.fromRGB(255, 217, 128)
        else
            v247 = nil
        end
        v246.Color = v247
        v246.DisableAnimation = v233
        v240.HighlightConfig = v246
        return u15.createElement(u36, v240)
    end
    local v249 = table.create(#v227)
    for v250, v251 in v227 do
        v249[v250] = v248(v251, v250 - 1, v227)
    end
    local v252 = {
        ["Size"] = UDim2.fromScale(0.22, 1),
        ["Position"] = UDim2.fromScale(0, 0),
        ["AnchorPoint"] = Vector2.new(0, 0)
    }
    local v253 = { u15.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["Padding"] = UDim.new(0.02, 0),
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }) }
    local v254 = #v253
    for v255, v256 in v249 do
        v253[v254 + v255] = v256
    end
    v224.Team1Column = u15.createElement(u7, v252, v253)
    local v257 = u11
    local v258
    if u44 == nil then
        v258 = u44
    else
        v258 = u44.members
    end
    local v259 = v257.values(v258)
    local function v280(p260) --[[ Line: 1128 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u29
            [3] = u6
            [4] = u44
            [5] = u51
            [6] = u30
            [7] = u183
            [8] = u15
            [9] = u36
        --]]
        local v261 = false
        local v262 = u38.store.Draft.sharedData
        if v262 ~= nil then
            v262 = v262.matchDraftPhase
        end
        local v263
        if v262 == u29.BANNING then
            if u6.isHoarceKat() then
                v263 = false
            else
                local v264 = u38.store.Draft.enemyTeamData[u44.id]
                if v264 ~= nil then
                    v264 = v264.playersVoted
                end
                local v265 = p260.userId
                v263 = v264[tostring(v265)] ~= nil
                if v263 == nil then
                    v263 = false
                end
            end
        else
            local v266 = u38.store.Draft.sharedData
            if v266 ~= nil then
                v266 = v266.matchDraftPhase
            end
            if v266 == u29.KIT_SELECT then
                if u6.isHoarceKat() then
                    v263 = false
                else
                    local v267 = u38.store.Draft.enemyTeamData[u44.id]
                    if v267 ~= nil then
                        v267 = v267.kitSelection
                    end
                    local v268 = p260.userId
                    v263 = v267[tostring(v268)] ~= nil
                    if v263 == nil then
                        v263 = false
                    end
                end
            else
                local v269 = u38.store.Draft.sharedData
                if v269 ~= nil then
                    v269 = v269.matchDraftPhase
                end
                v263 = v269 == u29.BANNING_TRANSITION and true or v261
            end
        end
        local v270 = {
            ["HideBanBox"] = true
        }
        local v271 = {
            ["Player"] = p260
        }
        local v272 = u38.store.Draft.enemyTeamData[u44.id]
        if v272 ~= nil then
            v272 = v272.kitSelection
        end
        local v273
        if v272 == nil then
            v273 = nil
        else
            local v274 = u38.store.Draft.enemyTeamData[u44.id]
            if v274 ~= nil then
                v274 = v274.kitSelection
            end
            local v275 = p260.userId
            v273 = v274[tostring(v275)]
            if v273 ~= nil then
                v273 = v273.kit
            end
            if v273 == nil then
                v273 = nil
            end
        end
        v271.Kit = v273
        local v276 = u51[p260.userId]
        if v276 ~= nil then
            v276 = v276.selectorOption
        end
        v271.KitLockedIn = v276 == u30.SELECT
        v271.ActionText = u183(p260.userId)
        local v277 = u44
        if v277 ~= nil then
            v277 = v277.color
        end
        v271.TeamColor = v277
        v270.CardData = v271
        local v278 = {
            ["Mode"] = "RIGHT"
        }
        local v279
        if v263 then
            v279 = Color3.fromRGB(128, 255, 133)
        else
            v279 = nil
        end
        v278.Color = v279
        v278.DisableAnimation = v263
        v270.HighlightConfig = v278
        return u15.createElement(u36, v270)
    end
    local v281 = table.create(#v259)
    for v282, v283 in v259 do
        v281[v282] = v280(v283, v282 - 1, v259)
    end
    local v284 = {
        ["Size"] = UDim2.fromScale(0.22, 1),
        ["Position"] = UDim2.fromScale(1, 0),
        ["AnchorPoint"] = Vector2.new(1, 0)
    }
    local v285 = { u15.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["Padding"] = UDim.new(0.02, 0)
        }) }
    local v286 = #v285
    for v287, v288 in v281 do
        v285[v286 + v287] = v288
    end
    v224.Team2Column = u15.createElement(u7, v284, v285)
    local v289 = {
        ["Size"] = UDim2.fromScale(0.5, 1),
        ["Position"] = UDim2.fromScale(0.5, 0),
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        [u15.Ref] = u62
    }
    local v290 = { u15.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Top",
            ["Padding"] = UDim.new(0.01, 0)
        }) }
    local v291 = #v290
    local v292 = {
        ["SelectionMode"] = "SELECTION_ONLY",
        ["Size"] = UDim2.fromScale(1, 0.9),
        ["store"] = u38.store,
        ["SelectedKit"] = u49,
        ["SetSelectedKit"] = u159
    }
    local v293 = u38.store.Draft.sharedData
    if v293 ~= nil then
        v293 = v293.matchDraftPhase
    end
    v292.ShowAllKits = v293 == u29.BANNING
    local v294 = u38.store.Draft.sharedData
    if v294 ~= nil then
        v294 = v294.matchDraftPhase
    end
    v292.ExcludeNonShopKits = v294 == u29.BANNING
    local v295 = u11.values(v55)
    local function v300(p296, p297) --[[ Line: 1299 ]]
        for v298, v299 in p297 do
            local _ = v298 - 1
            table.insert(p296, v299)
        end
        return p296
    end
    local v301 = {}
    for v302 = 1, #v295 do
        v301 = v300(v301, v295[v302], v302 - 1, v295)
    end
    v292.BannedKits = v301
    v290[v291 + 1] = u15.createElement(u22, v292)
    v290[v291 + 2] = u15.createElement(u4, {
        ["TextScaled"] = true,
        ["Size"] = UDim2.fromScale(0.4, 0.1),
        ["Text"] = string.upper(v172.text),
        ["BackgroundColor3"] = v172.backgroundColor,
        ["OnClick"] = v160,
        ["Disabled"] = v172.disabled
    }, { u15.createElement(u8, {
            ["Padding"] = UDim.new(0.15, 0)
        }) })
    v224.KitSelection = u15.createElement(u7, v289, v290)
    local v303 = {
        ["Size"] = UDim2.fromScale(0.5, 1),
        ["Position"] = UDim2.fromScale(0.5, 0),
        ["AnchorPoint"] = Vector2.new(0.5, 0)
    }
    local v304 = {}
    local v305 = #v304
    local v306 = u38.store.Draft.teamData
    if v306 ~= nil then
        v306 = v306.votedKitBans
    end
    if v306 then
        local v307 = u11.values(u38.store.Draft.teamData.votedKitBans)
        local function v317(p308, p309) --[[ Line: 1347 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u65
                [3] = u38
                [4] = u37
                [5] = u35
            --]]
            local v310 = u15.createRef()
            local v311 = u15.createRef()
            local v312 = {
                ["kit"] = p308.kit,
                ["imageLabelRef"] = v310,
                ["containerRef"] = v311
            }
            local v313 = u65
            table.insert(v313, v312)
            local v314 = {
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0)
            }
            local v315 = UDim2
            local v316 = 0
            for _ in u38.store.Draft.teamData.votedKitBans do
                v316 = v316 + 1
            end
            v314.Position = v315.fromScale(u37(v316)[p309 + 1], 0)
            v314.Kit = p308.kit
            v314[u15.Ref] = v311
            v314.imageLabelRef = v310
            return u15.createElement(u35, v314)
        end
        v306 = table.create(#v307)
        for v318, v319 in v307 do
            v306[v318] = v317(v319, v318 - 1, v307)
        end
    end
    local v320 = {
        ["Size"] = UDim2.fromScale(0.8, 0.25),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v321 = {}
    local v322 = #v321
    for v323, v324 in v306 do
        v321[v322 + v323] = v324
    end
    local v325 = #v321
    local v326 = u38.store.Draft.sharedData
    if v326 ~= nil then
        v326 = v326.kitBans[u44.id]
    end
    if v326 then
        local v327 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Position"] = UDim2.fromScale(1, 1),
            ["Kit"] = u38.store.Draft.sharedData.kitBans[u44.id][#u38.store.Draft.sharedData.kitBans[u44.id] - 1 + 1],
            [u15.Ref] = v64,
            ["imageLabelRef"] = u63
        }
        v326 = u15.createElement(u35, v327)
    end
    if v326 then
        v321[v325 + 1] = v326
    end
    v304[v305 + 1] = u15.createElement(u7, v320, v321)
    v224.KitSelectionOverlay = u15.createElement(u7, v303, v304)
    v191.BodyContainer = u15.createElement(u7, v223, v224)
    return u15.createElement(u7, v190, v191)
end
u37 = function(p329) --[[ Name: spaceEvenly, Line 1423 ]]
    if p329 <= 0 then
        return {}
    end
    if p329 == 1 then
        return { 0.5 }
    end
    local v330 = 1 / (p329 - 1)
    local v331 = false
    local v332 = 0
    local v333 = {}
    while true do
        if v331 then
            v332 = v332 + 1
        else
            v331 = true
        end
        if v332 >= p329 then
            return v333
        end
        local v334 = v332 * v330
        table.insert(v333, v334)
    end
end
return {
    ["MatchDraftTwoTeamsPage"] = v16.new(u15)(v328)
}