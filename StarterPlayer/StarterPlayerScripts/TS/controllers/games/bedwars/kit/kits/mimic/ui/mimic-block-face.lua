local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["MimicBlockFace"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u4)(function(p5, p6) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
            [3] = u4
        --]]
        local v7 = p6.useState
        local v8 = p6.useEffect
        local v9, u10 = v7(0)
        v8(function() --[[ Line: 12 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u10
            --]]
            local u11 = u3.new()
            local u12 = true
            u11:GiveTask(function() --[[ Line: 15 ]]
                --[[
                Upvalues:
                    [1] = u12
                --]]
                u12 = false
                return u12
            end)
            task.spawn(function() --[[ Line: 19 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u10
                --]]
                local v13 = os.clock()
                while true do
                    local v14 = task.wait(0)
                    if v14 ~= 0 and (v14 == v14 and v14) then
                        v14 = u12
                    end
                    if v14 == 0 or (v14 ~= v14 or not v14) then
                        return
                    end
                    local v15 = u10
                    local v16 = (os.clock() - v13) / 0.5
                    v15((math.pow(v16, 1.5)))
                end
            end)
            return function() --[[ Line: 33 ]]
                --[[
                Upvalues:
                    [1] = u11
                --]]
                u11:DoCleaning()
            end
        end, {})
        local u17 = ColorSequence.new({ ColorSequenceKeypoint.new(0, u2.hexColor(16761445)), ColorSequenceKeypoint.new(0.5, u2.hexColor(6684520)), ColorSequenceKeypoint.new(1, u2.hexColor(14247423)) })
        local u18 = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.5, 0.75),
            NumberSequenceKeypoint.new(0.6, 1),
            NumberSequenceKeypoint.new(0.7, 0.75),
            NumberSequenceKeypoint.new(0.8, 1),
            NumberSequenceKeypoint.new(0.9, 0.5),
            NumberSequenceKeypoint.new(1, 0.6)
        })
        if p5.face == Enum.NormalId.Left then
            local v19 = u17.Keypoints
            local v20 = table.create(#v19)
            for v21, v22 in v19 do
                local _ = v21 - 1
                v20[v21] = ColorSequenceKeypoint.new(1 - v22.Time, v22.Value)
            end
            table.sort(v20, function(p23, p24) --[[ Line: 50 ]]
                return p23.Time < p24.Time
            end)
            u17 = ColorSequence.new(v20)
            local v25 = u18.Keypoints
            local v26 = table.create(#v25)
            for v27, v28 in v25 do
                local _ = v27 - 1
                v26[v27] = NumberSequenceKeypoint.new(1 - v28.Time, v28.Value)
            end
            table.sort(v26, function(p29, p30) --[[ Line: 65 ]]
                return p29.Time < p30.Time
            end)
            u18 = NumberSequence.new(v26)
        end
        local function v44(p31) --[[ Line: 72 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u18
            --]]
            local v32 = math.clamp(p31, 0, 1)
            local v33 = u17.Keypoints[1]
            local v34 = nil
            for _, v35 in u17.Keypoints do
                if v33.Time <= v32 and v32 <= v35.Time then
                    local v36 = v35.Time - v33.Time
                    if v36 > 0 then
                        v34 = v33.Value:Lerp(v35.Value, (v32 - v33.Time) / v36)
                    else
                        v34 = v33.Value
                    end
                    break
                end
                v33 = v35
            end
            local v37 = -1
            for v38, v39 in u18.Keypoints do
                local _ = v38 - 1
                if v32 <= v39.Time == true then
                    v37 = v38 - 1
                    break
                end
            end
            local v40
            if v37 == 0 then
                v40 = u18.Keypoints[v37 + 1].Value
            else
                local v41 = u18.Keypoints[v37 + 1]
                local v42 = u18.Keypoints[v37 - 1 + 1]
                local v43 = (v32 - v41.Time) / (v42.Time - v41.Time)
                v40 = v41.Value * (1 - v43) + v42.Value * v43
            end
            return {
                ["transparencyResult"] = v40,
                ["colorResult"] = v34
            }
        end
        local v45 = { Enum.NormalId.Front, Enum.NormalId.Back }
        local v46 = p5.face
        local v47 = table.find(v45, v46) ~= nil
        local v48 = u17
        local v49 = u18
        if v47 then
            local v50 = v44(1 - (v9 + (p5.face == Enum.NormalId.Front and 0 or 0.5)))
            v48 = ColorSequence.new(v50.colorResult)
            v49 = NumberSequence.new(v50.transparencyResult)
        end
        local v51 = u4.createElement
        local v52 = "SurfaceGui"
        local v53 = {
            ["LightInfluence"] = 0,
            ["Brightness"] = 6,
            ["ClipsDescendants"] = true,
            ["Face"] = p5.face
        }
        local v54 = {}
        local v55 = u4.createElement
        local v56 = "Frame"
        local v57 = {
            ["Size"] = UDim2.fromScale(2, 1)
        }
        local v58 = {}
        local v59 = u4.createElement
        local v60 = "UIGradient"
        local v61 = {
            ["Color"] = v48,
            ["Transparency"] = v49
        }
        local v62 = Vector2.new
        local v63
        if v47 then
            v63 = 0
        elseif p5.face == Enum.NormalId.Left then
            v63 = -1 * v9
        else
            v63 = v9 - 0.5
        end
        v61.Offset = v62(v63, 0)
        __set_list(v58, 1, {v59(v60, v61)})
        __set_list(v54, 1, {v55(v56, v57, v58)})
        return v51(v52, v53, v54)
    end)
}