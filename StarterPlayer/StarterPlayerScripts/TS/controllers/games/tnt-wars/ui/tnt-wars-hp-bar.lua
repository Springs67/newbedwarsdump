local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tnt-wars", "tnt-wars-constants")
local u6 = v5.CORE_COLORS
local u7 = v5.CORE_HP
local u8 = v5.TNT_WARS_IMAGE_ID
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u10 = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local v11 = u3.Component:extend("TNTWarsHpBar")
function v11.init(p12) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    p12.flashBarOneRef = u3.createRef()
    p12.outerBarOneRef = u3.createRef()
    p12.percentLabelOneRef = u3.createRef()
    p12.coreIconOneRef = u3.createRef()
    p12.flashBarTwoRef = u3.createRef()
    p12.outerBarTwoRef = u3.createRef()
    p12.percentLabelTwoRef = u3.createRef()
    p12.coreIconTwoRef = u3.createRef()
end
function v11.render(p13) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u9
        [3] = u8
        [4] = u2
    --]]
    local v14 = u3.createFragment
    local v15 = {}
    local v16 = u3.createElement
    local v17 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = p13.props.containerPosition,
        ["Size"] = UDim2.fromScale(0.5, 1)
    }
    local v18 = {
        ["TeamLabel"] = u3.createElement("TextLabel", {
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["TextStrokeTransparency"] = 0,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 4,
            ["Text"] = p13.props.teamLabel,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0),
            ["Font"] = Enum.Font.Arcade,
            ["Position"] = p13.props.teamLabelPos,
            ["Size"] = UDim2.fromScale(0.5, 0.075)
        })
    }
    local v19 = u3.createElement
    local v20 = {
        ["BackgroundTransparency"] = 0.5,
        ["BorderSizePixel"] = 0,
        ["Position"] = UDim2.fromScale(p13.props.barAnchorPoint.X, 0),
        ["Size"] = UDim2.fromScale(0.8, 0.055),
        ["AnchorPoint"] = p13.props.barAnchorPoint,
        ["BackgroundColor3"] = u9.Gray
    }
    local v21 = { u3.createElement("UIStroke", {
            ["Thickness"] = 3,
            ["Color"] = Color3.fromRGB(255, 255, 255)
        }), (u3.createElement("UICorner")) }
    local v22 = u3.createElement
    local v23 = {
        [u3.Ref] = p13.coreIconOneRef,
        ["Position"] = UDim2.fromScale(p13.props.barAnchorPoint.X - 0.075, -0.35),
        ["Size"] = UDim2.fromScale(0.1, 0.1),
        ["SizeConstraint"] = Enum.SizeConstraint.RelativeXX,
        ["Image"] = u8.PURPLE_CORE,
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["ZIndex"] = 3
    }
    local v24 = {
        ["CoreOnePercent"] = u3.createElement("TextLabel", {
            [u3.Ref] = p13.percentLabelOneRef,
            ["Text"] = "100%",
            ["RichText"] = true,
            ["Position"] = UDim2.fromScale(0.5, 0.58),
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["BackgroundTransparency"] = 1,
            ["Font"] = Enum.Font.LuckiestGuy,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0),
            ["TextSize"] = u2.isSmallScreen() and 12 or 18,
            ["TextStrokeTransparency"] = 0,
            ["TextXAlignment"] = Enum.TextXAlignment.Center,
            ["ZIndex"] = 4
        })
    }
    v21.CoreOneIcon = v22("ImageLabel", v23, v24)
    v21.CoreBarOneFlash = u3.createElement("Frame", {
        [u3.Ref] = p13.flashBarOneRef,
        ["Position"] = UDim2.fromScale(p13.props.barAnchorPoint.X, 0),
        ["Size"] = UDim2.fromScale(1, 1),
        ["AnchorPoint"] = p13.props.barAnchorPoint,
        ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
        ["BorderSizePixel"] = 0,
        ["ZIndex"] = 1
    }, { u3.createElement("UICorner") })
    v21.CoreBarOneOuter = u3.createElement("Frame", {
        [u3.Ref] = p13.outerBarOneRef,
        ["Position"] = UDim2.fromScale(p13.props.barAnchorPoint.X, 0),
        ["Size"] = UDim2.fromScale(1, 1),
        ["AnchorPoint"] = p13.props.barAnchorPoint,
        ["BackgroundColor3"] = p13.props.barColor,
        ["BorderSizePixel"] = 0,
        ["ZIndex"] = 2
    }, { u3.createElement("UICorner") })
    v18.CoreBarOneInner = v19("Frame", v20, v21)
    local v25 = u3.createElement
    local v26 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 0.5,
        ["Position"] = UDim2.fromScale(p13.props.barAnchorPoint.X, 0.125),
        ["Size"] = UDim2.fromScale(0.7, 0.055),
        ["BackgroundColor3"] = u9.Gray,
        ["AnchorPoint"] = p13.props.barAnchorPoint
    }
    local v27 = { u3.createElement("UIStroke", {
            ["Thickness"] = 3,
            ["Color"] = Color3.fromRGB(255, 255, 255)
        }), (u3.createElement("UICorner")) }
    local v28 = u3.createElement
    local v29 = {
        [u3.Ref] = p13.coreIconTwoRef,
        ["Position"] = UDim2.fromScale(p13.props.barAnchorPoint.X - 0.075, -0.35),
        ["Size"] = UDim2.fromScale(0.1, 0.1),
        ["SizeConstraint"] = Enum.SizeConstraint.RelativeXX,
        ["Image"] = u8.YELLOW_CORE,
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["ZIndex"] = 3
    }
    local v30 = {
        ["CoreTwoPercent"] = u3.createElement("TextLabel", {
            [u3.Ref] = p13.percentLabelTwoRef,
            ["Text"] = "100%",
            ["RichText"] = true,
            ["Position"] = UDim2.fromScale(0.5, 0.58),
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["BackgroundTransparency"] = 1,
            ["Font"] = Enum.Font.LuckiestGuy,
            ["TextSize"] = u2.isSmallScreen() and 12 or 18,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0),
            ["TextStrokeTransparency"] = 0,
            ["TextXAlignment"] = Enum.TextXAlignment.Center,
            ["ZIndex"] = 4
        })
    }
    v27.CoreTwoIcon = v28("ImageLabel", v29, v30)
    v27.CoreBarTwoFlash = u3.createElement("Frame", {
        [u3.Ref] = p13.flashBarTwoRef,
        ["Position"] = UDim2.fromScale(p13.props.barAnchorPoint.X, 0),
        ["Size"] = UDim2.fromScale(1, 1),
        ["AnchorPoint"] = p13.props.barAnchorPoint,
        ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
        ["BorderSizePixel"] = 0,
        ["ZIndex"] = 1
    }, { u3.createElement("UICorner") })
    v27.CoreBarTwoOuter = u3.createElement("Frame", {
        [u3.Ref] = p13.outerBarTwoRef,
        ["Position"] = UDim2.fromScale(p13.props.barAnchorPoint.X, 0),
        ["Size"] = UDim2.fromScale(1, 1),
        ["AnchorPoint"] = p13.props.barAnchorPoint,
        ["BackgroundColor3"] = p13.props.barColor,
        ["BorderSizePixel"] = 0,
        ["ZIndex"] = 2
    }, { u3.createElement("UICorner") })
    v18.CoreBarTwoInner = v25("Frame", v26, v27)
    v15.HpBarsContainer = v16("Frame", v17, v18)
    return v14(v15)
