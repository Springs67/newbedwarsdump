local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent, "custom-kit-creation-main-gui").CustomKitCreation_MainGUI
return function(p4) --[[ Line: 5 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    local v5 = {
        ["CustomKits"] = {
            {
                ["name"] = "My Kit",
                ["id"] = "0",
                ["stats"] = {},
                ["abilities"] = {}
            },
            {
                ["name"] = "Your Kit",
                ["id"] = "1",
                ["stats"] = {},
                ["abilities"] = {}
            }
        },
        ["OnSave"] = function() --[[ Name: OnSave, Line 18 ]]
            return true
        end
    }
    local u6 = u2.mount(u2.createElement(u3, v5), p4)
    return function() --[[ Line: 22 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u6
        --]]
        u2.unmount(u6)
    end
end