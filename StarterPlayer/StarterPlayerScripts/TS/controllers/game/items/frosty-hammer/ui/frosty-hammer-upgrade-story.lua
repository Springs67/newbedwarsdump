local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent, "frosty-hammer-component").FrostyHammerComponent
return function(p4) --[[ Line: 5 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    local u5 = u2.mount(u2.createElement("Frame", {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(0.8, 0.8)
    }, { u2.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1.7735849056603774
        }), u2.createElement(u3, {
            ["tool"] = nil
        }) }), p4)
    return function() --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u5
        --]]
        return u2.unmount(u5)
    end
end