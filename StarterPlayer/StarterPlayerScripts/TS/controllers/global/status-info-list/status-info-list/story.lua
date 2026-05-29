local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u5 = v1.import(script, script.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "star-collector", "ui", "star-collector-display").StarCollectorDisplay
local u6 = v1.import(script, script.Parent, "status-info-list").StatusInfoList
return function(p7) --[[ Line: 8 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u6
        [4] = u5
        [5] = u2
    --]]
    local u8 = nil
    local u9 = u4.new()
    local v11 = {
        ["SetupRef"] = function(p10) --[[ Name: SetupRef, Line 12 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u9
            --]]
            u8 = p10
            u9:Fire(p10)
        end
    }
    local u12 = u3.mount(u3.createElement(u6, v11), p7)
    local u13 = {}
    local u19 = u9:Connect(function(p14) --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u3
            [3] = u5
            [4] = u2
        --]]
        local v15 = u13
        local v16 = u3.mount(u3.createElement(u5, {
            ["greenStars"] = 0,
            ["yellowStars"] = 11
        }), p14)
        table.insert(v15, v16)
        local v17 = u13
        local v18 = u3.mount(u3.createElement("TextLabel", {
            ["Text"] = "TEST",
            ["BackgroundColor3"] = u2.BLACK,
            ["Size"] = UDim2.fromScale(1, 1),
            ["TextColor3"] = u2.WHITE
        }), p14)
        table.insert(v17, v18)
    end)
    return function() --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u12
            [3] = u13
            [4] = u19
        --]]
        u3.unmount(u12)
        for v20, v21 in u13 do
            local _ = v20 - 1
            u3.unmount(v21)
        end
        u19:Disconnect()
    end
end