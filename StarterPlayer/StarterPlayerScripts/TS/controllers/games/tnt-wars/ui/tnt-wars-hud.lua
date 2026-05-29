local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u5 = v1.import(script, script.Parent, "tnt-wars-block-counter").TNTWarsBlockCounter
local u6 = v1.import(script, script.Parent, "tnt-wars-hp-bar").TNTWarsHpBar
local u7 = v1.import(script, script.Parent, "tnt-wars-logo").TNTWarsLogo
local u8 = UDim2.fromScale(0.1, -2)
local u9 = UDim2.fromScale(0.175, 0.2)
local u10 = TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local v11 = u2.Component:extend("TNTWarsHud")
function v11.init(p12) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    p12.hudRef = u2.createRef()
end
function v11.render(p13) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u8
        [3] = u6
        [4] = u4
        [5] = u7
        [6] = u5
    --]]
    local v14 = u2.createFragment
    local v15 = {}
    local v16 = u2.createElement
    local v17 = {
        ["HudContainer"] = u2.createElement("Frame", {
            [u2.Ref] = p13.hudRef,
            ["Size"] = UDim2.fromScale(0.65, 0.4),
            ["Position"] = u8,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0
        }, {
            u2.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0.1, 0),
                ["PaddingRight"] = UDim.new(0.1, 0)
            }),
            u2.createElement(u6, {
                ["teamLabel"] = "FRIENDLY",
                ["cores"] = p13.props.friendlyCores,
                ["containerPosition"] = UDim2.fromScale(0.2, 0.2),
                ["barAnchorPoint"] = Vector2.new(0, 0),
                ["barColor"] = u4.mcGreen,
                ["teamLabelPos"] = UDim2.fromScale(0.4, -0.085)
            }),
            u2.createElement(u7),
            u2.createElement(u5),
            u2.createElement(u6, {
                ["teamLabel"] = "ENEMY",
                ["cores"] = p13.props.enemyCores,
                ["containerPosition"] = UDim2.fromScale(0.8, 0.2),
                ["barAnchorPoint"] = Vector2.new(1, 0),
                ["barColor"] = u4.mcRed,
                ["teamLabelPos"] = UDim2.fromScale(0.075, -0.085)
            })
        })
    }
    v15.TNTWarsHud = v16("ScreenGui", {
        ["ResetOnSpawn"] = false
    }, v17)
    return v14(v15)
end
function v11.didMount(p18) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u10
        [3] = u9
    --]]
    local v19 = p18.hudRef:getValue()
    if not v19 then
        return nil
    end
    u3:Create(v19, u10, {
        ["Position"] = u9
    }):Play()
end
return {
    ["TNTWarsHud"] = v11
}