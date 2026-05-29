local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u3 = v2.InOutSine
local u4 = v2.Linear
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block", "flying-lucky-block", "flying-lucky-block-constants").FLYING_LUCKY_BLOCK_SPEED
return {
    ["FlyingLuckyBlockUtil"] = {
        ["moveFlyingLuckyBlock"] = function(u8, u9, p10) --[[ Name: moveFlyingLuckyBlock, Line 14 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u7
                [3] = u5
                [4] = u4
                [5] = u3
            --]]
            local u11 = u8:GetPivot().Position
            local u12 = u8:GetPivot().Rotation
            local u13 = u6:getMoveToDuration(u8, u9, u7)
            if p10 then
                u5(u13, u4, function(p14) --[[ Line: 21 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u12
                    --]]
                    local v15 = u8
                    local v16 = CFrame.new
                    local v17 = p14.X
                    local v18 = p14.Y
                    local v19 = p14.Z
                    v15:PivotTo(v16((Vector3.new(v17, v18, v19))) * u12)
                end, u11, u9):Wait()
            else
                task.spawn(function() --[[ Line: 26 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                        [2] = u13
                        [3] = u5
                        [4] = u3
                        [5] = u8
                        [6] = u12
                        [7] = u9
                    --]]
                    local v20 = u11 + Vector3.new(0, -1.25, 0)
                    local v21 = u11 + Vector3.new(0, 1.25, 0)
                    local v22 = false
                    local v23 = 0
                    while true do
                        if v22 then
                            v23 = v23 + 2
                        else
                            v22 = true
                        end
                        if v23 >= u13 - 4 then
                            u5(1, u3, function(p24) --[[ Line: 53 ]]
                                --[[
                                Upvalues:
                                    [1] = u8
                                    [2] = u12
                                --]]
                                local v25 = u8:GetPivot().Position
                                local v26 = u8
                                local v27 = CFrame.new
                                local v28 = v25.X
                                local v29 = p24.Y
                                local v30 = v25.Z
                                v26:PivotTo(v27((Vector3.new(v28, v29, v30))) * u12)
                            end, u9, u11):Wait()
                            return
                        end
                        u5(1, u3, function(p31) --[[ Line: 43 ]]
                            --[[
                            Upvalues:
                                [1] = u8
                                [2] = u12
                            --]]
                            local v32 = u8:GetPivot().Position
                            local v33 = u8
                            local v34 = CFrame.new
                            local v35 = v32.X
                            local v36 = p31.Y
                            local v37 = v32.Z
                            v33:PivotTo(v34((Vector3.new(v35, v36, v37))) * u12)
                        end, u8:GetPivot().Position, v21):Wait()
                        u5(1, u3, function(p38) --[[ Line: 47 ]]
                            --[[
                            Upvalues:
                                [1] = u8
                                [2] = u12
                            --]]
                            local v39 = u8:GetPivot().Position
                            local v40 = u8
                            local v41 = CFrame.new
                            local v42 = v39.X
                            local v43 = p38.Y
                            local v44 = v39.Z
                            v40:PivotTo(v41((Vector3.new(v42, v43, v44))) * u12)
                        end, u8:GetPivot().Position, v20):Wait()
                    end
                end)
                u5(u13, u4, function(p45) --[[ Line: 58 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u12
                    --]]
                    local v46 = u8
                    local v47 = CFrame.new
                    local v48 = p45.X
                    local v49 = u8:GetPivot().Position.Y
                    local v50 = p45.Z
                    v46:PivotTo(v47((Vector3.new(v48, v49, v50))) * u12)
                end, u8:GetPivot().Position, u9):Wait()
            end
        end
    }
}