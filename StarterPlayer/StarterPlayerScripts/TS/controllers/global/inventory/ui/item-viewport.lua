local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").CooldownBar
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u5 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "glitch-effect", "ui-glitch-effect").UIGlitchEffect
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local v8 = u3.Component:extend("ItemViewport")
function v8.init(p9) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    p9.imageRef = u3.createRef()
end
function v8.didMount(p10) --[[ Line: 15 ]]
    if not p10.props.IgnoreInitialPop then
        p10:popImage()
    end
end
function v8.willUpdate(p11, p12) --[[ Line: 20 ]]
    local v13 = p12.Amount
    local v14 = v13 == nil and 0 or v13
    local v15 = p11.props.Amount
    if (v15 == nil and 0 or v15) < v14 or p12.ItemType ~= p11.props.ItemType then
        p11:popImage()
    end
end
function v8.popImage(u16) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u1
    --]]
    local u17 = u16.imageRef:getValue()
    if u17 then
        local v18 = u4:Create(u16.imageRef:getValue(), TweenInfo.new(0.04), {
            ["Size"] = UDim2.fromScale(u16.props.ImageSize.X.Scale - 0.1, u16.props.ImageSize.Y.Scale + 0.3)
        })
        v18:Play()
        u1.Promise.fromEvent(v18.Completed):andThen(function() --[[ Line: 45 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u4
                [3] = u16
            --]]
            local v19 = u17
            if v19 ~= nil then
                v19 = v19.Parent
            end
            if v19 then
                u4:Create(u16.imageRef:getValue(), TweenInfo.new(0.07), {
                    ["Size"] = u16.props.ImageSize
                }):Play()
            end
        end)
    end
end
function v8.render(p20) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
        [3] = u7
        [4] = u5
        [5] = u2
    --]]
    local v21 = {}
    for v22, v23 in p20.props do
        v21[v22] = v23
    end
    v21[u3.Children] = nil
    v21.ItemType = nil
    v21.Amount = nil
    v21.IgnoreInitialPop = nil
    v21.DisplayOneAmount = nil
    v21.ShowCooldownBar = nil
    v21.ImageSize = nil
    v21.ImageTransparency = nil
    local v24 = u6(p20.props.ItemType)
    local v25 = v24.image
    local v26 = u7.getDisplayName(p20.props.ItemType)
    local v27 = v24.cooldownId
    local v28 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(1, 1)
    }
    for v29, v30 in v21 do
        v28[v29] = v30
    end
    local v31 = {}
    local v32 = #v31
    local v33 = p20.props[u3.Children]
    if v33 then
        for v34, v35 in v33 do
            if type(v34) == "number" then
                v31[v32 + v34] = v35
            else
                v31[v34] = v35
            end
        end
    end
    local v36 = #v31
    local v37 = v36 + 1
    local v38 = u3.createElement
    local v39 = u5
    local v40 = {
        ["Disabled"] = not v24.glitched
    }
    local v41 = {}
    local v42
    if v25 == nil then
        v42 = u3.createElement("TextLabel", {
            ["Font"] = "RobotoMono",
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Text"] = v26,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["Size"] = UDim2.fromScale(0.8, 0.6),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        })
    else
        local v43 = u3.createElement
        local v44 = "ImageLabel"
        local v45 = {}
        local v46 = u3.Ref
        local v47
        if v24.glitched then
            v47 = nil
        else
            v47 = p20.imageRef
        end
        v45[v46] = v47
        v45.Size = p20.props.ImageSize
        v45.Position = UDim2.fromScale(0.5, 0.5)
        v45.AnchorPoint = Vector2.new(0.5, 0.5)
        v45.BorderSizePixel = 0
        v45.BackgroundTransparency = 1
        v45.Image = v25
        v45.ImageTransparency = p20.props.ImageTransparency
        v42 = v43(v44, v45)
    end
    __set_list(v41, 1, {v42})
    v31[v37] = v38(v39, v40, v41)
    local v48
    if p20.props.ShowCooldownBar == true and v27 ~= nil then
        v48 = u3.createElement(u2, {
            ["cooldownId"] = v27,
            ["Position"] = UDim2.fromScale(0.5, 0.96),
            ["AnchorPoint"] = Vector2.new(0.5, 0.96),
            ["Size"] = UDim2.fromScale(1, 0.08)
        })
    else
        v48 = false
    end
    if v48 then
        v31[v36 + 2] = v48
    end
    local v49 = #v31
    local v50 = p20.props.Amount ~= nil and (p20.props.Amount > 1 or p20.props.DisplayOneAmount)
    if v50 then
        local v51 = u3.createElement
        local v52 = {
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 10,
            ["TextXAlignment"] = "Right"
        }
        local v53 = p20.props.Amount
        v52.Text = tostring(v53)
        v52.FontFace = Font.new("RobotoMono", Enum.FontWeight.Bold)
        v52.TextColor3 = Color3.fromRGB(255, 255, 255)
        v52.Size = UDim2.fromScale(0.5, 0.3)
        v52.AnchorPoint = Vector2.new(1, 1)
        v52.Position = UDim2.fromScale(0.98, 1)
        v50 = v51("TextLabel", v52)
    end
    if v50 then
        v31[v49 + 1] = v50
    end
    return u3.createElement("Frame", v28, v31)
end
v8.defaultProps = {
    ["ImageTransparency"] = 0,
    ["ImageSize"] = UDim2.fromScale(1, 1)
}
return {
    ["ItemViewport"] = v8
}