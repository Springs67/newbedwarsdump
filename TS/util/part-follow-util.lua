local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
return {
    ["PartFollowUtil"] = {
        ["startFollowing"] = function(u4, u5, u6, u7, p8, u9) --[[ Name: startFollowing, Line 8 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u3
            --]]
            local u10 = p8 == nil and true or p8
            local v11 = u2.new()
            u4.Anchored = true
            local u12 = nil
            u12 = u3.Heartbeat:Connect(function() --[[ Line: 15 ]]
                --[[
                Upvalues:
                    [1] = u4
                    [2] = u5
                    [3] = u12
                    [4] = u10
                    [5] = u6
                    [6] = u7
                    [7] = u9
                --]]
                if not (u4 and u5) then
                    u12:Disconnect()
                    return nil
                end
                if u4.Parent == nil or u5.Parent == nil then
                    u12:Disconnect()
                    return nil
                end
                local v13 = u5:GetPivot().Position
                local v14
                if u10 then
                    v14 = v13 + u6
                else
                    v14 = (u5:GetPivot() * CFrame.new(u6)).Position
                end
                local v15 = u4:GetPivot().Rotation
                if u7 then
                    if u9 == nil then
                        v15 = u5:GetPivot().Rotation
                    else
                        local v16 = u5:GetPivot()
                        local v17 = CFrame.Angles
                        local v18 = u9.X
                        local v19 = math.rad(v18)
                        local v20 = u9.Y
                        local v21 = math.rad(v20)
                        local v22 = u9.Z
                        v15 = (v16 * v17(v19, v21, (math.rad(v22)))).Rotation
                    end
                end
                local v23 = v15.LookVector
                u4:PivotTo((CFrame.new(v14, v14 + v23)))
            end)
            v11:GiveTask(function() --[[ Line: 52 ]]
                --[[
                Upvalues:
                    [1] = u12
                --]]
                return u12:Disconnect()
            end)
            return v11
        end
    }
}