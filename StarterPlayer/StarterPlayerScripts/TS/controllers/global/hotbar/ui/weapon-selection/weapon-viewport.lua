local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weapon-util").getWeaponMeta
local v5 = u2.Component:extend("WeaponViewport")
function v5.init(p6) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    p6.imageRef = u2.createRef()
end
function v5.didMount(p7) --[[ Line: 12 ]]
    if not p7.props.IgnoreInitialPop then
        p7:popImage()
    end
end
function v5.willUpdate(p8, p9) --[[ Line: 17 ]]
    local v10 = p9.Amount
    local v11 = v10 == nil and 0 or v10
    local v12 = p8.props.Amount
    if (v12 == nil and 0 or v12) < v11 or p9.WeaponType ~= p8.props.WeaponType then
        p8:popImage()
    end
end
function v5.popImage(u13) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u1
    --]]
    local u14 = u13.imageRef:getValue()
    if u14 then
        local v15 = u3:Create(u13.imageRef:getValue(), TweenInfo.new(0.04), {
            ["Size"] = UDim2.fromScale(u13.props.ImageSize.X.Scale - 0.1, u13.props.ImageSize.Y.Scale + 0.3)
        })
        v15:Play()
        u1.Promise.fromEvent(v15.Completed):andThen(function() --[[ Line: 42 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u3
                [3] = u13
            --]]
            local v16 = u14
            if v16 ~= nil then
                v16 = v16.Parent
            end
            if v16 then
                u3:Create(u13.imageRef:getValue(), TweenInfo.new(0.07), {
                    ["Size"] = u13.props.ImageSize
                }):Play()
            end
        end)
    end
end
function v5.render(p17) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
    --]]
    local v18 = {}
    for v19, v20 in p17.props do
        v18[v19] = v20
    end
    v18[u2.Children] = nil
    v18.WeaponType = nil
    v18.Amount = nil
    v18.IgnoreInitialPop = nil
    v18.DisplayOneAmount = nil
    v18.ShowCooldownBar = nil
    v18.ImageSize = nil
    v18.ImageTransparency = nil
    v18.image = nil
    local v21 = u4(p17.props.WeaponType)
    local v22 = p17.props.image
    local v23
    if v22 == "" or not v22 then
        v23 = v21.image
    else
        v23 = p17.props.image
    end
    local _ = v21.name
    local v24 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(1, 1)
    }
    for v25, v26 in v18 do
        v24[v25] = v26
    end
    local v27 = {}
    local v28 = #v27
    local v29 = p17.props[u2.Children]
    if v29 then
        for v30, v31 in v29 do
            if type(v30) == "number" then
                v27[v28 + v30] = v31
            else
                v27[v30] = v31
            end
        end
    end
    v27[#v27 + 1] = u2.createElement("ImageLabel", {
        [u2.Ref] = p17.imageRef,
        ["Size"] = p17.props.ImageSize,
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["Image"] = v23,
        ["ImageTransparency"] = p17.props.ImageTransparency
    })
    return u2.createElement("Frame", v24, v27)
end
v5.defaultProps = {
    ["ImageTransparency"] = 0,
    ["ImageSize"] = UDim2.fromScale(1, 1)
}
return {
    ["WeaponViewport"] = v5
}