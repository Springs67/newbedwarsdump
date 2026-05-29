local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ActionButton
local u4 = v2.GamepadAction
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
return {
    ["DroneTntUi"] = v6.new(u5)(function(u8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
            [3] = u7
            [4] = u4
        --]]
        local v10 = p9.useState
        local v11 = p9.useEffect
        local v12 = p9.useValue
        local v13, u14 = v10(0)
        local u15 = v12(-1)
        v11(function() --[[ Line: 15 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u14
            --]]
            local v16 = u8.Drone:GetAttribute("AmountStoredTNT")
            u14(v16 == nil and 0 or v16)
            local u18 = u8.Drone:GetAttributeChangedSignal("AmountStoredTNT"):Connect(function() --[[ Line: 22 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u14
                --]]
                local v17 = u8.Drone:GetAttribute("AmountStoredTNT")
                u14(v17 == nil and 0 or v17)
            end)
            return function() --[[ Line: 30 ]]
                --[[
                Upvalues:
                    [1] = u18
                --]]
                u18:Disconnect()
            end
        end, {})
        if v13 > 0 then
            return u5.createElement(u3, {
                ["actionName"] = "drop-tnt",
                ["priority"] = 80,
                ["onActivated"] = function() --[[ Name: onActivated, Line 37 ]]
                    --[[
                    Upvalues:
                        [1] = u15
                        [2] = u7
                    --]]
                    if time() - u15.value > 0.3 then
                        u15.value = time()
                        u7.Client:Get("DropTnt"):SendToServer()
                    end
                end,
                ["interactionKey"] = Enum.KeyCode.Z,
                ["gamepadInteractionKey"] = u4.CloseMenu,
                ["text"] = "Drop TNT (" .. tostring(v13) .. ") "
            })
        else
            return u5.createFragment()
        end
    end)
}