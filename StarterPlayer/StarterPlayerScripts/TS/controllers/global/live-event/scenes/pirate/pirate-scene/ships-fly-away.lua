local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps
return {
    ["ShipsFlyAwayBehavior"] = {
        ["name"] = "Ships fly away",
        ["priority"] = 100,
        ["event"] = "Heartbeat",
        ["func"] = function(p5, p6, _) --[[ Name: func, Line 10 ]]
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
            local v9 = v7.Z
            local v10 = Vector3.new(v8, 150, v9)
            local v11 = p6:get("ships")
            if v11 == nil then
                return nil
            end
            if p5.elapsedEventTime > u4.ShipsDisappear then
                return nil
            end
            local v12 = p5.chainInfo == nil and 0 or p5.chainInfo.stageInChain
            for _, v13 in v11 do
                local v14
                if v12 > 0 then
                    local v15 = p5.chainInfo
                    if v15 ~= nil then
                        v15 = v15.length1
                    end
                    v14 = (v15 == nil and 0 or v15) + p5.elapsedEventTime
                else
                    v14 = p5.elapsedEventTime
                end
                local v16 = v14 + v13.timeOffset
                local v17 = v13.seed
                local v18 = CFrame.new(math.noise(v16 / 15, 0, v17) * 3, math.noise(v16 / 15, 0, -v17) * 10, 0)
                local v19 = v13.radiusX + math.noise(v16 / 40, v17) * 8
                local v20 = v13.radiusY + math.noise(v16 / 40, -v17 + -v17) * 8
                local v21 = (v13.cframe.Position - v10).Unit
                local v22 = v16 / 60
                local v23 = math.cos(v22) * v19
                local v24 = v13.heightOffset
                local v25 = v16 / 60
                local v26 = math.sin(v25) * v20
                local v27 = Vector3.new(v23, v24, v26)
                local v28 = v21 * (p5.elapsedEventTime * 100)
                local v29 = v10 + v27 + v28
                local v30 = (v16 + 1) / 60
                local v31 = math.cos(v30) * v19
                local v32 = v13.heightOffset
                local v33 = (v16 + 1) / 60
                local v34 = math.sin(v33) * v20
                local v35 = Vector3.new(v31, v32, v34)
                local v36 = v21 * (p5.elapsedEventTime * 100)
                local v37 = v21 * (p5.elapsedEventTime * 10)
                local v38 = v10 + v35 + v36 + v37
                local v39 = math.noise(v16 / 15, 0, v17) * 1
                local v40 = math.noise(v16 / 15, 0, -v17) * 0.1
                local v41 = v16 / 1.8
                local v42 = v40 + math.sin(v41) * 0.05
                local v43 = math.noise(v16 / 15, 0, v17) * 0.4
                v13.cframe = CFrame.lookAt(v29, CFrame.new(v38).Position) * v18 * CFrame.Angles(v42, v39, v43)
            end
            p6:set("ships", v11)
        end
    }
}