end
function v11.didMount(p31) --[[ Line: 180 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v32 = nil
    for v33, v34 in p31.props.cores do
        local _ = v33 - 1
        local v35 = v34.corePart
        if v35 ~= nil then
            v35 = v35.Color
        end
        if v35 == u6[1] == true then
            v32 = v34
            break
        end
    end
    p31.coreOne = v32
    local v36 = nil
    for v37, v38 in p31.props.cores do
        local _ = v37 - 1
        local v39 = v38.corePart
        if v39 ~= nil then
            v39 = v39.Color
        end
        if v39 == u6[2] == true then
            v36 = v38
            break
        end
    end
    p31.coreTwo = v36
    p31:setupDamageListeners()
end
function v11.setupDamageListeners(u40) --[[ Line: 220 ]]
    local v41 = u40.coreOne
    if v41 ~= nil then
        local v42 = v41.corePart
        if v42 ~= nil then
            v42:GetAttributeChangedSignal("Hp"):Connect(function() --[[ Line: 225 ]]
                --[[
                Upvalues:
                    [1] = u40
                --]]
                u40:updateCoreOne()
            end)
        end
    end
    local v43 = u40.coreTwo
    if v43 ~= nil then
        local v44 = v43.corePart
        if v44 ~= nil then
            v44:GetAttributeChangedSignal("Hp"):Connect(function() --[[ Line: 234 ]]
                --[[
                Upvalues:
                    [1] = u40
                --]]
                u40:updateCoreTwo()
            end)
        end
    end
end
function v11.updateCoreOne(p45) --[[ Line: 240 ]]
    local v46 = p45.coreOne
    if v46 ~= nil then
        v46 = v46.corePart
    end
    if not v46 then
        return nil
    end
    local v47 = p45.outerBarOneRef:getValue()
    local v48 = p45.flashBarOneRef:getValue()
    local v49 = p45.percentLabelOneRef:getValue()
    local v50 = p45.coreIconOneRef:getValue()
    if not (v47 and (v48 and (v49 and v50))) then
        return nil
    end
    p45:updateIcon(p45.coreOne.corePart, v50)
    p45:updateBar(p45.coreOne.corePart, v47, v48)
    p45:updatePercent(p45.coreOne.corePart, v49)
end
function v11.updateCoreTwo(p51) --[[ Line: 259 ]]
    local v52 = p51.coreTwo
    if v52 ~= nil then
        v52 = v52.corePart
    end
    if not v52 then
        return nil
    end
    local v53 = p51.outerBarTwoRef:getValue()
    local v54 = p51.flashBarTwoRef:getValue()
    local v55 = p51.percentLabelTwoRef:getValue()
    local v56 = p51.coreIconTwoRef:getValue()
    if not (v53 and (v54 and (v55 and v56))) then
        return nil
    end
    p51:updateIcon(p51.coreTwo.corePart, v56)
    p51:updateBar(p51.coreTwo.corePart, v53, v54)
    p51:updatePercent(p51.coreTwo.corePart, v55)
end
function v11.updateBar(_, p57, p58, u59) --[[ Line: 278 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
        [3] = u10
    --]]
    local v60 = p57:GetAttribute("Hp") / u7
    local u61 = UDim2.fromScale(v60, p58.Size.Y.Scale)
    p58.Size = u61
    task.delay(1, function() --[[ Line: 284 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u59
            [3] = u10
            [4] = u61
        --]]
        u4:Create(u59, u10, {
            ["Size"] = u61
        }):Play()
    end)
end
function v11.updatePercent(_, p62, p63) --[[ Line: 290 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v64 = p62:GetAttribute("Hp")
    if v64 <= 0 then
        p63.Visible = false
        return nil
    end
    local v65 = v64 / u7 * 100
    local v66 = math.floor(v65)
    p63.Text = tostring(v66) .. "%"
end
function v11.updateIcon(_, p67, p68) --[[ Line: 299 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    if p67:GetAttribute("Hp") <= 0 then
        p68.Image = u8.DEAD_CORE
    end
end
return {
    ["TNTWarsHpBar"] = v11
}