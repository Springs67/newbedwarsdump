local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.SoundManager
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.RunService
local u11 = v9.TweenService
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
return {
    ["MatchExpProgressionCore"] = v8.new(u7)(function(u13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u5
            [3] = u12
            [4] = u11
            [5] = u1
            [6] = u6
            [7] = u10
            [8] = u4
            [9] = u3
        --]]
        local v15 = p14.useState
        local v16 = p14.useEffect
        local v17, u18 = v15(u13.MatchExperienceEarned.reasons[1])
        local u19, u20 = v15(false)
        local v21, u22 = v15(0)
        local u23, u24 = v15(u13.InitialExpProgress)
        local v25, u26 = v15(u23)
        local u27, u28 = v15(u13.LevelAfterExp)
        local u29, u30 = v15(0)
        local v31
        if v17 == nil then
            v31 = v17
        else
            v31 = v17.experience
        end
        local u32 = u23 - (v31 == nil and 0 or v31)
        local u33 = u7.createRef()
        local v34 = u7.createRef()
        local v35 = u13.Color or Color3.fromRGB(122, 255, 82)
        local u36 = u7.createRef()
        local v37 = u7.createRef()
        local v38 = u7.createRef()
        v16(function() --[[ Line: 55 ]]
            --[[
            Upvalues:
                [1] = u36
                [2] = u27
                [3] = u29
                [4] = u13
                [5] = u23
                [6] = u28
                [7] = u30
                [8] = u26
                [9] = u5
                [10] = u12
                [11] = u11
                [12] = u1
                [13] = u32
            --]]
            local u39 = u36:getValue()
            local function u43() --[[ Line: 57 ]]
                --[[
                Upvalues:
                    [1] = u27
                    [2] = u29
                    [3] = u13
                    [4] = u23
                --]]
                local v40 = u27 - u29
                local v41 = false
                local v42 = 0
                while true do
                    if v41 then
                        v40 = v40 + 1
                    else
                        v41 = true
                    end
                    if v40 >= u27 then
                        return u23 - v42
                    end
                    v42 = v42 + u13.GetExpForLevel(v40)
                end
            end
            local function u49() --[[ Line: 76 ]]
                --[[
                Upvalues:
                    [1] = u27
                    [2] = u29
                    [3] = u13
                    [4] = u23
                --]]
                local v44 = u27 + 1
                local v45 = u29 + 1
                local v46 = v44
                local v47 = false
                local v48 = 0
                while true do
                    if v47 then
                        v44 = v44 - 1
                    else
                        v47 = true
                    end
                    if v46 - v45 >= v44 then
                        return u23 - v48
                    end
                    v48 = v48 + u13.GetExpForLevel(v44)
                end
            end
            local function v54() --[[ Line: 108 ]]
                --[[
                Upvalues:
                    [1] = u49
                    [2] = u11
                    [3] = u39
                    [4] = u28
                    [5] = u27
                    [6] = u30
                    [7] = u29
                    [8] = u26
                    [9] = u13
                    [10] = u5
                    [11] = u12
                    [12] = u1
                --]]
                local v50 = u49()
                local v51 = u11:Create(u39, TweenInfo.new(0.125, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                    ["Size"] = UDim2.fromScale(1, 1)
                })
                u28(u27 + 1)
                u30(u29 + 1)
                u26(v50)
                if not u13.DisableSound then
                    u5:playSound(u12.BATTLE_PASS_PROGRESS_LEVEL_UP)
                end
                local u52 = u11:Create(u39, TweenInfo.new(0.001), {
                    ["Size"] = UDim2.fromScale(0, 1)
                })
                local u53 = u11:Create(u39, TweenInfo.new(0.125, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                    ["Size"] = UDim2.fromScale(v50 / u13.GetExpForLevel(u27 + 1), 1)
                })
                v51:Play()
                u1.Promise.fromEvent(v51.Completed):andThen(function() --[[ Line: 124 ]]
                    --[[
                    Upvalues:
                        [1] = u52
                    --]]
                    u52:Play()
                end)
                u1.Promise.fromEvent(u52.Completed):andThen(function() --[[ Line: 129 ]]
                    --[[
                    Upvalues:
                        [1] = u53
                        [2] = u13
                        [3] = u5
                        [4] = u12
                    --]]
                    u53:Play()
                    if not u13.DisableSound then
                        u5:playSound(u12.BATTLE_PASS_PROGRESS_EXP_GAIN)
                    end
                end)
            end
            local function v63() --[[ Line: 137 ]]
                --[[
                Upvalues:
                    [1] = u43
                    [2] = u11
                    [3] = u36
                    [4] = u13
                    [5] = u27
                    [6] = u26
                    [7] = u5
                    [8] = u12
                --]]
                local v55 = u43()
                local v56 = u11
                local v57 = u36:getValue()
                local v58 = TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)
                local v59 = {}
                local v60 = UDim2.fromScale
                local v61 = v55 / u13.GetExpForLevel(u27 + 1)
                v59.Size = v60(math.min(v61, 1), 1)
                local v62 = v56:Create(v57, v58, v59)
                u26(v55)
                v62:Play()
                if not u13.DisableSound then
                    u5:playSound(u12.BATTLE_PASS_PROGRESS_EXP_GAIN)
                end
            end
            local v64 = u13.GetExpForLevel(u27 + 1, true) - u13.GetExpForLevel(u27 - u29, true)
            if v64 < u23 and u32 < v64 then
                if u13.DisableAnimation then
                    local v65 = u49()
                    u28(u27 + 1)
                    u30(u29 + 1)
                    u26(v65)
                    if not u13.DisableSound then
                        u5:playSound(u12.BATTLE_PASS_PROGRESS_LEVEL_UP)
                    end
                    u26(v65)
                    u39.Size = UDim2.fromScale(v65 / u13.GetExpForLevel(u27 + 1), 1)
                else
                    v54()
                end
            elseif u13.DisableAnimation then
                local v66 = UDim2.fromScale
                local v67 = u23 / u13.GetExpForLevel(u27 + 1)
                u39.Size = v66(math.min(v67, 1), 1)
                u26(u23)
            else
                v63()
            end
        end, { u23 })
        v16(function() --[[ Line: 168 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u23
                [3] = u13
                [4] = u33
                [5] = u20
                [6] = u22
                [7] = u24
                [8] = u11
                [9] = u18
                [10] = u19
                [11] = u10
                [12] = u1
            --]]
            local u68 = u6.new()
            local u69 = true
            local u70 = 0
            local u71 = u23
            local u72 = 0
            local u73 = 0
            local u74 = u13.MatchExperienceEarned.reasons
            local v75 = u33:getValue()
            if not u13.DisableAnimation then
                local u76 = u11:Create(v75, TweenInfo.new(0.25), {
                    ["TextTransparency"] = 0,
                    ["Position"] = UDim2.fromScale(0, 0)
                })
                local u77 = u11:Create(v75, TweenInfo.new(0.001), {
                    ["TextTransparency"] = 1,
                    ["Position"] = UDim2.fromScale(0.1, 0)
                })
                local function u80() --[[ Line: 201 ]]
                    --[[
                    Upvalues:
                        [1] = u72
                        [2] = u74
                        [3] = u18
                        [4] = u70
                        [5] = u22
                        [6] = u71
                        [7] = u24
                        [8] = u76
                        [9] = u19
                        [10] = u20
                    --]]
                    if u72 < #u74 then
                        u18(u74[u72 + 1])
                        u70 = u70 + u74[u72 + 1].experience
                        u22(u70)
                        u71 = u71 + u74[u72 + 1].experience
                        u24(u71)
                        local v78 = u76
                        if v78 ~= nil then
                            v78:Play()
                            return
                        end
                    elseif not u19 then
                        u20(true)
                        local v79 = u76
                        if v79 ~= nil then
                            v79:Play()
                        end
                    end
                end
                u68:GiveTask(u10.Heartbeat:Connect(function(p81) --[[ Line: 220 ]]
                    --[[
                    Upvalues:
                        [1] = u73
                        [2] = u69
                        [3] = u80
                        [4] = u1
                        [5] = u76
                        [6] = u72
                        [7] = u74
                        [8] = u68
                        [9] = u77
                    --]]
                    u73 = u73 + p81
                    if u73 >= 1.5 and u69 then
                        u73 = u73 - 1.5
                        u80()
                        u1.Promise.fromEvent(u76.Completed):andThen(function() --[[ Line: 226 ]]
                            --[[
                            Upvalues:
                                [1] = u72
                                [2] = u74
                                [3] = u68
                                [4] = u77
                            --]]
                            if u72 >= #u74 + 1 then
                                u68:DoCleaning()
                            else
                                wait(1.1)
                                local v82 = u77
                                if v82 ~= nil then
                                    v82:Play()
                                end
                            end
                        end)
                        u72 = u72 + 1
                    end
                end))
                return function() --[[ Line: 242 ]]
                    --[[
                    Upvalues:
                        [1] = u69
                        [2] = u68
                    --]]
                    u69 = false
                    u68:DoCleaning()
                end
            end
            v75.TextTransparency = 0
            v75.Position = UDim2.fromScale(0, 0)
            u20(true)
            for v83, v84 in u74 do
                local _ = v83 - 1
                local v85 = u70 + v84.experience
                u70 = v85
            end
            u22(u70)
            u24(u71 + u70)
            return nil
        end, {})
        local v86 = {
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = u13.Size,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = u13.LayoutOrder,
            [u7.Ref] = v34
        }
        local v87 = { (u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 10)
            })) }
        local v88 = u7.createElement
        local v89 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, u4.isSmallScreen() and 15 or 30),
            ["BackgroundColor3"] = u3.BLACK
        }
        local v90 = {
            ["CurrentLevel"] = u7.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Position"] = UDim2.fromScale(0, 1),
                ["AnchorPoint"] = Vector2.new(0, 1),
                ["Text"] = "Level " .. tostring(u27),
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Bottom,
                ["TextColor3"] = u3.WHITE,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextSize"] = u4.isSmallScreen() and 14 or 18
            })
        }
        local v91 = u7.createElement
        local v92 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(1, 1),
            ["BackgroundTransparency"] = 1
        }
        local v93 = u27 + 1
        v92.Text = "Level " .. tostring(v93)
        v92.TextXAlignment = Enum.TextXAlignment.Right
        v92.TextYAlignment = Enum.TextYAlignment.Bottom
        v92.TextTransparency = 0.3
        v92.TextColor3 = u3.WHITE
        v92.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        v92.TextSize = u4.isSmallScreen() and 14 or 18
        v92[u7.Ref] = v38
        v90.NextLevel = v91("TextLabel", v92)
        local v94 = u7.createElement
        local v95 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Position"] = UDim2.fromScale(0.5, 0),
            ["BackgroundTransparency"] = 1
        }
        local v96 = u13.Title
        v95.Text = tostring(v96)
        v95.TextColor3 = u3.WHITE
        v95.TextYAlignment = Enum.TextYAlignment.Top
        v95.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        v95.TextSize = u4.isSmallScreen() and 16 or 24
        v95[u7.Ref] = v37
        v90.ProgressionTitle = v94("TextLabel", v95)
        v87.LevelContainer = v88("Frame", v89, v90)
        local v97 = u7.createElement
        local v98 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0.7,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(1, 0, 0, u4.isSmallScreen() and 8 or 16),
            ["BackgroundColor3"] = u3.BLACK
        }
        local v99 = {}
        local v100 = u7.createElement
        local v101 = {}
        local v102 = UDim2.fromScale
        local v103 = u13.LevelAfterExp
        local v104 = u13.MatchExperienceEarned.startingExperience / u13.GetExpForLevel(v103 + 1)
        v101.Size = v102(math.min(v104, 1), 1)
        v101.BackgroundColor3 = v35
        v101.BorderSizePixel = 0
        v101.BackgroundTransparency = 0
        v101.ZIndex = 2
        v101[u7.Ref] = u36
        v99.CurrProgress = v100("Frame", v101)
        v99.TotalProgress = u7.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0,
            ["ZIndex"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u3.hexColor(5132418)
        })
        v87.ProgressBar = v97("Frame", v98, v99)
        local _ = #v87
        local v105 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(1, 0),
            ["AutomaticSize"] = Enum.AutomaticSize.Y,
            ["BackgroundColor3"] = u3.BLACK
        }
        local v106 = {}
        local _ = #v106
        local v107 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0),
            ["AutomaticSize"] = Enum.AutomaticSize.Y,
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["Position"] = UDim2.fromScale(0, 0)
        }
        local v108
        if u19 then
            local v109 = u3.richTextColor(v35)
            local v110 = math.floor(v21)
            v108 = "<b><font color=\"" .. v109 .. "\">" .. tostring(v110) .. "</font> TOTAL XP EARNED</b>"
        else
            local v111
            if v17 == nil then
                v111 = v17
            else
                v111 = string.upper(v17.name)
            end
            local v112 = u3.richTextColor(v35)
            local v113 = math
            if v17 ~= nil then
                v17 = v17.experience
            end
            local v114 = v17 == nil and 0 or v17
            local v115 = tostring(v111)
            local v116 = v113.ceil(v114)
            v108 = "<b>" .. v115 .. " <font color=\"" .. v112 .. "\">+" .. tostring(v116) .. "</font></b>"
        end
        v107.Text = v108
        v107.TextColor3 = u3.WHITE
        v107.TextTransparency = 1
        v107.RichText = true
        v107.Font = Enum.Font.Roboto
        v107.TextSize = u4.isSmallScreen() and 15 or 20
        v107[u7.Ref] = u33
        v107.TextXAlignment = Enum.TextXAlignment.Left
        v106.ReasonExpDisplay = u7.createElement("TextLabel", v107)
        local v117 = u7.createElement
        local v118 = {
            ["Size"] = UDim2.fromScale(1, 0),
            ["AutomaticSize"] = Enum.AutomaticSize.Y,
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["Position"] = UDim2.fromScale(1, 0),
            ["BackgroundTransparency"] = 1
        }
        local v119 = math.floor(v25)
        local v120 = tostring(v119)
        local v121 = u13.GetExpForLevel
        local v122 = u27 + 1
        v118.Text = "<b>" .. v120 .. " / " .. tostring(v121(v122)) .. "</b>"
        v118.TextColor3 = u3.WHITE
        v118.TextXAlignment = Enum.TextXAlignment.Right
        v118.RichText = true
        v118.Font = Enum.Font.Roboto
        v118.TextSize = 16
        v118[u7.Ref] = v37
        v106.ExpProgress = v117("TextLabel", v118)
        v87.ExpContainer = u7.createElement("Frame", v105, v106)
        return u7.createFragment({
            ["ProgressionWrapper"] = u7.createElement("Frame", v86, v87)
        })
    end)
}