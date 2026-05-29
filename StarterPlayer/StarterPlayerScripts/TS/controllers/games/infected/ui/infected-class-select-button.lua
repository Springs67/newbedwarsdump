local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.ShineEffect
local u6 = v2.ShineEffectVariation
local u7 = v2.SoundManager
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
return {
    ["InfectedClassSelectButton"] = v9.new(u8)(function(u13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u4
            [3] = u10
            [4] = u3
            [5] = u8
            [6] = u7
            [7] = u12
            [8] = u5
            [9] = u6
        --]]
        local v15 = p14.useState
        local v16 = p14.useEffect
        local u17, u18 = v15(false)
        local v19, u20 = v15(false)
        v16(function() --[[ Line: 24 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u10
                [3] = u13
                [4] = u18
            --]]
            if u4.isHoarceKat() then
                return nil
            end
            if u10.LocalPlayer:GetAttribute("InfectedVariantType") == u13.VariantType then
                u18(true)
            else
                u18(false)
            end
            local u21 = u10.LocalPlayer:GetAttributeChangedSignal("InfectedVariantType"):Connect(function() --[[ Line: 37 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u13
                    [3] = u18
                --]]
                if u10.LocalPlayer:GetAttribute("InfectedVariantType") == u13.VariantType then
                    u18(true)
                else
                    u18(false)
                end
            end)
            return function() --[[ Line: 40 ]]
                --[[
                Upvalues:
                    [1] = u21
                --]]
                return u21:Disconnect()
            end
        end, {})
        local v22 = {
            ["Size"] = UDim2.fromScale(0.2, 0.85)
        }
        local v23
        if v19 then
            v23 = u3.WHITE
        else
            v23 = u3.BLACK
        end
        v22.BackgroundColor3 = v23
        v22.BackgroundTransparency = 0.7
        v22.LayoutOrder = u13.LayoutOrder
        v22[u8.Event.Activated] = function() --[[ Line: 49 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u13
                [3] = u11
                [4] = u7
                [5] = u12
            --]]
            if u17 then
                return nil
            end
            local v24 = {
                ["variantType"] = u13.VariantType
            }
            u11.Client:Get("InfectedSelectVariant"):SendToServer(v24)
            u7:playSound(u12.UI_CLICK_2)
        end
        v22[u8.Event.MouseEnter] = function() --[[ Line: 56 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u7
                [3] = u12
            --]]
            u20(true)
            u7:playSound(u12.UI_HOVER)
        end
        v22[u8.Event.MouseLeave] = function() --[[ Line: 60 ]]
            --[[
            Upvalues:
                [1] = u20
            --]]
            u20(false)
        end
        local v25 = { u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }) }
        local v26 = #v25
        local v27 = not u17
        if v27 then
            v27 = u8.createElement(u5, {
                ["OnHover"] = true,
                ["ZIndex"] = 100,
                ["Variation"] = u6.solid
            })
        end
        if v27 then
            v25[v26 + 1] = v27
        end
        local v28 = #v25
        if u17 then
            local v29 = u8.createFragment
            local v30 = {}
            local v31 = u8.createElement
            local v32 = {
                ["BackgroundTransparency"] = 0.3,
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 11,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = u3.BLACK
            }
            local v33 = {
                u8.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.1, 0)
                }),
                ["VariantName"] = u8.createElement("TextLabel", {
                    ["Text"] = "EQUIPPED",
                    ["TextScaled"] = true,
                    ["TextStrokeTransparency"] = 1,
                    ["TextYAlignment"] = "Center",
                    ["BackgroundTransparency"] = 1,
                    ["ZIndex"] = 12,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(0.8, 0.15),
                    ["FontFace"] = Font.fromName("GothamBold", Enum.FontWeight.Bold),
                    ["TextColor3"] = u3.WHITE
                })
            }
            v30.Overlay = v31("Frame", v32, v33)
            u17 = v29(v30)
        end
        if u17 then
            v25[v28 + 1] = u17
        end
        local _ = #v25
        v25.VariantRender = u8.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["ScaleType"] = Enum.ScaleType.Fit,
            ["Image"] = u13.Metadata.image
        })
        v25.VariantName = u8.createElement("TextLabel", {
            ["TextScaled"] = true,
            ["TextStrokeTransparency"] = 1,
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["ZIndex"] = 10,
            ["Text"] = string.upper(u13.VariantType),
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.9),
            ["Size"] = UDim2.fromScale(0.8, 0.15),
            ["FontFace"] = Font.fromName("GothamBold", Enum.FontWeight.Bold),
            ["TextColor3"] = u3.WHITE
        }, { u8.createElement("UIStroke", {
                ["Color"] = u3.BLACK
            }) })
        return u8.createFragment({
            ["SelectBanner"] = u8.createElement("ImageButton", v22, v25)
        })
    end)
}