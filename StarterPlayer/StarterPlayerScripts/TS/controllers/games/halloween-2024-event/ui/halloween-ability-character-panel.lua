local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["HalloweenAbilityCharacterPanel"] = v6.new(u5)(function(u12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u8
            [3] = u5
            [4] = u4
            [5] = u7
            [6] = u3
            [7] = u11
            [8] = u10
        --]]
        local v14 = p13.useState
        local v15 = p13.useEffect
        local v16 = u9[u12.bedwarsKit]
        local v17 = u12.bedwarsKit == u8.SORCERER
        local u18 = u5.createRef()
        local u19 = u5.createRef()
        local u20, u21 = v14(nil)
        local u22, u23 = v14(nil)
        local u24, u25 = v14(nil)
        local u26, u27 = v14(nil)
        if not u12.Selected then
            if u22 then
                u22:Play()
            end
            if u26 then
                u26:Play()
            end
        end
        v15(function() --[[ Line: 32 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u19
                [3] = u4
                [4] = u7
                [5] = u21
                [6] = u23
                [7] = u25
                [8] = u27
            --]]
            local u28 = u18:getValue()
            local v29 = u19:getValue()
            if not (u28 and v29) then
                return nil
            end
            task.delay(0.4, function() --[[ Line: 42 ]]
                --[[
                Upvalues:
                    [1] = u4
                --]]
                u4:playSound("rbxassetid://10969529817", {})
            end)
            local v30 = u7:Create(u28, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["ImageTransparency"] = 0.1
            })
            v30:Play()
            v30.Completed:Connect(function() --[[ Line: 49 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u28
                --]]
                u7:Create(u28, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                    ["ImageTransparency"] = 0.5
                }):Play()
            end)
            u7:Create(v29, TweenInfo.new(0.6000000000000001, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["BackgroundTransparency"] = 0.3
            }):Play()
            local v31 = u7:Create(u28, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["ImageTransparency"] = 0
            })
            local v32 = u7:Create(u28, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                ["ImageTransparency"] = 0.5
            })
            local v33 = u7:Create(v29, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["Size"] = UDim2.fromScale(0.27, 1.08)
            })
            local v34 = u7:Create(v29, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                ["Size"] = UDim2.fromScale(0.25, 1)
            })
            u21(v31)
            u23(v32)
            u25(v33)
            u27(v34)
        end, {})
        local v35 = u5.createFragment
        local v36 = {}
        local v37 = u12.bedwarsKit .. "CharacterPanel"
        local v38 = u5.createElement
        local v39 = "ImageButton"
        local v40 = {
            [u5.Ref] = u19,
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = u12.Position,
            ["Size"] = UDim2.fromScale(0.25, 1),
            ["BackgroundColor3"] = u3.BLACK,
            ["BackgroundTransparency"] = 1,
            [u5.Event.Activated] = function() --[[ Line: 84 ]]
                --[[
                Upvalues:
                    [1] = u12
                --]]
                u12.OnClick()
            end,
            [u5.Event.MouseEnter] = function() --[[ Line: 87 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u20
                    [3] = u24
                --]]
                if u12.Selected then
                    return nil
                end
                if u20 then
                    u20:Play()
                end
                if u24 then
                    u24:Play()
                end
            end,
            [u5.Event.MouseLeave] = function() --[[ Line: 98 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u22
                    [3] = u26
                --]]
                if u12.Selected then
                    return nil
                end
                if u22 then
                    u22:Play()
                end
                if u26 then
                    u26:Play()
                end
            end,
            ["ClipsDescendants"] = true,
            ["BorderSizePixel"] = 0
        }
        local v41 = {}
        local v42 = u5.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 8)
        })
        local v43 = u5.createElement
        local v44 = "ImageLabel"
        local v45 = {
            [u5.Ref] = u18,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Size"] = UDim2.fromScale(1.5, 1.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["BackgroundColor3"] = u11.backgroundPrimary,
            ["BorderSizePixel"] = 0
        }
        local v46
        if v17 then
            v46 = u10.DEATH_ADDER_FLIPPED
        else
            v46 = v16.renderImage
        end
        v45.Image = v46
        v45.BackgroundTransparency = 1
        v45.ScaleType = Enum.ScaleType.Crop
        v45.ImageTransparency = 1
        __set_list(v41, 1, {v42, v43(v44, v45)})
        v36[v37] = v38(v39, v40, v41)
        return v35(v36)
    end)
}