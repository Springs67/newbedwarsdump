local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ProgressBar
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.RunService
local u7 = v5.Workspace
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "sorcerer-balance").SorcererBalance
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["SpellChargeComponent"] = v4.new(u3)(function(u11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u9
            [3] = u8
            [4] = u6
            [5] = u3
            [6] = u2
            [7] = u10
        --]]
        local v13 = p12.useState
        local v14 = p12.useEffect
        local v15, u16 = v13(0)
        v14(function() --[[ Line: 16 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u9
                [3] = u8
                [4] = u11
                [5] = u6
                [6] = u16
            --]]
            local u17 = u7:GetServerTimeNow()
            local v18 = u9.getSorcererTierData(u9.HIGHEST_TIER)
            local u19 = u17 + u8.CastTimeModifierCheck:fire(v18.secCharge).castTime - u17
            local u20 = u8.CastTimeModifierCheck:fire(u9.getSorcererTierData(u11.maxTier).secCharge).castTime
            local u21 = u20 / u8.CastTimeModifierCheck:fire(v18.secCharge).castTime
            local u22 = nil
            u22 = u6.Heartbeat:Connect(function(_) --[[ Line: 24 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u17
                    [3] = u20
                    [4] = u16
                    [5] = u21
                    [6] = u22
                    [7] = u19
                --]]
                local v23 = u7:GetServerTimeNow() - u17
                if u20 <= v23 then
                    u16(u21)
                    u22:Disconnect()
                end
                local v24 = v23 / u19
                u16((math.clamp(v24, 0, 1)))
            end)
            return function() --[[ Line: 33 ]]
                --[[
                Upvalues:
                    [1] = u22
                --]]
                u22:Disconnect()
            end
        end, {})
        return u3.createElement(u2, {
            ["GradientRotation"] = 0,
            ["AcceptZero"] = true,
            ["Pills"] = 3,
            ["DividerTransparency"] = 0.5,
            ["Size"] = u10.actionBarProgressBarSize:Lerp(UDim2.fromScale(0, 0), 0.3),
            ["Progress"] = v15,
            ["BarGradient"] = ColorSequence.new(Color3.fromRGB(250, 171, 255), Color3.fromRGB(235, 23, 255))
        })
    end)
}