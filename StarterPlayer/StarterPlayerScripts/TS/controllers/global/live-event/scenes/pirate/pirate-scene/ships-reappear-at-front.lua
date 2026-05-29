local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u5 = v4.InQuart
local u6 = v4.Linear
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "plasma", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "bezier")
return {
    ["ShipsReappearAtFrontBehavior"] = {
        ["name"] = "Ships reappear at front",
        ["event"] = "Heartbeat",
        ["func"] = function(p12, p13, _) --[[ Name: func, Line 16 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u8
                [3] = u11
                [4] = u6
                [5] = u2
                [6] = u10
                [7] = u3
                [8] = u7
                [9] = u5
            --]]
            local v14 = p13:get("ships")
            if v14 == nil then
                return nil
            end
            if p12.elapsedEventTime < u9.ShipReappears then
                return nil
            end
            if not p13:get("bezierCurve") then
                local v15 = u8:GetTagged("pirate-ship-waypoint")
                table.sort(v15, function(p16, p17) --[[ Line: 26 ]]
                    local v18 = p16.Name
                    local v19 = tonumber(v18)
                    local v20 = v19 == nil and 0 or v19
                    local v21 = p17.Name
                    local v22 = tonumber(v21)
                    return v20 < (v22 == nil and 0 or v22)
                end)
                local v23 = 0
                local v24 = {}
                for v25, v26 in v15 do
                    local _ = v25 - 1
                    if (v26:IsA("BasePart") and true or false) == true then
                        v23 = v23 + 1
                        v24[v23] = v26
                    end
                end
                if #v24 < 2 then
                    return nil
                end
                p13:set("bezierCurve", u11.new(unpack(v24)))
            end
            local v27 = v14.ship1
            if v27 == nil then
                return nil
            end
            local v28 = u6
            local v29 = p12.elapsedEventTime
            local v30 = u9.ShipGetShotDown
            local v31 = v28(math.min(v29, v30), 0, 1, u9.ShipGetShotDown + 10)
            if p12.elapsedEventTime < u9.HouseExplodes then
                if not p13:get("bossBarMounted") then
                    u2:playSound(u10.PIRATE_EVENT_FIRST_ENTRY, {
                        ["position"] = Vector3.new(17, 315.703, -300),
                        ["rollOffMinDistance"] = 500,
                        ["rollOffMaxDistance"] = 100000
                    })
                    p13:set("bossBarMounted", true)
                    u3.Controllers.BossBarController:mountBossBar(1000, 1000)
                end
            else
                u3.Controllers.BossBarController:unmountBar()
            end
            if p12.elapsedEventTime > u9.ShipGetShotDown then
                local u32, v33 = u7.useState(nil)
                u7.useEffect(function() --[[ Line: 82 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u10
                        [3] = u32
                    --]]
                    local v34 = u2
                    local v35 = u10.PIRATE_EVENT_SHIP_CREAK
                    local v36 = {}
                    local v37 = u32
                    if v37 ~= nil then
                        v37 = v37.Position
                    end
                    v36.position = v37
                    v36.rollOffMaxDistance = 500
                    v36.rollOffMinDistance = 300
                    v34:playSound(v35, v36)
                end)
                if u32 == nil then
                    v33(v27.cframe)
                    return nil
                end
                local v38 = u5(p12.elapsedEventTime - u9.ShipGetShotDown, 0, 1, u9.HouseExplodes + 1.2 - u9.ShipGetShotDown)
                local v39 = math.clamp(v38, 0, 1)
                local v40 = u32.LookVector
                local v41 = (Vector3.new(183.959, 315.427, 323.018) - u32.Position).Unit
                local v42
                if v39 < 0.88 then
                    local v43 = math.noise(-p12.elapsedEventTime * 50)
                    local v44 = math.noise(0, 0, p12.elapsedEventTime * 50)
                    local v45 = math.noise
                    local v46 = p12.elapsedEventTime * 50 + p12.elapsedEventTime * 50
                    v42 = Vector3.new(v43, v44, v45(0, 0, v46))
                else
                    v42 = Vector3.new()
                end
                local v47 = v40:Lerp(v41, v39 * 0.7)
                local v48 = u32.Position:Lerp(Vector3.new(183.959, 320.427, 323.018) + v42 * 0.6, v39)
                v27.cframe = CFrame.lookAt(v48, v48 + v47)
            else
                local v49 = math.clamp(v31, 0, 1)
                local v50 = p13:get("bezierCurve"):CalculatePositionAt(v49)
                local v51 = p13:get("bezierCurve"):CalculateDerivativeAt(v49)
                v27.cframe = CFrame.lookAt(v50, v50 + v51)
            end
            p13:set("ships", v14)
        end
    }
}