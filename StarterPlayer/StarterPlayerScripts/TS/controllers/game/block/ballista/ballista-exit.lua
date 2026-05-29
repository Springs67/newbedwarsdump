local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ContextActionService
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v9 = u5.Component:extend("BallistaExit")
function v9.init(u10, _) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u5
        [4] = u2
        [5] = u7
    --]]
    u10.maid = u4.new()
    u10.sizeMotor = u3.GroupMotor.new({
        ["x"] = 120,
        ["y"] = 50
    })
    local v11, v12 = u5.createBinding({
        ["x"] = 120,
        ["y"] = 50
    })
    u10.size = v11
    u10.setSize = v12
    u10.sizeMotor:onStep(u10.setSize)
    function u10.activatedFunc() --[[ Line: 26 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u3
            [3] = u2
            [4] = u7
        --]]
        u10.props.activated()
        u10.sizeMotor:setGoal({
            ["x"] = u3.Spring.new(140, {
                ["frequency"] = 4,
                ["dampingRatio"] = 1
            }),
            ["y"] = u3.Spring.new(70, {
                ["frequency"] = 4,
                ["dampingRatio"] = 1
            })
        })
        u2:playSound(u7.UI_CLICK)
        task.delay(0.1, function() --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u3
            --]]
            u10.sizeMotor:setGoal({
                ["x"] = u3.Spring.new(120, {
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
function v9.render(p13) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u8
    --]]
    return u5.createElement("Frame", {
        ["BorderSizePixel"] = 0,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = p13.size:map(function(p14) --[[ Line: 57 ]]
            return UDim2.fromOffset(p14.x, p14.y)
        end),
        ["BackgroundColor3"] = u8.backgroundPrimary
    }, { u5.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 8)
        }), u5.createElement("TextButton", {
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Size"] = UDim2.new(1, 0, 0.4, 0),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["BackgroundTransparency"] = 1,
            ["Text"] = "<font color=\"rgb(255, 255, 255)\">Exit</font> (" .. p13.props.inputDisplay .. ")",
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["Font"] = "SourceSansBold",
            ["TextColor3"] = u8.textPrimary,
            [u5.Event.MouseButton1Click] = p13.activatedFunc
        }) })
end
function v9.didMount(u15) --[[ Line: 80 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v16 = u6
    local v17 = u15.props.inputTypes
    v16:BindAction("ballista-exit", function(_, p18, _) --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u15
        --]]
        if p18 == Enum.UserInputState.End then
            u15.activatedFunc()
        end
    end, false, unpack(v17))
    u15.maid:GiveTask(function() --[[ Line: 86 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        u6:UnbindAction("ballista-exit")
    end)
end
function v9.willUnmount(p19) --[[ Line: 90 ]]
    p19.maid:DoCleaning()
end
return {
    ["BallistaExit"] = v9
}