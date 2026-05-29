local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Padding
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u9 = v1.import(script, script.Parent.Parent.Parent, "controllers", "lobby", "clan", "ui", "profile", "shop-tab", "countdown-component").CountdownComponent
local function v27(p10, p11) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u8
        [4] = u3
        [5] = u4
        [6] = u9
    --]]
    local _ = p11.useState
    local v12 = p11.useEffect
    local u13 = u6.createRef()
    local v14 = p10.FrameProps
    if v14 ~= nil then
        v14 = v14.ZIndex
    end
    v12(function() --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u5
            [3] = u8
        --]]
        local u15 = true
        local u16 = u13:getValue()
        local u17 = u5.new()
        if not u16 then
            return nil
        end
        u17:GiveTask(u8.Heartbeat:Connect(function(p18) --[[ Line: 28 ]]
            --[[
            Upvalues:
                [1] = u16
            --]]
            u16.Rotation = (u16.Rotation + 360 * p18) % 360
        end))
        return function() --[[ Line: 32 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u15
            --]]
            u17:DoCleaning()
            u15 = false
        end
    end, {})
    local v19 = {
        ["BackgroundTransparency"] = 0.3,
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(1, 1),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["BackgroundColor3"] = u3.BLACK
    }
    local v20 = p10.FrameProps
    if v20 then
        for v21, v22 in v20 do
            v19[v21] = v22
        end
    end
    v19.ZIndex = v14
    local v23 = { u6.createElement("UIStroke", {
            ["Thickness"] = 2,
            ["Color"] = u3.WHITE
        }, { u6.createElement("UIGradient", {
                ["Rotation"] = 90,
                ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.3, 1), NumberSequenceKeypoint.new(1, 1) }),
                [u6.Ref] = u13
            }) }), u6.createElement(u4, {
            ["Padding"] = UDim.new(0.1, 0)
        }), u6.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(1, 0)
        }) }
    local v24 = #v23
    local v25 = {
        ["MaxTextSize"] = 70,
        ["TextXAlignment"] = "Center",
        ["TextScaled"] = true,
        ["EndTime"] = p10.EndTime,
        ["CountdownOptions"] = {
            ["days"] = false,
            ["hours"] = false,
            ["minutes"] = false,
            ["seconds"] = true
        },
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Size"] = UDim2.fromScale(0.75, 0.55),
        ["ZIndex"] = v14,
        ["EnableCountdownSounds"] = not p10.DisableSounds
    }
    local v26 = p10.OnlyPlaySoundLastNSec
    if v26 == nil then
        v26 = nil
    end
    v25.OnlyPlaySoundLastNSec = v26
    v25.PlayCustomSoundAtTime = p10.PlayCustomSoundAtTime
    v23[v24 + 1] = u6.createElement(u9, v25)
    return u6.createFragment({
        ["FirstDropTimeCountdown"] = u6.createElement("Frame", v19, v23)
    })
end
return {
    ["CircleCountdownComponent"] = v27,
    ["CircleCountdown"] = v7.new(u6)(v27)
}