-- Decompiled with Potassium's decompiler.

return {
    PirateShipFireEffect = {
        name = "pirate fire effect",
        event = "Heartbeat",

        func = function(p1, p2, p3) -- Line: 5, Name: func
            local v4 = p2:get("ships");

            if v4 ~= nil then
                v4 = v4.ship1;
            end;

            if not v4 then
                return nil;
            end;

            local v5 = p2:get("shipHealth");
            local v6 = v5 == nil and 1000 or v5;
            local v7 = math.clamp((800 - v6) / 75, 0, 5);
            local v8 = math.ceil(v7);
            local v9 = math.clamp((230 - v6) / 50, 0, 5);
            local v10 = math.ceil(v9);
            local v11 = false;
            local v12 = 1;

            while true do
                if v11 then
                    v12 = v12 + 1;
                else
                    v11 = true;
                end;

                if v12 > 5 then
                    return;
                end;

                local v13 = v12 <= v10;

                if v12 <= v8 then
                    local DamagePoints = v4.instance:FindFirstChild("DamagePoints");

                    if DamagePoints ~= nil then
                        DamagePoints = DamagePoints:FindFirstChild((tostring(v12)));
                    end;

                    if DamagePoints ~= nil then
                        DamagePoints = DamagePoints:GetChildren();
                    end;

                    for _, v in DamagePoints == nil and {} or DamagePoints do
                        if (v.Name == "Smoke" or v13) and v:IsA("ParticleEmitter") then
                            v.Enabled = true;
                        end;

                        if v13 and v:IsA("Light") then
                            v.Enabled = true;
                        end;
                    end;
                end;
            end;
        end
    }
};