local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.UIUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.TweenService
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "barbarian", "barbarian-kit").BarbarianKit
local u12 = u6.Component:extend("BarbarianRageBar")
function u12.init(p13) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    p13.progressRef = u6.createRef()
end
function u12.updateFill(p14) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u8
        [3] = u9
    --]]
    local v15 = u11.getSwordProgress(u8.LocalPlayer)
    local v16 = v15.prev
    local v17 = v15.next
    if v17 == nil then
        v16 = u11.SwordProgression[#u11.SwordProgression - 2 + 1]
        v17 = u11.SwordProgression[#u11.SwordProgression - 1 + 1]
    end
    local v18 = (p14.props.store.Kit.barbarianRage - v16.rage) / (v17.rage - v16.rage)
    local v19 = math.clamp(v18, 0.001, 1)
    local v20 = p14.progressRef:getValue()
    if v20 then
        u9:Create(v20, TweenInfo.new(0.3), {
            ["Size"] = UDim2.fromScale(v19, 0.25)
        }):Play()
    end
end
function u12.didMount(p21) --[[ Line: 37 ]]
    p21:updateFill()
end
function u12.didUpdate(p22, p23) --[[ Line: 40 ]]
    if p23.store.Kit.barbarianRage ~= p22.props.store.Kit.barbarianRage then
        p22:updateFill()
    end
end
function u12.render(p24) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u8
        [3] = u6
        [4] = u5
        [5] = u10
        [6] = u4
        [7] = u3
    --]]
    local v25 = u11.getSwordProgress(u8.LocalPlayer)
    local v26 = v25.prev
    local v27 = v25.next
    if v27 == nil then
        v26 = u11.SwordProgression[#u11.SwordProgression - 2 + 1]
        v27 = u11.SwordProgression[#u11.SwordProgression - 1 + 1]
    end
    return u6.createElement("Frame", {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Position"] = u5:getActionBarPosition(),
        ["AnchorPoint"] = Vector2.new(0.5, 1),
        ["Size"] = UDim2.fromScale(0.35, 0.04)
    }, {
        u6.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 12.441176470588236
        }),
        u6.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center"
        }),
        u6.createElement(u10, {
            ["SizeConstraint"] = "RelativeYY",
            ["ItemType"] = v26.item,
            ["Size"] = UDim2.fromScale(1, 1)
        }),
        u6.createElement(u4, {
            ["SizeConstraint"] = "RelativeYY",
            ["Size"] = UDim2.fromScale(10.441176470588236, 1)
        }, { u6.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0.05, 0),
                ["PaddingRight"] = UDim.new(0.05, 0)
            }), u6.createElement("Frame", {
                ["BackgroundTransparency"] = 0.5,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 0.25),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.fromScale(0, 0.5),
                ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
            }), u6.createElement("Frame", {
                [u6.Ref] = p24.progressRef,
                ["Size"] = UDim2.fromScale(0, 0.25),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.fromScale(0, 0.5),
                ["BorderSizePixel"] = 0
            }, { u6.createElement("UIGradient", {
                    ["Rotation"] = 90,
                    ["Color"] = ColorSequence.new(u3.hexColor(16578693), u3.hexColor(16433185))
                }) }) }),
        u6.createElement(u10, {
            ["SizeConstraint"] = "RelativeYY",
            ["ItemType"] = v27.item,
            ["Size"] = UDim2.fromScale(1, 1)
        })
    })
end
return {
    ["BarbarianRageBarWrapper"] = function(p28) --[[ Name: BarbarianRageBarWrapper, Line 111 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u12
        --]]
        return u6.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, { u6.createElement(u12, {
                ["store"] = p28.store
            }) })
    end,
    ["BarbarianRageBar"] = u12
}