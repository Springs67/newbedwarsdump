local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "disruptor-balance").DisruptorBalance
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["SatelliteDishBillboard"] = v5.new(u4)(function(u10, p11) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u8
            [3] = u7
            [4] = u6
            [5] = u4
            [6] = u2
            [7] = u9
        --]]
        local v12 = p11.useState
        local v13 = p11.useEffect
        local u14 = 0
        local u15 = 0
        local v16, u17 = v12(u14)
        local v18, u19 = v12(u15)
        local v20, u21 = v12(0)
        local v22, u23 = v12(nil)
        v13(function() --[[ Line: 28 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u8
                [3] = u7
                [4] = u14
                [5] = u17
                [6] = u15
                [7] = u19
                [8] = u21
                [9] = u6
                [10] = u10
                [11] = u23
            --]]
            local u24 = 0
            local u25 = 0
            local u26 = u3.new()
            u26:GiveTask((u8.Client:WaitFor("DisruptionCollect"):expect():Connect(function(p27) --[[ Line: 32 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u14
                    [3] = u17
                    [4] = u15
                    [5] = u19
                --]]
                if p27.resource == u7.IRON then
                    u14 = u14 + p27.amount
                    u17(u14)
                elseif p27.resource == u7.EMERALD then
                    u15 = u15 + p27.amount
                    u19(u15)
                end
            end)))
            local u28 = true
            u26:GiveTask(function() --[[ Line: 43 ]]
                --[[
                Upvalues:
                    [1] = u28
                --]]
                u28 = false
            end)
            local u29 = false
            task.spawn(function() --[[ Line: 47 ]]
                --[[
                Upvalues:
                    [1] = u28
                    [2] = u29
                    [3] = u24
                    [4] = u21
                    [5] = u6
                    [6] = u10
                    [7] = u25
                --]]
                while true do
                    local v30 = u28
                    if v30 then
                        v30 = task.wait(1)
                    end
                    if v30 == 0 or (v30 ~= v30 or not v30) then
                        return
                    end
                    if u29 then
                        u24 = u24 + 1
                        u21(u24 / u6.EXPIRE_TIME_SECONDS)
                    else
                        local v31 = os.time()
                        local v32 = u10.satelliteInstance:GetAttribute("DisabledEndTime")
                        if v31 <= (v32 == nil and 0 or v32) then
                            u25 = u25 + 1
                            u21(u25 / u6.SATELLITE_DISABLED_DURATION)
                        end
                    end
                end
            end)
            u26:GiveTask(u10.player:GetAttributeChangedSignal("DisruptorActivation"):Connect(function() --[[ Line: 69 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u29
                --]]
                local v33 = u10.player:GetAttribute("DisruptorActivation")
                if v33 == nil then
                    v33 = false
                end
                u29 = v33
            end))
            u26:GiveTask(u10.satelliteInstance:GetAttributeChangedSignal("DisabledEndTime"):Connect(function() --[[ Line: 76 ]]
                --[[
                Upvalues:
                    [1] = u25
                    [2] = u10
                    [3] = u23
                    [4] = u21
                    [5] = u24
                    [6] = u6
                --]]
                u25 = 0
                local u34 = u10.satelliteInstance:GetAttribute("DisabledEndTime")
                local v35 = os.time()
                if u34 ~= nil and v35 <= u34 then
                    u23(u34)
                    local v36 = u34 - v35
                    task.delay(v36, function() --[[ Line: 83 ]]
                        --[[
                        Upvalues:
                            [1] = u34
                            [2] = u10
                            [3] = u23
                            [4] = u21
                            [5] = u24
                            [6] = u6
                        --]]
                        if u34 == u10.satelliteInstance:GetAttribute("DisabledEndTime") then
                            u23(nil)
                            u21(u24 / u6.EXPIRE_TIME_SECONDS)
                        end
                    end)
                end
            end))
            return function() --[[ Line: 91 ]]
                --[[
                Upvalues:
                    [1] = u26
                --]]
                u26:Destroy()
            end
        end, {})
        local v37
        if v22 == 0 or (v22 ~= v22 or not v22) then
            local v38 = u6.EXPIRE_TIME_SECONDS - v20 * u6.EXPIRE_TIME_SECONDS
            v37 = math.round(v38)
        else
            local v39 = u6.SATELLITE_DISABLED_DURATION - v20 * u6.SATELLITE_DISABLED_DURATION
            v37 = math.round(v39)
        end
        local v40 = v37 / 60
        local v41 = math.floor(v40)
        local v42 = u4.createFragment
        local v43 = {}
        local v44 = u4.createElement
        local v45 = "BillboardGui"
        local v46 = {
            ["ExtentsOffset"] = Vector3.new(0, 3.5, 0),
            ["MaxDistance"] = 30,
            ["Adornee"] = u10.satelliteInstance,
            ["Size"] = UDim2.fromScale(5, 6)
        }
        local v47 = {}
        local v48 = u4.createElement
        local v49 = "ImageLabel"
        local v50 = {
            ["Image"] = "rbxassetid://10667281451",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["ImageColor3"] = Color3.fromRGB(0, 255, 204)
        }
        local v51 = {}
        local v52 = u4.createElement
        local v53 = "Frame"
        local v54 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(0.5, 0.6),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.8, 0.7)
        }
        local v55 = {
            ["InterceptedHeader"] = u4.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["Text"] = "<b>" .. ((v22 == 0 or (v22 ~= v22 or not v22)) and "INTERCEPTED" or "DISABLED") .. "</b>",
                ["Size"] = UDim2.fromScale(1, 0.225),
                ["Font"] = Enum.Font.RobotoMono,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            })
        }
        local v56 = u4.createElement
        local v57 = u2
        local v58 = {
            ["Size"] = UDim2.fromScale(1, 0.05),
            ["Position"] = UDim2.fromScale(0, 0.25)
        }
        local v59 = {}
        local v60 = u4.createElement
        local v61 = u2
        local v62 = {
            ["Size"] = UDim2.fromScale(0.3, 1)
        }
        local v63 = {}
        local v64 = u4.createElement
        local v65 = "TextLabel"
        local v66 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["RichText"] = true,
            ["TextScaled"] = true
        }
        local v67 = "<b>"
        if v41 == 0 then
            v41 = "00"
        elseif #tostring(v41) <= 1 then
            v41 = "0" .. tostring(v41)
        end
        local v68 = tostring(v41)
        local v69 = ":"
        local v70 = v37 % 60
        if v70 == 0 then
            v70 = "00"
        elseif #tostring(v70) <= 1 then
            v70 = "0" .. tostring(v70)
        end
        v66.Text = v67 .. v68 .. v69 .. tostring(v70) .. "</b>"
        v66.Size = UDim2.fromScale(1.75, 1.75)
        v66.Position = UDim2.fromScale(0.5, 0.5)
        v66.AnchorPoint = Vector2.new(0.5, 0.5)
        v66.TextXAlignment = Enum.TextXAlignment.Center
        v66.TextYAlignment = Enum.TextYAlignment.Center
        v66.Font = Enum.Font.RobotoMono
        v66.TextColor3 = Color3.fromRGB(255, 255, 255)
        v63.InterceptedHeader = v64(v65, v66)
        local v71 = v60(v61, v62, v63)
        local v72 = u4.createElement
        local v73 = "Frame"
        local v74 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundColor3"] = u9.Gray,
            ["Size"] = UDim2.fromScale(0.7, 1),
            ["Position"] = UDim2.fromScale(0.3, 0)
        }
        local v75 = {}
        local v76 = u4.createElement
        local v77 = "Frame"
        local v78 = {
            ["BorderSizePixel"] = 0
        }
        local v79
        if v22 == 0 or (v22 ~= v22 or not v22) then
            v79 = Color3.fromRGB(v20 * 205 + 50, (1 - v20) * 205 + 50, 50)
        else
            v79 = Color3.fromRGB(255, 54, 54)
        end
        v78.BackgroundColor3 = v79
        v78.Size = UDim2.fromScale(v20, 1)
        __set_list(v75, 1, {v76(v77, v78)})
        __set_list(v59, 1, {v71, v72(v73, v74, v75)})
        __set_list(v55, 1, {(v56(v57, v58, v59))})
        v55.InterceptedContainer = u4.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.725),
            ["Position"] = UDim2.fromScale(0, 0.3725)
        }, {
            u4.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0.15, 0)
            }),
            ["IronIntercepted"] = u4.createElement("Frame", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 0.35)
            }, {
                ["IronIcon"] = u4.createElement("ImageLabel", {
                    ["Image"] = "rbxassetid://6850537969",
                    ["BackgroundTransparency"] = 0.75,
                    ["BorderSizePixel"] = 0,
                    ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
                    ["Size"] = UDim2.fromScale(0.4, 1),
                    ["SizeConstraint"] = Enum.SizeConstraint.RelativeXY,
                    ["ScaleType"] = Enum.ScaleType.Fit
                }, { u4.createElement("UIStroke", {
                        ["Thickness"] = 1,
                        ["Transparency"] = 0.75
                    }), u4.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 4)
                    }) }),
                ["IronCounter"] = u4.createElement("TextLabel", {
                    ["BorderSizePixel"] = 0,
                    ["BackgroundTransparency"] = 1,
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["Text"] = "x<b>" .. tostring(v16) .. "</b>",
                    ["Position"] = UDim2.fromScale(0.4, 0.15),
                    ["Size"] = UDim2.fromScale(0.6, 0.8),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["Font"] = Enum.Font.RobotoMono
                })
            }),
            ["EmeraldsIntercepted"] = u4.createElement("Frame", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 0.35),
                ["Position"] = UDim2.fromScale(0, 0.4)
            }, {
                ["EmeraldIcon"] = u4.createElement("ImageLabel", {
                    ["Image"] = "rbxassetid://6850538075",
                    ["BackgroundTransparency"] = 0.75,
                    ["BorderSizePixel"] = 0,
                    ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
                    ["Size"] = UDim2.fromScale(0.4, 1),
                    ["SizeConstraint"] = Enum.SizeConstraint.RelativeXY,
                    ["ScaleType"] = Enum.ScaleType.Fit
                }, { u4.createElement("UIStroke", {
                        ["Thickness"] = 1,
                        ["Transparency"] = 0.75
                    }), u4.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 4)
                    }) }),
                ["EmeraldCounter"] = u4.createElement("TextLabel", {
                    ["BorderSizePixel"] = 0,
                    ["BackgroundTransparency"] = 1,
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["Text"] = "x<b>" .. tostring(v18) .. "</b>",
                    ["Position"] = UDim2.fromScale(0.4, 0.15),
                    ["Size"] = UDim2.fromScale(0.6, 0.8),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["Font"] = Enum.Font.RobotoMono
                })
            })
        })
        v51.UsableArea = v52(v53, v54, v55)
        v47.BillboardFrame = v48(v49, v50, v51)
        v43.SatelliteBillboard = v44(v45, v46, v47)
        return v42(v43)
    end)
}