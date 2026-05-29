local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
return {
    ["WrappedTypechecker"] = function(...) --[[ Name: WrappedTypechecker, Line 4 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        local u2 = u1.Middleware.TypeChecking(unpack({ ... }))
        return function(u3, u4) --[[ Line: 7 ]]
            --[[
            Upvalues:
                [1] = u2
            --]]
            return function(u5, ...) --[[ Line: 8 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u3
                    [3] = u4
                --]]
                local u6 = { ... }
                local v8, v9 = pcall(function() --[[ Line: 10 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u3
                        [3] = u4
                        [4] = u5
                        [5] = u6
                    --]]
                    local v7 = u6
                    return u2(u3, u4)(u5, unpack(v7))
                end)
                if v8 and v9 ~= false then
                    return v9
                end
            end
        end
    end
}