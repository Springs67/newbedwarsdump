local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v4 = {}
local u5 = nil
local u6 = nil
function v4.bindUpDownControls() --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u6
    --]]
    local v7 = u3.new()
    local v8 = u5()
    local v9 = u6()
    v7:GiveTask(v8.bindActionMaid)
    v7:GiveTask(v9.bindActionMaid)
    return {
        ["bindActionMaid"] = v7,
        ["shouldFlyUpRef"] = v8.shouldFlyUpRef,
        ["shouldFlyDownRef"] = v9.shouldFlyDownRef
    }
end
u5 = function() --[[ Name: bindUpControls, Line 47 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
    --]]
    local u10 = Instance.new("BoolValue")
    local v11 = u3.new()
    v11:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        ["action"] = "MoveMountUp",
        ["actionId"] = "mount-flying-up",
        ["boundFunction"] = function(_, p12) --[[ Name: boundFunction, Line 54 ]]
            --[[
            Upvalues:
                [1] = u10
            --]]
            if p12 == Enum.UserInputState.Begin then
                u10.Value = true
            elseif p12 == Enum.UserInputState.End then
                u10.Value = false
            end
            return Enum.ContextActionResult.Sink
        end,
        ["priority"] = Enum.ContextActionPriority.High.Value
    }))
    return {
        ["bindActionMaid"] = v11,
        ["shouldFlyUpRef"] = u10
    }
end
v4.bindUpControls = u5
u6 = function() --[[ Name: bindDownControls, Line 76 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
    --]]
    local u13 = Instance.new("BoolValue")
    local v14 = u3.new()
    v14:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        ["action"] = "MoveMountDown",
        ["actionId"] = "mount-flying-down",
        ["boundFunction"] = function(_, p15) --[[ Name: boundFunction, Line 83 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            if p15 == Enum.UserInputState.Begin then
                u13.Value = true
            elseif p15 == Enum.UserInputState.End then
                u13.Value = false
            end
            return Enum.ContextActionResult.Sink
        end,
        ["priority"] = Enum.ContextActionPriority.High.Value
    }))
    return {
        ["bindActionMaid"] = v14,
        ["shouldFlyDownRef"] = u13
    }
end
v4.bindDownControls = u6
return {
    ["MountFlightControls"] = v4
}