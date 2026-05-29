local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u5 = v4.InOutCubic
local u6 = v4.OutElastic
local u7 = v4.OutExpo
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = UDim2.fromScale(0.18, 0.1)
local u15 = UDim2.fromScale(0.22, 0.11)
return {
    ["DasherProgressBar"] = v9.new(u8)(function(u16, p17) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u13
            [3] = u10
            [4] = u3
            [5] = u12
            [6] = u2
            [7] = u1
            [8] = u11
            [9] = u5
            [10] = u6
            [11] = u15
            [12] = u7
            [13] = u8
        --]]
        local v18 = p17.useEffect
        local v19 = p17.useBinding
        local v20, u21 = v19(0)
        local v22, u23 = v19(u14)
        local v24 = u13.DAO_CHARGING
        local v25 = u10.LocalPlayer
        if v25 ~= nil then
            v25 = v25.Character
        end
        local v26
        if v25 then
            local v27 = u3.Controllers.KitController:getKitSkin(v25)
            if v27 then
                v26 = u12[v27].yuzi
                if v26 ~= nil then
                    v26 = v26.dashChargingSound
                end
                local v28
                if v26 == "" or not v26 then
                    v28 = v26
                else
                    v28 = #v26 > 0
                end
                if v28 == "" then
                    v26 = v24
                elseif not v28 then
                    v26 = v24
                end
            else
                v26 = v24
            end
        else
            v26 = v24
        end
        local u29 = u2:playSound(v26)
        v18(function() --[[ Line: 47 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u11
                [3] = u16
                [4] = u5
                [5] = u21
                [6] = u2
                [7] = u13
                [8] = u6
                [9] = u23
                [10] = u14
                [11] = u15
                [12] = u7
                [13] = u29
            --]]
            local u30 = true
            u1.Promise.try(function() --[[ Line: 49 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u16
                    [3] = u5
                    [4] = u21
                    [5] = u30
                    [6] = u2
                    [7] = u13
                    [8] = u6
                    [9] = u23
                    [10] = u14
                    [11] = u15
                    [12] = u7
                --]]
                u11(u16.chargeTime, u5, function(p31) --[[ Line: 50 ]]
                    --[[
                    Upvalues:
                        [1] = u21
                        [2] = u16
                    --]]
                    u21(p31 / u16.chargeTime)
                end, 0, u16.chargeTime):Wait()
                task.delay(0.05, function() --[[ Line: 53 ]]
                    --[[
                    Upvalues:
                        [1] = u30
                        [2] = u2
                        [3] = u13
                    --]]
                    if u30 then
                        u2:playSound(u13.DAO_CHARGE_COMPLETE)
                    end
                end)
                u11(0.15, u6, function(p32) --[[ Line: 58 ]]
                    --[[
                    Upvalues:
                        [1] = u23
                    --]]
                    u23(p32)
                end, u14, u15):Wait()
                u11(0.2, u7, function(p33) --[[ Line: 61 ]]
                    --[[
                    Upvalues:
                        [1] = u23
                    --]]
                    u23(p33)
                end, u15, u14)
            end)
            return function() --[[ Line: 65 ]]
                --[[
                Upvalues:
                    [1] = u30
                    [2] = u29
                --]]
                u30 = false
                local v34 = u29
                if v34 ~= nil then
                    v34:Stop()
                end
            end
        end)
        return u8.createElement("Frame", {
            ["BackgroundTransparency"] = 0.7,
            ["BorderSizePixel"] = 0,
            ["Size"] = v22,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.7),
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
        }, { u8.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 10.95890410958904,
                ["DominantAxis"] = "Height"
            }), u8.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["Size"] = v20:map(function(p35) --[[ Line: 86 ]]
                    return UDim2.fromScale(p35, 1)
                end)
            }, { u8.createElement("UIGradient", {
                    ["Color"] = ColorSequence.new(Color3.fromRGB(255, 33, 33), Color3.fromRGB(255, 89, 89))
                }) }) })
    end)
}