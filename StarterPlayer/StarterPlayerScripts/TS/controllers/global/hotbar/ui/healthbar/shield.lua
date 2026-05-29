local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u8 = v1.import(script, script.Parent, "healthbar").Healthbar
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shield", "shield-util").getShieldColor
return {
    ["HEALTHBAR_SHIELD_COLOR"] = Color3.fromRGB(240, 240, 240),
    ["Shield"] = v5.new(u4)(function(u10, p11) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u3
            [3] = u2
            [4] = u6
            [5] = u9
            [6] = u4
            [7] = u8
        --]]
        local v12 = p11.useState
        local _ = p11.useMemo
        local v13 = p11.useEffect
        local v14, u15 = v12(0)
        v13(function() --[[ Line: 17 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u15
                [3] = u10
                [4] = u3
                [5] = u2
                [6] = u6
            --]]
            local v16 = u7:getLocalPlayerEntity()
            local v17 = u15
            if v16 ~= nil then
                v16 = v16:getShield(u10.ShieldType)
            end
            v17(v16 == nil and 0 or v16)
            local u18 = true
            local u19 = u3.new()
            u19:GiveTask(u2(function(p20, _) --[[ Line: 31 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u7
                    [3] = u18
                    [4] = u19
                    [5] = u10
                    [6] = u15
                --]]
                if p20 == u6.LocalPlayer then
                    local u21 = u7:getLocalPlayerEntity()
                    if u21 and u18 then
                        u19:GiveTask(u21:onShieldChanged(u10.ShieldType):Connect(function() --[[ Line: 35 ]]
                            --[[
                            Upvalues:
                                [1] = u15
                                [2] = u21
                                [3] = u10
                            --]]
                            local v22 = u15
                            local v23 = u21
                            if v23 ~= nil then
                                v23 = v23:getShield(u10.ShieldType)
                            end
                            v22(v23 == nil and 0 or v23)
                        end))
                    end
                end
            end))
            return function() --[[ Line: 50 ]]
                --[[
                Upvalues:
                    [1] = u18
                    [2] = u19
                --]]
                u18 = false
                u19:DoCleaning()
            end
        end, { u10.ShieldType })
        local v24 = u7:getLocalPlayerEntity()
        local v25 = u9(u10.ShieldType)
        local v26 = math.max(v14, 0)
        local v27 = {}
        local v28 = UDim2
        local v29 = math
        if v24 ~= nil then
            v24 = v24:getMaxHealth()
        end
        local v30 = v24 == nil and 100 or v24
        local v31 = v28.fromScale
        local v32 = v26 / (v30 + v26)
        v27.Size = v31(v29.min(1, v32), 1)
        v27.FillRatio = 1
        v27.FillColor = v25
        v27.BackgroundColor = ColorSequence.new(Color3.fromRGB(0, 0, 0))
        v27.BarTweenSpeed = 0.01
        return u4.createElement(u8, v27)
    end)
}