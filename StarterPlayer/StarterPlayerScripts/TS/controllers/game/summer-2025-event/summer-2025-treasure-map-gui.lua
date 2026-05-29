local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.Players
local u7 = v5.RunService
local u8 = v5.Workspace
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["Summer2025TreasureMapGUI"] = v4.new(u3)(function(u10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u7
            [3] = u6
            [4] = u8
            [5] = u3
            [6] = u9
        --]]
        local v12 = p11.useState
        local v13 = p11.useEffect
        local v14, u15 = v12(UDim2.fromScale(0.5, 0.5))
        local v16, u17 = v12(0)
        local v18, u19 = v12(UDim2.fromScale(0.5, 0.5))
        local u20 = u2.new()
        local u21 = nil
        v13(function() --[[ Line: 19 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u6
                [3] = u15
                [4] = u21
                [5] = u8
                [6] = u17
                [7] = u10
                [8] = u19
                [9] = u20
            --]]
            u20:GiveTask((u7.Heartbeat:Connect(function(_) --[[ Line: 20 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u15
                    [3] = u21
                    [4] = u8
                    [5] = u17
                    [6] = u10
                    [7] = u19
                --]]
                local v22 = u6.LocalPlayer
                if v22 ~= nil then
                    v22 = v22.Character
                    if v22 ~= nil then
                        v22 = v22.PrimaryPart
                        if v22 ~= nil then
                            v22 = v22.Position
                        end
                    end
                end
                if v22 then
                    u15(u21(v22))
                    local v23 = u8.CurrentCamera
                    if v23 ~= nil then
                        v23 = v23.CFrame
                        if v23 ~= nil then
                            v23 = v23.LookVector
                        end
                    end
                    if v23 then
                        local v24 = v23.X
                        local v25 = -v23.Z
                        local v26 = math.atan2(v24, v25)
                        u17((math.deg(v26)))
                    end
                end
                if u10.TreasureModel then
                    u19(u21(u10.TreasureModel:GetPivot().Position))
                end
            end)))
            return function() --[[ Line: 56 ]]
                --[[
                Upvalues:
                    [1] = u20
                --]]
                u20:DoCleaning()
            end
        end, {})
        u21 = function(p27) --[[ Line: 60 ]]
            --[[
            Upvalues:
                [1] = u10
            --]]
            local v28 = u10.CenterWorldPosition
            local v29 = -u10.WorldSize.X / 2
            local v30 = -u10.WorldSize.Z / 2
            local v31 = v28 + Vector3.new(v29, 0, v30)
            local v32 = (p27.X - v31.X) / u10.WorldSize.X
            local v33 = math.clamp(v32, 0, 1)
            local v34 = (p27.Z - v31.Z) / u10.WorldSize.Z
            local v35 = math.clamp(v34, 0, 1)
            return UDim2.fromScale(v33, v35)
        end
        local v36 = {
            ["DisplayOrder"] = 20,
            ["ResetOnSpawn"] = false
        }
        local v37 = {}
        local _ = #v37
        local v38 = {
            ["BackgroundTransparency"] = 0.5,
            ["LayoutOrder"] = 1,
            ["BorderSizePixel"] = 0,
            ["Position"] = UDim2.fromScale(1, 0),
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0),
            ["Size"] = UDim2.fromOffset(u10.MinimapWidth, u10.MinimapWidth)
        }
        local v39 = { u3.createElement("UIStroke", {
                ["Thickness"] = 1,
                ["Transparency"] = 0.5,
                ["Color"] = Color3.fromRGB(255, 255, 255)
            }), (u3.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 10)
            })) }
        local v40 = u3.createElement
        local v41 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 155,
            ["Position"] = v14,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["BackgroundColor3"] = Color3.fromRGB(87, 209, 64),
            ["Size"] = UDim2.fromScale(0.2, 0.2)
        }
        local v42 = {
            ["PlayerPositionIndicatorImage"] = u3.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["Image"] = "rbxassetid://84853125356744",
                ["ImageTransparency"] = 0.1,
                ["ZIndex"] = 156,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["ImageColor3"] = Color3.fromRGB(87, 209, 64),
                ["Rotation"] = v16
            })
        }
        v39.PlayerPositionIndicator = v40("Frame", v41, v42)
        local v43 = #v39
        local v44
        if u10.TreasureModel == nil then
            v44 = false
        else
            local v45 = u3.createFragment
            local v46 = {}
            local v47 = u3.createElement
            local v48 = {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 150,
                ["Position"] = v18,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["BackgroundColor3"] = Color3.fromRGB(224, 209, 43),
                ["Size"] = UDim2.fromScale(0.1, 0.1)
            }
            local v49 = {
                ["TreasurePositionIndicatorImage"] = u3.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["ImageTransparency"] = 0.1,
                    ["ZIndex"] = 151,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Image"] = u9.X,
                    ["ImageColor3"] = Color3.fromRGB(255, 0, 0)
                })
            }
            v46.TreasureMapIndicator = v47("Frame", v48, v49)
            v44 = v45(v46)
        end
        if v44 then
            v39[v43 + 1] = v44
        end
        v37.Background = u3.createElement("Frame", v38, v39)
        return u3.createElement("ScreenGui", v36, v37)
    end)
}