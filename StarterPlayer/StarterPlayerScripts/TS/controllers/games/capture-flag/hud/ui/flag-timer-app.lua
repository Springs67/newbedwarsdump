local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = u3.Component:extend("FlagTimerApp")
function v4.init(p5, _) --[[ Line: 8 ]]
    p5.alive = true
end
function v4.didMount(u6) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    u1.Promise.defer(function() --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        while true do
            local v7 = task.wait(0.2)
            if v7 ~= 0 and (v7 == v7 and v7) then
                v7 = u6.alive
            end
            if v7 == 0 or (v7 ~= v7 or not v7) then
                return
            end
            u6:setState({})
        end
    end)
end
function v4.willUnmount(p8) --[[ Line: 30 ]]
    p8.alive = false
end
function v4.render(p9) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
    --]]
    local v10 = Color3.fromRGB(255, 255, 255)
    local v11 = u3.createFragment
    local v12 = {}
    local v13 = u3.createElement
    local v14 = u2
    local v15 = {
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v16 = {}
    local v17 = u3.createElement
    local v18 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.9)
    }
    local v19 = {
        u3.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["VerticalAlignment"] = "Center",
            ["HorizontalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder"
        }),
        ["Countdown"] = u3.createElement("TextLabel", {
            ["Text"] = "Flag returns in ",
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.55),
            ["FontFace"] = Font.fromName("RobotoMono", Enum.FontWeight.Bold),
            ["TextColor3"] = v10
        }, { u3.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.15, 0),
                ["PaddingBottom"] = UDim.new(0.15, 0)
            }) })
    }
    local v20 = u3.createElement
    local v21 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["TextScaled"] = true,
        ["LayoutOrder"] = 1
    }
    local v22 = p9.props.Countdown
    v21.Text = "[" .. tostring(v22) .. "]"
    v21.Size = UDim2.fromScale(1.5, 0.8)
    v21.FontFace = Font.fromName("RobotoMono", Enum.FontWeight.Bold)
    v21.TextColor3 = v10
    v19.Time = v20("TextLabel", v21, { u3.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0.15, 0),
            ["PaddingBottom"] = UDim.new(0.15, 0)
        }) })
    v16.Flag = v17("Frame", v18, v19)
    v12.FlagTimer = v13(v14, v15, v16)
    return v11(v12)
end
function v4.generatorLabel(p23, p24) --[[ Line: 85 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v25 = u3.createFragment
    local v26 = {}
    local v27 = u3.createFragment
    local v28 = {}
    local v29 = u3.createElement
    local v30 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["TextScaled"] = true,
        ["LayoutOrder"] = 1
    }
    local v31 = p23.props.Countdown
    v30.Text = "Flag returns in [" .. tostring(v31) .. "]"
    v30.Size = UDim2.fromScale(1, 0.55)
    v30.FontFace = Font.fromName("RobotoMono", Enum.FontWeight.Bold)
    v30.TextColor3 = p24
    v28.Countdown = v29("TextLabel", v30, { u3.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0.15, 0),
            ["PaddingBottom"] = UDim.new(0.15, 0)
        }) })
    v26.Countdown = v27(v28)
    return v25(v26)
end
return {
    ["FlagTimerApp"] = v4
}