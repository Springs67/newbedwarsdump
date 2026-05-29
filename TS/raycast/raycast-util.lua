local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.CollectionService
local u5 = v3.Workspace
return {
    ["RaycastUtil"] = {
        ["isUnblocked"] = function(p6, p7) --[[ Name: isUnblocked, Line 11 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u5
                [3] = u2
            --]]
            if not p6 then
                return false
            end
            local v8
            if p6.PrimaryPart then
                local v9 = p6:FindFirstChildWhichIsA("Humanoid")
                local v10 = not v9 and 0 or v9.HipHeight
                local v11 = p6.PrimaryPart.Position
                local v12 = -1 * (v10 + p6.PrimaryPart.Size.Y / 2)
                v8 = v11 + Vector3.new(0, v12, 0)
            else
                v8 = nil
            end
            local v13 = p7:getInstance()
            local v14
            if v13.PrimaryPart then
                local v15 = v13:FindFirstChildWhichIsA("Humanoid")
                local v16 = not v15 and 0 or v15.HipHeight
                local v17 = v13.PrimaryPart.Position
                local v18 = -1 * (v16 + v13.PrimaryPart.Size.Y / 2)
                v14 = v17 + Vector3.new(0, v18, 0)
            else
                v14 = nil
            end
            if not (v8 and v14) then
                return false
            end
            local v19 = v8 + Vector3.new(0, 5, 0)
            local v20 = v14 + Vector3.new(0, 5, 0)
            local v21 = v19 - Vector3.new(0, 2.5, 0)
            local _ = v20 - Vector3.new(0, 2.5, 0)
            local v22 = RaycastParams.new()
            v22.FilterType = Enum.RaycastFilterType.Include
            local v23 = {}
            local v24 = #v23
            local v25 = u4:GetTagged("block")
            local v26 = #v25
            table.move(v25, 1, v26, v24 + 1, v23)
            v23[v24 + v26 + 1] = u5.Map
            v22.FilterDescendantsInstances = v23
            local u27 = u4:GetTagged("DontBlockAbilityRaycast")
            local v29 = u2:raycast(v20, v19 - v20, v22, {
                ["ignorePart"] = function(p28) --[[ Name: ignorePart, Line 54 ]]
                    --[[
                    Upvalues:
                        [1] = u27
                    --]]
                    return table.find(u27, p28) ~= nil
                end
            })
            local v31 = u2:raycast(v14, v19 - v14, v22, {
                ["ignorePart"] = function(p30) --[[ Name: ignorePart, Line 60 ]]
                    --[[
                    Upvalues:
                        [1] = u27
                    --]]
                    return table.find(u27, p30) ~= nil
                end
            })
            local v33 = u2:raycast(v20, v21 - v20, v22, {
                ["ignorePart"] = function(p32) --[[ Name: ignorePart, Line 66 ]]
                    --[[
                    Upvalues:
                        [1] = u27
                    --]]
                    return table.find(u27, p32) ~= nil
                end
            })
            local v35 = u2:raycast(v14, v21 - v14, v22, {
                ["ignorePart"] = function(p34) --[[ Name: ignorePart, Line 72 ]]
                    --[[
                    Upvalues:
                        [1] = u27
                    --]]
                    return table.find(u27, p34) ~= nil
                end
            })
            if v29 ~= nil then
                v29 = v29.Instance
            end
            if v29 then
                if v31 ~= nil then
                    v31 = v31.Instance
                end
                if v31 then
                    if v33 ~= nil then
                        v33 = v33.Instance
                    end
                    if v33 then
                        if v35 ~= nil then
                            v35 = v35.Instance
                        end
                    else
                        v35 = v33
                    end
                else
                    v35 = v31
                end
            else
                v35 = v29
            end
            return not v35
        end
    }
}