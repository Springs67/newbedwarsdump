local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.ProgressBar
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "tinker", "tinker-util").TinkerBalance
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shield", "shield-type").ShieldType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["TinkerArmorComponent"] = v7.new(u6)(function(p12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u6
            [3] = u4
            [4] = u11
            [5] = u9
            [6] = u3
            [7] = u5
            [8] = u10
        --]]
        local v14 = p13.useState
        local v15 = p13.useEffect
        local v16, u17 = v14(0)
        local u18 = u8:getEntity(p12.player)
        if not u18 then
            return u6.createElement(u4, {
                ["AcceptZero"] = true,
                ["Size"] = u11.actionBarProgressBarSize:Lerp(UDim2.fromScale(0, 0), 0.3),
                ["Progress"] = 0 / u9:getMaxShield(p12.player),
                ["BarGradient"] = ColorSequence.new(u3.hexColor(16773050), u3.hexColor(16777215))
            })
        end
        v15(function() --[[ Line: 26 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u18
                [3] = u10
                [4] = u17
            --]]
            local u19 = u5.new()
            if u18 then
                u19:GiveTask(u18:onShieldChanged(u10.TINKER_MACHINE):Connect(function() --[[ Line: 29 ]]
                    --[[
                    Upvalues:
                        [1] = u18
                        [2] = u10
                        [3] = u17
                    --]]
                    local v20 = u18:getShield(u10.TINKER_MACHINE)
                    u17(v20 == nil and 0 or v20)
                end))
            end
            return function() --[[ Line: 37 ]]
                --[[
                Upvalues:
                    [1] = u19
                --]]
                u19:DoCleaning()
            end
        end, {})
        local v21 = u6.createElement
        local v22 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.2),
            ["Position"] = UDim2.fromScale(0.5, -0.2),
            ["AnchorPoint"] = Vector2.new(0.5, 1)
        }
        local v23 = { (u6.createElement(u4, {
                ["AcceptZero"] = true,
                ["Size"] = UDim2.new(0.7, 0, 0.1, 0),
                ["Progress"] = v16 / u9:getMaxShield(p12.player),
                ["BarGradient"] = ColorSequence.new(Color3.new(1, 0.53, 0.04), Color3.new(1, 0.53, 0.04))
            })) }
        local v24 = u6.createElement
        local v25 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["Font"] = "LuckiestGuy",
            ["ZIndex"] = 11
        }
        local v26 = math.round(v16)
        local v27 = tostring(v26)
        local v28 = u9
        local v29 = p12.player
        v25.Text = v27 .. "/" .. tostring(v28:getMaxShield(v29)) .. " SHIELD"
        v25.Size = UDim2.fromScale(0.4, 0.15)
        v25.Position = UDim2.fromScale(0.5, 0.75)
        v25.AnchorPoint = Vector2.new(0.5, 0.35)
        v25.TextColor3 = Color3.fromRGB(255, 255, 255)
        v23.Progress = v24("TextLabel", v25)
        return v21("Frame", v22, v23)
    end)
}