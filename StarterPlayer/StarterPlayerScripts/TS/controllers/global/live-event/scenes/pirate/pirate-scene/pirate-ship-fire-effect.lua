return {
    ["PirateShipFireEffect"] = {
        ["name"] = "pirate fire effect",
        ["event"] = "Heartbeat",
        ["func"] = function(_, p1, _) --[[ Name: func, Line 5 ]]
            local v2 = p1:get("ships")
            if v2 ~= nil then
                v2 = v2.ship1
            end
            if not v2 then
                return nil
            end
            local v3 = p1:get("shipHealth")
            local v4 = v3 == nil and 1000 or v3
            local v5 = (800 - v4) / 75
            local v6 = math.clamp(v5, 0, 5)
            local v7 = math.ceil(v6)
            local v8 = (230 - v4) / 50
            local v9 = math.clamp(v8, 0, 5)
            local v10 = math.ceil(v9)
            local v11 = false
            local v12 = 1
            while true do
                if v11 then
                    v12 = v12 + 1
                else
                    v11 = true
                end
                if v12 > 5 then
                    return
                end
                local v13 = v12 <= v10
                if v12 <= v7 then
                    local v14 = v2.instance:FindFirstChild("DamagePoints")
                    if v14 ~= nil then
                        v14 = v14:FindFirstChild((tostring(v12)))
                    end
                    if v14 ~= nil then
                        v14 = v14:GetChildren()
                    end
                    for _, v15 in v14 == nil and {} or v14 do
                        if (v15.Name == "Smoke" or v13) and v15:IsA("ParticleEmitter") then
                            v15.Enabled = true
                        end
                        if v13 and v15:IsA("Light") then
                            v15.Enabled = true
                        end
                    end
                end
            end
        end
    }
}