local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
return {
    ["WatchAttribute"] = function(u2, u3, u4) --[[ Name: WatchAttribute, Line 4 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        local v5 = u1.new()
        task.spawn(function() --[[ Line: 6 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u2
                [3] = u3
            --]]
            u4(u2:GetAttribute(u3))
        end)
        v5:GiveTask(u2:GetAttributeChangedSignal(u3):Connect(function() --[[ Line: 9 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u2
                [3] = u3
            --]]
            u4(u2:GetAttribute(u3))
        end))
        return v5
    end
}