return function(u1, u2) --[[ Name: setupAnims, Line 3 ]]
    local u3 = u1:WaitForChild("Humanoid")
    local u4 = u2:FindFirstChild("ScaleDampeningPercent")
    local u5 = {}
    local u6 = {}
    local u7 = {
        ["idle"] = {
            {
                ["id"] = "http://www.roblox.com/asset/?id=507766666",
                ["weight"] = 1
            },
            {
                ["id"] = "http://www.roblox.com/asset/?id=507766951",
                ["weight"] = 1
            },
            {
                ["id"] = "http://www.roblox.com/asset/?id=507766388",
                ["weight"] = 9
            }
        },
        ["walk"] = {
            {
                ["id"] = "http://www.roblox.com/asset/?id=507777826",
                ["weight"] = 10
            }
        },
        ["run"] = {
            {
                ["id"] = "http://www.roblox.com/asset/?id=507767714",
                ["weight"] = 10
            }
        },
        ["swim"] = {
            {
                ["id"] = "http://www.roblox.com/asset/?id=507784897",
                ["weight"] = 10
            }
        },
        ["swimidle"] = {
            {
                ["id"] = "http://www.roblox.com/asset/?id=507785072",
                ["weight"] = 10
            }
        },
        ["jump"] = {
            {
                ["id"] = "http://www.roblox.com/asset/?id=507765000",
                ["weight"] = 10
            }
        },
        ["fall"] = {
            {
                ["id"] = "http://www.roblox.com/asset/?id=507767968",
                ["weight"] = 10
            }
        },
        ["climb"] = {
            {
                ["id"] = "http://www.roblox.com/asset/?id=507765644",
                ["weight"] = 10
            }
        },
        ["sit"] = {
            {
                ["id"] = "http://www.roblox.com/asset/?id=2506281703",
                ["weight"] = 10
            }
        },
        ["toolnone"] = {
            {
                ["id"] = "http://www.roblox.com/asset/?id=507768375",
                ["weight"] = 10
            }
        },
        ["toolslash"] = {
            {
                ["id"] = "http://www.roblox.com/asset/?id=522635514",
                ["weight"] = 10
            }
        },
        ["toollunge"] = {
            {
                ["id"] = "http://www.roblox.com/asset/?id=522638767",
                ["weight"] = 10
            }
        },
        ["wave"] = {
            {
                ["id"] = "http://www.roblox.com/asset/?id=507770239",
                ["weight"] = 10
            }
        },
        ["point"] = {
            {
                ["id"] = "http://www.roblox.com/asset/?id=507770453",
                ["weight"] = 10
            }
        },
        ["dance"] = {
            {
                ["id"] = "http://www.roblox.com/asset/?id=507771019",
                ["weight"] = 10
            },
            {
                ["id"] = "http://www.roblox.com/asset/?id=507771955",
                ["weight"] = 10
            },
            {
                ["id"] = "http://www.roblox.com/asset/?id=507772104",
                ["weight"] = 10
            }
        },
        ["dance2"] = {
            {
                ["id"] = "http://www.roblox.com/asset/?id=507776043",
                ["weight"] = 10
            },
            {
                ["id"] = "http://www.roblox.com/asset/?id=507776720",
                ["weight"] = 10
            },
            {
                ["id"] = "http://www.roblox.com/asset/?id=507776879",
                ["weight"] = 10
            }
        },
        ["dance3"] = {
            {
                ["id"] = "http://www.roblox.com/asset/?id=507777268",
                ["weight"] = 10
            },
            {
                ["id"] = "http://www.roblox.com/asset/?id=507777451",
                ["weight"] = 10
            },
            {
                ["id"] = "http://www.roblox.com/asset/?id=507777623",
                ["weight"] = 10
            }
        },
        ["laugh"] = {
            {
                ["id"] = "http://www.roblox.com/asset/?id=507770818",
                ["weight"] = 10
            }
        },
        ["cheer"] = {
            {
                ["id"] = "http://www.roblox.com/asset/?id=507770677",
                ["weight"] = 10
            }
        }
    }
    math.randomseed(tick())
    function findExistingAnimationInSet(p8, p9)
        if p8 == nil or p9 == nil then
            return 0
        end
        for v10 = 1, p8.count do
            if p8[v10].anim.AnimationId == p9.AnimationId then
                return v10
            end
        end
        return 0
    end
    function configureAnimationSet(u11, u12)
        --[[
        Upvalues:
            [1] = u6
            [2] = u2
            [3] = u5
            [4] = u3
        --]]
        if u6[u11] ~= nil then
            for _, v13 in pairs(u6[u11].connections) do
                v13:disconnect()
            end
        end
        u6[u11] = {}
        u6[u11].count = 0
        u6[u11].totalWeight = 0
        u6[u11].connections = {}
        local u14 = true
        local v15, _ = pcall(function() --[[ Line: 137 ]]
            --[[
            Upvalues:
                [1] = u14
            --]]
            u14 = game:GetService("StarterPlayer").AllowCustomAnimations
        end)
        u14 = not v15 and true or u14
        local v16 = u2:FindFirstChild(u11)
        if u14 and v16 ~= nil then
            local v17 = u6[u11].connections
            local v18 = v16.ChildAdded
            table.insert(v17, v18:connect(function(_) --[[ Line: 145 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u12
                --]]
                configureAnimationSet(u11, u12)
            end))
            local v19 = u6[u11].connections
            local v20 = v16.ChildRemoved
            table.insert(v19, v20:connect(function(_) --[[ Line: 146 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u12
                --]]
                configureAnimationSet(u11, u12)
            end))
            for _, v21 in pairs(v16:GetChildren()) do
                if v21:IsA("Animation") then
                    local v22 = v21:FindFirstChild("Weight")
                    local v23 = v22 == nil and 1 or v22.Value
                    u6[u11].count = u6[u11].count + 1
                    local v24 = u6[u11].count
                    u6[u11][v24] = {}
                    u6[u11][v24].anim = v21
                    u6[u11][v24].weight = v23
                    u6[u11].totalWeight = u6[u11].totalWeight + u6[u11][v24].weight
                    local v25 = u6[u11].connections
                    local v26 = v21.Changed
                    table.insert(v25, v26:connect(function(_) --[[ Line: 162 ]]
                        --[[
                        Upvalues:
                            [1] = u11
                            [2] = u12
                        --]]
                        configureAnimationSet(u11, u12)
                    end))
                    local v27 = u6[u11].connections
                    local v28 = v21.ChildAdded
                    table.insert(v27, v28:connect(function(_) --[[ Line: 163 ]]
                        --[[
                        Upvalues:
                            [1] = u11
                            [2] = u12
                        --]]
                        configureAnimationSet(u11, u12)
                    end))
                    local v29 = u6[u11].connections
                    local v30 = v21.ChildRemoved
                    table.insert(v29, v30:connect(function(_) --[[ Line: 164 ]]
                        --[[
                        Upvalues:
                            [1] = u11
                            [2] = u12
                        --]]
                        configureAnimationSet(u11, u12)
                    end))
                end
            end
        end
        if u6[u11].count <= 0 then
            for v31, v32 in pairs(u12) do
                u6[u11][v31] = {}
                u6[u11][v31].anim = Instance.new("Animation")
                u6[u11][v31].anim.Name = u11
                u6[u11][v31].anim.AnimationId = v32.id
                u6[u11][v31].weight = v32.weight
                u6[u11].count = u6[u11].count + 1
                u6[u11].totalWeight = u6[u11].totalWeight + v32.weight
            end
        end
        for _, v33 in pairs(u6) do
            for v34 = 1, v33.count do
                if u5[v33[v34].anim.AnimationId] == nil then
                    u3:LoadAnimation(v33[v34].anim)
                    u5[v33[v34].anim.AnimationId] = true
                end
            end
        end
    end
    function configureAnimationSetOld(u35, u36)
        --[[
        Upvalues:
            [1] = u6
            [2] = u2
            [3] = u3
        --]]
        if u6[u35] ~= nil then
            for _, v37 in pairs(u6[u35].connections) do
                v37:disconnect()
            end
        end
        u6[u35] = {}
        u6[u35].count = 0
        u6[u35].totalWeight = 0
        u6[u35].connections = {}
        local u38 = true
        local v39, _ = pcall(function() --[[ Line: 208 ]]
            --[[
            Upvalues:
                [1] = u38
            --]]
            u38 = game:GetService("StarterPlayer").AllowCustomAnimations
        end)
        u38 = not v39 and true or u38
        local v40 = u2:FindFirstChild(u35)
        if u38 and v40 ~= nil then
            local v41 = u6[u35].connections
            local v42 = v40.ChildAdded
            table.insert(v41, v42:connect(function(_) --[[ Line: 216 ]]
                --[[
                Upvalues:
                    [1] = u35
                    [2] = u36
                --]]
                configureAnimationSet(u35, u36)
            end))
            local v43 = u6[u35].connections
            local v44 = v40.ChildRemoved
            table.insert(v43, v44:connect(function(_) --[[ Line: 217 ]]
                --[[
                Upvalues:
                    [1] = u35
                    [2] = u36
                --]]
                configureAnimationSet(u35, u36)
            end))
            local v45 = 1
            for _, v46 in pairs(v40:GetChildren()) do
                if v46:IsA("Animation") then
                    local v47 = u6[u35].connections
                    local v48 = v46.Changed
                    table.insert(v47, v48:connect(function(_) --[[ Line: 221 ]]
                        --[[
                        Upvalues:
                            [1] = u35
                            [2] = u36
                        --]]
                        configureAnimationSet(u35, u36)
                    end))
                    u6[u35][v45] = {}
                    u6[u35][v45].anim = v46
                    local v49 = v46:FindFirstChild("Weight")
                    if v49 == nil then
                        u6[u35][v45].weight = 1
                    else
                        u6[u35][v45].weight = v49.Value
                    end
                    u6[u35].count = u6[u35].count + 1
                    u6[u35].totalWeight = u6[u35].totalWeight + u6[u35][v45].weight
                    v45 = v45 + 1
                end
            end
        end
        if u6[u35].count <= 0 then
            for v50, v51 in pairs(u36) do
                u6[u35][v50] = {}
                u6[u35][v50].anim = Instance.new("Animation")
                u6[u35][v50].anim.Name = u35
                u6[u35][v50].anim.AnimationId = v51.id
                u6[u35][v50].weight = v51.weight
                u6[u35].count = u6[u35].count + 1
                u6[u35].totalWeight = u6[u35].totalWeight + v51.weight
            end
        end
        for _, v52 in pairs(u6) do
            for v53 = 1, v52.count do
                u3:LoadAnimation(v52[v53].anim)
            end
        end
    end
    function scriptChildModified(p54)
        --[[
        Upvalues:
            [1] = u7
        --]]
        local v55 = u7[p54.Name]
        if v55 ~= nil then
            configureAnimationSet(p54.Name, v55)
        end
    end
    u2.ChildAdded:connect(scriptChildModified)
    u2.ChildRemoved:connect(scriptChildModified)
    local u56 = 1
    local u57 = "Standing"
    local u58 = ""
    local u59 = {
        ["wave"] = false,
        ["point"] = false,
        ["dance"] = true,
        ["dance2"] = true,
        ["dance3"] = true,
        ["laugh"] = false,
        ["cheer"] = false
    }
    local u60 = nil
    local u61 = nil
    local u62 = nil
    local u63 = nil
    local u64 = nil
    for v65, v66 in pairs(u7) do
        configureAnimationSet(v65, v66)
    end
    local u67 = "None"
    local u68 = 0
    local u69 = 0
    local u70 = false
    function stopAllAnimations()
        --[[
        Upvalues:
            [1] = u58
            [2] = u59
            [3] = u60
            [4] = u61
            [5] = u62
            [6] = u63
            [7] = u64
        --]]
        local v71 = u58
        local v72 = u59[v71] ~= nil and u59[v71] == false and "idle" or v71
        u58 = ""
        u60 = nil
        if u61 ~= nil then
            u61:disconnect()
        end
        if u62 ~= nil then
            u62:Stop()
            u62:Destroy()
            u62 = nil
        end
        if u63 ~= nil then
            u63:disconnect()
        end
        if u64 ~= nil then
            u64:Stop()
            u64:Destroy()
            u64 = nil
        end
        return v72
    end
    function getHeightScale()
        --[[
        Upvalues:
            [1] = u3
            [2] = u4
            [3] = u2
        --]]
        if not u3 then
            return 1
        end
        if not u3.AutomaticScalingEnabled then
            return 1
        end
        local v73 = u3.HipHeight / 2
        if u4 == nil then
            u4 = u2:FindFirstChild("ScaleDampeningPercent")
        end
        if u4 ~= nil then
            v73 = 1 + (u3.HipHeight - 2) * u4.Value / 2
        end
        return v73
    end
    local function u80(p74) --[[ Line: 356 ]]
        --[[
        Upvalues:
            [1] = u62
            [2] = u64
        --]]
        local v75 = p74 * 1.25 / getHeightScale()
        local v76 = 0.0001
        local v77 = v75 / 0.5
        local v78 = v75 / 1
        local v79
        if v75 <= 0.5 then
            v76 = 1
            v79 = 0.0001
        elseif v75 < 1 then
            v79 = (v75 - 0.5) / 0.5
            v76 = 1 - v79
            v77 = 1
            v78 = 1
        else
            v79 = 1
        end
        u62:AdjustWeight(v76)
        u64:AdjustWeight(v79)
        u62:AdjustSpeed(v77)
        u64:AdjustSpeed(v78)
    end
    function setAnimationSpeed(p81)
        --[[
        Upvalues:
            [1] = u58
            [2] = u80
            [3] = u56
            [4] = u62
        --]]
        if u58 == "walk" then
            u80(p81)
        elseif p81 ~= u56 then
            u56 = p81
            u62:AdjustSpeed(u56)
        end
    end
    function keyFrameReachedFunc(p82)
        --[[
        Upvalues:
            [1] = u58
            [2] = u64
            [3] = u62
            [4] = u59
            [5] = u56
            [6] = u3
        --]]
        if p82 == "End" then
            if u58 == "walk" then
                u64.TimePosition = 0
                u62.TimePosition = 0
                return
            end
            local v83 = u58
            local v84 = u59[v83] ~= nil and u59[v83] == false and "idle" or v83
            local v85 = u56
            playAnimation(v84, 0.15, u3)
            setAnimationSpeed(v85)
        end
    end
    function rollAnimation(p86)
        --[[
        Upvalues:
            [1] = u6
        --]]
        local v87 = math.random(1, u6[p86].totalWeight)
        local v88 = 1
        while u6[p86][v88].weight < v87 do
            v87 = v87 - u6[p86][v88].weight
            v88 = v88 + 1
        end
        return v88
    end
    local function u94(p89, p90, p91, p92) --[[ Line: 443 ]]
        --[[
        Upvalues:
            [1] = u60
            [2] = u62
            [3] = u64
            [4] = u56
            [5] = u58
            [6] = u61
            [7] = u6
            [8] = u63
        --]]
        if p89 ~= u60 then
            if u62 ~= nil then
                u62:Stop(p91)
                u62:Destroy()
            end
            if u64 ~= nil then
                u64:Stop(p91)
                u64:Destroy()
            end
            u56 = 1
            u62 = p92:LoadAnimation(p89)
            u62.Priority = Enum.AnimationPriority.Core
            u62:Play(p91)
            u58 = p90
            u60 = p89
            if u61 ~= nil then
                u61:disconnect()
            end
            u61 = u62.KeyframeReached:connect(keyFrameReachedFunc)
            if p90 == "walk" then
                local v93 = rollAnimation("run")
                u64 = p92:LoadAnimation(u6.run[v93].anim)
                u64.Priority = Enum.AnimationPriority.Core
                u64:Play(p91)
                if u63 ~= nil then
                    u63:disconnect()
                end
                u63 = u64.KeyframeReached:connect(keyFrameReachedFunc)
            end
        end
    end
    function playAnimation(p95, p96, p97)
        --[[
        Upvalues:
            [1] = u6
            [2] = u94
            [3] = u70
        --]]
        local v98 = rollAnimation(p95)
        u94(u6[p95][v98].anim, p95, p96, p97)
        u70 = false
    end
    function playEmote(p99, p100, p101)
        --[[
        Upvalues:
            [1] = u94
            [2] = u70
        --]]
        u94(p99, p99.Name, p100, p101)
        u70 = true
    end
    local u102 = ""
    local u103 = nil
    local u104 = nil
    local u105 = nil
    function toolKeyFrameReachedFunc(p106)
        --[[
        Upvalues:
            [1] = u102
            [2] = u3
        --]]
        if p106 == "End" then
            playToolAnimation(u102, 0, u3)
        end
    end
    function playToolAnimation(p107, p108, p109, p110)
        --[[
        Upvalues:
            [1] = u6
            [2] = u104
            [3] = u103
            [4] = u102
            [5] = u105
        --]]
        local v111 = rollAnimation(p107)
        local v112 = u6[p107][v111].anim
        if u104 ~= v112 then
            if u103 ~= nil then
                u103:Stop()
                u103:Destroy()
                p108 = 0
            end
            u103 = p109:LoadAnimation(v112)
            if p110 then
                u103.Priority = p110
            end
            u103:Play(p108)
            u102 = p107
            u104 = v112
            u105 = u103.KeyframeReached:connect(toolKeyFrameReachedFunc)
        end
    end
    function stopToolAnimations()
        --[[
        Upvalues:
            [1] = u102
            [2] = u105
            [3] = u104
            [4] = u103
        --]]
        local v113 = u102
        if u105 ~= nil then
            u105:disconnect()
        end
        u102 = ""
        u104 = nil
        if u103 ~= nil then
            u103:Stop()
            u103:Destroy()
            u103 = nil
        end
        return v113
    end
    function onRunning(p114)
        --[[
        Upvalues:
            [1] = u3
            [2] = u57
            [3] = u59
            [4] = u58
            [5] = u70
        --]]
        if p114 > 0.75 then
            playAnimation("walk", 0.2, u3)
            setAnimationSpeed(p114 / 16)
            u57 = "Running"
        elseif u59[u58] == nil and not u70 then
            playAnimation("idle", 0.2, u3)
            u57 = "Standing"
        end
    end
    function onDied()
        --[[
        Upvalues:
            [1] = u57
        --]]
        u57 = "Dead"
    end
    function onJumping()
        --[[
        Upvalues:
            [1] = u3
            [2] = u69
            [3] = u57
        --]]
        playAnimation("jump", 0.1, u3)
        u69 = 0.31
        u57 = "Jumping"
    end
    function onClimbing(p115)
        --[[
        Upvalues:
            [1] = u3
            [2] = u57
        --]]
        playAnimation("climb", 0.1, u3)
        setAnimationSpeed(p115 / 5)
        u57 = "Climbing"
    end
    function onGettingUp()
        --[[
        Upvalues:
            [1] = u57
        --]]
        u57 = "GettingUp"
    end
    function onFreeFall()
        --[[
        Upvalues:
            [1] = u69
            [2] = u3
            [3] = u57
        --]]
        if u69 <= 0 then
            playAnimation("fall", 0.2, u3)
        end
        u57 = "FreeFall"
    end
    function onFallingDown()
        --[[
        Upvalues:
            [1] = u57
        --]]
        u57 = "FallingDown"
    end
    function onSeated()
        --[[
        Upvalues:
            [1] = u57
        --]]
        u57 = "Seated"
    end
    function onPlatformStanding()
        --[[
        Upvalues:
            [1] = u57
        --]]
        u57 = "PlatformStanding"
    end
    function onSwimming(p116)
        --[[
        Upvalues:
            [1] = u3
            [2] = u57
        --]]
        if p116 > 1 then
            playAnimation("swim", 0.4, u3)
            setAnimationSpeed(p116 / 10)
            u57 = "Swimming"
        else
            playAnimation("swimidle", 0.4, u3)
            u57 = "Standing"
        end
    end
    function animateTool()
        --[[
        Upvalues:
            [1] = u67
            [2] = u3
        --]]
        if u67 == "None" then
            playToolAnimation("toolnone", 0.1, u3, Enum.AnimationPriority.Idle)
            return
        elseif u67 == "Slash" then
            playToolAnimation("toolslash", 0, u3, Enum.AnimationPriority.Action)
            return
        elseif u67 == "Lunge" then
            playToolAnimation("toollunge", 0, u3, Enum.AnimationPriority.Action)
        end
    end
    function getToolAnim(p117)
        for _, v118 in ipairs(p117:GetChildren()) do
            if v118.Name == "toolanim" and v118.className == "StringValue" then
                return v118
            end
        end
        return nil
    end
    local u119 = 0
    function stepAnimate(p120)
        --[[
        Upvalues:
            [1] = u119
            [2] = u69
            [3] = u57
            [4] = u3
            [5] = u1
            [6] = u67
            [7] = u68
            [8] = u104
        --]]
        local v121 = p120 - u119
        u119 = p120
        if u69 > 0 then
            u69 = u69 - v121
        end
        if u57 == "FreeFall" and u69 <= 0 then
            playAnimation("fall", 0.2, u3)
        else
            if u57 == "Seated" then
                playAnimation("sit", 0.5, u3)
                return
            end
            if u57 == "Running" then
                playAnimation("walk", 0.2, u3)
            elseif u57 == "Dead" or (u57 == "GettingUp" or (u57 == "FallingDown" or (u57 == "Seated" or u57 == "PlatformStanding"))) then
                stopAllAnimations()
            end
        end
        local v122 = u1:FindFirstChildOfClass("Tool")
        if v122 and v122:FindFirstChild("Handle") then
            local v123 = getToolAnim(v122)
            if v123 then
                u67 = v123.Value
                v123.Parent = nil
                u68 = p120 + 0.3
            end
            if u68 < p120 then
                u68 = 0
                u67 = "None"
            end
            animateTool()
        else
            stopToolAnimations()
            u67 = "None"
            u104 = nil
            u68 = 0
        end
    end
    local u124 = {}
    local v125 = u3.Died
    local v126 = onDied
    table.insert(u124, v125:connect(v126))
    local v127 = u3.Running
    local v128 = onRunning
    table.insert(u124, v127:connect(v128))
    local v129 = u3.Jumping
    local v130 = onJumping
    table.insert(u124, v129:connect(v130))
    playAnimation("idle", 0.1, u3)
    local _ = "Standing"
    local u131 = true
    task.defer(function() --[[ Line: 748 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u131
        --]]
        while u1.Parent ~= nil and u131 == true do
            local _, v132 = wait(0.1)
            stepAnimate(v132)
        end
    end)
    return function() --[[ Line: 755 ]]
        --[[
        Upvalues:
            [1] = u131
            [2] = u124
        --]]
        u131 = false
        for _, v133 in pairs(u124) do
            v133:Disconnect()
        end
    end
end