local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").UIUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v7 = u4.Component:extend("UnmountDodoApp")
function v7.init(p8) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    p8.maid = u3.new()
end
function v7.render(u9) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u2
    --]]
    return u4.createElement("ImageButton", {
        ["Size"] = u6.actionBarButtonSize,
        ["Position"] = u2:getActionBarPosition(),
        ["AnchorPoint"] = Vector2.new(0.5, 1),
        ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0),
        ["BackgroundTransparency"] = 0.6,
        ["BorderSizePixel"] = 0,
        [u4.Event.Activated] = function() --[[ Line: 22 ]]
            --[[
            Upvalues:
                [1] = u9
            --]]
            u9.props.unmountCallback()
        end
    }, { u4.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 4.675675675675675
        }), u4.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Font"] = "Roboto",
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["Size"] = UDim2.fromScale(0.8, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Text"] = "<b>Dismount (" .. u9.props.interactionKey.Name .. ")</b>",
            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
        }) })
end
function v7.didMount(u10) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u10.maid:GiveTask(u5.InputEnded:Connect(function(p11, p12) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u10
        --]]
        if p11.KeyCode == u10.props.interactionKey and not p12 then
            u10.props.unmountCallback()
        end
    end))
end
function v7.willUnmount(p13) --[[ Line: 50 ]]
    p13.maid:DoCleaning()
end
return {
    ["UnmountDodoApp"] = v7
}