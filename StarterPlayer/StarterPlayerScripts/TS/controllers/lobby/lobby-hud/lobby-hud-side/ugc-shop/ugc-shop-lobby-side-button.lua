local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.RunService
local u8 = v6.TweenService
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ugc", "ugc-meta").UgcMeta
return {
    ["UgcShopLobbySideButton"] = v5.new(u4)(function(u12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u4
            [3] = u3
            [4] = u7
            [5] = u8
            [6] = u10
            [7] = u2
            [8] = u9
        --]]
        local _ = p13.useState
        local v14 = p13.useEffect
        local v15 = u11[u12.UgcType]
        if not v15 then
            return u4.createFragment()
        end
        local u16 = u4.createRef()
        local u17 = u4.createRef()
        local u18 = u4.createRef()
        local u19 = u4.createRef()
        v14(function() --[[ Line: 24 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u17
                [3] = u3
                [4] = u7
            --]]
            local u20 = u16:getValue()
            local u21 = u17:getValue()
            if not (u20 and u21) then
                return nil
            end
            local u22 = u3.new()
            u22:GiveTask(u7.Heartbeat:Connect(function(p23) --[[ Line: 31 ]]
                --[[
                Upvalues:
                    [1] = u20
                    [2] = u21
                --]]
                local v24 = u20
                v24.Rotation = v24.Rotation + 10 * p23
                local v25 = u21
                v25.Rotation = v25.Rotation - 5 * p23
            end))
            return function() --[[ Line: 35 ]]
                --[[
                Upvalues:
                    [1] = u22
                --]]
                u22:DoCleaning()
            end
        end, {})
        v14(function() --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u19
                [3] = u3
                [4] = u8
            --]]
            local v26 = u18:getValue()
            local v27 = u19:getValue()
            if not (v26 and v27) then
                return nil
            end
            local u28 = u3.new()
            local u29 = u8:Create(v26, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                ["Rotation"] = 5,
                ["Size"] = UDim2.fromScale(1.1, 1.1),
                ["Position"] = UDim2.new(0.5, 0, 0.45, 0)
            })
            local u30 = u8:Create(v26, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                ["Rotation"] = 0,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Position"] = UDim2.fromScale(0.5, 0.5)
            })
            local u31 = u8:Create(v27, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                ["Rotation"] = 5,
                ["Size"] = UDim2.fromScale(0.77, 0.22)
            })
            local u32 = u8:Create(v27, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                ["Rotation"] = -10,
                ["Size"] = UDim2.fromScale(0.7, 0.2)
            })
            u28:GiveTask(v26.MouseEnter:Connect(function() --[[ Line: 64 ]]
                --[[
                Upvalues:
                    [1] = u29
                --]]
                u29:Play()
            end))
            u28:GiveTask(v26.MouseLeave:Connect(function() --[[ Line: 67 ]]
                --[[
                Upvalues:
                    [1] = u30
                --]]
                u30:Play()
            end))
            u28:GiveTask(v26.MouseEnter:Connect(function() --[[ Line: 70 ]]
                --[[
                Upvalues:
                    [1] = u31
                --]]
                u31:Play()
            end))
            u28:GiveTask(v26.MouseLeave:Connect(function() --[[ Line: 73 ]]
                --[[
                Upvalues:
                    [1] = u32
                --]]
                u32:Play()
            end))
            return function() --[[ Line: 76 ]]
                --[[
                Upvalues:
                    [1] = u28
                --]]
                u28:DoCleaning()
            end
        end, {})
        local v33 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }
        local v34 = { u4.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) }
        local v35 = #v34
        local v36 = {
            [u4.Ref] = u18,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            [u4.Event.Activated] = function() --[[ Line: 96 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u12
                --]]
                u10.Client:Get("PurchaseUGCRequest"):SendToServer({
                    ["ugcType"] = u12.UgcType
                })
            end,
            ["BackgroundTransparency"] = 1
        }
        local v37 = {}
        local _ = #v37
        local v38 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v39 = { u4.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 1,
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = v15.image.render
            }) }
        local v40 = #v39
        local v41
        if v15.image.stroke == nil then
            v41 = false
        else
            v41 = u4.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 0,
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = v15.image.stroke
            })
        end
        if v41 then
            v39[v40 + 1] = v41
        end
        v37.KitImagesContainer = u4.createElement(u2, v38, v39)
        v37.BackgroundEffectsContainer = u4.createElement(u2, {
            ["Size"] = UDim2.fromScale(1, 1)
        }, { u4.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 0,
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = u9.SOLID_BLURRED_CIRCLE
            }), u4.createElement("ImageLabel", {
                [u4.Ref] = u16,
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(1.5, 1.5),
                ["Image"] = u9.SOLID_BLURRED_12_POINT_STAR,
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 0
            }), u4.createElement("ImageLabel", {
                [u4.Ref] = u17,
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(1.5, 1.5),
                ["Image"] = u9.SOLID_BLURRED_7_POINT_STAR,
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 0
            }) })
        v37.TextContainer = u4.createElement("Frame", {
            [u4.Ref] = u19,
            ["Position"] = UDim2.fromScale(0.7, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.7, 0.2),
            ["Rotation"] = -10,
            ["BackgroundColor3"] = Color3.fromRGB(255, 55, 6)
        }, {
            u4.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.05, 0)
            }),
            u4.createElement("UIStroke", {
                ["Color"] = Color3.fromRGB(255, 179, 52)
            }),
            u4.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0.05, 0),
                ["PaddingRight"] = UDim.new(0.05, 0),
                ["PaddingBottom"] = UDim.new(0.05, 0),
                ["PaddingTop"] = UDim.new(0.05, 0)
            }),
            u4.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Text"] = v15.limited and "LIMITED" or "UGC",
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.FredokaOne).Family, Enum.FontWeight.Bold)
            })
        })
        v34[v35 + 1] = u4.createElement("ImageButton", v36, v37)
        return u4.createFragment({
            ["UgcShopLobbySideButton"] = u4.createElement(u2, v33, v34)
        })
    end)
}