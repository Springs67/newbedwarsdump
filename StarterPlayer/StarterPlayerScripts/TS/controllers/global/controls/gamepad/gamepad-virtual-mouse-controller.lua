local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").GamepadService
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "GamepadVirtualMouseController"
    end,
    ["__index"] = u5
})
u6.__index = u6
function u6.new(...) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p9)
    p9.Name = "GamepadVirtualMouseController"
end
function u6.KnitStart(p10) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u4
    --]]
    u5.KnitStart(p10)
    local v12 = {
        ["actionId"] = "GamepadToggleVirtualMouse",
        ["action"] = "ToggleVirtualMouse",
        ["boundFunction"] = function(_, p11, _) --[[ Name: boundFunction, Line 30 ]]
            --[[
            Upvalues:
                [1] = u4
            --]]
            if p11 == Enum.UserInputState.End then
                if u4.GamepadCursorEnabled then
                    u4:DisableGamepadCursor()
                    return
                end
                u4:EnableGamepadCursor(nil)
            end
        end
    }
    u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction(v12)
end
v3.CreateController(u6.new())
return nil