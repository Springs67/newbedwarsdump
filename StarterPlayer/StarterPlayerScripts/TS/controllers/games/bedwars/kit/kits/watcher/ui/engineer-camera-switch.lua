local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ContextActionService
local u8 = v6.HttpService
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v11 = u5.Component:extend("EngineerCameraSwitch")
function v11.init(u12, _) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u5
        [4] = u2
        [5] = u9
    --]]
    u12.maid = u4.new()
    u12.sizeMotor = u3.GroupMotor.new({
        ["x"] = 65,
        ["y"] = 50
    })
    local v13, v14 = u5.createBinding({
        ["x"] = 65,
        ["y"] = 50
    })
    u12.size = v13
    u12.setSize = v14
    u12.sizeMotor:onStep(u12.setSize)
    function u12.activatedFunc() --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u3
            [3] = u2
            [4] = u9
        --]]
        u12.props.clicked()
        u12.sizeMotor:setGoal({
            ["x"] = u3.Spring.new(85, {
                ["frequency"] = 4,
                ["dampingRatio"] = 1
            }),
            ["y"] = u3.Spring.new(70, {
                ["frequency"] = 4,
                ["dampingRatio"] = 1
            })
        })
        u2:playSound(u9.UI_CLICK)
        task.delay(0.1, function() --[[ Line: 41 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u3
            --]]
            u12.sizeMotor:setGoal({
                ["x"] = u3.Spring.new(65, {
                    ["frequency"] = 4,
                    ["dampingRatio"] = 1
                }),
                ["y"] = u3.Spring.new(50, {
                    ["frequency"] = 4,
                    ["dampingRatio"] = 1
                })
            })
        end)
    end
end
function v11.render(p15) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u5
    --]]
    local v17 = {
        ["BorderSizePixel"] = 0,
        ["AnchorPoint"] = p15.props.anchorPoint,
        ["Position"] = p15.props.position,
        ["Size"] = p15.size:map(function(p16) --[[ Line: 59 ]]
            return UDim2.fromOffset(p16.x, p16.y)
        end),
        ["BackgroundColor3"] = u10.backgroundPrimary
    }
    local v18 = { u5.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 8)
        }) }
    local v19 = #v18
    local v20 = {
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5) + p15.props.iconShift,
        ["Size"] = UDim2.fromScale(0.6, 0.6),
        ["BackgroundTransparency"] = 1,
        ["Image"] = p15.props.imageId,
        ["ImageColor3"] = Color3.fromRGB(255, 255, 255),
        ["ScaleType"] = "Fit",
        [u5.Event.MouseButton1Click] = p15.activatedFunc
    }
    v18[v19 + 1] = u5.createElement("ImageButton", v20)
    local v21 = {
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Size"] = UDim2.new(0.4, 0, 0.4, 0),
        ["Position"] = UDim2.fromScale(0.5, 0.5) + p15.props.textShift,
        ["BackgroundTransparency"] = 1,
        ["Text"] = "(" .. p15.props.inputDisplay .. ")",
        ["TextScaled"] = true,
        ["Font"] = "SourceSansBold",
        ["TextColor3"] = u10.textPrimary
    }
    v18[v19 + 2] = u5.createElement("TextLabel", v21)
    return u5.createElement("Frame", v17, v18)
end
function v11.didMount(u22) --[[ Line: 99 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
    --]]
    local u23 = u8:GenerateGUID(false)
    local v24 = u7
    local v25 = "switch-camera-" .. u23
    local v26 = u22.props.inputTypes
    v24:BindAction(v25, function(_, p27, _) --[[ Line: 101 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        if p27 == Enum.UserInputState.End then
            u22.activatedFunc()
        end
    end, false, unpack(v26))
    u22.maid:GiveTask(function() --[[ Line: 106 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u23
        --]]
        u7:UnbindAction("switch-camera-" .. u23)
    end)
end
function v11.willUnmount(p28) --[[ Line: 110 ]]
    p28.maid:DoCleaning()
end
return {
    ["EngineerCameraSwitch"] = v11
}