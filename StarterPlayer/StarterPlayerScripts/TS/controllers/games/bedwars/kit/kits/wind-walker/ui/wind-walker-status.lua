local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "wind-walker", "wind-walker-util").WindWalkerUtil.ORB_DECAY_SECONDS
local v6 = u2.Component:extend("WindWalkerStatus")
function v6.init(p7, _) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    p7.stackRef = u2.createRef()
    p7.timerRef = u2.createRef()
    p7:setState({
        ["stack"] = 0,
        ["time"] = 0
    })
end
function v6.render(p8) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v9 = u2.createFragment
    local v10 = {}
    local v11 = u2.createElement
    local v12 = {
        ["BackgroundTransparency"] = 0.3,
        ["BorderSizePixel"] = 0,
        ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
        ["Size"] = UDim2.fromScale(1.5, 1.5),
        ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
    }
    local v13 = {
        u2.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.1, 0)
        }),
        u2.createElement("UIStroke", {
            ["Color"] = Color3.fromRGB(255, 255, 255)
        }),
        ["EffectImage"] = u2.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 1,
            ["Image"] = "rbxassetid://9871779816",
            ["Size"] = UDim2.fromScale(0.8, 0.8),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        })
    }
    local v14 = u2.createElement
    local v15 = {
        [u2.Ref] = p8.stackRef,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.8, 0.8)
    }
    local v16 = p8.state.stack
    v15.Text = tostring(v16)
    v15.Font = Enum.Font.Roboto
    v15.TextSize = 24
    v15.BackgroundTransparency = 1
    v15.TextColor3 = Color3.fromRGB(255, 255, 255)
    v15.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    v15.TextStrokeTransparency = 0
    v13.EffectStack = v14("TextLabel", v15)
    v13.EffectTimer = u2.createElement("TextLabel", {
        [u2.Ref] = p8.timerRef,
        ["Visible"] = p8.state.stack > 0,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 1),
        ["Text"] = p8:formattedTime(p8.state.time),
        ["Font"] = Enum.Font.Roboto,
        ["TextSize"] = 24,
        ["BackgroundTransparency"] = 1,
        ["TextColor3"] = Color3.fromRGB(255, 255, 255),
        ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0),
        ["TextStrokeTransparency"] = 0
    }, { u2.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 30)
        }) })
    v10.WindWalkerEffect = v11("Frame", v12, v13)
    return v9(v10)
end
function v6.didMount(u17) --[[ Line: 75 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
    --]]
    u4.WindWalkerOrbUpdate:connect(function(p18) --[[ Line: 76 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u5
        --]]
        u17:setState({
            ["stack"] = p18.orbCount,
            ["time"] = p18.orbCount <= 0 and 0 or u5
        })
    end)
    u17:startTimer()
end
function v6.startTimer(u19) --[[ Line: 84 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local u20 = 0
    u3.Heartbeat:Connect(function(p21) --[[ Line: 86 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u19
        --]]
        u20 = u20 + p21
        if u20 >= 1 then
            u20 = 0
            if u19.state.time > 0 then
                u19:setState({
                    ["time"] = u19.state.time - 1
                })
            end
        end
    end)
end
function v6.formattedTime(_, p22) --[[ Line: 99 ]]
    if p22 >= 60 then
        local v23 = 60 - p22
        local v24 = math.abs(v23)
        if v24 < 10 then
            return "1:0" .. tostring(v24)
        else
            return "1:" .. tostring(v24)
        end
    elseif p22 < 10 then
        return "0:0" .. tostring(p22)
    else
        return "0:" .. tostring(p22)
    end
end
return {
    ["WindWalkerStatus"] = v6
}