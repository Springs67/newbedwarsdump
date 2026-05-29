local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ProgressBar
local u4 = v2.UIUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes")
local u9 = v8.InfectedDisruptorPointsAttr
local u10 = v8.InfectedProwlerPointsAttr
local u11 = v8.InfectedRushPointsAttr
local u12 = v8.InfectedTankPointsAttr
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "infected", "infected-scaling-definitions").INFECTED_SCALING_DEFINITION
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "infected", "infected-variant-type").InfectedVariantType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").GetAttribute
local u16 = nil
local u17 = nil
local u18 = nil
local u19 = nil
local function v41(_, p20) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u7
        [3] = u17
        [4] = u12
        [5] = u15
        [6] = u11
        [7] = u9
        [8] = u10
        [9] = u18
        [10] = u19
        [11] = u4
        [12] = u5
        [13] = u3
    --]]
    local v21 = p20.useState
    local v22 = p20.useEffect
    local u23, u24 = v21(0)
    local v25, u26 = v21(u16()[1])
    local v27, u28 = v21(u16()[2])
    local v29, u30 = v21(0.01)
    v22(function() --[[ Line: 25 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u24
            [3] = u17
            [4] = u12
            [5] = u15
            [6] = u11
            [7] = u9
            [8] = u10
        --]]
        u7.LocalPlayer:GetAttributeChangedSignal("InfectedVariantType"):Connect(function() --[[ Line: 26 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u17
            --]]
            u24(u17())
        end)
        u7.LocalPlayer:GetAttributeChangedSignal(u12.Name):Connect(function() --[[ Line: 30 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u7
                [3] = u12
                [4] = u24
            --]]
            local v31 = u15(u7.LocalPlayer, u12)
            u24(v31 == nil and 0 or v31)
        end)
        u7.LocalPlayer:GetAttributeChangedSignal(u11.Name):Connect(function() --[[ Line: 38 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u7
                [3] = u11
                [4] = u24
            --]]
            local v32 = u15(u7.LocalPlayer, u11)
            u24(v32 == nil and 0 or v32)
        end)
        u7.LocalPlayer:GetAttributeChangedSignal(u9.Name):Connect(function() --[[ Line: 46 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u7
                [3] = u9
                [4] = u24
            --]]
            local v33 = u15(u7.LocalPlayer, u9)
            u24(v33 == nil and 0 or v33)
        end)
        u7.LocalPlayer:GetAttributeChangedSignal(u10.Name):Connect(function() --[[ Line: 54 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u7
                [3] = u10
                [4] = u24
            --]]
            local v34 = u15(u7.LocalPlayer, u10)
            u24(v34 == nil and 0 or v34)
        end)
    end, {})
    v22(function() --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u16
            [3] = u23
            [4] = u26
            [5] = u28
            [6] = u30
            [7] = u19
        --]]
        local v35 = u18(u16(), u23)
        u26(v35.prev)
        u28(v35.next)
        u30(u19(u23, v35.prev, v35.next))
    end, { u23 })
    local v36 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Position"] = u4:getActionBarPosition(),
        ["AnchorPoint"] = Vector2.new(0.5, 1),
        ["Size"] = UDim2.fromScale(0.35, 0.04)
    }
    local v37 = { u5.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 12.441176470588236
        }), u5.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }) }
    local v38 = #v37
    local v39 = {
        ["SizeConstraint"] = "RelativeYY",
        ["BackgroundTransparency"] = 1,
        ["ImageTransparency"] = 0,
        ["Size"] = UDim2.fromScale(1, 1)
    }
    if v25 ~= nil then
        v25 = v25.progressBarIcon
    end
    v39.Image = v25
    v39.LayoutOrder = 0
    v37.PreviousTierRepresentativeImage = u5.createElement("ImageLabel", v39)
    v37[v38 + 1] = u5.createElement(u3, {
        ["LayoutOrder"] = 1,
        ["AcceptZero"] = true,
        ["Progress"] = v29
    })
    local v40 = {
        ["SizeConstraint"] = "RelativeYY",
        ["BackgroundTransparency"] = 1,
        ["ImageTransparency"] = 0,
        ["Size"] = UDim2.fromScale(1, 1)
    }
    if v27 ~= nil then
        v27 = v27.progressBarIcon
    end
    v40.Image = v27
    v40.LayoutOrder = 2
    v37.NextTierRepresentativeImage = u5.createElement("ImageLabel", v40)
    return u5.createElement("Frame", v36, v37)
end
u18 = function(p42, p43) --[[ Name: getPlayerScalingTierProgress, Line 121 ]]
    local v44 = false
    local v45 = 0
    local v46 = nil
    local v47 = nil
    while true do
        if true then
            if v44 then
                v45 = v45 + 1
            else
                v44 = true
            end
        end
        if v45 >= #p42 then
            break
        end
        if p42[v45 + 1].minPointsRequired > p43 then
            v47 = p42[v45 + 1]
            break
        end
        v46 = p42[v45 + 1]
    end
    return {
        ["prev"] = v46,
        ["next"] = v47
    }
end
u16 = function() --[[ Name: getAllScalingTiers, Line 149 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u13
    --]]
    local v48 = u13[u7.LocalPlayer:GetAttribute("InfectedVariantType")].scalingTiers
    table.sort(v48, function(p49, p50) --[[ Line: 152 ]]
        return p49.minPointsRequired < p50.minPointsRequired
    end)
    return v48
end
u19 = function(p51, p52, p53) --[[ Name: getProgress, Line 158 ]]
    if p52 ~= nil then
        p52 = p52.minPointsRequired
    end
    local v54 = p52 == nil and 0 or p52
    local v55 = p51 - v54
    if p53 ~= nil then
        p53 = p53.minPointsRequired
    end
    if p53 ~= nil then
        p51 = p53
    end
    return v55 / (p51 - v54)
end
u17 = function() --[[ Name: getLocalPlayerInfectedPoints, Line 180 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u14
        [3] = u15
        [4] = u12
        [5] = u11
        [6] = u9
        [7] = u10
    --]]
    local v56 = u7.LocalPlayer:GetAttribute("InfectedVariantType")
    if v56 == u14.TANK then
        local v57 = u15(u7.LocalPlayer, u12)
        return v57 == nil and 0 or v57
    end
    if v56 == u14.RUSH then
        local v58 = u15(u7.LocalPlayer, u11)
        return v58 == nil and 0 or v58
    end
    if v56 == u14.DISRUPTOR then
        local v59 = u15(u7.LocalPlayer, u9)
        return v59 == nil and 0 or v59
    end
    if v56 == u14.PROWLER then
        local v60 = u15(u7.LocalPlayer, u10)
        return v60 == nil and 0 or v60
    end
end
return {
    ["InfectionPointsBar"] = v6.new(u5)(v41)
}