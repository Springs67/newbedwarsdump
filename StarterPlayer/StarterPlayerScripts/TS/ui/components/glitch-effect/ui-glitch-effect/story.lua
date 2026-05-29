local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent, "ui-glitch-effect").UIGlitchEffect
return function(p4) --[[ Line: 5 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    local u5 = u2.mount(u2.createElement("ScreenGui", {}, { u2.createElement(u3, {}, {
            ["DomWAsHere"] = u2.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center"
            }),
            u2.createElement("ImageLabel", {
                ["Image"] = "rbxassetid://10086864148",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.3, 0.3)
            }),
            u2.createElement("TextLabel", {
                ["Text"] = "BYE",
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.3, 0.3)
            })
        }) }), p4)
    return function() --[[ Line: 26 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u5
        --]]
        return u2.unmount(u5)
    end
end