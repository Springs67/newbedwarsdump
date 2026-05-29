local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
return {
    ["MoveShipsBehavior"] = {
        ["name"] = "Move ships",
        ["event"] = "Heartbeat",
        ["func"] = function(p5, p6, _) --[[ Name: func, Line 9 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u3
                [3] = u4
            --]]
            local v7
            if u2.isHoarceKat() then
                v7 = Vector3.new()
            else
                v7 = u3.Controllers.MapController:getCFrameWithoutYield("center")
                if v7 ~= nil then
                    v7 = v7.Position
                end
                if v7 == nil then
                    v7 = Vector3.new()
                end
            end
            local v8 = v7.X
            local v9 = u4.isGameServer() and 150 or 500
            local v10 = v7.Z
            local v11 = Vector3.new(v8, v9, v10)
            local v12 = p6:get("ships")
            if v12 == nil then
                return nil
            end
            local v13 = p5.chainInfo == nil and 0 or p5.chainInfo.stageInChain
            for _, v14 in v12 do
                local v15
                if v13 > 0 then
                    local v16 = p5.chainInfo
                    if v16 ~= nil then
                        v16 = v16.length1
                    end
                    v15 = (v16 == nil and 0 or v16) + p5.elapsedEventTime
                else
                    v15 = p5.elapsedEventTime
                end
                local v17 = v15 + v14.timeOffset
                local v18 = v14.seed
                local v19 = CFrame.new(math.noise(v17 / 15, 0, v18) * 3, math.noise(v17 / 15, 0, -v18) * 10, 0)
                local v20 = v14.radiusX + math.noise(v17 / 40, v18) * 8
                local v21 = v14.radiusY + math.noise(v17 / 40, -v18 + -v18) * 8
                local v22 = v17 / 60
                local v23 = math.cos(v22) * v20
                local v24 = v14.heightOffset
                local v25 = v17 / 60
                local v26 = math.sin(v25) * v21
                local v27 = v11 + Vector3.new(v23, v24, v26)
                local v28 = (v17 + 1) / 60
                local v29 = math.cos(v28) * v20
                local v30 = v14.heightOffset
                local v31 = (v17 + 1) / 60
                local v32 = math.sin(v31) * v21
                local v33 = v11 + Vector3.new(v29, v30, v32)
                local v34 = math.noise(v17 / 15, 0, v18) * 1
                local v35 = math.noise(v17 / 15, 0, -v18) * 0.1
                local v36 = v17 / 1.8
                local v37 = v35 + math.sin(v36) * 0.05
                local v38 = math.noise(v17 / 15, 0, v18) * 0.4
                v14.cframe = CFrame.lookAt(v27, CFrame.new(v33).Position) * v19 * CFrame.Angles(v37, v34, v38)
            end
            p6:set("ships", v12)
        end
    }
}