local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-spring", "src").useSpring
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.RunService
local u10 = v8.Workspace
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers").GetTarmacAsset
return {
    ["SurvivalUi"] = v6.new(u5)(function(u12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u9
            [3] = u10
            [4] = u5
            [5] = u11
            [6] = u3
            [7] = u4
        --]]
        local u14 = p13.useMemo(function() --[[ Line: 14 ]]
            --[[
            Upvalues:
                [1] = u12
            --]]
            return u12.health / u12.maxHealth
        end, { u12.health, u12.maxHealth })
        local v15 = p13.useMemo(function() --[[ Line: 17 ]]
            --[[
            Upvalues:
                [1] = u14
            --]]
            return 1 / u14
        end, { u14 })
        local v16 = u7(p13, {
            ["config"] = {
                ["tension"] = 440,
                ["friction"] = 26,
                ["mass"] = 0.6
            },
            ["to"] = {
                ["size1"] = UDim2.fromScale(u14, 1),
                ["size2"] = UDim2.fromScale(v15, 1)
            }
        }, { u14, v15 })
        local v17, u18 = u7(p13, function() --[[ Line: 31 ]]
            return {
                ["alpha"] = 0
            }
        end)
        p13.useEffect(function() --[[ Line: 36 ]]
            --[[
            Upvalues:
                [1] = u18
            --]]
            u18.start({
                ["alpha"] = 0.9,
                ["config"] = {
                    ["tension"] = 250,
                    ["friction"] = 14,
                    ["mass"] = 1
                }
            })
            task.delay(0.1, function() --[[ Line: 45 ]]
                --[[
                Upvalues:
                    [1] = u18
                --]]
                u18.start({
                    ["alpha"] = 0,
                    ["config"] = {
                        ["tension"] = 300,
                        ["friction"] = 14,
                        ["mass"] = 1
                    }
                })
            end)
        end, { u12.health })
        local v19, u20 = p13.useBinding(0)
        p13.useEffect(function() --[[ Line: 57 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u12
                [3] = u10
                [4] = u20
            --]]
            local u22 = u9.Heartbeat:Connect(function() --[[ Line: 59 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u10
                    [3] = u20
                --]]
                if os.clock() - -1 > 1 then
                    local v21 = u12.endTime - u10:GetServerTimeNow()
                    u20(v21 < 0 and 0 or math.floor(v21))
                end
            end)
            return function() --[[ Line: 65 ]]
                --[[
                Upvalues:
                    [1] = u22
                --]]
                u22:Disconnect()
            end
        end, { u12.endTime })
        local v23 = p13.useMemo(function() --[[ Line: 69 ]]
            --[[
            Upvalues:
                [1] = u12
            --]]
            return u12.state == 1 and "DEFENDING" or (u12.state == 0 and "INTERMISSION" or "DEFENDING")
        end, { u12.state })
        local v24 = u5.createElement
        local v25 = "Frame"
        local v26 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.08),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.05)
        }
        local v27 = {
            u5.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 6.069306930693069
            }),
            u5.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 3,
                ["Image"] = u11("healthbarstroke").Image,
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(1, 1)
            }),
            u5.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["ImageTransparency"] = 0.8,
                ["Image"] = u11("healthbarfill").Image,
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Size"] = UDim2.fromScale(1, 1),
                ["Position"] = UDim2.fromScale(0, 0.5),
                ["ImageColor3"] = Color3.fromRGB(41, 41, 41)
            }),
            ["HealthBarIcon"] = u5.createElement("ImageLabel", {
                ["Image"] = "rbxassetid://10320211982",
                ["SizeConstraint"] = "RelativeYY",
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.fromScale(0.1, 0.5)
            })
        }
        local v28 = u5.createElement
        local v29 = "TextLabel"
        local v30 = {
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["BackgroundTransparency"] = 1,
            ["Font"] = "RobotoCondensed",
            ["ZIndex"] = 2,
            ["Size"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.56)
        }
        local v31
        if u12.health > 0 then
            local v32 = u12.health
            local v33 = tostring(v32)
            local v34 = u12.maxHealth
            v31 = "<b>" .. v33 .. "<font transparency=\".3\"> / " .. tostring(v34) .. "</font></b>"
        else
            v31 = "<stroke color=\"#000000\" thickness=\"2\"><font color=\"" .. u3.richTextColor(Color3.fromHex("FC4545")) .. "\"><b>BED GONE! RUN!</b></font></stroke>"
        end
        v30.Text = v31
        v30.TextColor3 = Color3.fromRGB(255, 255, 255)
        v27.HealthBarText = v28(v29, v30)
        __set_list(v27, 4, {(u5.createElement("Frame", {
    ["ClipsDescendants"] = true,
    ["BackgroundTransparency"] = 1,
    ["Size"] = v16.size1,
    ["AnchorPoint"] = Vector2.new(0, 0.5),
    ["Position"] = UDim2.fromScale(0, 0.5)
}, { u5.createElement("ImageLabel", {
        ["BackgroundTransparency"] = 1,
        ["Image"] = u11("healthbarfill").Image,
        ["AnchorPoint"] = Vector2.new(0, 0.5),
        ["Size"] = v16.size2,
        ["Position"] = UDim2.fromScale(0, 0.5),
        ["ImageColor3"] = Color3.fromRGB(255, 255, 255)
    }, { u5.createElement("UIGradient", {
            ["Rotation"] = 90,
            ["Color"] = v17.alpha:map(function(p35) --[[ Line: 142 ]]
                return ColorSequence.new(Color3.fromRGB(252, 48, 85):Lerp(Color3.fromRGB(255, 0, 0), p35), Color3.fromRGB(255, 101, 138):Lerp(Color3.fromRGB(255, 0, 0), p35))
            end)
        }) }) }))})
        local v36 = u5.createElement
        local v37 = {
            ["BackgroundTransparency"] = 1,
            ["Rotation"] = -1,
            ["Image"] = u11("FunnyShape2").Image,
            ["Size"] = UDim2.fromScale(0.7, 0.6),
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Position"] = UDim2.fromScale(0.07, 1.1),
            ["ImageColor3"] = u3.hexColor(16632616)
        }
        local v38 = {}
        local v39 = u5.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 2.5247524752475248
        })
        local v40 = u5.createElement
        local v41 = {
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Font"] = "GothamBold",
            ["Size"] = UDim2.fromScale(0.8, 0.7),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }
        local v42 = u3.richTextColor(Color3.fromHex("fdcb28"))
        local v43 = u12.waveCount
        v41.Text = "<b>WAVE <font color=\"" .. v42 .. "\">" .. tostring(v43) .. "</font></b>"
        v41.TextColor3 = Color3.fromRGB(255, 255, 255)
        __set_list(v38, 1, {v39, v40("TextLabel", v41)})
        v27.WaveCount = v36("ImageLabel", v37, v38)
        v27.Timer = u5.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["Image"] = u11("FunnyShape1").Image,
            ["Size"] = UDim2.fromScale(0.45, 0.45),
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["Position"] = UDim2.fromScale(1, 1.02),
            ["ImageColor3"] = u3.hexColor(1037307)
        }, { u5.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 2.1363636363636362
            }), u5.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["Font"] = "GothamBold",
                ["Size"] = UDim2.fromScale(1, 0.6),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Text"] = v19:map(function(p44) --[[ Line: 188 ]]
                    return tostring(p44) .. "s"
                end),
                ["TextColor3"] = Color3.fromHex("363636") or Color3.fromRGB(255, 255, 255)
            }) })
        v27.WaveStatus = u5.createElement(u4, {
            ["Size"] = UDim2.fromScale(0.6, 0.45),
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["Position"] = UDim2.fromScale(0.83, 1.02)
        }, { u5.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 3.3333333333333335
            }), u5.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["Font"] = "GothamBold",
                ["Size"] = UDim2.fromScale(1, 1),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Text"] = v23,
                ["TextColor3"] = u3.WHITE
            }, { u5.createElement("UIStroke", {
                    ["Thickness"] = 1,
                    ["Color"] = Color3.fromRGB(0, 0, 0)
                }) }) })
        return v24(v25, v26, v27)
    end, {
        ["componentType"] = "PureComponent"
    })
}