local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local v4 = u2.Component:extend("IceShard")
function v4.init(p5) --[[ Line: 8 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    p5.imageRef = u2.createRef()
    p5.gradientRef = u2.createRef()
end
function v4.render(u6) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v7 = u2.createFragment
    local v9 = {
        [u6.props.barNumber] = u2.createElement("ImageLabel", {
            [u2.Ref] = u6.imageRef,
            ["Size"] = UDim2.new(1, 0, 1, 0),
            ["BackgroundTransparency"] = 1,
            ["Image"] = u6.props.shard.Image,
            ["ImageRectSize"] = u6.props.shard.ImageRectSize,
            ["ImageRectOffset"] = u6.props.shard.ImageRectOffset,
            ["Visible"] = u6.props.currentBar:map(function(p8) --[[ Line: 21 ]]
                --[[
                Upvalues:
                    [1] = u6
                --]]
                return p8 - 1 >= u6.props.barNumber
            end)
        }, { u2.createElement("UIGradient", {
                ["Rotation"] = 90,
                ["Color"] = u6.props.gradient or ColorSequence.new(Color3.fromRGB(5, 167, 226), Color3.fromRGB(84, 237, 253)),
                ["Offset"] = Vector2.new(0, 0.1)
            }) })
    }
    return v7(v9)
end
function v4.didUpdate(u10) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    if u10.props.currentBar:getValue() >= 4 then
        task.delay(0.2, function() --[[ Line: 35 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u3
            --]]
            local v11 = u10.imageRef:getValue()
            local v12 = u10.gradientRef:getValue()
            if v11 and v12 then
                u3:Create(v11, TweenInfo.new(0.12), {
                    ["ImageTransparency"] = 1
                }):Play()
                u3:Create(v12, TweenInfo.new(0.12), {
                    ["ImageTransparency"] = 1
                }):Play()
            end
        end)
    end
end
return {
    ["IceShard"] = v4
}