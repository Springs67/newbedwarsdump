local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "hotbar", "ui", "healthbar", "healthbar").Healthbar
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shield", "shield-type").ShieldType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u18 = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local v108 = v10.new(u9)(function(u19, p20) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u9
        [3] = u8
        [4] = u14
        [5] = u7
        [6] = u16
        [7] = u12
        [8] = u18
        [9] = u4
        [10] = u6
        [11] = u15
        [12] = u5
        [13] = u13
        [14] = u3
    --]]
    local v21 = p20.useState
    local v22 = p20.useEffect
    local v23, u24 = v21(1)
    local v25, u26 = v21(0)
    local v27, u28 = v21(nil)
    local v29, u30 = v21(0)
    local v31 = u19.LocalPlayerTeam
    if v31 ~= nil then
        v31 = v31.id
    end
    local v32 = tonumber(v31)
    if v27 ~= nil then
        v27 = v27.id
    end
    local v33
    if v32 == tonumber(v27) then
        v33 = u17.mcGreen
    else
        v33 = u17.mcRed
    end
    if u19.barColor then
        v33 = u19.barColor
    end
    local u34 = u9.createRef()
    v22(function() --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u34
            [3] = u14
            [4] = u19
            [5] = u24
            [6] = u7
            [7] = u16
            [8] = u26
            [9] = u12
            [10] = u18
            [11] = u30
            [12] = u4
            [13] = u6
            [14] = u15
            [15] = u28
        --]]
        local u35 = u8.new()
        local u36 = u34:getValue()
        local u37 = u14:getEntity(u19.gameEntity)
        u24(u19.serverInstance:GetAttribute("Health") / u19.serverInstance:GetAttribute("MaxHealth"))
        local v38 = u7.values(u16)
        local v39 = 0
        for v40 = 1, #v38 do
            local v41 = v38[v40]
            local _ = v40 - 1
            local v42
            if u37 == nil then
                v42 = u37
            else
                v42 = u37:getShield(v41)
            end
            v39 = v39 + (v42 == nil and 0 or v42)
        end
        u26(v39)
        u35:GiveTask(u19.serverInstance:GetAttributeChangedSignal("Health"):Connect(function() --[[ Line: 76 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u24
                [3] = u36
                [4] = u12
                [5] = u18
            --]]
            if not (u19.serverInstance and u19.serverInstance.Parent) then
                return nil
            end
            local v43 = u19.serverInstance:GetAttribute("Health") / u19.serverInstance:GetAttribute("MaxHealth")
            u24(v43)
            if u36 then
                u12:Create(u36, u18, {
                    ["Size"] = UDim2.fromScale(v43, 1)
                }):Play()
            end
        end))
        u35:GiveTask(u19.serverInstance:GetAttributeChangedSignal("AdditionalHealthBarStatRatio"):Connect(function() --[[ Line: 92 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u30
            --]]
            if not (u19.serverInstance and u19.serverInstance.Parent) then
                return nil
            end
            local v44 = u19.serverInstance:GetAttribute("AdditionalHealthBarStatRatio")
            local v45 = v44 == nil and 0 or v44
            u30((math.min(1, v45)))
        end))
        if not u4.isHoarceKat() then
            local u46 = u19.gameEntity:GetAttribute("Team")
            u6.Controllers.MatchController:getQueueTypeAsync():andThen(function(p47) --[[ Line: 107 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u46
                    [3] = u28
                --]]
                local v48 = nil
                for v49, v50 in u15(p47).teams do
                    local _ = v49 - 1
                    local v51 = v50.id
                    local v52 = u46
                    if tonumber(v51) == tonumber(v52) == true then
                        v48 = v50
                        break
                    end
                end
                if v48 then
                    u28(v48)
                end
            end)
        end
        u35:GiveTask(u19.gameEntity:GetAttributeChangedSignal("Team"):Connect(function() --[[ Line: 128 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u6
                [3] = u15
                [4] = u28
            --]]
            local u53 = u19.gameEntity:GetAttribute("Team")
            u6.Controllers.MatchController:getQueueTypeAsync():andThen(function(p54) --[[ Line: 131 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u53
                    [3] = u28
                --]]
                local v55 = nil
                for v56, v57 in u15(p54).teams do
                    local _ = v56 - 1
                    local v58 = v57.id
                    local v59 = u53
                    if tonumber(v58) == tonumber(v59) == true then
                        v55 = v57
                        break
                    end
                end
                if v55 then
                    u28(v55)
                end
            end)
        end))
        if u37 then
            for v60, v61 in u7.values(u16) do
                local _ = v60 - 1
                u35:GiveTask(u37:onShieldChanged(v61):Connect(function() --[[ Line: 156 ]]
                    --[[
                    Upvalues:
                        [1] = u7
                        [2] = u16
                        [3] = u37
                        [4] = u26
                    --]]
                    local v62 = 0
                    local v63 = v62
                    for v64, v65 in u7.values(u16) do
                        local _ = v64 - 1
                        local v66 = u37:getShield(v65)
                        v62 = v63 + (v66 == nil and 0 or v66)
                        v63 = v62
                    end
                    u26(v63)
                end))
            end
        end
        return function() --[[ Line: 176 ]]
            --[[
            Upvalues:
                [1] = u35
            --]]
            u35:DoCleaning()
        end
    end, {})
    local v67 = u19.serverInstance:GetAttribute("Health") + v25
    local v68 = {}
    local v69 = u14:getEntity(u19.gameEntity)
    if v69 ~= nil then
        v69 = v69:getMaxHealth()
    end
    local v70 = (v69 == nil and 0 or v69) - 1
    local v71 = v67 - 1
    local v72 = math.max(v70, v71) / 50
    local v73 = math.floor(v72)
    local v74 = math.min(v73, 30)
    local v75 = false
    local v76 = 1
    while true do
        if v75 then
            v76 = v76 + 1
        else
            v75 = true
        end
        if v76 > v74 then
            local v77 = {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["Size"] = u19.size or UDim2.fromScale(1, 0.8),
                ["Position"] = u19.position,
                ["AnchorPoint"] = u19.anchorPoint,
                ["LayoutOrder"] = u19.layoutOrder
            }
            local v78 = { u9.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["HorizontalAlignment"] = "Center",
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0.03, 0)
                }) }
            local v79 = #v78
            local v80 = {
                ["BackgroundTransparency"] = 0.5,
                ["BorderSizePixel"] = 1,
                ["ClipsDescendants"] = true,
                ["LayoutOrder"] = 0
            }
            local v81
            if v29 > 0 then
                v81 = UDim2.fromScale(1, 0.685)
            else
                v81 = UDim2.fromScale(1, 1)
            end
            v80.Size = v81
            v80.BorderColor3 = v33
            v80.BackgroundColor3 = u17.Gray
            local v82 = {}
            local v83 = u9.createElement
            local v84 = u5
            local v85 = {
                ["ZIndex"] = 2,
                ["Size"] = UDim2.fromScale(1, 1)
            }
            local v86 = {}
            local v87 = u9.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = v67 < v70 and "Left" or "Right"
            })
            local v88 = u9.createElement
            local v89 = u13
            local v90 = {
                ["FillRatio"] = 1,
                ["BarTweenSpeed"] = 0.01,
                ["ZIndex"] = 2
            }
            local v91 = UDim2.fromScale
            local v92 = v25 / (v70 + v25)
            v90.Size = v91(math.min(1, v92), 1)
            v90.FillColor = ColorSequence.new(Color3.fromRGB(240, 240, 240), Color3.fromRGB(199, 199, 199))
            v90.BackgroundColor = ColorSequence.new(Color3.fromRGB(0, 0, 0))
            __set_list(v86, 1, {v87, v88(v89, v90)})
            v82.ShieldBarContainer = v83(v84, v85, v86)
            local v93 = #v82
            for v94, v95 in v68 do
                v82[v93 + v94] = v95
            end
            local _ = #v82
            local v96 = {
                ["BackgroundTransparency"] = 0,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(v23, 1),
                ["BackgroundColor3"] = v33
            }
            local v97 = {}
            local v98 = #v97
            local v99 = u19[u9.Children]
            if v99 then
                for v100, v101 in v99 do
                    if type(v100) == "number" then
                        v97[v98 + v100] = v101
                    else
                        v97[v100] = v101
                    end
                end
            end
            v82.HpBarOuter = u9.createElement("Frame", v96, v97)
            v82.HpBarMiddle = u9.createElement("Frame", {
                ["Size"] = UDim2.fromScale(0, 1),
                ["BackgroundTransparency"] = 0,
                ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
                ["BorderSizePixel"] = 0,
                [u9.Ref] = u34
            })
            v78.HpBarInner = u9.createElement("Frame", v80, v82)
            local v102
            if v29 > 0 then
                local v103 = u9.createFragment
                local v104 = {
                    ["AdditionalStatBar"] = u9.createElement("Frame", {
                        ["BackgroundTransparency"] = 0.7,
                        ["BorderSizePixel"] = 1,
                        ["ClipsDescendants"] = true,
                        ["LayoutOrder"] = 1,
                        ["Size"] = UDim2.fromScale(1, 0.285),
                        ["BorderColor3"] = v33,
                        ["BackgroundColor3"] = u17.Gray
                    }, {
                        ["BarBackground"] = u9.createElement("Frame", {
                            ["BackgroundTransparency"] = 0.7,
                            ["BorderSizePixel"] = 0,
                            ["Size"] = UDim2.fromScale(1, 1),
                            ["BackgroundColor3"] = u3.WHITE
                        }, {
                            u9.createElement("UIGradient", {
                                ["Color"] = ColorSequence.new(Color3.fromRGB(120, 120, 120))
                            }),
                            ["BarFill"] = u9.createElement("Frame", {
                                ["BackgroundTransparency"] = 0,
                                ["BorderSizePixel"] = 0,
                                ["Size"] = UDim2.fromScale(v29, 1),
                                ["BackgroundColor3"] = u3.WHITE
                            }, { u9.createElement("UIGradient", {
                                    ["Color"] = ColorSequence.new(Color3.fromRGB(140, 169, 200))
                                }) })
                        })
                    })
                }
                v102 = v103(v104)
            else
                v102 = false
            end
            if v102 then
                v78[v79 + 1] = v102
            end
            return u9.createFragment({
                ["ContainerFrame"] = u9.createElement("Frame", v77, v78)
            })
        end
        local v105 = u9.createFragment
        local v106 = {
            ["Tick"] = u9.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 10,
                ["Size"] = UDim2.new(0, 2, v76 % 4 == 0 and 0.7 or 0.5, 0),
                ["Position"] = UDim2.fromScale(v76 / (v74 + 1), 0),
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
            })
        }
        local v107 = v105(v106)
        table.insert(v68, v107)
    end
end)
return {
    ["StatefulEntityHpBar"] = v11.connect(function(p109, p110) --[[ Line: 339 ]]
        local v111 = {}
        for v112, v113 in p110 do
            v111[v112] = v113
        end
        v111.LocalPlayerTeam = p109.Game.myTeam
        return v111
    end)(v108)
}