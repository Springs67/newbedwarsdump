local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GamepadKeycodes
local v4 = {}
local u5 = nil
local u6 = nil
function v4.getGamepadKeybind(p7) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
    --]]
    local v8 = u6():getActionKeycodes(p7)
    if v8 ~= nil then
        local v9 = 0
        local v10 = {}
        for v11, v12 in v8 do
            local _ = v11 - 1
            if table.find(u3, v12) ~= nil == true then
                v9 = v9 + 1
                v10[v9] = v12
            end
        end
        v8 = table.remove(v10, 1)
    end
    return v8
end
u6 = function() --[[ Name: getActionBinderController, Line 39 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
    --]]
    if not u5 then
        u5 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController")
    end
    return u5
end
return {
    ["GamepadUtil"] = v4
}