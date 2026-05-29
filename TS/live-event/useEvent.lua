local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "datastructures", "out").Queue
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "plasma", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "plasma", "src", "Runtime").useEffect
return {
    ["useEvent"] = function(p5, p6) --[[ Name: useEvent, Line 7 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u4
            [3] = u2
        --]]
        u3.useKey(p5)
        local u7, v8 = u3.useState(nil)
        u4(function() --[[ Line: 10 ]]
            --[[
            Upvalues:
                [1] = u7
            --]]
            return function() --[[ Line: 11 ]]
                --[[
                Upvalues:
                    [1] = u7
                --]]
                local v9 = u7
                if v9 ~= nil then
                    v9 = v9.connection
                end
                if v9 then
                    local v10 = u7.connection
                    if v10 ~= nil then
                        v10 = v10.Destroy
                    end
                    if v10 ~= nil then
                        u7.connection:Destroy()
                        return
                    end
                    local v11 = u7.connection
                    if v11 ~= nil then
                        v11 = v11.destroy
                    end
                    if v11 ~= nil then
                        u7.connection:destroy()
                        return
                    end
                    local v12 = u7.connection
                    if v12 ~= nil then
                        v12 = v12.Disconnect
                    end
                    if v12 ~= nil then
                        u7.connection:Disconnect()
                        return
                    end
                    local v13 = u7.connection
                    if v13 ~= nil then
                        v13 = v13.disconnect
                    end
                    if v13 ~= nil then
                        u7.connection:disconnect()
                    end
                end
            end
        end)
        if u7 == nil then
            local u14 = u2.new()
            local function v15(...) --[[ Line: 54 ]]
                --[[
                Upvalues:
                    [1] = u14
                --]]
                u14:Push({ ... })
            end
            local v16 = nil
            if p6.Connect == nil then
                if p6.connect == nil then
                    if p6.on == nil then
                        error("Could not connect")
                    else
                        v16 = p6:on(v15)
                    end
                else
                    v16 = p6:connect(v15)
                end
            else
                v16 = p6:Connect(v15)
            end
            v8({
                ["queue"] = u14,
                ["connection"] = v16
            })
        end
        return function() --[[ Line: 73 ]]
            --[[
            Upvalues:
                [1] = u7
            --]]
            local v17 = u7
            if v17 ~= nil then
                v17 = v17.queue
            end
            if v17 then
                return u7.queue:Pop()
            end
        end
    end
}